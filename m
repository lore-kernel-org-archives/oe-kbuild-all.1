Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2A1EEE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735227643; cv=none; b=tFqZTshHQa78D6xTbrNOqwMkHNdtAjVY/Zt6t4+lorR5F64hMjcxCrFrVVRk8p5mfcNGGAhh7JoUUEJwpNg5NlUd26v/+SNgOU0eXiJd7OVXs2gvC44bpEJESxqqvWFz8eEAkQiJ/xQjZU/HSSfmvalmaglJ53bGJ7KTZdWnICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735227643; c=relaxed/simple;
	bh=BOW5ZjVC9MMMUlSAuqXSuLNcBRlmOHHbL/+5R0ai8II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlkRx4aLCl5oTPipMSFLwGSeEOTstj/hrA6jvfMjnbfv01B3v6Vbr9mOi4LgIMy3ZIjK5OJTNAKQ+LXWjmoqIR0LCVbSUVweaBuaFVlDJsqButo5s+4fml8oI02JrmoC9yKRsqL0B9xVGgEhyiq4sClmFysn7l5c5y93iHoBmh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J98dD1R7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J98dD1R7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735227641; x=1766763641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOW5ZjVC9MMMUlSAuqXSuLNcBRlmOHHbL/+5R0ai8II=;
  b=J98dD1R70vVTIl4NMWRwSmKTk0gb4awCbFccQjwsuAPyyErKFgvuGzAQ
   BlA4/Ix8oGN8R8aIW0mxgf1dkSFJ5x7u4HxPCwHaP71kk24yFTs9HXHLv
   IPCZoXmJGXGddU1UeQ+V5UPjpH4ABHbldtfCcSt0I0TE8HTP9VbuEWJSz
   VM03pFsMwhhxZcmDPznD76WoUX3lMYzJIKPFpNaeAuE5os40qTBYO7Ak4
   URMnK0EvF3cuc87TTZcROy2H7oEgL7qNGjBWKh672wa/2gknpm7BNkDWP
   /m6DropMBgSZeUXgfv2/Q7kUc+xu6iybW3SMGF8K9J6825KJHqrckW3kd
   A==;
X-CSE-ConnectionGUID: jyoJQDQaSVeFaRpOeLJc6g==
X-CSE-MsgGUID: ESeb/PYsQpymjA0+W/lVWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35527777"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35527777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 07:40:35 -0800
X-CSE-ConnectionGUID: ppCHAwcaScylYZCg0spBxQ==
X-CSE-MsgGUID: +HQK7AbAS2yXM7NQEQdVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130938324"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Dec 2024 07:40:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQpyR-0002fM-0w;
	Thu, 26 Dec 2024 15:40:31 +0000
Date: Thu, 26 Dec 2024 23:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1665/1665] net/core/page_pool.c:590:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202412262337.yFvf5ux1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: ff4e538c8c3e675a15e1e49509c55951832e0451 [1665/1665] page_pool: add a lockdep check for recycling in hardirq
config: loongarch-randconfig-r132-20241226 (https://download.01.org/0day-ci/archive/20241226/202412262337.yFvf5ux1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241226/202412262337.yFvf5ux1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412262337.yFvf5ux1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got unsigned int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *
>> net/core/page_pool.c:590:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   net/core/page_pool.c:590:9: sparse:     expected void *ptr
   net/core/page_pool.c:590:9: sparse:     got int [noderef] __percpu *

vim +590 net/core/page_pool.c

   579	
   580	/* If the page refcnt == 1, this will try to recycle the page.
   581	 * if PP_FLAG_DMA_SYNC_DEV is set, we'll try to sync the DMA area for
   582	 * the configured size min(dma_sync_size, pool->max_len).
   583	 * If the page refcnt != 1, then the page will be returned to memory
   584	 * subsystem.
   585	 */
   586	static __always_inline struct page *
   587	__page_pool_put_page(struct page_pool *pool, struct page *page,
   588			     unsigned int dma_sync_size, bool allow_direct)
   589	{
 > 590		lockdep_assert_no_hardirq();
   591	
   592		/* This allocator is optimized for the XDP mode that uses
   593		 * one-frame-per-page, but have fallbacks that act like the
   594		 * regular page allocator APIs.
   595		 *
   596		 * refcnt == 1 means page_pool owns page, and can recycle it.
   597		 *
   598		 * page is NOT reusable when allocated when system is under
   599		 * some pressure. (page_is_pfmemalloc)
   600		 */
   601		if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
   602			/* Read barrier done in page_ref_count / READ_ONCE */
   603	
   604			if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
   605				page_pool_dma_sync_for_device(pool, page,
   606							      dma_sync_size);
   607	
   608			if (allow_direct && in_softirq() &&
   609			    page_pool_recycle_in_cache(page, pool))
   610				return NULL;
   611	
   612			/* Page found as candidate for recycling */
   613			return page;
   614		}
   615		/* Fallback/non-XDP mode: API user have elevated refcnt.
   616		 *
   617		 * Many drivers split up the page into fragments, and some
   618		 * want to keep doing this to save memory and do refcnt based
   619		 * recycling. Support this use case too, to ease drivers
   620		 * switching between XDP/non-XDP.
   621		 *
   622		 * In-case page_pool maintains the DMA mapping, API user must
   623		 * call page_pool_put_page once.  In this elevated refcnt
   624		 * case, the DMA is unmapped/released, as driver is likely
   625		 * doing refcnt based recycle tricks, meaning another process
   626		 * will be invoking put_page.
   627		 */
   628		recycle_stat_inc(pool, released_refcnt);
   629		page_pool_return_page(pool, page);
   630	
   631		return NULL;
   632	}
   633	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
