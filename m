Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B4E40D562
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033220; cv=none; b=py/Qs03UspSkguRq4YqJEzKeLVL5DYZqBKUDozEhk7zJGTRO94/0yPt73cokoWl+nH71Zsb/PaqBy8xiAnrg4vp22tDDbSLY8BgH9YXwcvKkEG2PPjp50e3Y+Rd02DhLR4W4BoY0+njjnzj5u+TlH/XI+13gKEpCYrNL2v88fko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033220; c=relaxed/simple;
	bh=at7pMmhuzq9OeV/wAbJYnU9cHuxHHF/mSBys7+8ZjQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9nguX5W9SF67n6n4vMNwReil05M8X3eGlGQcx78p7LqcfetaZwHahINKrO9cObPXvgwRfIQeuBiztiwijxgziJPHbg1rT3Xuhr7SZAnjq5tqzOBvnok8fhDg0bUqEF8bzVmWbZPqPxIf4sYzIgMaRLbnEmcF5PYzTmoHUTPWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DQ5Ch/Qv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DQ5Ch/Qv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so4064941f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Jun 2026 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781033217; x=1781638017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkjqgSWa8d4HIUMb8SQZmjwdvQtGmrcZttLiFNLNPgk=;
        b=DQ5Ch/Qv8gFz1oHeV4hHlc34uhnS1vkMxzoDPbpsFx04eOZc2nrrH+7cYGjuHzQM0b
         +IVXM6cB6q1D5SCMUDHMhQtmKyTJ9dEtB9nEKhcYCU5hwt4Fku1wcULhcn9vESL5IHQj
         y0qGBsOftxvalePktxC6WqzMoi7Rfp8ktC95PK9yKjp/kk4d5HNUaLzwxCvbuOnUUEzh
         j7mG+sX43GGm8CLgFmCZqQnJ9HJcZfz7K8Lsxq4yFeLruHRK+ywtvQXfnYrasvQRLr4m
         StBRBqQs3TNE+v4ZBIuEVR/tXhFd9pMgB6myiwWgT4JBgywVRGgqD+gJEVB5Annr1zG7
         9umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033217; x=1781638017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkjqgSWa8d4HIUMb8SQZmjwdvQtGmrcZttLiFNLNPgk=;
        b=sNXfBcPKDyf2rkTokUDArXZUJ6NmUGRfrLrGuffXRDsBp2DI9CTaZ4k3hutHDKEhNd
         hgeCgotAvOMjhGgdUlsW4wkPvDxVEjMD/gLgR5eb0FbyVKtcYMK5JDjJgBYmQjgh7J2Z
         D21Xqm1X6NR70t5aULFxX+zHW7UmdjPxXcj8fMGt2Kx1yO+FoPBqdrPv5GlPDZbgZGDV
         0e0aylz2QM0OQKS6dypzXaS8y5fFWzcMo5pRWo3THTp12lekE+jCnaBaKrKvqcECdf9E
         fZDI4R9CY7OaeN4akm8OdjD4ECFk61SWgqfEOrQbqGh/wWpQb7u7VP7Ua0eTAg9tI93E
         L3Qw==
X-Gm-Message-State: AOJu0Yzb/ot6p4fwlbJW+W3+PwbGDXuPAPr/U254cOXP7IbpT+q1aRFu
	cpHvkwzly3PCnbtZqbwc1lyPSgSxXiQ+eWMqX8cH1oM3LecgMBBK3H92UC6e1p0f+Pg=
X-Gm-Gg: Acq92OH5UEI6yuKeLb4BD5kIa3/cQ+3h4FkNg4VVhheqHZzCDNW2o93tO9rmlWPowBP
	1jfTBmQ9PX+jd9tANRmnmXkgQGi5mbrPx33IKhJEU62knz+xQ/6Oj3m/Z8ftPLbj4G0H6e6j9sr
	C5LDiDQKtq2PWy6SVvXhq6P6qQy8iMvHiPX3lFFLVTUlH/+hOzbh2AegbHSvaqkeZLeYqXbqKXG
	gF9u2MHs95Z7CMsiaCQjiZTF4+L0PflPdB9QX9l+WcyY988F9irugPcifw7Tq52Dsww6GcdDnRf
	Za2Fp3Bl5QN9y2ocTgVRVxMfWSLOpOf5xgzy8iSOJ5yP4cbQeFvAHNP9hvXs1RYCNxSlBuukmyM
	CJdotYqxFNFfOwfFp5ArG22+UKYvP3p/WUcc2by3xPv1NdyCbnFRMhkr2CShenHCzygjv2GSlAa
	9ciWMxUqT4VoKQFRraY4aAQndEghqpHcbBd19HqTs=
X-Received: by 2002:a5d:430e:0:b0:452:6aaf:76cb with SMTP id ffacd0b85a97d-460304ee10cmr24700044f8f.1.1781033216798;
        Tue, 09 Jun 2026 12:26:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f34413csm63792928f8f.21.2026.06.09.12.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:26:55 -0700 (PDT)
Date: Tue, 9 Jun 2026 21:26:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: Re: [deller-fbdev:fbdev-7.0-2 4/7]
 drivers/video/fbdev/au1100fb.c:448:39: error: call to undeclared function
 'KSEG1ADDR'; ISO C99 and later do not support implicit function declarations
Message-ID: <aihoh79KdDxH0fsI@monoceros>
References: <202606100206.xNHV4qAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbgnxyw4duoqprja"
Content-Disposition: inline
In-Reply-To: <202606100206.xNHV4qAm-lkp@intel.com>


--fbgnxyw4duoqprja
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [deller-fbdev:fbdev-7.0-2 4/7]
 drivers/video/fbdev/au1100fb.c:448:39: error: call to undeclared function
 'KSEG1ADDR'; ISO C99 and later do not support implicit function declarations
MIME-Version: 1.0

On Wed, Jun 10, 2026 at 03:06:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbde=
v.git fbdev-7.0-2
> head:   0f967cb8ea04486953f85b249b42dda3de842053
> commit: 6f366e86481a7503a821de82930df517dddd4047 [4/7] fbdev: au1100fb: M=
ake driver compilable on non-mips platforms
> config: mips-randconfig-r054-20260609 (https://download.01.org/0day-ci/ar=
chive/20260610/202606100206.xNHV4qAm-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7=
917772d7d61384696c61102c08c2ea158e610fa)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260610/202606100206.xNHV4qAm-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606100206.xNHV4qAm-lkp=
@intel.com/
>=20
> All error/warnings (new ones prefixed by >>):
>=20
> >> drivers/video/fbdev/au1100fb.c:448:39: error: call to undeclared funct=
ion 'KSEG1ADDR'; ISO C99 and later do not support implicit function declara=
tions [-Wimplicit-function-declaration]
>      448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev=
->info.fix.mmio_start);
>          |                                              ^
> >> drivers/video/fbdev/au1100fb.c:448:16: warning: cast to 'struct au1100=
fb_regs *' from smaller integer type 'int' [-Wint-to-pointer-cast]
>      448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev=
->info.fix.mmio_start);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
>    1 warning and 1 error generated.

This is an old bug that was fixed in commit e31a374a99f5 ("fbdev:
au1100fb: Fix build on MIPS64").

Best regards
Uwe

--fbgnxyw4duoqprja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmooaPwACgkQj4D7WH0S
/k7PGgf9Gxi7x8NaDtzc0TJQEtDThVxqvMWjVxHsR3cYGSOf1PWyVhLLOCiX+x9W
rLEy53qTOoN9VxsK7hvmqAMd1QUl9ESW9xnxYmWWF7TTpn94U9X1yT45wD0HWcQ7
DrK2fM7S/p2ZOX4D/XMDvIK+xfE+P7R2A6hcXC61VVCvjElkqZHbi4+WOcSiyxbg
JSptU4TTcuhj0cashZAWwdJnN7UaDvtDh/T1a0QxiZ033K7ZeSLX6NxjX0gZ7k+k
WkwHr7pVI4eGGz76JyF8IJuVlxja/2qiCe0MSvo+L4WJdxL8SU5Ogm075hUab9nR
TFSaAw7jbraDUP8u4oKGHmY3YdK/Rg==
=ZZ1M
-----END PGP SIGNATURE-----

--fbgnxyw4duoqprja--
