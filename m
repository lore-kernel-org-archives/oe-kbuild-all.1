Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20874657FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842250; cv=none; b=UR5wGWI0GCC+4xhBV1V7ZrhnMMfc77C45PM5k0vcjy1mWoHMJAiLXcncP/rI1EjK5g8P5PZYtWVMX5zuiP6ZCiLa8a71VUcCZaANiRttL3YXzMria6aBEJPC6weKgRoT44XjrZtpoMgSH0riqlqFyit4n+8qhn3ysL69f/J9R64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842250; c=relaxed/simple;
	bh=95mtzC4ffnqI9DhN038KzpLywOESOd+fkKil89mE2qI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=juV8EVWPjaOLvwG7jHJy8NMPm1aciLrPvOvEb0+HCwrV8rYve2K4u0WMNqT1SurBcGYlaUjZPE9wCgMOK3wS9TutorW+E1nPfmPkbqJxx3HwYnf6sAh4kf5OLSw7+iF2OkXg0bDNEETlF7EOS2DjI4pcFaFQoMbBDSRVAGoKFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtyeCWKa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtyeCWKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778842248; x=1810378248;
  h=date:from:to:cc:subject:message-id;
  bh=95mtzC4ffnqI9DhN038KzpLywOESOd+fkKil89mE2qI=;
  b=VtyeCWKa0tHpobwniuqEnBeiq5IhwaiNO3gi15bMHjBy2GCS1ydxY0hl
   y0uo59dmPR4MVWvxB3aNcr4/gnSY3pY43NcC1b98gC8Ml30GsbjmeZ68q
   oVpcPN1VCySfi0u0/WdeMq612ocDxW7js9G7H06M0pNXzF4i8ujEXrE3g
   iYBPktdBXKBe0JexvIh6UsETB8kjTLHqii0D+mY8K/JG5tJysy4YR+hXF
   V0JUnC+r7dXkIdBA22uR++hHTT6sWUpVirHZNq6Sle5nYcbrBvyLkAlEc
   yJ/4w2t1wziom/H0e/9oPxldFVAptr/fLy2AJc17w90BIaRzBfRTACmYQ
   w==;
X-CSE-ConnectionGUID: nXkLqYmOT6SnM8zPBfBVxQ==
X-CSE-MsgGUID: 7i4y/MhSQV6q89Ah0AWYvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91179999"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="91179999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:50:48 -0700
X-CSE-ConnectionGUID: DWh/yU33Q4aReS/4ske4UQ==
X-CSE-MsgGUID: /s3SjZJhQyuvN7rJk7buFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="236024371"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2026 03:50:44 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNq7H-000000001OZ-2IZq;
	Fri, 15 May 2026 10:50:25 +0000
Date: Fri, 15 May 2026 18:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 189/870]
 drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:95:39: warning: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 between 7 and 22
Message-ID: <202605151815.bDmF3oW7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: a6c27ed71f72afd88420af3b21f61cb96591ee16 [189/870] staging: net: xilinx: add Xilinx TSN driver
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151815.bDmF3oW7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151815.bDmF3oW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151815.bDmF3oW7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c: In function 'tsn_data_path_open':
>> drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:95:39: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
      95 |                          "%s_mcdma_rx_%d", ndev->name, i + 1);
         |                                       ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:95:26: note: directive argument in the range [-2147483637, 65535]
      95 |                          "%s_mcdma_rx_%d", ndev->name, i + 1);
         |                          ^~~~~~~~~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:94:17: note: 'snprintf' output between 12 and 37 bytes into a destination of size 32
      94 |                 snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      95 |                          "%s_mcdma_rx_%d", ndev->name, i + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:114:39: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
     114 |                          "%s_mcdma_tx_%d", ndev->name, i + 1);
         |                                       ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:114:26: note: directive argument in the range [-2147483638, 65535]
     114 |                          "%s_mcdma_tx_%d", ndev->name, i + 1);
         |                          ^~~~~~~~~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:113:17: note: 'snprintf' output between 12 and 37 bytes into a destination of size 32
     113 |                 snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     114 |                          "%s_mcdma_tx_%d", ndev->name, i + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +95 drivers/staging/xilinx-tsn/xilinx_tsn_ep.c

    59	
    60	int tsn_data_path_open(struct net_device *ndev)
    61	{
    62		/* The highest possible count of IRQs is twice the maximum number of
    63		 * queues, considering both the Tx and Rx channels
    64		 */
    65		static char irq_name[XAE_MAX_QUEUES * 2][32];
    66		struct axienet_local *lp = netdev_priv(ndev);
    67		struct net_device *emac0_ndev;
    68		struct net_device *emac1_ndev;
    69		u8 hw_addr_mask[ETH_ALEN];
    70		struct axienet_dma_q *q;
    71		u8 irq_cnt = 0;
    72		int ret, i = 0;
    73	
    74		for_each_tx_dma_queue(lp, i) {
    75			q = lp->dq[i];
    76			/*MCDMA TX RESET*/
    77			__axienet_device_reset_tsn(q);
    78			ret = mcdma_qidx_to_txq_idx(lp, i);
    79			if (ret < 0) {
    80				dev_err(&ndev->dev, "Failed to get txq for MCMDA Q%d\n",
    81					i);
    82				return -EINVAL;
    83			}
    84	
    85			q->txq_idx = ret;
    86		}
    87	
    88		for_each_rx_dma_queue(lp, i) {
    89			q = lp->dq[i];
    90	
    91			ret = axienet_mcdma_rx_q_init_tsn(ndev, q);
    92			/* Enable interrupts for Axi MCDMA Rx
    93			 */
    94			snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
  > 95				 "%s_mcdma_rx_%d", ndev->name, i + 1);
    96			ret = request_irq(q->rx_irq, axienet_mcdma_rx_irq_tsn,
    97					  IRQF_SHARED, irq_name[irq_cnt], ndev);
    98			if (ret)
    99				goto err_dma_rx_irq;
   100	
   101			tasklet_init(&lp->dma_err_tasklet[i],
   102				     axienet_mcdma_err_handler_tsn,
   103				     (unsigned long)lp->dq[i]);
   104			napi_enable(&lp->napi[i]);
   105			irq_cnt++;
   106		}
   107	
   108		for_each_tx_dma_queue(lp, i) {
   109			q = lp->dq[i];
   110	
   111			ret = axienet_mcdma_tx_q_init_tsn(ndev, q);
   112			/* Enable interrupts for Axi MCDMA Tx */
   113			snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
   114				 "%s_mcdma_tx_%d", ndev->name, i + 1);
   115			ret = request_irq(q->tx_irq, axienet_mcdma_tx_irq_tsn,
   116					  IRQF_SHARED, irq_name[irq_cnt], ndev);
   117			if (ret)
   118				goto err_dma_tx_irq;
   119			irq_cnt++;
   120		}
   121	#if IS_ENABLED(CONFIG_AXIENET_HAS_TADMA)
   122		ret = axienet_tadma_open(ndev);
   123		if (ret)
   124			goto err_tadma;
   125	#endif
   126		if (lp->slaves[0] && lp->slaves[1]) {
   127			emac0_ndev = lp->slaves[0];
   128			emac1_ndev = lp->slaves[1];
   129	
   130			for (i = 0; i < ETH_ALEN; i++)
   131				hw_addr_mask[i] = 0xFF;
   132			hw_addr_mask[5] &= 0x000000F0;
   133			if (!ether_addr_equal_masked(emac0_ndev->dev_addr, emac1_ndev->dev_addr,
   134						     hw_addr_mask))
   135				netdev_warn(ndev,
   136					    "MSB 44 bits of the MAC addresses of TSN EMAC0 and TSN EMAC1 are different");
   137			if (!ether_addr_equal_masked(emac0_ndev->dev_addr, ndev->dev_addr, hw_addr_mask))
   138				netdev_warn(ndev, "MSB 44 bits of the MAC addresses of TSN EMAC0 and TSN EP are different");
   139			if (!ether_addr_equal_masked(emac0_ndev->dev_addr, ndev->dev_addr, hw_addr_mask))
   140				netdev_warn(ndev, "MSB 44 bits of the MAC addresses of TSN EMAC1 and TSN EP are different");
   141		}
   142	
   143		netif_tx_start_all_queues(ndev);
   144		return 0;
   145	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
