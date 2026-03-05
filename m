Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A40366552
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698077; cv=none; b=TQ9+9Oeg6ITNGaov6rlopCgQMhBDUFHTeyYuqBecWCRe2Fl4L1Ipfa7NEf14HSx934oCAcVPmNW1WHkGBOHGeGxeaxI9CabP6efjk8ORHxpUW5KVPvNVfo32xk2Xt3z625Q4wKT/Y9IiI26WP5YTfzWlsaydpuJ8SHY+Hg7/DTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698077; c=relaxed/simple;
	bh=MEN4t6jJ7e2OHmB5U6p2JOmY/bDl8ADWl53m94Mp7pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbi3UnU9wlfzK+Q/jdb6p6gmF6N4ZgC6rfab6JLI6KMU7Ir2BGk4hPeiGJrn+MyVjgERTZRNs/L8TFh/JV1hSHwyv5lgi/MZxL5GhL2f5KcLOwlPuNC2T8CUpjv5OF+Qg4PNZ7KcsGdHg5aUH/MgDkwaz7woA8fsFp0vdgqvnHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zO2VY2S4; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zO2VY2S4"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4837907f535so69680415e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 00:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772698071; x=1773302871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpywyGgnXVMi7zDh09DftParmGasnoIPMVnYCXsoHgQ=;
        b=zO2VY2S4qWImLAtnHYKMP7nGr0MDxP0948YvZ/V5s2xJepVur50Y4Bhpm/CFtH7eMn
         xtfm6u7glPMI2kwlV7ATnAwG0Y3DvPfLPmq3vALFpLIerMoNEeujsTckfbnuZlHAaX+U
         hWT1DN32C1BP3xLm1Tha4Nd89wKC7UQy+AoKQA0yWXTrTYIXQtz4PqdL4h9BUKyKEIef
         H92s94HfIRBY4PU8b0JgL1zdlr6k0BoRbtNlXWnCOI/jf6j3iYqw2lhPD612c5CMYfQV
         E7JrwEAydZQUsv0DbvHh6ZlbJdgP9uDQtQfPlCYUMGSrc/0uXyIx/5jw/hXiKEKnq36y
         CKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772698071; x=1773302871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpywyGgnXVMi7zDh09DftParmGasnoIPMVnYCXsoHgQ=;
        b=qqZtmmGRkqW8b9wRZ3DZS/gmGp+5Oi4MIpUsa16kNLZvPXw2owlClRUNnDdD5dcGEr
         qOBdg/xn+9Qeb8MtnsnxQySSF21+QsO04mVGPtItJsfDal+iV58AVGktMAmfGXTm0c/T
         jRdhycMI511yTAkUbZ60gwvGzohvTUEOtNRCmz0lsp4q3FWM0XozBm83X6LhSnkiX1gC
         6oLATwxWnrpRmsuhNs+DLK9cbOD9Pbqw1LzrgNk3KvhVqvaPREmQeYmLi2NzYWLz/hOX
         2CoYPMHzi/wP82WuuLydn6MjW3WFzuF1rXDfG9QWK1FScRxzjhUMaog6lCCU+nDK8lyK
         vtwA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5+mzPdtU+2G3SE/F0Dd3GbUwrjmfh2Kh+20ytwuNPFww5uf5QaiSr1dfk8Xdg28XI07YCtLBj33QzXyP@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/5UxLDTPiyUj0NhkzU3WMvwok/oCZ+SSZIZCkFbVeIUmTGroV
	VyQjyGQDP2jF45xQrDEQcb1uxw59fX1GwLWe5Zzsttabt/bOzn43SMK1CprZBYW18Rg=
X-Gm-Gg: ATEYQzz1FJdV6kPxRf4Qk7PJmrW4DmmZ/bvuJ93NQb5xE74fukM/nAKTtH4OpOKTy9M
	v+P14ty5yaB+X+GFcWSvRSw8QeRs2JeeORt5JydQVHc7CkePMBSbI+kCCup5khTkSDen/pWuiHW
	Te6E5JztmMdOSDOHXcwDtGA+4Cydsi9nukaeibgsZt0Jfms36cnH/EQgtECWD2mWRfX0q/PbZzb
	QV4pVJaBX8De7mxcofO2/xEyCeqV0LrY1xE39vjxCaFxfcmFIfZv0BmwX4ijCUl228/yPue51jD
	ueLhiGM2ZoTXIqkri8y6zS16B07egeRhpXozpVkLyUM59qymBKWcetf3JvIpw+oU41APMnTlj1n
	qcrKKyOc1BU39W5tArZ3D63ma+YRp+jJhdtDQWXCoKAqClW1VmjXRrIKjpKBPseQChvpFFQ5ftW
	v6ancJwVL/3AIBcEFYkHeUmZ6d/Pw0vyj8/aDxNETeACN1nsETQz6+ZX/lV4eVae/BN44KuKEB+
	gmajgxaCe4S9co=
X-Received: by 2002:a05:600c:8105:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-48519837ec2mr74771565e9.12.1772698071201;
        Thu, 05 Mar 2026 00:07:51 -0800 (PST)
Received: from localhost (p200300f65f20eb044d629f1ad692a1c8.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:4d62:9f1a:d692:a1c8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4851fae475csm23291195e9.8.2026.03.05.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:07:50 -0800 (PST)
Date: Thu, 5 Mar 2026 09:07:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
Message-ID: <aak3k24kjfD55xNQ@monoceros>
References: <202603042127.PT6LuKqi-lkp@intel.com>
 <aah4opTMZeDDfWFG@carbonx1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sx7nivqyo7vfvdjy"
Content-Disposition: inline
In-Reply-To: <aah4opTMZeDDfWFG@carbonx1>


--sx7nivqyo7vfvdjy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
MIME-Version: 1.0

Hello,

On Wed, Mar 04, 2026 at 07:23:30PM +0100, Helge Deller wrote:
> * kernel test robot <lkp@intel.com>:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
> > commit: 6f366e86481a7503a821de82930df517dddd4047 fbdev: au1100fb: Make =
driver compilable on non-mips platforms
> > date:   13 days ago
> > config: mips-randconfig-r052-20260304 (https://download.01.org/0day-ci/=
archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/config)
> > compiler: mips64-linux-gcc (GCC) 14.3.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260304/202603042127.PT6LuKqi-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-l=
kp@intel.com/
> >=20
> > All error/warnings (new ones prefixed by >>):
> >=20
> >    drivers/video/fbdev/au1100fb.c: In function 'au1100fb_drv_probe':
> > >> drivers/video/fbdev/au1100fb.c:448:46: error: implicit declaration o=
f function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-function-dec=
laration]
> >      448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbd=
ev->info.fix.mmio_start);
> >          |                                              ^~~~~~~~~
> >          |                                              CKSEG1ADDR
> > >> drivers/video/fbdev/au1100fb.c:448:23: warning: cast to pointer from=
 integer of different size [-Wint-to-pointer-cast]
> >      448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbd=
ev->info.fix.mmio_start);
> >          |                       ^
>=20
> I've pushed the patch below into the fbdev git tree.
> It should (hopefully) fix the issue.
>=20
> Helge
>=20
>=20
> From: Helge Deller <deller@gmx.de>
> Subject: [PATCH] fbdev: au1100fb: Fix build on MIPS64
>=20
> Fix an error reported by the kernel test robot:
>  au1100fb.c: error: implicit declaration of function 'KSEG1ADDR'; did you=
 mean 'CKSEG1ADDR'?
>=20
> The header asm/mach-au1x00/au1000.h is unused apart from pulling in
> <linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Then
> the only platform specific part in the driver is the usage of the KSEG1AD=
DR
> macro, which for the non-mips case can be stubbed.

This paragraph is copied from 6f366e86481a and doesn't make sense here.
I'd write something like:

	arch/mips/include/asm/addrspace.h defines KSEG1ADDR only for 32 bit
	configurations. So provide its compile-test stub also for 64bit
	mips builds.
=09
>=20
> Fixes: 6f366e86481a ("fbdev: au1100fb: Make driver compilable on non-mips=
 platforms")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-lkp@i=
ntel.com/
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100f=
b.c
> index 1a04154bc535..3b104d377d28 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -380,7 +380,7 @@ static struct au1100fb_panel known_lcd_panels[] =3D
>  #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
>  #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
> =20
> -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
> +#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !defined(C=
ONFIG_64BIT))

The condition is equivalent to

	defined(CONFIG_COMPILE_TEST) && (!defined(CONFIG_MIPS) || defined(CONFIG_6=
4BIT))

which is logically a bit easier, but I'm unsure if it's easier to
understand (IMHO both are bad).

>  /* This is only defined to be able to compile this driver on non-mips pl=
atforms */

Maybe adapt the comment here, too? Something like:

	/*
	 * KSEG1ADDR() is defined in arch/mips/include/asm/addrspace.h
	 * for 32 bit configurations. Provide a stub for compile testing
	 * on other platforms.
	 */

>  #define KSEG1ADDR(x) (x)
>  #endif

Best regards
Uwe

--sx7nivqyo7vfvdjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmpOdIACgkQj4D7WH0S
/k4M1QgAnufkIZRtUdQ4cmY1U5fdSOJSlsuzq0bUmxZjNlGMF8GgZFMN1EdBFR10
klcTxwCWs+LilgolbuNUKBDT6l2kxCHIAxO8IuVrCT7CfgRk1ej0LBZOcWTvoqyv
CLuu8IAp01kelaAg58eCPeFgRvDMsTk7UuakLB5NVJr/7B/P5WAExYp+6PlDdHnn
bz+BRg8aKAl61TItvo7K+aw01dozKrIEG+0UgWw/AcPjHsAqMD3Oq7SvvC176cDt
wHGpLYgtYaMDHXd/z3XuPTe5VnQr9rC/WGLWXiFxLbSgJgWOGTpEVyO3N8aJWnM4
bS96m5AwqBd4I2VZJGCTobMy8Cf37g==
=cM5A
-----END PGP SIGNATURE-----

--sx7nivqyo7vfvdjy--
