Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A91CF9C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyPfxHdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700493138; x=1732029138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rRiHwCqfPQ+HW6oT31nkq0jAvdSuVL9iRus2OaFgP8=;
  b=VyPfxHdb9/norBx+Cf1HSouAhZLLzVaPmaLjSJIof6Fowy2usKrq2hf8
   vbxX2aQPiFd8hbANZ8uVfeJIPgfa3eBZDE8iA8OFfV1PHVcVxJesu55kH
   2xh7quxm9c693nGko2saMEjKB35CjrXr93Fpecncv8/ixWSvkxX5Qyq4g
   itWhNykvZmOppdbO8f49X8HJDHPJB9hoAxb+ndqWnlu+UPgRZsY7K4qsd
   2AsbaovYOwCIcUDi7YIwhhPACtX0eA3JCrwoPgGqKyvTrZ7Wh+Dv8QSA8
   bo338YKj1axHMr4rhuMUtwPpjtyZxAh+qwZpjmJViX0gLt9AJ/Wp6KlP6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376671001"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="376671001"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 07:04:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="836752354"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="836752354"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2023 07:04:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r55om-0006YK-2D;
	Mon, 20 Nov 2023 15:04:29 +0000
Date: Mon, 20 Nov 2023 22:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 4/8] kernel/dma/mapping.c:121:16: warning:
 returning 'int' from a function with return type 'const struct dma_map_ops
 *' makes pointer from integer without a cast
Message-ID: <202311202204.RhwpIRmW-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231120/202311202204.RhwpIRmW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202204.RhwpIRmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202204.RhwpIRmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/dma/mapping.c: In function 'get_dma_ops':
   kernel/dma/mapping.c:121:16: error: implicit declaration of function 'get_arch_dma_ops'; did you mean 'get_dma_ops'? [-Werror=implicit-function-declaration]
     121 |         return get_arch_dma_ops();
         |                ^~~~~~~~~~~~~~~~
         |                get_dma_ops
>> kernel/dma/mapping.c:121:16: warning: returning 'int' from a function with return type 'const struct dma_map_ops *' makes pointer from integer without a cast [-Wint-conversion]
     121 |         return get_arch_dma_ops();
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   kernel/dma/ops_helpers.c: In function 'dma_common_alloc_pages':
   kernel/dma/ops_helpers.c:64:41: error: implicit declaration of function 'get_dma_ops'; did you mean 'set_dma_ops'? [-Werror=implicit-function-declaration]
      64 |         const struct dma_map_ops *ops = get_dma_ops(dev);
         |                                         ^~~~~~~~~~~
         |                                         set_dma_ops
>> kernel/dma/ops_helpers.c:64:41: warning: initialization of 'const struct dma_map_ops *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   kernel/dma/ops_helpers.c: In function 'dma_common_free_pages':
   kernel/dma/ops_helpers.c:87:41: warning: initialization of 'const struct dma_map_ops *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      87 |         const struct dma_map_ops *ops = get_dma_ops(dev);
         |                                         ^~~~~~~~~~~
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
