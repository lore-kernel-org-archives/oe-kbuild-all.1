Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328911F601
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgJWDpJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699054314; x=1730590314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9hp/V+bIdyxTG4LoGGDFHA/+wEh1RJKZImbtjZgMXQ=;
  b=TgJWDpJR3Y2XGXrvgDwOQ88/BQvea6BdEKDjpjW5iAzxm7hlIxnX4pGN
   GYt8LlmcyUcPiK1UlYnRxrsTA1oIj0o1uICkL3RoFUryz4Hejr9NQEOPI
   UePMzK/wHjIFlNHSH0q8u8OR8rTEFL/Thtf55oNndMAqWE5dAymZWCTv6
   fuK0yS1ilOJA6+FGtT81/oqsYZMqbYT4XCfOD1O3MJ2iqAAA9JoH8dpCi
   iC1K9ILNhF5C26A14BrkX6YEZIalZF0YrQqSAkSRMLjunMbPPXxAu1Owg
   fizUFB0yZd1wKbjCYObZWP+G+HYPMrSbxHRCMWsL8pOlEtRr4U/PPJ0E2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420156109"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="420156109"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="3066510"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2023 16:31:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz3dP-00033c-11;
	Fri, 03 Nov 2023 23:31:27 +0000
Date: Sat, 4 Nov 2023 07:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ben Levinsky <ben.levinsky@amd.com>
Subject: drivers/remoteproc/xlnx_r5_remoteproc.c:209:20: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202311040724.0CdOhSe6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
commit: 6b291e8020a8bd90e94ee13d61f251040425c90d drivers: remoteproc: Add Xilinx r5 remoteproc driver
date:   11 months ago
config: arm64-randconfig-r122-20231102 (https://download.01.org/0day-ci/archive/20231104/202311040724.0CdOhSe6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040724.0CdOhSe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040724.0CdOhSe6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/xlnx_r5_remoteproc.c:209:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:315:20: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +209 drivers/remoteproc/xlnx_r5_remoteproc.c

   190	
   191	/*
   192	 * zynqmp_r5_mem_region_map()
   193	 * @rproc: single R5 core's corresponding rproc instance
   194	 * @mem: mem descriptor to map reserved memory-regions
   195	 *
   196	 * Callback to map va for memory-region's carveout.
   197	 *
   198	 * return 0 on success, otherwise non-zero value on failure
   199	 */
   200	static int zynqmp_r5_mem_region_map(struct rproc *rproc,
   201					    struct rproc_mem_entry *mem)
   202	{
   203		void __iomem *va;
   204	
   205		va = ioremap_wc(mem->dma, mem->len);
   206		if (IS_ERR_OR_NULL(va))
   207			return -ENOMEM;
   208	
 > 209		mem->va = (void *)va;
   210	
   211		return 0;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
