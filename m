Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD587F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 03:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694662439; x=1726198439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=855vQXto/bFhIsrfZ41wv5MmwK45+RKcjNGsDiZ/Hh4=;
  b=UDEIXS51tcaGIWuzJozp2Hm25nzn4kiPWMEqbgFftcClXunXoceK4/rM
   eH87Gtr7io+qg4Ba8m1Lc6A98KHH8sj4SYy50ahcrDV2gmvqk/WWJ+Z/b
   7G8tVcDVfyn8YAEPyKdQEGTD89LLvjc1PkXrUDVBF85351iMlyaEJRiiY
   lmzk6Jq0U6EEQEcWa6OnfF+vCUEnbsiyU8FfP6xnqY7YgvLDPZ6xW0Wus
   76NKDUKIZW9bih0LZ0TN2cic1veOQyxiYQtwB3EXUMAlDDshcMFksgSjO
   5AKJ7aYhSwQqYnSE7GRM4KvH1dbM0XwNnHt1OgvqiEaMHsksNa8G2Guj3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="359104465"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="359104465"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887616706"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887616706"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 20:33:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgd71-00016L-2I;
	Thu, 14 Sep 2023 03:33:51 +0000
Date: Thu, 14 Sep 2023 11:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpucap/cleanup 2/28]
 arch/arm64/kernel/cpufeature.c:3323:20: error: static declaration of
 'setup_system_features' follows non-static declaration
Message-ID: <202309141141.RD0XcdnJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   8bd30d909bd76b31016eab495132bcef0c67b291
commit: d7ff7b47322388ad8fb7717e3334ad24f928dfce [2/28] arm64: rework setup_cpu_features()
config: arm64-randconfig-003-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141141.RD0XcdnJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141141.RD0XcdnJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141141.RD0XcdnJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:3323:20: error: static declaration of 'setup_system_features' follows non-static declaration
    3323 | static void __init setup_system_features(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/sched/task_stack.h:9,
                    from include/linux/elfcore.h:7,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from arch/arm64/kernel/cpufeature.c:67:
   arch/arm64/include/asm/cpufeature.h:629:13: note: previous declaration of 'setup_system_features' with type 'void(void)'
     629 | void __init setup_system_features(void);
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:3323:20: warning: 'setup_system_features' defined but not used [-Wunused-function]
    3323 | static void __init setup_system_features(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/setup_system_features +3323 arch/arm64/kernel/cpufeature.c

  3322	
> 3323	static void __init setup_system_features(void)
  3324	{
  3325		/*
  3326		 * The system-wide safe feature feature register values have been
  3327		 * finalized. Finalize and log the available system capabilities.
  3328		 */
  3329		update_cpu_capabilities(SCOPE_SYSTEM);
  3330		if (system_uses_ttbr0_pan())
  3331			pr_info("emulated: Privileged Access Never (PAN) using TTBR0_EL1 switching\n");
  3332	
  3333		/*
  3334		 * Enable all the available capabilities which have not been enabled
  3335		 * already.
  3336		 */
  3337		enable_cpu_capabilities(SCOPE_ALL & ~SCOPE_BOOT_CPU);
  3338	
  3339		sve_setup();
  3340		sme_setup();
  3341	
  3342		/*
  3343		 * Check for sane CTR_EL0.CWG value.
  3344		 */
  3345		if (!cache_type_cwg())
  3346			pr_warn("No Cache Writeback Granule information, assuming %d\n",
  3347				ARCH_DMA_MINALIGN);
  3348	}
  3349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
