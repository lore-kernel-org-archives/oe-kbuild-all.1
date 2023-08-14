Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702EF5687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:47:49 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d665467e134so3991866276.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692042468; x=1692647268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy0pzUvzYWh3mlOnXTx+dHFgIF1vfiRlwU+KNeoaObI=;
        b=NgIy/DGNPOHc+/Id4Ob2gsokFGo27YFVAgq/BPrT1zAU/RxhA3Ikd9U8lS2HX3hU2J
         2cxS9g2ZJHA8FtP50zrSv1HTgQ/RloC4gIrd3oR8OcjuVVcjEYIL3uAruwQifEfzQXMv
         0D0uQ8o/9pLMVzN1Ik6aBQ2TEg9NumnUJczkhhLqcapDS/ZBdlkZJaYQpAzFuj+UPcvW
         T3VH5ruFdvPReCKGaHd4sOhzfT8V6jstlF9w3qEVwDniGF9DiED/GrYBULy9ns3qohiy
         QasucdLDIGaHD63ZIXtRUR/1zwBuYwLwPrT74qOTO8ZWmuEqk18LxRrON7YNrsu2Zah+
         bWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692042468; x=1692647268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy0pzUvzYWh3mlOnXTx+dHFgIF1vfiRlwU+KNeoaObI=;
        b=hn94GnwYZDzfKXLrNVkcnzaxJqLEM+YktS/S0s7cSpkMRr+n/sLpYD6gzgXkr3DmS+
         nNsDhqTO55etRA1L68nyIg8nKcXqK8fUyOSjsJMQhknrWCyuxhD4R5OnygBHiISIluYp
         Yp9Dlku5gTO8texz1xztRg7ji3PXGtupUo8rrdjqVbu5u3JLvcWA7f03MkUNSi7FtGG/
         O7dLJyCoE2duEd1MUmb1lCQ0OHLsnKy0xcs8QwhyFdpJbtS6aEBSDi3bjTaE6n99frKY
         q9L21qoau+LbyvizY7tZa1Fy46RoQpdg3m18DxfhlrDM2DLVNTtYJKuWOOaS4LSt1sGq
         sGbQ==
X-Gm-Message-State: AOJu0YwlcTi8nFRvs4bmeDzcw09pK75bFkZ5rmNSTpMXVfRYfhRorgG0
	gqy2rTlR14wVwybJ4Ba2g74uAgDHG61/VBfDyN85FQ==
X-Google-Smtp-Source: AGHT+IEAQsiWHsu23kYMma2/neNlWqdM4EQ4WkHAq+c72OzEyWIKqAb1peFu/NihhJQeF582GCplQAoA1lL4HNrxBH8=
X-Received: by 2002:a25:6853:0:b0:d44:3ad2:42e5 with SMTP id
 d80-20020a256853000000b00d443ad242e5mr12674731ybc.4.1692042467977; Mon, 14
 Aug 2023 12:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308131610.jF4ncWp6-lkp@intel.com>
In-Reply-To: <202308131610.jF4ncWp6-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Aug 2023 12:47:34 -0700
Message-ID: <CAJuCfpGpV2hOAsxNHiupf2vo+ZnSbqxDFs6ZAyW6jU6xC7eSbQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error: implicit
 declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
To: kernel test robot <lkp@intel.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 13, 2023 at 1:17=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-st=
able
> head:   5fb2ea3111f4ecc6dc4891ce5b00f0217aae9a04
> commit: 4aaa60dad4d1c96151dec51098aed866bb6e867d [219/240] mm: allow per-=
VMA locks on file-backed VMAs
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/2023081=
3/202308131610.jF4ncWp6-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131610=
.jF4ncWp6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308131610.jF4ncWp6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/build_bug.h:5,
>                     from include/linux/container_of.h:5,
>                     from include/linux/list.h:5,
>                     from include/linux/smp.h:12,
>                     from include/linux/kernel_stat.h:5,
>                     from mm/memory.c:42:
>    mm/memory.c: In function 'lock_vma_under_rcu':
> >> mm/memory.c:5410:41: error: implicit declaration of function 'vma_is_t=
cp'; did you mean 'vma_is_dax'? [-Werror=3Dimplicit-function-declaration]
>     5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
>          |                                         ^~~~~~~~~~
>    include/linux/compiler.h:77:45: note: in definition of macro 'unlikely=
'
>       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    cc1: some warnings being treated as errors

Same issue as https://lore.kernel.org/all/202308121909.XNYBtqNI-lkp@intel.c=
om/
with the same fix that Matthew suggested.

>
>
> vim +5410 mm/memory.c
>
> c2508ec5a58db6 Linus Torvalds     2023-06-15  5382
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5383  #ifdef CONFIG_PER_VMA=
_LOCK
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5384  /*
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5385   * Lookup and lock a =
VMA under RCU protection. Returned VMA is guaranteed to be
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5386   * stable and not iso=
lated. If the VMA is not found or is being modified the
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5387   * function returns N=
ULL.
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5388   */
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5389  struct vm_area_struct=
 *lock_vma_under_rcu(struct mm_struct *mm,
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5390                       =
                 unsigned long address)
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5391  {
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5392      MA_STATE(mas, &mm=
->mm_mt, address, address);
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5393      struct vm_area_st=
ruct *vma;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5394
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5395      rcu_read_lock();
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5396  retry:
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5397      vma =3D mas_walk(=
&mas);
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5398      if (!vma)
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5399              goto inva=
l;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5400
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5401      if (!vma_start_re=
ad(vma))
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5402              goto inva=
l;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5403
> 657b5146955eba Jann Horn          2023-07-26  5404      /*
> 657b5146955eba Jann Horn          2023-07-26  5405       * find_mergeable=
_anon_vma uses adjacent vmas which are not locked.
> 657b5146955eba Jann Horn          2023-07-26  5406       * This check mus=
t happen after vma_start_read(); otherwise, a
> 657b5146955eba Jann Horn          2023-07-26  5407       * concurrent mre=
map() with MREMAP_DONTUNMAP could dissociate the VMA
> 657b5146955eba Jann Horn          2023-07-26  5408       * from its anon_=
vma.
> 657b5146955eba Jann Horn          2023-07-26  5409       */
> 657b5146955eba Jann Horn          2023-07-26 @5410      if (unlikely(!vma=
->anon_vma && !vma_is_tcp(vma)))
> 657b5146955eba Jann Horn          2023-07-26  5411              goto inva=
l_end_read;
> 657b5146955eba Jann Horn          2023-07-26  5412
> 444eeb17437a0e Suren Baghdasaryan 2023-02-27  5413      /*
> 444eeb17437a0e Suren Baghdasaryan 2023-02-27  5414       * Due to the pos=
sibility of userfault handler dropping mmap_lock, avoid
> 444eeb17437a0e Suren Baghdasaryan 2023-02-27  5415       * it for now and=
 fall back to page fault handling under mmap_lock.
> 444eeb17437a0e Suren Baghdasaryan 2023-02-27  5416       */
> 657b5146955eba Jann Horn          2023-07-26  5417      if (userfaultfd_a=
rmed(vma))
> 657b5146955eba Jann Horn          2023-07-26  5418              goto inva=
l_end_read;
> 444eeb17437a0e Suren Baghdasaryan 2023-02-27  5419
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5420      /* Check since vm=
_start/vm_end might change before we lock the VMA */
> 657b5146955eba Jann Horn          2023-07-26  5421      if (unlikely(addr=
ess < vma->vm_start || address >=3D vma->vm_end))
> 657b5146955eba Jann Horn          2023-07-26  5422              goto inva=
l_end_read;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5423
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5424      /* Check if the V=
MA got isolated after we found it */
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5425      if (vma->detached=
) {
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5426              vma_end_r=
ead(vma);
> 52f238653e452e Suren Baghdasaryan 2023-02-27  5427              count_vm_=
vma_lock_event(VMA_LOCK_MISS);
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5428              /* The ar=
ea was replaced with another one */
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5429              goto retr=
y;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5430      }
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5431
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5432      rcu_read_unlock()=
;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5433      return vma;
> 657b5146955eba Jann Horn          2023-07-26  5434
> 657b5146955eba Jann Horn          2023-07-26  5435  inval_end_read:
> 657b5146955eba Jann Horn          2023-07-26  5436      vma_end_read(vma)=
;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5437  inval:
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5438      rcu_read_unlock()=
;
> 52f238653e452e Suren Baghdasaryan 2023-02-27  5439      count_vm_vma_lock=
_event(VMA_LOCK_ABORT);
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5440      return NULL;
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5441  }
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5442  #endif /* CONFIG_PER_=
VMA_LOCK */
> 50ee3253720614 Suren Baghdasaryan 2023-02-27  5443
>
> :::::: The code at line 5410 was first introduced by commit
> :::::: 657b5146955eba331e01b9a6ae89ce2e716ba306 mm: lock_vma_under_rcu() =
must check vma->anon_vma under vma lock
>
> :::::: TO: Jann Horn <jannh@google.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
