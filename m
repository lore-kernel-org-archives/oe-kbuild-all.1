Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA617B50A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728251; cv=none; b=aP7rUgmD+gHkt6oBsEwRpvUXugi/9eEsLp5mnN1piM0+fC/69l5gF5uk3twaWJgPrNT3zmhKLVC4PDCb7V1BXSRVHXuUI5haADqwy/+0jdyvMS4YlkTX7TfV00u69PO6sa8nhbKC5O5T4pnE6xg4uecGQoGCMi+eC5jbctZIR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728251; c=relaxed/simple;
	bh=Jj5jf+rN0Jgq1wnZ1221vZG7gvCfoAzGJxGkRGCmPr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=no4V5I+qtHfYTwQGPULxQHxj2C+vgVWd5nY5tz1mmCRo5+pNQC5wSyqFXtbzFnr4ky/jRo8aMf2uXuBEYnuM4zQ7/IRJPbsAcfU3fINDdsLhzzysK+23G9moJkT63Zn2kYfWbSjfr7MNv1K7wv0hYauwU0Wpl+bJ6HA62wWemsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VxdJ5fMr; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VxdJ5fMr"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-439b78b638eso4960677f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 08:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772728246; x=1773333046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wecMzxUhSry0xK7CAZ67a+eo784PL38etV6eDTIVF8U=;
        b=VxdJ5fMr268FwqACM0HUeOn7TJwEJoNZsXzRkIjRkuG8m483Vg+k0SQ9PSyn0pkR+1
         r48a/NsWg/OudLweVZKSBpW3orozxpxTGZONFfH6dZ9KKRUrBRCNAkhvtMNR4UkdXrrf
         HKGi9RuUg8RbVoqbTL4DwGZxTY25uSjb4uAtHVncv+x5a2Ci5KF1eZjPe2ccxZg1HPy7
         Lf4ue3cEkC7pQGnJWxYR6rrxqhPqKjQKwrtQlYeimGj63asLJRCMexEY95a73PFoCmGm
         KJVNSlRrQYtfNQpDLrqjJSAPleO53YeYgr5yRNKuXmlspWlY0TqnuORSBGipfuAuHJ5v
         uxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728246; x=1773333046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wecMzxUhSry0xK7CAZ67a+eo784PL38etV6eDTIVF8U=;
        b=G9vBL/ygC8Y7T9ujT2ALLw/qNcNuvvjDz9w5KYGaCvyAcQn8XUdg2AU3QhkkuZznt2
         +18pcR/NN3QcHnUOomES3HI5dlZb6bTAesaLpKxhtW+UAZvSAAnzKI1Ce6GcQrEZwN+v
         jcES39bHFDKos1CK/j+ISD/cwzgnSdZni26tU7f2FrnpSKnEY6qmHR4H7GB1llp8sdyP
         jBjY6HWXAf+h/XLEjy4KAqzc99jSUYDhVSkZOEFs1zuN2BLSnvI1soiT+wWr6joLOwG0
         UDoaK2zNXJrzukRK8disLajWbzHy30Kz56U9tagNIcFrV5j8simutQ38gbI4fZeppwSR
         sinw==
X-Forwarded-Encrypted: i=1; AJvYcCXaAcwYSvYAls3rzECqwBpAbcHyN1PWyNP8+t1OxPTFJn5Vt94sTd3ALHyyBiD+/t9MdTmdhPXA+ChnU/1B@lists.linux.dev
X-Gm-Message-State: AOJu0YycGAyASSlSSsoE127uRDuSpFMAWSwq6+2pcKdaM1oL6Uw5dPSe
	YnI8YgRTFfMKS5fplQgjjTDk9B1sBkCNK6+70GsR0jH2xnNts1fWySStQfTC85Swep63gpDIPFC
	3w8Z4pNKjIg==
X-Gm-Gg: ATEYQzx9eKWzIOE7LupteeV58ZcnLkLApsyhsTebIeZFRpdIy+8MFMd+Mhd6x23B1LC
	mKsbYcayNwt8zQHLHPwMH9RjNbgfHlJmhHm5pARmWNzNI2KWwca8OF8E8kk+9PuGqGvpaTKzRMn
	/XaPbgAl6Z5RtUU09p5K4F+rl2G/d2DI5om4xbvPEZtUDJK4tA7p9x1iviOf1xVEPpV0QdS4s4v
	Mi2to0/yN9bznCZs5r4QHqR9fn/rpBYBBHF2YkxYMnOzgl88gbWQEQGINr7IQGtUNd1xVHTVz4K
	JtjgZcV+FDE1/7jaAOAmgg1X69ZD46cqe0f4/F9c4MvZFoPxiJx9oFOq7Z/4FBqNsfQneyMGNNY
	QJDOmxxX6PJhg4Q4onRIpC6helMUTYss56/2UzRYP4FEj9w223jwC4FD46YoHO6n/iXDTMWgd7i
	+MLgN5U26bl307in9Y7JBfzGk5VJQOiuXl0W/pwXJNWYUM1eQ4egB6Ae/T1OZ1iiCHY3O5WXM54
	xEDLi411iq9Y8o=
X-Received: by 2002:a05:6000:2c10:b0:439:b1c3:84bc with SMTP id ffacd0b85a97d-439c7f6501cmr11965699f8f.7.1772728246180;
        Thu, 05 Mar 2026 08:30:46 -0800 (PST)
Received: from localhost (p200300f65f20eb04a10d5fdc728271aa.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:a10d:5fdc:7282:71aa])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439bb69e098sm25537393f8f.9.2026.03.05.08.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:30:45 -0800 (PST)
Date: Thu, 5 Mar 2026 17:30:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Helge Deller <deller@kernel.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
Message-ID: <aamvTDsdQWWVfsR-@monoceros>
References: <202603042127.PT6LuKqi-lkp@intel.com>
 <aah4opTMZeDDfWFG@carbonx1>
 <aak3k24kjfD55xNQ@monoceros>
 <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yo2bgx5vsettjtxq"
Content-Disposition: inline
In-Reply-To: <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>


--yo2bgx5vsettjtxq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
MIME-Version: 1.0

On Thu, Mar 05, 2026 at 09:57:29AM +0100, Helge Deller wrote:
> Hi Uwe,
>=20
> On 3/5/26 09:07, Uwe Kleine-K=F6nig wrote:
> > On Wed, Mar 04, 2026 at 07:23:30PM +0100, Helge Deller wrote:
> > > * kernel test robot <lkp@intel.com>:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
> > > > commit: 6f366e86481a7503a821de82930df517dddd4047 fbdev: au1100fb: M=
ake driver compilable on non-mips platforms
> > > > date:   13 days ago
> > > > config: mips-randconfig-r052-20260304 (https://download.01.org/0day=
-ci/archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/config)
> > > > compiler: mips64-linux-gcc (GCC) 14.3.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/reproduce)
> > > >=20
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuK=
qi-lkp@intel.com/
> > > >=20
> > > > All error/warnings (new ones prefixed by >>):
> > > >=20
> > > >     drivers/video/fbdev/au1100fb.c: In function 'au1100fb_drv_probe=
':
> > > > > > drivers/video/fbdev/au1100fb.c:448:46: error: implicit declarat=
ion of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-functio=
n-declaration]
> > > >       448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADD=
R(fbdev->info.fix.mmio_start);
> > > >           |                                              ^~~~~~~~~
> > > >           |                                              CKSEG1ADDR
> > > > > > drivers/video/fbdev/au1100fb.c:448:23: warning: cast to pointer=
 from integer of different size [-Wint-to-pointer-cast]
> > > >       448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADD=
R(fbdev->info.fix.mmio_start);
> > > >           |                       ^
> > >=20
> > > I've pushed the patch below into the fbdev git tree.
> > > It should (hopefully) fix the issue.
> > >=20
> > > Helge
> > >=20
> > >=20
> > > From: Helge Deller <deller@gmx.de>
> > > Subject: [PATCH] fbdev: au1100fb: Fix build on MIPS64
> > >=20
> > > Fix an error reported by the kernel test robot:
> > >   au1100fb.c: error: implicit declaration of function 'KSEG1ADDR'; di=
d you mean 'CKSEG1ADDR'?
> > >=20
> > > The header asm/mach-au1x00/au1000.h is unused apart from pulling in
> > > <linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Th=
en
> > > the only platform specific part in the driver is the usage of the KSE=
G1ADDR
> > > macro, which for the non-mips case can be stubbed.
> >=20
> > This paragraph is copied from 6f366e86481a and doesn't make sense here.
>=20
> Yes, I noticed that later and removed it already.
>=20
> > I'd write something like:
> >=20
> > 	arch/mips/include/asm/addrspace.h defines KSEG1ADDR only for 32 bit
> > 	configurations. So provide its compile-test stub also for 64bit
> > 	mips builds.
>=20
> Ok, added.
>=20
> > > Fixes: 6f366e86481a ("fbdev: au1100fb: Make driver compilable on non-=
mips platforms")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-l=
kp@intel.com/
> > > Signed-off-by: Helge Deller <deller@gmx.de>
> > > Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > >=20
> > > diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1=
100fb.c
> > > index 1a04154bc535..3b104d377d28 100644
> > > --- a/drivers/video/fbdev/au1100fb.c
> > > +++ b/drivers/video/fbdev/au1100fb.c
> > > @@ -380,7 +380,7 @@ static struct au1100fb_panel known_lcd_panels[] =
=3D
> > >   #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
> > >   #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CC=
O)
> > > -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
> > > +#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !defin=
ed(CONFIG_64BIT))
> >=20
> > The condition is equivalent to
> >=20
> > 	defined(CONFIG_COMPILE_TEST) && (!defined(CONFIG_MIPS) || defined(CONF=
IG_64BIT))
> >=20
> > which is logically a bit easier, but I'm unsure if it's easier to
> > understand (IMHO both are bad).
>=20
> Yes, both are bad. I changed it to your proposal.
> > >   /* This is only defined to be able to compile this driver on non-mi=
ps platforms */
> >=20
> > Maybe adapt the comment here, too? Something like:
> >=20
> > 	/*
> > 	 * KSEG1ADDR() is defined in arch/mips/include/asm/addrspace.h
> > 	 * for 32 bit configurations. Provide a stub for compile testing
> > 	 * on other platforms.
> > 	 */
>=20
> done.
>=20
> I've updated the patch in the fbdev git tree, which you can find here:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/lo=
g/?h=3Dfor-next
>=20
> I'll keep the patch a few days in there and will push next week.

https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/comm=
it/?h=3Dfor-next&id=3D93bf32c3d571a9e160306659cef096fe4f79a7f0
looks good to me, feel free to replace the Cc: for my by an

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

=2E And let me note that "fbdev: au1100fb: Make driver compilable on
non-mips platforms" is very accurate :-D.

Best regards
Uwe

--yo2bgx5vsettjtxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmpr7EACgkQj4D7WH0S
/k4sOQf/b3H264Z6fTdkQ/zRLaCAPsWHccANfwe/Gi3b3K3khgUp0/UICFFBlCUe
JbmZIdy4dpsTh0vB1rIbsVek+cZI5jKePPaRTYYdUjx+9rqd9h+A85cHuvxaqYb0
6LrsTd/6dvDNPdRwU+o0WWPcGsdRgZj/R58Z1zax5+f6n8nLiq/QSwwHUmV+qSMY
o5Nmdx5cDhnTxKxm+g7EK1nuhZx4dAmy8KXUe3R+joNOtVhKhxnkt6/Zn6vXTpFs
Ng3J8CS9JEHYPJvb5Dy9wWfYO9xpckzpZxb9aFTGtUeH/v4UhKpkgvDzRl8fU60D
8wMeC66Tf2c/8i+CaiJAAn8if6yzEQ==
=TEf1
-----END PGP SIGNATURE-----

--yo2bgx5vsettjtxq--
