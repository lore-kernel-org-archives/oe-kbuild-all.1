Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BDD17E8E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659366; cv=none; b=qpdUjE4vWSzf7fC8dDYpng9ZYdXq5PM5arP4cgGP9oU4X5gtDGBUb4EHEMa/qXNX10ny0xoTXYlr0T2Vu8zb7nGCkGv0sQ3AFu6fg15GAQGF5U8t34IyS7U7wPqJNsH9hz6kPZLJIaSwkQXyaDP0JZPi1uONORduZqx/5by+nd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659366; c=relaxed/simple;
	bh=zHVYXB450M8pYZnAT3fwB6+GEpn8KPPbdNnFoszl7Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfPGW0rfpiz3YkS1Z9WmISBnQ0+l8NR/z9oGqAJ/W7yKoB89XABtXKiLp8xKi2Ij/qM3KqPzDIo21msIswaxDid/EwHsGmcEdjHUdNYucC+sra/TbMhT33gl4+HHLaW3KEVhXfbY+AoJw7xulqHDG50HWQkQg/1U4CvEV9mJekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=avIs1M9O; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="avIs1M9O"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so905963a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Apr 2025 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743659361; x=1744264161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kF6GnuhQwkj4e4OFmH55Lp2juz44CuLm35OxDe/96Bo=;
        b=avIs1M9OpUkRpqYJ7bB2m9X3tHzNnqhUGFiuNxEwb/rYRCezqyZ5vG9UXE85B4c44r
         gL8dU8Wg665d5dcQkSsCktk33kKBxQMBLZJerH7dtnpQiRHjPVERvxgkrxtYTZj44EG8
         pOWQNSeAra8HM3bzg8Y4LM6Awd5+nGd0EZz9cccQouHUw8npOU/04pi74icFGuFYIF4b
         5t/48VnQ+zyHNZusJzf0unWq6fF6IK+r6/iGnXkYa5SciQemL55+c6r12Nd4IpHsgy/y
         kmX1ocyGaRhrmS7h0NpntqVVkvd0RgkmVvCrwarKkiuQEt7VSFf8ROZZ9Tdebvpri697
         SrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659361; x=1744264161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF6GnuhQwkj4e4OFmH55Lp2juz44CuLm35OxDe/96Bo=;
        b=hTVS0ap8o0QCqcdzJ+xL1yhOzKu5TK4vhlZ4plZF5IE6mjoHCQq73o+8DJ5eBWPLxa
         McX3dQiLfqPRgdu+4HZYH0hkfILk6Llc3CZjFuXQpVpbtcNq5QfePyBy5LOXNjEuk87L
         W0RIb4A4y32xvC62aERTF1TvlYkkuLJG/HgXCqKSeYoKHQbWvGxpiaT9xrYvq6JMi1v+
         sGuNiBSQ2jFBne8ni19Kfmux6JgOyLh9ebRL1JnVrBCtPjGdcRdC25IAf6nQVIVayFlp
         WD3AsjEAbUdN3Oukg+ia0dvfQTY/R8tRk915Nj/J2sv3a8rJMQwKvfobgvQ5fM06R/Xm
         yimg==
X-Gm-Message-State: AOJu0YzH8CK+s/RB9daB59DLSg+VuyfbenxtMqvPJaMyg5WIacxl7Onu
	N1ZP6iRyZdurx8i8tGxUzYzfppSkIvSD2povhiVe+HMFZelHuqubffDKNv9rWSGbKzOMIJx+CD+
	O
X-Gm-Gg: ASbGncvHsfq2CZ0dV62GPpW7BV3e7WS/jAg+0enQ3h3tAPmDi/XRXy7zIiODETIuKBn
	btJ+fB7V5aMFHZX7eo5E9LzzCt3D4IU3a0KoP5+X2NgKm5pr8odsUKUobNFx+dys/rFJHCAhgIr
	PwYuAvdRzgh996z/0GB6eBz5FTSEvzfEmIFRCdfNo3iyWDuUDDNRHhFO7zDT09TGyjQiKYZS1DE
	p8hWH6AoppUO5n3smVkxKZWDh+lcIwKYmoBo0dnGPcYFg5q9WB0A/Jx/tByyu1woznLngIxcBAE
	5w6PVFtS4OUh0y1kSFc1QO4cNNcP2lhphVA6wGPsq1egVWONsw==
X-Google-Smtp-Source: AGHT+IHDvRu8DGWGTg9GmpFUA6spbj+eahfPYfvjW0CVff+f7PnNCgE2sj39v4TgXzPdcG/JF5sc7Q==
X-Received: by 2002:a17:907:6d17:b0:ac3:b4ac:54a1 with SMTP id a640c23a62f3a-ac7bc0ce418mr89151066b.22.1743659360750;
        Wed, 02 Apr 2025 22:49:20 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfea0eadsm37864566b.67.2025.04.02.22.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:49:20 -0700 (PDT)
Date: Thu, 3 Apr 2025 07:49:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [ukleinek:pwm/for-next 17/18] drivers/pwm/pwm-rcar.c:114:19:
 error: implicit declaration of function 'FIELD_MAX'
Message-ID: <pipogdbxgi2qf7dmtfwelrpt2jkoeqly4gb7ydwmrlzugorkld@eoisqvpzuot7>
References: <202504031354.VJtxScP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3igeefmnoydiemo"
Content-Disposition: inline
In-Reply-To: <202504031354.VJtxScP5-lkp@intel.com>


--h3igeefmnoydiemo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [ukleinek:pwm/for-next 17/18] drivers/pwm/pwm-rcar.c:114:19:
 error: implicit declaration of function 'FIELD_MAX'
MIME-Version: 1.0

Hello,

On Thu, Apr 03, 2025 at 01:30:12PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.gi=
t pwm/for-next
> head:   4fe924e43a5aabe586ab696651c483c25a8a3abb
> commit: edd549f4956be84ebd6a3900975544adeb0f3b50 [17/18] pwm: rcar: Impro=
ve register calculation
> config: arc-randconfig-002-20250403 (https://download.01.org/0day-ci/arch=
ive/20250403/202504031354.VJtxScP5-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250403/202504031354.VJtxScP5-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504031354.VJtxScP5-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/pwm/pwm-rcar.c: In function 'rcar_pwm_set_counter':
> >> drivers/pwm/pwm-rcar.c:114:19: error: implicit declaration of function=
 'FIELD_MAX' [-Werror=3Dimplicit-function-declaration]
>      114 |         if (tmp > FIELD_MAX(RCAR_PWMCNT_CYC0_MASK))
>          |                   ^~~~~~~~~
> >> drivers/pwm/pwm-rcar.c:117:15: error: implicit declaration of function=
 'FIELD_PREP' [-Werror=3Dimplicit-function-declaration]
>      117 |         cyc =3D FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, tmp);
>          |               ^~~~~~~~~~
>    cc1: some warnings being treated as errors

Thanks, I added an explicit #include <linux/bitfield.h> to the driver to
address this. This isn't needed on ARCH=3Darm because somewhere in the
#include jungle (here: arch/arm/include/asm/ptrace.h) this header is
pulled in..

Best regards
Uwe

--h3igeefmnoydiemo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfuIVsACgkQj4D7WH0S
/k7drwf/dTOuCV8NjU+y2OHcf9bDAt1NhfLOfrQRa7vqWT+YkfQJwzF7Jvm50Ccc
GmGej+Jwp/QwoIV45F5X5JSuHX9EnZuq2GsIWWa8L+y7eQ/x6SGmUBtwOpGUHSvh
upBQZKk29BE+/fcyXO5jC7tvU7L1qMDC25qRlfVHMJiDcJHkfjLqWDhm8OqzimLU
J3jxaAy0yXOShKlVsQ6xbtBR3h+0Ni0AENvQs5jEjuyd3FtClHm1XRCoM9lnX7DJ
ZSTbvfiqfiNt59IbjGwB43DnknKJNmB0qtd9iOyfFWO/eP2dHbTNSiS3Zv2beyh0
sgkva3W/WktruS8UvCK/QIQPtfcjCA==
=Yc8P
-----END PGP SIGNATURE-----

--h3igeefmnoydiemo--
