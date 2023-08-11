Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137981172E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 17:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691776730; x=1723312730;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FevwwWOPZNG8rkzbLDzM80G9Y9syjNANyIjHRRDrugM=;
  b=XsTcw/53naJndJAe8zGADIGO8LdplAHRa6tgcBRFcXXsJSGOSWKdBGKt
   TARVXfqfEmAu5hxZCcQR4Pvc6CDd13tjs3YyP9FQQQ/2GjSG54uNQ0DRR
   wuBnun+B+8L2pS73xy6pWOBeXG7h/lK3tnjSlB7xzylgZnvbkycVNOTzW
   95Ms8kJThGgVtryho2VMUQYkJV36nL/6hKDUivxn1MjIQpikIgd9QUnsE
   2Y66I1P6qm7VZZHQc5hndYvvYW75txEhVdIb/pyzp9v90XSnfLVMOD005
   GtxsJB0PaSB07OZV/4URJltEy397Es2t3q9LKn5D+s8dIcoBqlxQhhXH9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369198059"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="369198059"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 10:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682611695"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682611695"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 10:58:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUWPO-0007vM-1a;
	Fri, 11 Aug 2023 17:58:46 +0000
Date: Sat, 12 Aug 2023 01:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:warnings-2 5/9]
 drivers/pci/controller/dwc/pci-dra7xx.c:754:55: warning: '%d' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 2
Message-ID: <202308120109.NqW9nChe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git warnings-2
head:   5ddc13aed5c9ee03dd6bad7254a5918e6f36f1fa
commit: 707697efa19c54618ea9271158661fa31b4d7461 [5/9] extrawarn: enable format and stringop overflow warnings in W=1
config: alpha-randconfig-r035-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120109.NqW9nChe-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120109.NqW9nChe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120109.NqW9nChe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_probe':
>> drivers/pci/controller/dwc/pci-dra7xx.c:754:55: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
     754 |                 snprintf(name, sizeof(name), "pcie-phy%d", i);
         |                                                       ^~
   drivers/pci/controller/dwc/pci-dra7xx.c:754:46: note: directive argument in the range [0, 2147483646]
     754 |                 snprintf(name, sizeof(name), "pcie-phy%d", i);
         |                                              ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-dra7xx.c:754:17: note: 'snprintf' output between 10 and 19 bytes into a destination of size 10
     754 |                 snprintf(name, sizeof(name), "pcie-phy%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/pci/controller/dwc/pcie-designware.c: In function 'dw_pcie_edma_detect':
>> drivers/pci/controller/dwc/pcie-designware.c:898:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Wformat-truncation=]
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                                                  ^~
   In function 'dw_pcie_edma_irq_verify',
       inlined from 'dw_pcie_edma_detect' at drivers/pci/controller/dwc/pcie-designware.c:949:8:
   drivers/pci/controller/dwc/pcie-designware.c:898:46: note: directive argument in the range [-2147483648, 22]
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                                              ^~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:898:17: note: 'snprintf' output between 5 and 15 bytes into a destination of size 6
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/intel/i40e/i40e_ptp.c: In function 'i40e_ptp_init':
>> drivers/net/ethernet/intel/i40e/i40e_ptp.c:1352:27: warning: '%s' directive output may be truncated writing up to 287 bytes into a region of size 64 [-Wformat-truncation=]
    1352 |                          "%s", sdp_desc[i].name);
         |                           ^~
   In function 'i40e_init_pin_config',
       inlined from 'i40e_ptp_create_clock' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1391:13,
       inlined from 'i40e_ptp_init' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1496:8:
   drivers/net/ethernet/intel/i40e/i40e_ptp.c:1350:17: note: 'snprintf' output between 1 and 288 bytes into a destination of size 64
    1350 |                 snprintf(pf->ptp_caps.pin_config[i].name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1351 |                          sizeof(pf->ptp_caps.pin_config[i].name),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1352 |                          "%s", sdp_desc[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/sfc/siena/ethtool_common.c: In function 'efx_fill_test':
>> drivers/net/ethernet/sfc/siena/ethtool_common.c:229:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size between 0 and 25 [-Wformat-truncation=]
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/siena/ethtool_common.c:227:17: note: 'snprintf' output between 32 and 64 bytes into a destination of size 32
     227 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     228 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/misc/bcm-vk/bcm_vk_dev.c: In function 'bcm_vk_probe':
>> <command-line>: warning: '_ttyVK' directive output may be truncated writing 6 bytes into a region of size between 3 and 12 [-Wformat-truncation=]
   drivers/misc/bcm-vk/bcm_vk_dev.c:1456:38: note: in expansion of macro 'KBUILD_MODNAME'
    1456 |         snprintf(name, sizeof(name), KBUILD_MODNAME ".%d_ttyVK", id);
         |                                      ^~~~~~~~~~~~~~
   drivers/misc/bcm-vk/bcm_vk_dev.c:1456:9: note: 'snprintf' output between 15 and 24 bytes into a destination of size 20
    1456 |         snprintf(name, sizeof(name), KBUILD_MODNAME ".%d_ttyVK", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c: In function 'iavf_print_link_message':
>> drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:1439:60: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 1 and 11 [-Wformat-truncation=]
    1439 |                 snprintf(speed, IAVF_MAX_SPEED_STRLEN, "%d %s",
         |                                                            ^~
    1440 |                          link_speed_mbps, "Mbps");
         |                                           ~~~~~~            
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:1439:17: note: 'snprintf' output between 7 and 17 bytes into a destination of size 13
    1439 |                 snprintf(speed, IAVF_MAX_SPEED_STRLEN, "%d %s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1440 |                          link_speed_mbps, "Mbps");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nouveau/nouveau_backlight.c: In function 'nouveau_backlight_init':
>> drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
      56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                                                                     ^~
   In function 'nouveau_get_backlight_name',
       inlined from 'nouveau_backlight_init' at drivers/gpu/drm/nouveau/nouveau_backlight.c:423:7:
   drivers/gpu/drm/nouveau/nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
      56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                                                        ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_backlight.c:56:17: note: 'snprintf' output between 14 and 23 bytes into a destination of size 15
      56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c: In function 'amdgpu_sdma_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:217:64: warning: '.bin' directive output may be truncated writing 4 bytes into a region of size between 0 and 32 [-Wformat-truncation=]
     217 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s%d.bin", ucode_prefix, instance);
         |                                                                ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:217:17: note: 'snprintf' output between 13 and 52 bytes into a destination of size 40
     217 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s%d.bin", ucode_prefix, instance);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:215:66: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     215 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:215:17: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
     215 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1406:66: warning: '%s' directive output may be truncated writing up to 1 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    1406 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1406:17: note: 'snprintf' output between 16 and 46 bytes into a destination of size 40
    1406 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1407 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1408 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1401:66: warning: '%s' directive output may be truncated writing 1 byte into a region of size between 0 and 29 [-Wformat-truncation=]
    1401 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1401:17: note: 'snprintf' output between 17 and 46 bytes into a destination of size 40
    1401 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1402 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1403 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1401:66: warning: '%s' directive output may be truncated writing 2 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    1401 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                                  ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1401:17: note: 'snprintf' output between 18 and 47 bytes into a destination of size 40
    1401 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1402 |                          ucode_prefix,
         |                          ~~~~~~~~~~~~~
    1403 |                          pipe == AMDGPU_MES_SCHED_PIPE ? "_2" : "1");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1413:62: warning: '_mes.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
    1413 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1413:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
    1413 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1414 |                          ucode_prefix);
         |                          ~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early_init':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:93:58: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      93 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:93:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
      93 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c: In function 'smu_v13_0_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:107:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
     107 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                    ^~       ~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:107:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 30
     107 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +754 drivers/pci/controller/dwc/pci-dra7xx.c

c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  683  
e259c2926c016d drivers/pci/controller/dwc/pci-dra7xx.c Tony Lindgren          2021-03-10  684  static int dra7xx_pcie_probe(struct platform_device *pdev)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  685  {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  686  	u32 reg;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  687  	int ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  688  	int irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  689  	int i;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  690  	int phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  691  	struct phy **phy;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  692  	struct device_link **link;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  693  	void __iomem *base;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  694  	struct dw_pcie *pci;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  695  	struct dra7xx_pcie *dra7xx;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  696  	struct device *dev = &pdev->dev;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  697  	struct device_node *np = dev->of_node;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  698  	char name[10];
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  699  	struct gpio_desc *reset;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  700  	const struct dra7xx_pcie_of_data *data;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  701  	enum dw_pcie_device_mode mode;
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  702  	u32 b1co_mode_sel_mask;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  703  
dc078f15715a8e drivers/pci/controller/dwc/pci-dra7xx.c Fan Fei                2021-12-22  704  	data = of_device_get_match_data(dev);
dc078f15715a8e drivers/pci/controller/dwc/pci-dra7xx.c Fan Fei                2021-12-22  705  	if (!data)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  706  		return -EINVAL;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  707  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  708  	mode = (enum dw_pcie_device_mode)data->mode;
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  709  	b1co_mode_sel_mask = data->b1co_mode_sel_mask;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  710  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  711  	dra7xx = devm_kzalloc(dev, sizeof(*dra7xx), GFP_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  712  	if (!dra7xx)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  713  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  714  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  715  	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  716  	if (!pci)
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  717  		return -ENOMEM;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  718  
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  719  	pci->dev = dev;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  720  	pci->ops = &dw_pcie_ops;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  721  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  722  	irq = platform_get_irq(pdev, 0);
caecb05c800081 drivers/pci/controller/dwc/pci-dra7xx.c Krzysztof Wilczyński   2020-08-02  723  	if (irq < 0)
a0d21ba120d2c7 drivers/pci/dwc/pci-dra7xx.c            Gustavo A. R. Silva    2017-08-09  724  		return irq;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  725  
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun            2020-04-29  726  	base = devm_platform_ioremap_resource_byname(pdev, "ti_conf");
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun            2020-04-29  727  	if (IS_ERR(base))
c8a119779f5609 drivers/pci/controller/dwc/pci-dra7xx.c Wei Yongjun            2020-04-29  728  		return PTR_ERR(base);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  729  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  730  	phy_count = of_property_count_strings(np, "phy-names");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  731  	if (phy_count < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  732  		dev_err(dev, "unable to find the strings\n");
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  733  		return phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  734  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  735  
a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook              2018-06-12  736  	phy = devm_kcalloc(dev, phy_count, sizeof(*phy), GFP_KERNEL);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  737  	if (!phy)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  738  		return -ENOMEM;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  739  
a86854d0c599b3 drivers/pci/dwc/pci-dra7xx.c            Kees Cook              2018-06-12  740  	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  741  	if (!link)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  742  		return -ENOMEM;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  743  
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  744  	dra7xx->clk = devm_clk_get_optional(dev, NULL);
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  745  	if (IS_ERR(dra7xx->clk))
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  746  		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  747  				     "clock request failed");
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  748  
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  749  	ret = clk_prepare_enable(dra7xx->clk);
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  750  	if (ret)
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  751  		return ret;
5af9405397bfb9 drivers/pci/controller/dwc/pci-dra7xx.c Luca Ceresoli          2021-05-31  752  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  753  	for (i = 0; i < phy_count; i++) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22 @754  		snprintf(name, sizeof(name), "pcie-phy%d", i);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  755  		phy[i] = devm_phy_get(dev, name);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  756  		if (IS_ERR(phy[i]))
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  757  			return PTR_ERR(phy[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  758  
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  759  		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  760  		if (!link[i]) {
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  761  			ret = -EINVAL;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  762  			goto err_link;
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  763  		}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  764  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  765  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  766  	dra7xx->base = base;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  767  	dra7xx->phy = phy;
442ec4c04d1235 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  768  	dra7xx->pci = pci;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  769  	dra7xx->phy_count = phy_count;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  770  
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  771  	if (phy_count == 2) {
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  772  		ret = dra7xx_pcie_configure_two_lane(dev, b1co_mode_sel_mask);
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  773  		if (ret < 0)
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  774  			dra7xx->phy_count = 1; /* Fallback to x1 lane mode */
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  775  	}
c232c0df9610bf drivers/pci/controller/dwc/pci-dra7xx.c Kishon Vijay Abraham I 2019-01-24  776  
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  777  	ret = dra7xx_pcie_enable_phy(dra7xx);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  778  	if (ret) {
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  779  		dev_err(dev, "failed to enable phy\n");
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  780  		return ret;
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  781  	}
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  782  
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  783  	platform_set_drvdata(pdev, dra7xx);
9bcf0a6fdc5062 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-02-15  784  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  785  	pm_runtime_enable(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  786  	ret = pm_runtime_get_sync(dev);
d3f4caa355c1c9 drivers/pci/host/pci-dra7xx.c           Fabio Estevam          2015-08-20  787  	if (ret < 0) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  788  		dev_err(dev, "pm_runtime_get_sync failed\n");
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  789  		goto err_get_sync;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  790  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  791  
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  792  	reset = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  793  	if (IS_ERR(reset)) {
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  794  		ret = PTR_ERR(reset);
602d38bc65aa29 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  795  		dev_err(&pdev->dev, "gpio request failed, ret %d\n", ret);
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  796  		goto err_gpio;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  797  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  798  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  799  	reg = dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE_CMD);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  800  	reg &= ~LTSSM_EN;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  801  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_DEVICE_CMD, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  802  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  803  	switch (mode) {
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  804  	case DW_PCIE_RC_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  805  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_HOST)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  806  			ret = -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  807  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  808  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  809  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  810  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  811  				   DEVICE_TYPE_RC);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  812  
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  813  		ret = dra7xx_pcie_unaligned_memaccess(dev);
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  814  		if (ret)
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  815  			dev_err(dev, "WA for Errata i870 not applied\n");
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  816  
23926c8dbd6fdc drivers/pci/host/pci-dra7xx.c           Jingoo Han             2014-11-06  817  		ret = dra7xx_add_pcie_port(dra7xx, pdev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  818  		if (ret < 0)
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  819  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  820  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  821  	case DW_PCIE_EP_TYPE:
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  822  		if (!IS_ENABLED(CONFIG_PCI_DRA7XX_EP)) {
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  823  			ret = -ENODEV;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  824  			goto err_gpio;
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  825  		}
f1aba0a0de55c7 drivers/pci/dwc/pci-dra7xx.c            Niklas Cassel          2017-12-20  826  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  827  		dra7xx_pcie_writel(dra7xx, PCIECTRL_TI_CONF_DEVICE_TYPE,
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  828  				   DEVICE_TYPE_EP);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  829  
726d75a6d243bf drivers/pci/controller/dwc/pci-dra7xx.c Vignesh R              2018-09-25  830  		ret = dra7xx_pcie_unaligned_memaccess(dev);
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  831  		if (ret)
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  832  			goto err_gpio;
f7a2757f6cd0aa drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  833  
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  834  		ret = dra7xx_add_pcie_ep(dra7xx, pdev);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  835  		if (ret < 0)
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  836  			goto err_gpio;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  837  		break;
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  838  	default:
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  839  		dev_err(dev, "INVALID device type %d\n", mode);
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  840  	}
608793e27b3313 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-03-27  841  	dra7xx->mode = mode;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  842  
da87d35a6e5148 drivers/pci/controller/dwc/pci-dra7xx.c Manivannan Sadhasivam  2023-01-24  843  	ret = devm_request_threaded_irq(dev, irq, NULL, dra7xx_pcie_irq_handler,
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  844  			       IRQF_SHARED, "dra7xx-pcie-main", dra7xx);
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  845  	if (ret) {
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  846  		dev_err(dev, "failed to request irq\n");
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  847  		goto err_gpio;
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  848  	}
d4c7d1a089d6fd drivers/pci/dwc/pci-dra7xx.c            Keerthy                2017-03-13  849  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  850  	return 0;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  851  
78bdcad05ea17f drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-28  852  err_gpio:
0e2bdb0e7abf4b drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2015-07-31  853  err_get_sync:
c2615d620a852a drivers/pci/controller/dwc/pci-dra7xx.c Dinghao Liu            2020-05-20  854  	pm_runtime_put(dev);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  855  	pm_runtime_disable(dev);
1f6c4501c667a6 drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-01-11  856  	dra7xx_pcie_disable_phy(dra7xx);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  857  
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  858  err_link:
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  859  	while (--i >= 0)
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  860  		device_link_del(link[i]);
7a4db656a6350f drivers/pci/dwc/pci-dra7xx.c            Kishon Vijay Abraham I 2017-10-09  861  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  862  	return ret;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  863  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  864  

:::::: The code at line 754 was first introduced by commit
:::::: 47ff3de911a728cdf9ecc6ad777131902cff62b4 PCI: dra7xx: Add TI DRA7xx PCIe driver

:::::: TO: Kishon Vijay Abraham I <kishon@ti.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
