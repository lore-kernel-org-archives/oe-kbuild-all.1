Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F1154426
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601156; cv=none; b=ALB+npHr1xB5k6uVG/AqvP4BcM/zLQQj3QH31hGhsNfUSarRcUXNT7f8qip58PXSnFAN6/60uVaOK8tiblrEMD6MQkrvAEXBL74go5DoZKl+LMewijcNZeU8++8oGalPXqE9Zv4Zeb876JlHcfsRUZ+ZxC5cG+PNzLdOobPabs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601156; c=relaxed/simple;
	bh=2qlcIAw5FtSlX4kNqZvz0M3mZyD4t8ZY9+d3VXz6mIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpJocYhnwKBMQhJPD5VFlw1CYJzMWFhamyk2Uy7f58+PpcJZxSEX7CLAQiyHxczAkqDyh59yiuExYxSlR4SeW0daYQ+jQHgEOgdN22sBkHjqO1DRVc4Lft04U4/ZaeGb9dAP8xOK1yubYLyjKWQbwWfv5+JjWi+VsF05Hh+yyjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fInZn9ih; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fInZn9ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738601153; x=1770137153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2qlcIAw5FtSlX4kNqZvz0M3mZyD4t8ZY9+d3VXz6mIo=;
  b=fInZn9ihYuM9KlCKZqa1m2nRZpbYLGIc5+XfGx/11OSz1Ej27srM2uKb
   Mkqk8w4YWxgTRDy2NEYjnxYCx81Mn4YUWejg6HjyoyG5wTsgAV7xtQqB1
   JeUEFRZXJkCFvNz8/Yq4KT+yWLWU7qqLjRquOgAySf2ooUhewkc+NMHau
   37T2GTY42n93GGLdjvyF7oYboIOc98QOnPv9wayo49u8s4d8+b3btJ8L7
   ZrQ1dfnEs9cDxymK3ze/pEsXx3fDe+qQJ1guqQIHehTk8Cq1DNbv1m99H
   /N4mqLgn0HgqgkDWSNyxWT+DQFeYhF1K7i3/tcJ584215xI6rP6LeE8gK
   Q==;
X-CSE-ConnectionGUID: StMtwZ27SNe09fIriwFm2w==
X-CSE-MsgGUID: waIyI7BUS5m6ZdiTE94p+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="64457382"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="64457382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:45:53 -0800
X-CSE-ConnectionGUID: J4Lqx/GRTlqafP687VPqiw==
X-CSE-MsgGUID: xSLOCGmeRp6caTrBnEVLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="141208042"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2025 08:45:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teza1-000rCT-1j;
	Mon, 03 Feb 2025 16:45:49 +0000
Date: Tue, 4 Feb 2025 00:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 35/53]
 drivers/misc/esp32-ipc.c:152:20: warning: cast to pointer from integer of
 different size
Message-ID: <202502040037.NguiCtFF-lkp@intel.com>
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

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 08b8a525de25b35564cb9ae5f7b5ad1122a84fed [35/53] esp_wifi: add IPC transport
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250204/202502040037.NguiCtFF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040037.NguiCtFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040037.NguiCtFF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/esp32-ipc.c: In function 'init_hw':
>> drivers/misc/esp32-ipc.c:152:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     152 |         hw->hw_q = (void *)readl(p);
         |                    ^
   At top level:
>> drivers/misc/esp32-ipc.c:228:34: warning: 'esp32_ipc_match' defined but not used [-Wunused-const-variable=]
     228 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +152 drivers/misc/esp32-ipc.c

ff5d67ac76ee59 Max Filippov 2023-08-11  144  
ff5d67ac76ee59 Max Filippov 2023-08-11  145  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
ff5d67ac76ee59 Max Filippov 2023-08-11  146  {
ff5d67ac76ee59 Max Filippov 2023-08-11  147  	void __iomem *p;
ff5d67ac76ee59 Max Filippov 2023-08-11  148  
ff5d67ac76ee59 Max Filippov 2023-08-11  149  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
ff5d67ac76ee59 Max Filippov 2023-08-11  150  	if (IS_ERR(p))
ff5d67ac76ee59 Max Filippov 2023-08-11  151  		return PTR_ERR(p);
ff5d67ac76ee59 Max Filippov 2023-08-11 @152  	hw->hw_q = (void *)readl(p);
ff5d67ac76ee59 Max Filippov 2023-08-11  153  	devm_iounmap(&pdev->dev, p);
ff5d67ac76ee59 Max Filippov 2023-08-11  154  
ff5d67ac76ee59 Max Filippov 2023-08-11  155  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
ff5d67ac76ee59 Max Filippov 2023-08-11  156  	if (IS_ERR(hw->regs))
ff5d67ac76ee59 Max Filippov 2023-08-11  157  		return PTR_ERR(hw->regs);
ff5d67ac76ee59 Max Filippov 2023-08-11  158  
ff5d67ac76ee59 Max Filippov 2023-08-11  159  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
ff5d67ac76ee59 Max Filippov 2023-08-11  160  		__func__, hw->regs, hw->hw_q);
ff5d67ac76ee59 Max Filippov 2023-08-11  161  	if (hw->hw_q) {
ff5d67ac76ee59 Max Filippov 2023-08-11  162  		u32 i;
ff5d67ac76ee59 Max Filippov 2023-08-11  163  
ff5d67ac76ee59 Max Filippov 2023-08-11  164  		for (i = 0; i < 2; ++i) {
ff5d67ac76ee59 Max Filippov 2023-08-11  165  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
ff5d67ac76ee59 Max Filippov 2023-08-11  166  				__func__, i,
ff5d67ac76ee59 Max Filippov 2023-08-11  167  				hw->hw_q[i].offset,
ff5d67ac76ee59 Max Filippov 2023-08-11  168  				hw->hw_q[i].mask);
ff5d67ac76ee59 Max Filippov 2023-08-11  169  		}
ff5d67ac76ee59 Max Filippov 2023-08-11  170  	} else {
ff5d67ac76ee59 Max Filippov 2023-08-11  171  		return -ENODEV;
ff5d67ac76ee59 Max Filippov 2023-08-11  172  	}
ff5d67ac76ee59 Max Filippov 2023-08-11  173  
ff5d67ac76ee59 Max Filippov 2023-08-11  174  	hw->irq = platform_get_irq(pdev, 0);
ff5d67ac76ee59 Max Filippov 2023-08-11  175  	if (hw->irq >= 0) {
ff5d67ac76ee59 Max Filippov 2023-08-11  176  		int ret;
ff5d67ac76ee59 Max Filippov 2023-08-11  177  
ff5d67ac76ee59 Max Filippov 2023-08-11  178  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
ff5d67ac76ee59 Max Filippov 2023-08-11  179  						esp32_ipc_irq_handler,
ff5d67ac76ee59 Max Filippov 2023-08-11  180  						esp32_ipc_thread_handler,
ff5d67ac76ee59 Max Filippov 2023-08-11  181  						IRQF_SHARED, pdev->name, hw);
ff5d67ac76ee59 Max Filippov 2023-08-11  182  		if (ret < 0) {
ff5d67ac76ee59 Max Filippov 2023-08-11  183  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
ff5d67ac76ee59 Max Filippov 2023-08-11  184  			return ret;
ff5d67ac76ee59 Max Filippov 2023-08-11  185  		}
ff5d67ac76ee59 Max Filippov 2023-08-11  186  	} else {
ff5d67ac76ee59 Max Filippov 2023-08-11  187  		dev_err(&pdev->dev, "missing IRQ property\n");
ff5d67ac76ee59 Max Filippov 2023-08-11  188  		return -ENODEV;
ff5d67ac76ee59 Max Filippov 2023-08-11  189  	}
ff5d67ac76ee59 Max Filippov 2023-08-11  190  
ff5d67ac76ee59 Max Filippov 2023-08-11  191  	return 0;
ff5d67ac76ee59 Max Filippov 2023-08-11  192  }
ff5d67ac76ee59 Max Filippov 2023-08-11  193  
ff5d67ac76ee59 Max Filippov 2023-08-11  194  static int esp32_ipc_probe(struct platform_device *pdev)
ff5d67ac76ee59 Max Filippov 2023-08-11  195  {
ff5d67ac76ee59 Max Filippov 2023-08-11  196  	struct esp32_ipc *hw =
ff5d67ac76ee59 Max Filippov 2023-08-11  197  		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
ff5d67ac76ee59 Max Filippov 2023-08-11  198  	int ret;
ff5d67ac76ee59 Max Filippov 2023-08-11  199  
ff5d67ac76ee59 Max Filippov 2023-08-11  200  	if (!hw)
ff5d67ac76ee59 Max Filippov 2023-08-11  201  		return -ENOMEM;
ff5d67ac76ee59 Max Filippov 2023-08-11  202  	platform_set_drvdata(pdev, hw);
ff5d67ac76ee59 Max Filippov 2023-08-11  203  
ff5d67ac76ee59 Max Filippov 2023-08-11  204  	spin_lock_init(&hw->lock);
ff5d67ac76ee59 Max Filippov 2023-08-11  205  	ret = init_hw(pdev, hw);
ff5d67ac76ee59 Max Filippov 2023-08-11  206  	if (ret < 0)
ff5d67ac76ee59 Max Filippov 2023-08-11  207  		return ret;
ff5d67ac76ee59 Max Filippov 2023-08-11  208  
ff5d67ac76ee59 Max Filippov 2023-08-11  209  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].read = 0;
ff5d67ac76ee59 Max Filippov 2023-08-11  210  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].write = 0;
ff5d67ac76ee59 Max Filippov 2023-08-11  211  	wmb();
ff5d67ac76ee59 Max Filippov 2023-08-11  212  	writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
ff5d67ac76ee59 Max Filippov 2023-08-11  213  
ff5d67ac76ee59 Max Filippov 2023-08-11  214  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
ff5d67ac76ee59 Max Filippov 2023-08-11  215  	return ret;
ff5d67ac76ee59 Max Filippov 2023-08-11  216  }
ff5d67ac76ee59 Max Filippov 2023-08-11  217  
ff5d67ac76ee59 Max Filippov 2023-08-11  218  static void esp32_ipc_remove(struct platform_device *pdev)
ff5d67ac76ee59 Max Filippov 2023-08-11  219  {
ff5d67ac76ee59 Max Filippov 2023-08-11  220  	struct esp32_ipc *hw = platform_get_drvdata(pdev);
ff5d67ac76ee59 Max Filippov 2023-08-11  221  
ff5d67ac76ee59 Max Filippov 2023-08-11  222  	if (!hw)
ff5d67ac76ee59 Max Filippov 2023-08-11  223  		return;
ff5d67ac76ee59 Max Filippov 2023-08-11  224  
ff5d67ac76ee59 Max Filippov 2023-08-11  225  	disable_irq(hw->irq);
ff5d67ac76ee59 Max Filippov 2023-08-11  226  }
ff5d67ac76ee59 Max Filippov 2023-08-11  227  
ff5d67ac76ee59 Max Filippov 2023-08-11 @228  static const struct of_device_id esp32_ipc_match[] = {
ff5d67ac76ee59 Max Filippov 2023-08-11  229  	{
ff5d67ac76ee59 Max Filippov 2023-08-11  230  		.compatible = "esp,esp32-ipc",
ff5d67ac76ee59 Max Filippov 2023-08-11  231  	}, {},
ff5d67ac76ee59 Max Filippov 2023-08-11  232  };
ff5d67ac76ee59 Max Filippov 2023-08-11  233  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
ff5d67ac76ee59 Max Filippov 2023-08-11  234  

:::::: The code at line 152 was first introduced by commit
:::::: ff5d67ac76ee59b6351fd6f70df8d0178ef4f72a misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
