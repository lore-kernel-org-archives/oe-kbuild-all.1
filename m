Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7B73199
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714331025; cv=none; b=Zhkq7keRdwoEmnSSEPsSRqwzNw9VGxLOUVgRIXxQclfBkd8f1uNzhF/ErmXlR1xoM51GgAstGdfwvpDm3uoQwtjOPEcvw/UDbgX7NW6+LYLrRBGhz9wI/GQlTiO8Aqrb7n65fjDDJgjFuWjyPRAqXjUIYlhO1IXJ41mkfB/ivz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714331025; c=relaxed/simple;
	bh=Y4f0moOMlWPKCNkOM7yQVFT7jjA46aLt75V5qLrcHIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsxrNJY6NVOcn1naw3wYGvzGOo5uF74lBroWzTLE912UFaolmcIAA5+euiMwsT1+pvpyS8UETSIqqPpvFf7AHwutX0vUb5YerXT8oezHcvnPqiHTcYL/3e8B+0TLBdxjcO3EfM6STVcuGU8+qQZKwlBvQnwF4iGaxjf/19Sf/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngcUW0ti; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngcUW0ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714331023; x=1745867023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4f0moOMlWPKCNkOM7yQVFT7jjA46aLt75V5qLrcHIk=;
  b=ngcUW0tiTVpuUmIez+LpLKcBBUHsIpJYKRtwHZ0QVy2RDHkRS1E49xu8
   6P8otwJGuopm385VsZjTsM6jBHBkPloVvPNTGxKg2sESQq8sEh04YWE3K
   CVIUH23ihPBXWUOfzP2AZvaUwvupcEZ1Owu0dL7nIRmChNhpd5gPx91Gu
   25KbRzbgny1RcjtDQ7KNzFbgvZtJjT6fMqC+SseFH4TMOXJlV6pWALQHv
   ZVQQSMTkQdM3ZvhofJ10kuDTrUldFt8jHGjGlv2cNUOtKKVrZKReOiDrG
   MF6Osm1tnNAQ+gPy2FCuxD90il86/AtbBfz1DWuoedlpIaSqyN3h3t8SY
   w==;
X-CSE-ConnectionGUID: lsQV+O7VQWaJF4aQsptEDw==
X-CSE-MsgGUID: SgkAZ0YORR6B44LgaGlepw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10209460"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="10209460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 12:03:42 -0700
X-CSE-ConnectionGUID: VLbSZeq8REmrxe7J0+nc+g==
X-CSE-MsgGUID: FgWkj+QqSGa42QWXQ8dCqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26539267"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2024 12:03:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s19oI-0006Za-19;
	Sun, 28 Apr 2024 19:03:38 +0000
Date: Mon, 29 Apr 2024 03:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 101/11728]
 arch/arm/mach-imx/busfreq_optee.c:108:5: warning: no previous prototype for
 function 'update_freq_optee'
Message-ID: <202404290356.11dYTvTK-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240429/202404290356.11dYTvTK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290356.11dYTvTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290356.11dYTvTK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/busfreq_optee.c:108:5: warning: no previous prototype for function 'update_freq_optee' [-Wmissing-prototypes]
   int update_freq_optee(int ddr_rate)
       ^
   arch/arm/mach-imx/busfreq_optee.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int update_freq_optee(int ddr_rate)
   ^
   static 
>> arch/arm/mach-imx/busfreq_optee.c:281:5: warning: no previous prototype for function 'init_freq_optee' [-Wmissing-prototypes]
   int init_freq_optee(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_optee.c:281:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_freq_optee(struct platform_device *busfreq_pdev)
   ^
   static 
   2 warnings generated.
--
>> arch/arm/mach-imx/busfreq_optee.c:53: warning: Cannot understand  * @brief  Definition of the synchronization status
    on line 53 - I thought it was a doc line
>> arch/arm/mach-imx/busfreq_optee.c:70: warning: Cannot understand  * @brief  Switch all active cores, except the one changing the
    on line 70 - I thought it was a doc line
>> arch/arm/mach-imx/busfreq_optee.c:101: warning: Cannot understand  * @brief   Request OPTEE OS to change the memory bus frequency
    on line 101 - I thought it was a doc line


vim +/update_freq_optee +108 arch/arm/mach-imx/busfreq_optee.c

    50	
    51	
    52	/**
  > 53	 * @brief  Definition of the synchronization status
    54	 *         structure used to control to CPUs status
    55	 *         and on-going frequency change
    56	 */
    57	struct busfreq_sync {
    58		uint32_t change_ongoing;
    59		uint32_t wfe_status[NR_CPUS];
    60	} __aligned(8);
    61	
    62	static struct busfreq_sync *pSync;
    63	
    64	static void (*wfe_change_freq)(uint32_t *wfe_status, uint32_t *freq_done);
    65	
    66	static uint32_t *irqs_for_wfe;
    67	static void __iomem *gic_dist_base;
    68	
    69	/**
  > 70	 * @brief  Switch all active cores, except the one changing the
    71	 *         bus frequency, in WFE mode until completion of the
    72	 *         frequency change
    73	 *
    74	 * @param[in]  irq     Interrupt ID - not used
    75	 * @param[in]  dev_id  Client data - not used
    76	 *
    77	 * @retval IRQ_HANDLED  Interrupt handled
    78	 */
    79	static irqreturn_t wait_in_wfe_irq(int irq, void *dev_id)
    80	{
    81		uint32_t me;
    82	
    83		me = smp_processor_id();
    84	#ifdef CONFIG_LOCAL_TIMERS
    85		clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER,
    86			&me);
    87	#endif
    88	
    89		wfe_change_freq(&pSync->wfe_status[me], &pSync->change_ongoing);
    90	
    91	#ifdef CONFIG_LOCAL_TIMERS
    92		clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT,
    93			&me);
    94	#endif
    95	
    96		return IRQ_HANDLED;
    97	}
    98	#endif
    99	
   100	/**
 > 101	 * @brief   Request OPTEE OS to change the memory bus frequency
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
 > 281	int init_freq_optee(struct platform_device *busfreq_pdev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
