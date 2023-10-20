Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0F647
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhYJTiHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697767384; x=1729303384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIvutPSGn0Es/HXfmWR46UGGmV2mZUmVOEeJB/9aZIo=;
  b=lhYJTiHTSGjaArlG4Dix0DHHBjscOBtDdisODwBWBY9cf+nnbB4epSwL
   QPAgSwvwJgX+xAHa+/GKy/VSTdYcIvL+7ASgyB8DnRJzbPSeyd+4pKKNE
   kbalL1ZVbBKwjH2wouRiwDeofO+s4Cc7xBw/NNg+nddF+49eX9B+y7W+H
   7oVUH1YbqCTnqB+PzMoMbarYLHnzy2ejWTBzWZD96C5gd1IQevxwiitBQ
   yiNayjRZGPmDxYf0ETRROGgA31+st/1Q03pqTxmrc6si9v50qVblru7iQ
   rdiEdmwlELvCmv//LQlTPp/y8Cx0kvInth5zIySA+aLJwEEyS4R6TdIET
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383626518"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="383626518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 19:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5226358"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 19:02:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qteqU-0002qn-2p;
	Fri, 20 Oct 2023 02:02:38 +0000
Date: Fri, 20 Oct 2023 10:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [pinchartl-media:muxed/2022.2/base 490/740]
 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:47: warning: 'sprintf' may
 write a terminating nul past the end of the destination
Message-ID: <202310200916.v1650Vqb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 01fee54ce6a611d5d65a5fc081dad522a0376f95 [490/740] net: xilinx: Move Xilinx TSN to staging
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231020/202310200916.v1650Vqb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200916.v1650Vqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200916.v1650Vqb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c: In function 'axienet_tadma_open':
>> drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:47: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     284 |                 sprintf(irq_name, "%s_tadma_tx", ndev->name);
         |                                               ^
   drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:284:17: note: 'sprintf' output between 10 and 25 bytes into a destination of size 24
     284 |                 sprintf(irq_name, "%s_tadma_tx", ndev->name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +284 drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c

356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  274  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  275  int axienet_tadma_open(struct net_device *ndev)
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  276  {
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  277  	struct axienet_local *lp = netdev_priv(ndev);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  278  	u32 cr;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  279  	u8 i = 0;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  280  	int ret;
8334a26b2731a0 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  281  	static char irq_name[24];
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  282  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  283  	if (lp->tadma_irq) {
8334a26b2731a0 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04 @284  		sprintf(irq_name, "%s_tadma_tx", ndev->name);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  285  		ret = request_irq(lp->tadma_irq, tadma_irq, IRQF_SHARED,
8334a26b2731a0 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  286  				  irq_name, ndev);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  287  		if (ret)
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  288  			return ret;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  289  	}
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  290  	pr_debug("%s TADMA irq %d\n", __func__, lp->tadma_irq);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  291  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  292  	/* enable all interrupts */
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  293  	tadma_iow(lp, XTADMA_INT_EN_OFFSET, XTADMA_FFI_INT_EN |
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  294  		  XTADMA_IE_INT_EN);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  295  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  296  	tadma_sfm_init(ndev);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  297  	tadma_sfm_hash_init(ndev);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  298  	cr = XTADMA_CFG_DONE;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  299  	tadma_iow(lp, XTADMA_CR_OFFSET, cr);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  300  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  301  	lp->tx_bd = kmalloc_array(lp->num_streams, sizeof(struct axitadma_bd *),
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  302  				  GFP_KERNEL);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  303  	if (!lp->tx_bd)
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  304  		ret = -ENOMEM;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  305  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  306  	for (i = 0; i < lp->num_streams ; i++) {
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  307  		lp->tx_bd_head[i] = 0;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  308  		lp->tx_bd_tail[i] = 0;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  309  		lp->tx_bd_rd[i] = 0;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  310  		lp->tx_bd[i] = kmalloc_array(lp->num_tadma_buffers,
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  311  					     sizeof(*lp->tx_bd[i]), GFP_KERNEL);
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  312  		if (!lp->tx_bd[i])
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  313  			return -ENOMEM;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  314  	}
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  315  
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  316  	return ret;
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  317  }
356b1ffdf37c11 drivers/net/ethernet/xilinx/xilinx_tsn_tadma.c Pranavi Somisetty 2022-04-04  318  

:::::: The code at line 284 was first introduced by commit
:::::: 8334a26b2731a0e0fe14d245ae2d4fbd5a65cfcb net: xilinx: Change irq name with details

:::::: TO: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
