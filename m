Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18BC125A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 03:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708745276; cv=none; b=hbGl2WUyL4wC1FIJoTTOc0HeGHcxnRFGJZAf6EO8SdxErfI8rpFEosLpj04WIwj+n3eWdKqZb2p92+asDh2sztzcWrik/JLgPzr+p+HxfOczVglVBeWzBxCgV9EyzcIAVctAkjkGlG2CIyxCUjh+igbLd+94Z2IIAuxVWOvnvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708745276; c=relaxed/simple;
	bh=TSpCNW/YFSPaxU33ibv2JHoTNggH0vdaO80e5Hj058g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZpgmuJL/IvfNPaxxMxADD8Z3RMLKJ2eB2Iqz0HX+x40uEYiEB74YnYVSlYJw8ijBMhYBiUv/NPDaInVosQ7ED5+PctpgFdZtAyuUV85d6JnePOQ3i1AC/2HU/T5tI+KQ2cWi90NaQQPDjTjmoKZ8G5MR24dub9lYbIgrsjBwaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGDtvIql; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGDtvIql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708745275; x=1740281275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TSpCNW/YFSPaxU33ibv2JHoTNggH0vdaO80e5Hj058g=;
  b=EGDtvIqlvpihA/GC1MeiaKyNELsOzFwt+6C2pRryjc9XZ5iG8Q2URmoN
   VerP4vmE2Jam9Vr4ztKF/pFZpXCR5nQl3K1spoLmhG11d3JKI/JWwZ5Yk
   4ovLcNOXlTc/rMy4JwTHBaAOMdK1kWXA/St6VKRCCWtFzH0+7NYST2Gfi
   1kq4D1oubf2NKMTXsQnCX4Si9DqB/t3s16ZwswYoXhEfE7LfL3alahSPb
   FOwo/ybvj3jxNdtlBTGM7n+P0cvE/OhQ6jXKhcehhQAqo/bdyBTcqfXU2
   tqhLQH7hRqY1rKAsCaWIN4UzC0l7sVye53tUAKkiIpKoAE6BChhM0PgtW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6904766"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6904766"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 19:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10810086"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Feb 2024 19:27:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdihB-00089s-1z;
	Sat, 24 Feb 2024 03:27:34 +0000
Date: Sat, 24 Feb 2024 11:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 22/41]
 drivers/gpu/drm/phytium/phytium_display_drv.c:32:34: error: expected ')'
 before 'int'
Message-ID: <202402241154.vteZQ9QM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: 89d90afb8afafa96563d5108a05d77644f86af28 [22/41] DRM phytium Add Phytium Display Engine support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241154.vteZQ9QM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241154.vteZQ9QM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241154.vteZQ9QM-lkp@intel.com/

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
   drivers/gpu/drm/phytium/phytium_display_drv.c:433:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: data definition has no type or storage class
     434 | module_exit(phytium_display_exit);
         | ^~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
   drivers/gpu/drm/phytium/phytium_display_drv.c:434:1: warning: parameter names (without types) in function declaration
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
   drivers/gpu/drm/phytium/phytium_pci.c:379:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +32 drivers/gpu/drm/phytium/phytium_display_drv.c

    30	
    31	int dc_fake_mode_enable;
  > 32	module_param(dc_fake_mode_enable, int, 0644);
  > 33	MODULE_PARM_DESC(dc_fake_mode_enable, "Enable DC fake mode (0-disabled; 1-enabled; default-0)");
    34	
    35	int dc_fast_training_check = 1;
    36	module_param(dc_fast_training_check, int, 0644);
    37	MODULE_PARM_DESC(dc_fast_training_check, "Check dp fast training (0-disabled; 1-enabled; default-1)");
    38	
    39	int num_source_rates = 4;
    40	module_param(num_source_rates, int, 0644);
    41	MODULE_PARM_DESC(num_source_rates, "set the source max rates (1-1.62Gbps; 2-2.7Gbps; 3-5.4Gbps; 4-8.1Gbps; default-4)");
    42	
    43	int source_max_lane_count = 4;
    44	module_param(source_max_lane_count, int, 0644);
    45	MODULE_PARM_DESC(source_max_lane_count, "set the source lane count (1-1lane; 2-2lane; 4-4lane; default-4)");
    46	
    47	int link_dynamic_adjust;
    48	module_param(link_dynamic_adjust, int, 0644);
    49	MODULE_PARM_DESC(link_dynamic_adjust, "dynamic select the train pamameter according to the display mode (0-disabled; 1-enabled; default-1)");
    50	
    51	int phytium_wait_cmd_done(struct phytium_display_private *priv,
    52					    uint32_t register_offset,
    53					    uint32_t request_bit,
    54					    uint32_t reply_bit)
    55	{
    56		int timeout = 500, config = 0, ret = 0;
    57	
    58		do {
    59			mdelay(1);
    60			timeout--;
    61			config = phytium_readl_reg(priv, 0, register_offset);
    62		} while ((!(config & reply_bit)) && timeout);
    63	
    64		phytium_writel_reg(priv, config & (~request_bit), 0, register_offset);
    65	
    66		if (timeout == 0) {
    67			DRM_ERROR("wait cmd reply timeout\n");
    68			ret = -EBUSY;
    69		} else {
    70			timeout = 500;
    71			do {
    72				mdelay(1);
    73				timeout--;
    74				config = phytium_readl_reg(priv, 0, register_offset);
    75			} while ((config & reply_bit) && timeout);
    76			if (timeout == 0) {
    77				DRM_ERROR("clear cmd timeout\n");
    78				ret = -EBUSY;
    79			}
    80		}
    81		mdelay(5);
    82	
    83		return ret;
    84	}
    85	
    86	static void phytium_irq_preinstall(struct drm_device *dev)
    87	{
    88		struct phytium_display_private *priv = dev->dev_private;
    89		int i, status;
    90	
    91		for_each_pipe_masked(priv, i) {
    92			status = phytium_readl_reg(priv, priv->dc_reg_base[i], PHYTIUM_DC_INT_STATUS);
    93			phytium_writel_reg(priv, INT_DISABLE, priv->dc_reg_base[i], PHYTIUM_DC_INT_ENABLE);
    94		}
    95	}
    96	
    97	static void phytium_irq_uninstall(struct drm_device *dev)
    98	{
    99		struct phytium_display_private *priv = dev->dev_private;
 > 100		int i, status;
   101	
   102		for_each_pipe_masked(priv, i) {
   103			status = phytium_readl_reg(priv, priv->dc_reg_base[i], PHYTIUM_DC_INT_STATUS);
   104			phytium_writel_reg(priv, INT_DISABLE, priv->dc_reg_base[i], PHYTIUM_DC_INT_ENABLE);
   105		}
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
