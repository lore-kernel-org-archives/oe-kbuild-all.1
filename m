Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B95AD27
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 12:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692793982; x=1724329982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIaqM6EzG3aL6OUaNlDo8V61TCtEQewiHoF0BLsxDlU=;
  b=IJX64e+PTxlWyxlwwW6OFcSowtJ/i4/bzgQrlF7mf1qn5ZJRPoH739zh
   QquxFQBayzRK60nqL4K+BwFIk1iMvVT00Sz3Ga2EuzdY0fiC3oXrq3Axx
   byAqT9XiwY42KxI5WCabuikFXF9/2EWg0PV16OpxfaOa79qQFmm4K5Tla
   gkNggWO09yPu+1h/9IPbCsx0tq1ZMoV0kkCpXnQUrh8D3RaPnMhfpNE7m
   a5LeaZYU0d7I0IiIvYMVlQ6etnb32xd+LjduJfSYc7CNcx5a09UylIPKT
   mKHtscmITTPJH8X2vJW2dbKNDcHGk6Oi/SiacdZMJefsOdU4fPZUIalJ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="353697913"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353697913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="739762318"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739762318"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 05:32:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYn2f-0001Bu-14;
	Wed, 23 Aug 2023 12:32:57 +0000
Date: Wed, 23 Aug 2023 20:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 11808/12208] drivers/dma/fsl-edma-main.c:61:16:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202308232055.9pzSbqTs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 72f5801a4e2b7122ed8ff5672ea965a0b3458e6b [11808/12208] dmaengine: fsl-edma: integrate v3 support
config: openrisc-randconfig-r122-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232055.9pzSbqTs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232055.9pzSbqTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232055.9pzSbqTs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-main.c:61:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-main.c:65:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +61 drivers/dma/fsl-edma-main.c

    55	
    56	static irqreturn_t fsl_edma3_tx_handler(int irq, void *dev_id)
    57	{
    58		struct fsl_edma_chan *fsl_chan = dev_id;
    59		unsigned int intr;
    60	
  > 61		intr = edma_readl_chreg(fsl_chan, ch_int);
    62		if (!intr)
    63			return IRQ_HANDLED;
    64	
    65		edma_writel_chreg(fsl_chan, 1, ch_int);
    66	
    67		fsl_edma_tx_chan_handler(fsl_chan);
    68	
    69		return IRQ_HANDLED;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
