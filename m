Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E915B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 00:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695948724; x=1727484724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ombjTKKm4bturX2PHr8aQLBVaUx33A6OphqABW4VZYQ=;
  b=oFgfc9PH96GaMFgmdFbkVXYsVolfUHaeIIRx8mTRg68bQw9sxGcOo4NX
   BHfY3BSfvgu7QaNEkn7WUYXbSgG8abpqcWjubW/xRaCiJDbAb8qJR5gaR
   bxYsArCb1ux3qzFuUr7TAPs2bDE9f+qwjUxy5xyzcnfHPhB3guaByx3hz
   Dfxocnl/p9bcswbvFn2zcbW7HkXkrAJYZ9ya0gmvfsBhnO7nLilYeNsMU
   TXx6ODxW1scY0i4Ep2IcRMWz/0o6My69hGnUjFpFm39HX8Ue0L0cpqFU8
   1pGWHz0izAC2FarrkFCNyXk45t+Iog/O//iuDMLVliR4WqBty1s/NR/b1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468490339"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="468490339"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 17:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923455798"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="923455798"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 17:52:01 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm1jb-0002D7-1C;
	Fri, 29 Sep 2023 00:51:59 +0000
Date: Fri, 29 Sep 2023 08:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 25/30]
 arch/x86/kernel/cpu/microcode/core.c:467:33: error: 'load_cpus_stopped'
 undeclared; did you mean 'ucode_load_cpus_stopped'?
Message-ID: <202309290807.c7VmvdYc-lkp@intel.com>
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
commit: 4d9a488a84f0eebe598bd655b9d3c3ceceb1acff [25/30] x86/microcode: Rendezvous and load in NMI
config: i386-randconfig-014-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290807.c7VmvdYc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290807.c7VmvdYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290807.c7VmvdYc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'load_late_stop_cpus':
>> arch/x86/kernel/cpu/microcode/core.c:467:33: error: 'load_cpus_stopped' undeclared (first use in this function); did you mean 'ucode_load_cpus_stopped'?
     467 |         stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 ucode_load_cpus_stopped
   arch/x86/kernel/cpu/microcode/core.c:467:33: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/cpu/microcode/core.c: At top level:
   arch/x86/kernel/cpu/microcode/core.c:434:12: warning: 'ucode_load_cpus_stopped' defined but not used [-Wunused-function]
     434 | static int ucode_load_cpus_stopped(void *unused)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +467 arch/x86/kernel/cpu/microcode/core.c

a5321aec6412b2 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2018-02-28  446  
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  447  static int load_late_stop_cpus(void)
a5321aec6412b2 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2018-02-28  448  {
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  449  	unsigned int cpu, updated = 0, failed = 0, timedout = 0, siblings = 0;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  450  	int old_rev = boot_cpu_data.microcode;
ab31c74455c64e arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  451  	struct cpuinfo_x86 prev_info;
a5321aec6412b2 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2018-02-28  452  
d23d33ea0fcdc4 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov 2022-05-25  453  	pr_err("Attempting late microcode loading - it is dangerous and taints the kernel.\n");
d23d33ea0fcdc4 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov 2022-05-25  454  	pr_err("You should switch to early loading, if possible.\n");
d23d33ea0fcdc4 arch/x86/kernel/cpu/microcode/core.c Borislav Petkov 2022-05-25  455  
08a42536e7fdc1 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  456  	atomic_set(&late_cpus_in, num_online_cpus());
a5321aec6412b2 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2018-02-28  457  
c0dd9245aa9e25 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  458  	/*
c0dd9245aa9e25 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  459  	 * Take a snapshot before the microcode update in order to compare and
c0dd9245aa9e25 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  460  	 * check whether any bits changed after an update.
c0dd9245aa9e25 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  461  	 */
c0dd9245aa9e25 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  462  	store_cpu_caps(&prev_info);
c0dd9245aa9e25 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  463  
4d9a488a84f0ee arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  464  	if (microcode_ops->use_nmi)
4d9a488a84f0ee arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  465  		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
4d9a488a84f0ee arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  466  
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03 @467  	stop_machine_cpuslocked(load_cpus_stopped, NULL, cpu_online_mask);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  468  
4d9a488a84f0ee arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  469  	if (microcode_ops->use_nmi)
4d9a488a84f0ee arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  470  		static_branch_disable_cpuslocked(&microcode_nmi_handler_enable);
4d9a488a84f0ee arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  471  
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  472  	/* Analyze the results */
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  473  	for_each_cpu_and(cpu, cpu_present_mask, &cpus_booted_once_mask) {
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  474  		switch (per_cpu(ucode_ctrl.result, cpu)) {
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  475  		case UCODE_UPDATED:	updated++; break;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  476  		case UCODE_TIMEOUT:	timedout++; break;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  477  		case UCODE_OK:		siblings++; break;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  478  		default:		failed++; break;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  479  		}
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  480  	}
82c271a6782be4 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  481  
82c271a6782be4 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  482  	if (microcode_ops->finalize_late_load)
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  483  		microcode_ops->finalize_late_load(!updated);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  484  
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  485  	if (!updated) {
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  486  		/* Nothing changed. */
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  487  		if (!failed && !timedout)
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  488  			return 0;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  489  		pr_err("update failed: %u CPUs failed %u CPUs timed out\n",
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  490  		       failed, timedout);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  491  		return -EIO;
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  492  	}
82c271a6782be4 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  493  
981c604bf70c9e arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-08  494  	add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  495  	pr_info("load: updated on %u primary CPUs with %u siblings\n", updated, siblings);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  496  	if (failed || timedout) {
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  497  		pr_err("load incomplete. %u CPUs timed out or failed\n",
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  498  		       num_online_cpus() - (updated + siblings));
6eab3abac70432 arch/x86/kernel/cpu/microcode/core.c Ashok Raj       2023-01-09  499  	}
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  500  	pr_info("revision: 0x%x -> 0x%x\n", old_rev, boot_cpu_data.microcode);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  501  	microcode_check(&prev_info);
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  502  
cc236ac96a8039 arch/x86/kernel/cpu/microcode/core.c Thomas Gleixner 2023-08-03  503  	return updated + siblings == num_online_cpus() ? 0 : -EIO;
af5c820a3169e8 arch/x86/kernel/microcode_core.c     Rusty Russell   2009-03-11  504  }
af5c820a3169e8 arch/x86/kernel/microcode_core.c     Rusty Russell   2009-03-11  505  

:::::: The code at line 467 was first introduced by commit
:::::: cc236ac96a8039002a10d3c0dc1b39ffbca70eca x86/microcode: Add per CPU result state

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
