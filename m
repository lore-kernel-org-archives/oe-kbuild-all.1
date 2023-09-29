Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47215538B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 03:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695958091; x=1727494091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7VKKT4QWBndg42CBS1j7I74BbomXaBtWo2F6vNzwwM=;
  b=RGvHYC1nPKFyFSKx0ZvsJ3s4NosoZ+UxQR/2R895ouLeQjQ0d9zXpX1p
   5Yxda7hZh321KgOaiGXHpxVPqACg1oUNHTLHB5BAE2TPIoVY4QGG8K8qB
   x2q3zavGvnurythamKACNpv+/LH035Ned50iurhjA7g13i73yu+UiAtWj
   VjMUJekf4dQwBfLpM/GNY3I30GAITn43IdWA1pXfNOJOmYOqbpDRGTL2q
   IHzFzd0vM03uadWxEJA9OQyKUbieIxr20GbCqG/7eji9Gnw5QoEyI7v2i
   DVBupZwNAPVWfKeDyCpkOXIp9zyawkXkhENdQqXo+TKUt+6gFcyTnn0iX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="362473857"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="362473857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 20:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779154825"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="779154825"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 20:28:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm4Ag-0002Qf-14;
	Fri, 29 Sep 2023 03:28:06 +0000
Date: Fri, 29 Sep 2023 11:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 26/30]
 arch/x86/kernel/cpu/microcode/core.c:389:14: error: implicit declaration of
 function 'ucode_load_secondary_wait'; did you mean 'ucode_load_secondary'?
Message-ID: <202309291112.79f6yX0H-lkp@intel.com>
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
commit: 798516f5cbaf888e972679feab8f19653603d44a [26/30] x86/microcode: Protect against instrumentation
config: i386-randconfig-014-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291112.79f6yX0H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291112.79f6yX0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291112.79f6yX0H-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_load_secondary':
>> arch/x86/kernel/cpu/microcode/core.c:389:14: error: implicit declaration of function 'ucode_load_secondary_wait'; did you mean 'ucode_load_secondary'? [-Werror=implicit-function-declaration]
     389 |         if (!ucode_load_secondary_wait(ctrl_cpu)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              ucode_load_secondary
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_update_handler':
>> arch/x86/kernel/cpu/microcode/core.c:457:17: error: implicit declaration of function 'load_secondary'; did you mean 'load_secondary_wait'? [-Werror=implicit-function-declaration]
     457 |                 load_secondary(cpu);
         |                 ^~~~~~~~~~~~~~
         |                 load_secondary_wait
   arch/x86/kernel/cpu/microcode/core.c: In function 'load_late_stop_cpus':
   arch/x86/kernel/cpu/microcode/core.c:521:33: error: 'load_cpus_stopped' undeclared (first use in this function); did you mean 'ucode_load_cpus_stopped'?
     521 |         stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 ucode_load_cpus_stopped
   arch/x86/kernel/cpu/microcode/core.c:521:33: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/cpu/microcode/core.c: At top level:
   arch/x86/kernel/cpu/microcode/core.c:487:12: warning: 'ucode_load_cpus_stopped' defined but not used [-Wunused-function]
     487 | static int ucode_load_cpus_stopped(void *unused)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:384:21: warning: 'ucode_load_secondary' defined but not used [-Wunused-function]
     384 | static noinstr void ucode_load_secondary(unsigned int cpu)
         |                     ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c:357:21: warning: 'load_secondary_wait' defined but not used [-Wunused-function]
     357 | static noinstr bool load_secondary_wait(unsigned int ctrl_cpu)
         |                     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +389 arch/x86/kernel/cpu/microcode/core.c

   379	
   380	/*
   381	 * Protected against instrumentation up to the point where the primary
   382	 * thread completed the update. See microcode_nmi_handler() for details.
   383	 */
   384	static noinstr void ucode_load_secondary(unsigned int cpu)
   385	{
   386		unsigned int ctrl_cpu = raw_cpu_read(ucode_ctrl.ctrl_cpu);
   387		enum ucode_state ret;
   388	
 > 389		if (!ucode_load_secondary_wait(ctrl_cpu)) {
   390			instrumentation_begin();
   391			pr_err_once("Microcode load: %d CPUs timed out\n",
   392				    atomic_read(&late_cpus_in) - 1);
   393			instrumentation_end();
   394			return;
   395		}
   396	
   397		/* Primary thread completed. Allow to invoke instrumentable code */
   398		instrumentation_begin();
   399		/*
   400		 * If the primary succeeded then invoke the apply() callback,
   401		 * otherwise copy the state from the primary thread.
   402		 */
   403		if (this_cpu_read(ucode_ctrl.ctrl) == SCTRL_APPLY)
   404			ret = microcode_ops->apply_microcode(cpu);
   405		else
   406			ret = per_cpu(ucode_ctrl.result, ctrl_cpu);
   407	
   408		this_cpu_write(ucode_ctrl.result, ret);
   409		this_cpu_write(ucode_ctrl.ctrl, SCTRL_DONE);
   410		instrumentation_end();
   411	}
   412	
   413	static void load_primary(unsigned int cpu)
   414	{
   415		struct cpumask *secondaries = topology_sibling_cpumask(cpu);
   416		enum sibling_ctrl ctrl;
   417		enum ucode_state ret;
   418		unsigned int sibling;
   419	
   420		/* Initial rendezvouz to ensure that all CPUs have arrived */
   421		if (!wait_for_cpus(&late_cpus_in)) {
   422			this_cpu_write(ucode_ctrl.result, UCODE_TIMEOUT);
   423			pr_err_once("load: %d CPUs timed out\n", atomic_read(&late_cpus_in) - 1);
   424			return;
   425		}
   426	
   427		ret = microcode_ops->apply_microcode(cpu);
   428		this_cpu_write(ucode_ctrl.result, ret);
   429		this_cpu_write(ucode_ctrl.ctrl, SCTRL_DONE);
   430	
   431		/*
   432		 * If the update was successful, let the siblings run the apply()
   433		 * callback. If not, tell them it's done. This also covers the
   434		 * case where the CPU has uniform loading at package or system
   435		 * scope implemented but does not advertise it.
   436		 */
   437		if (ret == UCODE_UPDATED || ret == UCODE_OK)
   438			ctrl = SCTRL_APPLY;
   439		else
   440			ctrl = SCTRL_DONE;
   441	
   442		for_each_cpu(sibling, secondaries) {
   443			if (sibling != cpu)
   444				per_cpu(ucode_ctrl.ctrl, sibling) = ctrl;
   445		}
   446	}
   447	
   448	static noinstr bool microcode_update_handler(void)
   449	{
   450		unsigned int cpu = raw_smp_processor_id();
   451	
   452		if (raw_cpu_read(ucode_ctrl.ctrl_cpu) == cpu) {
   453			instrumentation_begin();
   454			load_primary(cpu);
   455			instrumentation_end();
   456		} else {
 > 457			load_secondary(cpu);
   458		}
   459	
   460		instrumentation_begin();
   461		touch_nmi_watchdog();
   462		instrumentation_end();
   463		return true;
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
