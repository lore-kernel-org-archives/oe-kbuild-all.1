Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA61AACA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727675215; cv=none; b=KoJt4RhiE5wBIjF6RUgzLSGuynLeAhniLDlJteIxtAxcfJS4PAaN4bSqI2jUSP211HHf7ZF/wEuCPOIMuH8zyBuICUXpnPRsHWY6yKWiXMNC9P5PCjXujbbYyaaGlkldTVI4r32XwjFlBBbiW/o7ThqM9pay2l1tIfI4cRs5NU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727675215; c=relaxed/simple;
	bh=NJUStXGQkmQAPacAxZASVWRJ7t/esFzrYKq3yBRP4qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QEa2hAC2zTawjVXh0t8shsVORYEDGrSErYWF3FClJYhHbZS3Da4Jc6iJdGGQWJtkNO9wmyofaeY0LCvQ1hoJ/cp17K80FTdt9FAICE62RGZqeOJSxNwJLbdb90tFGTHS/4kCiBqg/iohL7la/JV53iHN4AvGCuYMQht1AA4VbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPRtXB5K; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPRtXB5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727675213; x=1759211213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJUStXGQkmQAPacAxZASVWRJ7t/esFzrYKq3yBRP4qc=;
  b=TPRtXB5KqGtg1Mr3u92Lmt0QPSkCmMUROuVgqaik2hBCpKXyy1v0Aqhs
   EZQI7QYJJ/4fNrsJeX7kRpkRGqWwiN1xSi39IsCYfH6thLRVhyX/Cm5ex
   on5f5jdZir3mbLEAD4akqsm3QducXJOIJo8UZNng9vS7fq8ZbNH2pNq/a
   CIZjQKqvo4J0JHz+pCfD/X3F07N1UEuC4odyZ8PaVaaCNzKpofIV/ix0K
   J6N5py4OqB4KLGhJIR7MMZWpdVmcq+v41h4v6UuILtBNd8plTJrAP95hW
   XRyWEKUbSnSvNQ4VBMhp9Ngje6GnChYser7ncDlE3mrITRvXCC/sSqlls
   A==;
X-CSE-ConnectionGUID: D8R2axS+S+GoJjY5wvYYDw==
X-CSE-MsgGUID: 6q6jsBbTTLW8Go+CtVy+XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14371355"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="14371355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 22:46:52 -0700
X-CSE-ConnectionGUID: /uJpaDaUQ1GjrS1UmznOZA==
X-CSE-MsgGUID: Q46rPVw3StKRW6bvGmdV7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="103971607"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2024 22:46:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv9F9-000P59-0v;
	Mon, 30 Sep 2024 05:46:47 +0000
Date: Mon, 30 Sep 2024 13:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2188/2444]
 drivers/gpu/drm/phytium/phytium_display_drv.c:32:34: error: expected ')'
 before 'int'
Message-ID: <202409301350.xb2KSX8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: cb18a9e935892ef3d4038737f1d686ebc82d1afa [2188/2444] DRM phytium Add Phytium Display Engine support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409301350.xb2KSX8o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301350.xb2KSX8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301350.xb2KSX8o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/phytium/phytium_display_drv.c:32:34: error: expected ')' before 'int'
      32 | module_param(dc_fake_mode_enable, int, 0644);
         |                                  ^~~~
         |                                  )
>> drivers/gpu/drm/phytium/phytium_display_drv.c:33:38: error: expected ')' before string constant
      33 | MODULE_PARM_DESC(dc_fake_mode_enable, "Enable DC fake mode (0-disabled; 1-enabled; default-0)");
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      )
   drivers/gpu/drm/phytium/phytium_display_drv.c:36:37: error: expected ')' before 'int'
      36 | module_param(dc_fast_training_check, int, 0644);
         |                                     ^~~~
         |                                     )
   drivers/gpu/drm/phytium/phytium_display_drv.c:37:41: error: expected ')' before string constant
      37 | MODULE_PARM_DESC(dc_fast_training_check, "Check dp fast training (0-disabled; 1-enabled; default-1)");
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         )
   drivers/gpu/drm/phytium/phytium_display_drv.c:40:31: error: expected ')' before 'int'
      40 | module_param(num_source_rates, int, 0644);
         |                               ^~~~
         |                               )
   drivers/gpu/drm/phytium/phytium_display_drv.c:41:35: error: expected ')' before string constant
      41 | MODULE_PARM_DESC(num_source_rates, "set the source max rates (1-1.62Gbps; 2-2.7Gbps; 3-5.4Gbps; 4-8.1Gbps; default-4)");
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   )
   drivers/gpu/drm/phytium/phytium_display_drv.c:44:36: error: expected ')' before 'int'
      44 | module_param(source_max_lane_count, int, 0644);
         |                                    ^~~~
         |                                    )
   drivers/gpu/drm/phytium/phytium_display_drv.c:45:40: error: expected ')' before string constant
      45 | MODULE_PARM_DESC(source_max_lane_count, "set the source lane count (1-1lane; 2-2lane; 4-4lane; default-4)");
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        )
   drivers/gpu/drm/phytium/phytium_display_drv.c:48:34: error: expected ')' before 'int'
      48 | module_param(link_dynamic_adjust, int, 0644);
         |                                  ^~~~
         |                                  )
   drivers/gpu/drm/phytium/phytium_display_drv.c:49:38: error: expected ')' before string constant
      49 | MODULE_PARM_DESC(link_dynamic_adjust, "dynamic select the train pamameter according to the display mode (0-disabled; 1-enabled; default-1)");
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      )
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_preinstall':
   drivers/gpu/drm/phytium/phytium_display_drv.c:89:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
      89 |         int i, status;
         |                ^~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c: In function 'phytium_irq_uninstall':
   drivers/gpu/drm/phytium/phytium_display_drv.c:100:16: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     100 |         int i, status;
         |                ^~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c: At top level:
   drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: data definition has no type or storage class
     433 | module_init(phytium_display_init);
         | ^~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
   drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: data definition has no type or storage class
     434 | module_exit(phytium_display_exit);
         | ^~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/gpu/drm/phytium/phytium_display_drv.c:436:16: error: expected declaration specifiers or '...' before string constant
     436 | MODULE_LICENSE("GPL");
         |                ^~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:437:15: error: expected declaration specifiers or '...' before string constant
     437 | MODULE_AUTHOR("Yang Xun <yangxun@phytium.com.cn>");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:438:20: error: expected declaration specifiers or '...' before string constant
     438 | MODULE_DESCRIPTION("Phytium Display Controller");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:426:20: warning: 'phytium_display_exit' defined but not used [-Wunused-function]
     426 | static void __exit phytium_display_exit(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:413:19: warning: 'phytium_display_init' defined but not used [-Wunused-function]
     413 | static int __init phytium_display_init(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/gpu/drm/phytium/phytium_pci.c:20:28: error: expected ')' before 'int'
      20 | module_param(dc_msi_enable, int, 0644);
         |                            ^~~~
         |                            )
>> drivers/gpu/drm/phytium/phytium_pci.c:21:32: error: expected ')' before string constant
      21 | MODULE_PARM_DESC(dc_msi_enable, "Enable DC msi interrupt (0-disabled; 1-enabled; default-0)");
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                )
   drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for 'phytium_pci_vram_fini' [-Wmissing-prototypes]
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:89:5: warning: no previous prototype for 'phytium_pci_dma_init' [-Wmissing-prototypes]
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: data definition has no type or storage class
     379 | MODULE_DEVICE_TABLE(pci, phytium_display_pci_ids);
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_pci.c:379:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
   drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   cc1: some warnings being treated as errors


vim +32 drivers/gpu/drm/phytium/phytium_display_drv.c

    30	
    31	int dc_fake_mode_enable;
  > 32	module_param(dc_fake_mode_enable, int, 0644);
  > 33	MODULE_PARM_DESC(dc_fake_mode_enable, "Enable DC fake mode (0-disabled; 1-enabled; default-0)");
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
