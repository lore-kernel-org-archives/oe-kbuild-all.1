Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E797F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694537253; x=1726073253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=shZBOjH24m5c//3Zs1LtyQGbLjPAa2WCE5Wd4ws0t40=;
  b=R0dmba30BYxEri6xG7EoUjXfi+OwJ62XWtLVmMXSd73hgLgpgyQlRxZJ
   bzEtH/jE5pFtbHwHj71UOQU3AKgzk7LENqZXORoIxmyzLw4HQ72hPwiDj
   glfj8zHkfCZHRrIWMoqWkWGqxJyUPvpg7fi/+hy3DGwF1yfpzCVhSQnPu
   mk++3BTcjCkKIB6wDdHe1Qv+JblpZRT/1+jb3XxlBWMuFdyS7YWofTF/Q
   CtY+OtUrSW9tz8z4FTkJ2G7SOJ9QdPM7TD9aLBPC6IdKYDc5q5oavf6eZ
   A2B8yISl45AWz7xVueRTeiRC6pdcZCwq4I0FtylZ5doZBLbNqUzMlVfft
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378340848"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="378340848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773110804"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="773110804"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 09:47:18 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg6Xf-0000HD-1o;
	Tue, 12 Sep 2023 16:47:12 +0000
Date: Wed, 13 Sep 2023 00:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 24/36]
 drivers/misc/esp32-ipc.c:148: undefined reference to `devm_of_iomap'
Message-ID: <202309130012.3iJG4vJP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   6497b8ba138880f5f4a44ec7315b57ccaca7200c
commit: 6531df78dcbb1d955a0dc87a67760a6bcbca770c [24/36] esp_wifi: add IPC transport
config: um-defconfig (https://download.01.org/0day-ci/archive/20230913/202309130012.3iJG4vJP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130012.3iJG4vJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130012.3iJG4vJP-lkp@intel.com/

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
