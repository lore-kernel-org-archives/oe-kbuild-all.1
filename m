Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A720E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 06:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSiE62TZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700116559; x=1731652559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0UfuAB+bvg4BCUv1h7VU/3Fu6jqilcfVGLoNEb2voaM=;
  b=BSiE62TZu46i+mw/DFFHhdMFfqE0CgHVkDxDl0N/qI7e/JICt82Hpv0k
   Z1jkKhqSGkVrjw4a/d3mEGoPXwopVNuOpxu0TGjeK0C8mmz6tz3D7E4iI
   FzqpUskVxaJw9XofTxZMa/D6Xtc20md8rdudl/5zYljaYA/rETzPMtJsp
   2Qx8e9oDnK8DbJWJ+09tHh86uESmIyxbSDpXjH1/zhrxaGWNhzCryB5Kq
   cJZlsYKV77TVD/Zt0eIuJZg99Pi4r1IuPCIT/AfESO7ALlWwFG+eYnlmG
   9LzFFWTnj5OYBDoXhFaI3EnQGyS8PK05MNNO0GjmnrrmAULKVFrrx3dsR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376073209"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="376073209"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 22:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="882646460"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="882646460"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2023 22:35:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Vyj-0001P1-0T;
	Thu, 16 Nov 2023 06:35:53 +0000
Date: Thu, 16 Nov 2023 14:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 17/17] drivers/edac/armada_xp_edac.c:317:12:
 warning: assignment to 'const struct of_device_id *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202311161407.3MECohq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   30bd4c46bf0b9c85631b39f39c6bfc901846dbc9
commit: 30bd4c46bf0b9c85631b39f39c6bfc901846dbc9 [17/17] of: header cleanups
config: arm-randconfig-003-20231116 (https://download.01.org/0day-ci/archive/20231116/202311161407.3MECohq4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161407.3MECohq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161407.3MECohq4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/armada_xp_edac.c: In function 'axp_mc_check':
   drivers/edac/armada_xp_edac.c:129:47: warning: variable 'cause_msg' set but not used [-Wunused-but-set-variable]
     129 |         uint32_t cnt_sbe, cnt_dbe, cause_err, cause_msg;
         |                                               ^~~~~~~~~
   drivers/edac/armada_xp_edac.c:129:36: warning: variable 'cause_err' set but not used [-Wunused-but-set-variable]
     129 |         uint32_t cnt_sbe, cnt_dbe, cause_err, cause_msg;
         |                                    ^~~~~~~~~
   drivers/edac/armada_xp_edac.c:128:26: warning: variable 'data_l' set but not used [-Wunused-but-set-variable]
     128 |         uint32_t data_h, data_l, recv_ecc, calc_ecc, addr;
         |                          ^~~~~~
   drivers/edac/armada_xp_edac.c:128:18: warning: variable 'data_h' set but not used [-Wunused-but-set-variable]
     128 |         uint32_t data_h, data_l, recv_ecc, calc_ecc, addr;
         |                  ^~~~~~
   drivers/edac/armada_xp_edac.c: In function 'axp_mc_probe':
   drivers/edac/armada_xp_edac.c:317:14: error: implicit declaration of function 'of_match_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     317 |         id = of_match_device(axp_mc_of_match, &pdev->dev);
         |              ^~~~~~~~~~~~~~~
         |              acpi_match_device
>> drivers/edac/armada_xp_edac.c:317:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     317 |         id = of_match_device(axp_mc_of_match, &pdev->dev);
         |            ^
   drivers/edac/armada_xp_edac.c:329:13: error: implicit declaration of function 'of_machine_is_compatible'; did you mean 'device_is_compatible'? [-Werror=implicit-function-declaration]
     329 |         if (of_machine_is_compatible("marvell,armada380") ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
         |             device_is_compatible
   drivers/edac/armada_xp_edac.c: At top level:
   drivers/edac/armada_xp_edac.c:370:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
     370 |                 .of_match_table = of_match_ptr(axp_mc_of_match),
         |                                   ^~~~~~~~~~~~
>> drivers/edac/armada_xp_edac.c:370:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/edac/armada_xp_edac.c:370:35: note: (near initialization for 'axp_mc_driver.driver.of_match_table')
   drivers/edac/armada_xp_edac.c:370:35: error: initializer element is not constant
   drivers/edac/armada_xp_edac.c:370:35: note: (near initialization for 'axp_mc_driver.driver.of_match_table')
   drivers/edac/armada_xp_edac.c: In function 'aurora_l2_probe':
   drivers/edac/armada_xp_edac.c:535:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     535 |         id = of_match_device(aurora_l2_of_match, &pdev->dev);
         |            ^
   drivers/edac/armada_xp_edac.c: At top level:
   drivers/edac/armada_xp_edac.c:587:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     587 |                 .of_match_table = of_match_ptr(aurora_l2_of_match),
         |                                   ^~~~~~~~~~~~
   drivers/edac/armada_xp_edac.c:587:35: note: (near initialization for 'aurora_l2_driver.driver.of_match_table')
   drivers/edac/armada_xp_edac.c:587:35: error: initializer element is not constant
   drivers/edac/armada_xp_edac.c:587:35: note: (near initialization for 'aurora_l2_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +317 drivers/edac/armada_xp_edac.c

7f6998a41257a8 Jan Luebbe         2019-07-12  282  
7f6998a41257a8 Jan Luebbe         2019-07-12  283  static int axp_mc_probe(struct platform_device *pdev)
7f6998a41257a8 Jan Luebbe         2019-07-12  284  {
7f6998a41257a8 Jan Luebbe         2019-07-12  285  	struct axp_mc_drvdata *drvdata;
7f6998a41257a8 Jan Luebbe         2019-07-12  286  	struct edac_mc_layer layers[1];
7f6998a41257a8 Jan Luebbe         2019-07-12  287  	const struct of_device_id *id;
7f6998a41257a8 Jan Luebbe         2019-07-12  288  	struct mem_ctl_info *mci;
7f6998a41257a8 Jan Luebbe         2019-07-12  289  	void __iomem *base;
7f6998a41257a8 Jan Luebbe         2019-07-12  290  	uint32_t config;
7f6998a41257a8 Jan Luebbe         2019-07-12  291  
2f58783c5d8882 Lv Ruyi            2022-04-21  292  	base = devm_platform_ioremap_resource(pdev, 0);
7f6998a41257a8 Jan Luebbe         2019-07-12  293  	if (IS_ERR(base)) {
7f6998a41257a8 Jan Luebbe         2019-07-12  294  		dev_err(&pdev->dev, "Unable to map regs\n");
7f6998a41257a8 Jan Luebbe         2019-07-12  295  		return PTR_ERR(base);
7f6998a41257a8 Jan Luebbe         2019-07-12  296  	}
7f6998a41257a8 Jan Luebbe         2019-07-12  297  
7f6998a41257a8 Jan Luebbe         2019-07-12  298  	config = readl(base + SDRAM_CONFIG_REG);
7f6998a41257a8 Jan Luebbe         2019-07-12  299  	if (!(config & SDRAM_CONFIG_ECC_MASK)) {
493362dd7b9fe2 Christophe JAILLET 2020-04-13  300  		dev_warn(&pdev->dev, "SDRAM ECC is not enabled\n");
7f6998a41257a8 Jan Luebbe         2019-07-12  301  		return -EINVAL;
7f6998a41257a8 Jan Luebbe         2019-07-12  302  	}
7f6998a41257a8 Jan Luebbe         2019-07-12  303  
7f6998a41257a8 Jan Luebbe         2019-07-12  304  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
7f6998a41257a8 Jan Luebbe         2019-07-12  305  	layers[0].size = SDRAM_NUM_CS;
7f6998a41257a8 Jan Luebbe         2019-07-12  306  	layers[0].is_virt_csrow = true;
7f6998a41257a8 Jan Luebbe         2019-07-12  307  
7f6998a41257a8 Jan Luebbe         2019-07-12  308  	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(*drvdata));
7f6998a41257a8 Jan Luebbe         2019-07-12  309  	if (!mci)
7f6998a41257a8 Jan Luebbe         2019-07-12  310  		return -ENOMEM;
7f6998a41257a8 Jan Luebbe         2019-07-12  311  
7f6998a41257a8 Jan Luebbe         2019-07-12  312  	drvdata = mci->pvt_info;
7f6998a41257a8 Jan Luebbe         2019-07-12  313  	drvdata->base = base;
7f6998a41257a8 Jan Luebbe         2019-07-12  314  	mci->pdev = &pdev->dev;
7f6998a41257a8 Jan Luebbe         2019-07-12  315  	platform_set_drvdata(pdev, mci);
7f6998a41257a8 Jan Luebbe         2019-07-12  316  
7f6998a41257a8 Jan Luebbe         2019-07-12 @317  	id = of_match_device(axp_mc_of_match, &pdev->dev);
7f6998a41257a8 Jan Luebbe         2019-07-12  318  	mci->edac_check = axp_mc_check;
7f6998a41257a8 Jan Luebbe         2019-07-12  319  	mci->mtype_cap = MEM_FLAG_DDR3;
7f6998a41257a8 Jan Luebbe         2019-07-12  320  	mci->edac_cap = EDAC_FLAG_SECDED;
7f6998a41257a8 Jan Luebbe         2019-07-12  321  	mci->mod_name = pdev->dev.driver->name;
7f6998a41257a8 Jan Luebbe         2019-07-12  322  	mci->ctl_name = id ? id->compatible : "unknown";
7f6998a41257a8 Jan Luebbe         2019-07-12  323  	mci->dev_name = dev_name(&pdev->dev);
7f6998a41257a8 Jan Luebbe         2019-07-12  324  	mci->scrub_mode = SCRUB_NONE;
7f6998a41257a8 Jan Luebbe         2019-07-12  325  
7f6998a41257a8 Jan Luebbe         2019-07-12  326  	axp_mc_read_config(mci);
7f6998a41257a8 Jan Luebbe         2019-07-12  327  
23d103ae3e061b Chris Packham      2019-07-12  328  	/* These SoCs have a reduced width bus */
23d103ae3e061b Chris Packham      2019-07-12  329  	if (of_machine_is_compatible("marvell,armada380") ||
23d103ae3e061b Chris Packham      2019-07-12  330  	    of_machine_is_compatible("marvell,armadaxp-98dx3236"))
23d103ae3e061b Chris Packham      2019-07-12  331  		drvdata->width /= 2;
23d103ae3e061b Chris Packham      2019-07-12  332  
7f6998a41257a8 Jan Luebbe         2019-07-12  333  	/* configure SBE threshold */
7f6998a41257a8 Jan Luebbe         2019-07-12  334  	/* it seems that SBEs are not captured otherwise */
7f6998a41257a8 Jan Luebbe         2019-07-12  335  	writel(1 << SDRAM_ERR_CTRL_THR_OFFSET, drvdata->base + SDRAM_ERR_CTRL_REG);
7f6998a41257a8 Jan Luebbe         2019-07-12  336  
7f6998a41257a8 Jan Luebbe         2019-07-12  337  	/* clear cause registers */
7f6998a41257a8 Jan Luebbe         2019-07-12  338  	writel(~(SDRAM_ERR_CAUSE_DBE_MASK | SDRAM_ERR_CAUSE_SBE_MASK), drvdata->base + SDRAM_ERR_CAUSE_ERR_REG);
7f6998a41257a8 Jan Luebbe         2019-07-12  339  	writel(~(SDRAM_ERR_CAUSE_DBE_MASK | SDRAM_ERR_CAUSE_SBE_MASK), drvdata->base + SDRAM_ERR_CAUSE_MSG_REG);
7f6998a41257a8 Jan Luebbe         2019-07-12  340  
7f6998a41257a8 Jan Luebbe         2019-07-12  341  	/* clear counter registers */
7f6998a41257a8 Jan Luebbe         2019-07-12  342  	writel(0, drvdata->base + SDRAM_ERR_SBE_COUNT_REG);
7f6998a41257a8 Jan Luebbe         2019-07-12  343  	writel(0, drvdata->base + SDRAM_ERR_DBE_COUNT_REG);
7f6998a41257a8 Jan Luebbe         2019-07-12  344  
7f6998a41257a8 Jan Luebbe         2019-07-12  345  	if (edac_mc_add_mc(mci)) {
7f6998a41257a8 Jan Luebbe         2019-07-12  346  		edac_mc_free(mci);
7f6998a41257a8 Jan Luebbe         2019-07-12  347  		return -EINVAL;
7f6998a41257a8 Jan Luebbe         2019-07-12  348  	}
7f6998a41257a8 Jan Luebbe         2019-07-12  349  	edac_op_state = EDAC_OPSTATE_POLL;
7f6998a41257a8 Jan Luebbe         2019-07-12  350  
7f6998a41257a8 Jan Luebbe         2019-07-12  351  	return 0;
7f6998a41257a8 Jan Luebbe         2019-07-12  352  }
7f6998a41257a8 Jan Luebbe         2019-07-12  353  
7f6998a41257a8 Jan Luebbe         2019-07-12  354  static int axp_mc_remove(struct platform_device *pdev)
7f6998a41257a8 Jan Luebbe         2019-07-12  355  {
7f6998a41257a8 Jan Luebbe         2019-07-12  356  	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
7f6998a41257a8 Jan Luebbe         2019-07-12  357  
7f6998a41257a8 Jan Luebbe         2019-07-12  358  	edac_mc_del_mc(&pdev->dev);
7f6998a41257a8 Jan Luebbe         2019-07-12  359  	edac_mc_free(mci);
7f6998a41257a8 Jan Luebbe         2019-07-12  360  	platform_set_drvdata(pdev, NULL);
7f6998a41257a8 Jan Luebbe         2019-07-12  361  
7f6998a41257a8 Jan Luebbe         2019-07-12  362  	return 0;
7f6998a41257a8 Jan Luebbe         2019-07-12  363  }
7f6998a41257a8 Jan Luebbe         2019-07-12  364  
7f6998a41257a8 Jan Luebbe         2019-07-12  365  static struct platform_driver axp_mc_driver = {
7f6998a41257a8 Jan Luebbe         2019-07-12  366  	.probe = axp_mc_probe,
7f6998a41257a8 Jan Luebbe         2019-07-12  367  	.remove = axp_mc_remove,
7f6998a41257a8 Jan Luebbe         2019-07-12  368  	.driver = {
7f6998a41257a8 Jan Luebbe         2019-07-12  369  		.name = "armada_xp_mc_edac",
7f6998a41257a8 Jan Luebbe         2019-07-12 @370  		.of_match_table = of_match_ptr(axp_mc_of_match),
7f6998a41257a8 Jan Luebbe         2019-07-12  371  	},
7f6998a41257a8 Jan Luebbe         2019-07-12  372  };
7f6998a41257a8 Jan Luebbe         2019-07-12  373  

:::::: The code at line 317 was first introduced by commit
:::::: 7f6998a41257a8930ee5b6866ba56a25230841ed ARM: 8888/1: EDAC: Add driver for the Marvell Armada XP SDRAM and L2 cache ECC

:::::: TO: Jan Luebbe <jlu@pengutronix.de>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
