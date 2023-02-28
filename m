Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123242917
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677577049; x=1709113049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Wi6WSNBGinjNSZvGg8obMTQfAnotm6Br1GzPqtCS9E=;
  b=U4xmdno3X9UsfIDCB2jz4iVBwom6yQcquc+/xPAUPH7BTXQQcvXtvvHq
   h934REU2Fgwtfe0P6F9SjCRtIUMoionl5Docv5mD6527ADFoWFZAcEoml
   SvzLS3XeQie1DQAMxBcopGF6EK5R5/ymIrgWDL18c/B36fHktJK1Q/KKf
   nwMZfyn7G8DMfH1GDWaPrCyyY+3n5GuuVpnk7pqChEZWMRShFAmkMQ7fw
   65vuKd5/tR0oDkdfm3B+l/gXd0bqUfdB6wxBIzgY+qT/1vNMG8uBU/oq9
   0sRWs+7lVvli4kMDA9W4K0jeiVRYvAvJRlkYzPHDatR0zKAxObgGsndMG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336383333"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="336383333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 01:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="667388940"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="667388940"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Feb 2023 01:37:27 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWwQI-0005Hc-2R;
	Tue, 28 Feb 2023 09:37:26 +0000
Date: Tue, 28 Feb 2023 17:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 275/583]
 drivers/dma/bcm2835-dma.c:1104:5: warning: no previous prototype for
 'bcm2711_dma40_memcpy_init'
Message-ID: <202302281724.cPlvqOyb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 14255c7d4df1ba22073f31a0baa7a74ec67beaa4 [275/583] bcm2835-dma: Add proper 40-bit DMA support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302281724.cPlvqOyb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/14255c7d4df1ba22073f31a0baa7a74ec67beaa4
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 14255c7d4df1ba22073f31a0baa7a74ec67beaa4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/broadcom/ drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281724.cPlvqOyb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/bcm2835-dma.c:1104:5: warning: no previous prototype for 'bcm2711_dma40_memcpy_init' [-Wmissing-prototypes]
    1104 | int bcm2711_dma40_memcpy_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/bcm2835-dma.c:1119:6: warning: no previous prototype for 'bcm2711_dma40_memcpy' [-Wmissing-prototypes]
    1119 | void bcm2711_dma40_memcpy(dma_addr_t dst, dma_addr_t src, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/bcm2711_dma40_memcpy_init +1104 drivers/dma/bcm2835-dma.c

  1103	
> 1104	int bcm2711_dma40_memcpy_init(void)
  1105	{
  1106		if (!memcpy_parent)
  1107			return -EPROBE_DEFER;
  1108	
  1109		if (!memcpy_chan)
  1110			return -EINVAL;
  1111	
  1112		if (!memcpy_scb)
  1113			return -ENOMEM;
  1114	
  1115		return 0;
  1116	}
  1117	EXPORT_SYMBOL(bcm2711_dma40_memcpy_init);
  1118	
> 1119	void bcm2711_dma40_memcpy(dma_addr_t dst, dma_addr_t src, size_t size)
  1120	{
  1121		struct bcm2711_dma40_scb *scb = memcpy_scb;
  1122		unsigned long flags;
  1123	
  1124		if (!scb) {
  1125			pr_err("bcm2711_dma40_memcpy not initialised!\n");
  1126			return;
  1127		}
  1128	
  1129		spin_lock_irqsave(&memcpy_lock, flags);
  1130	
  1131		scb->ti = 0;
  1132		scb->src = lower_32_bits(src);
  1133		scb->srci = upper_32_bits(src) | BCM2711_DMA40_MEMCPY_XFER_INFO;
  1134		scb->dst = lower_32_bits(dst);
  1135		scb->dsti = upper_32_bits(dst) | BCM2711_DMA40_MEMCPY_XFER_INFO;
  1136		scb->len = size;
  1137		scb->next_cb = 0;
  1138	
  1139		writel((u32)(memcpy_scb_dma >> 5), memcpy_chan + BCM2711_DMA40_CB);
  1140		writel(BCM2711_DMA40_MEMCPY_FLAGS + BCM2711_DMA40_ACTIVE,
  1141		       memcpy_chan + BCM2711_DMA40_CS);
  1142	
  1143		/* Poll for completion */
  1144		while (!(readl(memcpy_chan + BCM2711_DMA40_CS) & BCM2711_DMA40_END))
  1145			cpu_relax();
  1146	
  1147		writel(BCM2711_DMA40_END, memcpy_chan + BCM2711_DMA40_CS);
  1148	
  1149		spin_unlock_irqrestore(&memcpy_lock, flags);
  1150	}
  1151	EXPORT_SYMBOL(bcm2711_dma40_memcpy);
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
