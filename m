Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F666A026
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698149; cv=none; b=mOcl5hha/LyewYWgr8R0Y72RL3nl0xsXTDQTNkz3d+2fBQkaaG59/+BlKtK1s3oIt0vMZdGwY13bXL2gGvl2tRZ2fu/uMgGB7hNx37AHvXVsS04dgyyOpATT7G9AUFCpjEol7DPnl5psZGPvGRhTkG9CcnhKrY9RcF2u85a3NrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698149; c=relaxed/simple;
	bh=/IL3PY7AIZYB1DhfncDDasX9oZgNyTFyXQSHRgfQ9So=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iejo4AO2T1N1jRV11IJvEWQ4yRVwAEYw1/y079iyDxCivU0o702IG8aVPlveJmO9FqSYAX7xgmU7SkV/nf7qWSUWbAzv1EvTDTLHH15tn4HL0qWG7YvINKAcFTW6uKdQ/THFUHBPZwpkJ3PkyDbPl9uQ/LR0duZ+JscMM/F9fxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvMCe6pv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvMCe6pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706698147; x=1738234147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/IL3PY7AIZYB1DhfncDDasX9oZgNyTFyXQSHRgfQ9So=;
  b=LvMCe6pvbZ0AeP2YuRVd8p1lTrYedBM54oh4sxerhG1IcTBZivoSQ4oz
   6hE4yEi9f0nvZTbhxVijM4QvJWKYQ1cay+yAf8ZaP51P6pWcj3Oinm4P4
   avL94SQ3GIwOWfSDUCK29XxnsyyF2ddFzWbNXOzHV+W/XykCzgDl31Jgt
   hxc6oCHQPeGb3zsp5TALKSI0qRjYdRYYi7CExroxDjJ5Ss+o67QUy4rM8
   1dREyeHpRgMxswFdEMVUCgI0QUOZzmB4//5Q/WAr+Prc4ETxAMMM9Bc96
   drOGjqNVqaJeH13/sykTJbLZXm9NNRPsbrYTd2fix7E7okuoL6D/MG2z5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10947607"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10947607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 02:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4045819"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jan 2024 02:49:03 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV89N-0001Ts-19;
	Wed, 31 Jan 2024 10:49:01 +0000
Date: Wed, 31 Jan 2024 18:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Harini Katakam <harini.katakam@amd.com>
Subject: [xilinx-xlnx:lkp_test 3/3]
 drivers/net/ethernet/cadence/macb_main.c:5320:51: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202401311818.zGVVLPL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   415577e072b30c152a07b0e89dc2c25bf659c671
commit: 415577e072b30c152a07b0e89dc2c25bf659c671 [3/3] net: macb: Add ARP support to WOL
config: mips-randconfig-r123-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311818.zGVVLPL4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401311818.zGVVLPL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311818.zGVVLPL4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/cadence/macb_main.c:286:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] bottom @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/cadence/macb_main.c:286:16: sparse:     expected unsigned int [usertype] bottom
   drivers/net/ethernet/cadence/macb_main.c:286:16: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/cadence/macb_main.c:288:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] top @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/cadence/macb_main.c:288:13: sparse:     expected unsigned short [usertype] top
   drivers/net/ethernet/cadence/macb_main.c:288:13: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/cadence/macb_main.c:3496:39: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3501:39: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3506:40: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3506:69: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3531:20: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3535:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] w0 @@     got restricted __be32 [usertype] ip4src @@
   drivers/net/ethernet/cadence/macb_main.c:3535:20: sparse:     expected unsigned int [assigned] [usertype] w0
   drivers/net/ethernet/cadence/macb_main.c:3535:20: sparse:     got restricted __be32 [usertype] ip4src
   drivers/net/ethernet/cadence/macb_main.c:3545:20: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3549:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] w0 @@     got restricted __be32 [usertype] ip4dst @@
   drivers/net/ethernet/cadence/macb_main.c:3549:20: sparse:     expected unsigned int [assigned] [usertype] w0
   drivers/net/ethernet/cadence/macb_main.c:3549:20: sparse:     got restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/cadence/macb_main.c:3559:21: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3559:50: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3565:30: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3566:30: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3573:36: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3574:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3577:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c:3613:9: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/cadence/macb_main.c:3613:9: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/cadence/macb_main.c:3667:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/cadence/macb_main.c:3667:25: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/cadence/macb_main.c:5320:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const [usertype] *p @@     got restricted __be32 * @@
   drivers/net/ethernet/cadence/macb_main.c:5320:51: sparse:     expected unsigned int const [usertype] *p
   drivers/net/ethernet/cadence/macb_main.c:5320:51: sparse:     got restricted __be32 *
   drivers/net/ethernet/cadence/macb_main.c:5320:49: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/cadence/macb_main.c: note: in included file (through include/linux/mutex.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/net/ethernet/cadence/macb_main.c:5272:23: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/cadence/macb_main.c:5272:23: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/cadence/macb_main.c:5272:23: sparse: sparse: dereference of noderef expression

vim +5320 drivers/net/ethernet/cadence/macb_main.c

  5252	
  5253	static int __maybe_unused macb_suspend(struct device *dev)
  5254	{
  5255		struct net_device *netdev = dev_get_drvdata(dev);
  5256		struct macb *bp = netdev_priv(netdev);
  5257		struct macb_queue *queue;
  5258		struct in_ifaddr *ifa;
  5259		unsigned long flags;
  5260		unsigned int q;
  5261		u32 ctrlmask;
  5262		int err;
  5263	
  5264		if (!device_may_wakeup(&bp->dev->dev))
  5265			phy_exit(bp->sgmii_phy);
  5266	
  5267		if (!netif_running(netdev))
  5268			return 0;
  5269	
  5270		if (bp->wol & MACB_WOL_ENABLED) {
  5271			/* Check for IP address in WOL ARP mode */
  5272			ifa = rtnl_dereference(bp->dev->ip_ptr->ifa_list);
  5273			if ((bp->wolopts & WAKE_ARP) && !ifa) {
  5274				netdev_err(netdev, "IP address not assigned\n");
  5275				return -EOPNOTSUPP;
  5276			}
  5277			spin_lock_irqsave(&bp->lock, flags);
  5278	
  5279			/* Disable Tx and Rx engines before  disabling the queues,
  5280			 * this is mandatory as per the IP spec sheet
  5281			 */
  5282			ctrlmask = macb_readl(bp, NCR);
  5283			ctrlmask &= ~(MACB_BIT(TE) | MACB_BIT(RE));
  5284			macb_writel(bp, NCR, ctrlmask);
  5285			for (q = 0, queue = bp->queues; q < bp->num_queues;
  5286			     ++q, ++queue) {
  5287				/* Disable RX queues */
  5288				if (bp->caps & MACB_CAPS_QUEUE_DISABLE) {
  5289					queue_writel(queue, RBQP, GEM_RBQP_DISABLE);
  5290				} else {
  5291					/* Tie off RX queues */
  5292					queue_writel(queue, RBQP,
  5293						     lower_32_bits(bp->rx_ring_tieoff_dma));
  5294					queue_writel(queue, RBQPH,
  5295						     upper_32_bits(bp->rx_ring_tieoff_dma));
  5296				}
  5297			}
  5298			/* Enable Receive engine */
  5299			ctrlmask = macb_readl(bp, NCR);
  5300			ctrlmask |= MACB_BIT(RE);
  5301			macb_writel(bp, NCR, ctrlmask);
  5302			/* Flush all status bits */
  5303			macb_writel(bp, TSR, -1);
  5304			macb_writel(bp, RSR, -1);
  5305			for (q = 0, queue = bp->queues; q < bp->num_queues;
  5306			     ++q, ++queue) {
  5307				/* Disable all interrupts */
  5308				queue_writel(queue, IDR, -1);
  5309				queue_readl(queue, ISR);
  5310				if (bp->caps & MACB_CAPS_ISR_CLEAR_ON_WRITE)
  5311					queue_writel(queue, ISR, -1);
  5312			}
  5313	
  5314			ctrlmask = 0;
  5315			if (bp->wolopts & WAKE_MAGIC)
  5316				ctrlmask = MACB_BIT(MAG);
  5317			if (bp->wolopts & WAKE_ARP) {
  5318				ctrlmask |= MACB_BIT(ARP);
  5319				/* write IP address into register */
> 5320				ctrlmask |= cpu_to_be32p(&ifa->ifa_local)
  5321							& GENMASK(MACB_IP_SIZE - 1, 0);
  5322			}
  5323	
  5324			/* Change interrupt handler and
  5325			 * Enable WoL IRQ on queue 0
  5326			 */
  5327			devm_free_irq(dev, bp->queues[0].irq, bp->queues);
  5328			if (macb_is_gem(bp)) {
  5329				err = devm_request_irq(dev, bp->queues[0].irq, gem_wol_interrupt,
  5330						       IRQF_SHARED, netdev->name, bp->queues);
  5331				if (err) {
  5332					dev_err(dev,
  5333						"Unable to request IRQ %d (error %d)\n",
  5334						bp->queues[0].irq, err);
  5335					spin_unlock_irqrestore(&bp->lock, flags);
  5336					return err;
  5337				}
  5338				queue_writel(bp->queues, IER, GEM_BIT(WOL));
  5339				gem_writel(bp, WOL, ctrlmask);
  5340			} else {
  5341				err = devm_request_irq(dev, bp->queues[0].irq, macb_wol_interrupt,
  5342						       IRQF_SHARED, netdev->name, bp->queues);
  5343				if (err) {
  5344					dev_err(dev,
  5345						"Unable to request IRQ %d (error %d)\n",
  5346						bp->queues[0].irq, err);
  5347					spin_unlock_irqrestore(&bp->lock, flags);
  5348					return err;
  5349				}
  5350				queue_writel(bp->queues, IER, MACB_BIT(WOL));
  5351				macb_writel(bp, WOL, ctrlmask);
  5352			}
  5353			spin_unlock_irqrestore(&bp->lock, flags);
  5354	
  5355			enable_irq_wake(bp->queues[0].irq);
  5356		}
  5357	
  5358		netif_device_detach(netdev);
  5359		for (q = 0, queue = bp->queues; q < bp->num_queues;
  5360		     ++q, ++queue) {
  5361			napi_disable(&queue->napi_rx);
  5362			napi_disable(&queue->napi_tx);
  5363		}
  5364	
  5365		if (!(bp->wol & MACB_WOL_ENABLED)) {
  5366			rtnl_lock();
  5367			phylink_stop(bp->phylink);
  5368			rtnl_unlock();
  5369			spin_lock_irqsave(&bp->lock, flags);
  5370			macb_reset_hw(bp);
  5371			spin_unlock_irqrestore(&bp->lock, flags);
  5372		}
  5373	
  5374		if (!(bp->caps & MACB_CAPS_USRIO_DISABLED))
  5375			bp->pm_data.usrio = macb_or_gem_readl(bp, USRIO);
  5376	
  5377		if (netdev->hw_features & NETIF_F_NTUPLE)
  5378			bp->pm_data.scrt2 = gem_readl_n(bp, ETHT, SCRT2_ETHT);
  5379	
  5380		if (bp->ptp_info)
  5381			bp->ptp_info->ptp_remove(netdev);
  5382		if (!device_may_wakeup(dev))
  5383			pm_runtime_force_suspend(dev);
  5384	
  5385		return 0;
  5386	}
  5387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
