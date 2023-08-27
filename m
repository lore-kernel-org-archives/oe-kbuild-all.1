Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37283814
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 06:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693119540; x=1724655540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vnqjoAu8Rgap2Wpc+CbpRxeg2P1uf802Xf+wB1QIF1w=;
  b=l4bnW1MhoOJQQTNNVys+LPTVwT2/00j0KLFnWjU9kRK1FBA4gpFUDVME
   SBejuJwXARfzHL0dEgMIzwz14DF5I/MZRvimDnlKGPwCOnQzFg0gBdxkS
   j0c3ote3iDp+PG3K4p3eKG/6NT+UhB9absl2d8RXAwnEz5u6iO3Psuwig
   EODf+UaCAKm7Q0Zr0+s+FnZagTE8GzJcHgbiltOg8xsaxqS9ZfnDqz2CE
   IKGweIwBjgILIFKqmVQX/Pw6ATPsi0Oeeow5WiXV4xUV4WU0XongdRpSu
   AsmgB+7WAOo/PX8I1i1EoPWMV6QlHsQiUShW4lJcgUylBAU+iKtgn0cB1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="373805847"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="373805847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 23:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="731462347"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="731462347"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Aug 2023 23:58:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa9jd-0005UR-08;
	Sun, 27 Aug 2023 06:58:57 +0000
Date: Sun, 27 Aug 2023 14:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 40/48]
 drivers/misc/esp32-ipc.c:142: undefined reference to `devm_of_iomap'
Message-ID: <202308271426.JfM1KWmA-lkp@intel.com>
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
config: um-defconfig (https://download.01.org/0day-ci/archive/20230827/202308271426.JfM1KWmA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271426.JfM1KWmA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271426.JfM1KWmA-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/misc/esp32-ipc.o: in function `init_hw':
>> drivers/misc/esp32-ipc.c:142: undefined reference to `devm_of_iomap'
>> /usr/bin/ld: drivers/misc/esp32-ipc.c:146: undefined reference to `devm_iounmap'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_remove':
   drivers/net/wireless/espressif/esp_shmem.c:360: undefined reference to `esp_wifi_deinit'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `process_event_esp_bootup':
   drivers/net/wireless/espressif/esp_shmem.c:129: undefined reference to `process_fw_data'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:130: undefined reference to `esp_remove_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:136: undefined reference to `process_test_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:189: undefined reference to `cfg80211_scan_done'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:193: undefined reference to `cfg80211_disconnected'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:198: undefined reference to `esp_remove_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:203: undefined reference to `esp_add_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:207: undefined reference to `process_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:208: undefined reference to `print_capabilities'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +142 drivers/misc/esp32-ipc.c

8c1fb47acdb23c Max Filippov 2023-08-11  137  
8c1fb47acdb23c Max Filippov 2023-08-11  138  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
8c1fb47acdb23c Max Filippov 2023-08-11  139  {
8c1fb47acdb23c Max Filippov 2023-08-11  140  	void __user *p;
8c1fb47acdb23c Max Filippov 2023-08-11  141  
8c1fb47acdb23c Max Filippov 2023-08-11 @142  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
8c1fb47acdb23c Max Filippov 2023-08-11  143  	if (IS_ERR(p))
8c1fb47acdb23c Max Filippov 2023-08-11  144  		return PTR_ERR(p);
8c1fb47acdb23c Max Filippov 2023-08-11  145  	hw->hw_q = (void *)readl(p);
8c1fb47acdb23c Max Filippov 2023-08-11 @146  	devm_iounmap(&pdev->dev, p);
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

:::::: The code at line 142 was first introduced by commit
:::::: 8c1fb47acdb23c156acdf7b6f286db404d2c508f misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
