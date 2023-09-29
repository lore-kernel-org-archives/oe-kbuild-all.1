Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C40CA41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695975804; x=1727511804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3SipwT639Y8mY/jFQS3cpM5duxGIySOgthVb4aBlBM=;
  b=JWYiD+2aQxjEjxVgqM1lwxtDu2EIgb+3UMAF9pVNNOKUBgkUxdE048mm
   2XOFuTKg3nfEktdeRHlKnj5yvc93e0YLpetS8M8BAEDxnANLKjc/dbpjp
   hGgWe7BS8zvhRAMlEEHOrtm3aJCVCuNqYSwNgBYoBDTpdv3JnujjtlnIH
   2Hv9zLMkZeiUVILgVqARSkUukdxVzpTqjeDIEusEf3jZ1ay9RXWw3L2Ez
   urPwTnE+21HIJTFVSfGRjDyGnoSYwGXz4BcRKIAzW3HDHEi5cZiPLp8hP
   vrMWXCSLluz8n3lkHbRdFwiFMVYdt3G+WhGRurB8Pio7zL1O2JEx6mgYS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468531630"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="468531630"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 00:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923533641"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="923533641"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2023 00:51:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm8Hg-0002b3-26;
	Fri, 29 Sep 2023 07:51:36 +0000
Date: Fri, 29 Sep 2023 15:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 28/30]
 arch/x86/kernel/cpu/microcode/core.c:488:17: error: implicit declaration of
 function '__ucode_load_primary'; did you mean 'ucode_load_primary'?
Message-ID: <202309291523.HYDiX8pC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   0168d5c24d9566114647bf6377e65c52c2325e3c
commit: 66cf86b60b5de0045433ed664dbe887486285b76 [28/30] x86/microcode: Handle "offline" CPUs correctly
config: i386-randconfig-014-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291523.HYDiX8pC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291523.HYDiX8pC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291523.HYDiX8pC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_load_secondary':
   arch/x86/kernel/cpu/microcode/core.c:390:14: error: implicit declaration of function 'ucode_load_secondary_wait'; did you mean 'ucode_load_secondary'? [-Werror=implicit-function-declaration]
     390 |         if (!ucode_load_secondary_wait(ctrl_cpu)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              ucode_load_secondary
   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_load_primary':
>> arch/x86/kernel/cpu/microcode/core.c:488:17: error: implicit declaration of function '__ucode_load_primary'; did you mean 'ucode_load_primary'? [-Werror=implicit-function-declaration]
     488 |                 __ucode_load_primary(cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 ucode_load_primary
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_update_handler':
>> arch/x86/kernel/cpu/microcode/core.c:516:17: error: implicit declaration of function 'load_primary'; did you mean 'ucode_load_primary'? [-Werror=implicit-function-declaration]
     516 |                 load_primary(cpu);
         |                 ^~~~~~~~~~~~
         |                 ucode_load_primary
   arch/x86/kernel/cpu/microcode/core.c:519:17: error: implicit declaration of function 'load_secondary'; did you mean 'load_secondary_wait'? [-Werror=implicit-function-declaration]
     519 |                 load_secondary(cpu);
         |                 ^~~~~~~~~~~~~~
         |                 load_secondary_wait
   arch/x86/kernel/cpu/microcode/core.c: In function 'load_late_stop_cpus':
   arch/x86/kernel/cpu/microcode/core.c:585:33: error: 'load_cpus_stopped' undeclared (first use in this function); did you mean 'ucode_load_cpus_stopped'?
     585 |         stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 ucode_load_cpus_stopped
   arch/x86/kernel/cpu/microcode/core.c:585:33: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/cpu/microcode/core.c: At top level:
   arch/x86/kernel/cpu/microcode/core.c:549:12: warning: 'ucode_load_cpus_stopped' defined but not used [-Wunused-function]
     549 | static int ucode_load_cpus_stopped(void *unused)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:477:13: warning: 'ucode_load_primary' defined but not used [-Wunused-function]
     477 | static void ucode_load_primary(unsigned int cpu)
         |             ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:414:13: warning: '__load_primary' defined but not used [-Wunused-function]
     414 | static void __load_primary(unsigned int cpu)
         |             ^~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:385:21: warning: 'ucode_load_secondary' defined but not used [-Wunused-function]
     385 | static noinstr void ucode_load_secondary(unsigned int cpu)
         |                     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:358:21: warning: 'load_secondary_wait' defined but not used [-Wunused-function]
     358 | static noinstr bool load_secondary_wait(unsigned int ctrl_cpu)
         |                     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +488 arch/x86/kernel/cpu/microcode/core.c

   476	
   477	static void ucode_load_primary(unsigned int cpu)
   478	{
   479		unsigned int nr_offl = cpumask_weight(&cpu_offline_mask);
   480		bool proceed = true;
   481	
   482		/* Kick soft-offlined SMT siblings if required */
   483		if (!cpu && nr_offl)
   484			proceed = ucode_kick_offline_cpus(nr_offl);
   485	
   486		/* If the soft-offlined CPUs did not respond, abort */
   487		if (proceed)
 > 488			__ucode_load_primary(cpu);
   489	
   490		/* Unconditionally release soft-offlined SMT siblings if required */
   491		if (!cpu && nr_offl)
   492			ucode_release_offline_cpus();
   493	}
   494	
   495	/*
   496	 * Minimal stub rendevouz handler for soft-offlined CPUs which participate
   497	 * in the NMI rendevouz to protect against a concurrent NMI on affected
   498	 * CPUs.
   499	 */
   500	void noinstr microcode_offline_nmi_handler(void)
   501	{
   502		if (!raw_cpu_read(ucode_ctrl.nmi_enabled))
   503			return;
   504		raw_cpu_write(ucode_ctrl.nmi_enabled, false);
   505		raw_cpu_write(ucode_ctrl.result, UCODE_OFFLINE);
   506		raw_atomic_inc(&offline_in_nmi);
   507		wait_for_ctrl();
   508	}
   509	
   510	static noinstr bool microcode_update_handler(void)
   511	{
   512		unsigned int cpu = raw_smp_processor_id();
   513	
   514		if (raw_cpu_read(ucode_ctrl.ctrl_cpu) == cpu) {
   515			instrumentation_begin();
 > 516			load_primary(cpu);
   517			instrumentation_end();
   518		} else {
   519			load_secondary(cpu);
   520		}
   521	
   522		instrumentation_begin();
   523		touch_nmi_watchdog();
   524		instrumentation_end();
   525		return true;
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
