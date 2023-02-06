Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463761FC1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 05:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675661872; x=1707197872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nIb5g3jyu2Fj7U8mdx8hkzyV0NeIodGVbiW0vZnZSEc=;
  b=f/Di7/UmMD7WqWy5yJlFgd5Kqg3NrxKUx649D6sZV9QOpDAsbuKOFGuJ
   V8AnVIeiDgtHqbgDwG4zZ4lUtX5g5OYsQ+PUuBV9JuZdMZtOl7dOy41P/
   jatRy2L4KzupAM8O7meG5Eq+7yUGjVtHZCaC8Kc6q9yYiEEqjvyhoaVe9
   qd7GYa0Bn64EUi7Xm1XgGcvd9Gn3eGzjtZqyrP3VPHUH2JI/ZIh/78nlE
   FCm6QL+DrB1GbWtq381Ks9VzRTqZsG2YA00BxGPRGDyXGAxEW18aoj/v7
   IXlOP89NcMFD1GYKGAHqld/0ZYJSk1yVkO7z0RnvVbD3fdDOZtN+VxcXJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="391530511"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="391530511"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 21:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="809009775"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809009775"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2023 21:37:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOuCL-0002P6-0k;
	Mon, 06 Feb 2023 05:37:49 +0000
Date: Mon, 6 Feb 2023 13:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 100/20208]
 arch/arm/mach-imx/busfreq_optee.c:108:5: warning: no previous prototype for
 'update_freq_optee'
Message-ID: <202302061354.tNvMG5qJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cedric,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 25a47882d3abb5596bd4b1000a17731ebc23bb38 [100/20208] MLK-20023 Move Busfreq support to OPTEE OS
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302061354.tNvMG5qJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/25a47882d3abb5596bd4b1000a17731ebc23bb38
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 25a47882d3abb5596bd4b1000a17731ebc23bb38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/busfreq_optee.c:108:5: warning: no previous prototype for 'update_freq_optee' [-Wmissing-prototypes]
     108 | int update_freq_optee(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_optee.c:281:5: warning: no previous prototype for 'init_freq_optee' [-Wmissing-prototypes]
     281 | int init_freq_optee(struct platform_device *busfreq_pdev)
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
 > 281	int init_freq_optee(struct platform_device *busfreq_pdev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
