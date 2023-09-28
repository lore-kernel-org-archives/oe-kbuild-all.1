Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C948168CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695938074; x=1727474074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRMki/EjhC17Fq15BdzAZ/rvNHw4qCYb7FHdUBk6nTk=;
  b=FeRcNDhH1Bt583PAtR/Qj65U71hrN7LzwchOD5Wm1TFfj8IUwrT9jpg9
   U861TxtXpMhoRhggrwq9Pm2mLUTV2d67YmWzz4+RK+oF2QiXftuhJyYhl
   IKl8UkYJZyQwDTJ4341QuBnChgtOw7iwQ2PZRPBgGVG91i8wRu6r2WmPw
   gRQUZ3bOuzRcSVEI5tO6qcNHs4MttjHOyDVJfEO24V8biwY3SxQbP57S8
   NkM8BfdIpbfZ1BX/ysw+Pdgei0Aqu72UVWKJfk65jKh2F4Iz7/Vx5cGUj
   5UOikJGKw0jlq/RziQBvc+IhcFQgLmmftIs8aMvZlCrKgefhRLuFjDgEI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="372541536"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="372541536"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 14:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840068906"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="840068906"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 14:54:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlyxq-000212-0q;
	Thu, 28 Sep 2023 21:54:30 +0000
Date: Fri, 29 Sep 2023 05:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 28/30]
 arch/x86/kernel/cpu/microcode/core.c:477:13: warning: 'ucode_load_primary'
 defined but not used
Message-ID: <202309290512.e4I6p0GL-lkp@intel.com>
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
config: i386-randconfig-014-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290512.e4I6p0GL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290512.e4I6p0GL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290512.e4I6p0GL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_load_secondary':
   arch/x86/kernel/cpu/microcode/core.c:390:14: error: implicit declaration of function 'ucode_load_secondary_wait'; did you mean 'ucode_load_secondary'? [-Werror=implicit-function-declaration]
     390 |         if (!ucode_load_secondary_wait(ctrl_cpu)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              ucode_load_secondary
   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_load_primary':
   arch/x86/kernel/cpu/microcode/core.c:488:17: error: implicit declaration of function '__ucode_load_primary'; did you mean 'ucode_load_primary'? [-Werror=implicit-function-declaration]
     488 |                 __ucode_load_primary(cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 ucode_load_primary
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_update_handler':
   arch/x86/kernel/cpu/microcode/core.c:516:17: error: implicit declaration of function 'load_primary'; did you mean 'ucode_load_primary'? [-Werror=implicit-function-declaration]
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
>> arch/x86/kernel/cpu/microcode/core.c:477:13: warning: 'ucode_load_primary' defined but not used [-Wunused-function]
     477 | static void ucode_load_primary(unsigned int cpu)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/microcode/core.c:414:13: warning: '__load_primary' defined but not used [-Wunused-function]
     414 | static void __load_primary(unsigned int cpu)
         |             ^~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:385:21: warning: 'ucode_load_secondary' defined but not used [-Wunused-function]
     385 | static noinstr void ucode_load_secondary(unsigned int cpu)
         |                     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:358:21: warning: 'load_secondary_wait' defined but not used [-Wunused-function]
     358 | static noinstr bool load_secondary_wait(unsigned int ctrl_cpu)
         |                     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ucode_load_primary +477 arch/x86/kernel/cpu/microcode/core.c

   413	
 > 414	static void __load_primary(unsigned int cpu)
   415	{
   416		struct cpumask *secondaries = topology_sibling_cpumask(cpu);
   417		enum sibling_ctrl ctrl;
   418		enum ucode_state ret;
   419		unsigned int sibling;
   420	
   421		/* Initial rendezvouz to ensure that all CPUs have arrived */
   422		if (!wait_for_cpus(&late_cpus_in)) {
   423			this_cpu_write(ucode_ctrl.result, UCODE_TIMEOUT);
   424			pr_err_once("load: %d CPUs timed out\n", atomic_read(&late_cpus_in) - 1);
   425			return;
   426		}
   427	
   428		ret = microcode_ops->apply_microcode(cpu);
   429		this_cpu_write(ucode_ctrl.result, ret);
   430		this_cpu_write(ucode_ctrl.ctrl, SCTRL_DONE);
   431	
   432		/*
   433		 * If the update was successful, let the siblings run the apply()
   434		 * callback. If not, tell them it's done. This also covers the
   435		 * case where the CPU has uniform loading at package or system
   436		 * scope implemented but does not advertise it.
   437		 */
   438		if (ret == UCODE_UPDATED || ret == UCODE_OK)
   439			ctrl = SCTRL_APPLY;
   440		else
   441			ctrl = SCTRL_DONE;
   442	
   443		for_each_cpu(sibling, secondaries) {
   444			if (sibling != cpu)
   445				per_cpu(ucode_ctrl.ctrl, sibling) = ctrl;
   446		}
   447	}
   448	
   449	static bool ucode_kick_offline_cpus(unsigned int nr_offl)
   450	{
   451		unsigned int cpu, timeout;
   452	
   453		for_each_cpu(cpu, &cpu_offline_mask) {
   454			/* Enable the rendevouz handler and send NMI */
   455			per_cpu(ucode_ctrl.nmi_enabled, cpu) = true;
   456			apic_send_nmi_to_offline_cpu(cpu);
   457		}
   458	
   459		/* Wait for them to arrive */
   460		for (timeout = 0; timeout < (USEC_PER_SEC / 2); timeout++) {
   461			if (atomic_read(&offline_in_nmi) == nr_offl)
   462				return true;
   463			udelay(1);
   464		}
   465		/* Let the others time out */
   466		return false;
   467	}
   468	
   469	static void ucode_release_offline_cpus(void)
   470	{
   471		unsigned int cpu;
   472	
   473		for_each_cpu(cpu, &cpu_offline_mask)
   474			per_cpu(ucode_ctrl.ctrl, cpu) = SCTRL_DONE;
   475	}
   476	
 > 477	static void ucode_load_primary(unsigned int cpu)
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
   488			__ucode_load_primary(cpu);
   489	
   490		/* Unconditionally release soft-offlined SMT siblings if required */
   491		if (!cpu && nr_offl)
   492			ucode_release_offline_cpus();
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
