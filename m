Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AC3717D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liLVuqC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700553581; x=1732089581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEG/sUCNe48thMIn2HOQWaEYYAm0KILQn7ampQCdmKc=;
  b=liLVuqC6jO/DOIOUSzSrjwX16CZ3+mZp8sU+Mug9szjqBrY+N3h1Djgz
   qIrRSPWaEMmZRtok4zyNeYJNsR606/+ISPoN8DcUy6zDs/PyutcanT13j
   Wn0y96aufiSDmgo6qwJc7dLYQnZO9HCLsyV/ZZ/KA7ToW2y6FnO13vB0l
   sR9CZCImi4i6WQU9SCbPu4vFLII+0H9NIWEyvOA8Ib6YBpakYkbXa7G4m
   W6HIU7zf793n7PPLGhxGTifxOVapG3TYJdBM05BPAkpDAx3S82HECQj6+
   iX/W6C3LFJ02bzFHSWU4/eOPPxCKY4r1l/U0sFji1jyBqb73g3V7TpST0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376825090"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="376825090"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="884107571"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="884107571"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2023 23:59:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5LfI-0007XF-2f;
	Tue, 21 Nov 2023 07:59:26 +0000
Date: Tue, 21 Nov 2023 15:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 5/9] kernel/dma/internal.h:9:9: error:
 call to undeclared function 'get_arch_dma_ops'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202311211517.s1yjhkv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-ops-cleanup
head:   d8fcdc454323681baeaac55ec59813cf5cfeacd1
commit: f4442615d8658cadb745cfb910e9a4ac6ad95df0 [5/9] dma-mapping: make get_dma_ops private
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231121/202311211517.s1yjhkv2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211517.s1yjhkv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211517.s1yjhkv2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/dma/mapping.c:17:
>> kernel/dma/internal.h:9:9: error: call to undeclared function 'get_arch_dma_ops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return get_arch_dma_ops();
                  ^
   kernel/dma/internal.h:9:9: note: did you mean 'get_dma_ops'?
   kernel/dma/internal.h:5:41: note: 'get_dma_ops' declared here
   static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
                                           ^
>> kernel/dma/internal.h:9:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'const struct dma_map_ops *' [-Wint-conversion]
           return get_arch_dma_ops();
                  ^~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/get_arch_dma_ops +9 kernel/dma/internal.h

     3	
     4	#ifdef CONFIG_DMA_OPS
     5	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
     6	{
     7		if (dev->dma_ops)
     8			return dev->dma_ops;
   > 9		return get_arch_dma_ops();
    10	}
    11	#else /* CONFIG_DMA_OPS */
    12	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
    13	{
    14		return NULL;
    15	}
    16	#endif /* CONFIG_DMA_OPS */
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
