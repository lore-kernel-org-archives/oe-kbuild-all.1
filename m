Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3DEA4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 01:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714872780; cv=none; b=a3UscnOBOutObXA4rwkUi0EL7CVRMgRKBPXcJVGGhMvSFGdLosCW84EBTmtp2c0qx20du1tmsMh5cZmx30pBvJ9l9mFfR4rpBY3UoNsy33mHuCoyay7Q5zM28mD+HUMCgYRKN7iktItIAteYPQzuhgEOYv/TW6TA6XpF9vxavd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714872780; c=relaxed/simple;
	bh=WFbqfGmG5K/cPWPJH+PHeuRJ7SfAcdl3l6AI/7giZhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaFPrkG1Z2WBDghEueZxTBzcld3BzUz2J9b2j9PMKIW6lAKecnl7BYKo0U7dwt60Q/wsczKMzdWlubJbO/q9agSU80UTNV2uo97qSr9tFNzacaj78c9kLVt4G0N/nBi800nAF6eSoZ0BFZOQSWeZQQHDkKdexh2DNqyYbRjYQU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LelL787v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LelL787v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714872779; x=1746408779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFbqfGmG5K/cPWPJH+PHeuRJ7SfAcdl3l6AI/7giZhw=;
  b=LelL787vq72sznhcJm1ZK/E2rxbCgrv1/JptywyXn34eUsIkTMm/o6Tj
   4GJ5WjMk5XhuLG6ecCYPEdtT+paVhTIXq3jDjdkX52Jw/myEkyVKkdU30
   7xDNN6qA2hvPEaG4fWNYAcdaKYSuSq8vd5/y+q7419WRW3lRqy8E68W+K
   Z43MApp5LHpvt4U/rfdGYny/7u3UDEB96V8nOea6HdkVgKVLvvmt91U37
   Ai2RHO5x8F0ON6oaX2dD0pk/pyQYvQiDeYy3zbSTWhwgYDACWuzRCzFv5
   aPbuOWp2/eijbNArwoCUV9RbpezUea1nsWPgFtyjW2cvmMig78Cp1AJmj
   g==;
X-CSE-ConnectionGUID: nIs7dTqASu2sPZ09TKViHQ==
X-CSE-MsgGUID: zXIuA9nuRA2IJ/vq8pKQCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10867342"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10867342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 18:32:58 -0700
X-CSE-ConnectionGUID: RB68s7tWTiKqR0iyedyGUg==
X-CSE-MsgGUID: E27Pp5nNSISJ962NXcI+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="50997101"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 May 2024 18:32:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3QkI-000DLc-0v;
	Sun, 05 May 2024 01:32:54 +0000
Date: Sun, 5 May 2024 09:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 828/1143]
 drivers/char/ipmi/bt-bmc.c:461:42: error: 'IRQ_TYPE_LEVEL_HIGH' undeclared
Message-ID: <202405050948.cktU5Lbd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 468c33b5b88d7f3c041d92583462a04a8144484f [828/1143] ipmi: bt_bmc_aspeed: Fix SerIRQ type
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20240505/202405050948.cktU5Lbd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050948.cktU5Lbd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050948.cktU5Lbd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ipmi/bt-bmc.c: In function 'bt_bmc_probe':
   drivers/char/ipmi/bt-bmc.c:454:37: error: 'IRQ_TYPE_LEVEL_LOW' undeclared (first use in this function)
     454 |                 bt_bmc->sirq.type = IRQ_TYPE_LEVEL_LOW;
         |                                     ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/bt-bmc.c:454:37: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/ipmi/bt-bmc.c:461:42: error: 'IRQ_TYPE_LEVEL_HIGH' undeclared (first use in this function)
     461 |                 if (bt_bmc->sirq.type != IRQ_TYPE_LEVEL_HIGH &&
         |                                          ^~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/bt-bmc.c:477:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     477 |         writel(FIELD_PREP(BTCR0_IO_BASE, bt_bmc->io_addr) |
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/IRQ_TYPE_LEVEL_HIGH +461 drivers/char/ipmi/bt-bmc.c

   412	
   413	static int bt_bmc_probe(struct platform_device *pdev)
   414	{
   415		struct bt_bmc *bt_bmc;
   416		struct device *dev;
   417		int rc, chan;
   418	
   419		dev = &pdev->dev;
   420	
   421		bt_bmc = devm_kzalloc(dev, sizeof(*bt_bmc), GFP_KERNEL);
   422		if (!bt_bmc)
   423			return -ENOMEM;
   424	
   425		dev_set_drvdata(&pdev->dev, bt_bmc);
   426	
   427		bt_bmc->base = devm_platform_ioremap_resource(pdev, 0);
   428		if (IS_ERR(bt_bmc->base))
   429			return PTR_ERR(bt_bmc->base);
   430	
   431		mutex_init(&bt_bmc->mutex);
   432		init_waitqueue_head(&bt_bmc->queue);
   433	
   434		rc = of_property_read_u32(dev->of_node, "bt-io-addr", &bt_bmc->io_addr);
   435		if (rc) {
   436			bt_bmc->io_addr = 0xe4;
   437		} else if (bt_bmc->io_addr > (USHRT_MAX - 1)) {
   438			dev_err(dev, "invalid IO address\n");
   439			return -ENODEV;
   440		}
   441	
   442		rc = of_property_read_u32(dev->of_node, "bt-channel", &chan);
   443		if (rc) {
   444			chan = ida_alloc(&aspeed_bt_bmc_ida, GFP_KERNEL);
   445			if (chan < 0) {
   446				dev_err(dev, "cannot allocate ID for BT channel\n");
   447				return chan;
   448			}
   449		}
   450	
   451		rc = of_property_read_u32_array(dev->of_node, "bt-upstream-serirq", (u32 *)&bt_bmc->sirq, 2);
   452		if (rc) {
   453			bt_bmc->sirq.id = 0xa;
   454			bt_bmc->sirq.type = IRQ_TYPE_LEVEL_LOW;
   455		} else {
   456			if (bt_bmc->sirq.id > 15) {
   457				dev_err(dev, "invalid SerIRQ number, expected sirq <= 15\n");
   458				return -EINVAL;
   459			}
   460	
 > 461			if (bt_bmc->sirq.type != IRQ_TYPE_LEVEL_HIGH &&
   462			    bt_bmc->sirq.type != IRQ_TYPE_LEVEL_LOW) {
   463				dev_err(dev, "invalid SerIRQ type, expected IRQ_TYPE_LEVEL_HIGH/LOW only\n");
   464				return -EINVAL;
   465			}
   466		}
   467	
   468		bt_bmc_config_irq(bt_bmc, pdev);
   469	
   470		if (bt_bmc->irq < 0) {
   471			dev_info(dev, "No IRQ; using timer\n");
   472			timer_setup(&bt_bmc->poll_timer, poll_timer, 0);
   473			bt_bmc->poll_timer.expires = jiffies + msecs_to_jiffies(10);
   474			add_timer(&bt_bmc->poll_timer);
   475		}
   476	
   477		writel(FIELD_PREP(BTCR0_IO_BASE, bt_bmc->io_addr) |
   478		       FIELD_PREP(BTCR0_SIRQ, bt_bmc->sirq.id) |
   479		       FIELD_PREP(BTCR0_SIRQ_TYPE, ((bt_bmc->sirq.type == IRQ_TYPE_LEVEL_LOW) ? 0 : 1)) |
   480		       BTCR0_EN_CLR_SLV_RDP |
   481		       BTCR0_EN_CLR_SLV_WRP |
   482		       BTCR0_ENABLE_IBT,
   483		       bt_bmc->base + BTCR0);
   484	
   485		clr_b_busy(bt_bmc);
   486	
   487		bt_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
   488						      DEVICE_NAME, chan);
   489	
   490		bt_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
   491		bt_bmc->miscdev.fops = &bt_bmc_fops;
   492		bt_bmc->miscdev.parent = dev;
   493		rc = misc_register(&bt_bmc->miscdev);
   494		if (rc) {
   495			dev_err(dev, "Unable to register misc device\n");
   496			return rc;
   497		}
   498	
   499		dev_info(dev, "initialised channel %d at IO address 0x%x\n",
   500			 chan, bt_bmc->io_addr);
   501	
   502		return 0;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
