Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45179C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693427595; x=1724963595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NseIwcJmWyHBMflk8N9MLzUEuE9kvLAbr0pJk6DsPyI=;
  b=Ej4CZokPKcDQcZSQijvGgjryhDT/izl6yhYI4WUkZWpcpXwUmjFhboTL
   nLqNcyw2hUSQl5MGFQMOJCH/Sg20wIMcAYCgMjwZLy3PcXpjIu2WBd4dl
   5DRvuPMQyiHj2Yd+qJdAiYfhhWn9Qayd8Q15D99Gwp0CWxIvjVwlcKyGk
   sr1qlE0Bmm7sRoOSN6UeqfLFlgz3DGJ2vsOhTiStpkcPmHI00D6Z8gNGQ
   3UvwRMCcMP9TaK/j5+g/wQN17XZnte4iL+qoqeQ+TkVjmqITwVhlALKZ9
   FsxjzH0Boj9ceYbMUc6/toYqbM/tP+RZRNhJu6PHVQEypBAdq07OL+kQD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356061031"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="356061031"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 13:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="732783264"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="732783264"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Aug 2023 13:33:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbRro-000ACd-2e;
	Wed, 30 Aug 2023 20:32:55 +0000
Date: Thu, 31 Aug 2023 04:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 24/34]
 drivers/misc/esp32-ipc.c:148: undefined reference to `devm_of_iomap'
Message-ID: <202308310403.PrSLZ2vt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   32b212f29f8b514e9e765eba17d54e901e635130
commit: 6531df78dcbb1d955a0dc87a67760a6bcbca770c [24/34] esp_wifi: add IPC transport
config: um-defconfig (https://download.01.org/0day-ci/archive/20230831/202308310403.PrSLZ2vt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310403.PrSLZ2vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310403.PrSLZ2vt-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/misc/esp32-ipc.o: in function `init_hw':
>> drivers/misc/esp32-ipc.c:148: undefined reference to `devm_of_iomap'
>> /usr/bin/ld: drivers/misc/esp32-ipc.c:152: undefined reference to `devm_iounmap'
   collect2: error: ld returned 1 exit status

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=n]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +148 drivers/misc/esp32-ipc.c

e4dbf9ea0a4eca Max Filippov 2023-08-11  143  
e4dbf9ea0a4eca Max Filippov 2023-08-11  144  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
e4dbf9ea0a4eca Max Filippov 2023-08-11  145  {
e4dbf9ea0a4eca Max Filippov 2023-08-11  146  	void __user *p;
e4dbf9ea0a4eca Max Filippov 2023-08-11  147  
e4dbf9ea0a4eca Max Filippov 2023-08-11 @148  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
e4dbf9ea0a4eca Max Filippov 2023-08-11  149  	if (IS_ERR(p))
e4dbf9ea0a4eca Max Filippov 2023-08-11  150  		return PTR_ERR(p);
e4dbf9ea0a4eca Max Filippov 2023-08-11  151  	hw->hw_q = (void *)readl(p);
e4dbf9ea0a4eca Max Filippov 2023-08-11 @152  	devm_iounmap(&pdev->dev, p);
e4dbf9ea0a4eca Max Filippov 2023-08-11  153  
e4dbf9ea0a4eca Max Filippov 2023-08-11  154  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
e4dbf9ea0a4eca Max Filippov 2023-08-11  155  	if (IS_ERR(hw->regs))
e4dbf9ea0a4eca Max Filippov 2023-08-11  156  		return PTR_ERR(hw->regs);
e4dbf9ea0a4eca Max Filippov 2023-08-11  157  
e4dbf9ea0a4eca Max Filippov 2023-08-11  158  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
e4dbf9ea0a4eca Max Filippov 2023-08-11  159  		__func__, hw->regs, hw->hw_q);
e4dbf9ea0a4eca Max Filippov 2023-08-11  160  	if (hw->hw_q) {
e4dbf9ea0a4eca Max Filippov 2023-08-11  161  		u32 i;
e4dbf9ea0a4eca Max Filippov 2023-08-11  162  
e4dbf9ea0a4eca Max Filippov 2023-08-11  163  		for (i = 0; i < 2; ++i) {
e4dbf9ea0a4eca Max Filippov 2023-08-11  164  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
e4dbf9ea0a4eca Max Filippov 2023-08-11  165  				__func__, i,
e4dbf9ea0a4eca Max Filippov 2023-08-11  166  				hw->hw_q[i].offset,
e4dbf9ea0a4eca Max Filippov 2023-08-11  167  				hw->hw_q[i].mask);
e4dbf9ea0a4eca Max Filippov 2023-08-11  168  		}
e4dbf9ea0a4eca Max Filippov 2023-08-11  169  	} else {
e4dbf9ea0a4eca Max Filippov 2023-08-11  170  		return -ENODEV;
e4dbf9ea0a4eca Max Filippov 2023-08-11  171  	}
e4dbf9ea0a4eca Max Filippov 2023-08-11  172  
e4dbf9ea0a4eca Max Filippov 2023-08-11  173  	hw->irq = platform_get_irq(pdev, 0);
e4dbf9ea0a4eca Max Filippov 2023-08-11  174  	if (hw->irq >= 0) {
e4dbf9ea0a4eca Max Filippov 2023-08-11  175  		int ret;
e4dbf9ea0a4eca Max Filippov 2023-08-11  176  
e4dbf9ea0a4eca Max Filippov 2023-08-11  177  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
e4dbf9ea0a4eca Max Filippov 2023-08-11  178  						esp32_ipc_irq_handler,
e4dbf9ea0a4eca Max Filippov 2023-08-11  179  						esp32_ipc_thread_handler,
e4dbf9ea0a4eca Max Filippov 2023-08-11  180  						IRQF_SHARED, pdev->name, hw);
e4dbf9ea0a4eca Max Filippov 2023-08-11  181  		if (ret < 0) {
e4dbf9ea0a4eca Max Filippov 2023-08-11  182  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
e4dbf9ea0a4eca Max Filippov 2023-08-11  183  			return ret;
e4dbf9ea0a4eca Max Filippov 2023-08-11  184  		}
e4dbf9ea0a4eca Max Filippov 2023-08-11  185  	} else {
e4dbf9ea0a4eca Max Filippov 2023-08-11  186  		dev_err(&pdev->dev, "missing IRQ property\n");
e4dbf9ea0a4eca Max Filippov 2023-08-11  187  		return -ENODEV;
e4dbf9ea0a4eca Max Filippov 2023-08-11  188  	}
e4dbf9ea0a4eca Max Filippov 2023-08-11  189  
e4dbf9ea0a4eca Max Filippov 2023-08-11  190  	return 0;
e4dbf9ea0a4eca Max Filippov 2023-08-11  191  }
e4dbf9ea0a4eca Max Filippov 2023-08-11  192  

:::::: The code at line 148 was first introduced by commit
:::::: e4dbf9ea0a4ecaa2b6aef8d6e5fb345d36c55643 misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
