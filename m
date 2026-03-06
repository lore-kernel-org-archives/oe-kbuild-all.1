Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E037754C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786238; cv=none; b=QAWvMlod6E00jUKxj73kMV75k7hkDeeQCZTYw+XRRcNr7hdq0AO9QqST3qiiDA+LDEsyev3Dabi6RAB2EbNVfI4esXFDOGPVeRpV6QBJsSbelGzo+NLHFRcbSijd6fySyFBor4BjqxdfaaRljGHmY7j5sRDzTM9DkiGHzL7+wuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786238; c=relaxed/simple;
	bh=6iL29lHLpawoDDAwsuGhHK/c5jjyxj1wEjZNdAgIQo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqyLYY3WG+AQj3LvcFy0QMzsZBCfkjBUwM/SCu/rGRRXs4Wz3zigfJ47Mwvx/4iT4Wn1li1vjWJJcsoB3CUoEIibLnVrZC6xKyQCWABiCC01YMxWmNg4qo6mPRBbuQLHxyomPT1Xb21SRu7y+4HuI+LyEQQ+smHGkEAbhEwhOKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R1kDvkC+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R1kDvkC+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso6049467f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Mar 2026 00:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772786235; x=1773391035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62dZrTgwm+OSat4rUYW9M/0fzDBKLE6f1m9K7F7lSxg=;
        b=R1kDvkC+0kROJ5v74McCQgT7cVlDv6qISh/JrdoHuv/sqk3t3hcvT1WMkxtyX1KEpu
         JRWikbObCR7NOmTStyW7FoWZh97vSTxig5y6dvxRWs5FyLzxhz3i3PrbqRUWTi4J7WAY
         1H1gPhSh5Jv8TUxN7lRqHvuIs64Ia1wN3w6UJjwN/lbyqgSYspMJiTXJt9G7g6zEmj81
         3ybWxiUE7ohBuR4mwUUfUR9JxjQmkKaWLwM6T1n6H0+rhVWeL8a9QWbXXFkuFCcFYI1l
         rT3hOsDjtZ1yf/dHLyW/PvGChmxTgtGi2rxK0o2e+7mP9AtVQF5pFllxf+jZqBI7MKFy
         s2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786235; x=1773391035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62dZrTgwm+OSat4rUYW9M/0fzDBKLE6f1m9K7F7lSxg=;
        b=wFiZ2pFdWuXKy3U8gFt8mG4Z47OKUXEa53+zF4nvZ+D+jcxrjrvakY2vMimyw76gNt
         H0RhiTacWuThjLTjWIAl9OAsYAZTCBTBY4n/f7Fp7JLfUog9v06iz9w6XSL0tR9qmOd6
         XjXzaRSHlnidIt5Ut+f0M5kRyfJcfsr2MbPa4063b2iAzn2Hyx36rg7RZlObWyVIvnKp
         3qv9qUIt5byDLjEUBbi8XMCiLYXYwrqXsmh4t0NU0mw/7CFUeO7ZW7tHm3lEUuDehM73
         CTjhLYwH/CUGsjRoLT+itfxWvGCcJL5lQ1D4KcUbK39PxT440QhgRkXWEaDC7HEUasC6
         UwTg==
X-Forwarded-Encrypted: i=1; AJvYcCUBrfyXelMIxEQhPVjzrGBBCb1pVgj2vHu75zFiwT6Swn5GpoZxCyDR5iUET5TNuGKIps20jrXVIyBL31zf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkbtzu1dk0K72EQ+igFfDAHJxqge3UcXjcbFK7qryGjxViOcF7
	DdaJa4uOgOSFIn6WISW2XsYbBmrV+0cjdKcYjC/3GBtMtMMKVNMA2zlyN+ZddsSFga8=
X-Gm-Gg: ATEYQzxxugwzDHtIpj/zBqlA5aIuEkAcn35Fir78iQ8IVTAISYHz1ksPckjlsMzHF2R
	deVD8GV5KvGy6eSSq3/qG3Mk08Jxe6+g7czrQQ/qveaNrS+iCwMPbUIgMnLmgbC6GGzfjZseCcR
	1acVRF+eFIZYtKa1OXTKxn3jrgF+g2eKgdH2AacEdkNAaCp95CeHnWgZi+sOPs1ZEYkNcFgA7hI
	4fZxzx01625LD4x8ClQIV/CL+SZUDgG+FIUwQ4IAMi9AeaEwq89zr6/PS+0WZJ3IsccsAeGcV+R
	Kaqlcp5/FM22a0OEK44N6zcTbWRSJ45boucisaL6949+OUmVR0GyeoduOZ3pu9r6iZ4Dz7kZLHw
	ZX2UX/cCf1N1ene0/2m3zfQ48yYNytsiPD6r0pqWOihhpQCSflGP+56Y62XlNyth6yuiYoIQUpi
	E50jSLQRjklI0d5bGsXYg3m7K7SyqMdx0laVIZx0e/MOT9tnUAcuWxjwftUIW4Jvmf7Tsb7j7eB
	qC+FDd9t+tkS4w=
X-Received: by 2002:a05:6000:24c9:b0:439:cc06:e134 with SMTP id ffacd0b85a97d-439da6632bcmr1983491f8f.24.1772786234689;
        Fri, 06 Mar 2026 00:37:14 -0800 (PST)
Received: from localhost (p200300f65f20eb04c45ea6a5666f449e.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:c45e:a6a5:666f:449e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439dae36785sm2379176f8f.27.2026.03.06.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:37:14 -0800 (PST)
Date: Fri, 6 Mar 2026 09:37:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>, Helge Deller <deller@kernel.org>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
Message-ID: <aaqOcs4CFMt1wiXo@monoceros>
References: <202603042127.PT6LuKqi-lkp@intel.com>
 <aah4opTMZeDDfWFG@carbonx1>
 <aak3k24kjfD55xNQ@monoceros>
 <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>
 <CAMuHMdWKnP2W2mZuX_aWipOzCSjkJqA_0cRv1ALcjvgm-r=FZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tdaf2uejambeo73"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWKnP2W2mZuX_aWipOzCSjkJqA_0cRv1ALcjvgm-r=FZw@mail.gmail.com>


--3tdaf2uejambeo73
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
MIME-Version: 1.0

Hello Geert,

On Fri, Mar 06, 2026 at 08:57:27AM +0100, Geert Uytterhoeven wrote:
> On Thu, 5 Mar 2026 at 09:58, Helge Deller <deller@gmx.de> wrote:
> > On 3/5/26 09:07, Uwe Kleine-K=F6nig wrote:
> > > On Wed, Mar 04, 2026 at 07:23:30PM +0100, Helge Deller wrote:
> > >> -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
> > >> +#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !defi=
ned(CONFIG_64BIT))
> > >
> > > The condition is equivalent to
> > >
> > >       defined(CONFIG_COMPILE_TEST) && (!defined(CONFIG_MIPS) || defin=
ed(CONFIG_64BIT))
> > >
> > > which is logically a bit easier, but I'm unsure if it's easier to
> > > understand (IMHO both are bad).
> >
> > Yes, both are bad. I changed it to your proposal.
>=20
> Yes, I had to read it twice, but that applies to both :-(
>=20
> What about "#ifndef KSEG1ADDR" instead, or would that be considered
> too dangerous?  <asm/addrspace.h> is included by MIPS' <asm/io.h>
>  so it should always be included if the I/O accessors are available.

Just to state the (maybe?) obvious: With the more complicated expression
it is asserted that the build breaks if on mips32 the definition
disappears e.g. because arch/mips/include/asm/addrspace.h isn't included
implicitly any more or the macro is renamed to unify with mips64's
CKSEG1ADDR. With just `#ifndef KSEG1ADDR` the driver would break without
the compiler noticing and put it's fbdata somewhere in the address
space.

I guess it's subjective, but my preference would be to keep
the more complicated expression (despite being complicated).

An alternative would be:

diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devbo=
ards/db1000.c
index 6984cd5169b5..1958ad0e02a8 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -98,8 +98,8 @@ int __init db1500_pci_setup(void)
=20
 static struct resource au1100_lcd_resources[] =3D {
 	[0] =3D {
-		.start	=3D AU1100_LCD_PHYS_ADDR,
-		.end	=3D AU1100_LCD_PHYS_ADDR + 0x800 - 1,
+		.start	=3D KSEG1ADDR(AU1100_LCD_PHYS_ADDR),
+		.end	=3D KSEG1ADDR(AU1100_LCD_PHYS_ADDR + 0x800 - 1),
 		.flags	=3D IORESOURCE_MEM,
 	},
 	[1] =3D {
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 1a04154bc535..70b96e9ea454 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -380,11 +380,6 @@ static struct au1100fb_panel known_lcd_panels[] =3D
 #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
 #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
=20
-#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
-/* This is only defined to be able to compile this driver on non-mips plat=
forms */
-#define KSEG1ADDR(x) (x)
-#endif
-
 #define DRIVER_NAME "au1100fb"
 #define DRIVER_DESC "LCD controller driver for AU1100 processors"
=20
@@ -764,7 +759,7 @@ static int au1100fb_drv_probe(struct platform_device *d=
ev)
 		return -EBUSY;
 	}
=20
-	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_sta=
rt);
+	fbdev->regs =3D (struct au1100fb_regs*)fbdev->info.fix.mmio_start;
=20
 	pr_devel("Register memory map at %p", fbdev->regs);
 	pr_devel("phys=3D0x%08x, size=3D%zu", fbdev->regs_phys, fbdev->regs_len);


Best regards
Uwe

--3tdaf2uejambeo73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmqkioACgkQj4D7WH0S
/k6QHwf9Hn/SNFu4AOILvFRq5FQtX/fr/OSuaEAd2CB5QSFqZIljoRmz3r7MSOSZ
PIU3e/PVQznjhSRALr0mEAEzSAr8LMsyVwvNICYBw+dPwwUZETdTs0Ye7W/IesW2
Mr7+CK2lFzHd6nKMgf4TDNBslteonfSChu2wcec3EZWWfRaH0pQdtukjeEgqEflT
ZDcnUGyvejSrbrtQIHMq1aIi6knUoJh2+oahlZjKd9rNLmuC+8A0qP/k3UXvy2SN
Mfqmy3A/z16CXMMumY0lt7U/e8dl5vmzzPRZd5Mmv6wFqZuE+I2gzJD6kDV+ILtu
5PT156YiMfmZJ7pCvgKjbz1QFMyedA==
=pXYo
-----END PGP SIGNATURE-----

--3tdaf2uejambeo73--
