Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B23258F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685718316; x=1717254316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rXS4Of+CQQPgL0UzISnt7C/aBGzLvOfoTntUeBmPJdI=;
  b=BxxLNxsEln7cosqCdVMS0lhPlaew3/SoyIcruj4UUvisOHvLOhCix0We
   vNK9YA/ia2VKqtT9ubUuYkNL06YxPgBPo9Mt2ODymW8/Utr2MaYWdOFRD
   RTUNOh3RI6+xP8F4prC0cLssrPBL6gdSnqL23Gv5Il9T0ofJM7KYK0nhZ
   DT1oaE7E0TzI/AMg0W0D3l2DFupKVjJO6JGhbVc1/DQ/JkbQtvLWtAheW
   XLLKcWoMjv/xlE+UGisP2IJt/05YFZD0NqBPmMXoqQckBXVtkd9quUxfW
   jOxLY8jJg7+MPwe8NEeLzACpxlyw8qCWIBSIunaJDZNHiln258aIx4mgF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="384170958"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="384170958"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 08:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="797620022"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="797620022"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2023 08:04:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q56KT-0000ZD-29;
	Fri, 02 Jun 2023 15:04:37 +0000
Date: Fri, 2 Jun 2023 23:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc6 12/15] arch/x86/kernel/smpboot.c:217:9:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202306022207.y1AqWosy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc6
head:   17bbd12ee03047864f508d539e58974b4f677504
commit: 5a3f1ac5adb28c7ff6f2c90c6146adc5dde489bb [12/15] parallel part 2
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230602/202306022207.y1AqWosy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc6
        git checkout 5a3f1ac5adb28c7ff6f2c90c6146adc5dde489bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306022207.y1AqWosy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c: In function 'smp_callin':
>> arch/x86/kernel/smpboot.c:217:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     217 |         static arch_spinlock_t cpuhp_lock = __ARCH_SPIN_LOCK_UNLOCKED;
         |         ^~~~~~


vim +217 arch/x86/kernel/smpboot.c

   159	
   160	/*
   161	 * Report back to the Boot Processor during boot time or to the caller processor
   162	 * during CPU online.
   163	 */
   164	static void smp_callin(void)
   165	{
   166		int cpuid;
   167	
   168		/*
   169		 * If waken up by an INIT in an 82489DX configuration
   170		 * cpu_callout_mask guarantees we don't get here before
   171		 * an INIT_deassert IPI reaches our local APIC, so it is
   172		 * now safe to touch our local APIC.
   173		 */
   174		cpuid = smp_processor_id();
   175	
   176		/*
   177		 * the boot CPU has finished the init stage and is spinning
   178		 * on callin_map until we finish. We are free to set up this
   179		 * CPU, first the APIC. (this is probably redundant on most
   180		 * boards)
   181		 */
   182		apic_ap_setup();
   183	
   184		/*
   185		 * Save our processor parameters and update topology.
   186		 * Note: this information is needed for clock calibration.
   187		 * The topology information must be up to date before
   188		 * calibrate_delay() and notify_cpu_starting().
   189		 */
   190		smp_store_cpu_info(cpuid, false);
   191	
   192		ap_init_aperfmperf();
   193	
   194		/*
   195		 * Get our bogomips.
   196		 * Update loops_per_jiffy in cpu_data. Previous call to
   197		 * smp_store_cpu_info() stored a value that is close but not as
   198		 * accurate as the value just calculated.
   199		 */
   200		calibrate_delay();
   201		cpu_data(cpuid).loops_per_jiffy = loops_per_jiffy;
   202		pr_debug("Stack at about %p\n", &cpuid);
   203	
   204		wmb();
   205	
   206		/*
   207		 * Allow the master to continue.
   208		 */
   209		cpumask_set_cpu(cpuid, cpu_callin_mask);
   210		while (!cpumask_test_cpu(cpuid, cpu_finishup_mask))
   211			cpu_relax();
   212	
   213		/*
   214		 * This runs the AP through all the cpuhp states to its target
   215		 * state (CPUHP_ONLINE in the case of serial bringup).
   216		 */
 > 217		static arch_spinlock_t cpuhp_lock = __ARCH_SPIN_LOCK_UNLOCKED;
   218		arch_spin_lock(&cpuhp_lock);
   219		notify_cpu_starting(cpuid);
   220		arch_spin_unlock(&cpuhp_lock);
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
