Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4111553A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713207161; cv=none; b=q1M6plmRgdsu4AcEzLwblBCTAMaA9z32XncMrHYkXhUXNvAJcbLRJJ4wl20ypKulB4LEIUFc8FETNnorcwpsxrn8qlwylwkpFmVu6N+HJ35Hkib455NVqN4NNPuDS47Mv8/Zq1vJGEpHrAOJswZ0cfU8AEa1EJXQbIEBl3gFKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713207161; c=relaxed/simple;
	bh=PAXnSuIiFNBX+voQXxsRbvZLaPmKrjZs4qCgok6RvCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCzVPcv2a2FsZpXpTNJ0LERCUzZoP3880nejxElTLElLFRAWTvAbR5pJjKgtaqiz+xYWpO1Y9QlmuSJ63IBPh4Xt9HtBZWi1fxjZgaXtdtwp6ZdmrKvw2Pu4aaxHJc88SR22qUwlcfruMp4OcmxzySEESONxuJNmqkNSgHGBoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2kiIA/s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2kiIA/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713207160; x=1744743160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PAXnSuIiFNBX+voQXxsRbvZLaPmKrjZs4qCgok6RvCI=;
  b=R2kiIA/s1mGZxBMjl6SyFRXNeAHs8UGTHF3WDvq+whQWNqT6QMH345Ar
   s7HINrqiIA2kdeu2Ysig9OowX6yTh+7cOCDYQrqMeud63VD0CW0AKCdXQ
   +J+lZ2XiSjfrXpc3cXfuIOMtrHuNYGaEwC5WGobJyisBjCM5SEsJMJZVz
   XyeXrzAiq82uv03MgyA+ME3fQN/1FE9fa8V8V7Dzf8njtFN5UZz+GlCvh
   NaJHS5lGq4h05JIGamMsBbb6Sdwfe4pCnvfqaniqBqhdFyuFE+/SEpdFf
   4UsIQzIVT6QByLZCElc9OH8K7U1OeacX2+VYdmxe2jCbN9Pyqi7cLGs3k
   A==;
X-CSE-ConnectionGUID: ddTgPm75QZCUPgflLpnleg==
X-CSE-MsgGUID: jzemUERpSWehzNmw6O1YYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12406079"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12406079"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 11:52:39 -0700
X-CSE-ConnectionGUID: 3un6MpaPTx2KAUYtBQwdTg==
X-CSE-MsgGUID: B91cdxcdRGO/pXjrrvtGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26662635"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 11:52:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwRRT-0004ai-0d;
	Mon, 15 Apr 2024 18:52:35 +0000
Date: Tue, 16 Apr 2024 02:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 65/76]
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:487:45: error:
 'TXGBE_CFG_PORT_ST_LINK_' undeclared; did you mean
 'TXGBE_CFG_PORT_ST_LINK_UP'?
Message-ID: <202404160221.gVgbG3YU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   8a2e4ae480ee76646194828ac4ec8eba9af66fb5
commit: 75f641d7b0fe9198253792c1d470d54e9862e1f8 [65/76] net: txgbe: use phylink_pcs_change() to report PCS link change events
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240416/202404160221.gVgbG3YU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160221.gVgbG3YU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160221.gVgbG3YU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: In function 'txgbe_irq_handler':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:487:45: error: 'TXGBE_CFG_PORT_ST_LINK_' undeclared (first use in this function); did you mean 'TXGBE_CFG_PORT_ST_LINK_UP'?
     487 |                                    !!(reg & TXGBE_CFG_PORT_ST_LINK_+UP));
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             TXGBE_CFG_PORT_ST_LINK_UP
   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:487:45: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:487:69: error: 'UP' undeclared (first use in this function); did you mean 'up'?
     487 |                                    !!(reg & TXGBE_CFG_PORT_ST_LINK_+UP));
         |                                                                     ^~
         |                                                                     up


vim +487 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c

   448	
   449	static void txgbe_irq_handler(struct irq_desc *desc)
   450	{
   451		struct irq_chip *chip = irq_desc_get_chip(desc);
   452		struct wx *wx = irq_desc_get_handler_data(desc);
   453		struct txgbe *txgbe = wx->priv;
   454		irq_hw_number_t hwirq;
   455		unsigned long gpioirq;
   456		struct gpio_chip *gc;
   457		unsigned long flags;
   458		u32 eicr;
   459	
   460		eicr = wx_misc_isb(wx, WX_ISB_MISC);
   461	
   462		chained_irq_enter(chip, desc);
   463	
   464		gpioirq = rd32(wx, WX_GPIO_INTSTATUS);
   465	
   466		gc = txgbe->gpio;
   467		for_each_set_bit(hwirq, &gpioirq, gc->ngpio) {
   468			int gpio = irq_find_mapping(gc->irq.domain, hwirq);
   469			u32 irq_type = irq_get_trigger_type(gpio);
   470	
   471			generic_handle_domain_irq(gc->irq.domain, hwirq);
   472	
   473			if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH) {
   474				raw_spin_lock_irqsave(&wx->gpio_lock, flags);
   475				txgbe_toggle_trigger(gc, hwirq);
   476				raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
   477			}
   478		}
   479	
   480		chained_irq_exit(chip, desc);
   481	
   482		if (eicr & (TXGBE_PX_MISC_ETH_LK | TXGBE_PX_MISC_ETH_LKDN |
   483			    TXGBE_PX_MISC_ETH_AN)) {
   484			u32 reg = rd32(wx, TXGBE_CFG_PORT_ST);
   485	
   486			phylink_pcs_change(&txgbe->xpcs->pcs,
 > 487					   !!(reg & TXGBE_CFG_PORT_ST_LINK_+UP));
   488		}
   489	
   490		/* unmask interrupt */
   491		wx_intr_enable(wx, TXGBE_INTR_MISC);
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
