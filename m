Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC745F6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 17:25:14 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-79f95439795so11145039f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695317114; x=1695921914; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0PYZSedDaADOsVOVsPBsTkIqQlsQuKQ8fLCi2tcKvs=;
        b=CQg9Pr9OHYpSEV1DTm3lr8T+4Fc+bU8DDt6+FW0Ll3bm6nzedzlBYkYhasR9IL1RsJ
         ytV1nvqCS0r2LGrOpTmetfvvB1gob3Gb5kyiKxxkojGqwrKPkUzWH5PswZVr33AkdJkr
         tOwcBSggqX2sq3ZFH3hh6O61Z/KpucpYZ2jPKN8k6zdP9hY34aIbwxevbuZYuMiiY7tK
         ZK5IWKc0pfD3u2KhHs7mTFI18BGDLt/yyd9h9MqSk27rvx/rISUD/XAuhCIrBMOyjO7q
         yLuOBjUt0D/2B+Ia8DKNmpO1C3CNYnb8HSENUWANYiKPKaqusgrIGKFb7aiLxemWSBZT
         d6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317114; x=1695921914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0PYZSedDaADOsVOVsPBsTkIqQlsQuKQ8fLCi2tcKvs=;
        b=vzqOHSES+RGSsF89fEcFnk2oRHFO8qyAE50G1gOt/m6AK7Z3eRjT6oM1hjISXCXs/4
         /2o67q1CjLfEBQtqqzGVu2fAS6oAhDV5W77Enjznb29XKCZwxRFDEbjHi5hK+YTUWynM
         tiQa5xY/yr2UhRqFC05GBWFAPDKp0rvd+QbUOvZvT0KzlOFCvDvvxqVp0fFhndXKXJaV
         apsRQh98LRkGLH1c7GBDMf8AOL3qF5SCVFlpvqvEb8kbx82lAjFHgvoLbjVQhlpw1UYm
         Th9uV6X+m6M29YuHWUVafPS85KWUV0ThXkevNWKWHAIxtfwzVGdh7OdEP4WKE2ztbMvy
         Vj1w==
X-Gm-Message-State: AOJu0YyUwD/R9Qk/jGHGDrPHUZiKnAlRaQTW5PPa8xgqvRTeegYTLAh/
	ieBV2vnMUNe6fn4JQiKS0UIslxxuz3IyE8Ik/Yq3R4x8LKclpA==
X-Google-Smtp-Source: AGHT+IELIcqODc+4ipYtfDTchuVWSaqFPGpEHgm295RKcepXl7DykFR33zvxmIBhuhRuh2rKAEnnIFmgCUvIXaozIfg=
X-Received: by 2002:a05:6602:2426:b0:791:ad01:3f3e with SMTP id
 g6-20020a056602242600b00791ad013f3emr335590iob.0.1695317113788; Thu, 21 Sep
 2023 10:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230919171447.2712746-3-nphamcs@gmail.com> <202309220008.tGqPMxKU-lkp@intel.com>
In-Reply-To: <202309220008.tGqPMxKU-lkp@intel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 21 Sep 2023 10:25:02 -0700
Message-ID: <CAKEwX=NDPK+Qz5_N5WoW4qVSdgkwKitaWv8J=qwHJMesXzbGPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] zswap: shrinks zswap pool based on memory pressure
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 9:56=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Nhat,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.6-rc2]
> [cannot apply to akpm-mm/mm-everything next-20230921]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/zswap-ma=
ke-shrinking-memcg-aware/20230920-011604
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20230919171447.2712746-3-nphamcs=
%40gmail.com
> patch subject: [PATCH v2 2/2] zswap: shrinks zswap pool based on memory p=
ressure
> config: x86_64-randconfig-076-20230921 (https://download.01.org/0day-ci/a=
rchive/20230922/202309220008.tGqPMxKU-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230922/202309220008.tGqPMxKU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309220008.tGqPMxKU-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/zswap.c: In function 'zswap_shrinker_scan':
>    mm/zswap.c:520:36: error: 'struct shrinker' has no member named 'priva=
te_data'
>      struct zswap_pool *pool =3D shrinker->private_data;
>                                        ^~
>    mm/zswap.c: In function 'zswap_shrinker_count':
>    mm/zswap.c:552:36: error: 'struct shrinker' has no member named 'priva=
te_data'
>      struct zswap_pool *pool =3D shrinker->private_data;
>                                        ^~
>    mm/zswap.c: In function 'zswap_alloc_shrinker':
>    mm/zswap.c:592:3: error: implicit declaration of function 'shrinker_al=
loc'; did you mean 'warn_alloc'? [-Werror=3Dimplicit-function-declaration]
>       shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE, "mm-zswa=
p");
>       ^~~~~~~~~~~~~~
>       warn_alloc
> >> mm/zswap.c:591:17: warning: assignment makes pointer from integer with=
out a cast [-Wint-conversion]
>      pool->shrinker =3D
>                     ^
>    mm/zswap.c:596:16: error: 'struct shrinker' has no member named 'priva=
te_data'
>      pool->shrinker->private_data =3D pool;
>                    ^~
>    mm/zswap.c: In function 'zswap_pool_create':
>    mm/zswap.c:1004:2: error: implicit declaration of function 'shrinker_r=
egister'; did you mean 'driver_register'? [-Werror=3Dimplicit-function-decl=
aration]
>      shrinker_register(pool->shrinker);
>      ^~~~~~~~~~~~~~~~~
>      driver_register
>    mm/zswap.c:1012:2: error: implicit declaration of function 'shrinker_f=
ree'; did you mean 'shstk_free'? [-Werror=3Dimplicit-function-declaration]
>      shrinker_free(pool->shrinker);
>      ^~~~~~~~~~~~~
>      shstk_free
>    cc1: some warnings being treated as errors
>
>
> vim +591 mm/zswap.c
>
>    588
>    589  static void zswap_alloc_shrinker(struct zswap_pool *pool)
>    590  {
>  > 591          pool->shrinker =3D
>    592                  shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEM=
CG_AWARE, "mm-zswap");
>    593          if (!pool->shrinker)
>    594                  return;
>    595
>    596          pool->shrinker->private_data =3D pool;
>    597          pool->shrinker->scan_objects =3D zswap_shrinker_scan;
>    598          pool->shrinker->count_objects =3D zswap_shrinker_count;
>    599          pool->shrinker->batch =3D 0;
>    600          pool->shrinker->seeks =3D DEFAULT_SEEKS;
>    601  }
>    602
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I think this error is from a branch without the new shrinker API
(the new shrinker functions and private_data fields are from that patch
series).

https://lwn.net/ml/linux-mm/20230911094444.68966-1-zhengqi.arch@bytedance.c=
om/
