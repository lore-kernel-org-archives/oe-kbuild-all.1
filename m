Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2ABA33
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692789985; x=1724325985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBPJTpYFBNnFSl+YMxACf3oOg1GWvEnicCoN8Xn6i+E=;
  b=QCRp92Hml08sTOvCUGQWNY3iOIDK9+usW8SHjx3+Xkj3VzRtjF1v7Rvz
   dp04Tka3JDoS3KwG1xBGv2sHJxl9B68xUhFwI6tixqtEZGUJuNzF6P34x
   xEU13dakqxSdFgWDL6OyXiaSGDswSdHryUStixkJyVcngVnl3zSK8lDlR
   xaIHjFCcGwusOPjvIRVXVec0XzDiyPgqi4r0k/Qdy1xA5IqXYxJqrCuCA
   zo+H8oAjTlqd09rDhe6FRYHO9pLaU7LqpSAbKyomA7P88IkQ1J1mSYvBD
   GV6b7M7tJOTSrD/ljjYDDnVejwopCi7bfZybw+U8FFqQr8bFT6Z1hcZrR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="376862805"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="376862805"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 04:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983283723"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="983283723"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Aug 2023 04:26:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYm0E-00018h-2A;
	Wed, 23 Aug 2023 11:26:22 +0000
Date: Wed, 23 Aug 2023 19:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 11808/12208] drivers/dma/fsl-edma-common.c:76:15:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202308231917.NfCYTXDO-lkp@intel.com>
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
config: sparc64-randconfig-r121-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231917.NfCYTXDO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231917.NfCYTXDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231917.NfCYTXDO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-common.c:76:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:98:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:100:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:125:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:131:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/fsl-edma-common.c:134:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +76 drivers/dma/fsl-edma-common.c

    70	
    71	static void fsl_edma3_enable_request(struct fsl_edma_chan *fsl_chan)
    72	{
    73		u32 val, flags;
    74	
    75		flags = fsl_edma_drvflags(fsl_chan);
  > 76		val = edma_readl_chreg(fsl_chan, ch_sbr);
    77		/* Remote/local swapped wrongly on iMX8 QM Audio edma */
    78		if (flags & FSL_EDMA_DRV_QUIRK_SWAPPED) {
    79			if (!fsl_chan->is_rxchan)
    80				val |= EDMA_V3_CH_SBR_RD;
    81			else
    82				val |= EDMA_V3_CH_SBR_WR;
    83		} else {
    84			if (fsl_chan->is_rxchan)
    85				val |= EDMA_V3_CH_SBR_RD;
    86			else
    87				val |= EDMA_V3_CH_SBR_WR;
    88		}
    89	
    90		if (fsl_chan->is_remote)
    91			val &= ~(EDMA_V3_CH_SBR_RD | EDMA_V3_CH_SBR_WR);
    92	
    93		edma_writel_chreg(fsl_chan, val, ch_sbr);
    94	
    95		if (flags & FSL_EDMA_DRV_HAS_CHMUX)
    96			edma_writel_chreg(fsl_chan, fsl_chan->srcid, ch_mux);
    97	
    98		val = edma_readl_chreg(fsl_chan, ch_csr);
    99		val |= EDMA_V3_CH_CSR_ERQ;
   100		edma_writel_chreg(fsl_chan, val, ch_csr);
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
