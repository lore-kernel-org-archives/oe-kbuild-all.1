Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA6B84047
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730349238; cv=none; b=lVOfIpsj1bt64D5P6ithFT8l7QzkhDK01svpIxZMJmXzDjwSHwEKjtbuuoc5R97cjXmOwUlUa/fvxYllxm+PRTJ0Ym4GEtUKy4RBS6o6zfw5t6YnhhmMBqR85fizuv5/NpetEJB7XNR3fv85m0Is0JJZciHNP+mAJ16YuB/Isms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730349238; c=relaxed/simple;
	bh=h/IyZJpOQW0hBwiJ0mWfQs+bgX2zawa/iyN0I8wFyL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHF6+40d0eksGHOdzem4fxU+53XpO5zYFNNS67laWi7cqYf9fwDMQqh6ILHiUhZm9H+jsmcuAAXX7fEq6yK6sEkhZ7B8nwwIYpL3aVJ4RVSp6KRwy44eAIKR8qHq2OAqOu/a++OzGKs67N5Z79yMMz2/6WA/uE4P2fa8sO57FAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds7mGxeU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds7mGxeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730349235; x=1761885235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/IyZJpOQW0hBwiJ0mWfQs+bgX2zawa/iyN0I8wFyL8=;
  b=ds7mGxeUrcc5tdT+e+32lmoQn8S3U/K/e9pdJ2qlRotHsF7LsWeeIJM1
   k8kGxbD62MncrlOQYSJP6SF0Z/uiKhgWjIHi4Z8Th1+dnTnpAkFiplpyf
   m+vezcbgjDxDTy2AGxafQcy2X4znypU/DmL/hxQefAjcx/3nItimGRXli
   2Kp301qQoy6ZcSYhotc4MUC2StFzkIpTOSgsabIjYhb/Lv124jAkRsFyT
   7Vk8nW1C3nZg2dlSfAEupvO4w3UWRxmSwvNgdVNFt/m9yDyrgC+/U0T+y
   N/D9fr1Gy6O+I5U/Z6E6jAHa0RCGJvn878yePRIuMiYIhtnWfDC5pe6TO
   A==;
X-CSE-ConnectionGUID: odntC+NHSTupcSNEzPT/GQ==
X-CSE-MsgGUID: UmlpP2/HTDK+UEm4kndCmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52631558"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52631558"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 21:33:54 -0700
X-CSE-ConnectionGUID: 08846WVeSMKXqEfa6R8Ywg==
X-CSE-MsgGUID: gVma7urbSFuxghT/apE12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82168570"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2024 21:33:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6MsZ-000ffI-1H;
	Thu, 31 Oct 2024 04:33:51 +0000
Date: Thu, 31 Oct 2024 12:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 80/81]
 drivers/i2c/busses/i2c-designware-platdrv.c:332:29: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202410311250.rHzgjI1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: cb22d30228058ef9d5903115855ec4578d242194 [80/81] ANDROID: HACK: Test I2C
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241031/202410311250.rHzgjI1T-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311250.rHzgjI1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311250.rHzgjI1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/i2c/busses/i2c-designware-platdrv.c:11:
   drivers/i2c/busses/i2c-designware-platdrv.c: In function 'dw_i2c_plat_probe':
>> drivers/i2c/busses/i2c-designware-platdrv.c:332:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     332 |         dev_err(&pdev->dev, "Read pattern %x dma_handle %llx\n", pattern, dma_handle);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/i2c/busses/i2c-designware-platdrv.c:332:9: note: in expansion of macro 'dev_err'
     332 |         dev_err(&pdev->dev, "Read pattern %x dma_handle %llx\n", pattern, dma_handle);
         |         ^~~~~~~
   drivers/i2c/busses/i2c-designware-platdrv.c:332:60: note: format string is defined here
     332 |         dev_err(&pdev->dev, "Read pattern %x dma_handle %llx\n", pattern, dma_handle);
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int
         |                                                         %x

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


vim +332 drivers/i2c/busses/i2c-designware-platdrv.c

   276	
   277	static int dw_i2c_plat_probe(struct platform_device *pdev)
   278	{
   279		struct i2c_adapter *adap;
   280		struct dw_i2c_dev *dev;
   281		struct i2c_timings *t;
   282		int irq, ret, version;
   283		dma_addr_t dma_handle;
   284		void *cpu_addr;
   285		unsigned int pattern;
   286	
   287		dev_err(&pdev->dev, "Prooooobing\n");
   288	
   289		irq = platform_get_irq(pdev, 0);
   290		if (irq < 0)
   291			return irq;
   292	
   293		dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
   294		if (!dev)
   295			return -ENOMEM;
   296	
   297		dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
   298		if (device_property_present(&pdev->dev, "wx,i2c-snps-model"))
   299			dev->flags = MODEL_WANGXUN_SP;
   300	
   301		dev->dev = &pdev->dev;
   302		dev->irq = irq;
   303		platform_set_drvdata(pdev, dev);
   304	
   305		ret = dw_i2c_plat_request_regs(dev);
   306		if (ret)
   307			return ret;
   308	
   309		dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
   310		if (IS_ERR(dev->rst))
   311			return PTR_ERR(dev->rst);
   312	
   313		reset_control_deassert(dev->rst);
   314	
   315		t = &dev->timings;
   316	
   317		/* Version expected 0x3132302a */
   318		version = readl_relaxed(dev->base + 0xf8);
   319		dev_err(&pdev->dev, "Version read %x", version);
   320		WARN_ON(version != 0x3132302a);
   321	
   322		/* Allocate 4 bytes for DMA and set the buffer address. */
   323		cpu_addr = dma_alloc_coherent(&pdev->dev, 4, &dma_handle, GFP_KERNEL);
   324		/* Address of DMA buffer. */
   325		writel_relaxed(dma_handle, dev->base + 0x90);
   326	
   327		/* Write to CPU address, reading MMIO will read it through DMA. */
   328		WRITE_ONCE(*(unsigned int *)cpu_addr, 0x55AA55AA);
   329		/* Order DMA buffer write with MMIO read. */
   330		mb();
   331		pattern = readl_relaxed(dev->base + 0x8c);
 > 332		dev_err(&pdev->dev, "Read pattern %x dma_handle %llx\n", pattern, dma_handle);
   333		WARN_ON(pattern != 0x55AA55AA);
   334	
   335		/* Write to the MMIO which writes to the buffer through DMA and read it from CPU.*/
   336		writel_relaxed(0xDEADBEEF, dev->base + 0x8c);
   337		/* As the previous write updates cpu_addr(DMA), make sure write is done before reading. */
   338		pattern = readl_relaxed(dev->base + 0x8c);
   339		/* Order DMA buffer read with MMIO read. */
   340		rmb();
   341		pattern = READ_ONCE(*(unsigned int *)cpu_addr);
   342		dev_err(&pdev->dev, "Read pattern from CPU %x\n", pattern);
   343		WARN_ON(pattern != 0xDEADBEEF);
   344	
   345		dma_free_coherent(&pdev->dev, 4, cpu_addr, dma_handle);
   346	
   347		i2c_parse_fw_timings(&pdev->dev, t, false);
   348	
   349		i2c_dw_adjust_bus_speed(dev);
   350	
   351		if (pdev->dev.of_node)
   352			dw_i2c_of_configure(pdev);
   353	
   354		if (has_acpi_companion(&pdev->dev))
   355			i2c_dw_acpi_configure(&pdev->dev);
   356	
   357		ret = i2c_dw_validate_speed(dev);
   358		if (ret)
   359			goto exit_reset;
   360	
   361		ret = i2c_dw_probe_lock_support(dev);
   362		if (ret)
   363			goto exit_reset;
   364	
   365		i2c_dw_configure(dev);
   366	
   367		/* Optional interface clock */
   368		dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
   369		if (IS_ERR(dev->pclk)) {
   370			ret = PTR_ERR(dev->pclk);
   371			goto exit_reset;
   372		}
   373	
   374		dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
   375		if (IS_ERR(dev->clk)) {
   376			ret = PTR_ERR(dev->clk);
   377			goto exit_reset;
   378		}
   379	
   380		ret = i2c_dw_prepare_clk(dev, true);
   381		if (ret)
   382			goto exit_reset;
   383	
   384		if (dev->clk) {
   385			u64 clk_khz;
   386	
   387			dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
   388			clk_khz = dev->get_clk_rate_khz(dev);
   389	
   390			if (!dev->sda_hold_time && t->sda_hold_ns)
   391				dev->sda_hold_time =
   392					DIV_S64_ROUND_CLOSEST(clk_khz * t->sda_hold_ns, MICRO);
   393		}
   394	
   395		adap = &dev->adapter;
   396		adap->owner = THIS_MODULE;
   397		adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
   398						I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
   399		ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
   400		adap->dev.of_node = pdev->dev.of_node;
   401		adap->nr = -1;
   402	
   403		if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
   404			dev_pm_set_driver_flags(&pdev->dev,
   405						DPM_FLAG_SMART_PREPARE);
   406		} else {
   407			dev_pm_set_driver_flags(&pdev->dev,
   408						DPM_FLAG_SMART_PREPARE |
   409						DPM_FLAG_SMART_SUSPEND);
   410		}
   411	
   412		device_enable_async_suspend(&pdev->dev);
   413	
   414		/* The code below assumes runtime PM to be disabled. */
   415		WARN_ON(pm_runtime_enabled(&pdev->dev));
   416	
   417		pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
   418		pm_runtime_use_autosuspend(&pdev->dev);
   419		pm_runtime_set_active(&pdev->dev);
   420	
   421		if (dev->shared_with_punit)
   422			pm_runtime_get_noresume(&pdev->dev);
   423	
   424		pm_runtime_enable(&pdev->dev);
   425	
   426		ret = i2c_dw_probe(dev);
   427		if (ret)
   428			goto exit_probe;
   429	
   430		return ret;
   431	
   432	exit_probe:
   433		dw_i2c_plat_pm_cleanup(dev);
   434	exit_reset:
   435		reset_control_assert(dev->rst);
   436		return ret;
   437	}
   438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
