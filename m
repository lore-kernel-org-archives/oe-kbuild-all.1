Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE113FFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 01:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737941339; cv=none; b=OFJQZUiqJrnQChKdVa/z9/HMOXVxrLIaL4L579+lFMFaCSLHX4iaM+VW0/Nfly6NmTLnwEbOWif5cIFhE7N4o2rDe5X61OeBBxLDMEPo4H0XvJDX26BtmD/BKiZFVXSuISspz203veyoctj4L6F4q7SgS8ZLJqAAvBqbUphgCrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737941339; c=relaxed/simple;
	bh=CmV7Gxvtf+q7A5T9EATRzHihfBSMwcdA3Lo0kXoyNGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAuNjlASlrJbuuRuIWm33RflThJHesYWZXc4iISCDkXRUhTFCoSJ3uuh36SQ7DzCVXyPWsudFJH0nUdmbx453ggPxZ345brkFHMYj+L6AFWfxTv/7srMLmlUEaii0U061nqjGWdQ0M/lYzKWPC8ABzcEF+s+9Z3jT2TBnBELKAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bw2sHRDI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bw2sHRDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737941337; x=1769477337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmV7Gxvtf+q7A5T9EATRzHihfBSMwcdA3Lo0kXoyNGs=;
  b=Bw2sHRDIuO2/TVKrzL3D6dRuENYo1B+O61xrFlK6XPXpC/kLCJjEEHo5
   +mCSekgv4xb8rAirqWel7HaoKvFuefXQWOB65eZofLqsA7zCfHnLZltr/
   5dzT8yHC+K5+JcfpfJz+4Z2HDsfNdQX97g2Vegav4Wn17/5Qi2/qRx6sL
   SwTiRx5gzZE3vlLj9czKnGfvKSFYSZ/u0WfPqB3nLMmEAF2B7qqkTxm8E
   9C06PweOoP7mGOxygl7ghSzk7GpXzo6HTOOuGd/DPO16ewg5bdr/M2DQ5
   Zt2s8PrpoRm+SqcET55N1H1UAt+F8eWuJtvOVJK7CK/vt4NL60lNhgqUf
   A==;
X-CSE-ConnectionGUID: aM/xDRMmRFCChQB1ZW0DGA==
X-CSE-MsgGUID: YW+JYAuURGWcAMo9cv/5vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42154910"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="42154910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 17:28:57 -0800
X-CSE-ConnectionGUID: B+kTqzI/T8qXc9sXgMqoGA==
X-CSE-MsgGUID: BF2lF+JYQxy5IExc03VM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145535721"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2025 17:28:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcDvp-000gHr-0E;
	Mon, 27 Jan 2025 01:28:53 +0000
Date: Mon, 27 Jan 2025 09:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:b4/dead-deamons 2/5]
 arch/arm64/include/asm/smp.h:33:9: warning: "raw_smp_processor_id" redefined
Message-ID: <202501270958.wnDUV2M9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/dead-deamons
head:   337a23015919bdcaf25c1f3bbfcb7b5bd11d7029
commit: a3a4fafbdc9963ed91b21a60f503fdf1ccdc8183 [2/5] Allow no SMP builds
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250127/202501270958.wnDUV2M9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270958.wnDUV2M9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270958.wnDUV2M9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/smp_plat.h:13,
                    from arch/arm64/kernel/asm-offsets.c:21:
>> arch/arm64/include/asm/smp.h:33:9: warning: "raw_smp_processor_id" redefined
      33 | #define raw_smp_processor_id() (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   include/linux/smp.h:198:9: note: this is the location of the previous definition
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kernel/traps.c:46:
>> arch/arm64/include/asm/smp.h:33:9: warning: "raw_smp_processor_id" redefined
      33 | #define raw_smp_processor_id() (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/spectre.h:16,
                    from arch/arm64/include/asm/processor.h:45,
                    from include/linux/sched.h:13,
                    from include/linux/context_tracking.h:5,
                    from arch/arm64/kernel/traps.c:10:
   include/linux/smp.h:198:9: note: this is the location of the previous definition
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:839:43: warning: initialized field overwritten [-Woverride-init]
     839 |         [ESR_ELx_EC_UNKNOWN]            = "Unknown/Uncategorized",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:839:43: note: (near initialization for 'esr_class_str[0]')
   arch/arm64/kernel/traps.c:840:43: warning: initialized field overwritten [-Woverride-init]
     840 |         [ESR_ELx_EC_WFx]                = "WFI/WFE",
         |                                           ^~~~~~~~~
   arch/arm64/kernel/traps.c:840:43: note: (near initialization for 'esr_class_str[1]')
   arch/arm64/kernel/traps.c:841:43: warning: initialized field overwritten [-Woverride-init]
     841 |         [ESR_ELx_EC_CP15_32]            = "CP15 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:841:43: note: (near initialization for 'esr_class_str[3]')
   arch/arm64/kernel/traps.c:842:43: warning: initialized field overwritten [-Woverride-init]
     842 |         [ESR_ELx_EC_CP15_64]            = "CP15 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:842:43: note: (near initialization for 'esr_class_str[4]')
   arch/arm64/kernel/traps.c:843:43: warning: initialized field overwritten [-Woverride-init]
     843 |         [ESR_ELx_EC_CP14_MR]            = "CP14 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:843:43: note: (near initialization for 'esr_class_str[5]')
   arch/arm64/kernel/traps.c:844:43: warning: initialized field overwritten [-Woverride-init]
     844 |         [ESR_ELx_EC_CP14_LS]            = "CP14 LDC/STC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:844:43: note: (near initialization for 'esr_class_str[6]')
   arch/arm64/kernel/traps.c:845:43: warning: initialized field overwritten [-Woverride-init]
     845 |         [ESR_ELx_EC_FP_ASIMD]           = "ASIMD",
         |                                           ^~~~~~~
   arch/arm64/kernel/traps.c:845:43: note: (near initialization for 'esr_class_str[7]')
   arch/arm64/kernel/traps.c:846:43: warning: initialized field overwritten [-Woverride-init]
     846 |         [ESR_ELx_EC_CP10_ID]            = "CP10 MRC/VMRS",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:846:43: note: (near initialization for 'esr_class_str[8]')
   arch/arm64/kernel/traps.c:847:43: warning: initialized field overwritten [-Woverride-init]
     847 |         [ESR_ELx_EC_PAC]                = "PAC",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:847:43: note: (near initialization for 'esr_class_str[9]')
   arch/arm64/kernel/traps.c:848:43: warning: initialized field overwritten [-Woverride-init]
     848 |         [ESR_ELx_EC_CP14_64]            = "CP14 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:848:43: note: (near initialization for 'esr_class_str[12]')
   arch/arm64/kernel/traps.c:849:43: warning: initialized field overwritten [-Woverride-init]
     849 |         [ESR_ELx_EC_BTI]                = "BTI",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:849:43: note: (near initialization for 'esr_class_str[13]')
   arch/arm64/kernel/traps.c:850:43: warning: initialized field overwritten [-Woverride-init]
     850 |         [ESR_ELx_EC_ILL]                = "PSTATE.IL",
         |                                           ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:850:43: note: (near initialization for 'esr_class_str[14]')
   arch/arm64/kernel/traps.c:851:43: warning: initialized field overwritten [-Woverride-init]
     851 |         [ESR_ELx_EC_SVC32]              = "SVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:851:43: note: (near initialization for 'esr_class_str[17]')
   arch/arm64/kernel/traps.c:852:43: warning: initialized field overwritten [-Woverride-init]
     852 |         [ESR_ELx_EC_HVC32]              = "HVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:852:43: note: (near initialization for 'esr_class_str[18]')
   arch/arm64/kernel/traps.c:853:43: warning: initialized field overwritten [-Woverride-init]
     853 |         [ESR_ELx_EC_SMC32]              = "SMC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:853:43: note: (near initialization for 'esr_class_str[19]')
   arch/arm64/kernel/traps.c:854:43: warning: initialized field overwritten [-Woverride-init]
     854 |         [ESR_ELx_EC_SVC64]              = "SVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:854:43: note: (near initialization for 'esr_class_str[21]')
   arch/arm64/kernel/traps.c:855:43: warning: initialized field overwritten [-Woverride-init]
     855 |         [ESR_ELx_EC_HVC64]              = "HVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:855:43: note: (near initialization for 'esr_class_str[22]')
   arch/arm64/kernel/traps.c:856:43: warning: initialized field overwritten [-Woverride-init]
     856 |         [ESR_ELx_EC_SMC64]              = "SMC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:856:43: note: (near initialization for 'esr_class_str[23]')
   arch/arm64/kernel/traps.c:857:43: warning: initialized field overwritten [-Woverride-init]
     857 |         [ESR_ELx_EC_SYS64]              = "MSR/MRS (AArch64)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:857:43: note: (near initialization for 'esr_class_str[24]')
   arch/arm64/kernel/traps.c:858:43: warning: initialized field overwritten [-Woverride-init]
     858 |         [ESR_ELx_EC_SVE]                = "SVE",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:858:43: note: (near initialization for 'esr_class_str[25]')
   arch/arm64/kernel/traps.c:859:43: warning: initialized field overwritten [-Woverride-init]
     859 |         [ESR_ELx_EC_ERET]               = "ERET/ERETAA/ERETAB",
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:859:43: note: (near initialization for 'esr_class_str[26]')
   arch/arm64/kernel/traps.c:860:43: warning: initialized field overwritten [-Woverride-init]
     860 |         [ESR_ELx_EC_FPAC]               = "FPAC",
         |                                           ^~~~~~
   arch/arm64/kernel/traps.c:860:43: note: (near initialization for 'esr_class_str[28]')
   arch/arm64/kernel/traps.c:861:43: warning: initialized field overwritten [-Woverride-init]
     861 |         [ESR_ELx_EC_SME]                = "SME",
--
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/cpufeature.o: in function `init_32bit_el0_mask':
>> cpufeature.c:(.init.text+0x264): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: kernel/workqueue.o: in function `rcu_free_pool':
>> workqueue.c:(.text+0x1b64): undefined reference to `free_cpumask_var'
>> aarch64-linux-ld: workqueue.c:(.text+0x1b6c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `rcu_free_wq':
   workqueue.c:(.text+0x1db0): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x1db8): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `apply_wqattrs_cleanup.part.0':
   workqueue.c:(.text+0x2030): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o:workqueue.c:(.text+0x2038): more undefined references to `free_cpumask_var' follow
   aarch64-linux-ld: kernel/workqueue.o: in function `alloc_workqueue_attrs':
>> workqueue.c:(.text+0x5020): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: workqueue.c:(.text+0x5034): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: workqueue.c:(.text+0x5080): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x5088): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `apply_wqattrs_prepare':
   workqueue.c:(.text+0x5c54): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x5c5c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `cpumask_store':
   workqueue.c:(.text+0x60f0): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: workqueue.c:(.text+0x611c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x61ac): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x61f0): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x6218): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `wq_affinity_strict_store':
   workqueue.c:(.text+0x6320): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o:workqueue.c:(.text+0x6328): more undefined references to `free_cpumask_var' follow
   aarch64-linux-ld: kernel/workqueue.o: in function `workqueue_unbound_exclude_cpumask':
   workqueue.c:(.text+0x7088): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: workqueue.c:(.text+0x7110): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `__alloc_workqueue':
   workqueue.c:(.text+0x7614): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: workqueue.c:(.text+0x761c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/workqueue.o: in function `init_pod_type':
>> workqueue.c:(.init.text+0x234): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: kernel/workqueue.o: in function `workqueue_init_early':
   workqueue.c:(.init.text+0x72c): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: workqueue.c:(.init.text+0x744): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: workqueue.c:(.init.text+0x75c): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: workqueue.c:(.init.text+0x774): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: kernel/workqueue.o:workqueue.c:(.init.text+0x8b4): more undefined references to `alloc_cpumask_var_node' follow
   aarch64-linux-ld: block/blk-mq.o: in function `blk_mq_alloc_hctx':
>> blk-mq.c:(.text+0x1fcc): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: io_uring/sqpoll.o: in function `io_sq_offload_create':
>> sqpoll.c:(.text.unlikely+0x45c): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: sqpoll.c:(.text.unlikely+0x490): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: sqpoll.c:(.text.unlikely+0x498): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: io_uring/register.o: in function `__io_uring_register':
>> register.c:(.text+0x7c0): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: register.c:(.text+0xe08): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: register.c:(.text+0xe20): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: arch/arm64/kernel/topology.o: in function `init_amu_fie':
>> topology.c:(.init.text+0x18): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: kernel/sched/core.o: in function `sched_init':
>> core.c:(.init.text+0x1a8): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: kernel/sched/build_policy.o: in function `__sched_setaffinity':
>> build_policy.c:(.text+0x4ba0): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: build_policy.c:(.text+0x4bb8): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: build_policy.c:(.text+0x4bc4): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: build_policy.c:(.text+0x4c78): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/sched/build_policy.o: in function `__arm64_sys_sched_setaffinity':
   build_policy.c:(.text+0x4e6c): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: build_policy.c:(.text+0x4ed4): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/sched/build_policy.o: in function `__arm64_sys_sched_getaffinity':
   build_policy.c:(.text+0x4ffc): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: build_policy.c:(.text+0x505c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/sched/build_utility.o: in function `sync_runqueues_membarrier_state':
>> build_utility.c:(.text+0x584): undefined reference to `alloc_cpumask_var_node'
>> aarch64-linux-ld: build_utility.c:(.text+0x648): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/sched/build_utility.o: in function `membarrier_private_expedited':
   build_utility.c:(.text+0x844): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: build_utility.c:(.text+0x8f4): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: kernel/sched/build_utility.o: in function `__arm64_sys_membarrier':
   build_utility.c:(.text+0x18d4): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: build_utility.c:(.text+0x197c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: block/blk-mq-sysfs.o: in function `blk_mq_hw_sysfs_release':
>> blk-mq-sysfs.c:(.text+0x234): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: io_uring/io-wq.o: in function `io_wq_create':
   io-wq.c:(.text+0x1cdc): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: io-wq.c:(.text+0x1d14): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: io_uring/io-wq.o: in function `io_wq_put_and_exit':
   io-wq.c:(.text+0x203c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: io_uring/io-wq.o: in function `io_wq_cpu_affinity':
   io-wq.c:(.text+0x2140): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: io-wq.c:(.text+0x2198): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/cpu.o: in function `print_cpus_isolated':
   cpu.c:(.text+0x1c8): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: cpu.c:(.text+0x208): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/cpu.o: in function `print_cpus_offline':
   cpu.c:(.text+0x244): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: cpu.c:(.text+0x294): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/topology.o: in function `cluster_cpus_list_read':
   topology.c:(.text+0x74): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: topology.c:(.text+0xdc): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/topology.o: in function `core_siblings_list_read':
   topology.c:(.text+0x130): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: topology.c:(.text+0x198): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/topology.o: in function `thread_siblings_list_read':
   topology.c:(.text+0x1f4): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: topology.c:(.text+0x25c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/topology.o: in function `cluster_cpus_read':
   topology.c:(.text+0x2b4): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: topology.c:(.text+0x31c): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/topology.o: in function `core_siblings_read':
   topology.c:(.text+0x370): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: topology.c:(.text+0x3d8): undefined reference to `free_cpumask_var'
   aarch64-linux-ld: drivers/base/topology.o: in function `thread_siblings_read':
   topology.c:(.text+0x434): undefined reference to `alloc_cpumask_var_node'
   aarch64-linux-ld: topology.c:(.text+0x49c): undefined reference to `free_cpumask_var'
--
   In file included from arch/arm64/include/asm/smp_plat.h:13,
                    from arch/arm64/kernel/asm-offsets.c:21:
>> arch/arm64/include/asm/smp.h:33:9: warning: "raw_smp_processor_id" redefined
      33 | #define raw_smp_processor_id() (current_thread_info()->cpu)
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   include/linux/smp.h:198:9: note: this is the location of the previous definition
     198 | #define raw_smp_processor_id()                  0
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/raw_smp_processor_id +33 arch/arm64/include/asm/smp.h

08e875c16a16c9 Catalin Marinas 2012-03-05  31  
a3a4fafbdc9963 James Clark     2025-01-09  32  #if NR_CPUS > 1
bf0baa5bbdc9b9 Puranjay Mohan  2024-05-03 @33  #define raw_smp_processor_id() (current_thread_info()->cpu)
a3a4fafbdc9963 James Clark     2025-01-09  34  #endif
08e875c16a16c9 Catalin Marinas 2012-03-05  35  

:::::: The code at line 33 was first introduced by commit
:::::: bf0baa5bbdc9b99ea081d360f245e5f96e835612 arm64: implement raw_smp_processor_id() using thread_info

:::::: TO: Puranjay Mohan <puranjay@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
