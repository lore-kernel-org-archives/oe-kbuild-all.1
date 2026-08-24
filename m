Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8784A360EF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605084; cv=none; b=qkYUCO192CY5HdCuqpNLGhqcBqES7XNzA+2OOn/7VT8blHlA0RRtqIkfgCiS8vCUQIxCnLcJJA6RB3oWm0S5WqAnm1JYVo/UHyGkky2P479PVPnxVly4rw3483SFJZsEu7ynHF6Sv1GYPjaKTD5K6Ues2hTSROzwY7oiSVZzAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605084; c=relaxed/simple;
	bh=TazO0HaCPLkwov9Ykxw3BijD+YiEhMYhInTRXUtLlHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dhb+rgIy590e9aOvY1xkKQpgs19Jfhp1lqufSsWvM8wdC33XZdnMB1cUFOyz1ipxq91POBOG5gcMQV/fupebPAavNkmkbB04Xxo0lgEbojjR6oRtbGJzUl6+IS5EV3J1dNyDUAvb972E2RD9s/oLfjt/iAyX6nCzd1YPCjI1u5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/WJdkGs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/WJdkGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787605083; x=1819141083;
  h=date:from:to:cc:subject:message-id;
  bh=TazO0HaCPLkwov9Ykxw3BijD+YiEhMYhInTRXUtLlHg=;
  b=W/WJdkGs/m+gKQBcm22Y4LHu4rZEoNYOhO1Q5FCyC2YvjFn6ldHdpThl
   /cOPvQaitGxU6F7z3QgJAjx76TOQlJeXlB/46iGeedvntnpAAn0db7j+a
   iUn31X10rnL1Z1za+xG9Y9jiuskyqYdymwWR6/kkTZ4I1H9bhcieaRb0c
   cSHoPGb4hBjqdJg6K3Bzu454l3fh/MIfV8uDZujwbrEJkZ9d8VP0G6YEc
   IarxiuuuIUwnGm/QbbvfDdp28sD1GFCSL4vdktn+XuZDCYYaloJ6SppyM
   XZMri3SKxWPz04oYKK9B8F7XjvdIFu5guDWABEutAyzIktjTB5bxlshRW
   A==;
X-CSE-ConnectionGUID: lIYQmVc4QBOYss3V6StGhQ==
X-CSE-MsgGUID: J3o/iP94T56lWyE2jTElIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91744449"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="91744449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:58:02 -0700
X-CSE-ConnectionGUID: 6HcfgZhwSgC1tjsKAnwV1w==
X-CSE-MsgGUID: s2f6ZLoYSn2r/IoRQEQVLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="263823114"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 13:57:59 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wybjq-0000000049N-3HVk;
	Mon, 24 Aug 2026 20:57:53 +0000
Date: Tue, 25 Aug 2026 04:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Radharapu Rakesh <rakesh.radharapu@amd.com>
Subject: [xilinx-xlnx:master 694/1090]
 drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:98:39: warning: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 between 7 and 22
Message-ID: <202608250419.qtUbw9wl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   235bd5e49f53bfea681cfd6c489ca1e0eab0b061
commit: 81a6a924a23bdac1d0dc581f02a84eba125a5329 [694/1090] staging: xilinx-tsn: fix error handling in tsn_data_path_open()
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260825/202608250419.qtUbw9wl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250419.qtUbw9wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250419.qtUbw9wl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c: In function 'tsn_data_path_open':
>> drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:98:39: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
      98 |                          "%s_mcdma_rx_%d", ndev->name, i + 1);
         |                                       ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:98:26: note: directive argument in the range [-2147483638, 65535]
      98 |                          "%s_mcdma_rx_%d", ndev->name, i + 1);
         |                          ^~~~~~~~~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:97:17: note: 'snprintf' output between 12 and 37 bytes into a destination of size 32
      97 |                 snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      98 |                          "%s_mcdma_rx_%d", ndev->name, i + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:118:39: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
     118 |                          "%s_mcdma_tx_%d", ndev->name, i + 1);
         |                                       ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:118:26: note: directive argument in the range [-2147483639, 65535]
     118 |                          "%s_mcdma_tx_%d", ndev->name, i + 1);
         |                          ^~~~~~~~~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ep.c:117:17: note: 'snprintf' output between 12 and 37 bytes into a destination of size 32
     117 |                 snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     118 |                          "%s_mcdma_tx_%d", ndev->name, i + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +98 drivers/staging/xilinx-tsn/xilinx_tsn_ep.c

37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   59  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   60  int tsn_data_path_open(struct net_device *ndev)
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   61  {
ac4092db41c623 Nagadheeraj Rottela 2025-04-03   62  	/* The highest possible count of IRQs is twice the maximum number of
ac4092db41c623 Nagadheeraj Rottela 2025-04-03   63  	 * queues, considering both the Tx and Rx channels
ac4092db41c623 Nagadheeraj Rottela 2025-04-03   64  	 */
ac4092db41c623 Nagadheeraj Rottela 2025-04-03   65  	static char irq_name[XAE_MAX_QUEUES * 2][32];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   66  	struct axienet_local *lp = netdev_priv(ndev);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   67  	struct net_device *emac0_ndev;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   68  	struct net_device *emac1_ndev;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   69  	u8 hw_addr_mask[ETH_ALEN];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   70  	struct axienet_dma_q *q;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   71  	u8 irq_cnt = 0;
c088e3ee8afd72 Nagadheeraj Rottela 2025-04-03   72  	int ret, i = 0;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   73  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   74  	for_each_tx_dma_queue(lp, i) {
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   75  		q = lp->dq[i];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   76  		/*MCDMA TX RESET*/
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   77  		__axienet_device_reset_tsn(q);
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   78  		ret = mcdma_qidx_to_txq_idx(lp, i);
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   79  		if (ret < 0) {
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   80  			dev_err(&ndev->dev, "Failed to get txq for MCMDA Q%d\n",
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   81  				i);
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   82  			return -EINVAL;
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   83  		}
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   84  
37df557cf4ba15 Nagadheeraj Rottela 2025-04-03   85  		q->txq_idx = ret;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   86  	}
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   87  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   88  	for_each_rx_dma_queue(lp, i) {
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   89  		q = lp->dq[i];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   90  
a291e883b3b803 Nagadheeraj Rottela 2026-03-20   91  		napi_enable(&lp->napi[i]);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   92  		ret = axienet_mcdma_rx_q_init_tsn(ndev, q);
81a6a924a23bda Nagadheeraj Rottela 2026-03-20   93  		if (ret)
81a6a924a23bda Nagadheeraj Rottela 2026-03-20   94  			goto err_dma_rx_irq;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   95  		/* Enable interrupts for Axi MCDMA Rx
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   96  		 */
c088e3ee8afd72 Nagadheeraj Rottela 2025-04-03   97  		snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
c088e3ee8afd72 Nagadheeraj Rottela 2025-04-03  @98  			 "%s_mcdma_rx_%d", ndev->name, i + 1);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24   99  		ret = request_irq(q->rx_irq, axienet_mcdma_rx_irq_tsn,
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  100  				  IRQF_SHARED, irq_name[irq_cnt], ndev);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  101  		if (ret)
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  102  			goto err_dma_rx_irq;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  103  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  104  		tasklet_init(&lp->dma_err_tasklet[i],
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  105  			     axienet_mcdma_err_handler_tsn,
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  106  			     (unsigned long)lp->dq[i]);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  107  		irq_cnt++;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  108  	}
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  109  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  110  	for_each_tx_dma_queue(lp, i) {
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  111  		q = lp->dq[i];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  112  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  113  		ret = axienet_mcdma_tx_q_init_tsn(ndev, q);
81a6a924a23bda Nagadheeraj Rottela 2026-03-20  114  		if (ret)
81a6a924a23bda Nagadheeraj Rottela 2026-03-20  115  			goto err_dma_tx_init;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  116  		/* Enable interrupts for Axi MCDMA Tx */
c088e3ee8afd72 Nagadheeraj Rottela 2025-04-03  117  		snprintf(irq_name[irq_cnt], sizeof(irq_name[irq_cnt]),
c088e3ee8afd72 Nagadheeraj Rottela 2025-04-03  118  			 "%s_mcdma_tx_%d", ndev->name, i + 1);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  119  		ret = request_irq(q->tx_irq, axienet_mcdma_tx_irq_tsn,
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  120  				  IRQF_SHARED, irq_name[irq_cnt], ndev);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  121  		if (ret)
81a6a924a23bda Nagadheeraj Rottela 2026-03-20  122  			goto err_dma_tx_init;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  123  		irq_cnt++;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  124  	}
3f47bacbe031ba Srinivas Neeli      2025-02-19  125  #if IS_ENABLED(CONFIG_AXIENET_HAS_TADMA)
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  126  	ret = axienet_tadma_open(ndev);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  127  	if (ret)
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  128  		goto err_tadma;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  129  #endif
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  130  	if (lp->slaves[0] && lp->slaves[1]) {
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  131  		emac0_ndev = lp->slaves[0];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  132  		emac1_ndev = lp->slaves[1];
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  133  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  134  		for (i = 0; i < ETH_ALEN; i++)
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  135  			hw_addr_mask[i] = 0xFF;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  136  		hw_addr_mask[5] &= 0x000000F0;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  137  		if (!ether_addr_equal_masked(emac0_ndev->dev_addr, emac1_ndev->dev_addr,
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  138  					     hw_addr_mask))
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  139  			netdev_warn(ndev,
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  140  				    "MSB 44 bits of the MAC addresses of TSN EMAC0 and TSN EMAC1 are different");
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  141  		if (!ether_addr_equal_masked(emac0_ndev->dev_addr, ndev->dev_addr, hw_addr_mask))
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  142  			netdev_warn(ndev, "MSB 44 bits of the MAC addresses of TSN EMAC0 and TSN EP are different");
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  143  		if (!ether_addr_equal_masked(emac0_ndev->dev_addr, ndev->dev_addr, hw_addr_mask))
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  144  			netdev_warn(ndev, "MSB 44 bits of the MAC addresses of TSN EMAC1 and TSN EP are different");
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  145  	}
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  146  
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  147  	netif_tx_start_all_queues(ndev);
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  148  	return 0;
2d5d4b136dfe3f Pranavi Somisetty   2023-11-24  149  

:::::: The code at line 98 was first introduced by commit
:::::: c088e3ee8afd7212d516d9debd31c162321becd7 staging: xilinx-tsn: Replace sprintf with snprintf

:::::: TO: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
