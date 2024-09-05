Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BE43AD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548413; cv=none; b=ZmDMk2HqEBcQ9AXD8HRvm+FT+E4qfGsfKFYcZZyYA4efZrobaH60zJaqBlwOtIh+e38AvVnibnT+ybNfU6sck/YInOCz668JvvtMScJ0BlXLGUrW22PFnsxI14cWuY4VXBrcljRRDwmkiauy0KstdOVGIZQJDjBjcy0pSH8H8p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548413; c=relaxed/simple;
	bh=q124T9KIQabkA1wYn6Z/3aVfgXcd/blJQZnaAPn8bKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTq/w78dW4RjZUkIG/mKwOSzxL6uYOdG5tVvRkAPjkKWfL1lWauSJqPAyYY25bHKLJByiz7bNadW4XQk3iIcfkA4TKRk/wD+BnLpxPC2+9AOq5yw3F5XT8kT50oekH263BgTyeU3eZ6axkSCaLSQ1LF1ucDRSpsY31u/S0fmgm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9l5zum8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9l5zum8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725548412; x=1757084412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q124T9KIQabkA1wYn6Z/3aVfgXcd/blJQZnaAPn8bKc=;
  b=T9l5zum8FXw30c+1oeLlTBWPi08r4h4sIPSbt4RXsSWvkZfN9R7VYOm5
   KI8CPz8KeBVr1gpvUiYQIpn+lIaBIb2PzhG9B5Ovw/0XxEWRt/S3oA2WZ
   rhVIaB4nfax5RIjlV24xIt/idjoRPNh50nZCXozmloZybVEFLDptQryw5
   wTxEMurm3MbJx1zxAikQyxV+BuB37bRmbSjpvhZWKnSqxW26NZmWW2FO9
   jnlTc3RNPLL0cFE2ues6y4SH2nkVJ/cuIuVG7+a8kK1HEUWaIjry9+dMq
   yxm0sE4MRqobfPg+HyEWp4Cf61vAu8dp3y9XT449yXuE8SK7CpXAF/YCk
   w==;
X-CSE-ConnectionGUID: g58/oe/rQnahE7g4lcDXnA==
X-CSE-MsgGUID: p1/sBvRtQqqdY2wf7jFDJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24146831"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24146831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 08:00:10 -0700
X-CSE-ConnectionGUID: seMiUxMNTnqJ5icS0Y5WOQ==
X-CSE-MsgGUID: oTblKApJR62oFgetStMVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88890361"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 08:00:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smDxu-000A1D-0n;
	Thu, 05 Sep 2024 15:00:06 +0000
Date: Thu, 5 Sep 2024 22:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 35/53]
 drivers/misc/esp32-ipc.c:152:20: warning: cast to pointer from integer of
 different size
Message-ID: <202409052210.9lereftZ-lkp@intel.com>
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

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: de5a96ec7f9b35d9493bc022d16cd1a03ff73798 [35/53] esp_wifi: add IPC transport
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240905/202409052210.9lereftZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409052210.9lereftZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409052210.9lereftZ-lkp@intel.com/

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

9aee3c117c9d9b9 Max Filippov 2023-08-11  144  
9aee3c117c9d9b9 Max Filippov 2023-08-11  145  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
9aee3c117c9d9b9 Max Filippov 2023-08-11  146  {
9aee3c117c9d9b9 Max Filippov 2023-08-11  147  	void __iomem *p;
9aee3c117c9d9b9 Max Filippov 2023-08-11  148  
9aee3c117c9d9b9 Max Filippov 2023-08-11  149  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
9aee3c117c9d9b9 Max Filippov 2023-08-11  150  	if (IS_ERR(p))
9aee3c117c9d9b9 Max Filippov 2023-08-11  151  		return PTR_ERR(p);
9aee3c117c9d9b9 Max Filippov 2023-08-11 @152  	hw->hw_q = (void *)readl(p);
9aee3c117c9d9b9 Max Filippov 2023-08-11  153  	devm_iounmap(&pdev->dev, p);
9aee3c117c9d9b9 Max Filippov 2023-08-11  154  
9aee3c117c9d9b9 Max Filippov 2023-08-11  155  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
9aee3c117c9d9b9 Max Filippov 2023-08-11  156  	if (IS_ERR(hw->regs))
9aee3c117c9d9b9 Max Filippov 2023-08-11  157  		return PTR_ERR(hw->regs);
9aee3c117c9d9b9 Max Filippov 2023-08-11  158  
9aee3c117c9d9b9 Max Filippov 2023-08-11  159  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
9aee3c117c9d9b9 Max Filippov 2023-08-11  160  		__func__, hw->regs, hw->hw_q);
9aee3c117c9d9b9 Max Filippov 2023-08-11  161  	if (hw->hw_q) {
9aee3c117c9d9b9 Max Filippov 2023-08-11  162  		u32 i;
9aee3c117c9d9b9 Max Filippov 2023-08-11  163  
9aee3c117c9d9b9 Max Filippov 2023-08-11  164  		for (i = 0; i < 2; ++i) {
9aee3c117c9d9b9 Max Filippov 2023-08-11  165  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
9aee3c117c9d9b9 Max Filippov 2023-08-11  166  				__func__, i,
9aee3c117c9d9b9 Max Filippov 2023-08-11  167  				hw->hw_q[i].offset,
9aee3c117c9d9b9 Max Filippov 2023-08-11  168  				hw->hw_q[i].mask);
9aee3c117c9d9b9 Max Filippov 2023-08-11  169  		}
9aee3c117c9d9b9 Max Filippov 2023-08-11  170  	} else {
9aee3c117c9d9b9 Max Filippov 2023-08-11  171  		return -ENODEV;
9aee3c117c9d9b9 Max Filippov 2023-08-11  172  	}
9aee3c117c9d9b9 Max Filippov 2023-08-11  173  
9aee3c117c9d9b9 Max Filippov 2023-08-11  174  	hw->irq = platform_get_irq(pdev, 0);
9aee3c117c9d9b9 Max Filippov 2023-08-11  175  	if (hw->irq >= 0) {
9aee3c117c9d9b9 Max Filippov 2023-08-11  176  		int ret;
9aee3c117c9d9b9 Max Filippov 2023-08-11  177  
9aee3c117c9d9b9 Max Filippov 2023-08-11  178  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
9aee3c117c9d9b9 Max Filippov 2023-08-11  179  						esp32_ipc_irq_handler,
9aee3c117c9d9b9 Max Filippov 2023-08-11  180  						esp32_ipc_thread_handler,
9aee3c117c9d9b9 Max Filippov 2023-08-11  181  						IRQF_SHARED, pdev->name, hw);
9aee3c117c9d9b9 Max Filippov 2023-08-11  182  		if (ret < 0) {
9aee3c117c9d9b9 Max Filippov 2023-08-11  183  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
9aee3c117c9d9b9 Max Filippov 2023-08-11  184  			return ret;
9aee3c117c9d9b9 Max Filippov 2023-08-11  185  		}
9aee3c117c9d9b9 Max Filippov 2023-08-11  186  	} else {
9aee3c117c9d9b9 Max Filippov 2023-08-11  187  		dev_err(&pdev->dev, "missing IRQ property\n");
9aee3c117c9d9b9 Max Filippov 2023-08-11  188  		return -ENODEV;
9aee3c117c9d9b9 Max Filippov 2023-08-11  189  	}
9aee3c117c9d9b9 Max Filippov 2023-08-11  190  
9aee3c117c9d9b9 Max Filippov 2023-08-11  191  	return 0;
9aee3c117c9d9b9 Max Filippov 2023-08-11  192  }
9aee3c117c9d9b9 Max Filippov 2023-08-11  193  
9aee3c117c9d9b9 Max Filippov 2023-08-11  194  static int esp32_ipc_probe(struct platform_device *pdev)
9aee3c117c9d9b9 Max Filippov 2023-08-11  195  {
9aee3c117c9d9b9 Max Filippov 2023-08-11  196  	struct esp32_ipc *hw =
9aee3c117c9d9b9 Max Filippov 2023-08-11  197  		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
9aee3c117c9d9b9 Max Filippov 2023-08-11  198  	int ret;
9aee3c117c9d9b9 Max Filippov 2023-08-11  199  
9aee3c117c9d9b9 Max Filippov 2023-08-11  200  	if (!hw)
9aee3c117c9d9b9 Max Filippov 2023-08-11  201  		return -ENOMEM;
9aee3c117c9d9b9 Max Filippov 2023-08-11  202  	platform_set_drvdata(pdev, hw);
9aee3c117c9d9b9 Max Filippov 2023-08-11  203  
9aee3c117c9d9b9 Max Filippov 2023-08-11  204  	spin_lock_init(&hw->lock);
9aee3c117c9d9b9 Max Filippov 2023-08-11  205  	ret = init_hw(pdev, hw);
9aee3c117c9d9b9 Max Filippov 2023-08-11  206  	if (ret < 0)
9aee3c117c9d9b9 Max Filippov 2023-08-11  207  		return ret;
9aee3c117c9d9b9 Max Filippov 2023-08-11  208  
9aee3c117c9d9b9 Max Filippov 2023-08-11  209  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].read = 0;
9aee3c117c9d9b9 Max Filippov 2023-08-11  210  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].write = 0;
9aee3c117c9d9b9 Max Filippov 2023-08-11  211  	wmb();
9aee3c117c9d9b9 Max Filippov 2023-08-11  212  	writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
9aee3c117c9d9b9 Max Filippov 2023-08-11  213  
9aee3c117c9d9b9 Max Filippov 2023-08-11  214  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
9aee3c117c9d9b9 Max Filippov 2023-08-11  215  	return ret;
9aee3c117c9d9b9 Max Filippov 2023-08-11  216  }
9aee3c117c9d9b9 Max Filippov 2023-08-11  217  
9aee3c117c9d9b9 Max Filippov 2023-08-11  218  static void esp32_ipc_remove(struct platform_device *pdev)
9aee3c117c9d9b9 Max Filippov 2023-08-11  219  {
9aee3c117c9d9b9 Max Filippov 2023-08-11  220  	struct esp32_ipc *hw = platform_get_drvdata(pdev);
9aee3c117c9d9b9 Max Filippov 2023-08-11  221  
9aee3c117c9d9b9 Max Filippov 2023-08-11  222  	if (!hw)
9aee3c117c9d9b9 Max Filippov 2023-08-11  223  		return;
9aee3c117c9d9b9 Max Filippov 2023-08-11  224  
9aee3c117c9d9b9 Max Filippov 2023-08-11  225  	disable_irq(hw->irq);
9aee3c117c9d9b9 Max Filippov 2023-08-11  226  }
9aee3c117c9d9b9 Max Filippov 2023-08-11  227  
9aee3c117c9d9b9 Max Filippov 2023-08-11 @228  static const struct of_device_id esp32_ipc_match[] = {
9aee3c117c9d9b9 Max Filippov 2023-08-11  229  	{
9aee3c117c9d9b9 Max Filippov 2023-08-11  230  		.compatible = "esp,esp32-ipc",
9aee3c117c9d9b9 Max Filippov 2023-08-11  231  	}, {},
9aee3c117c9d9b9 Max Filippov 2023-08-11  232  };
9aee3c117c9d9b9 Max Filippov 2023-08-11  233  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
9aee3c117c9d9b9 Max Filippov 2023-08-11  234  

:::::: The code at line 152 was first introduced by commit
:::::: 9aee3c117c9d9b9481c339d9ac7b47e6c949bdac misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
