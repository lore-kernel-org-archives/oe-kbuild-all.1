Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A033D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694724771; x=1726260771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8M8H7YtQxsvJrN+aOny5RIJR4OULeRpSGVMB5qp4IWM=;
  b=OVUqJafVdiKN0FPBZAoypUPwwVy0SekDhslFAm8A46EKszh2A2MXqP+K
   5ACcWEHKavg7+X9p1RdeXni0/ffiFa4kPx72WJl/KWL/gRXCr7q8XBY7i
   7mKJMy7eFmehi515vBFNirbT/Q/K3YYNebH7iRIwHSuKyYnTBbKM00Aa7
   F+Sv+uRZTTVaN8PvH/nAmfBp1jdFp9hDbr/K07Qo8+FPmBzJu/RM05On1
   o1oJpfbIpO4nEfDOSA6Tc9Mv09qAFTohR3ssTcRNuTlxAqXfUxTW90m7E
   cuyCSJetqzZoXEkbRW/JslaICzjoIpNxA91SSu7FL9fgpwq135n/5GBwu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="410012921"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="410012921"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 13:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075531915"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="1075531915"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2023 13:52:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgtKQ-00022z-2A;
	Thu, 14 Sep 2023 20:52:46 +0000
Date: Fri, 15 Sep 2023 04:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 12/36]
 drivers/misc/esp32-ipc.c:148:11: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309150417.K8gM6EQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   6497b8ba138880f5f4a44ec7315b57ccaca7200c
commit: e4dbf9ea0a4ecaa2b6aef8d6e5fb345d36c55643 [12/36] misc/esp32-ipc: introduce generic IPC for ESP32
config: x86_64-randconfig-122-20230914 (https://download.01.org/0day-ci/archive/20230915/202309150417.K8gM6EQz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150417.K8gM6EQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150417.K8gM6EQz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/esp32-ipc.c:148:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *p @@     got void [noderef] __iomem * @@
   drivers/misc/esp32-ipc.c:148:11: sparse:     expected void [noderef] __user *p
   drivers/misc/esp32-ipc.c:148:11: sparse:     got void [noderef] __iomem *
>> drivers/misc/esp32-ipc.c:151:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void [noderef] __user *p @@
   drivers/misc/esp32-ipc.c:151:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/esp32-ipc.c:151:34: sparse:     got void [noderef] __user *p
>> drivers/misc/esp32-ipc.c:152:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void [noderef] __user *p @@
   drivers/misc/esp32-ipc.c:152:34: sparse:     expected void [noderef] __iomem *addr
   drivers/misc/esp32-ipc.c:152:34: sparse:     got void [noderef] __user *p

vim +148 drivers/misc/esp32-ipc.c

   143	
   144	static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
   145	{
   146		void __user *p;
   147	
 > 148		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   149		if (IS_ERR(p))
   150			return PTR_ERR(p);
 > 151		hw->hw_q = (void *)readl(p);
 > 152		devm_iounmap(&pdev->dev, p);
   153	
   154		hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
   155		if (IS_ERR(hw->regs))
   156			return PTR_ERR(hw->regs);
   157	
   158		dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
   159			__func__, hw->regs, hw->hw_q);
   160		if (hw->hw_q) {
   161			u32 i;
   162	
   163			for (i = 0; i < 2; ++i) {
   164				dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
   165					__func__, i,
   166					hw->hw_q[i].offset,
   167					hw->hw_q[i].mask);
   168			}
   169		} else {
   170			return -ENODEV;
   171		}
   172	
   173		hw->irq = platform_get_irq(pdev, 0);
   174		if (hw->irq >= 0) {
   175			int ret;
   176	
   177			ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
   178							esp32_ipc_irq_handler,
   179							esp32_ipc_thread_handler,
   180							IRQF_SHARED, pdev->name, hw);
   181			if (ret < 0) {
   182				dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
   183				return ret;
   184			}
   185		} else {
   186			dev_err(&pdev->dev, "missing IRQ property\n");
   187			return -ENODEV;
   188		}
   189	
   190		return 0;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
