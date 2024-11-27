Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4361D13CFAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732731350; cv=none; b=MYACYFMeG2Q5vHQy1NDK25YhGrt/6VVQHYkphtXo6k40m4pQy1s9FmPDIUWlp2+pbyFiA52Z+ygyGnLKJJwlYltfcCdCN6EteBHvYexgvKyiLF9LTNqUsdD0gKg9yT1eImos6Yr6YTUSaPp4k9N9McEXXSdo0VeHzHIQDFk9ml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732731350; c=relaxed/simple;
	bh=2UvJ5owtllnxKZgh90bZdivg/vp3DaTA1jdy3OvX1HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbcuJjBvtQcfUy1AIupvsIgNRWzjDFBudWfFSg0xikUxPmTFCUqOOqHS7gQ3+SvxC0BIByG5aPiVR313lRLMZvXwnfDDQ4JDa/lU6RwVch1lQbexwqcIBDfJyJrJaDrubVt085YGRtONUCTcx942Wt0NpnF27Lmecib/k4BhXAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rv70brUt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv70brUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732731348; x=1764267348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UvJ5owtllnxKZgh90bZdivg/vp3DaTA1jdy3OvX1HM=;
  b=Rv70brUtkRu603rwzn3npJELdt+6o5B+FFtbSnt8bYnudH9UUo/fX6nc
   PIFA+c2hBWxzdAidhb9y9JgyNSewqNj6vez3BHgXtuPZ5hv2vQoZEl76W
   jPOp2opru7lP1aItAlZIunQbyG27xahi1a2La7OYkcrDPjxSOIH1hGtFF
   GXDX6bXrkcHOKU+UMUsvEaYxnrUjIQ5+BZj0E38ZKWL/OipEVV69eTp6s
   +pgRZ3iJpH/IQ5UcW5f+z6tno9rFoYi65qMIEla5qhMDXIgloLq/gl5vy
   NcUp9/ZlUjmHNWHafS2d1sY2ig18OPtCeglUmD0OLfmicxYKj+ML6XiMz
   A==;
X-CSE-ConnectionGUID: ERYFcLwqQCuhy9tZMcUGww==
X-CSE-MsgGUID: fAO6rhSnSgO3ePy/leEFnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33196743"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="33196743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 10:15:48 -0800
X-CSE-ConnectionGUID: xRC0R6lbTaaJYHbB1bNYQg==
X-CSE-MsgGUID: LUOQwy1DSvud+CwYslNVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="97092352"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Nov 2024 10:15:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGMZj-0008FT-37;
	Wed, 27 Nov 2024 18:15:43 +0000
Date: Thu, 28 Nov 2024 02:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2490/2490] drivers/net/usb/lan78xx.c:4518
 lan78xx_resume() warn: inconsistent indenting
Message-ID: <202411280257.12S1bi0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   68b0fb4e955465eef28bed1f5a252c4e6c636a36
commit: c3f7d9b46a5caf93fd52e6fabc7a2d27cba66c6f [2490/2490] lan78xx: Fix race conditions in suspend/resume handling
config: x86_64-randconfig-161-20241127 (https://download.01.org/0day-ci/archive/20241128/202411280257.12S1bi0F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280257.12S1bi0F-lkp@intel.com/

smatch warnings:
drivers/net/usb/lan78xx.c:4518 lan78xx_resume() warn: inconsistent indenting

vim +4518 drivers/net/usb/lan78xx.c

  4491	
  4492	static int lan78xx_resume(struct usb_interface *intf)
  4493	{
  4494		struct lan78xx_net *dev = usb_get_intfdata(intf);
  4495		bool dev_open;
  4496		int ret;
  4497	
  4498		mutex_lock(&dev->dev_mutex);
  4499	
  4500		netif_dbg(dev, ifup, dev->net, "resuming device");
  4501	
  4502		dev_open = test_bit(EVENT_DEV_OPEN, &dev->flags);
  4503	
  4504		if (dev_open) {
  4505			bool pipe_halted = false;
  4506	
  4507			ret = lan78xx_flush_tx_fifo(dev);
  4508			if (ret < 0)
  4509				goto out;
  4510	
  4511			if (dev->urb_intr) {
  4512				int ret = usb_submit_urb(dev->urb_intr, GFP_KERNEL);
  4513	
  4514				if (ret < 0) {
  4515					if (ret == -ENODEV)
  4516						netif_device_detach(dev->net);
  4517	
> 4518				netdev_warn(dev->net, "Failed to submit intr URB");
  4519				}
  4520			}
  4521	
  4522			spin_lock_irq(&dev->txq.lock);
  4523	
  4524			if (netif_device_present(dev->net)) {
  4525				pipe_halted = lan78xx_submit_deferred_urbs(dev);
  4526	
  4527				if (pipe_halted)
  4528					lan78xx_defer_kevent(dev, EVENT_TX_HALT);
  4529			}
  4530	
  4531			clear_bit(EVENT_DEV_ASLEEP, &dev->flags);
  4532	
  4533			spin_unlock_irq(&dev->txq.lock);
  4534	
  4535			if (!pipe_halted &&
  4536			    netif_device_present(dev->net) &&
  4537			    (skb_queue_len(&dev->txq) < dev->tx_qlen))
  4538				netif_start_queue(dev->net);
  4539	
  4540			ret = lan78xx_start_tx_path(dev);
  4541			if (ret < 0)
  4542				goto out;
  4543	
  4544			tasklet_schedule(&dev->bh);
  4545	
  4546			if (!timer_pending(&dev->stat_monitor)) {
  4547				dev->delta = 1;
  4548				mod_timer(&dev->stat_monitor,
  4549					  jiffies + STAT_UPDATE_TIMER);
  4550			}
  4551	
  4552		} else {
  4553			clear_bit(EVENT_DEV_ASLEEP, &dev->flags);
  4554		}
  4555	
  4556		ret = lan78xx_write_reg(dev, WUCSR2, 0);
  4557		if (ret < 0)
  4558			goto out;
  4559		ret = lan78xx_write_reg(dev, WUCSR, 0);
  4560		if (ret < 0)
  4561			goto out;
  4562		ret = lan78xx_write_reg(dev, WK_SRC, 0xFFF1FF1FUL);
  4563		if (ret < 0)
  4564			goto out;
  4565	
  4566		ret = lan78xx_write_reg(dev, WUCSR2, WUCSR2_NS_RCD_ |
  4567						     WUCSR2_ARP_RCD_ |
  4568						     WUCSR2_IPV6_TCPSYN_RCD_ |
  4569						     WUCSR2_IPV4_TCPSYN_RCD_);
  4570		if (ret < 0)
  4571			goto out;
  4572	
  4573		ret = lan78xx_write_reg(dev, WUCSR, WUCSR_EEE_TX_WAKE_ |
  4574						    WUCSR_EEE_RX_WAKE_ |
  4575						    WUCSR_PFDA_FR_ |
  4576						    WUCSR_RFE_WAKE_FR_ |
  4577						    WUCSR_WUFR_ |
  4578						    WUCSR_MPR_ |
  4579						    WUCSR_BCST_FR_);
  4580		if (ret < 0)
  4581			goto out;
  4582	
  4583		ret = 0;
  4584	out:
  4585		mutex_unlock(&dev->dev_mutex);
  4586	
  4587		return ret;
  4588	}
  4589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
