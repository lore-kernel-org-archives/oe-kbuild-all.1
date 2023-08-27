Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597F7EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 05:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693115796; x=1724651796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oBBe8NZeNSCSYg8GmMwkbpbuUl2PZqhP3UGYvB6hel0=;
  b=cAgqwXrKFoJgo8fGZ5v5mq+MrIUG8XYrp05Nv0Xwb2w6cGxnKwxoa18R
   h1Q+EZLUZPzJwa83/ofK2x0yG0HJ0slfOO+33T1BmMZ9Xg+j7qZ92MRsa
   168qP+wdkqjK8xzYM3E0efTd94SjuEBiWOCRLiRzJXgIt0blm57uYv/DY
   JCDRrKiJ9W3qJ/W3zI9jCR5h2oXTRwl7og7/qaJ9etlDFLz+nkJO5pWhc
   L9TNzuyW7EXKhccrsDtf1vngBfbD3ihXtk4ojjOgUeUv678U2NbSjf0tp
   VL4J0IP4363DMUVb0jHLURkgS9cYD1r6dsYR8YeGUxc2+1+YjJIwYrz7L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355252689"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="355252689"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 22:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881580363"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2023 22:56:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa8lF-0005Rj-1X;
	Sun, 27 Aug 2023 05:56:33 +0000
Date: Sun, 27 Aug 2023 13:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 40/48]
 drivers/misc/esp32-ipc.c:145:20: warning: cast to pointer from integer of
 different size
Message-ID: <202308271352.278Rydob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

First bad commit (maybe != root cause):

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   37fd9d9c4f957906efc14a9849942100af4f99e2
commit: 422f7405a1d5afa30398c9b6a9b6bc1b50a83be1 [40/48] esp_wifi: shmem: use esp_ipc driver
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230827/202308271352.278Rydob-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271352.278Rydob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271352.278Rydob-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/esp32-ipc.c: In function 'init_hw':
>> drivers/misc/esp32-ipc.c:145:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     145 |         hw->hw_q = (void *)readl(p);
         |                    ^
   drivers/misc/esp32-ipc.c: At top level:
>> drivers/misc/esp32-ipc.c:221:34: warning: 'esp32_ipc_match' defined but not used [-Wunused-const-variable=]
     221 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +145 drivers/misc/esp32-ipc.c

8c1fb47acdb23c Max Filippov 2023-08-11  137  
8c1fb47acdb23c Max Filippov 2023-08-11  138  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
8c1fb47acdb23c Max Filippov 2023-08-11  139  {
8c1fb47acdb23c Max Filippov 2023-08-11  140  	void __user *p;
8c1fb47acdb23c Max Filippov 2023-08-11  141  
8c1fb47acdb23c Max Filippov 2023-08-11  142  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
8c1fb47acdb23c Max Filippov 2023-08-11  143  	if (IS_ERR(p))
8c1fb47acdb23c Max Filippov 2023-08-11  144  		return PTR_ERR(p);
8c1fb47acdb23c Max Filippov 2023-08-11 @145  	hw->hw_q = (void *)readl(p);
8c1fb47acdb23c Max Filippov 2023-08-11  146  	devm_iounmap(&pdev->dev, p);
8c1fb47acdb23c Max Filippov 2023-08-11  147  
8c1fb47acdb23c Max Filippov 2023-08-11  148  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
8c1fb47acdb23c Max Filippov 2023-08-11  149  	if (IS_ERR(hw->regs))
8c1fb47acdb23c Max Filippov 2023-08-11  150  		return PTR_ERR(hw->regs);
8c1fb47acdb23c Max Filippov 2023-08-11  151  
8c1fb47acdb23c Max Filippov 2023-08-11  152  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
8c1fb47acdb23c Max Filippov 2023-08-11  153  		__func__, hw->regs, hw->hw_q);
8c1fb47acdb23c Max Filippov 2023-08-11  154  	if (hw->hw_q) {
8c1fb47acdb23c Max Filippov 2023-08-11  155  		u32 i;
8c1fb47acdb23c Max Filippov 2023-08-11  156  
8c1fb47acdb23c Max Filippov 2023-08-11  157  		for (i = 0; i < 2; ++i) {
8c1fb47acdb23c Max Filippov 2023-08-11  158  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
8c1fb47acdb23c Max Filippov 2023-08-11  159  				__func__, i,
8c1fb47acdb23c Max Filippov 2023-08-11  160  				hw->hw_q[i].offset,
8c1fb47acdb23c Max Filippov 2023-08-11  161  				hw->hw_q[i].mask);
8c1fb47acdb23c Max Filippov 2023-08-11  162  		}
8c1fb47acdb23c Max Filippov 2023-08-11  163  	} else {
8c1fb47acdb23c Max Filippov 2023-08-11  164  		return -ENODEV;
8c1fb47acdb23c Max Filippov 2023-08-11  165  	}
8c1fb47acdb23c Max Filippov 2023-08-11  166  
8c1fb47acdb23c Max Filippov 2023-08-11  167  	hw->irq = platform_get_irq(pdev, 0);
8c1fb47acdb23c Max Filippov 2023-08-11  168  	if (hw->irq >= 0) {
8c1fb47acdb23c Max Filippov 2023-08-11  169  		int ret;
8c1fb47acdb23c Max Filippov 2023-08-11  170  
8c1fb47acdb23c Max Filippov 2023-08-11  171  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
8c1fb47acdb23c Max Filippov 2023-08-11  172  						esp32_ipc_irq_handler,
8c1fb47acdb23c Max Filippov 2023-08-11  173  						esp32_ipc_thread_handler,
8c1fb47acdb23c Max Filippov 2023-08-11  174  						IRQF_SHARED, pdev->name, hw);
8c1fb47acdb23c Max Filippov 2023-08-11  175  		if (ret < 0) {
8c1fb47acdb23c Max Filippov 2023-08-11  176  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
8c1fb47acdb23c Max Filippov 2023-08-11  177  			return ret;
8c1fb47acdb23c Max Filippov 2023-08-11  178  		}
8c1fb47acdb23c Max Filippov 2023-08-11  179  	} else {
8c1fb47acdb23c Max Filippov 2023-08-11  180  		dev_err(&pdev->dev, "missing IRQ property\n");
8c1fb47acdb23c Max Filippov 2023-08-11  181  		return -ENODEV;
8c1fb47acdb23c Max Filippov 2023-08-11  182  	}
8c1fb47acdb23c Max Filippov 2023-08-11  183  
8c1fb47acdb23c Max Filippov 2023-08-11  184  	return 0;
8c1fb47acdb23c Max Filippov 2023-08-11  185  }
8c1fb47acdb23c Max Filippov 2023-08-11  186  
8c1fb47acdb23c Max Filippov 2023-08-11  187  static int esp32_ipc_probe(struct platform_device *pdev)
8c1fb47acdb23c Max Filippov 2023-08-11  188  {
8c1fb47acdb23c Max Filippov 2023-08-11  189  	struct esp32_ipc *hw =
8c1fb47acdb23c Max Filippov 2023-08-11  190  		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
8c1fb47acdb23c Max Filippov 2023-08-11  191  	int ret;
8c1fb47acdb23c Max Filippov 2023-08-11  192  
8c1fb47acdb23c Max Filippov 2023-08-11  193  	if (!hw)
8c1fb47acdb23c Max Filippov 2023-08-11  194  		return -ENOMEM;
8c1fb47acdb23c Max Filippov 2023-08-11  195  	platform_set_drvdata(pdev, hw);
8c1fb47acdb23c Max Filippov 2023-08-11  196  
8c1fb47acdb23c Max Filippov 2023-08-11  197  	ret = init_hw(pdev, hw);
8c1fb47acdb23c Max Filippov 2023-08-11  198  	if (ret < 0)
8c1fb47acdb23c Max Filippov 2023-08-11  199  		return ret;
8c1fb47acdb23c Max Filippov 2023-08-11  200  
8c1fb47acdb23c Max Filippov 2023-08-11  201  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].read = 0;
8c1fb47acdb23c Max Filippov 2023-08-11  202  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].write = 0;
8c1fb47acdb23c Max Filippov 2023-08-11  203  	wmb();
8c1fb47acdb23c Max Filippov 2023-08-11  204  	writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
8c1fb47acdb23c Max Filippov 2023-08-11  205  
8c1fb47acdb23c Max Filippov 2023-08-11  206  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
8c1fb47acdb23c Max Filippov 2023-08-11  207  	return ret;
8c1fb47acdb23c Max Filippov 2023-08-11  208  }
8c1fb47acdb23c Max Filippov 2023-08-11  209  
8c1fb47acdb23c Max Filippov 2023-08-11  210  static int esp32_ipc_remove(struct platform_device *pdev)
8c1fb47acdb23c Max Filippov 2023-08-11  211  {
8c1fb47acdb23c Max Filippov 2023-08-11  212  	struct esp32_ipc *hw = platform_get_drvdata(pdev);
8c1fb47acdb23c Max Filippov 2023-08-11  213  
8c1fb47acdb23c Max Filippov 2023-08-11  214  	if (!hw)
8c1fb47acdb23c Max Filippov 2023-08-11  215  		return 0;
8c1fb47acdb23c Max Filippov 2023-08-11  216  
8c1fb47acdb23c Max Filippov 2023-08-11  217  	disable_irq(hw->irq);
8c1fb47acdb23c Max Filippov 2023-08-11  218  	return 0;
8c1fb47acdb23c Max Filippov 2023-08-11  219  }
8c1fb47acdb23c Max Filippov 2023-08-11  220  
8c1fb47acdb23c Max Filippov 2023-08-11 @221  static const struct of_device_id esp32_ipc_match[] = {
8c1fb47acdb23c Max Filippov 2023-08-11  222  	{
8c1fb47acdb23c Max Filippov 2023-08-11  223  		.compatible = "esp,esp32-ipc",
8c1fb47acdb23c Max Filippov 2023-08-11  224  	}, {},
8c1fb47acdb23c Max Filippov 2023-08-11  225  };
8c1fb47acdb23c Max Filippov 2023-08-11  226  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
8c1fb47acdb23c Max Filippov 2023-08-11  227  

:::::: The code at line 145 was first introduced by commit
:::::: 8c1fb47acdb23c156acdf7b6f286db404d2c508f misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
