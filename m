Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8A41C2FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743867; cv=none; b=cEsRtpYgQzQWI8/C0qzGXEMkZAhiJMz6EH4gTbrBluWjneKRV+urk70C9oB2OwLmHVbBOS3aslLmG3IdVWM5eYbVYc+MWL8ZqwpegiiP2NnwEqcw2fkB4Q0/OT1u/ucneGZDTo+stSJ/GebDrk0s8mkuyo9/zZ6E3J2Ij9ZDqU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743867; c=relaxed/simple;
	bh=n1JqKqOwuq4Dzkck551zhTIbDvpaotav/AJ1qAKf8P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGMz/e9kx4XnWp/k3+bi88S3+GANnigTOEgk87zh4buXfCypnY3+wBsgFbnI4gUhmA4UROHd4A/KbkhhHsWZPibk2j+Ep0wc+zet0v7nxCPxX7nUqEwpS89BSYVzihGrx1x9VxjUTJgFUNeXvqTL9ezo9LRuWKc2jE5qk6/TtYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PuAhwEdD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PuAhwEdD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4924593f45dso44713325e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782743864; x=1783348664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FeXBGy176cFN84dJdcRO45X2SBQ38mc+G9bZJW7pdz4=;
        b=PuAhwEdD7e2en9o9pqhowaiAzIL7MfYliwUIJlXkYPKzTRoCZ4FN3PYtdTpNaTT2e/
         LPEQgq3SVWCiFnP5nhLToH+I+8TMOgtqkjZQw4YDHIh/q1TmZ9+nhHVmuL7ID0uWjYQb
         AVtC7GRHExY97fPtUMgabHn7gFa06VCPCcW7RCSXWr/GP4L/jSretERhJVgKdWRlS20o
         OQN9eIJzBI90CXMqsb7ZbDrQ+l00YSma2o6B3tTkAGSo8PTjss91LE/ZGNIhmg/CI8YR
         Ur86HXbqPtIIQ091lpRlkruMj+FmnMk863gYX3DHjbNUqaMp0F2fNz10qEeLaOy+FRx3
         88Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743864; x=1783348664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeXBGy176cFN84dJdcRO45X2SBQ38mc+G9bZJW7pdz4=;
        b=abhgWhjS7XU7WOytIi1j7vNAVmj6Yxj5iqMwJdbrfSjN0aoP8E2oqvOoKNYbmT766Z
         4nG+D5z2BSxKPukVs9S+XwLGg/KtKGLBplUxUfsg47lSnBuusBDMMO0t9DuznaoKb1go
         443Si1w6AhDdsKi2Fi6L3k1Oy+u2VWd1nGaOZi9fMbYUhUiQHWY5A0ilDK5pYEM4M5Le
         VzJszvylODl1ohYCCXN+xCOObLc/xgdBw26NkPZ8X9n2b2tSN1UyWvkjSTsNYh14Iknh
         StDv7oJSFmRKuLJPQi1SMXsOtLM1nS1oSBl8LpvHz2bytBEUsKzWDfYusZFp1vB39lTf
         JOfg==
X-Gm-Message-State: AOJu0YzsZRihFwHg9PeXCT08Q924x6GYyKNV3e6bUqc2MbVqPZw5gWfp
	v0iSh4g9TA4y6FMfxOAlWI5GgoZTI8QDQrA3uD4bA50wdmcAIrIij08VkX3WFlH5B2I=
X-Gm-Gg: AfdE7clq3ME0RFDc0lHZtbe3J55iJNTDPC34Pt0AQ1hhk4OxzxJa5JVq72Vq8PWofLH
	bDgYkn18gzDXDnETUigII/PZik2k8Ksh/gttmQqyz6KExWY2zR2FcFBzS/wRibcyb2XCp2EclsK
	q5UuvNhJI4K0CB+tH1rbn01p29rqeSkU9MsgbNsvJomtZzQbU0hQZQSPgAV89Wb+XbxccJRwgZB
	lSra4WSwlVmCnTVnho0aHNC1BmDhCDHQIgfFsN5fgQE6++l9irFV7+OaZH6KNG954jrKigzmNFn
	XlVM2aUK9TU5HPcHFJtWqdwJQ1AcvfVlprp74V5VnFbxFAJKz4MVFB8RdRYz+DYcO6rYM9P9E4W
	L3z8fAv9YNshGIkKcUJWzYYc07z+UvMcA03RPtxSZHssiO41RekxbUu4aZO0sDhIocj/Qo8WUr7
	r5e1rJ7RtIyAWjztYoDguIlTJDV2n2fIoXp+6MsYYsO9eBKfPu+LlA6NPTjaSLuK/ppMpeplY5l
	glApBrGqW+c1qo=
X-Received: by 2002:a05:600c:8a0a:20b0:492:4c2e:9610 with SMTP id 5b1f17b1804b1-4926684a979mr189232635e9.11.1782743863676;
        Mon, 29 Jun 2026 07:37:43 -0700 (PDT)
Received: from localhost (p200300f65f47db04294e5bd34a12a699.dip0.t-ipconnect.de. [2003:f6:5f47:db04:294e:5bd3:4a12:a699])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fc0d36sm499519515e9.2.2026.06.29.07.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:37:42 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:37:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [ukleinek:device-id-rework 15/16]
 arch/parisc/include/asm/ptrace.h:45:13: error: implicit declaration of
 function 'unlikely'
Message-ID: <akKAwtnil7iHonp8@monoceros>
References: <202606291931.RraFVSbi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aqduz2sqytfpaivf"
Content-Disposition: inline
In-Reply-To: <202606291931.RraFVSbi-lkp@intel.com>


--aqduz2sqytfpaivf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [ukleinek:device-id-rework 15/16]
 arch/parisc/include/asm/ptrace.h:45:13: error: implicit declaration of
 function 'unlikely'
MIME-Version: 1.0

Hello,

On Mon, Jun 29, 2026 at 07:31:55PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.gi=
t device-id-rework
> head:   6285120b1fe1c6ceecd5a128677a5d9fb6da40dc
> commit: 1a0bca71ef19173549e5865b2509eafeb7587ebf [15/16] Replace <linux/m=
od_devicetable.h> by more specific <linux/device-id/*.h> (headers)
> config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/2026=
0629/202606291931.RraFVSbi-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260629/202606291931.RraFVSbi-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606291931.RraFVSbi-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from arch/parisc/include/asm/processor.h:20,
>                     from include/linux/sched.h:13,
>                     from arch/parisc/kernel/asm-offsets.c:19:
>    arch/parisc/include/asm/ptrace.h: In function 'regs_get_register':
> >> arch/parisc/include/asm/ptrace.h:45:13: error: implicit declaration of=
 function 'unlikely' [-Wimplicit-function-declaration]
>       45 |         if (unlikely(offset > MAX_REG_OFFSET))
>          |             ^~~~~~~~
>    make[3]: *** [scripts/Makefile.build:184: arch/parisc/kernel/asm-offse=
ts.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1405: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

I added a new patch to my series:

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/commit/?=
h=3Ddevice-id-rework&id=3D29d6b8c50b1ace81f79e44c6a276dceee5297546

I won't resent just now, but in the assumption that the build bots will
find some more issues, wait a bit to reduce the number of patch
submissions.

Best regards
Uwe

--aqduz2sqytfpaivf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpCgzAACgkQj4D7WH0S
/k5Ymgf/c5OMd+xF5TJ9jlqHPFhn357z1RhhBSSR3jWde0MDtxFB25yQ0v4fZfWB
OqR2ighNlgCh+2S8Q7R/QUQlMPU45xrT3QZMfrzoOtolJA3AnZgU7sxLcN055upq
ZL0OZl1ExOa7UjV0c6OvKSunb3QEh5/pVXfd8I3Calwmn1q/SNRcoi7KuLMqEs6W
I5QlvoBoCKQ2oTAA7tUhtTCAGQkDuSj+SenKvyuk1bUppCG7H3cc6KXBMu9ofDHH
HXh19UAklz8wlhg0X/XY1sEv/UxdadjvBn0mhbzTrXODKCebdv0QZ7sByIkzIg5B
M3g1JRdSEuoNk4oFnndK0//briYX4Q==
=XTwr
-----END PGP SIGNATURE-----

--aqduz2sqytfpaivf--
