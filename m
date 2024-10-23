Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE18156883
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670923; cv=none; b=lKeT1Td0RhoTYs+aKZ28zO6FUayac1W0gHDYZZ3uWo83Z+5dkATbs2AoG2N6kX2AZUa958kdHfNkWiqPQD6IGNrJNcYfnf8hQJlRN02BNbknsgjBuLjaSi7Azykd+sZWx8rB+8de+QelyrjbjF3fp0BPg/wLfojScv6t8h8Kf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670923; c=relaxed/simple;
	bh=mDy39ZxG25L5qsIUfd7+IcnWlTQit9qetunEpWEh/xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnX2yzwFU8NLmrHx+iSUVS7i/w8bycC49M5yqP7SWquZ3otaWbXvsoUKOan1zEh+a/hsHOcNFsijdMxC+beRwWJfygiDoJGwDU2CTGZ1pIzybYbcgQF7vkR4pVC8p43mFGXeQnfuBdb2NJjr+nelr+K+uwicKABJIXJq4/B2BOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jidGR8z9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jidGR8z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729670921; x=1761206921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mDy39ZxG25L5qsIUfd7+IcnWlTQit9qetunEpWEh/xg=;
  b=jidGR8z9aYkk8YCKFReyQHRvTTwgp4jnzIRpX8jItTCODWrUwkQVEord
   wtNWX+rr+cibOTlRfyMBC0eWph805P0RruCclvAY6Jh9mbYiIrO3yfYIh
   sbVZJkYc/R6ktLI/9jbEIRYnZrh+a3eOMd8+imch/7ta/AkQ57IE+G7yR
   Pv90JCxeDCg9SHkmaDKdZf/UurImasxIpp/OlRPYsz9o3NJVdmxU7akvs
   xhg0XFRTm2szhM+AYWgIf5v03AjLsGxnwBXb7HtkMylRZVCABps3mi1kp
   2ZyyJhPaMqYCd3OkuPViRyseGRgh43cYIQdO/1OI1CqWhl7nSohopy3sL
   A==;
X-CSE-ConnectionGUID: OwrQ0ZuaTNeJBbBD7org9w==
X-CSE-MsgGUID: 20DmacjwSryMQNGFtH3Q/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33166233"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="33166233"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 01:08:38 -0700
X-CSE-ConnectionGUID: mmBDuv/ZQxuLqlVcAMoqSQ==
X-CSE-MsgGUID: /WORf5o5Q/OZ03PirRSOsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84915110"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 01:08:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3WPy-000Udq-03;
	Wed, 23 Oct 2024 08:08:34 +0000
Date: Wed, 23 Oct 2024 16:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-esp32 35/53]
 drivers/misc/esp32-ipc.c:152:20: warning: cast to pointer from integer of
 different size
Message-ID: <202410231644.nbRjS6dw-lkp@intel.com>
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

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-esp32
head:   3b01ad2a1f71b72b27fefa08e4bf6acbe1de874f
commit: c10968c5b4327b1c4ad9b901192f78349104ef59 [35/53] esp_wifi: add IPC transport
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241023/202410231644.nbRjS6dw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231644.nbRjS6dw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231644.nbRjS6dw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/esp32-ipc.c: In function 'init_hw':
>> drivers/misc/esp32-ipc.c:152:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     152 |         hw->hw_q = (void *)readl(p);
         |                    ^
   drivers/misc/esp32-ipc.c: At top level:
>> drivers/misc/esp32-ipc.c:228:34: warning: 'esp32_ipc_match' defined but not used [-Wunused-const-variable=]
     228 | static const struct of_device_id esp32_ipc_match[] = {
         |                                  ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +152 drivers/misc/esp32-ipc.c

ff0f9306f987d1 Max Filippov 2023-08-11  144  
ff0f9306f987d1 Max Filippov 2023-08-11  145  static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
ff0f9306f987d1 Max Filippov 2023-08-11  146  {
ff0f9306f987d1 Max Filippov 2023-08-11  147  	void __iomem *p;
ff0f9306f987d1 Max Filippov 2023-08-11  148  
ff0f9306f987d1 Max Filippov 2023-08-11  149  	p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
ff0f9306f987d1 Max Filippov 2023-08-11  150  	if (IS_ERR(p))
ff0f9306f987d1 Max Filippov 2023-08-11  151  		return PTR_ERR(p);
ff0f9306f987d1 Max Filippov 2023-08-11 @152  	hw->hw_q = (void *)readl(p);
ff0f9306f987d1 Max Filippov 2023-08-11  153  	devm_iounmap(&pdev->dev, p);
ff0f9306f987d1 Max Filippov 2023-08-11  154  
ff0f9306f987d1 Max Filippov 2023-08-11  155  	hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
ff0f9306f987d1 Max Filippov 2023-08-11  156  	if (IS_ERR(hw->regs))
ff0f9306f987d1 Max Filippov 2023-08-11  157  		return PTR_ERR(hw->regs);
ff0f9306f987d1 Max Filippov 2023-08-11  158  
ff0f9306f987d1 Max Filippov 2023-08-11  159  	dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
ff0f9306f987d1 Max Filippov 2023-08-11  160  		__func__, hw->regs, hw->hw_q);
ff0f9306f987d1 Max Filippov 2023-08-11  161  	if (hw->hw_q) {
ff0f9306f987d1 Max Filippov 2023-08-11  162  		u32 i;
ff0f9306f987d1 Max Filippov 2023-08-11  163  
ff0f9306f987d1 Max Filippov 2023-08-11  164  		for (i = 0; i < 2; ++i) {
ff0f9306f987d1 Max Filippov 2023-08-11  165  			dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
ff0f9306f987d1 Max Filippov 2023-08-11  166  				__func__, i,
ff0f9306f987d1 Max Filippov 2023-08-11  167  				hw->hw_q[i].offset,
ff0f9306f987d1 Max Filippov 2023-08-11  168  				hw->hw_q[i].mask);
ff0f9306f987d1 Max Filippov 2023-08-11  169  		}
ff0f9306f987d1 Max Filippov 2023-08-11  170  	} else {
ff0f9306f987d1 Max Filippov 2023-08-11  171  		return -ENODEV;
ff0f9306f987d1 Max Filippov 2023-08-11  172  	}
ff0f9306f987d1 Max Filippov 2023-08-11  173  
ff0f9306f987d1 Max Filippov 2023-08-11  174  	hw->irq = platform_get_irq(pdev, 0);
ff0f9306f987d1 Max Filippov 2023-08-11  175  	if (hw->irq >= 0) {
ff0f9306f987d1 Max Filippov 2023-08-11  176  		int ret;
ff0f9306f987d1 Max Filippov 2023-08-11  177  
ff0f9306f987d1 Max Filippov 2023-08-11  178  		ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
ff0f9306f987d1 Max Filippov 2023-08-11  179  						esp32_ipc_irq_handler,
ff0f9306f987d1 Max Filippov 2023-08-11  180  						esp32_ipc_thread_handler,
ff0f9306f987d1 Max Filippov 2023-08-11  181  						IRQF_SHARED, pdev->name, hw);
ff0f9306f987d1 Max Filippov 2023-08-11  182  		if (ret < 0) {
ff0f9306f987d1 Max Filippov 2023-08-11  183  			dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
ff0f9306f987d1 Max Filippov 2023-08-11  184  			return ret;
ff0f9306f987d1 Max Filippov 2023-08-11  185  		}
ff0f9306f987d1 Max Filippov 2023-08-11  186  	} else {
ff0f9306f987d1 Max Filippov 2023-08-11  187  		dev_err(&pdev->dev, "missing IRQ property\n");
ff0f9306f987d1 Max Filippov 2023-08-11  188  		return -ENODEV;
ff0f9306f987d1 Max Filippov 2023-08-11  189  	}
ff0f9306f987d1 Max Filippov 2023-08-11  190  
ff0f9306f987d1 Max Filippov 2023-08-11  191  	return 0;
ff0f9306f987d1 Max Filippov 2023-08-11  192  }
ff0f9306f987d1 Max Filippov 2023-08-11  193  
ff0f9306f987d1 Max Filippov 2023-08-11  194  static int esp32_ipc_probe(struct platform_device *pdev)
ff0f9306f987d1 Max Filippov 2023-08-11  195  {
ff0f9306f987d1 Max Filippov 2023-08-11  196  	struct esp32_ipc *hw =
ff0f9306f987d1 Max Filippov 2023-08-11  197  		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
ff0f9306f987d1 Max Filippov 2023-08-11  198  	int ret;
ff0f9306f987d1 Max Filippov 2023-08-11  199  
ff0f9306f987d1 Max Filippov 2023-08-11  200  	if (!hw)
ff0f9306f987d1 Max Filippov 2023-08-11  201  		return -ENOMEM;
ff0f9306f987d1 Max Filippov 2023-08-11  202  	platform_set_drvdata(pdev, hw);
ff0f9306f987d1 Max Filippov 2023-08-11  203  
ff0f9306f987d1 Max Filippov 2023-08-11  204  	spin_lock_init(&hw->lock);
ff0f9306f987d1 Max Filippov 2023-08-11  205  	ret = init_hw(pdev, hw);
ff0f9306f987d1 Max Filippov 2023-08-11  206  	if (ret < 0)
ff0f9306f987d1 Max Filippov 2023-08-11  207  		return ret;
ff0f9306f987d1 Max Filippov 2023-08-11  208  
ff0f9306f987d1 Max Filippov 2023-08-11  209  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].read = 0;
ff0f9306f987d1 Max Filippov 2023-08-11  210  	hw->hw_q[ESP32_IPC_WRITE_HW_Q].write = 0;
ff0f9306f987d1 Max Filippov 2023-08-11  211  	wmb();
ff0f9306f987d1 Max Filippov 2023-08-11  212  	writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
ff0f9306f987d1 Max Filippov 2023-08-11  213  
ff0f9306f987d1 Max Filippov 2023-08-11  214  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
ff0f9306f987d1 Max Filippov 2023-08-11  215  	return ret;
ff0f9306f987d1 Max Filippov 2023-08-11  216  }
ff0f9306f987d1 Max Filippov 2023-08-11  217  
ff0f9306f987d1 Max Filippov 2023-08-11  218  static void esp32_ipc_remove(struct platform_device *pdev)
ff0f9306f987d1 Max Filippov 2023-08-11  219  {
ff0f9306f987d1 Max Filippov 2023-08-11  220  	struct esp32_ipc *hw = platform_get_drvdata(pdev);
ff0f9306f987d1 Max Filippov 2023-08-11  221  
ff0f9306f987d1 Max Filippov 2023-08-11  222  	if (!hw)
ff0f9306f987d1 Max Filippov 2023-08-11  223  		return;
ff0f9306f987d1 Max Filippov 2023-08-11  224  
ff0f9306f987d1 Max Filippov 2023-08-11  225  	disable_irq(hw->irq);
ff0f9306f987d1 Max Filippov 2023-08-11  226  }
ff0f9306f987d1 Max Filippov 2023-08-11  227  
ff0f9306f987d1 Max Filippov 2023-08-11 @228  static const struct of_device_id esp32_ipc_match[] = {
ff0f9306f987d1 Max Filippov 2023-08-11  229  	{
ff0f9306f987d1 Max Filippov 2023-08-11  230  		.compatible = "esp,esp32-ipc",
ff0f9306f987d1 Max Filippov 2023-08-11  231  	}, {},
ff0f9306f987d1 Max Filippov 2023-08-11  232  };
ff0f9306f987d1 Max Filippov 2023-08-11  233  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
ff0f9306f987d1 Max Filippov 2023-08-11  234  

:::::: The code at line 152 was first introduced by commit
:::::: ff0f9306f987d1547ac6a746b3f2bbb17238ae96 misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
