Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C813201
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675370451; x=1706906451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DETTo/K6BbEUc5yxGGR3NVAp6dASmqz/MRKw7Rrj5I=;
  b=To0JFF306Rez6tZejwZF0/IFfRRNibQA/PfBIjXcIP/VADkPm5enuUKf
   AhCM5cIpASTeBJRiDxdHA+zlV+v6QZO4lG0y1yNuWlzzZALV7r//LEcm2
   BcEonJiOxNaHxQsJnC/QgYTlYN+jY9Rcf59lb4WuPoPgrSp3wXsAC9hfW
   Pt8rX4AASm2OC2KsRa+FnIhdBouQ93iPEsOubYKrc9E4Hi97bCSwTaSuh
   d9ozmT4FyBbIPxcV4ARTCuWbdo++Esgs1J2cr7D++ntl1tLYC5pqeGBM4
   V2i3//a0rhUDyaQOqrZwmdB74gxiSgshKTuE+nHdw+2eqrY9W/8b5DopM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308209890"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308209890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 12:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774049211"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="774049211"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 12:40:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNgO1-0006pk-0L;
	Thu, 02 Feb 2023 20:40:49 +0000
Date: Fri, 3 Feb 2023 04:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc6 13/15] arch/x86/kernel/smpboot.c:217:9:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202302030453.vaj4o4LW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc6
head:   459d1c46dbd121ad460159a0fe313dd07e3951da
commit: b5cc1bb6bc7d1190dac971407a9c2b1f7fc387f1 [13/15] parallel part 2
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302030453.vaj4o4LW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc6
        git checkout b5cc1bb6bc7d1190dac971407a9c2b1f7fc387f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
