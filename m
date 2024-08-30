Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800D1B1D6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725030318; cv=none; b=NfeY5SVYbWF8ytlS6Nut0TFLy52wGmV3n5y41auQEVrG3hnkpd0XOl1WZ+1UiJBRuPOfL9HeglpYal1pEBEmpxhGFXsi5KZBtEE9SHiVNFJfQt0ZPHyipZrkgfEVXnmEF8rBE8Hu+WKKc0/N+vvzolEu8oa5j0BdiHhnWJi2BU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725030318; c=relaxed/simple;
	bh=/vcbSYD864bhoeuRX5piKN0HKpK2n5jYkx2j8WaZjPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx5Ajko2al56XazrJmCLCY0fvZkldHFN8lWVfdrfUoU3fgEf6crVmgm3/nklAd+yZTA/3MNemlRekV9eZlBGfXS1/HE9D0bHYwwLNr5x7uK2IeItJ8DtJyGya9aQA+zDXiwMGSck+qFp+fbn6BtWDgCs6+Me+e5E6dumk3ki1uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/87p6vi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/87p6vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725030317; x=1756566317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/vcbSYD864bhoeuRX5piKN0HKpK2n5jYkx2j8WaZjPw=;
  b=Q/87p6vipeVbDgmSPfYQZ+KJG9A2YLfAih+ruP7s53ne6utxaAEI3ynJ
   C7qpJODbf/O1MyBbkOIvA5Jz3EzGUnQiUAiWcOSh190ZwUEIt4bopTHyT
   6oGlyxIZNQqpD4+t2ig09H+35JQ14GDRt7pyd4Xot69PfrvWDmwVyX0bS
   rugoe8jJmUiOrNlVY0CeqmrKQ9v2++ptln6MKhyrFl1E1OKVihZmh9L2v
   UGBzQQt2TkchqJCnjkt9uFRgTYCT1WY5cjwFPhaKCF6u5ByOD8gPaGxVE
   ACkZGE0VXwBJPzHzSIL6WKNpa4YLHcCLLvK2qdTTVTkjzX/eSv6Mjhv57
   w==;
X-CSE-ConnectionGUID: NUSqOFXITAOujvLY5x2JNw==
X-CSE-MsgGUID: Fkn+r+v6TNm4DbItKhhCAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23629928"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23629928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:05:16 -0700
X-CSE-ConnectionGUID: Lz5JYfl2Tvmiab5oJllMJg==
X-CSE-MsgGUID: p6yoi641STq/+HOpF8hMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="68734006"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2024 08:05:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk3BY-0001Yh-11;
	Fri, 30 Aug 2024 15:05:12 +0000
Date: Fri, 30 Aug 2024 23:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] mm: migrate: add folio_isolate_movable()
Message-ID: <202408302201.tIhFYmep-lkp@intel.com>
References: <20240829145456.2591719-3-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829145456.2591719-3-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-compaction-get-reference-before-non-LRU-movable-folio-isolation/20240829-225715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240829145456.2591719-3-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 2/5] mm: migrate: add folio_isolate_movable()
config: x86_64-randconfig-r072-20240830 (https://download.01.org/0day-ci/archive/20240830/202408302201.tIhFYmep-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302201.tIhFYmep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302201.tIhFYmep-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:70: warning: Function parameter or struct member 'mode' not described in 'folio_isolate_movable'


vim +70 mm/migrate.c

b20a35035f983f Christoph Lameter       2006-03-22   60  
f279eb1601a60e Kefeng Wang             2024-08-29   61  /**
f279eb1601a60e Kefeng Wang             2024-08-29   62   * folio_isolate_movable() - Try to isolate a non-lru movable folio.
f279eb1601a60e Kefeng Wang             2024-08-29   63   * @folio: Folio to isolate.
f279eb1601a60e Kefeng Wang             2024-08-29   64   *
f279eb1601a60e Kefeng Wang             2024-08-29   65   * Must be called with an elevated refcount on the folio.
f279eb1601a60e Kefeng Wang             2024-08-29   66   *
f279eb1601a60e Kefeng Wang             2024-08-29   67   * Return: true if the folio was isolated, false otherwise
f279eb1601a60e Kefeng Wang             2024-08-29   68   */
f279eb1601a60e Kefeng Wang             2024-08-29   69  bool folio_isolate_movable(struct folio *folio, isolate_mode_t mode)
bda807d4445414 Minchan Kim             2016-07-26  @70  {
68f2736a858324 Matthew Wilcox (Oracle  2022-06-07   71) 	const struct movable_operations *mops;
bda807d4445414 Minchan Kim             2016-07-26   72  
f279eb1601a60e Kefeng Wang             2024-08-29   73  	VM_BUG_ON_FOLIO(!folio_ref_count(folio), folio);
f279eb1601a60e Kefeng Wang             2024-08-29   74  
f279eb1601a60e Kefeng Wang             2024-08-29   75  	folio_get(folio);
bda807d4445414 Minchan Kim             2016-07-26   76  
19979497c02a36 Vishal Moola (Oracle    2023-01-30   77) 	if (unlikely(folio_test_slab(folio)))
19979497c02a36 Vishal Moola (Oracle    2023-01-30   78) 		goto out_putfolio;
8b8817630ae800 Vlastimil Babka         2022-11-04   79  	/* Pairs with smp_wmb() in slab freeing, e.g. SLUB's __free_slab() */
8b8817630ae800 Vlastimil Babka         2022-11-04   80  	smp_rmb();
bda807d4445414 Minchan Kim             2016-07-26   81  	/*
f279eb1601a60e Kefeng Wang             2024-08-29   82  	 * Check movable flag before taking the folio lock because
f279eb1601a60e Kefeng Wang             2024-08-29   83  	 * we use non-atomic bitops on newly allocated folio flags so
f279eb1601a60e Kefeng Wang             2024-08-29   84  	 * unconditionally grabbing the lock ruins folio's owner side.
bda807d4445414 Minchan Kim             2016-07-26   85  	 */
19979497c02a36 Vishal Moola (Oracle    2023-01-30   86) 	if (unlikely(!__folio_test_movable(folio)))
19979497c02a36 Vishal Moola (Oracle    2023-01-30   87) 		goto out_putfolio;
8b8817630ae800 Vlastimil Babka         2022-11-04   88  	/* Pairs with smp_wmb() in slab allocation, e.g. SLUB's alloc_slab_page() */
8b8817630ae800 Vlastimil Babka         2022-11-04   89  	smp_rmb();
19979497c02a36 Vishal Moola (Oracle    2023-01-30   90) 	if (unlikely(folio_test_slab(folio)))
19979497c02a36 Vishal Moola (Oracle    2023-01-30   91) 		goto out_putfolio;
8b8817630ae800 Vlastimil Babka         2022-11-04   92  
bda807d4445414 Minchan Kim             2016-07-26   93  	/*
f279eb1601a60e Kefeng Wang             2024-08-29   94  	 * As movable folios are not isolated from LRU lists, concurrent
f279eb1601a60e Kefeng Wang             2024-08-29   95  	 * compaction threads can race against folio migration functions
f279eb1601a60e Kefeng Wang             2024-08-29   96  	 * as well as race against the releasing a folio.
bda807d4445414 Minchan Kim             2016-07-26   97  	 *
f279eb1601a60e Kefeng Wang             2024-08-29   98  	 * In order to avoid having an already isolated movable folio
bda807d4445414 Minchan Kim             2016-07-26   99  	 * being (wrongly) re-isolated while it is under migration,
f279eb1601a60e Kefeng Wang             2024-08-29  100  	 * or to avoid attempting to isolate folios being released,
f279eb1601a60e Kefeng Wang             2024-08-29  101  	 * lets be sure we have the folio lock
f279eb1601a60e Kefeng Wang             2024-08-29  102  	 * before proceeding with the movable folio isolation steps.
bda807d4445414 Minchan Kim             2016-07-26  103  	 */
19979497c02a36 Vishal Moola (Oracle    2023-01-30  104) 	if (unlikely(!folio_trylock(folio)))
19979497c02a36 Vishal Moola (Oracle    2023-01-30  105) 		goto out_putfolio;
bda807d4445414 Minchan Kim             2016-07-26  106  
19979497c02a36 Vishal Moola (Oracle    2023-01-30  107) 	if (!folio_test_movable(folio) || folio_test_isolated(folio))
bda807d4445414 Minchan Kim             2016-07-26  108  		goto out_no_isolated;
bda807d4445414 Minchan Kim             2016-07-26  109  
19979497c02a36 Vishal Moola (Oracle    2023-01-30  110) 	mops = folio_movable_ops(folio);
19979497c02a36 Vishal Moola (Oracle    2023-01-30  111) 	VM_BUG_ON_FOLIO(!mops, folio);
bda807d4445414 Minchan Kim             2016-07-26  112  
19979497c02a36 Vishal Moola (Oracle    2023-01-30  113) 	if (!mops->isolate_page(&folio->page, mode))
bda807d4445414 Minchan Kim             2016-07-26  114  		goto out_no_isolated;
bda807d4445414 Minchan Kim             2016-07-26  115  
4dc7d37370951f Matthew Wilcox (Oracle  2024-03-26  116) 	/* Driver shouldn't use the isolated flag */
19979497c02a36 Vishal Moola (Oracle    2023-01-30  117) 	WARN_ON_ONCE(folio_test_isolated(folio));
19979497c02a36 Vishal Moola (Oracle    2023-01-30  118) 	folio_set_isolated(folio);
19979497c02a36 Vishal Moola (Oracle    2023-01-30  119) 	folio_unlock(folio);
bda807d4445414 Minchan Kim             2016-07-26  120  
cd7755800eb54e Baolin Wang             2023-02-15  121  	return true;
bda807d4445414 Minchan Kim             2016-07-26  122  
bda807d4445414 Minchan Kim             2016-07-26  123  out_no_isolated:
19979497c02a36 Vishal Moola (Oracle    2023-01-30  124) 	folio_unlock(folio);
19979497c02a36 Vishal Moola (Oracle    2023-01-30  125) out_putfolio:
19979497c02a36 Vishal Moola (Oracle    2023-01-30  126) 	folio_put(folio);
cd7755800eb54e Baolin Wang             2023-02-15  127  	return false;
bda807d4445414 Minchan Kim             2016-07-26  128  }
bda807d4445414 Minchan Kim             2016-07-26  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
