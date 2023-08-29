Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B651139A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693293529; x=1724829529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8snRcTBg9V8lkDCIBGkZzLWmJ0HIE8uUo5rWW2ta0g=;
  b=g47uhg4bjvI13GWn6UnpA1E0ho/J+CEavMFAFz/TBY7wyPw4PWDcLmpp
   lD9OHgxzQuVP5rS15Bg4WFJZKuH4Sa9Sy/L0Numi6dCFdSPkAVvr603ac
   h5vHVd55H7yXlArYkFzqXPu7eU/17z5iYQoWCLgSbj85nbTBRJ2oFW/ZT
   k6PfaVHVoagu3UlnSiEpb9vxb7hAFFatS4CKKwXtoKuo6H08j6VVcZJfp
   wpEZTUwixnvIlHVgcPJqzr/B+c6wLmffJO8QF1a6h9a2ky6ez1uGtRgkX
   v66M6ZaOgtand1vxI1ZgR7d7uXRR7lRegc3BpnYQviM4VC1Ha2LDEl49l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="461660847"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="461660847"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 00:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803987016"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="803987016"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 00:18:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaszo-0008Wn-1a;
	Tue, 29 Aug 2023 07:18:41 +0000
Date: Tue, 29 Aug 2023 15:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 24/34]
 drivers/misc/esp32-ipc.c:145:20: warning: cast to pointer from integer of
 different size
Message-ID: <202308291554.Mg3uJnL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   edbe560c2ce9974f4b2e47ca13050e6a62d604b3
commit: 20b0bc011b5325431d41d666f8f949d0c6ede432 [24/34] esp_wifi: add IPC transport
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230829/202308291554.Mg3uJnL9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291554.Mg3uJnL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291554.Mg3uJnL9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/esp32-ipc.c: In function 'init_hw':
>> drivers/misc/esp32-ipc.c:145:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     145 |         hw->hw_q = (void *)readl(p);
         |                    ^
   At top level:
>> drivers/misc/esp32-ipc.c:221:34: warning: 'esp32_ipc_match' defined but not used [-Wunused-const-variable=]
     221 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +145 drivers/misc/esp32-ipc.c

4886a7e20027ff Max Filippov 2023-08-11  137  
4886a7e20027ff Max Filippov 2023-08-11  138  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
4886a7e20027ff Max Filippov 2023-08-11  139  {
4886a7e20027ff Max Filippov 2023-08-11  140  	void __user *p;
4886a7e20027ff Max Filippov 2023-08-11  141  
4886a7e20027ff Max Filippov 2023-08-11  142  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
4886a7e20027ff Max Filippov 2023-08-11  143  	if (IS_ERR(p))
4886a7e20027ff Max Filippov 2023-08-11  144  		return PTR_ERR(p);
4886a7e20027ff Max Filippov 2023-08-11 @145  	hw->hw_q = (void *)readl(p);
4886a7e20027ff Max Filippov 2023-08-11  146  	devm_iounmap(&pdev->dev, p);
4886a7e20027ff Max Filippov 2023-08-11  147  
4886a7e20027ff Max Filippov 2023-08-11  148  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
4886a7e20027ff Max Filippov 2023-08-11  149  	if (IS_ERR(hw->regs))
4886a7e20027ff Max Filippov 2023-08-11  150  		return PTR_ERR(hw->regs);
4886a7e20027ff Max Filippov 2023-08-11  151  
4886a7e20027ff Max Filippov 2023-08-11  152  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
4886a7e20027ff Max Filippov 2023-08-11  153  		__func__, hw->regs, hw->hw_q);
4886a7e20027ff Max Filippov 2023-08-11  154  	if (hw->hw_q) {
4886a7e20027ff Max Filippov 2023-08-11  155  		u32 i;
4886a7e20027ff Max Filippov 2023-08-11  156  
4886a7e20027ff Max Filippov 2023-08-11  157  		for (i = 0; i < 2; ++i) {
4886a7e20027ff Max Filippov 2023-08-11  158  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
4886a7e20027ff Max Filippov 2023-08-11  159  				__func__, i,
4886a7e20027ff Max Filippov 2023-08-11  160  				hw->hw_q[i].offset,
4886a7e20027ff Max Filippov 2023-08-11  161  				hw->hw_q[i].mask);
4886a7e20027ff Max Filippov 2023-08-11  162  		}
4886a7e20027ff Max Filippov 2023-08-11  163  	} else {
4886a7e20027ff Max Filippov 2023-08-11  164  		return -ENODEV;
4886a7e20027ff Max Filippov 2023-08-11  165  	}
4886a7e20027ff Max Filippov 2023-08-11  166  
4886a7e20027ff Max Filippov 2023-08-11  167  	hw->irq = platform_get_irq(pdev, 0);
4886a7e20027ff Max Filippov 2023-08-11  168  	if (hw->irq >= 0) {
4886a7e20027ff Max Filippov 2023-08-11  169  		int ret;
4886a7e20027ff Max Filippov 2023-08-11  170  
4886a7e20027ff Max Filippov 2023-08-11  171  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
4886a7e20027ff Max Filippov 2023-08-11  172  						esp32_ipc_irq_handler,
4886a7e20027ff Max Filippov 2023-08-11  173  						esp32_ipc_thread_handler,
4886a7e20027ff Max Filippov 2023-08-11  174  						IRQF_SHARED, pdev->name, hw);
4886a7e20027ff Max Filippov 2023-08-11  175  		if (ret < 0) {
4886a7e20027ff Max Filippov 2023-08-11  176  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
4886a7e20027ff Max Filippov 2023-08-11  177  			return ret;
4886a7e20027ff Max Filippov 2023-08-11  178  		}
4886a7e20027ff Max Filippov 2023-08-11  179  	} else {
4886a7e20027ff Max Filippov 2023-08-11  180  		dev_err(&pdev->dev, "missing IRQ property\n");
4886a7e20027ff Max Filippov 2023-08-11  181  		return -ENODEV;
4886a7e20027ff Max Filippov 2023-08-11  182  	}
4886a7e20027ff Max Filippov 2023-08-11  183  
4886a7e20027ff Max Filippov 2023-08-11  184  	return 0;
4886a7e20027ff Max Filippov 2023-08-11  185  }
4886a7e20027ff Max Filippov 2023-08-11  186  
4886a7e20027ff Max Filippov 2023-08-11  187  static int esp32_ipc_probe(struct platform_device *pdev)
4886a7e20027ff Max Filippov 2023-08-11  188  {
4886a7e20027ff Max Filippov 2023-08-11  189  	struct esp32_ipc *hw =
4886a7e20027ff Max Filippov 2023-08-11  190  		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
4886a7e20027ff Max Filippov 2023-08-11  191  	int ret;
4886a7e20027ff Max Filippov 2023-08-11  192  
4886a7e20027ff Max Filippov 2023-08-11  193  	if (!hw)
4886a7e20027ff Max Filippov 2023-08-11  194  		return -ENOMEM;
4886a7e20027ff Max Filippov 2023-08-11  195  	platform_set_drvdata(pdev, hw);
4886a7e20027ff Max Filippov 2023-08-11  196  
4886a7e20027ff Max Filippov 2023-08-11  197  	ret = init_hw(pdev, hw);
4886a7e20027ff Max Filippov 2023-08-11  198  	if (ret < 0)
4886a7e20027ff Max Filippov 2023-08-11  199  		return ret;
4886a7e20027ff Max Filippov 2023-08-11  200  
4886a7e20027ff Max Filippov 2023-08-11  201  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].read = 0;
4886a7e20027ff Max Filippov 2023-08-11  202  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].write = 0;
4886a7e20027ff Max Filippov 2023-08-11  203  	wmb();
4886a7e20027ff Max Filippov 2023-08-11  204  	writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
4886a7e20027ff Max Filippov 2023-08-11  205  
4886a7e20027ff Max Filippov 2023-08-11  206  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
4886a7e20027ff Max Filippov 2023-08-11  207  	return ret;
4886a7e20027ff Max Filippov 2023-08-11  208  }
4886a7e20027ff Max Filippov 2023-08-11  209  
4886a7e20027ff Max Filippov 2023-08-11  210  static int esp32_ipc_remove(struct platform_device *pdev)
4886a7e20027ff Max Filippov 2023-08-11  211  {
4886a7e20027ff Max Filippov 2023-08-11  212  	struct esp32_ipc *hw = platform_get_drvdata(pdev);
4886a7e20027ff Max Filippov 2023-08-11  213  
4886a7e20027ff Max Filippov 2023-08-11  214  	if (!hw)
4886a7e20027ff Max Filippov 2023-08-11  215  		return 0;
4886a7e20027ff Max Filippov 2023-08-11  216  
4886a7e20027ff Max Filippov 2023-08-11  217  	disable_irq(hw->irq);
4886a7e20027ff Max Filippov 2023-08-11  218  	return 0;
4886a7e20027ff Max Filippov 2023-08-11  219  }
4886a7e20027ff Max Filippov 2023-08-11  220  
4886a7e20027ff Max Filippov 2023-08-11 @221  static const struct of_device_id esp32_ipc_match[] = {
4886a7e20027ff Max Filippov 2023-08-11  222  	{
4886a7e20027ff Max Filippov 2023-08-11  223  		.compatible = "esp,esp32-ipc",
4886a7e20027ff Max Filippov 2023-08-11  224  	}, {},
4886a7e20027ff Max Filippov 2023-08-11  225  };
4886a7e20027ff Max Filippov 2023-08-11  226  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
4886a7e20027ff Max Filippov 2023-08-11  227  

:::::: The code at line 145 was first introduced by commit
:::::: 4886a7e20027ffdd9ec581eee4deb20d3d407ba5 misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
