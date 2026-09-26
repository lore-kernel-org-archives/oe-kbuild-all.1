Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC3346E51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423685; cv=pass; b=tttV4fYIpkzq8KqzVGIb2TIX6ZHoOqGcrrekICmoJklKVyWO0j0LSGWuI29wPBY0GqB5Ap3DIxycGyveuhoK+ZsaL1IvMEIc2Mrp+waCdKX5MOYgq7JrR98sVRhd7AuFC0EqXY4x9TwPHjnldIwZo9kwA7b0EEk3kvDjtwvaixg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423685; c=relaxed/simple;
	bh=0zqrJGlqhI/JoKsehWKnh3E5H7Ps+NhamG5c7kvdkD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjPqfnJIz16NN13Il9a83E7SzmVJHY2YXuvKetoJXTQps5s+ZenQLRtvgtAyPUJpXf2voH5Gt0Jsr+lesg5IqruHzy7PxqAnLC7ECgNSPw1XBzEF0CHUz3wAAn9/2EACQA5iFn0eOp38mTOgcKgUSjiYIfYe/a+RW/g+46aXXuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AZT39YBl; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AZT39YBl"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c9995ca60so1576726d50.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 04:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790423682; cv=none;
        d=google.com; s=arc-20260327;
        b=Xa6rbVaoifioXkgwRBv/KgptKoJgo1afmwUUInb16cAx5OHHAE8oD026pl0dEwY1Ei
         TrE1va9DvFfK+3PFuwtIRDO1F/MZkX9WcQor6TYOa5TSjQLjGw5CgF6R0KGWxq/sxkNp
         fWcfd4UgVCpt9SsD2I+XlR13a7MWPIn2jvgqtdsafOJI24mOnD4RXKWdDkGNXwMzakLL
         babAoUdjWt1XgojkrPbXnPFM9IxLefEFU+gt9IkqxnmNakq2dFlL2fs5rSWSfm6bZWkM
         YZOqWClw+WS+hzRMzag8y9ZTbx0F3yy3wHrfPD9v3xsw14DR3pWGEQDSYmZ3t6AYNfWd
         un5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ua9n88EZddhkv+bT4vgIw93hWV3VAINF46k/mnf6Wvg=;
        fh=EuXxnJ8E9INxIBjSoM/AoX7JanJYFvtaBoXoHWi0x4w=;
        b=keBiWfz32wl48DMqTg0ubpAb0Zk0HwdntOEBfdUgmH4eUQZg+DG79Aqs0f2Tv09d8C
         50pb8JiUa3u0yIelURNGWmS+WnJVHBNklEbJHaWt5oOoI2xbZ20I2A5/+AQl9XSxWaNh
         QD4aA+NN96OWT9UbzZ/boreXnzO3t0UhsarKdvfqgYnyfYkV5X91HNVm574GRKS6Y/aw
         aTQF5bmqWGarpQGcRZDJ6iQCyy23mLMJZlJ/bVepfYerkz3l3DwKXx1YLT8nAtGX1XHe
         ZBSA2O0p9UTosHuGDlY0bFv7EQwLOtEefplXVKRg0KXh8GixXG4X83159SS97S4GD9Aj
         wVkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790423682; x=1791028482; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ua9n88EZddhkv+bT4vgIw93hWV3VAINF46k/mnf6Wvg=;
        b=AZT39YBlsJ9bYwQJ7SFqv3Hp+uzw6B9KXg7oj0dkiRfY8ZOjiHZGno3OyZI6qp1jmU
         Pjtn8PcQeNfgsOIET3qvTZinBJn6mQWFmCDZRWoffKus9cLdpS+SL/4GlA8yLlshE+mm
         GoFes91WVXaR8Eq9M1aC6c9kPujBqv3xtS6EitNsiGqbu6SyYVANtuIsq7jyIPvqGa8g
         whrhfc58C6Jc1uC/ntR/tIsWXG6ocBSYuxEH90QuNNKiD3rK0xX7rcCV6/E9gfINmr2B
         BB+ZAXmP1U1HgOkw/btcel9Q+h7CMGskFk2UwNwQJvzkCcF0cpSrqakf1tsu27ab2c/h
         kJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423682; x=1791028482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ua9n88EZddhkv+bT4vgIw93hWV3VAINF46k/mnf6Wvg=;
        b=ezcoq5knga8I2hbPqN7RldHufLXvvd/Y6JUyHn5YpOCYO0h6xkYxLcjc9MY7taCcWh
         VPuCXxoeFOAQ8Z/Ub/vpbgKtzXbOCAhFCJFvdrN4D5focaDC06r1XZyRhkRq9KmhimHB
         rkZd97PqtxTyMSGJDYH+cSoC6OnkY4FefqTZ19prf41FbX5zzLX/x6G7RJ9xYcYxRV6O
         IFUubIdWomAdPbN3PY3gG/h5CnZcymSVNpKzoMX4XLUy4MhkPZUwGqWEZBQ7Ft/oIIn4
         aoVVy5u8vWUzjIDtYc0P0FxYmrLtrfQ6OdSnQQwY+yY3p0qhT7rp5esyP2dlH1JRepls
         9hFg==
X-Gm-Message-State: AFq9FYK8bU22fCJqtfkifm2YOC9oPmt9hHn2D9VcVK9zcqPwh2hAVgHZ
	sQ4SJvAqJjcF0iYWCHfdy3HLH82t7N385nvUE9yJVnhtQct2Gf8plVm2TkDi2IEH5Tq9NxMX7H0
	GdC5f5Sfzp9MpUELequkZIQruAPtMM/OQOSQhiLTP3Rs+/hhH/Sdfez1s5Q==
X-Gm-Gg: AYBFou0NNfUpy/b2SicfP/8dG/uEV8bOupYZdFY8zewCb06dzaqNRgm37kc7v/dOvjw
	kzOQaYPH3jdLl2wEtHEegnEsYNcGPorW+zHrYnAQgO6XK8G/ztYYOt/Wsa5/qO035RZEyNl6Pgx
	cYIECDZSgge6RBmd8gV6qlJXzDR44Cbbk9ErvSL9H+mbpQOx6jOYAyiGbQl576pC+fC1sVh/tNb
	s91FTg06eLHgZwFIqUOAAQ0MRGENVYy/Lt0YqC5DgUDraVu6d/1oJyDaD8+rb8Aloftpr7UdThI
	Qfzrn6e1DZ8E3ynygYlwUUa/NM34RfukMFw+MijfmSyJekKCI5h378tt6yE=
X-Received: by 2002:a05:690e:2490:b0:672:bad1:6d76 with SMTP id
 956f58d0204a3-672ed21b01amr3155615d50.5.1790423681747; Sat, 26 Sep 2026
 04:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609251257.WwH2kzxF-lkp@intel.com>
In-Reply-To: <202609251257.WwH2kzxF-lkp@intel.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Sat, 26 Sep 2026 19:54:05 +0800
X-Gm-Features: AclHuK8RE_ZVp9tWBYY7sUp_CXsYQ_TGtg2G0d0TI2Hps7kmVmL0SY5Lc5VsaUA
Message-ID: <CAMZfGtUSPxKtyp6NrR+J1mHpEiYwAJx2wcZfV8U+XpEEt-jq5w@mail.gmail.com>
Subject: Re: [linux-next:master 6102/7200] include/linux/mmzone.h:1160:29:
 error: use of undeclared identifier 'PUD_SHIFT'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:07=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
> commit: 83c71ba4895fcfd11ec4746d0ef1585c70deb325 [6102/7200] mm/sparse-vm=
emmap: factor out shared vmemmap tail page allocation
> config: riscv-randconfig-r2106-20260925 (https://download.01.org/0day-ci/=
archive/20260925/202609251257.WwH2kzxF-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260925/202609251257.WwH2kzxF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609251257.WwH2kzxF-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:8:
>    In file included from include/linux/gfp.h:7:
> >> include/linux/mmzone.h:1160:29: error: use of undeclared identifier 'P=
UD_SHIFT'

Thanks for the report.

The failure is caused by using VMEMMAP_OPTIMIZATION_NR_ORDERS
as the size of the per-zone vmemmap_tails array in mmzone.h.
The macro expands MAX_FOLIO_ORDER to PUD_SHIFT - PAGE_SHIFT.
However, mmzone.h can be included before the architecture page
table definitions, so PUD_SHIFT is not available at that point.

That said, a simple fix may be difficult to achieve, since the header depen=
dency
problem is hard to resolve. A prerequisite dependency patch is needed to av=
oid
this kind of header dependency issue. Therefore, I will update a new versio=
n of
this series (mm: Switch device DAX to section-based vmemmap optimization) a=
s
soon as possible to fix this problem.

Thanks,
Muchun

>     1160 |         struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORD=
ERS];
>          |                                    ^
>    include/linux/mmzone.h:119:4: note: expanded from macro 'VMEMMAP_OPTIM=
IZATION_NR_ORDERS'
>      119 |         ((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 &&       \
>          |           ^
>    include/linux/mmzone.h:117:3: note: expanded from macro '__VMEMMAP_OPT=
IMIZATION_NR_ORDERS'
>      117 |         (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
>          |          ^
>    include/linux/mmzone.h:94:27: note: expanded from macro 'MAX_FOLIO_ORD=
ER'
>       94 | #define MAX_FOLIO_ORDER         (PUD_SHIFT - PAGE_SHIFT)
>          |                                  ^
> >> include/linux/mmzone.h:1160:29: error: use of undeclared identifier 'P=
UD_SHIFT'
>    include/linux/mmzone.h:120:57: note: expanded from macro 'VMEMMAP_OPTI=
MIZATION_NR_ORDERS'
>      120 |           IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION)) ?=
 __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
>          |                                                               =
 ^
>    include/linux/mmzone.h:117:3: note: expanded from macro '__VMEMMAP_OPT=
IMIZATION_NR_ORDERS'
>      117 |         (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
>          |          ^
>    include/linux/mmzone.h:94:27: note: expanded from macro 'MAX_FOLIO_ORD=
ER'
>       94 | #define MAX_FOLIO_ORDER         (PUD_SHIFT - PAGE_SHIFT)
>          |                                  ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:98:11: warning: array index 3 is past the end o=
f the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       98 |                 return (set->sig[3] | set->sig[2] |
>          |                         ^        ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:98:25: warning: array index 2 is past the end o=
f the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       98 |                 return (set->sig[3] | set->sig[2] |
>          |                                       ^        ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:99:4: warning: array index 1 is past the end of=
 the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       99 |                         set->sig[1] | set->sig[0]) =3D=3D 0;
>          |                         ^        ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:101:11: warning: array index 1 is past the end =
of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>      101 |                 return (set->sig[1] | set->sig[0]) =3D=3D 0;
>          |                         ^        ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:114:11: warning: array index 3 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      114 |                 return  (set1->sig[3] =3D=3D set2->sig[3]) &&
>          |                          ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:114:27: warning: array index 3 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      114 |                 return  (set1->sig[3] =3D=3D set2->sig[3]) &&
>          |                                          ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:115:5: warning: array index 2 is past the end o=
f the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      115 |                         (set1->sig[2] =3D=3D set2->sig[2]) &&
>          |                          ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:115:21: warning: array index 2 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      115 |                         (set1->sig[2] =3D=3D set2->sig[2]) &&
>          |                                          ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>    In file included from include/linux/mm.h:36:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:116:5: warning: array index 1 is past the end o=
f the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      116 |                         (set1->sig[1] =3D=3D set2->sig[1]) &&
>          |                          ^         ~
>    include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared her=
e
>       62 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/riscv/kernel/asm-offsets.c:9:
>
>
> vim +/PUD_SHIFT +1160 include/linux/mmzone.h
>
> 3484b2de9499df Mel Gorman             2014-08-06  1152
> 7cf91a98e607c2 Joonsoo Kim            2016-03-15  1153          bool     =
               contiguous;
> 7cf91a98e607c2 Joonsoo Kim            2016-03-15  1154
> e6ad640bc404eb Shakeel Butt           2022-08-26  1155          CACHELINE=
_PADDING(_pad3_);
> 3484b2de9499df Mel Gorman             2014-08-06  1156          /* Zone s=
tatistics */
> 3484b2de9499df Mel Gorman             2014-08-06  1157          atomic_lo=
ng_t           vm_stat[NR_VM_ZONE_STAT_ITEMS];
> f19298b9516c1a Mel Gorman             2021-06-28  1158          atomic_lo=
ng_t           vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
> 83c71ba4895fcf Muchun Song            2026-09-11  1159  #ifdef CONFIG_SPA=
RSEMEM_VMEMMAP
> e1b6218149da3f Muchun Song            2026-09-10 @1160          struct pa=
ge *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
> 622026e87c4019 Kiryl Shutsemau        2026-02-27  1161  #endif
> 22fc6eccbf4ce4 Ravikiran G Thirumalai 2006-01-08  1162  } ____cacheline_i=
nternodealigned_in_smp;
> ^1da177e4c3f41 Linus Torvalds         2005-04-16  1163
>
> :::::: The code at line 1160 was first introduced by commit
> :::::: e1b6218149da3f0eef54e9466e3b31ec47d3c991 mm/sparse-vmemmap: rename=
 HVO order macros
>
> :::::: TO: Muchun Song <songmuchun@bytedance.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
