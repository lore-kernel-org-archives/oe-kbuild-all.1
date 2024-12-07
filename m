Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1B18638
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Dec 2024 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733560666; cv=none; b=K75UHKIg1BjTtrv/9J8Q8ULGSeS7UeyAis+jDVbw1faktBNYjK/3G6yZeu/6dydrXQ7IMD7DCb2SHbKJp0Fqc9dg8Xf3eQVa1TIYb9EnkhzBUh4CvRrEnsiUQmBQFqN0M1I93m8diti+KhGuriy0R5I25XpKfIAG82iKO3OFreY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733560666; c=relaxed/simple;
	bh=/D1e2w5YRxeqPPDidhNdNYaoxsQuK3x9X1wBvFHJMcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPe0qqTnhN1ZndVAzUhat8+8TrMv2CiBD/4L0zonUcU+n2aV3Pb3EN9wBcrKVSKjG2hI8CLhDMGdvTMkZm0rpVqg8rf3B5ZgWwb6ZkDPjSpbDDTjFzzlY6VXj7SkhtfVX9yz6gRNri4EPDP2swlIHIXkz6XfWV9XwSGbAMAEpnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nUj6Rwr0; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nUj6Rwr0"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-aa62f0cb198so316489566b.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Dec 2024 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733560660; x=1734165460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIXXcor5BT4H9ajmkBhx7ZtMU3/w+Af84RJxwBSl1LM=;
        b=nUj6Rwr07eHJecNtD5pnGUGd7x8mCgv0WdvG3kC967WPWMKW35plFOEZk2Y76GZKvm
         6mNRdR4GPDasoWAwjSlFLqtdD6/6hkBaOz9LD09VClsmkpNYIn1Naa5c7ok4uI3r4wxC
         hPGiN6r0qBxRrhLe1cBwSz1lOqr+2PvtUbrCXJ3PkO+5JBY+sLmNUP4PmrigsBEGC+kb
         CrPsd/zqzm6d4M/xwrKxtis2hnEcgeW00OCQxFb+HQx/P2UDvigLYoFlNEGMIXXKUg91
         INusFnUfAl1QZOkY+qOH0xFHoY4w9gpZL5P1OpP+IOiSzOoXmlGJdoz+sZWZmpvum7+2
         16OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733560660; x=1734165460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIXXcor5BT4H9ajmkBhx7ZtMU3/w+Af84RJxwBSl1LM=;
        b=VJmLDje+oAEIYGkqTy7xl1u+9GS3IPW5u1jiG6OJPyqQe/k+mzsm9ondzZlfQW0tmB
         9ip5GL3tqsdifUTb2d5iMAZ1HwWjCoT7o+Bw+DUHe6hxyifdGCj8Uvi9b9Su9MSvD12N
         25VRBoxYmZsAi9roL3uiwvTQMxlJdIzHDYhHURLsuPqoZX2ZjIIuUT4B13PAvi2R71ki
         2rsDPktMfCH+Bmg3kF2TYNRyX4AMLXQQlJyRrt3H8u6Eqxv7pClr1t5sHe/C6Ji6nVUl
         2VfCqoNr4jLRJ+3Nn8DIHAvbajItnTz5g6TUvVdDeFG1zqRG7gdGaAQV+RVMc/EBOjyC
         zdkg==
X-Gm-Message-State: AOJu0Yx2kUxR0aw7fhEGl71gPFJK5g6wYz2/xFfh+QG3b6h30UnmdESS
	Iqh+wBLmHDMM7G3Mhw/p56pUSeJOgJcd7qopQV3RPyIIrzphS39dWHNpSSVQkcw=
X-Gm-Gg: ASbGncuuOP41A/TJlkcbU9EkIcu9bx0idxGGxl17xEGT9F332ks1ZduusOT617rndGI
	wjQKEJQFGob2GeI2IMs8MhiAKfTr+IqKWw+YkXaApNYbTbuj5cjBpJpOGhJDih+a3f6jrcM0lLU
	ZRoTIp4aTjlcbzhd0DMxMyHTcFqFA6cKsEaxYOUJP8O39033gHKGyU17to0c2wwFfN3RX+MDh1n
	T4ZzJgCJY2tsTNeOktupmN4hQ1t3VnjrIzGQtYEsKtXfLM0F6aIAhk=
X-Google-Smtp-Source: AGHT+IEgwPnM9sPqFkWQqo05LsRPXpGvYSumqiwGGHjQd1CCHO5rDBZBKvG5CxqJf9nYGUPeZ8qaFg==
X-Received: by 2002:a17:907:9507:b0:aa6:38e9:9d03 with SMTP id a640c23a62f3a-aa63a09a422mr347657166b.30.1733560659823;
        Sat, 07 Dec 2024 00:37:39 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:e614:87a3:d4c7:31de])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58da5sm358595366b.28.2024.12.07.00.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:37:39 -0800 (PST)
Date: Sat, 7 Dec 2024 09:37:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org, 
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [chanwoo:devfreq-next 4/4]
 drivers/devfreq/sun8i-a33-mbus.c:384:47: error: passing argument 1 of
 'devm_clk_rate_exclusive_get' from incompatible pointer type
Message-ID: <faqkdyfv4wstpsc6miyfwq73nyj7tke4epses4msjewrh26her@vpovriyfjtcv>
References: <202412070231.MzXdNrLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jcsufy4xftaiyta6"
Content-Disposition: inline
In-Reply-To: <202412070231.MzXdNrLv-lkp@intel.com>


--jcsufy4xftaiyta6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [chanwoo:devfreq-next 4/4]
 drivers/devfreq/sun8i-a33-mbus.c:384:47: error: passing argument 1 of
 'devm_clk_rate_exclusive_get' from incompatible pointer type
MIME-Version: 1.0

Hello,

On Sat, Dec 07, 2024 at 02:37:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git=
 devfreq-next
> head:   27d1a5d95c5202f927f1155ad8f919778cd9f155
> commit: 27d1a5d95c5202f927f1155ad8f919778cd9f155 [4/4] PM / devfreq: sun8=
i-a33-mbus: Simplify by using more devm functions
> config: arm64-randconfig-002-20241206 (https://download.01.org/0day-ci/ar=
chive/20241207/202412070231.MzXdNrLv-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241207/202412070231.MzXdNrLv-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412070231.MzXdNrLv-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/devfreq/sun8i-a33-mbus.c: In function 'sun8i_a33_mbus_probe':
> >> drivers/devfreq/sun8i-a33-mbus.c:384:47: error: passing argument 1 of =
'devm_clk_rate_exclusive_get' from incompatible pointer type [-Wincompatibl=
e-pointer-types]
>      384 |         ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
>          |                                           ~~~~^~~~~~~~~~
>          |                                               |
>          |                                               struct clk *
>    In file included from drivers/devfreq/sun8i-a33-mbus.c:6:
>    include/linux/clk.h:214:48: note: expected 'struct device *' but argum=
ent is of type 'struct clk *'
>      214 | int devm_clk_rate_exclusive_get(struct device *dev, struct clk=
 *clk);
>          |                                 ~~~~~~~~~~~~~~~^~~

Huh, back then something with my build testing must have been broken.
The right thing is to squash the following into said commit:

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-m=
bus.c
index fae0793182a7..52e146fe389d 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -381,7 +381,7 @@ static int sun8i_a33_mbus_probe(struct platform_device =
*pdev)
 		return dev_err_probe(dev, ret, "failed to lock dram clock rate\n");
=20
 	/* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
-	ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
+	ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to lock mbus clock rate\n");
=20

If you don't want to rewrite history, tell me, then I create a proper
patch.

Thanks and sorry,
Uwe

--jcsufy4xftaiyta6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdUCTIACgkQj4D7WH0S
/k6pTQf/ZNMr6G1osHstlEbW5AvZB/ypQH/I2voXnpFoICddPGYkbSrt64h5uOnO
iya7M5O00BnB6FG3pq4GrfnX/NQ2n/7kks21ZyWYXyA65GdFcG3BcQ0lscU2LQSv
mUQY/7tYSPCEZ+Fz3RITUMmRoaOMR9tf2pO01bWYt93Wrd0zfMsTfA78PRgwufAS
doU1PYPCYGYcULbaNgokBGEagif6M65PBvCql1waxKD4S3k2Fqtu48T9KfB6cah+
fpfaeE/zwMF/z/ujVq8S6Vu7oMVEseejuv5KFgFMCOpSFOuScK4bf89/eK3U750L
BySiEwk68SfroBEuSS9Ac6dhIMxLyg==
=y/74
-----END PGP SIGNATURE-----

--jcsufy4xftaiyta6--
