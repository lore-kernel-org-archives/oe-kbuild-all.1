Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC63815C15F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755368886; cv=none; b=Ganl8u7tq+cZIdTksnxcOjD515fvYWD6O2bnUnFVecQi9bbocSE/zd9kUbd0A8+mogBLoOflyV6CUpanNc1O7SPbYob1Ema7ZnHlo1ClctUGz7qgoWUZwTE0S+NWjmeIHOa+Iot5LG4RM7lc5wjjis/j7yXTRB2bL6hzX4dC6Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755368886; c=relaxed/simple;
	bh=IVd9A1kE//dOaklHCTLifVQNjQF1deSXaBXPTo1bjiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qgIMi3t6ovPZPuVS89FeugR5ppym4upMBIqLvPYh0XGupGP0Pyd+1HJB7pyNUCkoL8IussiSg90VqPhXOkQDf43siWprkL6DV94y0xIAO8nzyJKUpUSNbdjmjrwKgAZ1pSxhrn6SGNmLvyRM751m5vSIoIkkROAVMck0nzhfU/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3P4FWPT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3P4FWPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755368885; x=1786904885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVd9A1kE//dOaklHCTLifVQNjQF1deSXaBXPTo1bjiA=;
  b=l3P4FWPT4hngsWpSZUr7WDSq6i09mwt7oGHX4emWGTc7aWbuTXoUWNVy
   kobk/AYh1IKqz/BSk2Ejwnxwu9jdpcTT+i2DfjnRexDMd9DgF3sft6PVr
   aCekgkqs1AuOU9qnFJ77JqxERoRWcSaKA58RAIKXrtRg7/cdOT8o/jleR
   YsnptJtgWdh49uA03aZ9DENf/fJ1czsIDrKjnSCoseo0taSWIrCTYnOu1
   g3+bzuY2Mu/aM3aoJ14KXn/4746M+frtX0Ba6ZtBSbmn5+bqCzYvrB2WW
   0xv5z05fM4LrtYBd/J3+KR38nhSb1idDCnrbKW8MXp22DROH25PdAgFex
   Q==;
X-CSE-ConnectionGUID: 8OppylsARluICHmuUQrydA==
X-CSE-MsgGUID: thpx/gvCRNu8L7DEQWjnFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57731062"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57731062"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 11:28:05 -0700
X-CSE-ConnectionGUID: LsQLs44LSP67R1jklPSBSw==
X-CSE-MsgGUID: cTovjDaxROSpWGqfj1j8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204415074"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2025 11:28:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unLdI-000D5k-28;
	Sat, 16 Aug 2025 18:28:00 +0000
Date: Sun, 17 Aug 2025 02:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v3 5/5] drivers/accel/ethosu/ethosu_drv.c:210:9: error:
 implicit declaration of function 'FIELD_GET'
Message-ID: <202508170258.0PD98SOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v3
head:   74531049aaf7feda960f5e7d701a417dd7620b2c
commit: 74531049aaf7feda960f5e7d701a417dd7620b2c [5/5] renaming
config: xtensa-randconfig-r073-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170258.0PD98SOg-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170258.0PD98SOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508170258.0PD98SOg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/accel/ethosu/ethosu_drv.c: In function 'ethosu_is_u65':
>> drivers/accel/ethosu/ethosu_drv.c:210:9: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
            ^~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/accel/ethosu/ethosu_drv.c:10:
   drivers/accel/ethosu/ethosu_drv.c: In function 'ethosu_init':
>> drivers/accel/ethosu/ethosu_drv.c:328:3: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
      "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:327:2: note: in expansion of macro 'dev_info'
     dev_info(ethosudev->base.dev,
     ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:328:3: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]
      "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:327:2: note: in expansion of macro 'dev_info'
     dev_info(ethosudev->base.dev,
     ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:328:3: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
      "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:327:2: note: in expansion of macro 'dev_info'
     dev_info(ethosudev->base.dev,
     ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:328:3: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'int' [-Wformat=]
      "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:327:2: note: in expansion of macro 'dev_info'
     dev_info(ethosudev->base.dev,
     ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:328:3: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'int' [-Wformat=]
      "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:327:2: note: in expansion of macro 'dev_info'
     dev_info(ethosudev->base.dev,
     ^~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:328:3: warning: format '%ld' expects argument of type 'long int', but argument 8 has type 'int' [-Wformat=]
      "Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:327:2: note: in expansion of macro 'dev_info'
     dev_info(ethosudev->base.dev,
     ^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/accel/ethosu/ethosu_gem.c: In function 'feat_matrix_length':
>> drivers/accel/ethosu/ethosu_gem.c:222:3: error: a label can only be part of a statement and a declaration is not a statement
      u32 element_size = BIT((fm->precision >> 1) & 0x3);
      ^~~
   drivers/accel/ethosu/ethosu_gem.c: In function 'ethosu_gem_cmdstream_copy_and_validate':
   drivers/accel/ethosu/ethosu_gem.c:393:4: error: a label can only be part of a statement and a declaration is not a statement
       u64 srclen = dma_length(info, &st.dma, &st.dma.src);
       ^~~
>> drivers/accel/ethosu/ethosu_gem.c:394:4: error: expected expression before 'u64'
       u64 dstlen = dma_length(info, &st.dma, &st.dma.dst);
       ^~~
   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-buf.h:21,
                    from include/drm/drm_gem.h:38,
                    from include/drm/drm_gem_dma_helper.h:7,
                    from drivers/accel/ethosu/ethosu_gem.h:8,
                    from drivers/accel/ethosu/ethosu_gem.c:10:
>> drivers/accel/ethosu/ethosu_gem.c:400:44: error: 'dstlen' undeclared (first use in this function); did you mean 'strlen'?
         st.dma.dst.region, st.dma.dst.offset, dstlen);
                                               ^~~~~~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                          ^~~~~~~~~~~
   drivers/accel/ethosu/ethosu_gem.c:398:4: note: in expansion of macro 'dev_info'
       dev_info(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
       ^~~~~~~~
   drivers/accel/ethosu/ethosu_gem.c:400:44: note: each undeclared identifier is reported only once for each function it appears in
         st.dma.dst.region, st.dma.dst.offset, dstlen);
                                               ^~~~~~
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                          ^~~~~~~~~~~
   drivers/accel/ethosu/ethosu_gem.c:398:4: note: in expansion of macro 'dev_info'
       dev_info(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
       ^~~~~~~~


vim +/FIELD_GET +210 drivers/accel/ethosu/ethosu_drv.c

   207	
   208	static bool ethosu_is_u65(const struct ethosu_device *ethosudev)
   209	{
 > 210		return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
   211	}
   212	
   213	#define AXI_LIMIT_CFG 0x1f3f0002
   214	
   215	static int ethosu_reset(struct ethosu_device *ethosudev)
   216	{
   217		int ret;
   218		u32 reg;
   219	
   220		writel_relaxed(RESET_PENDING_CSL, ethosudev->regs + NPU_REG_RESET);
   221		ret = readl_poll_timeout(ethosudev->regs + NPU_REG_STATUS, reg,
   222					 !FIELD_GET(STATUS_RESET_STATUS, reg),
   223					 USEC_PER_MSEC, USEC_PER_SEC);
   224		if (ret)
   225			return ret;
   226	
   227		if (!FIELD_GET(PROT_ACTIVE_CSL, readl_relaxed(ethosudev->regs + NPU_REG_PROT))) {
   228			dev_warn(ethosudev->base.dev, "Could not reset to non-secure mode (PROT = %x)\n",
   229				 readl_relaxed(ethosudev->regs + NPU_REG_PROT));
   230		}
   231	
   232		if (ethosu_is_u65(ethosudev)) {
   233			/* Assign region 2 to AXI M0, everything else to AXI M1*/
   234			writel_relaxed(0x0000aa8a, ethosudev->regs + NPU_REG_REGIONCFG);
   235			writel_relaxed(AXI_LIMIT_CFG, ethosudev->regs + NPU_REG_AXILIMIT0);
   236			writel_relaxed(AXI_LIMIT_CFG, ethosudev->regs + NPU_REG_AXILIMIT1);
   237			writel_relaxed(AXI_LIMIT_CFG, ethosudev->regs + NPU_REG_AXILIMIT2);
   238			writel_relaxed(AXI_LIMIT_CFG, ethosudev->regs + NPU_REG_AXILIMIT3);
   239		}
   240	
   241		if (ethosudev->sram)
   242			memset_io(ethosudev->sram, 0, ethosudev->npu_info.sram_size);
   243	
   244		return 0;
   245	}
   246	
   247	static int ethosu_device_resume(struct device *dev)
   248	{
   249		struct ethosu_device *ethosudev = dev_get_drvdata(dev);
   250		int ret;
   251	
   252		ret = clk_prepare_enable(ethosudev->core_clk);
   253		if (ret)
   254			return ret;
   255	
   256		ret = clk_prepare_enable(ethosudev->apb_clk);
   257		if (ret)
   258			goto err_disable_core_clk;
   259	
   260		ret = ethosu_reset(ethosudev);
   261		if (!ret)
   262			return 0;
   263	
   264	err_disable_core_clk:
   265		clk_disable_unprepare(ethosudev->core_clk);
   266		return ret;
   267	}
   268	
   269	static int ethosu_device_suspend(struct device *dev)
   270	{
   271		struct ethosu_device *ethosudev = dev_get_drvdata(dev);
   272	
   273		clk_disable_unprepare(ethosudev->apb_clk);
   274		clk_disable_unprepare(ethosudev->core_clk);
   275		return 0;
   276	}
   277	
   278	static int ethosu_sram_init(struct ethosu_device *ethosudev)
   279	{
   280		ethosudev->npu_info.sram_size = 0;
   281	
   282		ethosudev->srampool = of_gen_pool_get(ethosudev->base.dev->of_node, "sram", 0);
   283		if (!ethosudev->srampool)
   284			return 0;
   285	
   286		ethosudev->npu_info.sram_size = gen_pool_size(ethosudev->srampool);
   287	
   288		ethosudev->sram = (void __iomem *)gen_pool_dma_alloc(ethosudev->srampool,
   289								    ethosudev->npu_info.sram_size,
   290								    &ethosudev->sramphys);
   291		if (!ethosudev->sram) {
   292			dev_err(ethosudev->base.dev, "failed to allocate from SRAM pool\n");
   293			return -ENOMEM;
   294		}
   295	
   296		return 0;
   297	}
   298	
   299	static int ethosu_init(struct ethosu_device *ethosudev)
   300	{
   301		int ret;
   302		u32 id, config;
   303	
   304		ret = devm_pm_runtime_enable(ethosudev->base.dev);
   305		if (ret)
   306			return ret;
   307	
   308		ret = pm_runtime_resume_and_get(ethosudev->base.dev);
   309		if (ret)
   310			return ret;
   311	
   312		pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
   313		pm_runtime_use_autosuspend(ethosudev->base.dev);
   314	
   315		/* If PM is disabled, we need to call ethosu_device_resume() manually. */
   316		if (!IS_ENABLED(CONFIG_PM)) {
   317			ret = ethosu_device_resume(ethosudev->base.dev);
   318			if (ret)
   319				return ret;
   320		}
   321	
   322		ethosudev->npu_info.id = id = readl_relaxed(ethosudev->regs + NPU_REG_ID);
   323		ethosudev->npu_info.config = config = readl_relaxed(ethosudev->regs + NPU_REG_CONFIG);
   324	
   325		ethosu_sram_init(ethosudev);
   326	
   327		dev_info(ethosudev->base.dev,
 > 328			"Ethos-U NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
   329			FIELD_GET(ID_ARCH_MAJOR_MASK, id),
   330			FIELD_GET(ID_ARCH_MINOR_MASK, id),
   331			FIELD_GET(ID_ARCH_PATCH_MASK, id),
   332			FIELD_GET(ID_VER_MAJOR_MASK, id),
   333			FIELD_GET(ID_VER_MINOR_MASK, id),
   334			FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
   335			1 << FIELD_GET(CONFIG_MACS_PER_CC_MASK, config),
   336			ethosudev->npu_info.sram_size / 1024);
   337	
   338		return 0;
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
