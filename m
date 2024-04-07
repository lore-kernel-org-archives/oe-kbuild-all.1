Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95647184D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712462664; cv=none; b=GSoXWoFdOpOD8EK00W7GXV3BjBXLrXUhLTGtZIxGh6MESyYfNkPKLmxsT2Odbuc8rlajOwOb+1jbe0RDP/9KHwPG66jCAEvBiCvGTNgwb1Gw3J3dx/V2MiiE0q3S+kx5IRZ9cqz4o0emhI+yVNN839aksjDv8t7UUYdZERhAflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712462664; c=relaxed/simple;
	bh=ptQ4EXSwwdIJ1jGl6OacMY7q2CkBn2EmI/i72ScZgHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGMdlkBJIaPoCyrfVkaQXxoM2V4uSpcEAhy8TUnrpS+1OD0MgCwh9m7c9Gp9/gmrBT8RBH7mHhinag6KOhPkOf/LeP3lnLaO0gyPDfWPPlcR34/vmL36vjsQ+3MgFTavYjUm9bSbXiPwT4wEd/1Jpury3NhciI1FQVnonIlYbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG7PLMZb; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG7PLMZb"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a49261093cso1697208eaf.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Apr 2024 21:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712462661; x=1713067461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXUQaOMb8FeVjuZAbtCgzIw0cQ+eVQ5kKzJJGCn84fU=;
        b=QG7PLMZbTd2ppXcDSDet3NT19x3Nhq0CMw3cD4O3soMh1EPdxZkUomL0Fy7fQckSkY
         dOkX7jiK8WRN8k5Nc7e2X9MxtbH6DmA02cRwRd80c0Xc34PyVmMOG5dwX7JaIqDtrsXc
         mEVkiHaj+D8GRhfQDd8tRFvqKm39Mn8b4tiyhT9LZ1DLzQ4vMnxYRN5pzvXWPTjasYed
         kbO9kL2EAMssf7pTTjurrdWbqqeVYO3iW4qljj+HRmvSSXzAFOrhf9O6ZCmaf9Y9aVce
         LWdvGLA0SlA9e0kST3u9LtnPLe+3G5lOUtzlVhNzaH8Y8rSSFLhlhgrK99a/Cah/4uj4
         x+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712462661; x=1713067461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXUQaOMb8FeVjuZAbtCgzIw0cQ+eVQ5kKzJJGCn84fU=;
        b=w2rS6WTFRvTuWjKqerWpg/lGe+VbCFzAQM6wJG70iXSSdDx8f1aZrxabjXnq6zQqks
         oBiYx+g0wdWOYFE/B+V3Dx8+Dw6UHAn2InADyKG3EvPT7nOHjE6wOGtFTZfOi8gNOoSb
         iTNo6J/n8nt+C/4RgFgPsvk4yRHfHKiURkK7CqgR45gMDzg7cGIGguH7N9+rFm/rg/Y7
         HYQkiwRPlKOyPqoiuZra4mFs/tXshvMP/BcoDqCMuUJSRYEu1/YM4fx7QIaSygTiDKzD
         L4x68W9QRCu3fBH1wHyyt+Btnl/QXwowku/A/1n4YtMdqHZQaFmO2KJMtbfwvHErDXgU
         ep8g==
X-Forwarded-Encrypted: i=1; AJvYcCWUoUrH2WvfK6EWe5ceBjqqbOoM6rR2O2kLs70VdNzyBGyHdBH6D/qwHJ2aNCS6Dr9UZMdZ1NL5hV1fg3uuWGiv6hxLQF371Nj/CsiUuQ==
X-Gm-Message-State: AOJu0YyMzxgh/kuQ+CiFTOz1MMRwh+Jp1PLK7Pfnz0kS+wOG9lbq6dMa
	5CNIm6YaWfSC1k/mt1l01+L8MW0ZkttjEJB0encMddWDSyCITx9dFQuJghEWaKO3+GZjL+9HGlf
	ehztM4FA9YzkRgoNhCpE6ogZ4bns=
X-Google-Smtp-Source: AGHT+IH2s7sGG91mjzo45QDfSs8VxLriFL8GdGUJo48nxTr5Tgn3DIGmyRGVzLkA4/xYxdk5jkrXJoHykMqas086WYI=
X-Received: by 2002:a05:6358:7a8f:b0:183:f215:6468 with SMTP id
 f15-20020a0563587a8f00b00183f2156468mr5160605rwg.11.1712462661450; Sat, 06
 Apr 2024 21:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404061627.ungVloow-lkp@intel.com> <20240407005229.103923-1-21cnbao@gmail.com>
In-Reply-To: <20240407005229.103923-1-21cnbao@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 7 Apr 2024 16:04:10 +1200
Message-ID: <CAGsJ_4ynTftCx9HeD2xoHPNys2pDnhddcfkDjJL9GJRaC8DXBA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:23:
 error: variably modified 'stats' at file scope
To: lkp@intel.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	oe-kbuild-all@lists.linux.dev, v-songbaohua@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2024 at 12:52=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> >
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> > head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
> > commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-=
order mTHP anon_alloc and anon_alloc_fallback counters
> > config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/2=
0240406/202404061627.ungVloow-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240406/202404061627.ungVloow-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404061627.ungVloow-l=
kp@intel.com/
>
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/mm.h:1115,
> >                     from include/linux/mman.h:5,
> >                     from arch/powerpc/kernel/asm-offsets.c:19:
> >>> include/linux/huge_mm.h:274:23: error: variably modified 'stats' at f=
ile scope
> >      274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT=
];
> >          |                       ^~~~~
> >    make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-of=
fsets.s] Error 1
>
> Should have been fixed by:
>
> From 573aa50dbebcd4b2650d477374b28aa53c21b968 Mon Sep 17 00:00:00 2001
> From: Barry Song <v-songbaohua@oppo.com>
> Date: Sun, 7 Apr 2024 12:23:35 +1200
> Subject: [PATCH] mm: fix powerpc build issue
>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  include/linux/huge_mm.h |  9 ++++-----
>  mm/huge_memory.c        | 13 +++++++++++--
>  2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index c5d33017a4dd..0717063dc5e7 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -271,16 +271,15 @@ enum mthp_stat_item {
>  };
>
>  struct mthp_stat {
> -       unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
> +       unsigned long stats[0][__MTHP_STAT_COUNT];
>  };
>
> -DECLARE_PER_CPU(struct mthp_stat, mthp_stats);
> +extern struct mthp_stat __percpu *mthp_stats;
>
>  static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>  {
> -       if (unlikely(order > PMD_ORDER))
> -               return;
> -       this_cpu_inc(mthp_stats.stats[order][item]);
> +       if (likely(order <=3D PMD_ORDER))
> +               raw_cpu_ptr(mthp_stats)->stats[order][item]++;
>  }
>
>  #define transparent_hugepage_use_zero_page()                           \
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 5b875f0fc923..10bc3f54cb81 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -526,7 +526,7 @@ static const struct kobj_type thpsize_ktype =3D {
>         .sysfs_ops =3D &kobj_sysfs_ops,
>  };
>
> -DEFINE_PER_CPU(struct mthp_stat, mthp_stats) =3D {{{0}}};
> +struct mthp_stat __percpu *mthp_stats;
>
>  static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
>  {
> @@ -534,7 +534,7 @@ static unsigned long sum_mthp_stat(int order, enum mt=
hp_stat_item item)
>         int cpu;
>
>         for_each_online_cpu(cpu) {
> -               struct mthp_stat *this =3D &per_cpu(mthp_stats, cpu);
> +               struct mthp_stat *this =3D per_cpu_ptr(mthp_stats, cpu);
>
>                 sum +=3D this->stats[order][item];
>         }
> @@ -602,6 +602,7 @@ static struct thpsize *thpsize_create(int order, stru=
ct kobject *parent)
>  static void thpsize_release(struct kobject *kobj)
>  {
>         kfree(to_thpsize(kobj));
> +       free_percpu(mthp_stats);
>  }
>
>  static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
> @@ -636,6 +637,13 @@ static int __init hugepage_init_sysfs(struct kobject=
 **hugepage_kobj)
>                 goto remove_hp_group;
>         }
>
> +       mthp_stats =3D (struct mthp_stat __percpu *)alloc_percpu((PMD_ORD=
ER + 1) *
> +                                       sizeof(sizeof(mthp_stats->stats[0=
])));

sorry. I made the wrong allocation size. please change the above two
lines to the below when you
test the patch:

+       mthp_stats =3D __alloc_percpu((PMD_ORDER + 1) *
sizeof(mthp_stats->stats[0]),
+                       sizeof(unsigned long));

> +       if (!mthp_stats) {
> +               err =3D -ENOMEM;
> +               goto remove_hp_group;
> +       }
> +
>         orders =3D THP_ORDERS_ALL_ANON;
>         order =3D highest_order(orders);
>         while (orders) {
> @@ -673,6 +681,7 @@ static void __init hugepage_exit_sysfs(struct kobject=
 *hugepage_kobj)
>         sysfs_remove_group(hugepage_kobj, &khugepaged_attr_group);
>         sysfs_remove_group(hugepage_kobj, &hugepage_attr_group);
>         kobject_put(hugepage_kobj);
> +       free_percpu(mthp_stats);
>  }
>  #else
>  static inline int hugepage_init_sysfs(struct kobject **hugepage_kobj)
> --
> 2.34.1
>

Thanks
Barry
