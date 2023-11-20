Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486B328DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ1mzCVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700514172; x=1732050172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VoFtH2kcsj0ePOBsQ89kt6UacoKbvGVw9dS2wF18lCg=;
  b=HQ1mzCVDxfXHTR4B484SKL3iYCfBWue9WJ9zH4rcgADUtGQT1BzFAwxG
   3fgE6fwWNpyluACOyAsVcbCtwlcCOo+T9WfPvtd9AnC6+9keTdKOhawB+
   FGbuDhGAjzUELVTtUdIkjC7fcaeHMjZerXY8OnBq/2+0wMAfGTWFPSBAK
   1n06fBN0jymJ4xMCjQ913wytASomYfeu4keCBVle2jEHoZHpvjUNAs9IG
   gCxVOEE6dvs8MLgF1eWSdeiJLtusbMaYaPaoLP/Sel55bWtIi9H/qMwhb
   7m4YqGLomEHDQ4DpzQW+vTQBTvbjrtsHnoUCLTtIJ9DfaLcGUJ3rlorKD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388855643"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="388855643"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759889922"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="759889922"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Nov 2023 13:02:49 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BPp-0006vJ-1R;
	Mon, 20 Nov 2023 21:02:46 +0000
Date: Tue, 21 Nov 2023 05:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 5/9] kernel/dma/internal.h:9:16: error:
 implicit declaration of function 'get_arch_dma_ops'; did you mean
 'get_dma_ops'?
Message-ID: <202311210457.0sGX6nbS-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231121/202311210457.0sGX6nbS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210457.0sGX6nbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210457.0sGX6nbS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/dma/mapping.c:17:
   kernel/dma/internal.h: In function 'get_dma_ops':
>> kernel/dma/internal.h:9:16: error: implicit declaration of function 'get_arch_dma_ops'; did you mean 'get_dma_ops'? [-Werror=implicit-function-declaration]
       9 |         return get_arch_dma_ops();
         |                ^~~~~~~~~~~~~~~~
         |                get_dma_ops
   kernel/dma/internal.h:9:16: warning: returning 'int' from a function with return type 'const struct dma_map_ops *' makes pointer from integer without a cast [-Wint-conversion]
       9 |         return get_arch_dma_ops();
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +9 kernel/dma/internal.h

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
