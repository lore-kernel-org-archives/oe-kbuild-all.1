Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695912DA757
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005554; cv=none; b=nYVtkeIeBgmmWViEynSzEYmyZSAaxKuU3qO0Tk23ojdfmA4pdkJHZTXza6VtWfMsagsJ4kKSi59Taz7QTKwPdCN1tSLRRKFgUwQbwaZujN77BvO1RPIHOnGmaIGZQ9M1zb6HdBErJsSyVohsFzzGI7MnSE4ibyp0LXWmZqB8pD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005554; c=relaxed/simple;
	bh=7b1kqeJVrRsV0YmHiDnKkMh5TGoQQ15bSj1G/Z070rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkPeI7jskIknzsCPWrrhy8kiZvepWqHvEZdS0TKWZdUPb6It3FLEr8PMwdVLSI5I3bfNb6+/jYJwiRQ7s6WYOqGYwmdyMDXZTYSqA3I1wnwKYdG8pKBQL6MOpM6gYCee4WznI/6KG1zi0yXVYAUsX8L2tRJGc50SKSka1EOB7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fwBpFwhY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fwBpFwhY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so331170f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 22:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784005551; x=1784610351; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cdirsxO/FPRFqGWuGu0bkU6z47l7jUhA5UBaHJX7i8c=;
        b=fwBpFwhYnVnz4MUwuomg7ZQF8ryxdC7Xzoicxm5iVoYUsZLGbjHYNpWu/lNQScQfyy
         PUTAI257OXo0wDbapOwp/GaKoc/BoKrvbmY58GZ+Hi3eEEydbSXbfdkP98/DUejpTw+m
         QTzP/3u/GgpwoUOFDG6u1DT8JNTq9pjwvQBAiMw4JHKoSNS1BQ5aPe+xE9ZP5DixXk3/
         Czyz6hnfv8Skp55OMri2WVc6elIiofqkD8COIs2/XWuAoWur16T9BLnE/1D2QyzZoyAQ
         5ks7AnAok7schV6Rjm5NJtiWctWf2oF/nFfEPYhxcGpkBHJ+pjs9wHMJRLV7HY/SVL+E
         0mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005551; x=1784610351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdirsxO/FPRFqGWuGu0bkU6z47l7jUhA5UBaHJX7i8c=;
        b=oMHcam0uO5qwNN+rmcpSsCMZ4n70TMUdnT/eD7XzhAsL0NCfnToVqBbtZa81DOftmm
         JTD128ejBnE+WG61wHv7euD1lv9pv2W6VNKOtpAGwRCJu7QgJ6pVfwOmpYa41xBzu65R
         ncDXTSAeh3g/X/TFHhUDSSeX/fzDS0+IK2JKnH3SkjT/XbgMYZtdkVJhTOptYDHm/mEV
         H7NjQ2230sJjDJP2KZNwHCo1+y1cjEJbNGHkEGrO5prygJRv1+0TqSZtK0Sm8lePEEN/
         9PYKB3utiUc8e6ST6nnHdN/ssRuxCtePRbf9EvFySBgfRIxC7iVfsnQWo1BaaiNDMg/S
         yfBg==
X-Gm-Message-State: AOJu0Yw03ErI4SxjC03RZkVo+32BnHlJHsUMjvJpPdDKCE/FW6ySWMaa
	urjfXbgU2rlWRx/gbzbKIh1Mg3QQFgzIreoa6vpqvflsem4h5EITkUxNI7S9zM35CH0=
X-Gm-Gg: AfdE7cmDUhjWBDQkD2OteohzkF2f8YKrRPJ/eI57iCcHgVdzUlx9rRm39LCp8hkZN7E
	Ez133ncIXlhr5Ieh0r3UYV0j8Fa1lKijdpRtNEjUZAp2at+gPNv3ueAPZWRLb8h1i5mxlio6IH+
	xplBn4Ytfm37XZwX6L0+5zOPMIK/a4vhk9mrzJPr1gFuwosIZmmWDUetjF4oW8ZS0HQUDY5t0lG
	JzOpThXNf6mWhKwm5gGUFdZilO24AaxqU/tksGLUVs4VpFZM1gZI5G7HUEpF5L4fNRpsn/AJX/Q
	xIkDPW4B/9rc0lzGQ8Ks9wlUrsfhxq6SZcZp+ttC5fhGpw3hExMslNg/iVndfLPR4Q9l+pnstMh
	14pCjDAr4UBVNKuAMZdC8KDYMoX6gq/LuElH1PMy9uScLTK4KapH5vx4y+VL5dWyUk0Kc7Bkrw2
	uouoY+IZ8qkPugVCMScg==
X-Received: by 2002:a05:6000:2909:b0:476:6559:2a7a with SMTP id ffacd0b85a97d-47f2dd06670mr13602012f8f.45.1784005550687;
        Mon, 13 Jul 2026 22:05:50 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635a9cesm5005693f8f.14.2026.07.13.22.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:05:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 07:05:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Max Staudt <max@enpas.org>
Subject: Re: [mkp-scsi:for-next 15/20] drivers/ata/pata_buddha.c:255:63:
 warning: missing braces around initializer
Message-ID: <alXCV8g17CBxcg5P@monoceros>
References: <202607140557.mhC5z0xE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m572mitwreob6brv"
Content-Disposition: inline
In-Reply-To: <202607140557.mhC5z0xE-lkp@intel.com>


--m572mitwreob6brv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [mkp-scsi:for-next 15/20] drivers/ata/pata_buddha.c:255:63:
 warning: missing braces around initializer
MIME-Version: 1.0

Hello,

On Tue, Jul 14, 2026 at 06:00:00AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-=
next
> head:   4afcc9ed6a57b1b87e55366f9ff10c1c43b6d6e8
> commit: e73ba3d6ed03bf2afeecdfffc045b1ac98aeb1fc [15/20] scsi: zorro: Sim=
plify storing pointers in device id struct
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202607=
14/202607140557.mhC5z0xE-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260714/202607140557.mhC5z0xE-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607140557.mhC5z0xE-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    In file included from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/blkdev.h:9,
>                     from drivers/ata/pata_buddha.c:15:
>    include/linux/highmem.h: In function 'clear_user_pages':
>    include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not=
 used [-Wunused-but-set-parameter=3D]
>      234 | static inline void clear_user_pages(void *addr, unsigned long =
vaddr,
>          |                                                 ~~~~~~~~~~~~~~=
^~~~~
>    drivers/ata/pata_buddha.c: At top level:
> >> drivers/ata/pata_buddha.c:255:63: warning: missing braces around initi=
alizer [-Wmissing-braces]
>      255 | static const struct zorro_device_id pata_buddha_zorro_tbl[] =
=3D {
>          |                                                               ^
>      256 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA=
},
>          |                                                   {           }
> >> drivers/ata/pata_buddha.c:255:63: warning: missing braces around initi=
alizer [-Wmissing-braces]
>      255 | static const struct zorro_device_id pata_buddha_zorro_tbl[] =
=3D {
>          |                                                               ^
>      256 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA=
},
>          |                                                   {           }
>      257 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, BOARD_CAT=
WEASEL},
>          |                                                      {        =
      }
> >> drivers/ata/pata_buddha.c:255:63: warning: missing braces around initi=
alizer [-Wmissing-braces]
>      255 | static const struct zorro_device_id pata_buddha_zorro_tbl[] =
=3D {
>          |                                                               ^
>      256 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, BOARD_BUDDHA=
},
>          |                                                   {           }
>      257 |         { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, BOARD_CAT=
WEASEL},
>          |                                                      {        =
      }
>    drivers/ata/pata_buddha.c: In function 'pata_buddha_late_init':
>    drivers/ata/pata_buddha.c:284:59: warning: missing braces around initi=
alizer [-Wmissing-braces]
>      284 |                 static struct zorro_device_id xsurf_ent =3D {
>          |                                                           ^
>      285 |                         ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF=
, BOARD_XSURF
>          |                                                               =
  {
>      286 |                 };
>          |                 }

The problem here is that patch #6 of
https://lore.kernel.org/all/cover.1779803053.git.u.kleine-koenig@baylibre.c=
om/
was picked up, but patch #1 wasn't, maybe due to my confusion when
describing the merge plan.

Best regards
Uwe

--m572mitwreob6brv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpVw6gACgkQj4D7WH0S
/k7M0ggAgB+zVTO94Ueje5oqYjwLS7LTL+rmoiQj5Kb4fJFRvx+HFhqyxOqtjxQ5
NKCtC1amjL50crAy4T59xmepc4RVZv1VEP1tTJezRTfzw/n6aPWaJgZ6gWzo3MjR
8CEe4HSv86uTAr0RKKsT4PT4ONAIJlvtZl3eFd3xn5lsNAp0RpFOffvKIHFXpVyX
1AWiN3KTKDnjetUQFGHpEXRgEtu6A0VpJeX+PSP7SMrfcXOK2RNyArfubxM8JX2W
6CC/pm829ptYPdKUoAtGUCiy0Rx8LE/qXOID4LtMePHbvaI26/nYUpd4Ui4pnXjF
Wzbq/amOPtNKwgyUwg1j+I66WLzBcQ==
=ezbP
-----END PGP SIGNATURE-----

--m572mitwreob6brv--
