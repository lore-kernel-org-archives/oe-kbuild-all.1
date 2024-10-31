Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDD13CFB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 05:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730353983; cv=none; b=EAzcS8Mh+11t2TlDeVKqGCjx3xRNL/r+OJrKbMltt7ad61x/SuLdqGFW6EEv4ysZYxo3uK+C8Wouj9T2UWxhLZZxTN+quJM/iEkwk4GRqqFEmHQ1gYHNfEl4Afy3IZdi+HbonAULGg0EsYJk6eBbPViFyIS9RMa4kGWcDi+nPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730353983; c=relaxed/simple;
	bh=KHk3jk2avCah4AcdniaxgWxuJvXs8vpsdRrGuLdYaBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=isv0CYXK/vEuJwOyz19Qfy/yiP/BvlPYO5oA3skMJnDO3EeZUg9baGwK2MNmuw1CStCVAHHI+6CcaCVFNP3Jv18Iok2sA1U20Rj9A5j2oLQUZLc4XHa8c92gy0WBpjyyJoQcS2fRTUIhP9q/PpC2UjgHZTy1Hs4hTcWD/etQnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfqbqCRy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfqbqCRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730353981; x=1761889981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHk3jk2avCah4AcdniaxgWxuJvXs8vpsdRrGuLdYaBg=;
  b=ZfqbqCRy0jOCCjjxUk17chPY+qS2sX+4e0e2thgw70SzB8togJxJofQV
   FY2caTgmaTP473n1fL+2SVdKHfAvMZk4qVn6SJje+wIz2r22H1XEEr28R
   T25Tbvezb+xK+ipssal4RwO2Xi5lZqElsYCXWqvUgsXtCDBo+tFjKk2ro
   QCtzQ2LoQ0sNQa0ust6tVX0rUuoPa/fBho2vvwRtjovFRkmHbnejY5IAS
   dKe/TylxtNgSrqxTo7ZwOZp97xQTEvju6v9UoAV3aXh0qz+XcaQd9Y/Nf
   fe1EcskBgNJb69zEhWS2CWCf0KmzF7bndsYywB2y6v8Ym3pVNo2ZuD0aM
   g==;
X-CSE-ConnectionGUID: yWkYMZtsSJmAIh3Nil2ejw==
X-CSE-MsgGUID: ZPn2NMWzT0i8TELIi4RV8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47553979"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="47553979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 22:52:57 -0700
X-CSE-ConnectionGUID: WVkZSgHFTRGwIezOyAy0bg==
X-CSE-MsgGUID: tMwQ4iVVTlmydvZj10q8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87673262"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 22:52:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6O74-000fig-0f;
	Thu, 31 Oct 2024 05:52:54 +0000
Date: Thu, 31 Oct 2024 13:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 80/81]
 drivers/i2c/busses/i2c-designware-platdrv.c:332:68: warning: format
 specifies type 'unsigned long long' but the argument has type 'dma_addr_t'
 (aka 'unsigned int')
Message-ID: <202410311345.GtGkCi4i-lkp@intel.com>
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
config: arm-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311345.GtGkCi4i-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311345.GtGkCi4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311345.GtGkCi4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-platdrv.c:332:68: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     332 |         dev_err(&pdev->dev, "Read pattern %x dma_handle %llx\n", pattern, dma_handle);
         |                                                         ~~~~              ^~~~~~~~~~
         |                                                         %x
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


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
