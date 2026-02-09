Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FE731B810
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622031; cv=none; b=jmn+UN0GRSd+jzIc12VxWVY4zKJZ+JV6uWClX15+aNI0qHY2sGXNejbzKQxdrQEJwQ2cx15gkM9eArTYLRkIuLXJlOkmo8anWy/WukbZwPbvwlqlILgRf2dTe2DKECvRubFBZpLDS2cP8f1sDPj/2YSlhKB4vrQdoS3z2o+4oPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622031; c=relaxed/simple;
	bh=bOVOcD/0Z9U+LQyMSv5SIr+eLchtYUt9XThVupwuffw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqlM1V2h0H2TzAf3xXbKyIQ2NRrZCoJmYp6RboLlNvCgcsBFAQRJ7LSA7g4icuQYXiqTIQj9koDCFWKWvmHuxJ0WqGAhHnLwdnX7/59zkKcD29naCPWiywM4UkqltszXY36c66QuA+W/rYt1pMdeEIaS0RQ8XjuzSdJo/9EUEio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ECk25B0K; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ECk25B0K"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436309f1ad7so1461851f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Feb 2026 23:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770622028; x=1771226828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zSRrUJVvFwAIEAMSQdvLDvax5R1ZcBfYM0Suiw+VTt4=;
        b=ECk25B0KJahoATOV21w74YUxdKPLVJitaJfukncKmKNIyhJCPrKKrespnWc/eAV23D
         RxqEG6ohwklAH7M7vxxzC0PXY7n9F6ARmNbnBX4LJiVI2NiKMHctQkR5FU6m3btEst97
         E+OV7WyiQDxVKpiKbh4xpIr5YK+azPrUPFfr6rS/ijcIfDyJDsGmCLCS1EvfTUVnBl9p
         e/2H7aQ4XBJv+ixcud2vcLXAW0yZogw6hYalfxTV1xebpbtggtXDbeVxOE8irQdn9cn8
         o/eD8Om0ObiLp/uc3jYMM7nmeRl/VmLsam0qBvklvx3h5qZv0Qg6giC6g+XofYe0Z5b0
         JTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622028; x=1771226828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSRrUJVvFwAIEAMSQdvLDvax5R1ZcBfYM0Suiw+VTt4=;
        b=RWIJr5Al79GjIhGaLM7HbzWT7g0enNZE834b0bJlI+mXypFvvmMm4TSgX5MS4geiNL
         DKFlG5ybwgTVHUdeKsFW0e5BbzPaWDfgWa6kKeoOyZSx1RmJ0wAhDofC0ETMnx0v5t/k
         wah0CMu/ku2QOfLcHTmGOlVxSXFK+L7l4ISCbbmpooYLN5wqvv156OXD5DT+SrA/KnrD
         3fOmSzDHx63RSpBuYI4IrOQKySNRcsIIQfAK/6SOF9fyugMr3VFxvS8nIYEsC5rrPR1w
         6U3+rtRIVzYASm8HRKdgtKQa8Bv3XzSY136gAb2AIlZ3kKrqYvI4DaABCqE9qCykW7l5
         9IFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZj0Ics9xj6jAUl076b+XCKPj3A2XRY3BeWr4BWHD9TQgsEOyTrPeLa8ybyGMd9rFG6DRDKJ5A+sFcq5Wg@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+IBla+6djid42boY/lMNsYrPjjGCJhAvdezQhRold69/Ql+n
	hFIciz79oQ+qHgOmjsWOp/XeXjoUY7kv5a4gU8vZgSVvdWHkXkuPKjznSwTUWYipiVI=
X-Gm-Gg: AZuq6aLxOyedVK2HlViHZTAJa3w9DRihTdPlLQo0BTer8XZVneqDLkR7pSyzkgfd99x
	rNhFwDTNr/XPASFdVyM2xd47XmLb3DH6XEdD3CaMb4YSL65DBB/Mggfj8mJZ+XIGLZ0AqhRPN+X
	R5ZJ5woj+rQ7s+lP2vNfbDfrU5YSn15RBV/cFdFiQbr/plQcfDyfETO9rBBG0071vNFVSbtR4Ox
	l/uvZzUT+rj57ck4BuawMHnQigd46MsrxiiZvCFwxU1GDV84DRhTWPMcHzdAP8GI7wlIYqrndwS
	l/ECxxNOvvntuVGsOTTtfniq89VjZ+Yrzn3xESUfuqddZycfghgARNLGoS5G52gro6ggyoAf550
	y8WUAYGS/QUOMBlytIgu5PGNiIzl4saumL404xTmxDVyAXaZWEbwqwD6eH3qgB/3EjA5cVc0jLq
	Boi3SQ8l3CJubJc9Us
X-Received: by 2002:a05:6000:1ace:b0:435:b068:d3c4 with SMTP id ffacd0b85a97d-43629380e94mr16340688f8f.33.1770622028402;
        Sun, 08 Feb 2026 23:27:08 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4376686130csm12499489f8f.1.2026.02.08.23.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:27:07 -0800 (PST)
Date: Mon, 9 Feb 2026 08:27:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Helge Deller <deller@gmx.de>, oe-kbuild-all@lists.linux.dev, 
	Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <aYmLysU_q3C-xLfk@monoceros>
References: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
 <202602091447.3HeLynhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3b4rsyg56sd3635q"
Content-Disposition: inline
In-Reply-To: <202602091447.3HeLynhy-lkp@intel.com>


--3b4rsyg56sd3635q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
MIME-Version: 1.0

Hello,

On Mon, Feb 09, 2026 at 02:30:13PM +0800, kernel test robot wrote:
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on 0636e6205beed850d985276dc56fd73d785bea5c]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/f=
bdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260209=
-015956
> base:   0636e6205beed850d985276dc56fd73d785bea5c
> patch link:    https://lore.kernel.org/r/67b7aa0157b9cf5de111ab6b2725d207=
ec98aae9.1770572936.git.u.kleine-koenig%40baylibre.com
> patch subject: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on =
non-mips platforms
> config: csky-allmodconfig (https://download.01.org/0day-ci/archive/202602=
09/202602091447.3HeLynhy-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260209/202602091447.3HeLynhy-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602091447.3HeLynhy-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_d=
rv_remove':
>    au1100fb.c:(.text+0x21c): undefined reference to `unregister_framebuff=
er'
> >> csky-linux-ld: au1100fb.c:(.text+0x224): undefined reference to `fb_de=
alloc_cmap'
>    csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_f=
b_mmap':
>    au1100fb.c:(.text+0x2bc): undefined reference to `unregister_framebuff=
er'
>    csky-linux-ld: au1100fb.c:(.text+0x2c0): undefined reference to `fb_de=
alloc_cmap'
>    csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_d=
rv_probe':
>    au1100fb.c:(.text+0x540): undefined reference to `fb_get_options'
> >> csky-linux-ld: au1100fb.c:(.text+0x6e4): undefined reference to `fb_ge=
t_options'
> >> csky-linux-ld: au1100fb.c:(.text+0x7bc): undefined reference to `fb_al=
loc_cmap'
> >> csky-linux-ld: au1100fb.c:(.text+0x7d8): undefined reference to `regis=
ter_framebuffer'
>    csky-linux-ld: au1100fb.c:(.text+0x818): undefined reference to `fb_de=
alloc_cmap'
>    csky-linux-ld: au1100fb.c:(.text+0x850): undefined reference to `fb_al=
loc_cmap'
>    csky-linux-ld: au1100fb.c:(.text+0x860): undefined reference to `regis=
ter_framebuffer'
>    csky-linux-ld: au1100fb.c:(.text+0x874): undefined reference to `fb_de=
alloc_cmap'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0xc): undefined=
 reference to `fb_io_read'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x10): undefine=
d reference to `fb_io_write'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x2c): undefine=
d reference to `cfb_fillrect'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x30): undefine=
d reference to `cfb_copyarea'
> >> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x34): undefine=
d reference to `cfb_imageblit'

The problem is that we have CONFIG_FB_AU1100=3Dy but only CONFIG_FB=3Dm in
that config. I thought a bool depending on a tristate implies the latter
to be =3Dy, it seems I'm wrong and FB_AU1100 needs to depend on (FB =3D y).

Best regards
Uwe

--3b4rsyg56sd3635q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmJjEcACgkQj4D7WH0S
/k4A4Af/UeLSYJO6+3KwCZ0PksM2aIcAZXk4qDEAkK2FWzmYyRF1wwg/pVbsy6gD
zrJMdbR2BUYwtDBx7OwEMPNA8e/Z1R+K9ngc7YqtEyI8MJGOP/rQ5AvkY5Gqizu6
ZrAkZOoPdxff3W2cJKJZYAFKx4UXqqFZsXDm0wwh7rmQT2hSdgT7vAhYUE4KYBBn
tbez40Tu2R3lBAwTsIbE7N03EYCt9OOnfQOXo+cT+yCsMSHwLLUd6deR/XWmdcQ7
KJMhosrUr4aG+iWgN6//cLG8ruknQqDM+khJRnIrRWdUXoUG9Ns+rUGEg8twntGv
E6X42zEK5WiKyrAltnYqEq2/jGj5aw==
=283N
-----END PGP SIGNATURE-----

--3b4rsyg56sd3635q--
