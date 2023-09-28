Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132E8839
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695935493; x=1727471493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fT9hmAFaR7J5WOa+Ay90bhREOoqwzRKxqclNQp3btkI=;
  b=QCD7tm6jqRXqzXp4NtNJ/Rk05Ly0CJ0RuqLBZljrF0xOBMyfuV2lHfY+
   iF2Ds5zzlGGkCFNBEIARP8EJaggJu/FwBQ/h35CTkMO6xFlD6pVxO/r6s
   0bF1VMbcVq90t1lx+TijkDn8j0OzSDUlhkqqcV9GEfmMT/hY3rgJ2M24I
   t8dhevwIols8B+ysMuIrQFXkJvUgSA74rmOdjPszGXxg1gdlbUTcdacLq
   OpkTINdrl44D+tH6L6Bkc4FMcY0jyJwCTa5oxQvPmrBazIJ91vnmC65bO
   +RlYY8qCeBD8rpA97q76pClHAGfBuw3aJAGvPyYQCfo9qzBTVOAGua1Cn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446338033"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="446338033"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 14:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="996712651"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="996712651"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2023 14:11:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlyIC-0001yP-2f;
	Thu, 28 Sep 2023 21:11:28 +0000
Date: Fri, 29 Sep 2023 05:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 26/30]
 arch/x86/kernel/cpu/microcode/core.c:384:21: warning: 'ucode_load_secondary'
 defined but not used
Message-ID: <202309290503.DTiXQutm-lkp@intel.com>
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
config: i386-randconfig-014-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290503.DTiXQutm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290503.DTiXQutm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290503.DTiXQutm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_load_secondary':
   arch/x86/kernel/cpu/microcode/core.c:389:14: error: implicit declaration of function 'ucode_load_secondary_wait'; did you mean 'ucode_load_secondary'? [-Werror=implicit-function-declaration]
     389 |         if (!ucode_load_secondary_wait(ctrl_cpu)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              ucode_load_secondary
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_update_handler':
   arch/x86/kernel/cpu/microcode/core.c:457:17: error: implicit declaration of function 'load_secondary'; did you mean 'load_secondary_wait'? [-Werror=implicit-function-declaration]
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
>> arch/x86/kernel/cpu/microcode/core.c:384:21: warning: 'ucode_load_secondary' defined but not used [-Wunused-function]
     384 | static noinstr void ucode_load_secondary(unsigned int cpu)
         |                     ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/microcode/core.c:357:21: warning: 'load_secondary_wait' defined but not used [-Wunused-function]
     357 | static noinstr bool load_secondary_wait(unsigned int ctrl_cpu)
         |                     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ucode_load_secondary +384 arch/x86/kernel/cpu/microcode/core.c

   352	
   353	/*
   354	 * Protected against instrumentation up to the point where the primary
   355	 * thread completed the update. See microcode_nmi_handler() for details.
   356	 */
 > 357	static noinstr bool load_secondary_wait(unsigned int ctrl_cpu)
   358	{
   359		/* Initial rendezvouz to ensure that all CPUs have arrived */
   360		if (!wait_for_cpus(&late_cpus_in)) {
   361			raw_cpu_write(ucode_ctrl.result, UCODE_TIMEOUT);
   362			return false;
   363		}
   364	
   365		/*
   366		 * Wait for primary threads to complete. If one of them hangs due
   367		 * to the update, there is no way out. This is non-recoverable
   368		 * because the CPU might hold locks or resources and confuse the
   369		 * scheduler, watchdogs etc. There is no way to safely evacuate the
   370		 * machine.
   371		 */
   372		if (wait_for_ctrl())
   373			return true;
   374	
   375		instrumentation_begin();
   376		panic("Microcode load: Primary CPU %d timed out\n", ctrl_cpu);
   377		instrumentation_end();
   378	}
   379	
   380	/*
   381	 * Protected against instrumentation up to the point where the primary
   382	 * thread completed the update. See microcode_nmi_handler() for details.
   383	 */
 > 384	static noinstr void ucode_load_secondary(unsigned int cpu)
   385	{
   386		unsigned int ctrl_cpu = raw_cpu_read(ucode_ctrl.ctrl_cpu);
   387		enum ucode_state ret;
   388	
   389		if (!ucode_load_secondary_wait(ctrl_cpu)) {
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
