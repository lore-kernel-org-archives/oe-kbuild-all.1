Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EBC1DA29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lgl6LZre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700495979; x=1732031979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ql+X1xcrWcq5qny4Cv83cC5hSBgrcVcnLMJvg6juzo=;
  b=Lgl6LZrevlOg0zsEnfFa/ZEuxVTxjS36J9U8zEwV7uhMCsQRfCD/d9ef
   00vj0iSaCI5I+i7QvvJUPyHoVW+vSTOY/N47QRNZ3KcDiahho5RdRihmh
   7+lsoyV+kv5ElfTr+1VafhwI1Wojsu/XpH3cVYkJLzqjJefM2J9+JFvDB
   3DOeROovTfsFtolAnFA89xTSUpWNfFdl8aK0DumtcEKSVKrl2ZhDNJK0h
   Qm3IPiLddJGaNRVZgnDZJLRjdQ8k4nuL9L8vnvJgCqYDEgIER2HGAQZfj
   AnHiO8HEZg59BuU2/bmmL6E3kf8lLoWFJ0mU19vjVQS0OULhX9zUmj6/a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455972495"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455972495"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 07:59:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759816694"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="759816694"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Nov 2023 07:59:16 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r56g6-0006cN-07;
	Mon, 20 Nov 2023 15:59:14 +0000
Date: Mon, 20 Nov 2023 23:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 4/8] kernel/dma/mapping.c:121:16: error:
 implicit declaration of function 'get_arch_dma_ops'; did you mean
 'get_dma_ops'?
Message-ID: <202311202352.AhE0snwU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-ops-cleanup
head:   5ab735c803b75be08ec98ef185b2df10bf41475a
commit: 5b95bda81e5c3a8365de492b8bb19a65591c5df4 [4/8] dma-mapping: make get_dma_ops private
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231120/202311202352.AhE0snwU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202352.AhE0snwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202352.AhE0snwU-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/mapping.c: In function 'get_dma_ops':
>> kernel/dma/mapping.c:121:16: error: implicit declaration of function 'get_arch_dma_ops'; did you mean 'get_dma_ops'? [-Werror=implicit-function-declaration]
     121 |         return get_arch_dma_ops();
         |                ^~~~~~~~~~~~~~~~
         |                get_dma_ops
   kernel/dma/mapping.c:121:16: warning: returning 'int' from a function with return type 'const struct dma_map_ops *' makes pointer from integer without a cast [-Wint-conversion]
     121 |         return get_arch_dma_ops();
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   kernel/dma/ops_helpers.c: In function 'dma_common_alloc_pages':
>> kernel/dma/ops_helpers.c:64:41: error: implicit declaration of function 'get_dma_ops'; did you mean 'set_dma_ops'? [-Werror=implicit-function-declaration]
      64 |         const struct dma_map_ops *ops = get_dma_ops(dev);
         |                                         ^~~~~~~~~~~
         |                                         set_dma_ops
   kernel/dma/ops_helpers.c:64:41: warning: initialization of 'const struct dma_map_ops *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/dma/ops_helpers.c: In function 'dma_common_free_pages':
   kernel/dma/ops_helpers.c:87:41: warning: initialization of 'const struct dma_map_ops *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      87 |         const struct dma_map_ops *ops = get_dma_ops(dev);
         |                                         ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/core/memalloc.c: In function 'snd_dma_noncontig_alloc':
>> sound/core/memalloc.c:551:22: error: implicit declaration of function 'get_dma_ops'; did you mean 'set_dma_ops'? [-Werror=implicit-function-declaration]
     551 |         if (!sgt && !get_dma_ops(dmab->dev.dev))
         |                      ^~~~~~~~~~~
         |                      set_dma_ops
   cc1: some warnings being treated as errors


vim +121 kernel/dma/mapping.c

   115	
   116	#ifdef CONFIG_DMA_OPS
   117	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
   118	{
   119		if (dev->dma_ops)
   120			return dev->dma_ops;
 > 121		return get_arch_dma_ops();
   122	}
   123	#else /* CONFIG_DMA_OPS */
   124	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
   125	{
   126		return NULL;
   127	}
   128	#endif /* CONFIG_DMA_OPS */
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
