Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E5A943
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693567899; x=1725103899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewRhKRd8of7WqrLuWgh2F8OG8R2VyjHSRIxJ+dHAgtU=;
  b=CcDVe4GXyHaEVDaveadJOIb0Lm5Qxt5EU4ihL7NGd9VoKkgtQVbjxF2j
   GIo2ESO2OWj9PyXjmStJ2vVj+oZGhkaSOgySl4EpEE79a4gt7p6xH0new
   YSnzCc6otE7h0/uRbR400hrjJoYUg+ffH/kWq6cP+KzBJiTD8Qd7bOWBI
   WvPCddJ3GwgE0DdL/XvEemHaqO1zBvdGinCHOxqJXcqDtggarOrjtleTj
   V3D89jRO0qtBamxOox6C44zzdiWpUGG3T4Ujz0k9sZAKcmwNyRQqOl2iD
   gKsIy9Gk02j8TqhhS8PFG79MK4rjAf2r6xYFWbU/YRu6gAyEajKmleCUj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366426885"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366426885"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863515081"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="863515081"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 04:31:36 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc2NC-0001Ex-1L;
	Fri, 01 Sep 2023 11:31:34 +0000
Date: Fri, 1 Sep 2023 19:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 11548/13643] drivers/dma/fsl-edma-main.c:61:16:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202309011955.2X7I4ybQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a47fc304d2b678db1a5d760a7d644dac9b067752
commit: 72f5801a4e2b7122ed8ff5672ea965a0b3458e6b [11548/13643] dmaengine: fsl-edma: integrate v3 support
config: i386-randconfig-061-20230901 (https://download.01.org/0day-ci/archive/20230901/202309011955.2X7I4ybQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011955.2X7I4ybQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011955.2X7I4ybQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-main.c:61:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-main.c:65:9: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/dma/fsl-edma-common.c:76:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:98:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:100:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:125:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:131:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression

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
