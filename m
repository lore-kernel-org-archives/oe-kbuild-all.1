Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB91B2116
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685213294; x=1716749294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjPE49ETysh/EVmVxOBw9YJmcWByjrH79YmZQWqzc1E=;
  b=ba9zUwHiNLY4gQ5/aySOMNU/o4ILxHEoUcIQRvr9/I5KCjT9Zcu1gdKz
   C1RmHQ0iUZOKXYcaXm6Hy2PYSiMmsbc6BUUh+M4ujqlcRzvQQ/2RyFyry
   QyOELoayd0uaJ9E0qfS6Tk81QltuWA4N3zL8s6gNUyfZz5FGCZNL1OQkK
   Uj3TT0BIsrXmSkGpY1OdMzpXOGTJcxWqec94ZMZ/itTkzzL00jcCJc8Zi
   jR4vgEJLqYC2PdPmmzkqmgemTI4vvFt27BoAIqBi3uVRrMGgSkexDHILO
   WxcZ//GAcIWTgNApm43rv8EUL2tZmBXJ5IFGWh/1YRVMRRNujWLanxp8U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="357680672"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="357680672"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 11:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="770644385"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="770644385"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 May 2023 11:48:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2yxY-000K90-16;
	Sat, 27 May 2023 18:48:12 +0000
Date: Sun, 28 May 2023 02:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4840/9879]
 arch/arm/mach-imx/busfreq_ddr3.c:379:5: warning: no previous prototype for
 function 'update_ddr_freq_imx6_up'
Message-ID: <202305280234.nstptqwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: fc7ba8739b847b6e0c7985170fc0483b168dcf71 [4840/9879] Merge branch 'clock/next' into next
config: arm-randconfig-r003-20230524 (https://download.01.org/0day-ci/archive/20230528/202305280234.nstptqwj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Freescale/linux-fslc/commit/fc7ba8739b847b6e0c7985170fc0483b168dcf71
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout fc7ba8739b847b6e0c7985170fc0483b168dcf71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280234.nstptqwj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/mach-imx/busfreq_ddr3.c:217:5: warning: no previous prototype for function 'can_change_ddr_freq' [-Wmissing-prototypes]
   int can_change_ddr_freq(void)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int can_change_ddr_freq(void)
   ^
   static 
   arch/arm/mach-imx/busfreq_ddr3.c:254:5: warning: no previous prototype for function 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
   int update_ddr_freq_imx_smp(int ddr_rate)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int update_ddr_freq_imx_smp(int ddr_rate)
   ^
   static 
>> arch/arm/mach-imx/busfreq_ddr3.c:379:5: warning: no previous prototype for function 'update_ddr_freq_imx6_up' [-Wmissing-prototypes]
   int update_ddr_freq_imx6_up(int ddr_rate)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:379:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int update_ddr_freq_imx6_up(int ddr_rate)
   ^
   static 
   arch/arm/mach-imx/busfreq_ddr3.c:424:5: warning: no previous prototype for function 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
   int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:424:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
   ^
   static 
>> arch/arm/mach-imx/busfreq_ddr3.c:496:5: warning: no previous prototype for function 'init_mmdc_ddr3_settings_imx6_up' [-Wmissing-prototypes]
   int init_mmdc_ddr3_settings_imx6_up(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_mmdc_ddr3_settings_imx6_up(struct platform_device *busfreq_pdev)
   ^
   static 
>> arch/arm/mach-imx/busfreq_ddr3.c:593:5: warning: no previous prototype for function 'init_mmdc_ddr3_settings_imx6_smp' [-Wmissing-prototypes]
   int init_mmdc_ddr3_settings_imx6_smp(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_mmdc_ddr3_settings_imx6_smp(struct platform_device *busfreq_pdev)
   ^
   static 
   6 warnings generated.
--
>> arch/arm/mach-imx/busfreq_lpddr2.c:124:5: warning: no previous prototype for function 'update_lpddr2_freq' [-Wmissing-prototypes]
   int update_lpddr2_freq(int ddr_rate)
       ^
   arch/arm/mach-imx/busfreq_lpddr2.c:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int update_lpddr2_freq(int ddr_rate)
   ^
   static 
>> arch/arm/mach-imx/busfreq_lpddr2.c:159:5: warning: no previous prototype for function 'init_mmdc_lpddr2_settings' [-Wmissing-prototypes]
   int init_mmdc_lpddr2_settings(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_lpddr2.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_mmdc_lpddr2_settings(struct platform_device *busfreq_pdev)
   ^
   static 
>> arch/arm/mach-imx/busfreq_lpddr2.c:185:5: warning: no previous prototype for function 'update_lpddr2_freq_smp' [-Wmissing-prototypes]
   int update_lpddr2_freq_smp(int ddr_rate)
       ^
   arch/arm/mach-imx/busfreq_lpddr2.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int update_lpddr2_freq_smp(int ddr_rate)
   ^
   static 
>> arch/arm/mach-imx/busfreq_lpddr2.c:283:5: warning: no previous prototype for function 'init_mmdc_lpddr2_settings_mx6q' [-Wmissing-prototypes]
   int init_mmdc_lpddr2_settings_mx6q(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_lpddr2.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_mmdc_lpddr2_settings_mx6q(struct platform_device *busfreq_pdev)
   ^
   static 
   4 warnings generated.


vim +/update_ddr_freq_imx6_up +379 arch/arm/mach-imx/busfreq_ddr3.c

e30da6831ebcd0 Anson Huang 2019-04-12  377  
39ef5453af9573 Anson Huang 2019-04-17  378  /* Used by i.MX6SX/i.MX6UL for updating the ddr frequency */
39ef5453af9573 Anson Huang 2019-04-17 @379  int update_ddr_freq_imx6_up(int ddr_rate)
39ef5453af9573 Anson Huang 2019-04-17  380  {
39ef5453af9573 Anson Huang 2019-04-17  381  	int i;
39ef5453af9573 Anson Huang 2019-04-17  382  	bool dll_off = false;
39ef5453af9573 Anson Huang 2019-04-17  383  	unsigned long ttbr1;
39ef5453af9573 Anson Huang 2019-04-17  384  	int mode = get_bus_freq_mode();
39ef5453af9573 Anson Huang 2019-04-17  385  
39ef5453af9573 Anson Huang 2019-04-17  386  	if (ddr_rate == curr_ddr_rate)
39ef5453af9573 Anson Huang 2019-04-17  387  		return 0;
39ef5453af9573 Anson Huang 2019-04-17  388  
39ef5453af9573 Anson Huang 2019-04-17  389  	printk(KERN_DEBUG "\nBus freq set to %d start...\n", ddr_rate);
39ef5453af9573 Anson Huang 2019-04-17  390  
39ef5453af9573 Anson Huang 2019-04-17  391  	if ((mode == BUS_FREQ_LOW) || (mode == BUS_FREQ_AUDIO))
39ef5453af9573 Anson Huang 2019-04-17  392  		dll_off = true;
39ef5453af9573 Anson Huang 2019-04-17  393  
39ef5453af9573 Anson Huang 2019-04-17  394  	imx6_busfreq_info->dll_off = dll_off;
39ef5453af9573 Anson Huang 2019-04-17  395  	iram_ddr_settings[0][0] = ddr_settings_size;
39ef5453af9573 Anson Huang 2019-04-17  396  	iram_iomux_settings[0][0] = iomux_settings_size;
39ef5453af9573 Anson Huang 2019-04-17  397  	for (i = 0; i < iram_ddr_settings[0][0]; i++) {
39ef5453af9573 Anson Huang 2019-04-17  398  		iram_ddr_settings[i + 1][0] =
39ef5453af9573 Anson Huang 2019-04-17  399  				normal_mmdc_settings[i][0];
39ef5453af9573 Anson Huang 2019-04-17  400  		iram_ddr_settings[i + 1][1] =
39ef5453af9573 Anson Huang 2019-04-17  401  				normal_mmdc_settings[i][1];
39ef5453af9573 Anson Huang 2019-04-17  402  	}
39ef5453af9573 Anson Huang 2019-04-17  403  
39ef5453af9573 Anson Huang 2019-04-17  404  	local_irq_disable();
39ef5453af9573 Anson Huang 2019-04-17  405  
39ef5453af9573 Anson Huang 2019-04-17  406  	ttbr1 = save_ttbr1();
39ef5453af9573 Anson Huang 2019-04-17  407  	imx6_busfreq_info->freq = ddr_rate;
39ef5453af9573 Anson Huang 2019-04-17  408  	imx6_busfreq_info->ddr_settings = iram_ddr_settings;
39ef5453af9573 Anson Huang 2019-04-17  409  	imx6_busfreq_info->iomux_offsets = iram_iomux_settings;
39ef5453af9573 Anson Huang 2019-04-17  410  	imx6_busfreq_info->mu_delay_val  = ((readl_relaxed(mmdc_base + MMDC0_MPMUR0)
39ef5453af9573 Anson Huang 2019-04-17  411  		>> MMDC0_MPMUR0_OFFSET) & MMDC0_MPMUR0_MASK);
39ef5453af9573 Anson Huang 2019-04-17  412  
39ef5453af9573 Anson Huang 2019-04-17  413  	imx6_up_change_ddr_freq(imx6_busfreq_info);
39ef5453af9573 Anson Huang 2019-04-17  414  	restore_ttbr1(ttbr1);
39ef5453af9573 Anson Huang 2019-04-17  415  	curr_ddr_rate = ddr_rate;
39ef5453af9573 Anson Huang 2019-04-17  416  
39ef5453af9573 Anson Huang 2019-04-17  417  	local_irq_enable();
39ef5453af9573 Anson Huang 2019-04-17  418  
39ef5453af9573 Anson Huang 2019-04-17  419  	printk(KERN_DEBUG "Bus freq set to %d done!\n", ddr_rate);
39ef5453af9573 Anson Huang 2019-04-17  420  
39ef5453af9573 Anson Huang 2019-04-17  421  	return 0;
39ef5453af9573 Anson Huang 2019-04-17  422  }
39ef5453af9573 Anson Huang 2019-04-17  423  
e30da6831ebcd0 Anson Huang 2019-04-12  424  int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
e30da6831ebcd0 Anson Huang 2019-04-12  425  {
e30da6831ebcd0 Anson Huang 2019-04-12  426  	int ddr_type = imx_ddrc_get_ddr_type();
e30da6831ebcd0 Anson Huang 2019-04-12  427  #ifdef CONFIG_SMP
e30da6831ebcd0 Anson Huang 2019-04-12  428  	struct device_node *node;
e30da6831ebcd0 Anson Huang 2019-04-12  429  	u32 cpu;
e30da6831ebcd0 Anson Huang 2019-04-12  430  	struct device *dev = &busfreq_pdev->dev;
e30da6831ebcd0 Anson Huang 2019-04-12  431  	int err;
e30da6831ebcd0 Anson Huang 2019-04-12  432  	struct irq_data *d;
e30da6831ebcd0 Anson Huang 2019-04-12  433  
e30da6831ebcd0 Anson Huang 2019-04-12  434  	node = of_find_compatible_node(NULL, NULL, "arm,cortex-a7-gic");
e30da6831ebcd0 Anson Huang 2019-04-12  435  	if (!node) {
e30da6831ebcd0 Anson Huang 2019-04-12  436  		printk(KERN_ERR "failed to find imx7d-a7-gic device tree data!\n");
e30da6831ebcd0 Anson Huang 2019-04-12  437  		return -EINVAL;
e30da6831ebcd0 Anson Huang 2019-04-12  438  	}
e30da6831ebcd0 Anson Huang 2019-04-12  439  	gic_dist_base = of_iomap(node, 0);
e30da6831ebcd0 Anson Huang 2019-04-12  440  	WARN(!gic_dist_base, "unable to map gic dist registers\n");
e30da6831ebcd0 Anson Huang 2019-04-12  441  
e30da6831ebcd0 Anson Huang 2019-04-12  442  	irqs_used = devm_kzalloc(dev, sizeof(u32) * num_present_cpus(),
e30da6831ebcd0 Anson Huang 2019-04-12  443  					GFP_KERNEL);
e30da6831ebcd0 Anson Huang 2019-04-12  444  	for_each_online_cpu(cpu) {
e30da6831ebcd0 Anson Huang 2019-04-12  445  		int irq;
e30da6831ebcd0 Anson Huang 2019-04-12  446  		/*
e30da6831ebcd0 Anson Huang 2019-04-12  447  		 * set up a reserved interrupt to get all
e30da6831ebcd0 Anson Huang 2019-04-12  448  		 * the active cores into a WFE state
e30da6831ebcd0 Anson Huang 2019-04-12  449  		 * before changing the DDR frequency.
e30da6831ebcd0 Anson Huang 2019-04-12  450  		 */
e30da6831ebcd0 Anson Huang 2019-04-12  451  		irq = platform_get_irq(busfreq_pdev, cpu);
e30da6831ebcd0 Anson Huang 2019-04-12  452  		err = request_irq(irq, wait_in_wfe_irq,
e30da6831ebcd0 Anson Huang 2019-04-12  453  			IRQF_PERCPU, "ddrc", NULL);
e30da6831ebcd0 Anson Huang 2019-04-12  454  		if (err) {
e30da6831ebcd0 Anson Huang 2019-04-12  455  			dev_err(dev,
e30da6831ebcd0 Anson Huang 2019-04-12  456  				"Busfreq:request_irq failed %d, err = %d\n",
e30da6831ebcd0 Anson Huang 2019-04-12  457  				irq, err);
e30da6831ebcd0 Anson Huang 2019-04-12  458  			return err;
e30da6831ebcd0 Anson Huang 2019-04-12  459  		}
e30da6831ebcd0 Anson Huang 2019-04-12  460  		err = irq_set_affinity(irq, cpumask_of(cpu));
e30da6831ebcd0 Anson Huang 2019-04-12  461  		if (err) {
e30da6831ebcd0 Anson Huang 2019-04-12  462  			dev_err(dev,
e30da6831ebcd0 Anson Huang 2019-04-12  463  				"Busfreq: Cannot set irq affinity irq=%d\n",
e30da6831ebcd0 Anson Huang 2019-04-12  464  				irq);
e30da6831ebcd0 Anson Huang 2019-04-12  465  			return err;
e30da6831ebcd0 Anson Huang 2019-04-12  466  		}
e30da6831ebcd0 Anson Huang 2019-04-12  467  		d = irq_get_irq_data(irq);
e30da6831ebcd0 Anson Huang 2019-04-12  468  		irqs_used[cpu] = d->hwirq + 32;
e30da6831ebcd0 Anson Huang 2019-04-12  469  	}
e30da6831ebcd0 Anson Huang 2019-04-12  470  
e30da6831ebcd0 Anson Huang 2019-04-12  471  	/* Store the variable used to communicate between cores */
e30da6831ebcd0 Anson Huang 2019-04-12  472  	wait_for_ddr_freq_update = (u32 *)ddr_freq_change_iram_base;
e30da6831ebcd0 Anson Huang 2019-04-12  473  	imx7_wfe_change_ddr_freq = (void *)fncpy(
e30da6831ebcd0 Anson Huang 2019-04-12  474  		(void *)ddr_freq_change_iram_base + 0x8,
e30da6831ebcd0 Anson Huang 2019-04-12  475  		&imx7_smp_wfe, SMP_WFE_CODE_SIZE - 0x8);
e30da6831ebcd0 Anson Huang 2019-04-12  476  #endif
e30da6831ebcd0 Anson Huang 2019-04-12  477  	if (ddr_type == IMX_DDR_TYPE_DDR3)
e30da6831ebcd0 Anson Huang 2019-04-12  478  		imx7d_change_ddr_freq = (void *)fncpy(
e30da6831ebcd0 Anson Huang 2019-04-12  479  			(void *)ddr_freq_change_iram_base + SMP_WFE_CODE_SIZE,
e30da6831ebcd0 Anson Huang 2019-04-12  480  			&imx7d_ddr3_freq_change,
e30da6831ebcd0 Anson Huang 2019-04-12  481  			MX7_BUSFREQ_OCRAM_SIZE - SMP_WFE_CODE_SIZE);
e30da6831ebcd0 Anson Huang 2019-04-12  482  	else if (ddr_type == IMX_DDR_TYPE_LPDDR3
e30da6831ebcd0 Anson Huang 2019-04-12  483  		|| ddr_type == IMX_DDR_TYPE_LPDDR2)
e30da6831ebcd0 Anson Huang 2019-04-12  484  		imx7d_change_ddr_freq = (void *)fncpy(
e30da6831ebcd0 Anson Huang 2019-04-12  485  			(void *)ddr_freq_change_iram_base +
e30da6831ebcd0 Anson Huang 2019-04-12  486  			SMP_WFE_CODE_SIZE,
e30da6831ebcd0 Anson Huang 2019-04-12  487  			&imx_lpddr3_freq_change,
e30da6831ebcd0 Anson Huang 2019-04-12  488  			MX7_BUSFREQ_OCRAM_SIZE - SMP_WFE_CODE_SIZE);
e30da6831ebcd0 Anson Huang 2019-04-12  489  
e30da6831ebcd0 Anson Huang 2019-04-12  490  	curr_ddr_rate = ddr_normal_rate;
e30da6831ebcd0 Anson Huang 2019-04-12  491  
e30da6831ebcd0 Anson Huang 2019-04-12  492  	return 0;
e30da6831ebcd0 Anson Huang 2019-04-12  493  }
39ef5453af9573 Anson Huang 2019-04-17  494  
39ef5453af9573 Anson Huang 2019-04-17  495  /* Used by i.MX6SX/i.MX6UL for mmdc setting init. */
39ef5453af9573 Anson Huang 2019-04-17 @496  int init_mmdc_ddr3_settings_imx6_up(struct platform_device *busfreq_pdev)
39ef5453af9573 Anson Huang 2019-04-17  497  {
39ef5453af9573 Anson Huang 2019-04-17  498  	int i;
39ef5453af9573 Anson Huang 2019-04-17  499  	struct device_node *node;
39ef5453af9573 Anson Huang 2019-04-17  500  	unsigned long ddr_code_size;
39ef5453af9573 Anson Huang 2019-04-17  501  
39ef5453af9573 Anson Huang 2019-04-17  502  	node = of_find_compatible_node(NULL, NULL, "fsl,imx6q-mmdc");
39ef5453af9573 Anson Huang 2019-04-17  503  	if (!node) {
39ef5453af9573 Anson Huang 2019-04-17  504  		printk(KERN_ERR "failed to find mmdc device tree data!\n");
39ef5453af9573 Anson Huang 2019-04-17  505  		return -EINVAL;
39ef5453af9573 Anson Huang 2019-04-17  506  	}
39ef5453af9573 Anson Huang 2019-04-17  507  	mmdc_base = of_iomap(node, 0);
39ef5453af9573 Anson Huang 2019-04-17  508  	WARN(!mmdc_base, "unable to map mmdc registers\n");
39ef5453af9573 Anson Huang 2019-04-17  509  
39ef5453af9573 Anson Huang 2019-04-17  510  	if (cpu_is_imx6sx())
39ef5453af9573 Anson Huang 2019-04-17  511  		node = of_find_compatible_node(NULL, NULL, "fsl,imx6sx-iomuxc");
e9ad716e2d9921 Jacky Bai   2019-04-29  512  	else
e9ad716e2d9921 Jacky Bai   2019-04-29  513  		node = of_find_compatible_node(NULL, NULL, "fsl,imx6ul-iomuxc");
39ef5453af9573 Anson Huang 2019-04-17  514  	if (!node) {
39ef5453af9573 Anson Huang 2019-04-17  515  		printk(KERN_ERR "failed to find iomuxc device tree data!\n");
39ef5453af9573 Anson Huang 2019-04-17  516  		return -EINVAL;
39ef5453af9573 Anson Huang 2019-04-17  517  	}
39ef5453af9573 Anson Huang 2019-04-17  518  	iomux_base = of_iomap(node, 0);
39ef5453af9573 Anson Huang 2019-04-17  519  	WARN(!iomux_base, "unable to map iomux registers\n");
39ef5453af9573 Anson Huang 2019-04-17  520  
39ef5453af9573 Anson Huang 2019-04-17  521  	ddr_settings_size = ARRAY_SIZE(ddr3_dll_mx6sx) +
39ef5453af9573 Anson Huang 2019-04-17  522  		ARRAY_SIZE(ddr3_calibration_mx6sx);
39ef5453af9573 Anson Huang 2019-04-17  523  
39ef5453af9573 Anson Huang 2019-04-17  524  	normal_mmdc_settings = kmalloc((ddr_settings_size * 8), GFP_KERNEL);
39ef5453af9573 Anson Huang 2019-04-17  525  	memcpy(normal_mmdc_settings, ddr3_dll_mx6sx,
39ef5453af9573 Anson Huang 2019-04-17  526  		sizeof(ddr3_dll_mx6sx));
39ef5453af9573 Anson Huang 2019-04-17  527  	memcpy(((char *)normal_mmdc_settings + sizeof(ddr3_dll_mx6sx)),
39ef5453af9573 Anson Huang 2019-04-17  528  		ddr3_calibration_mx6sx, sizeof(ddr3_calibration_mx6sx));
39ef5453af9573 Anson Huang 2019-04-17  529  
39ef5453af9573 Anson Huang 2019-04-17  530  	/* store the original DDR settings at boot. */
39ef5453af9573 Anson Huang 2019-04-17  531  	for (i = 0; i < ddr_settings_size; i++) {
39ef5453af9573 Anson Huang 2019-04-17  532  		/*
39ef5453af9573 Anson Huang 2019-04-17  533  		 * writes via command mode register cannot be read back.
39ef5453af9573 Anson Huang 2019-04-17  534  		 * hence hardcode them in the initial static array.
39ef5453af9573 Anson Huang 2019-04-17  535  		 * this may require modification on a per customer basis.
39ef5453af9573 Anson Huang 2019-04-17  536  		 */
39ef5453af9573 Anson Huang 2019-04-17  537  		if (normal_mmdc_settings[i][0] != 0x1C)
39ef5453af9573 Anson Huang 2019-04-17  538  			normal_mmdc_settings[i][1] =
39ef5453af9573 Anson Huang 2019-04-17  539  				readl_relaxed(mmdc_base
39ef5453af9573 Anson Huang 2019-04-17  540  				+ normal_mmdc_settings[i][0]);
39ef5453af9573 Anson Huang 2019-04-17  541  	}
39ef5453af9573 Anson Huang 2019-04-17  542  
d6d4f7fbce7a4e Jacky Bai   2019-11-27  543  	if (cpu_is_imx6ul() || cpu_is_imx6ull() || cpu_is_imx6ulz())
e9ad716e2d9921 Jacky Bai   2019-04-29  544  		iomux_settings_size = ARRAY_SIZE(iomux_offsets_mx6ul);
e9ad716e2d9921 Jacky Bai   2019-04-29  545  	else
39ef5453af9573 Anson Huang 2019-04-17  546  		iomux_settings_size = ARRAY_SIZE(iomux_offsets_mx6sx);
39ef5453af9573 Anson Huang 2019-04-17  547  
39ef5453af9573 Anson Huang 2019-04-17  548  	ddr_code_size = (&imx6_up_ddr3_freq_change_end -&imx6_up_ddr3_freq_change_start) *4 +
39ef5453af9573 Anson Huang 2019-04-17  549  			sizeof(*imx6_busfreq_info);
39ef5453af9573 Anson Huang 2019-04-17  550  	imx6_busfreq_info = (struct imx6_busfreq_info *)ddr_freq_change_iram_base;
39ef5453af9573 Anson Huang 2019-04-17  551  
39ef5453af9573 Anson Huang 2019-04-17  552  	imx6_up_change_ddr_freq = (void *)fncpy((void *)ddr_freq_change_iram_base + sizeof(*imx6_busfreq_info),
39ef5453af9573 Anson Huang 2019-04-17  553  		&imx6_up_ddr3_freq_change, ddr_code_size - sizeof(*imx6_busfreq_info));
39ef5453af9573 Anson Huang 2019-04-17  554  
39ef5453af9573 Anson Huang 2019-04-17  555  	/*
39ef5453af9573 Anson Huang 2019-04-17  556  	 * Store the size of the array in iRAM also,
39ef5453af9573 Anson Huang 2019-04-17  557  	 * increase the size by 8 bytes.
39ef5453af9573 Anson Huang 2019-04-17  558  	 */
39ef5453af9573 Anson Huang 2019-04-17  559  	iram_iomux_settings = (void *)(ddr_freq_change_iram_base + ddr_code_size);
39ef5453af9573 Anson Huang 2019-04-17  560  	iram_ddr_settings = iram_iomux_settings + (iomux_settings_size * 8) + 8;
39ef5453af9573 Anson Huang 2019-04-17  561  
39ef5453af9573 Anson Huang 2019-04-17  562  	if ((ddr_code_size + (iomux_settings_size + ddr_settings_size) * 8 + 16)
39ef5453af9573 Anson Huang 2019-04-17  563  		> ddr_freq_change_total_size) {
39ef5453af9573 Anson Huang 2019-04-17  564  		printk(KERN_ERR "Not enough memory allocated for DDR Frequency change code.\n");
39ef5453af9573 Anson Huang 2019-04-17  565  		return EINVAL;
39ef5453af9573 Anson Huang 2019-04-17  566  	}
39ef5453af9573 Anson Huang 2019-04-17  567  
39ef5453af9573 Anson Huang 2019-04-17  568  	for (i = 0; i < iomux_settings_size; i++) {
d6d4f7fbce7a4e Jacky Bai   2019-11-27  569  		if (cpu_is_imx6ul() || cpu_is_imx6ull() || cpu_is_imx6ulz()) {
e9ad716e2d9921 Jacky Bai   2019-04-29  570  			iomux_offsets_mx6ul[i][1] =
e9ad716e2d9921 Jacky Bai   2019-04-29  571  			readl_relaxed(iomux_base +
e9ad716e2d9921 Jacky Bai   2019-04-29  572  				iomux_offsets_mx6ul[i][0]);
e9ad716e2d9921 Jacky Bai   2019-04-29  573  			iram_iomux_settings[i + 1][0] =
e9ad716e2d9921 Jacky Bai   2019-04-29  574  				iomux_offsets_mx6ul[i][0];
e9ad716e2d9921 Jacky Bai   2019-04-29  575  			iram_iomux_settings[i + 1][1] =
e9ad716e2d9921 Jacky Bai   2019-04-29  576  				iomux_offsets_mx6ul[i][1];
e9ad716e2d9921 Jacky Bai   2019-04-29  577  		} else {
39ef5453af9573 Anson Huang 2019-04-17  578  			iomux_offsets_mx6sx[i][1] =
39ef5453af9573 Anson Huang 2019-04-17  579  				readl_relaxed(iomux_base +
39ef5453af9573 Anson Huang 2019-04-17  580  				iomux_offsets_mx6sx[i][0]);
39ef5453af9573 Anson Huang 2019-04-17  581  			iram_iomux_settings[i + 1][0] =
39ef5453af9573 Anson Huang 2019-04-17  582  				iomux_offsets_mx6sx[i][0];
39ef5453af9573 Anson Huang 2019-04-17  583  			iram_iomux_settings[i + 1][1] =
39ef5453af9573 Anson Huang 2019-04-17  584  				iomux_offsets_mx6sx[i][1];
39ef5453af9573 Anson Huang 2019-04-17  585  		}
e9ad716e2d9921 Jacky Bai   2019-04-29  586  	}
39ef5453af9573 Anson Huang 2019-04-17  587  
39ef5453af9573 Anson Huang 2019-04-17  588  	curr_ddr_rate = ddr_normal_rate;
39ef5453af9573 Anson Huang 2019-04-17  589  
39ef5453af9573 Anson Huang 2019-04-17  590  	return 0;
39ef5453af9573 Anson Huang 2019-04-17  591  }
eeeb8edadc088a Anson Huang 2019-04-17  592  

:::::: The code at line 379 was first introduced by commit
:::::: 39ef5453af95730f3286e9f13e0a1ec7ac18d60c ARM: imx: add i.MX6SX bus-freq support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
