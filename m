Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC4157A5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944767; cv=none; b=uuWw6hc6KOOhDXaAljtLKGh8xvQMHQARSIIAr4vroYWNCuj0GV4z5zWWBExNJakxx5x/1l3buNVMqqPTL2h2eL9svBf+uZp177Hq6UHMfxQ2gsZUoozf2f/Z8MsutK/Fivk7PvQevjWwXeCNYkG/aUpOrPCIInVv+Lk0JQgCSP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944767; c=relaxed/simple;
	bh=hcV0LEzSEuwEKgpFGDakD0gKy0s+WRB99I3F9V6pjB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awL2QBcGPTGFN5sOzkuKJELj03X9kNP2BXrUy4+LdfJEn6UGppXlWIuX6ea3ju5afJJdbSdcPCvPccc1Res/bKFwa17vBnqNiRf8LXqcFQvY1s+Sk4I9Banth5Wb5LDsvXnbXHrCfnWWEC+pTjWYj20oOXfwPFv16XWD/VHFtts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vitc8bB7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vitc8bB7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf680d351so18780625e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741944763; x=1742549563; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J4tYQIJAJBSXDPaAztr8rYlca+bGlBplSbR1xzd+zog=;
        b=Vitc8bB7MUVU16SdwERAB3UVNEnMrD9mGHc6+wKA1fc4ON/o6seT77NQvYc3xXKg8r
         HB/yCMqPjhoVE5qCJPAf40vUM6wr+cV9C3Z33kxVsmr0sCaKiE8w1/EnqBhyPvS9+v+2
         1pE1UiP7qaAHibgTnymdsHc5Aa/4LVSGH2WQvisgv2Yurwwwjr0LrvnOvaYGDPNmruSo
         dBBmodC1REeoQ0Z+qnwbYMPzA/czmJyt04UaRRivAMbku1UFh1x31crSTxMe6wHOEm1q
         58FBuyhj/0q7qzTFxPbfbxiCWACD5h4wXGHF577hbinldiGnNsTHo5ldYNLPOYl210Hr
         1Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944763; x=1742549563;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4tYQIJAJBSXDPaAztr8rYlca+bGlBplSbR1xzd+zog=;
        b=kLxgWqmPSaDXNFBgAPm6seXejrlwXmw4Nm0Gny2SjimAC+3XmLCidPwraXCghFv6/R
         n7lu+BUpBZS3jSU3Z4ypMTLYtzW14Mqr43xrfPmx7bqcGOGh6RvS6hJeKAWMCdwMCsSA
         Dfv3oO7whL9CO3Og04lH7vDHd8EFFVwKcDHkeb5gS0xqroREBnEC4Xu+pTvahi2YnhmT
         Y2JiUPl1B/xyl+ht49K9ynnLDlU19ZzF2YSWOIgXZEen5ML7cvKoTVuTVhu8LXm7HBaf
         3lHGTCvS2eZGwOLVRVlyFtoVTBfJ+oDofV5JcqJPT4zbJzBypke2plbSt/imIBZOebsA
         BiDQ==
X-Gm-Message-State: AOJu0YwTYW+2qbsw4KFf6KZ2pimN1PEKwzvVlgonUx8F76G6U/geWpOl
	YWGpnCyV9v/snqHTUzEtkQhjY4s6VKx2L5eEqOWT8vbjQUGG1QQF
X-Gm-Gg: ASbGncvVd+6DWW3huBB77N3TweTHutrC/z11nmm+ZDU7fAcnM5eSEQpK/FJ2sW6g1b+
	AlKQshekkfwR0EjM6z1+CanYxQzQ7kT8KT2q91gdUZdLAY3BXC4fciUc/tLtDd0k+hUuMxdxkYx
	DHzpKzvAvm4kibOkDMTnFVKTkRq6D/l788qJncgloKvPBidGqTgpp91m8558SQzZcHVuIF2nfca
	rxZy1d0wSafVyNRKuFrRE0ddGkkWYSPpJowMP2AYveqydNQTQ5y+yiC77WWDqYa13ZTP29im/iT
	bZa9E4YiC1bSrFbpOqWqI60oUmkx5gEolkdhxYOFkkDClbHcerH9SjWL6njkdlmuqSAYyAYnh2O
	zcRggZQHJDAHefbVF
X-Google-Smtp-Source: AGHT+IFAI234bDkyXXIeNHpEbB1U8Jccu6tTIQixfwy1mCNddafRlvmQYFCshie4oRvFllieoeJfMg==
X-Received: by 2002:a05:600c:420b:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-43d1806c066mr51117445e9.6.1741944763036;
        Fri, 14 Mar 2025 02:32:43 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm5030639f8f.61.2025.03.14.02.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:32:42 -0700 (PDT)
Message-ID: <16fa84a264428b26c1d9e848270b87bf21c7fe8a.camel@gmail.com>
Subject: Re: [PATCH 06/18] mfd: adp5585: add support for adp5589
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Nuno =?ISO-8859-1?Q?S=E1?= via B4
 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <ukleinek@kernel.org>,  Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Dmitry Torokhov	 <dmitry.torokhov@gmail.com>,
 Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>
Date: Fri, 14 Mar 2025 09:32:48 +0000
In-Reply-To: <202503141715.1e4xyKyq-lkp@intel.com>
References: <20250313-dev-adp5589-fw-v1-6-20e80d4bd4ea@analog.com>
	 <202503141715.1e4xyKyq-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-03-14 at 17:23 +0800, kernel test robot wrote:
> Hi Nuno,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 4d395cb071a343196ca524d3694790f06978fe91]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bin=
dings-mfd-adp5585-ease-on-the-required-properties/20250313-222511
> base:=C2=A0=C2=A0 4d395cb071a343196ca524d3694790f06978fe91
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20250313-dev-adp5589-fw-v1-6-20e80d4bd4ea%40ana=
log.com
> patch subject: [PATCH 06/18] mfd: adp5585: add support for adp5589
> config: s390-randconfig-001-20250314
> (https://download.01.org/0day-ci/archive/20250314/202503141715.1e4xyKyq-l=
kp@in
> tel.com/config)
> compiler: s390-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20250314/202503141715.1e4xyKyq-l=
kp@in
> tel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion
> of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202503141715.1e4xyKyq-lkp@intel.c=
om/
>=20
> All warnings (new ones prefixed by >>):
>=20
> > > drivers/mfd/adp5585.c:249:34: warning: 'adp5585_02_info' defined but =
not
> > > used [-Wunused-const-variable=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0 249 | static const struct adp5585_info adp5585_0=
2_info =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> > > drivers/mfd/adp5585.c:239:34: warning: 'adp5585_01_info' defined but =
not
> > > used [-Wunused-const-variable=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0 239 | static const struct adp5585_info adp5585_0=
1_info =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> > > drivers/mfd/adp5585.c:229:34: warning: 'adp5585_info' defined but not=
 used
> > > [-Wunused-const-variable=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0 229 | static const struct adp5585_info adp5585_i=
nfo =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~
> > > drivers/mfd/adp5585.c:48:41: warning: 'adp5589_volatile_regs' defined=
 but
> > > not used [-Wunused-const-variable=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 48 | static const struct regmap_access_tab=
le adp5589_volatile_regs =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~~~~~~~~~~~~~~
>=20

ouchhh!!!

will fix in v2

- Nuno S=C3=A1
>=20
> vim +/adp5585_02_info +249 drivers/mfd/adp5585.c
>=20
> =C2=A0=C2=A0 228=09
> =C2=A0> 229	static const struct adp5585_info adp5585_info =3D {
> =C2=A0=C2=A0 230		.adp5585_devs =3D adp5585_devs,
> =C2=A0=C2=A0 231		.regmap_config =3D &adp5585_regmap_configs[ADP5585_REGM=
AP_00],
> =C2=A0=C2=A0 232		.n_devs =3D ARRAY_SIZE(adp5585_devs),
> =C2=A0=C2=A0 233		.id =3D ADP5585_MAN_ID_VALUE,
> =C2=A0=C2=A0 234		.regs =3D &adp5585_regs,
> =C2=A0=C2=A0 235		.max_rows =3D ADP5585_MAX_ROW_NUM,
> =C2=A0=C2=A0 236		.max_cols =3D ADP5585_MAX_COL_NUM,
> =C2=A0=C2=A0 237	};
> =C2=A0=C2=A0 238=09
> =C2=A0> 239	static const struct adp5585_info adp5585_01_info =3D {
> =C2=A0=C2=A0 240		.adp5585_devs =3D adp5585_devs,
> =C2=A0=C2=A0 241		.regmap_config =3D &adp5585_regmap_configs[ADP5585_REGM=
AP_00],
> =C2=A0=C2=A0 242		.n_devs =3D ARRAY_SIZE(adp5585_devs),
> =C2=A0=C2=A0 243		.id =3D ADP5585_MAN_ID_VALUE,
> =C2=A0=C2=A0 244		.regs =3D &adp5585_regs,
> =C2=A0=C2=A0 245		.max_rows =3D ADP5585_MAX_ROW_NUM,
> =C2=A0=C2=A0 246		.max_cols =3D ADP5585_MAX_COL_NUM,
> =C2=A0=C2=A0 247	};
> =C2=A0=C2=A0 248=09
> =C2=A0> 249	static const struct adp5585_info adp5585_02_info =3D {
> =C2=A0=C2=A0 250		.adp5585_devs =3D adp5585_devs,
> =C2=A0=C2=A0 251		.regmap_config =3D &adp5585_regmap_configs[ADP5585_REGM=
AP_02],
> =C2=A0=C2=A0 252		.n_devs =3D ARRAY_SIZE(adp5585_devs),
> =C2=A0=C2=A0 253		.id =3D ADP5585_MAN_ID_VALUE,
> =C2=A0=C2=A0 254		.regs =3D &adp5585_regs,
> =C2=A0=C2=A0 255		.max_rows =3D ADP5585_MAX_ROW_NUM,
> =C2=A0=C2=A0 256		.max_cols =3D ADP5585_MAX_COL_NUM,
> =C2=A0=C2=A0 257	};
> =C2=A0=C2=A0 258=09
>=20

