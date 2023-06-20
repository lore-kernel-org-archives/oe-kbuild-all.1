Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2A516408
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 22:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687299403; x=1718835403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5ytV2NhlftHy/Hr+IBNI+k132FUiBQCtiI0uKcuI6k=;
  b=JZsIV6ZRKUifksKirOskmfJntKBIybRiUNuLrzwE4EnT4UA9/qwaIvHh
   cks42MJ1JtkLg9DD4W5hnGcEuUbPXXdssXzSZZMuFCZr2xFAKZnXfI4PM
   6v0SF3h+n62SY3zbJLcHTGZyG120XHewGOIe4EZD4qr8lNoDxvEKe5jXt
   iEN9Bj9m6or7wqiN5BdaQQFF1s1vQXSujiT0Ex77pprwL9j36s2Hgd1HF
   XdqvGKtEdvNCpFZhKi+oTWKhNpQou71My66lj1chAvhz0gS4Tjuhl5WTp
   7fXy/yYNt+73Y/cvZd1RO8cx8gk5PArQQIFyA9lBemn5h5WCAHTiVU5MA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362540136"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="362540136"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 15:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="664410525"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="664410525"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jun 2023 15:16:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBjeS-0006I0-1w;
	Tue, 20 Jun 2023 22:16:40 +0000
Date: Wed, 21 Jun 2023 06:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh7100-dmapool 5/39]
 arch/powerpc/mm/dma-noncoherent.c:115:22: error: 'start' undeclared; did you
 mean 'stat'?
Message-ID: <202306210647.7cHkp3Ve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7100-dmapool
head:   41d6f3f3b3698aab55a40592597677c448a7093a
commit: 169d9ab35987ec99d047510fecf9a01d6e4d5690 [5/39] powerpc: dma-mapping: split out cache operation logic
config: powerpc-randconfig-r013-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210647.7cHkp3Ve-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210647.7cHkp3Ve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210647.7cHkp3Ve-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/mm/dma-noncoherent.c: In function 'arch_sync_dma_for_device':
   arch/powerpc/mm/dma-noncoherent.c:107:17: error: 'direction' undeclared (first use in this function); did you mean 'irqaction'?
     107 |         switch (direction) {
         |                 ^~~~~~~~~
         |                 irqaction
   arch/powerpc/mm/dma-noncoherent.c:107:17: note: each undeclared identifier is reported only once for each function it appears in
>> arch/powerpc/mm/dma-noncoherent.c:115:22: error: 'start' undeclared (first use in this function); did you mean 'stat'?
     115 |                 if ((start | end) & (L1_CACHE_BYTES - 1))
         |                      ^~~~~
         |                      stat
>> arch/powerpc/mm/dma-noncoherent.c:115:30: error: 'end' undeclared (first use in this function)
     115 |                 if ((start | end) & (L1_CACHE_BYTES - 1))
         |                              ^~~
   arch/powerpc/mm/dma-noncoherent.c: In function 'arch_sync_dma_for_cpu':
   arch/powerpc/mm/dma-noncoherent.c:132:17: error: 'direction' undeclared (first use in this function); did you mean 'irqaction'?
     132 |         switch (direction) {
         |                 ^~~~~~~~~
         |                 irqaction
   arch/powerpc/mm/dma-noncoherent.c:140:22: error: 'start' undeclared (first use in this function); did you mean 'stat'?
     140 |                 if ((start | end) & (L1_CACHE_BYTES - 1))
         |                      ^~~~~
         |                      stat
   arch/powerpc/mm/dma-noncoherent.c:140:30: error: 'end' undeclared (first use in this function)
     140 |                 if ((start | end) & (L1_CACHE_BYTES - 1))
         |                              ^~~


vim +115 arch/powerpc/mm/dma-noncoherent.c

   103	
   104	void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
   105			enum dma_data_direction dir)
   106	{
 > 107		switch (direction) {
   108		case DMA_NONE:
   109			BUG();
   110		case DMA_FROM_DEVICE:
   111			/*
   112			 * invalidate only when cache-line aligned otherwise there is
   113			 * the potential for discarding uncommitted data from the cache
   114			 */
 > 115			if ((start | end) & (L1_CACHE_BYTES - 1))
   116				__dma_phys_op(start, end, DMA_CACHE_FLUSH);
   117			else
   118				__dma_phys_op(start, end, DMA_CACHE_INVAL);
   119			break;
   120		case DMA_TO_DEVICE:		/* writeback only */
   121			__dma_phys_op(start, end, DMA_CACHE_CLEAN);
   122			break;
   123		case DMA_BIDIRECTIONAL:	/* writeback and invalidate */
   124			__dma_phys_op(start, end, DMA_CACHE_FLUSH);
   125			break;
   126		}
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
