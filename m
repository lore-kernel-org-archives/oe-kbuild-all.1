Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210915AE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 10:37:16 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3ae450158ffso949807b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 03:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695983835; x=1696588635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1hsWY5JCWvz2xsWRCM+HzGyDcidNkVmlTTI/NR7R+0=;
        b=nHNsuxwMGPf99FDJVQ9sS0H9SRhhYmge1b2jPaC5WENO00lQ7QsgEaGCQx6Xph0d8H
         /3cd3FVUC9YwN1SdcDA0dHj6UpmJHWvYNog/UKFo+K0afKH8xC9H9OMZTuW7kPcv/vo3
         XusQx1Tm2yV3hgbnyxz37vCsx59S60rJMFi386zXYfh+DC0q969hWqbQkqvFn90+8xC1
         8R6ECii1AvtxC8ZyQclx3JvdmA1fPPKg7BtiQHtlX3lzqzNHRwg4PtBf36U76oyAsNs+
         wopdAUJQb2UE9JlMTExN2+iGv2nnrqZGeobKMVixb9/BW0y+AZACf/bhifPlOABb5Dc/
         xKRw==
X-Gm-Message-State: AOJu0YwIRhyMT6ux0tIbzK/qfqv3cpb2wxH+kD/LmK8xEur94TSbZwxt
	yhAGud70iYxS0goDq7Pq/2ATKPapneNQo/b6+wY=
X-Google-Smtp-Source: AGHT+IFkdyx/QYd+Gh26sWMUYpZu8SsfK/oQaPVxBFOTvbXh6XghmsZnkkctRsN5CVbcEsH52Dm4ahxaV6gO17JbrMU=
X-Received: by 2002:a05:6808:2123:b0:3a9:f25d:d917 with SMTP id
 r35-20020a056808212300b003a9f25dd917mr5371486oiw.4.1695983835330; Fri, 29 Sep
 2023 03:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309291214.Hjn3gJ94-lkp@intel.com>
In-Reply-To: <202309291214.Hjn3gJ94-lkp@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 29 Sep 2023 12:37:03 +0200
Message-ID: <CAJZ5v0gGissufTrvCa+z5i=kPMDM+-RKoQfOHW41zf7o2=z4SQ@mail.gmail.com>
Subject: Re: [rafael-pm:bleeding-edge 48/94] drivers/thermal/amlogic_thermal.c:303:16:
 error: void value not ignored as it ought to be
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org, devel@acpica.org, 
	linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 6:21=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it bleeding-edge
> head:   2cff74feed4a2a3a1c220e0ee2838b85b08d4999
> commit: 88af8b66ffedcad8c5a1522f6a9c02bf8129a951 [48/94] thermal: amlogic=
: Convert to platform remove callback returning void
> config: arm-randconfig-004-20230929 (https://download.01.org/0day-ci/arch=
ive/20230929/202309291214.Hjn3gJ94-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230929/202309291214.Hjn3gJ94-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309291214.Hjn3gJ94-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/thermal/amlogic_thermal.c: In function 'amlogic_thermal_suspen=
d':
> >> drivers/thermal/amlogic_thermal.c:303:16: error: void value not ignore=
d as it ought to be
>      303 |         return amlogic_thermal_disable(data);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

amlogic_thermal_disable() should not be modified by this commit -
fixed up in the tree.

Thanks!

>
> vim +303 drivers/thermal/amlogic_thermal.c
>
> 421eda108e6c63a Guillaume La Roque 2019-10-04  298
> 421eda108e6c63a Guillaume La Roque 2019-10-04  299  static int __maybe_un=
used amlogic_thermal_suspend(struct device *dev)
> 421eda108e6c63a Guillaume La Roque 2019-10-04  300  {
> 421eda108e6c63a Guillaume La Roque 2019-10-04  301      struct amlogic_th=
ermal *data =3D dev_get_drvdata(dev);
> 421eda108e6c63a Guillaume La Roque 2019-10-04  302
> 421eda108e6c63a Guillaume La Roque 2019-10-04 @303      return amlogic_th=
ermal_disable(data);
> 421eda108e6c63a Guillaume La Roque 2019-10-04  304  }
> 421eda108e6c63a Guillaume La Roque 2019-10-04  305
>
> :::::: The code at line 303 was first introduced by commit
> :::::: 421eda108e6c63a72feb178c441bb769d4076836 thermal: amlogic: Add the=
rmal driver to support G12 SoCs
>
> :::::: TO: Guillaume La Roque <glaroque@baylibre.com>
> :::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
