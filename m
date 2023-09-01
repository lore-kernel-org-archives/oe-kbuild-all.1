Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7003FF4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693547906; x=1725083906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YNthTkt8JLgJ53XzGB0vrHq/Tv0qGAWxIcQwFn/nVY=;
  b=kmB2Q0kJjMj8Su61utPqkvh2gFWBGg5oxTw1LaS3zTMIf45yCqJbIu3K
   /bOJclDbZyIPA7pIgplujKkCjBqjYsgukyHDS6eLOGhOuKHOqjFBoay2R
   UlqGeBM4gE34AM6mYNwoUBSH2qkCka2irUuYrpdYpJZGRMTeO6uBNNDb1
   1Ko3H0pULRnJwJugy30Cp5Lf+turWTO351CGEnIL8NhkfOTbXVw1KJFU8
   ZGAzmD+GPwyDMviT64UW1PGNxJLWoDR/cBnvRDuVS3gZyjyLud25SF673
   JFAvMALcBMnsc3iFHnodA2yxz8gSKf1q8NNfONzClVMEHUmy8PtkfLgZ2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379928693"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="379928693"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 22:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769079655"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="769079655"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2023 22:58:24 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbxAk-0000vp-29;
	Fri, 01 Sep 2023 05:58:22 +0000
Date: Fri, 1 Sep 2023 13:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/8] drivers/mtd/nand/raw/vf610_nfc.c:845:17:
 error: label 'err_disable_clk' used but not defined
Message-ID: <202309011336.7cIDgiQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   a143793949161ccf952d0b50ee37e442cf8c02e9
commit: 0be56945298277377b33c8b380b610d449ec9db7 [5/8] Use of_device_get_match_data
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230901/202309011336.7cIDgiQE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011336.7cIDgiQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011336.7cIDgiQE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/raw/vf610_nfc.c: In function 'vf610_nfc_probe':
>> drivers/mtd/nand/raw/vf610_nfc.c:845:17: error: label 'err_disable_clk' used but not defined
     845 |                 goto err_disable_clk;
         |                 ^~~~


vim +/err_disable_clk +845 drivers/mtd/nand/raw/vf610_nfc.c

   806	
   807	static int vf610_nfc_probe(struct platform_device *pdev)
   808	{
   809		struct vf610_nfc *nfc;
   810		struct mtd_info *mtd;
   811		struct nand_chip *chip;
   812		struct device_node *child;
   813		int err;
   814		int irq;
   815	
   816		nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
   817		if (!nfc)
   818			return -ENOMEM;
   819	
   820		nfc->dev = &pdev->dev;
   821		chip = &nfc->chip;
   822		mtd = nand_to_mtd(chip);
   823	
   824		mtd->owner = THIS_MODULE;
   825		mtd->dev.parent = nfc->dev;
   826		mtd->name = DRV_NAME;
   827	
   828		irq = platform_get_irq(pdev, 0);
   829		if (irq < 0)
   830			return irq;
   831	
   832		nfc->regs = devm_platform_ioremap_resource(pdev, 0);
   833		if (IS_ERR(nfc->regs))
   834			return PTR_ERR(nfc->regs);
   835	
   836		nfc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
   837		if (IS_ERR(nfc->clk)) {
   838			dev_err(nfc->dev, "Unable to get and enable clock!\n");
   839			return PTR_ERR(nfc->clk);
   840		}
   841	
   842		nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
   843		if (!nfc->variant) {
   844			err = -ENODEV;
 > 845			goto err_disable_clk;
   846		}
   847	
   848		for_each_available_child_of_node(nfc->dev->of_node, child) {
   849			if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
   850	
   851				if (nand_get_flash_node(chip)) {
   852					dev_err(nfc->dev,
   853						"Only one NAND chip supported!\n");
   854					of_node_put(child);
   855					return -EINVAL;
   856				}
   857	
   858				nand_set_flash_node(chip, child);
   859			}
   860		}
   861	
   862		if (!nand_get_flash_node(chip)) {
   863			dev_err(nfc->dev, "NAND chip sub-node missing!\n");
   864			return -ENODEV;
   865		}
   866	
   867		chip->options |= NAND_NO_SUBPAGE_WRITE;
   868	
   869		init_completion(&nfc->cmd_done);
   870	
   871		err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, nfc);
   872		if (err) {
   873			dev_err(nfc->dev, "Error requesting IRQ!\n");
   874			return err;
   875		}
   876	
   877		vf610_nfc_preinit_controller(nfc);
   878	
   879		nand_controller_init(&nfc->base);
   880		nfc->base.ops = &vf610_nfc_controller_ops;
   881		chip->controller = &nfc->base;
   882	
   883		/* Scan the NAND chip */
   884		err = nand_scan(chip, 1);
   885		if (err)
   886			return err;
   887	
   888		platform_set_drvdata(pdev, nfc);
   889	
   890		/* Register device in MTD */
   891		err = mtd_device_register(mtd, NULL, 0);
   892		if (err)
   893			goto err_cleanup_nand;
   894		return 0;
   895	
   896	err_cleanup_nand:
   897		nand_cleanup(chip);
   898		return err;
   899	}
   900	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
