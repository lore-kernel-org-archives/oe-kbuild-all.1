Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A371168C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690633876; x=1722169876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+NUSGuQg+uKrVjdmfToMCLrVkM+9aTL5nrC06mq314=;
  b=W7gaLbhKMceloOhznEKSZdTaV64AjdJDhpVLPsvAVfioX/d9of4dd0SD
   Al/axXkbIVoa+ApIBDXUvkAE4WRuK4nVwCiUHKfp8z9fS482c1z6ekLet
   yj43nTlIrmxCUne+TQjjjOrqjtaOznl9Npg5Lw1OoMdVSQv0DJ40PWuKx
   acLVtjWEnV5wurEcRCmTkJ+rw6rXFn6I0bJ2x6SEgU5ZG55ODFOZPLeue
   RzNQ5LnsRRy02P4tOQNb9SbrytQC0QGl9Uy37tkyF+bw+V/+GPwLoIotK
   L5QfOyAftvMUCM28gLCg2++QNJcGCR8XIYGkKSy/gEk/SB9SLxZRNg03h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="399701589"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="399701589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 05:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="901587878"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="901587878"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Jul 2023 05:31:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPj69-000423-1R;
	Sat, 29 Jul 2023 12:31:06 +0000
Date: Sat, 29 Jul 2023 20:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:iavf-pp-frag 11/28] net/core/page_pool.c:582:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202307292029.cFz0s8Hh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux iavf-pp-frag
head:   0eccfd667ed84b425dc0c48eab06b0cb1d5fd8c4
commit: 67f0169041f76c28d399c2a63947e33a1ae1210d [11/28] page_pool: add a lockdep check for recycling in hardirq
config: loongarch-randconfig-r072-20230728 (https://download.01.org/0day-ci/archive/20230729/202307292029.cFz0s8Hh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307292029.cFz0s8Hh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307292029.cFz0s8Hh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:582:9: sparse:     expected void *ptr
   net/core/page_pool.c:582:9: sparse:     got int [noderef] __percpu *

vim +582 net/core/page_pool.c

   571	
   572	/* If the page refcnt == 1, this will try to recycle the page.
   573	 * if pool->dma_sync_act is set, we'll try to sync the DMA area for
   574	 * the configured size min(dma_sync_size, pool->max_len).
   575	 * If the page refcnt != 1, then the page will be returned to memory
   576	 * subsystem.
   577	 */
   578	static __always_inline struct page *
   579	__page_pool_put_page(struct page_pool *pool, struct page *page,
   580			     unsigned int dma_sync_size, bool allow_direct)
   581	{
 > 582		lockdep_assert_no_hardirq();
   583	
   584		/* This allocator is optimized for the XDP mode that uses
   585		 * one-frame-per-page, but have fallbacks that act like the
   586		 * regular page allocator APIs.
   587		 *
   588		 * refcnt == 1 means page_pool owns page, and can recycle it.
   589		 *
   590		 * page is NOT reusable when allocated when system is under
   591		 * some pressure. (page_is_pfmemalloc)
   592		 */
   593		if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
   594			/* Read barrier done in page_ref_count / READ_ONCE */
   595	
   596			if (pool->dma_sync_act == PP_DMA_SYNC_ACT_DO)
   597				page_pool_dma_sync_for_device(pool, page,
   598							      dma_sync_size);
   599	
   600			if (allow_direct && in_softirq() &&
   601			    page_pool_recycle_in_cache(page, pool))
   602				return NULL;
   603	
   604			/* Page found as candidate for recycling */
   605			return page;
   606		}
   607		/* Fallback/non-XDP mode: API user have elevated refcnt.
   608		 *
   609		 * Many drivers split up the page into fragments, and some
   610		 * want to keep doing this to save memory and do refcnt based
   611		 * recycling. Support this use case too, to ease drivers
   612		 * switching between XDP/non-XDP.
   613		 *
   614		 * In-case page_pool maintains the DMA mapping, API user must
   615		 * call page_pool_put_page once.  In this elevated refcnt
   616		 * case, the DMA is unmapped/released, as driver is likely
   617		 * doing refcnt based recycle tricks, meaning another process
   618		 * will be invoking put_page.
   619		 */
   620		recycle_stat_inc(pool, released_refcnt);
   621		page_pool_return_page(pool, page);
   622	
   623		return NULL;
   624	}
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
