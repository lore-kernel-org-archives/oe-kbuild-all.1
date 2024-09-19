Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDF14277
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726759052; cv=none; b=t5b/L/BQZnNl377PR+PYH11/jO5T6bpU6LCFCopn8514Mp/eC0Effa+5rOREsqozMnMF2mg5I2pb3h5VsNcmdAaMGFFhwiBm79ohxzPnAOkWkVtYe07dqJXtp+PfYXV5odfuSokIf3W8a7Sf1brUGCD0TetnYOkDC+1dar12oJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726759052; c=relaxed/simple;
	bh=IpKq4aZK3R8YeY6VTi5UjzU2/bb7FUfVjpQ1cc6GVl8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKAYEPTufX8ieiu8i1U6j7wNENx4lDL2keIbd5qDFG3OzyHLcChXGqoTeKvXu0xYjW9e5kB1AQJr0+IprZq79zzGNugdVr3bVnz+zFIX4+zI9GNr+nut5fypj3t9kS/MBFLC1Or8b5PPz52Si92rnUsOAN/uyz76rqIx8zYoIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkIPap9l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkIPap9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726759050; x=1758295050;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IpKq4aZK3R8YeY6VTi5UjzU2/bb7FUfVjpQ1cc6GVl8=;
  b=SkIPap9lZX9F/aASk0e4g/adaWuM3H9TFO4nrBdEnRWaDLcc4tlZfXOn
   KMzIZzEv0bva11QppL3p9fRHK+sdJkv0zo/ZJ5Nzc+/w15Zww122+AzwN
   dxTPbazQrxo4gQODUwmlfa6yyqg1YcrEPAHIDzkxMlXxWD/vngCG04fhN
   EOToQ4IFgwoS59xGo0yljO54FS09TXf6S2cin0ncJYoqpERhqGoxSMwfr
   X45JWNzw6qXb7m/lA0cOlh3WR4/ONOIy/4ze7qpvLA5e/u2R82XWv7vpR
   j1NNJy6LIdWDsU/c51Nmsn7P1Fojm/zVpWFJfJrtO37n/EaCSRJTJxpAA
   w==;
X-CSE-ConnectionGUID: rrSpyP+jSYawKyvWqmIdzA==
X-CSE-MsgGUID: RHLVkvG4RQmPTiK00skvhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29633729"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="29633729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:17:04 -0700
X-CSE-ConnectionGUID: BUwIM09GQ/qbYEIPenVF1Q==
X-CSE-MsgGUID: wQGkUsOqSk2/Mv+FN8sDGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="100692727"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Sep 2024 08:17:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srItw-000DPE-1k;
	Thu, 19 Sep 2024 15:17:00 +0000
Date: Thu, 19 Sep 2024 23:16:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-5.10.y 6/304] drivers/net/usb/lan78xx.c:4519
 lan78xx_resume() warn: inconsistent indenting
Message-ID: <202409192344.5DsH7Yd0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-5.10.y
head:   b2add7c50b5bf51a401424ad00792b130a73c2c5
commit: 11a3c9f489403de6050d9374687df75d8e78b904 [6/304] lan78xx: Fix race conditions in suspend/resume handling
config: i386-randconfig-141-20240918 (https://download.01.org/0day-ci/archive/20240919/202409192344.5DsH7Yd0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409192344.5DsH7Yd0-lkp@intel.com/

smatch warnings:
drivers/net/usb/lan78xx.c:4519 lan78xx_resume() warn: inconsistent indenting

vim +4519 drivers/net/usb/lan78xx.c

  4492	
  4493	static int lan78xx_resume(struct usb_interface *intf)
  4494	{
  4495		struct lan78xx_net *dev = usb_get_intfdata(intf);
  4496		bool dev_open;
  4497		int ret;
  4498	
  4499		mutex_lock(&dev->dev_mutex);
  4500	
  4501		netif_dbg(dev, ifup, dev->net, "resuming device");
  4502	
  4503		dev_open = test_bit(EVENT_DEV_OPEN, &dev->flags);
  4504	
  4505		if (dev_open) {
  4506			bool pipe_halted = false;
  4507	
  4508			ret = lan78xx_flush_tx_fifo(dev);
  4509			if (ret < 0)
  4510				goto out;
  4511	
  4512			if (dev->urb_intr) {
  4513				int ret = usb_submit_urb(dev->urb_intr, GFP_KERNEL);
  4514	
  4515				if (ret < 0) {
  4516					if (ret == -ENODEV)
  4517						netif_device_detach(dev->net);
  4518	
> 4519				netdev_warn(dev->net, "Failed to submit intr URB");
  4520				}
  4521			}
  4522	
  4523			spin_lock_irq(&dev->txq.lock);
  4524	
  4525			if (netif_device_present(dev->net)) {
  4526				pipe_halted = lan78xx_submit_deferred_urbs(dev);
  4527	
  4528				if (pipe_halted)
  4529					lan78xx_defer_kevent(dev, EVENT_TX_HALT);
  4530			}
  4531	
  4532			clear_bit(EVENT_DEV_ASLEEP, &dev->flags);
  4533	
  4534			spin_unlock_irq(&dev->txq.lock);
  4535	
  4536			if (!pipe_halted &&
  4537			    netif_device_present(dev->net) &&
  4538			    (skb_queue_len(&dev->txq) < dev->tx_qlen))
  4539				netif_start_queue(dev->net);
  4540	
  4541			ret = lan78xx_start_tx_path(dev);
  4542			if (ret < 0)
  4543				goto out;
  4544	
  4545			tasklet_schedule(&dev->bh);
  4546	
  4547			if (!timer_pending(&dev->stat_monitor)) {
  4548				dev->delta = 1;
  4549				mod_timer(&dev->stat_monitor,
  4550					  jiffies + STAT_UPDATE_TIMER);
  4551			}
  4552	
  4553		} else {
  4554			clear_bit(EVENT_DEV_ASLEEP, &dev->flags);
  4555		}
  4556	
  4557		ret = lan78xx_write_reg(dev, WUCSR2, 0);
  4558		if (ret < 0)
  4559			goto out;
  4560		ret = lan78xx_write_reg(dev, WUCSR, 0);
  4561		if (ret < 0)
  4562			goto out;
  4563		ret = lan78xx_write_reg(dev, WK_SRC, 0xFFF1FF1FUL);
  4564		if (ret < 0)
  4565			goto out;
  4566	
  4567		ret = lan78xx_write_reg(dev, WUCSR2, WUCSR2_NS_RCD_ |
  4568						     WUCSR2_ARP_RCD_ |
  4569						     WUCSR2_IPV6_TCPSYN_RCD_ |
  4570						     WUCSR2_IPV4_TCPSYN_RCD_);
  4571		if (ret < 0)
  4572			goto out;
  4573	
  4574		ret = lan78xx_write_reg(dev, WUCSR, WUCSR_EEE_TX_WAKE_ |
  4575						    WUCSR_EEE_RX_WAKE_ |
  4576						    WUCSR_PFDA_FR_ |
  4577						    WUCSR_RFE_WAKE_FR_ |
  4578						    WUCSR_WUFR_ |
  4579						    WUCSR_MPR_ |
  4580						    WUCSR_BCST_FR_);
  4581		if (ret < 0)
  4582			goto out;
  4583	
  4584		ret = 0;
  4585	out:
  4586		mutex_unlock(&dev->dev_mutex);
  4587	
  4588		return ret;
  4589	}
  4590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
