Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F1BC2E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692821992; x=1724357992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F251hmYGt0k5zWMGlSFS/3YBOtt4noy+EKrbABt3+ig=;
  b=WVCbNxqbFSI5rER1EGtMRhh7be8aW1r0VlxaLoxNj1SlhN5EgBim8sCQ
   FsXJ4lNlus54iFv1Fzv5H+Yx35Sjyk2BH8oU9M0SnImrGmkx7k28JTv3x
   HwOP8IG+KyxSl5hh8LttPL/xST93Ml7QzprPoafgozm797ugNKRTX+rMf
   nGdYnNIdMG+7D3GJU1K3Gxxpn4V1IOgafg26IscOsK4HRNayF2N6MH5dO
   HtgFnKCnjlpvEbOD4qKPSpwZHGn4n1QggSl8fN+qa7mo9DuvMYDR9RD1e
   LKkKuEC4uBZKcaLNAj75RZUsdE3LFP+JN8eoI0PX77LXWWu/8B3Lpirk4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440616824"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="440616824"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 13:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="713714667"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="713714667"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 13:19:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYuKT-0001Tw-1W;
	Wed, 23 Aug 2023 20:19:49 +0000
Date: Thu, 24 Aug 2023 04:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [niks:b4/dma_iommu 6/7] drivers/iommu/dma-iommu.c:634: warning:
 Function parameter or member 'options' not described in
 'iommu_dma_init_options'
Message-ID: <202308240436.hJRYxn7l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git b4/dma_iommu
head:   dbaa0265129b05dab98085a5dca03f761e5cca87
commit: b2aab2ebe399b871f5c8732bd5b6ee4ec268f21d [6/7] iommu/dma: Allow a single FQ in addition to per-CPU FQs
config: i386-randconfig-r035-20230824 (https://download.01.org/0day-ci/archive/20230824/202308240436.hJRYxn7l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240436.hJRYxn7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240436.hJRYxn7l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:634: warning: Function parameter or member 'options' not described in 'iommu_dma_init_options'
>> drivers/iommu/dma-iommu.c:634: warning: Excess function parameter 'cookie' description in 'iommu_dma_init_options'


vim +634 drivers/iommu/dma-iommu.c

   624	
   625	/**
   626	 * iommu_dma_init_options - Initialize dma-iommu options
   627	 * @cookie: The cookie containing the options
   628	 * @dev: Device the options are set for
   629	 *
   630	 * This allows tuning dma-iommu specific to device properties
   631	 */
   632	static void iommu_dma_init_options(struct iommu_dma_options *options,
   633					   struct device *dev)
 > 634	{
   635		/* Shadowing IOTLB flushes do better with a single queue */
   636		if (dev->iommu->shadow_on_flush)
   637			options->flags = IOMMU_DMA_OPTS_SINGLE_QUEUE;
   638		else
   639			options->flags = IOMMU_DMA_OPTS_PER_CPU_QUEUE;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
