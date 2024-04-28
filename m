Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B91876
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 03:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714276451; cv=none; b=Pb/3dUfSEnBWhasCu8o49S2FkD3cFTsYsFezcNyjQgOprH1MOk/6r0c8tbz/MN6hZXjcH400mmCOcwiK84eanffhi9x3ve3q9eEw1LMHkFMdbQtvzm6UlMsno1Cfuoe5/qXIw0eqeix3XHB0uQQ98mu6sc9CNGkPJqWz75NUxM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714276451; c=relaxed/simple;
	bh=rLlURaZF7OMBcu4v2z2nfqwx5yEPcpf4ChNZJyrxKCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnSAXUOCrZuz69sR8EP7tibpIctBOywVN2bL9lhGyfgbwaiZSPD6Uam3TfER4ngiQNBKa7JeAk6IcQQdoCG3Gh06Wsv2bK16PR0CcY6D22b55M8+kWkw4lkNV9HNosukbNl4UoNKytS+WGvjn7BwZh6b+AA5zpRArjA+SA26fhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiywrRNU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiywrRNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714276449; x=1745812449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLlURaZF7OMBcu4v2z2nfqwx5yEPcpf4ChNZJyrxKCc=;
  b=YiywrRNUZVU+dVDS6sclWK3G23/fOT9R4Mnv9Aq1jDqtFe9eI78xwFq6
   hULBjCNhBeEVXPZBjebZAhZcn6s6rWnCJr/I1NuiYnKVDtwIioV8SjhFK
   7QwHBL8AVzXGor9fxfy4PZRAR52zqoZicpuU5AJNm5K6TaOtDZHs4vkcH
   2LM0pIRWm/RojlhqywglX0hhTTbIfNn80RFGE3Nsp234Jb9/wiCCRVDcC
   LELfnlBLD3bJVTAleSyfF9wt4F+MCVkEDWmhD0pJRjNCaJ2wUWLHKvdAJ
   2y4w0+R/f6SKSPkefLlRydo4VdBtsx8r5wfKycvJFfrEyrHgkns97M38T
   Q==;
X-CSE-ConnectionGUID: e80+0FxwSgS24x9QpHLl2Q==
X-CSE-MsgGUID: 4HZ1FQReSpSYdQrsO6+bvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13759205"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="13759205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:54:08 -0700
X-CSE-ConnectionGUID: TzCJRsi9S+KdjLK+ufKIOw==
X-CSE-MsgGUID: 1bvSAvDLQZy4gxsR/heuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="56980962"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Apr 2024 20:54:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0vc4-0005oc-2g;
	Sun, 28 Apr 2024 03:54:04 +0000
Date: Sun, 28 Apr 2024 11:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 101/11728]
 arch/arm/mach-imx/busfreq_optee.c:108:5: warning: no previous prototype for
 'update_freq_optee'
Message-ID: <202404281118.QYOP3lzX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 3ccd336f66d34fc6bab9aad6ee3ec1e3afb095bf [101/11728] MLK-20023 Move Busfreq support to OPTEE OS
config: arm-randconfig-001-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281118.QYOP3lzX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281118.QYOP3lzX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281118.QYOP3lzX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/busfreq_optee.c:108:5: warning: no previous prototype for 'update_freq_optee' [-Wmissing-prototypes]
     108 | int update_freq_optee(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_optee.c:304:5: warning: no previous prototype for 'init_freq_optee' [-Wmissing-prototypes]
     304 | int init_freq_optee(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~


vim +/update_freq_optee +108 arch/arm/mach-imx/busfreq_optee.c

    99	
   100	/**
   101	 * @brief   Request OPTEE OS to change the memory bus frequency
   102	 *          to \a ddr_rate value
   103	 *
   104	 * @param[in]  rate  Bus Frequency
   105	 *
   106	 * @retval 0  Success
   107	 */
 > 108	int update_freq_optee(int ddr_rate)
   109	{
   110		struct arm_smccc_res res;
   111	
   112		uint32_t me      = 0;
   113		uint32_t dll_off = 0;
   114		int      mode    = get_bus_freq_mode();
   115	
   116	#ifdef CONFIG_SMP
   117		uint32_t reg         = 0;
   118		uint32_t cpu         = 0;
   119		uint32_t online_cpus = 0;
   120		uint32_t all_cpus    = 0;
   121	#endif
   122	
   123		pr_info("\nBusfreq OPTEE set from %d to %d start...\n",
   124				curr_ddr_rate, ddr_rate);
   125	
   126		if (ddr_rate == curr_ddr_rate)
   127			return 0;
   128	
   129		if (cpu_is_imx6()) {
   130			if ((mode == BUS_FREQ_LOW) || (mode == BUS_FREQ_AUDIO))
   131				dll_off = 1;
   132		}
   133	
   134		local_irq_disable();
   135	
   136	#ifdef CONFIG_SMP
   137		me = smp_processor_id();
   138	
   139		/* Make sure all the online cores to be active */
   140		do {
   141			all_cpus = 0;
   142	
   143			for_each_online_cpu(cpu)
   144				all_cpus |= (pSync->wfe_status[cpu] << cpu);
   145		} while (all_cpus);
   146	
   147		pSync->change_ongoing = 1;
   148		dsb();
   149	
   150		for_each_online_cpu(cpu) {
   151			if (cpu != me) {
   152				online_cpus |= (1 << cpu);
   153				/* Set the interrupt to be pending in the GIC. */
   154				reg = 1 << (irqs_for_wfe[cpu] % 32);
   155				writel_relaxed(reg, gic_dist_base + GIC_DIST_PENDING_SET
   156					+ (irqs_for_wfe[cpu] / 32) * 4);
   157			}
   158		}
   159	
   160		/* Wait for all active CPUs to be in WFE */
   161		do {
   162			all_cpus = 0;
   163	
   164			for_each_online_cpu(cpu)
   165				all_cpus |= (pSync->wfe_status[cpu] << cpu);
   166		} while (all_cpus != online_cpus);
   167	
   168	#endif
   169	
   170		/* Now we can change the DDR frequency. */
   171		/* Call the TEE SiP */
   172		arm_smccc_smc(OPTEE_SMC_FAST_CALL_SIP_VAL(IMX_SIP_BUSFREQ_CHANGE),
   173					ddr_rate, dll_off, 0, 0, 0, 0, 0, &res);
   174	
   175		curr_ddr_rate = ddr_rate;
   176	
   177	#ifdef CONFIG_SMP
   178		/* DDR frequency change is done */
   179		pSync->change_ongoing = 0;
   180		dsb();
   181	
   182		/* wake up all the cores. */
   183		sev();
   184	#endif
   185	
   186		local_irq_enable();
   187	
   188		pr_info("Busfreq OPTEE set to %d done! cpu=%d\n",
   189				ddr_rate, me);
   190	
   191		return 0;
   192	}
   193	
   194	#ifdef CONFIG_SMP
   195	static int init_freq_optee_smp(struct platform_device *busfreq_pdev)
   196	{
   197		struct device_node *node = 0;
   198		struct device *dev = &busfreq_pdev->dev;
   199		uint32_t cpu;
   200		int err;
   201		int irq;
   202		struct irq_data *irq_data;
   203		unsigned long wfe_iram_base;
   204	
   205		if (cpu_is_imx6()) {
   206			node = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-gic");
   207			if (!node) {
   208				if (cpu_is_imx6q())
   209					pr_debug("failed to find imx6q-a9-gic device tree data!\n");
   210	
   211				return -EINVAL;
   212			}
   213		} else {
   214			node = of_find_compatible_node(NULL, NULL, "arm,cortex-a7-gic");
   215			if (!node) {
   216				pr_debug("failed to find imx7d-a7-gic device tree data!\n");
   217				return -EINVAL;
   218			}
   219		}
   220	
   221		gic_dist_base = of_iomap(node, 0);
   222		WARN(!gic_dist_base, "unable to map gic dist registers\n");
   223	
   224		irqs_for_wfe = devm_kzalloc(dev, sizeof(uint32_t) * num_present_cpus(),
   225						GFP_KERNEL);
   226	
   227		for_each_online_cpu(cpu) {
   228			/*
   229			 * set up a reserved interrupt to get all
   230			 * the active cores into a WFE state
   231			 * before changing the DDR frequency.
   232			 */
   233			irq = platform_get_irq(busfreq_pdev, cpu);
   234	
   235			if (cpu_is_imx6()) {
   236				err = request_irq(irq, wait_in_wfe_irq,
   237					IRQF_PERCPU, "mmdc_1", NULL);
   238			} else {
   239				err = request_irq(irq, wait_in_wfe_irq,
   240					IRQF_PERCPU, "ddrc", NULL);
   241			}
   242	
   243			if (err) {
   244				dev_err(dev,
   245					"Busfreq:request_irq failed %d, err = %d\n",
   246					irq, err);
   247				return err;
   248			}
   249	
   250			err = irq_set_affinity(irq, cpumask_of(cpu));
   251			if (err) {
   252				dev_err(dev,
   253					"Busfreq: Cannot set irq affinity irq=%d,\n",
   254					irq);
   255				return err;
   256			}
   257	
   258			irq_data = irq_get_irq_data(irq);
   259			irqs_for_wfe[cpu] = irq_data->hwirq + 32;
   260		}
   261	
   262		/* Store the variable used to communicate between cores */
   263		pSync = (void *)ddr_freq_change_iram_base;
   264	
   265		memset(pSync, 0, sizeof(*pSync));
   266	
   267		wfe_iram_base = ddr_freq_change_iram_base + sizeof(*pSync);
   268	
   269		if (wfe_iram_base & (FNCPY_ALIGN - 1))
   270			wfe_iram_base += FNCPY_ALIGN -
   271					((uintptr_t)wfe_iram_base % (FNCPY_ALIGN));
   272	
   273		wfe_change_freq = (void *)fncpy((void *)wfe_iram_base,
   274					&imx_smp_wfe_optee,
   275					((&imx_smp_wfe_end -&imx_smp_wfe_start) *4));
   276	
   277		return 0;
   278	
   279	}
   280	
   281	int init_freq_optee(struct platform_device *busfreq_pdev)
   282	{
   283		int err = -EINVAL;
   284		struct device *dev = &busfreq_pdev->dev;
   285	
   286		if (num_present_cpus() <= 1) {
   287			wfe_change_freq = NULL;
   288	
   289			/* Allocate the cores synchronization variables (not used) */
   290			pSync = devm_kzalloc(dev, sizeof(*pSync), GFP_KERNEL);
   291	
   292			if (pSync)
   293				err = 0;
   294		} else {
   295			err = init_freq_optee_smp(busfreq_pdev);
   296		}
   297	
   298		if (err == 0)
   299			curr_ddr_rate = ddr_normal_rate;
   300	
   301		return err;
   302	}
   303	#else
 > 304	int init_freq_optee(struct platform_device *busfreq_pdev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
