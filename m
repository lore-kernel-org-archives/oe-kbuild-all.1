Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873682D193C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 05:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554618; cv=none; b=iU7MAATiNIyyeEany2LjnXPimLRd4eW4enEoFV9EZT7yd7w6DFP+b48dh5AiUozeGM+qaug6rlAh1ExIvoZQ5zxESNwj4ZZWPLd+5EbOcOCxISZnzrw73gRHcQhCakZb+xnHUr4R9GqtLreJf+LCTcolSPG9pffrrJgzU+cl4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554618; c=relaxed/simple;
	bh=SrbTHiwlQ3zQvO7rsHJIABnLkdZwe0slGMCCEsZZz1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3MSTcZQkWuHsl8yT6jM51ef7NLXGsNV25bJDCAxzAklmaciSjBnIe5XHr3DRJ28XKNumJxKDn8mQs7v25EYuX5zYiDIljI3bUrUkmZn0w7SmH6jlwFXcxHNgOnVcpLzWw9Ao6w2vZ2oMXiHRvM0v68aQnKP5lDJYBdwFGLzIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QVslDucr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QVslDucr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477770019e4so47242985e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 21:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766554614; x=1767159414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4XiabVmtN8w9aQUAU8NAZ4+wOLrzIF9ipv8p+UKSlo=;
        b=QVslDucr7mP0EahIk7buQZzzc6bS5hUxAbmxEADkUkQFefkjTCpAqL45PwXPmMML6T
         fuEO9BgB5FzxYUCjJurmHto1W9PnMJMzIOcdg2/l5wE8FuHSHGoZOliPIUetRDIby8m5
         2r+pdNcxxqM4NgxzNFHigXY6ezoo9p7h3YGS/Xn2D8jRxVj/2ujWPIIFvmnjSORnwfUU
         4xXjUspl16ZpvJSkKWVO+E/GLg50ydw1FFAXXtSCEFtjUWVgCDWc0ati/WnWwl0jRNdU
         TG+PcwbDCstatdL4n4TUk3t1au1IanRDsHawK6aP3uMN7DuRqQgJsEib1VH8hNOt4JuF
         NWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766554614; x=1767159414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4XiabVmtN8w9aQUAU8NAZ4+wOLrzIF9ipv8p+UKSlo=;
        b=smk/w8YblGLELt2+6VuXpEFMuM1RnFgINwvCz0METvw9rdWeCCbaByzmd2AizRfD2s
         kgsJ44lrLFOMRlhB84LxcQNJEtpn8cuqbKNujituhNBwMVGM9DYn35ER2XTETwSp1/ob
         3ggSYQ7+AuHM5iUdls0fLLwxPs+hhv5pEJkxjd+i5k9Mueu9dXAgxOigcg2kk3LCvPPO
         by+x4Zxyhtte7qjK+Mled5r2ZnhlRXTPVWKEYHFV1vwB+qkB3UwWVeNCznvPXhVyKlhX
         oKOKkOeMvoDUWE/tyacog7YwpxB/Vczp8At20B0YmJJif6ieaRrM66ZLqpQDlJAXpj1z
         sv6w==
X-Gm-Message-State: AOJu0YwTzt0HnceOasF3z9L2l8p0Beq1+K4fctcPs1/K6QhrkSxt0p8A
	FP/v+5RPv2ttRtS6zPLFhoptrpX64nEKHoZGRbV9uth+gR+oTUIK4QQXsYi+E244NIMKSkkxkx4
	/lFDe
X-Gm-Gg: AY/fxX7wT9Q2XkWBAIveMUD3z+WPirbGKU1NFKa0+BKxVXa23MKJ3eTNVx0OB/Sak4S
	XR67ujA2uhlvdC1btQGDkSCkAPmLfXgzlB95gQoKaPSKNVTIts4iQcL6jNr9OUdwM4q/5SIR/tX
	7GqJdoaozZy88pF7q5G7+1R9EkuYZqEDJbOTwqlznJVe4YvfoWjwVb0HlUvuvCTwkFwadevYwxr
	laBEW8fN50LDmKcP++RcplzMzpYOkdPKssChqBMDGJ7tlc2xl1qjWfQajb0JMOKeml3g0/KgHEx
	etdO2M5HQhnv941kLYAcV3yddL/QTgXW5slNdzRxLcIdtrwZkDvvUYGUKlEKGIZ3OnQ1Uy5wwem
	3117VrAwPEAuBOWLLCivT2Ttqqfdb7Mx5ylFEySoxmnEGu/753/jYZxH2e4ycD6SA/buVz1BYbW
	yspedD2WYjDIqa0Nq7+gw/0xCZZSDhKIi9fAtAh8OxU13UZfL3wV5KcNfAqSo=
X-Google-Smtp-Source: AGHT+IHoMnb5GY/CZY/KN7jeZGZJJ8bfDntLsKAp701OsVn6GQy4RK819T6W561jOh9p97Ao43oseA==
X-Received: by 2002:a05:600c:470e:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-47d19549856mr172818935e9.9.1766554613192;
        Tue, 23 Dec 2025 21:36:53 -0800 (PST)
Received: from localhost (ip-185-104-138-126.ptr.icomera.net. [185.104.138.126])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4324ea1ae12sm30434593f8f.6.2025.12.23.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 21:36:51 -0800 (PST)
Date: Wed, 24 Dec 2025 06:36:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: Re: [vkoul-soundwire:next 4/7] sound/soc/codecs/sdw-mockup.c:267:19:
 error: initialization of 'void (*)(struct sdw_slave *)' from incompatible
 pointer type 'int (*)(struct sdw_slave *)'
Message-ID: <hzuwse7ovqy2ryanp7tgwatjzkupjmm7rp5c77cxo6yk7utdxn@q2dpaps3sbrs>
References: <202512240724.TNfvVd4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uo6mnwcq7wx72r76"
Content-Disposition: inline
In-Reply-To: <202512240724.TNfvVd4w-lkp@intel.com>


--uo6mnwcq7wx72r76
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [vkoul-soundwire:next 4/7] sound/soc/codecs/sdw-mockup.c:267:19:
 error: initialization of 'void (*)(struct sdw_slave *)' from incompatible
 pointer type 'int (*)(struct sdw_slave *)'
MIME-Version: 1.0

Hello,

On Wed, Dec 24, 2025 at 07:26:11AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.g=
it next
> head:   c6f1e99ab03c5a94ed6389f5930e91f274b3ba67
> commit: 478f3890709a092a97a0218f61af19ac9b725573 [4/7] soundwire: Make re=
move function return no value
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/2025122=
4/202512240724.TNfvVd4w-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251224/202512240724.TNfvVd4w-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512240724.TNfvVd4w-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> sound/soc/codecs/sdw-mockup.c:267:19: error: initialization of 'void (=
*)(struct sdw_slave *)' from incompatible pointer type 'int (*)(struct sdw_=
slave *)' [-Wincompatible-pointer-types]
>      267 |         .remove =3D sdw_mockup_sdw_remove,
>          |                   ^~~~~~~~~~~~~~~~~~~~~
>    sound/soc/codecs/sdw-mockup.c:267:19: note: (near initialization for '=
sdw_mockup_sdw_driver.remove')
>    sound/soc/codecs/sdw-mockup.c:240:12: note: 'sdw_mockup_sdw_remove' de=
clared here
>      240 | static int sdw_mockup_sdw_remove(struct sdw_slave *slave)
>          |            ^~~~~~~~~~~~~~~~~~~~~
>=20

This issue is fixed by commit 81acbdc51bbb ("ASoC: sdw-mockup: Drop dummy r=
emove function")
that is Mark Brown's sound.git
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
for-next).

Best regards
Uwe

--uo6mnwcq7wx72r76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlLe+sACgkQj4D7WH0S
/k5fBQf+J+q19Q6b7hffuutvkF2ndRGChwXUM6Az8LTQwcR9MHGF2q7VVULMumLI
esWgerXk3qEMXCUJ/fA3m5j9J4g69i366e4S6ZOXEbrOHpQ1BHkoY9isxt/fkiZa
8qV5vljD+2AL0I0swfykxbQN1MdeE9B0rGtQxUwAOhYHB+rbsv8zrGlH41uXAeyl
adTPKVYeZKedemt9fBr+NHHGTvjX5VKaSewKmfIg9DXlXCjdMsd3ZgAcl/r/c+QW
bDjqquXNiQZpxhSDAevhFwMxAyJlICDBV+1+j0nMVLtPfE/xPiOXCEscBQbv5ZE6
K8OKMEOnTFebUkr+hN9T9/WrBfykZQ==
=h4+X
-----END PGP SIGNATURE-----

--uo6mnwcq7wx72r76--
