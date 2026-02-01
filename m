Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86E02EC083
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769984621; cv=none; b=k2Q/lAltx9V/doSyAynKboZlM4y+l5/qOfmt2QcplCare3MOGzOwWnkKu/3aN/Ey/YqyCYYnudTZT43yPDspLKv/GhrL5pCLhacVMEYV8cKztPaSlI/k+jGLHa7V68c7qWHkHHCIxJnSyUYMkyydujTjiAPsQ4pO9BQHjPiqiTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769984621; c=relaxed/simple;
	bh=8iC6WKxiYQIrJeCuFClcXSQIT1svC15xrYOO4ADNDkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB7nHkndiHGlYoAy+2g81nR9s9fKZ32Mz1MwiKWTm/q7PrGgDOhreXSNHkukD/vigNTMXTL3nZgqizbwYkpwMmADYgaS7N9qORBwKwFRKDGJORaIJlarB4ZG+E5GNR6CpyqIbgxme/Xo/LoC27XgD4r2hiyOZ86m4eSCb1k8jhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BdYSUoaO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BdYSUoaO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4807068eacbso31287815e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Feb 2026 14:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769984617; x=1770589417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CH9BC69jP5RCt/eJVwGMK2W67lZNWhB3HFcUKx/WFj4=;
        b=BdYSUoaOeAa590TPSxDKHPCN2/S2GyR5gX7PCiWSDjPzdZS7Tz/sYkKoIZmC6Fle2E
         whTV0oWXLDKpwloumtMhL2vXqUqgVndOMWw0rUNF4umn+AbcWNZiFDEEew8g30IYEaf8
         9yRMTFnju99Y6tMgI9osZJ1J5OLi7Y03onUpnUhWFj6j/YitjmSQKmheswcXdE94HcAm
         +iIIsRRN2JjyAZhZGQnOAJc4k1rvp36Q0OqdRZX5Qj1aiWgZzf3Mz1Qiz6yDaFSVKGb7
         eJMKD+L513sd/xYpAB+jnK4NMnjDKLskQm9jIvUGBizkeq06P2NAvzKnfoo6cCgLiiZn
         lNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769984617; x=1770589417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH9BC69jP5RCt/eJVwGMK2W67lZNWhB3HFcUKx/WFj4=;
        b=CUT/InPu9e7Z/G73E/xEyGzTYDP3/addpWzcNbSZCkWgyr8EjLVlP0ScILh3iYZY0x
         pb0HDixZ/B6xjluqEPKlGqZZD0KgskviJHwVnhuks50uVJ1SFOM26+CogC8+gqR99u9N
         OGWkZW5hIpIaCh/+ZuERC9XsQ3O3MVM53jgBoAZOGBO8Bk2z1boTm0PDSnHbMPpu5vmB
         nl4/Vohxul56ph/Xkqwo+janFTsgw83rqD4qm8B+JO+1Z8kSFXOUOCMpFmV0/Dx4MVZj
         lrJ+n3dHRnx6EJKSEu60NG6hgRXQyiTcY3kdKnq22aYQlyjSiaQwbbpSi55wPlu3VcTV
         yW9w==
X-Forwarded-Encrypted: i=1; AJvYcCXN2XC/QpGHIm4GdMaP+l9wffUkQj8kLT3X3NY66nrWEl2Hvstu3jWy7xD6UCRwk5QPHmFgbkwDjUrJRxSK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4fcr+gMlqYNERtMrbASUymK2lCgjBdUxCPjlYQdTDH0+Jp+TX
	Pwis2JGYR2VkW2NFOlebYrHW9hvPZr++4cJgUQENyH2SyKWyFUP2M0lF5tkdkyHPzsE=
X-Gm-Gg: AZuq6aIdfNz7u890i8DL7tXA1xsrBvW/zUaLXmN9UXWZnyjqekCzHXJXh6kNvXceeNd
	f1FLBE6YqWsuTReFVzXXH9jfWKTkUWCvFM4skOIHR1k71zGMa1Ub68nn6Rd8B3OK0yvBqazdBIX
	XPsEIFFSqR/3836N0bC7P9WpFNMmGo2PYJWNknDh+yR5gaG98G6w0D0kZM98AfW0fhZASr702k6
	ld7BozfEz5yNoyYSItSkpuYS66BX+eV0TXn0VM9LH+AgBngiUl8wi/W5s4JD0NUWN/+4D1gN/LK
	pzASonugnGwX8U0hZrUovxsudDFl3rddCXbgA/M2wunigsq7Ovlt/2TjUtsnv71qLf33p3TL5J9
	FtkyGjDDGRQiKRXtDP8PUgFEDqnnIYO/4Xf2HSxDWu21pQZG0PWupRaAuGtO6OR8P4QEIQEODqd
	4nx83eCkLIM5/aimJu1iU/ElTV19Jz
X-Received: by 2002:a05:600c:19cc:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-482db4563b7mr126551145e9.14.1769984616317;
        Sun, 01 Feb 2026 14:23:36 -0800 (PST)
Received: from localhost (212-166-21-66.win.be. [212.166.21.66])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4806cdd79c7sm362884475e9.2.2026.02.01.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 14:23:35 -0800 (PST)
Date: Sun, 1 Feb 2026 23:23:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
Message-ID: <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
References: <202601311615.10yziOui-lkp@intel.com>
 <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v37yrfnsg2gibrlx"
Content-Disposition: inline
In-Reply-To: <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>


--v37yrfnsg2gibrlx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
MIME-Version: 1.0

Hello,

On Sat, Jan 31, 2026 at 06:14:58PM -0800, Abdurrahman Hussain wrote:
> > On Jan 31, 2026, at 6:35=E2=80=AFAM, Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > kernel test robot noticed the following build warnings:
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Huss=
ain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/20260130=
-054653
> > base:   63804fed149a6750ffd28610c5c1c98cce6bd377
> > patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e434=
897ef%40nexthop.ai
> > patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
> > config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/a=
rchive/20260131/202601311615.10yziOui-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > smatch version: v0.5.0-8994-gd50c5a4c
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.com/
> >=20
> > smatch warnings:
> > drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_g=
et_sync() also returns 1 on success
> >=20
> > vim +1539 drivers/i2c/busses/i2c-xiic.c
> >=20
> > e190a0c389e601 Uwe Kleine-K=C3=B6nig    2023-05-08  1529  static void x=
iic_i2c_remove(struct platform_device *pdev)
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1530  {
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531   struct device *de=
v =3D &pdev->dev;
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1532   struct xiic_=
i2c *i2c =3D platform_get_drvdata(pdev);
> > 36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533   int ret;
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1534 =20
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1535   /* remove ad=
apter & data */
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1536   i2c_del_adap=
ter(&i2c->adap);
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1537 =20
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538   ret =3D pm_runtim=
e_get_sync(dev);
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539   if (ret)
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540   dev_warn(dev, "Fa=
iled to activate device for removal (%pe)\n",
> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1541   ERR_PTR(ret)=
);
> >=20
> >=20
> > pm_runtime_get_sync() can return 1 on success.  Perhaps use
> > pm_runtime_resume_and_get()?
> >=20
> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1542   else
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1543   xiic_deinit(=
i2c);
> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1544 =20
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545   pm_runtime_put_sy=
nc(dev);
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546   pm_runtime_dont_u=
se_autosuspend(dev);
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1547  }
> >=20
> > --=20
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >=20
>=20
> This maybe a false positive.

It's not.

The blamed commit 2557b4ba04df ("i2c: xiic: cosmetic cleanup") has:

-       ret =3D pm_runtime_get_sync(i2c->dev);
-
-       if (ret < 0)
-               dev_warn(&pdev->dev, "Failed to activate device for removal=
 (%pe)\n",
+       ret =3D pm_runtime_get_sync(dev);
+       if (ret)
+               dev_warn(dev, "Failed to activate device for removal (%pe)\=
n",
                         ERR_PTR(ret));

So we need

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 37a15065db60..a5334b7c46d8 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1536,7 +1536,7 @@ static void xiic_i2c_remove(struct platform_device *p=
dev)
 	i2c_del_adapter(&i2c->adap);
=20
 	ret =3D pm_runtime_get_sync(dev);
-	if (ret)
+	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
 			 ERR_PTR(ret));
 	else

Best regards
Uwe

--v37yrfnsg2gibrlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml/0mMACgkQj4D7WH0S
/k5SaQf+L43J+R9BBhzzRsM+a56bqT+f6V9BbGxQCgPvb2ug8BZRliJSX8Q3zsFm
EaNRAQ5tL6LTRPZUsMsJskjVpizKEtFORW26RjcmlLbTqpKj9e24IWyIczVmHaih
dFIe69J7Kzl6o2HzEpjf942SS2F2HD8JoJbx2GYTVnmsYM8w0JX1PZRO8+EZ5jo3
KJxf556LsB5aK5nw2bOy7JlZYw9P2P1kH/bTMvFNf/+6u4XDGYkHmh2t1SWPSDks
llkR84RXfcWTLzCW3uX9ecgAfNUVZ1uZxbPCF1yyz4cHJ0rFOCE6NLpHjwXpRrDS
A6GLXBGHlpfLu3RSWb/jClQ3kpk5MA==
=tXAs
-----END PGP SIGNATURE-----

--v37yrfnsg2gibrlx--
