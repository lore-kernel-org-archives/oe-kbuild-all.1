Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4D32AEE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 01:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722217062; cv=none; b=oV78F+KK1bXXLD0ZGB9iTZkh4H0hSDiup2KYDGERK7RxHv0IPKzYK5FTCNGc1/lkS/dcmoIZ9MiQSk5rnaguUnAg6uKjg2xBsRqaXMN9cyov9dXwke0Ag1dsdiplM81+UtvuWrc4zy+5dRsf1sAK/cfT4Xwak77kGor9meKuxno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722217062; c=relaxed/simple;
	bh=FoEvWRWRIq3LZM8FagKdWnsauuDyIuWJChBOgCYgjYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+Pc7hOs7oOoLxAOe+X5+mgRyOrmkS2vYSZuSxs9EzNmSk2Tz24v4wST66VU/EfIJ1jk4i9jdbIz1f08RxK/MC8HNVi76nT3BvQfz8mykXEPzGoBxsuGHu3g6dZgnEzGRU3ZFPNaSZZNiJY0Ob8exbgBpbN8hE+EgyoRcqNMk9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqW11kEx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqW11kEx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc60c3ead4so13682545ad.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722217059; x=1722821859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laihnHn0tEWhiMwgpFPbHKhBIJSPYc/4lHmU8vF732k=;
        b=aqW11kExDh0MGHcraIPPUAhvHPcIyuo/4KiLQHSfl4xExt8h3KRVpPctRYYqvYfIdy
         J398OKjQt9dIkET2KXkhOlenOe0/7xS5zdw0eRkxw0WiXRd0a1F91oQO9qHqiNYK2lox
         HSPO2XZ2mg6CEIlyv3xRzQ+qkd7/RRDDz/s6JIDK0/aVdfhLfOKW6RLTU++mJY8u0nOx
         zCvCVaGodM6fs0VzSpmrM1f05noYPbcbEZCgOOsNetbVKSlBjzgJhBslT/Y5hJcTuk/X
         hhAF/YVeNnr7tUjLfLABfQJYyrKc5j9s2f8sZWlLM1NPRbXPX0X98ooCKOhTKRCuINQa
         KdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722217059; x=1722821859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laihnHn0tEWhiMwgpFPbHKhBIJSPYc/4lHmU8vF732k=;
        b=ljSW4uHK0Rv3h3VBmF7dVoi9lAHJSHzNKcc+KcrIJHEfuuvhNfJ/8HMWNoyAvy9ZCw
         pyDbTj58qw9pcu48OOLLr3b8m1GLJcwZv/KChtcwp22uI/PfKV5Ib0MZH0YbkXBys/a6
         oelv7bczDvsF9SCUhRPQw5L/Y2UqmzYdGlJiZT6VVzOMwLxSs3Zzxn5ZK2ZSWc62LfJd
         +ikAOwHGvGef16DuqwWVahihBiF2R2Ghm6bsxY3xb9czmJzGW4AUM40MNED5EkIWfnx2
         6BUYwrRDio2LIGKoOTmhSYzu4dO3VeYZ1dVwcK5NwlOgRAkERhemK4zqvyKZdecpluLi
         YM6A==
X-Forwarded-Encrypted: i=1; AJvYcCXcU5FCrRFy0yDK/rityZfsYC8o8lCkyntzQXgo2+JUy6Qi051nAzmJgGxhkK5Y1NiYHd77mdmitxw48At9@lists.linux.dev
X-Gm-Message-State: AOJu0YyO7r4c2nuSGg8OzyEO5VHTTpXvE4jUzaVgGYM3Cx6Psb476eIt
	uTVNaMAUGFwEZewIFSuKfSIa10pFwdDE7fhwLMLXBRoTEWN6D8DR
X-Google-Smtp-Source: AGHT+IFQdjRDbsHHZ4F9XyP8gJxPgF26gezLPByuD4QowAXZQtzR3gQYVihGWbncvmz8YnJvRgq63Q==
X-Received: by 2002:a17:902:c994:b0:1fc:4bdc:d413 with SMTP id d9443c01a7336-1ff0493be42mr35839175ad.60.1722217059162;
        Sun, 28 Jul 2024 18:37:39 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee6a1esm70873795ad.164.2024.07.28.18.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 18:37:38 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	hannes@cmpxchg.org,
	hughd@google.com,
	kaleshsingh@google.com,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	minchan@kernel.org,
	nphamcs@gmail.com,
	oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com,
	senozhatsky@chromium.org,
	shakeel.butt@linux.dev,
	shy828301@gmail.com,
	surenb@google.com,
	v-songbaohua@oppo.com,
	willy@infradead.org,
	xiang@kernel.org,
	ying.huang@intel.com,
	yosryahmed@google.com
Subject: Re: [PATCH v5 4/4] mm: Introduce per-thpsize swapin control policy
Date: Mon, 29 Jul 2024 13:37:18 +1200
Message-Id: <20240729013718.13901-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202407271351.ffZPMT6W-lkp@intel.com>
References: <202407271351.ffZPMT6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Jul 27, 2024 at 5:58 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Barry,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]

Hi Thanks!
Would you check if the below patch fixes the problem?

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 41460847988c..06984a325af7 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -80,7 +80,7 @@ unsigned long huge_zero_pfn __read_mostly = ~0UL;
 unsigned long huge_anon_orders_always __read_mostly;
 unsigned long huge_anon_orders_madvise __read_mostly;
 unsigned long huge_anon_orders_inherit __read_mostly;
-unsigned long huge_anon_orders_swapin_always __read_mostly;
+static unsigned long huge_anon_orders_swapin_always __read_mostly;
 
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long vm_flags,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-swap-introduce-swapcache_prepare_nr-and-swapcache_clear_nr-for-large-folios-swap-in/20240726-181412
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240726094618.401593-5-21cnbao%40gmail.com
> patch subject: [PATCH v5 4/4] mm: Introduce per-thpsize swapin control policy
> config: x86_64-randconfig-121-20240727 (https://download.01.org/0day-ci/archive/20240727/202407271351.ffZPMT6W-lkp@intel.com/config)
> compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271351.ffZPMT6W-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407271351.ffZPMT6W-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> mm/huge_memory.c:83:15: sparse: sparse: symbol 'huge_anon_orders_swapin_always' was not declared. Should it be static?
>    mm/huge_memory.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    mm/huge_memory.c:1867:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    mm/huge_memory.c:1905:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
>    mm/huge_memory.c:2016:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
>    mm/huge_memory.c:2156:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
>    mm/huge_memory.c:2306:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
>    mm/huge_memory.c:2323:12: sparse: sparse: context imbalance in '__pud_trans_huge_lock' - wrong count at exit
>    mm/huge_memory.c:2347:28: sparse: sparse: context imbalance in 'zap_huge_pud' - unexpected unlock
>    mm/huge_memory.c:2426:18: sparse: sparse: context imbalance in '__split_huge_zero_page_pmd' - unexpected unlock
>    mm/huge_memory.c:2640:18: sparse: sparse: context imbalance in '__split_huge_pmd_locked' - unexpected unlock
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    mm/huge_memory.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    mm/huge_memory.c:3031:30: sparse: sparse: context imbalance in '__split_huge_page' - unexpected unlock
>    mm/huge_memory.c:3306:17: sparse: sparse: context imbalance in 'split_huge_page_to_list_to_order' - different lock contexts for basic block
>    mm/huge_memory.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    mm/huge_memory.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>    include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>
> vim +/huge_anon_orders_swapin_always +83 mm/huge_memory.c
>
>     51 
>     52  /*
>     53   * By default, transparent hugepage support is disabled in order to avoid
>     54   * risking an increased memory footprint for applications that are not
>     55   * guaranteed to benefit from it. When transparent hugepage support is
>     56   * enabled, it is for all mappings, and khugepaged scans all mappings.
>     57   * Defrag is invoked by khugepaged hugepage allocations and by page faults
>     58   * for all hugepage allocations.
>     59   */
>     60  unsigned long transparent_hugepage_flags __read_mostly =
>     61  #ifdef CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS
>     62          (1<<TRANSPARENT_HUGEPAGE_FLAG)|
>     63  #endif
>     64  #ifdef CONFIG_TRANSPARENT_HUGEPAGE_MADVISE
>     65          (1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG)|
>     66  #endif
>     67          (1<<TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG)|
>     68          (1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
>     69          (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
>     70 
>     71  static struct shrinker *deferred_split_shrinker;
>     72  static unsigned long deferred_split_count(struct shrinker *shrink,
>     73                                            struct shrink_control *sc);
>     74  static unsigned long deferred_split_scan(struct shrinker *shrink,
>     75                                           struct shrink_control *sc);
>     76 
>     77  static atomic_t huge_zero_refcount;
>     78  struct folio *huge_zero_folio __read_mostly;
>     79  unsigned long huge_zero_pfn __read_mostly = ~0UL;
>     80  unsigned long huge_anon_orders_always __read_mostly;
>     81  unsigned long huge_anon_orders_madvise __read_mostly;
>     82  unsigned long huge_anon_orders_inherit __read_mostly;
>   > 83  unsigned long huge_anon_orders_swapin_always __read_mostly;
>     84 
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks
Barry

