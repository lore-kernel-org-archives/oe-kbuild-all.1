Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C43D541
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714837601; cv=none; b=J8XEQ+ges3KLJZw7KPIQGAt2FsNCttokyBDRLzNXsfIq07E04KZgsVDjUuPiUIgT6HbEFvPxEANQnp/qJI3Ynk7YZ64c2FgRl4X4JIiPGC9KI/zu1eZySsdAQej3Zs8FTyyNU4X+9nY2TmzI6QJvCHLpmUphnElwpfLFA+2J28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714837601; c=relaxed/simple;
	bh=XFDDzz37B42AeU0x7PZpcKnxl2LeWONWYb1knw12CMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tf8r6LWTfG6Y2UpCoetDe1qUFruXRP28YOJ+5WkoGcmpe3pKciP45o4w209GCCJv2E2ZII+/8VPb29H3tQQ4Gf+dCbiG5/BZDV8WErpVWDEAQ2rwn1yZuBLZ0PyeCCuPyy8/AFm+ikwGj5rAPRyKqaXea/nvanlBhSBFv8LgR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2kLdnP2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2kLdnP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714837599; x=1746373599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFDDzz37B42AeU0x7PZpcKnxl2LeWONWYb1knw12CMI=;
  b=H2kLdnP2AKKAVmpC6inWLVpxFtklpfF6H5flq+y6aAdp1bqE4DrOpGQP
   2DRYqBBMcsG1CUzNZnx4pbXQ0ZZpIB2GcGWaNNwgJzXoXPq9+dBgsMH9g
   16gDhKxt3ovA3NUEwNTuRn2PGMtMIBlwWfEJdMwquTOneLj1xRVKYksjA
   ZXBbMfAWGyFlWrxDiR6tj2M3GbYrbepGQhypBzg7YQi11PpwfUaKNQupX
   87ugJ2V7VWgqA977pRNWH74K2bkXkLaMcRcDhnhdKCoU5PAavjs1dvBfS
   dfnMAGzHaFHpIgDHQ2EF9viGhAZi71BNbIiu7NrHhWT9D0wsk+2IpCC5t
   Q==;
X-CSE-ConnectionGUID: 937spIQiSWuAl7ZvJrf4ig==
X-CSE-MsgGUID: y2JF2XHET+KqIxziCIQ0cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13576187"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="13576187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 08:46:38 -0700
X-CSE-ConnectionGUID: ZsIWqxNET12KCiihBKaFEg==
X-CSE-MsgGUID: WE7PduXMRzaTDoGknJFDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="65158514"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 May 2024 08:46:37 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Has-000CuW-25;
	Sat, 04 May 2024 15:46:34 +0000
Date: Sat, 4 May 2024 23:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 827/1143]
 drivers/char/ipmi/bt-bmc.c:454:37: error: 'IRQ_TYPE_LEVEL_LOW' undeclared
Message-ID: <202405042327.c4OZRFHm-lkp@intel.com>
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
commit: 75e9eb0ca4a3bb6cdef129a140ec97cf1e506ec0 [827/1143] ipmi: bt_bmc_aspeed: Add IDA/SIRQ/IO_BASE configuration
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20240504/202405042327.c4OZRFHm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405042327.c4OZRFHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405042327.c4OZRFHm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ipmi/bt-bmc.c: In function 'bt_bmc_probe':
>> drivers/char/ipmi/bt-bmc.c:454:37: error: 'IRQ_TYPE_LEVEL_LOW' undeclared (first use in this function)
     454 |                 bt_bmc->sirq.type = IRQ_TYPE_LEVEL_LOW;
         |                                     ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/bt-bmc.c:454:37: note: each undeclared identifier is reported only once for each function it appears in
   drivers/char/ipmi/bt-bmc.c:471:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     471 |         writel(FIELD_PREP(BTCR0_IO_BASE, bt_bmc->io_addr) |
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/IRQ_TYPE_LEVEL_LOW +454 drivers/char/ipmi/bt-bmc.c

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
 > 454			bt_bmc->sirq.type = IRQ_TYPE_LEVEL_LOW;
   455		} else {
   456			if (bt_bmc->sirq.id > 15) {
   457				dev_err(dev, "invalid SerIRQ number, expected sirq <= 15\n");
   458				return -EINVAL;
   459			}
   460		}
   461	
   462		bt_bmc_config_irq(bt_bmc, pdev);
   463	
   464		if (bt_bmc->irq < 0) {
   465			dev_info(dev, "No IRQ; using timer\n");
   466			timer_setup(&bt_bmc->poll_timer, poll_timer, 0);
   467			bt_bmc->poll_timer.expires = jiffies + msecs_to_jiffies(10);
   468			add_timer(&bt_bmc->poll_timer);
   469		}
   470	
   471		writel(FIELD_PREP(BTCR0_IO_BASE, bt_bmc->io_addr) |
   472		       FIELD_PREP(BTCR0_SIRQ, bt_bmc->sirq.id) |
   473		       FIELD_PREP(BTCR0_SIRQ_TYPE, bt_bmc->sirq.type) |
   474		       BTCR0_EN_CLR_SLV_RDP |
   475		       BTCR0_EN_CLR_SLV_WRP |
   476		       BTCR0_ENABLE_IBT,
   477		       bt_bmc->base + BTCR0);
   478	
   479		clr_b_busy(bt_bmc);
   480	
   481		bt_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
   482						      DEVICE_NAME, chan);
   483	
   484		bt_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
   485		bt_bmc->miscdev.fops = &bt_bmc_fops;
   486		bt_bmc->miscdev.parent = dev;
   487		rc = misc_register(&bt_bmc->miscdev);
   488		if (rc) {
   489			dev_err(dev, "Unable to register misc device\n");
   490			return rc;
   491		}
   492	
   493		dev_info(dev, "initialised channel %d at IO address 0x%x\n",
   494			 chan, bt_bmc->io_addr);
   495	
   496		return 0;
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
