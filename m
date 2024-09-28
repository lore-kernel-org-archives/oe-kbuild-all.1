Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC2B641
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 00:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727484299; cv=none; b=jyiMsl5SbkavMZ3JT6KpV3c/m6prNqum/hOJ0QvtB/hYW+P6MYagXwp9lJunph8BpGW+SjqXNZsmz7ndCC4umnPvwta1Bdn4QADH1RvPTKmTAyD8QYycUkTc3NqbRRS+6tfbRzQphRz7CVJJl+bFp1rAVFVsr43ke1nnaqYrJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727484299; c=relaxed/simple;
	bh=ZBdyFs7pdAASFQ5kiHkDIXVPJ/KZKjlG8zyezPSY0ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQGVdtnelVVNG3YfjIDVqZbL1mWhUnSLEs8CjWsTAOPLGJjgsrZtr4gVeqIUE5vgMxMJujyIkxpw89HofYMp3SQkOLsAK21bXI8sU6+PdRAqoBEj6dFgEiTUENoRvUc1tbKs124CumQaLoBqDZKPZAnruUjq7KGW0O2oCatlVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpQv7zM4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpQv7zM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727484298; x=1759020298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZBdyFs7pdAASFQ5kiHkDIXVPJ/KZKjlG8zyezPSY0ys=;
  b=EpQv7zM4Yg3oCCIJVJhxBFEUka75uj7MyHsdkyzIzIIm4hwVFi5RiS7z
   j2O53AnV05b1djHTQApdmKtEFSsQmbMAcut49KEdzEArAFxbHgyWHeYmB
   F66kz792HgQzsIJ7qpQbOEEl6NfL0UHhEAY74Ao0XmLH9Sy6OKf9TRBIt
   Yz8hxLF1EmjRhq62ED3/SMvIW0jTwukwMUo9aU0+CWWPXiICbqURwrlJy
   yYkalrdVXOvMKRJ2Tx0v3BuAMznHsV9H0fPilsiqanEE9k7LAp3a2wySh
   lvofngWF37qwo49c7rqCm5A3bIreTP8R2WmheFkL8G7rXatql0PAgR/Sw
   A==;
X-CSE-ConnectionGUID: 6KwE/WCfR5W6IM+IvPRAzg==
X-CSE-MsgGUID: jED+mGowTtKL1sbxcC/m+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37779825"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37779825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 17:44:57 -0700
X-CSE-ConnectionGUID: kAdO298BTfqiHhd8dYgd6g==
X-CSE-MsgGUID: 1/FFn62hQrSTY9qxUXWE9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73011852"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 17:44:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suLZq-000MmF-2Y;
	Sat, 28 Sep 2024 00:44:50 +0000
Date: Sat, 28 Sep 2024 08:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2188/2444]
 drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: data
 definition has no type or storage class
Message-ID: <202409280807.z6luzX5G-lkp@intel.com>
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280807.z6luzX5G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280807.z6luzX5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280807.z6luzX5G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_display_drv.c:32:34: error: expected ')' before 'int'
      32 | module_param(dc_fake_mode_enable, int, 0644);
         |                                  ^~~~
         |                                  )
   drivers/gpu/drm/phytium/phytium_display_drv.c:33:38: error: expected ')' before string constant
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
>> drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: data definition has no type or storage class
     433 | module_init(phytium_display_init);
         | ^~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
>> drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: data definition has no type or storage class
     434 | module_exit(phytium_display_exit);
         | ^~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/gpu/drm/phytium/phytium_display_drv.c:436:16: error: expected declaration specifiers or '...' before string constant
     436 | MODULE_LICENSE("GPL");
         |                ^~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:437:15: error: expected declaration specifiers or '...' before string constant
     437 | MODULE_AUTHOR("Yang Xun <yangxun@phytium.com.cn>");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_display_drv.c:438:20: error: expected declaration specifiers or '...' before string constant
     438 | MODULE_DESCRIPTION("Phytium Display Controller");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:426:20: warning: 'phytium_display_exit' defined but not used [-Wunused-function]
     426 | static void __exit phytium_display_exit(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:413:19: warning: 'phytium_display_init' defined but not used [-Wunused-function]
     413 | static int __init phytium_display_init(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/phytium/phytium_pci.c:20:28: error: expected ')' before 'int'
      20 | module_param(dc_msi_enable, int, 0644);
         |                            ^~~~
         |                            )
   drivers/gpu/drm/phytium/phytium_pci.c:21:32: error: expected ')' before string constant
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
>> drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: data definition has no type or storage class
     379 | MODULE_DEVICE_TABLE(pci, phytium_display_pci_ids);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_pci.c:379:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
>> drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   cc1: some warnings being treated as errors


vim +433 drivers/gpu/drm/phytium/phytium_display_drv.c

   412	
 > 413	static int __init phytium_display_init(void)
   414	{
   415		int ret = 0;
   416	
   417		ret = platform_driver_register(&phytium_platform_driver);
   418		if (ret)
   419			return ret;
   420	
   421		ret = pci_register_driver(&phytium_pci_driver);
   422	
   423		return ret;
   424	}
   425	
 > 426	static void __exit phytium_display_exit(void)
   427	{
   428		pci_unregister_driver(&phytium_pci_driver);
   429	
   430		platform_driver_unregister(&phytium_platform_driver);
   431	}
   432	
 > 433	module_init(phytium_display_init);
   434	module_exit(phytium_display_exit);
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
