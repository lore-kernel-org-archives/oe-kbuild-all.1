Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C7747B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695960014; x=1727496014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yndAt2a39h2KnFCbvGh3/1996ORu5k7Jqbdp5jPmvQ=;
  b=EmJ1kc8YhRmI6lAjEvS4xqt6Rd7rg/8ZTCYSnDT3l7OxPnQMOZ0owYX7
   QYHBhDZFKs1gmhkpd2plVVrZ4UesQBouimx1XPC06NHvhnMkJj6TI4h45
   IpyJ4QUw03KsFsoVs5foLkPAKVaLtjS4HWa4i63bsJbtsiIJ/GIpmOsMe
   x2dwiexutmS7gI8um2Mhs5PvFtazAPMVKTPxFYqDmrjEZlOmR+TSgKhW8
   mWOXCqEAX/FV8Dp1pKUS6LyneQ+AkcKFXX9tMjvSl/VAUVxY3+W2luDXw
   jRsw2wYCeYMjNCQh4RF1naqYeFCsBQa/e45T9Bp8h3XPBQjjwqZMj+/8y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382130912"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="382130912"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749843218"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="749843218"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2023 21:00:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm4ff-0002Ru-0Y;
	Fri, 29 Sep 2023 04:00:07 +0000
Date: Fri, 29 Sep 2023 11:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Pranavi Somisetty <pranavi.somisetty@xilinx.com>,
	Quanyang Wang <quanyang.wang@windriver.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 643/1370]
 drivers/net/ethernet/cadence/macb_main.c:5131:58: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202309291157.HIYLntT8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: cd538ce87b57fc5dfe8f8e9db5111e7dfa6b162e [643/1370] net: macb: Use WOL via ARP
config: i386-randconfig-063-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291157.HIYLntT8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291157.HIYLntT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291157.HIYLntT8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/cadence/macb_main.c:288:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] bottom @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/cadence/macb_main.c:288:16: sparse:     expected unsigned int [usertype] bottom
   drivers/net/ethernet/cadence/macb_main.c:288:16: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/cadence/macb_main.c:290:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] top @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/cadence/macb_main.c:290:13: sparse:     expected unsigned short [usertype] top
   drivers/net/ethernet/cadence/macb_main.c:290:13: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/cadence/macb_main.c:3368:39: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3373:39: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3378:40: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3378:69: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3403:20: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3407:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] w0 @@     got restricted __be32 [usertype] ip4src @@
   drivers/net/ethernet/cadence/macb_main.c:3407:20: sparse:     expected unsigned int [assigned] [usertype] w0
   drivers/net/ethernet/cadence/macb_main.c:3407:20: sparse:     got restricted __be32 [usertype] ip4src
   drivers/net/ethernet/cadence/macb_main.c:3417:20: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3421:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] w0 @@     got restricted __be32 [usertype] ip4dst @@
   drivers/net/ethernet/cadence/macb_main.c:3421:20: sparse:     expected unsigned int [assigned] [usertype] w0
   drivers/net/ethernet/cadence/macb_main.c:3421:20: sparse:     got restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/cadence/macb_main.c:3431:21: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3431:50: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3437:30: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3438:30: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3445:36: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3446:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3449:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3485:9: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/cadence/macb_main.c:3485:9: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/cadence/macb_main.c:3539:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/cadence/macb_main.c:3539:25: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/cadence/macb_main.c:5131:58: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const [usertype] *p @@     got restricted __be32 [noderef] __rcu * @@
   drivers/net/ethernet/cadence/macb_main.c:5131:58: sparse:     expected unsigned int const [usertype] *p
   drivers/net/ethernet/cadence/macb_main.c:5131:58: sparse:     got restricted __be32 [noderef] __rcu *
   drivers/net/ethernet/cadence/macb_main.c:5131:41: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/cadence/macb_main.c:5098:29: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/cadence/macb_main.c:5131:50: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/cadence/macb_main.c:5131:50: sparse: sparse: dereference of noderef expression

vim +5131 drivers/net/ethernet/cadence/macb_main.c

  5084	
  5085	static int __maybe_unused macb_suspend(struct device *dev)
  5086	{
  5087		struct net_device *netdev = dev_get_drvdata(dev);
  5088		struct macb *bp = netdev_priv(netdev);
  5089		struct macb_queue *queue;
  5090		unsigned long flags;
  5091		unsigned int q;
  5092		u32 ctrl, arpipmask;
  5093	
  5094		if (!netif_running(netdev))
  5095			return 0;
  5096	
  5097		if (device_may_wakeup(&bp->dev->dev)) {
> 5098			if (!bp->dev->ip_ptr->ifa_list) {
  5099				netdev_err(netdev, "IP address not assigned\n");
  5100				return -EOPNOTSUPP;
  5101			}
  5102			spin_lock_irqsave(&bp->lock, flags);
  5103			ctrl = macb_readl(bp, NCR);
  5104			ctrl &= ~(MACB_BIT(TE) | MACB_BIT(RE));
  5105			macb_writel(bp, NCR, ctrl);
  5106			/* Tie off RX queues */
  5107			for (q = 0, queue = bp->queues; q < bp->num_queues;
  5108			     ++q, ++queue) {
  5109				queue_writel(queue, RBQP,
  5110					     lower_32_bits(bp->rx_ring_tieoff_dma));
  5111			}
  5112			ctrl = macb_readl(bp, NCR);
  5113			ctrl |= MACB_BIT(RE);
  5114			macb_writel(bp, NCR, ctrl);
  5115			gem_writel(bp, NCFGR, gem_readl(bp, NCFGR) & ~MACB_BIT(NBC));
  5116			macb_writel(bp, TSR, -1);
  5117			macb_writel(bp, RSR, -1);
  5118			macb_readl(bp, ISR);
  5119			if (bp->caps & MACB_CAPS_ISR_CLEAR_ON_WRITE)
  5120				macb_writel(bp, ISR, -1);
  5121	
  5122			/* Enable WOL (Q0 only) and disable all other interrupts */
  5123			macb_writel(bp, IER, MACB_BIT(WOL));
  5124			for (q = 1, queue = bp->queues; q < bp->num_queues;
  5125			     ++q, ++queue) {
  5126				queue_writel(queue, IDR, bp->rx_intr_mask |
  5127							 MACB_TX_INT_FLAGS |
  5128							 MACB_BIT(HRESP));
  5129			}
  5130	
> 5131			arpipmask = cpu_to_be32p(&bp->dev->ip_ptr->ifa_list->ifa_local)
  5132						 & 0xFFFF;
  5133			gem_writel(bp, WOL, MACB_BIT(ARP) | arpipmask);
  5134			spin_unlock_irqrestore(&bp->lock, flags);
  5135			enable_irq_wake(bp->queues[0].irq);
  5136		}
  5137	
  5138		netif_device_detach(netdev);
  5139		for (q = 0, queue = bp->queues; q < bp->num_queues;
  5140		     ++q, ++queue) {
  5141			napi_disable(&queue->napi_rx);
  5142			napi_disable(&queue->napi_tx);
  5143		}
  5144	
  5145		if (!device_may_wakeup(&bp->dev->dev)) {
  5146			rtnl_lock();
  5147			phylink_stop(bp->phylink);
  5148			phy_exit(bp->sgmii_phy);
  5149			rtnl_unlock();
  5150			spin_lock_irqsave(&bp->lock, flags);
  5151			macb_reset_hw(bp);
  5152			spin_unlock_irqrestore(&bp->lock, flags);
  5153		}
  5154	
  5155		if (!(bp->caps & MACB_CAPS_USRIO_DISABLED))
  5156			bp->pm_data.usrio = macb_or_gem_readl(bp, USRIO);
  5157	
  5158		if (netdev->hw_features & NETIF_F_NTUPLE)
  5159			bp->pm_data.scrt2 = gem_readl_n(bp, ETHT, SCRT2_ETHT);
  5160	
  5161		if (bp->ptp_info)
  5162			bp->ptp_info->ptp_remove(netdev);
  5163		if (!device_may_wakeup(&bp->dev->dev))
  5164			pm_runtime_force_suspend(dev);
  5165	
  5166		return 0;
  5167	}
  5168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
