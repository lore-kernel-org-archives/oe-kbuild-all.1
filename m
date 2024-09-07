Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6E28F0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725679883; cv=none; b=csf/rN8bio/kHfrfjgorzCxcWu/lMFhBaJ5pbQQM+/VBHrg2L2NLJJeHdFT+dryUk9+UBQHGgWEPiJAq64NS2ntpubSKMixwNotC7kfLDpeLBthX1Bsag5a5V3KlNOCCF8M5e1KWDepDZiS/vlMZphxlJCwV5Wo4zeHYyZRGyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725679883; c=relaxed/simple;
	bh=33xKsHaltxga2cKQu+3LlL5DslJw8znv1PHbtbvnkyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhR4K+wqd2JOQd1Tarl0xOW1FP2mEl4tCkm4mtQXftK4HCNmEpEZ3uXwd3BcKby35Ch7LO5qohcaMA5mKjrLOsOYpmwqQtXgOmLxrNKiwbHKI8NK+/594qQeE+br0uRdYqowv2Ct/IEJ63unShP/cWo3bXDVBqkFbQcHOtl+kEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGjJS6br; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGjJS6br"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725679878; x=1757215878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33xKsHaltxga2cKQu+3LlL5DslJw8znv1PHbtbvnkyM=;
  b=eGjJS6bry0YXtr0OSY3md6LsmE2WjbxgzuLLRwS/CWd3IjauLWlvkIxY
   AevzN5QZyO8EUJ8R2UomR62+BHZlQuL+Hgz4enV1m1PaE66lUEwfTppv0
   /yRxKxh833ygt4SKzB+wMqR6OMdP44rdrsrlBYLkkeJF83qidOEa5Gf/I
   00ie6B2q/2BrWs8UunKa3dqo15MRrFowsNsXfBkIHGd2wdKxOv1oQqATv
   a2Zku1QwEMwazv/3YB6VJ8Gnef+jMmE4dQLNpN2APsMdCNj8mfl5xlGwr
   6m0ahIJbQO3CmruQ1gX2i8TR8FgECetLABHVlS40ncVqHJ0wSNUyVSjPQ
   g==;
X-CSE-ConnectionGUID: gbit2CtSTO+bfGF+rMfGqw==
X-CSE-MsgGUID: 1q/AI+uwSzyY3RJIQi4HPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35115590"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="35115590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 20:31:17 -0700
X-CSE-ConnectionGUID: Iq7WLJYcTqORDdwBjpK2Vw==
X-CSE-MsgGUID: 2LIwP8WaSLSB5xLOGLE3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70928193"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 20:31:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smmAI-000C5n-39;
	Sat, 07 Sep 2024 03:31:10 +0000
Date: Sat, 7 Sep 2024 11:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5421/23701]
 arch/arm64/kernel/ptrace.c:1379:38: sparse: sparse: incorrect type in
 argument 6 (different address spaces)
Message-ID: <202409071155.6ow4kT3d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paulo,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   13b424f97ef548612c760cfd0892f96de96707e0
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [5421/23701] selinux: use kernel linux/socket.h for genheaders and mdp
config: arm64-randconfig-r131-20240906 (https://download.01.org/0day-ci/archive/20240907/202409071155.6ow4kT3d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409071155.6ow4kT3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071155.6ow4kT3d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/ptrace.c:1379:38: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void const [noderef] <asn:1> *data @@     got unsigned int * @@
   arch/arm64/kernel/ptrace.c:1379:38: sparse:     expected void const [noderef] <asn:1> *data
   arch/arm64/kernel/ptrace.c:1379:38: sparse:     got unsigned int *
   arch/arm64/kernel/ptrace.c:1637:5: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
    1637 | int syscall_trace_enter(struct pt_regs *regs)
         |     ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/ptrace.c:1655:6: warning: no previous prototype for 'syscall_trace_exit' [-Wmissing-prototypes]
    1655 | void syscall_trace_exit(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~
--
>> arch/arm64/kernel/traps.c:77:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] <asn:1> *__p @@     got unsigned int [usertype] * @@
   arch/arm64/kernel/traps.c:77:23: sparse:     expected unsigned int [noderef] <asn:1> *__p
   arch/arm64/kernel/traps.c:77:23: sparse:     got unsigned int [usertype] *
   arch/arm64/kernel/traps.c:408:29: warning: no previous prototype for 'do_undefinstr' [-Wmissing-prototypes]
     408 | asmlinkage void __exception do_undefinstr(struct pt_regs *regs)
         |                             ^~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:541:29: warning: no previous prototype for 'do_sysinstr' [-Wmissing-prototypes]
     541 | asmlinkage void __exception do_sysinstr(unsigned int esr, struct pt_regs *regs)
         |                             ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:561:43: warning: initialized field overwritten [-Woverride-init]
     561 |         [ESR_ELx_EC_UNKNOWN]            = "Unknown/Uncategorized",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:561:43: note: (near initialization for 'esr_class_str[0]')
   arch/arm64/kernel/traps.c:562:43: warning: initialized field overwritten [-Woverride-init]
     562 |         [ESR_ELx_EC_WFx]                = "WFI/WFE",
         |                                           ^~~~~~~~~
   arch/arm64/kernel/traps.c:562:43: note: (near initialization for 'esr_class_str[1]')
   arch/arm64/kernel/traps.c:563:43: warning: initialized field overwritten [-Woverride-init]
     563 |         [ESR_ELx_EC_CP15_32]            = "CP15 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:563:43: note: (near initialization for 'esr_class_str[3]')
   arch/arm64/kernel/traps.c:564:43: warning: initialized field overwritten [-Woverride-init]
     564 |         [ESR_ELx_EC_CP15_64]            = "CP15 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:564:43: note: (near initialization for 'esr_class_str[4]')
   arch/arm64/kernel/traps.c:565:43: warning: initialized field overwritten [-Woverride-init]
     565 |         [ESR_ELx_EC_CP14_MR]            = "CP14 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:565:43: note: (near initialization for 'esr_class_str[5]')
   arch/arm64/kernel/traps.c:566:43: warning: initialized field overwritten [-Woverride-init]
     566 |         [ESR_ELx_EC_CP14_LS]            = "CP14 LDC/STC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:566:43: note: (near initialization for 'esr_class_str[6]')
   arch/arm64/kernel/traps.c:567:43: warning: initialized field overwritten [-Woverride-init]
     567 |         [ESR_ELx_EC_FP_ASIMD]           = "ASIMD",
         |                                           ^~~~~~~
   arch/arm64/kernel/traps.c:567:43: note: (near initialization for 'esr_class_str[7]')
   arch/arm64/kernel/traps.c:568:43: warning: initialized field overwritten [-Woverride-init]
     568 |         [ESR_ELx_EC_CP10_ID]            = "CP10 MRC/VMRS",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:568:43: note: (near initialization for 'esr_class_str[8]')
   arch/arm64/kernel/traps.c:569:43: warning: initialized field overwritten [-Woverride-init]
     569 |         [ESR_ELx_EC_CP14_64]            = "CP14 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:569:43: note: (near initialization for 'esr_class_str[12]')
   arch/arm64/kernel/traps.c:570:43: warning: initialized field overwritten [-Woverride-init]
     570 |         [ESR_ELx_EC_ILL]                = "PSTATE.IL",
         |                                           ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:570:43: note: (near initialization for 'esr_class_str[14]')
   arch/arm64/kernel/traps.c:571:43: warning: initialized field overwritten [-Woverride-init]
     571 |         [ESR_ELx_EC_SVC32]              = "SVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:571:43: note: (near initialization for 'esr_class_str[17]')
   arch/arm64/kernel/traps.c:572:43: warning: initialized field overwritten [-Woverride-init]
     572 |         [ESR_ELx_EC_HVC32]              = "HVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:572:43: note: (near initialization for 'esr_class_str[18]')
   arch/arm64/kernel/traps.c:573:43: warning: initialized field overwritten [-Woverride-init]
     573 |         [ESR_ELx_EC_SMC32]              = "SMC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:573:43: note: (near initialization for 'esr_class_str[19]')
   arch/arm64/kernel/traps.c:574:43: warning: initialized field overwritten [-Woverride-init]
     574 |         [ESR_ELx_EC_SVC64]              = "SVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:574:43: note: (near initialization for 'esr_class_str[21]')
   arch/arm64/kernel/traps.c:575:43: warning: initialized field overwritten [-Woverride-init]
     575 |         [ESR_ELx_EC_HVC64]              = "HVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:575:43: note: (near initialization for 'esr_class_str[22]')
   arch/arm64/kernel/traps.c:576:43: warning: initialized field overwritten [-Woverride-init]
     576 |         [ESR_ELx_EC_SMC64]              = "SMC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:576:43: note: (near initialization for 'esr_class_str[23]')
   arch/arm64/kernel/traps.c:577:43: warning: initialized field overwritten [-Woverride-init]
     577 |         [ESR_ELx_EC_SYS64]              = "MSR/MRS (AArch64)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:577:43: note: (near initialization for 'esr_class_str[24]')
   arch/arm64/kernel/traps.c:578:43: warning: initialized field overwritten [-Woverride-init]
     578 |         [ESR_ELx_EC_SVE]                = "SVE",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:578:43: note: (near initialization for 'esr_class_str[25]')
   arch/arm64/kernel/traps.c:579:43: warning: initialized field overwritten [-Woverride-init]
     579 |         [ESR_ELx_EC_IMP_DEF]            = "EL3 IMP DEF",
         |                                           ^~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:579:43: note: (near initialization for 'esr_class_str[31]')
   arch/arm64/kernel/traps.c:580:43: warning: initialized field overwritten [-Woverride-init]
     580 |         [ESR_ELx_EC_IABT_LOW]           = "IABT (lower EL)",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:580:43: note: (near initialization for 'esr_class_str[32]')
   arch/arm64/kernel/traps.c:581:43: warning: initialized field overwritten [-Woverride-init]
     581 |         [ESR_ELx_EC_IABT_CUR]           = "IABT (current EL)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:581:43: note: (near initialization for 'esr_class_str[33]')
   arch/arm64/kernel/traps.c:582:43: warning: initialized field overwritten [-Woverride-init]
--
>> arch/arm64/kernel/cpu_errata.c:277:1: sparse: sparse: symbol '__pcpu_scope_arm64_ssbd_callback_required' was not declared. Should it be static?
   arch/arm64/kernel/cpu_errata.c:311:13: warning: no previous prototype for 'arm64_update_smccc_conduit' [-Wmissing-prototypes]
     311 | void __init arm64_update_smccc_conduit(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:333:13: warning: no previous prototype for 'arm64_enable_wa2_handling' [-Wmissing-prototypes]
     333 | void __init arm64_enable_wa2_handling(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> crypto/testmgr.c:1915:17: sparse: sparse: Variable length array is used.
>> crypto/testmgr.c:1921:24: sparse: sparse: cast to restricted __le32
>> crypto/testmgr.c:1921:24: sparse: sparse: cast to restricted __le32
>> crypto/testmgr.c:1921:24: sparse: sparse: cast to restricted __le32
>> crypto/testmgr.c:1921:24: sparse: sparse: cast to restricted __le32
>> crypto/testmgr.c:1921:24: sparse: sparse: cast to restricted __le32
>> crypto/testmgr.c:1921:24: sparse: sparse: cast to restricted __le32
--
>> drivers/base/regmap/regmap.c:335:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] @@     got unsigned short [usertype] @@
   drivers/base/regmap/regmap.c:335:14: sparse:     expected restricted __be16 [usertype]
   drivers/base/regmap/regmap.c:335:14: sparse:     got unsigned short [usertype]
>> drivers/base/regmap/regmap.c:342:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   drivers/base/regmap/regmap.c:342:14: sparse:     expected restricted __le16 [usertype]
   drivers/base/regmap/regmap.c:342:14: sparse:     got int
>> drivers/base/regmap/regmap.c:378:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] @@     got unsigned int [usertype] @@
   drivers/base/regmap/regmap.c:378:14: sparse:     expected restricted __be32 [usertype]
   drivers/base/regmap/regmap.c:378:14: sparse:     got unsigned int [usertype]
>> drivers/base/regmap/regmap.c:385:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/base/regmap/regmap.c:385:14: sparse:     expected restricted __le32 [usertype]
   drivers/base/regmap/regmap.c:385:14: sparse:     got unsigned int
>> drivers/base/regmap/regmap.c:412:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] @@     got unsigned long long [usertype] @@
   drivers/base/regmap/regmap.c:412:14: sparse:     expected restricted __be64 [usertype]
   drivers/base/regmap/regmap.c:412:14: sparse:     got unsigned long long [usertype]
>> drivers/base/regmap/regmap.c:419:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] @@     got unsigned long long @@
   drivers/base/regmap/regmap.c:419:14: sparse:     expected restricted __le64 [usertype]
   drivers/base/regmap/regmap.c:419:14: sparse:     got unsigned long long
--
>> drivers/bluetooth/btmtkuart.c:479:59: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/clk/hisilicon/clk-hi3660.c:336:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:338:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:340:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:342:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:344:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:346:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:348:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:350:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:352:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:354:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:356:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:358:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:360:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:362:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:364:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:366:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:368:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:370:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:372:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:374:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:376:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:378:71: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:423:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:425:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:427:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:429:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:449:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:451:71: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:453:71: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/hisilicon/clk-hi3660.c:455:71: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/clk/tegra/clk-super.c:124:22: sparse: sparse: symbol 'tegra_clk_super_mux_ops' was not declared. Should it be static?
   drivers/clk/tegra/clk-super.c:121:9: sparse: sparse: context imbalance in 'clk_super_set_parent' - different lock contexts for basic block
--
>> drivers/clk/tegra/clk-tegra210.c:2952:9: sparse: sparse: Using plain integer as NULL pointer
>> drivers/clk/tegra/clk-tegra210.c:2952:9: sparse: sparse: Using plain integer as NULL pointer
--
   drivers/clocksource/timer-of.c:39:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:3> * @@     got struct clock_event_device *clkevt @@
   drivers/clocksource/timer-of.c:39:55: sparse:     expected void [noderef] <asn:3> *
   drivers/clocksource/timer-of.c:39:55: sparse:     got struct clock_event_device *clkevt
>> drivers/clocksource/timer-of.c:39:24: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/clocksource/timer-of.c:39:24: sparse:    void
   drivers/clocksource/timer-of.c:39:24: sparse:    void const *
   drivers/clocksource/timer-of.c:83:51: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] <asn:3> *percpu_dev_id @@     got struct clock_event_device *clkevt @@
   drivers/clocksource/timer-of.c:83:51: sparse:     expected void [noderef] <asn:3> *percpu_dev_id
   drivers/clocksource/timer-of.c:83:51: sparse:     got struct clock_event_device *clkevt
--
>> drivers/cpufreq/tegra186-cpufreq.c:79:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *driver_data @@     got void [noderef] <asn:2> * @@
   drivers/cpufreq/tegra186-cpufreq.c:79:37: sparse:     expected void *driver_data
   drivers/cpufreq/tegra186-cpufreq.c:79:37: sparse:     got void [noderef] <asn:2> *
>> drivers/cpufreq/tegra186-cpufreq.c:94:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] <asn:2> *edvd_reg @@     got void *driver_data @@
   drivers/cpufreq/tegra186-cpufreq.c:94:40: sparse:     expected void [noderef] <asn:2> *edvd_reg
   drivers/cpufreq/tegra186-cpufreq.c:94:40: sparse:     got void *driver_data
--
>> drivers/crypto/bcm/spu.c:26:6: sparse: sparse: symbol 'tag_to_hash_idx' was not declared. Should it be static?
   drivers/crypto/bcm/spu.c:77:26: sparse: sparse: cast to restricted __be32
   drivers/crypto/bcm/spu.c:82:26: sparse: sparse: cast to restricted __be32
   drivers/crypto/bcm/spu.c:102:23: sparse: sparse: cast to restricted __be32
   drivers/crypto/bcm/spu.c:410:18: sparse: sparse: cast to restricted __be16
   drivers/crypto/bcm/spu.c:799:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] proto_flags @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:799:30: sparse:     expected unsigned int [usertype] proto_flags
   drivers/crypto/bcm/spu.c:799:30: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:800:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cipher_flags @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:800:31: sparse:     expected unsigned int [usertype] cipher_flags
   drivers/crypto/bcm/spu.c:800:31: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:801:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ecf @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:801:22: sparse:     expected unsigned int [usertype] ecf
   drivers/crypto/bcm/spu.c:801:22: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:806:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset_mac @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:806:27: sparse:     expected unsigned short [usertype] offset_mac
   drivers/crypto/bcm/spu.c:806:27: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:807:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] length_mac @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:807:27: sparse:     expected unsigned short [usertype] length_mac
   drivers/crypto/bcm/spu.c:807:27: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:808:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset_crypto @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:808:30: sparse:     expected unsigned short [usertype] offset_crypto
   drivers/crypto/bcm/spu.c:808:30: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:809:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] length_crypto @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:809:30: sparse:     expected unsigned short [usertype] length_crypto
   drivers/crypto/bcm/spu.c:809:30: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:818:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset_icv @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:818:27: sparse:     expected unsigned short [usertype] offset_icv
   drivers/crypto/bcm/spu.c:818:27: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:819:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] offset_iv @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:819:26: sparse:     expected unsigned short [usertype] offset_iv
   drivers/crypto/bcm/spu.c:819:26: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:830:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] size @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:830:18: sparse:     expected unsigned short [usertype] size
   drivers/crypto/bcm/spu.c:830:18: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:914:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] proto_flags @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:914:30: sparse:     expected unsigned int [usertype] proto_flags
   drivers/crypto/bcm/spu.c:914:30: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:917:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cipher_flags @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:917:31: sparse:     expected unsigned int [usertype] cipher_flags
   drivers/crypto/bcm/spu.c:917:31: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:918:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ecf @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:918:22: sparse:     expected unsigned int [usertype] ecf
   drivers/crypto/bcm/spu.c:918:22: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:990:23: sparse: sparse: cast to restricted __be32
   drivers/crypto/bcm/spu.c:1010:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cipher_flags @@     got restricted __be32 [usertype] @@
   drivers/crypto/bcm/spu.c:1010:31: sparse:     expected unsigned int [usertype] cipher_flags
   drivers/crypto/bcm/spu.c:1010:31: sparse:     got restricted __be32 [usertype]
   drivers/crypto/bcm/spu.c:1020:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] length_crypto @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:1020:38: sparse:     expected unsigned short [usertype] length_crypto
   drivers/crypto/bcm/spu.c:1020:38: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:1023:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] length_crypto @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:1023:38: sparse:     expected unsigned short [usertype] length_crypto
   drivers/crypto/bcm/spu.c:1023:38: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:1033:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] size @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:1033:18: sparse:     expected unsigned short [usertype] size
   drivers/crypto/bcm/spu.c:1033:18: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:1037:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] size @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:1037:26: sparse:     expected unsigned short [usertype] size
   drivers/crypto/bcm/spu.c:1037:26: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:1039:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] size @@     got restricted __be16 [usertype] @@
   drivers/crypto/bcm/spu.c:1039:26: sparse:     expected unsigned short [usertype] size
   drivers/crypto/bcm/spu.c:1039:26: sparse:     got restricted __be16 [usertype]
   drivers/crypto/bcm/spu.c:1094:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu.c:1094:45: sparse:     expected unsigned long long [usertype]
   drivers/crypto/bcm/spu.c:1094:45: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu.c:1096:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/crypto/bcm/spu.c:1096:45: sparse:     expected unsigned long long [usertype]
   drivers/crypto/bcm/spu.c:1096:45: sparse:     got restricted __be64 [usertype]
   drivers/crypto/bcm/spu.c: In function 'spum_dump_msg_hdr':
   drivers/crypto/bcm/spu.c:121:31: warning: variable 'name' set but not used [-Wunused-but-set-variable]
     121 |                         char *name = "NONE";
         |                               ^~~~
   drivers/crypto/bcm/spu.c:162:31: warning: variable 'name' set but not used [-Wunused-but-set-variable]
     162 |                         char *name = "NONE";
         |                               ^~~~
   drivers/crypto/bcm/spu.c:186:31: warning: variable 'name' set but not used [-Wunused-but-set-variable]
     186 |                         char *name = "NONE";
         |                               ^~~~
   drivers/crypto/bcm/spu.c:228:31: warning: variable 'name' set but not used [-Wunused-but-set-variable]
     228 |                         char *name = "NONE";
         |                               ^~~~
   drivers/crypto/bcm/spu.c:484: warning: Excess function parameter 'Return' description in 'spum_gcm_ccm_pad_len'
   drivers/crypto/bcm/spu.c:544: warning: Function parameter or member 'iv_len' not described in 'spum_aead_ivlen'
   drivers/crypto/bcm/spu.c:544: warning: Excess function parameter 'iv_ctr_len' description in 'spum_aead_ivlen'
   drivers/crypto/bcm/spu.c:576: warning: Function parameter or member 'alg_digest_size' not described in 'spum_digest_size'
   drivers/crypto/bcm/spu.c:576: warning: Function parameter or member 'alg' not described in 'spum_digest_size'
   drivers/crypto/bcm/spu.c:576: warning: Function parameter or member 'htype' not described in 'spum_digest_size'
   drivers/crypto/bcm/spu.c:603: warning: bad line:
   drivers/crypto/bcm/spu.c:952: warning: Function parameter or member 'is_inbound' not described in 'spum_cipher_req_finish'
   drivers/crypto/bcm/spu.c:952: warning: Excess function parameter 'isInbound' description in 'spum_cipher_req_finish'
--
>> drivers/crypto/bcm/spu2.c:52:6: sparse: sparse: symbol 'spu2_cipher_type_names' was not declared. Should it be static?
>> drivers/crypto/bcm/spu2.c:56:6: sparse: sparse: symbol 'spu2_cipher_mode_names' was not declared. Should it be static?
>> drivers/crypto/bcm/spu2.c:60:6: sparse: sparse: symbol 'spu2_hash_type_names' was not declared. Should it be static?
>> drivers/crypto/bcm/spu2.c:66:6: sparse: sparse: symbol 'spu2_hash_mode_names' was not declared. Should it be static?
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:481:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:482:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:483:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:484:29: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:536:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:599:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl0 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:599:20: sparse:     expected unsigned long long [usertype] ctrl0
   drivers/crypto/bcm/spu2.c:599:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:600:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl1 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:600:20: sparse:     expected unsigned long long [usertype] ctrl1
   drivers/crypto/bcm/spu2.c:600:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:601:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl2 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:601:20: sparse:     expected unsigned long long [usertype] ctrl2
   drivers/crypto/bcm/spu2.c:601:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:602:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl3 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:602:20: sparse:     expected unsigned long long [usertype] ctrl3
   drivers/crypto/bcm/spu2.c:602:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:647:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl0 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:647:20: sparse:     expected unsigned long long [usertype] ctrl0
   drivers/crypto/bcm/spu2.c:647:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:727:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl1 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:727:20: sparse:     expected unsigned long long [usertype] ctrl1
   drivers/crypto/bcm/spu2.c:727:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:761:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl2 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:761:20: sparse:     expected unsigned long long [usertype] ctrl2
   drivers/crypto/bcm/spu2.c:761:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:775:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl3 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:775:20: sparse:     expected unsigned long long [usertype] ctrl3
   drivers/crypto/bcm/spu2.c:775:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:819:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1226:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1231:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] ctrl0 @@     got restricted __le64 [usertype] @@
   drivers/crypto/bcm/spu2.c:1231:20: sparse:     expected unsigned long long [usertype] ctrl0
   drivers/crypto/bcm/spu2.c:1231:20: sparse:     got restricted __le64 [usertype]
   drivers/crypto/bcm/spu2.c:1239:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1239:17: sparse: sparse: cast to restricted __le64
   drivers/crypto/bcm/spu2.c:1239:17: sparse: sparse: cast to restricted __le64
--
>> drivers/crypto/bcm/cipher.c:99:6: sparse: sparse: symbol 'BCMHEADER' was not declared. Should it be static?
>> drivers/crypto/bcm/cipher.c:2100:6: sparse: sparse: symbol 'spu_no_incr_hash' was not declared. Should it be static?
>> drivers/crypto/bcm/cipher.c:4826:5: sparse: sparse: symbol 'bcm_spu_probe' was not declared. Should it be static?
>> drivers/crypto/bcm/cipher.c:4870:5: sparse: sparse: symbol 'bcm_spu_remove' was not declared. Should it be static?
   drivers/crypto/bcm/cipher.c: In function 'handle_ahash_req':
   drivers/crypto/bcm/cipher.c:720:22: warning: variable 'chunk_start' set but not used [-Wunused-but-set-variable]
     720 |         unsigned int chunk_start = 0;
         |                      ^~~~~~~~~~~
   drivers/crypto/bcm/cipher.c: In function 'spu_rx_callback':
   drivers/crypto/bcm/cipher.c:1679:38: warning: variable 'areq' set but not used [-Wunused-but-set-variable]
    1679 |         struct crypto_async_request *areq;
         |                                      ^~~~
   drivers/crypto/bcm/cipher.c:1678:29: warning: variable 'ctx' set but not used [-Wunused-but-set-variable]
    1678 |         struct iproc_ctx_s *ctx;
         |                             ^~~
   drivers/crypto/bcm/cipher.c: At top level:
   drivers/crypto/bcm/cipher.c:2100:6: warning: no previous prototype for 'spu_no_incr_hash' [-Wmissing-prototypes]
    2100 | bool spu_no_incr_hash(struct iproc_ctx_s *ctx)
         |      ^~~~~~~~~~~~~~~~
   drivers/crypto/bcm/cipher.c:4826:5: warning: no previous prototype for 'bcm_spu_probe' [-Wmissing-prototypes]
    4826 | int bcm_spu_probe(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~
   drivers/crypto/bcm/cipher.c:4870:5: warning: no previous prototype for 'bcm_spu_remove' [-Wmissing-prototypes]
    4870 | int bcm_spu_remove(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~
   drivers/crypto/bcm/cipher.c:1097: warning: Function parameter or member 'req' not described in 'spu_aead_rx_sg_create'
   drivers/crypto/bcm/cipher.c:3087: warning: Function parameter or member 'cipher' not described in 'rfc4543_gcm_esp_setkey'
   drivers/crypto/bcm/cipher.c:3087: warning: Function parameter or member 'key' not described in 'rfc4543_gcm_esp_setkey'
   drivers/crypto/bcm/cipher.c:3087: warning: Function parameter or member 'keylen' not described in 'rfc4543_gcm_esp_setkey'
--
>> drivers/crypto/qce/ablkcipher.c:215:17: sparse: sparse: Variable length array is used.
--
>> drivers/firmware/google/coreboot_table.c:117:22: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/firmware/google/coreboot_table.c:119:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] <asn:2> * @@     got void *[assigned] ptr_entry @@
   drivers/firmware/google/coreboot_table.c:119:17: sparse:     expected void const volatile [noderef] <asn:2> *
   drivers/firmware/google/coreboot_table.c:119:17: sparse:     got void *[assigned] ptr_entry
   drivers/firmware/google/coreboot_table.c:131:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] <asn:2> * @@     got void *[assigned] ptr_entry @@
   drivers/firmware/google/coreboot_table.c:131:17: sparse:     expected void const volatile [noderef] <asn:2> *
   drivers/firmware/google/coreboot_table.c:131:17: sparse:     got void *[assigned] ptr_entry
--
>> drivers/firmware/google/memconsole-coreboot.c:70:45: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void const *from @@     got unsigned char [noderef] <asn:2> * @@
   drivers/firmware/google/memconsole-coreboot.c:70:45: sparse:     expected void const *from
   drivers/firmware/google/memconsole-coreboot.c:70:45: sparse:     got unsigned char [noderef] <asn:2> *
>> drivers/firmware/google/memconsole-coreboot.c:80:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cbmem_cons [noderef] <asn:2> *tmp_cbmc @@     got void * @@
   drivers/firmware/google/memconsole-coreboot.c:80:18: sparse:     expected struct cbmem_cons [noderef] <asn:2> *tmp_cbmc
   drivers/firmware/google/memconsole-coreboot.c:80:18: sparse:     got void *
>> drivers/firmware/google/memconsole-coreboot.c:88:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cbmem_cons [noderef] <asn:2> *static [toplevel] cbmem_console @@     got void * @@
   drivers/firmware/google/memconsole-coreboot.c:88:23: sparse:     expected struct cbmem_cons [noderef] <asn:2> *static [toplevel] cbmem_console
   drivers/firmware/google/memconsole-coreboot.c:88:23: sparse:     got void *
>> drivers/firmware/google/memconsole-coreboot.c:91:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got struct cbmem_cons [noderef] <asn:2> *tmp_cbmc @@
   drivers/firmware/google/memconsole-coreboot.c:91:18: sparse:     expected void *addr
   drivers/firmware/google/memconsole-coreboot.c:91:18: sparse:     got struct cbmem_cons [noderef] <asn:2> *tmp_cbmc
>> drivers/firmware/google/memconsole-coreboot.c:106:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got struct cbmem_cons [noderef] <asn:2> *static [toplevel] cbmem_console @@
   drivers/firmware/google/memconsole-coreboot.c:106:26: sparse:     expected void *addr
   drivers/firmware/google/memconsole-coreboot.c:106:26: sparse:     got struct cbmem_cons [noderef] <asn:2> *static [toplevel] cbmem_console
>> drivers/firmware/google/memconsole-coreboot.c:49:22: sparse: sparse: dereference of noderef expression
   drivers/firmware/google/memconsole-coreboot.c:50:21: sparse: sparse: dereference of noderef expression
   drivers/firmware/google/memconsole-coreboot.c:87:30: sparse: sparse: dereference of noderef expression
--
>> drivers/firmware/meson/meson_sm.c:43:22: sparse: sparse: symbol 'gxbb_chip' was not declared. Should it be static?
   drivers/firmware/meson/meson_sm.c:89:24: sparse: sparse: Using plain integer as NULL pointer
>> drivers/firmware/meson/meson_sm.c:171:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] <asn:2> *static [toplevel] sm_shmem_out_base @@
   drivers/firmware/meson/meson_sm.c:171:17: sparse:     expected void const *
   drivers/firmware/meson/meson_sm.c:171:17: sparse:     got void [noderef] <asn:2> *static [toplevel] sm_shmem_out_base
>> drivers/firmware/meson/meson_sm.c:205:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] <asn:2> *static [toplevel] sm_shmem_in_base @@
   drivers/firmware/meson/meson_sm.c:205:9: sparse:     expected void *
   drivers/firmware/meson/meson_sm.c:205:9: sparse:     got void [noderef] <asn:2> *static [toplevel] sm_shmem_in_base
--
>> drivers/firmware/tegra/bpmp-debugfs.c:62:14: sparse: sparse: cast to restricted __le32
>> drivers/firmware/tegra/bpmp-debugfs.c:62:14: sparse: sparse: cast to restricted __le32
>> drivers/firmware/tegra/bpmp-debugfs.c:62:14: sparse: sparse: cast to restricted __le32
>> drivers/firmware/tegra/bpmp-debugfs.c:62:14: sparse: sparse: cast to restricted __le32
>> drivers/firmware/tegra/bpmp-debugfs.c:62:14: sparse: sparse: cast to restricted __le32
>> drivers/firmware/tegra/bpmp-debugfs.c:62:14: sparse: sparse: cast to restricted __le32
>> drivers/firmware/tegra/bpmp-debugfs.c:114:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:114:24: sparse:     expected unsigned int [usertype] cmd
   drivers/firmware/tegra/bpmp-debugfs.c:114:24: sparse:     got restricted __le32 [usertype]
>> drivers/firmware/tegra/bpmp-debugfs.c:116:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] fnameaddr @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:116:38: sparse:     expected unsigned int [usertype] fnameaddr
   drivers/firmware/tegra/bpmp-debugfs.c:116:38: sparse:     got restricted __le32 [usertype]
>> drivers/firmware/tegra/bpmp-debugfs.c:117:37: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] fnamelen @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:117:37: sparse:     expected unsigned int [usertype] fnamelen
   drivers/firmware/tegra/bpmp-debugfs.c:117:37: sparse:     got restricted __le32 [usertype]
>> drivers/firmware/tegra/bpmp-debugfs.c:118:37: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dataaddr @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:118:37: sparse:     expected unsigned int [usertype] dataaddr
   drivers/firmware/tegra/bpmp-debugfs.c:118:37: sparse:     got restricted __le32 [usertype]
>> drivers/firmware/tegra/bpmp-debugfs.c:119:36: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] datalen @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:119:36: sparse:     expected unsigned int [usertype] datalen
   drivers/firmware/tegra/bpmp-debugfs.c:119:36: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:150:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:150:24: sparse:     expected unsigned int [usertype] cmd
   drivers/firmware/tegra/bpmp-debugfs.c:150:24: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:152:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] fnameaddr @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:152:38: sparse:     expected unsigned int [usertype] fnameaddr
   drivers/firmware/tegra/bpmp-debugfs.c:152:38: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:153:37: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] fnamelen @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:153:37: sparse:     expected unsigned int [usertype] fnamelen
   drivers/firmware/tegra/bpmp-debugfs.c:153:37: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:154:37: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dataaddr @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:154:37: sparse:     expected unsigned int [usertype] dataaddr
   drivers/firmware/tegra/bpmp-debugfs.c:154:37: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:155:36: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] datalen @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:155:36: sparse:     expected unsigned int [usertype] datalen
   drivers/firmware/tegra/bpmp-debugfs.c:155:36: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:173:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] cmd @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:173:24: sparse:     expected unsigned int [usertype] cmd
   drivers/firmware/tegra/bpmp-debugfs.c:173:24: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:175:37: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dataaddr @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:175:37: sparse:     expected unsigned int [usertype] dataaddr
   drivers/firmware/tegra/bpmp-debugfs.c:175:37: sparse:     got restricted __le32 [usertype]
   drivers/firmware/tegra/bpmp-debugfs.c:176:36: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] datalen @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:176:36: sparse:     expected unsigned int [usertype] datalen
   drivers/firmware/tegra/bpmp-debugfs.c:176:36: sparse:     got restricted __le32 [usertype]
>> drivers/firmware/tegra/bpmp-debugfs.c:384:53: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] mrq @@     got restricted __le32 [usertype] @@
   drivers/firmware/tegra/bpmp-debugfs.c:384:53: sparse:     expected unsigned int [usertype] mrq
   drivers/firmware/tegra/bpmp-debugfs.c:384:53: sparse:     got restricted __le32 [usertype]
--
   drivers/infiniband/core/ud_header.c: note: in included file (through include/net/checksum.h, include/linux/skbuff.h, include/linux/if_ether.h):
>> arch/arm64/include/asm/checksum.h:45:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int [usertype] @@
   arch/arm64/include/asm/checksum.h:45:27: sparse:     expected restricted __wsum [usertype] csum
   arch/arm64/include/asm/checksum.h:45:27: sparse:     got unsigned int [usertype]
--
   drivers/infiniband/core/verbs.c: note: in included file (through include/net/checksum.h, include/linux/skbuff.h, include/linux/if_ether.h, ...):
>> arch/arm64/include/asm/checksum.h:45:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] csum @@     got unsigned int [usertype] @@
   arch/arm64/include/asm/checksum.h:45:27: sparse:     expected restricted __wsum [usertype] csum
   arch/arm64/include/asm/checksum.h:45:27: sparse:     got unsigned int [usertype]
   drivers/infiniband/core/verbs.c:242: warning: Function parameter or member 'flags' not described in '__ib_alloc_pd'
   drivers/infiniband/core/verbs.c:242: warning: Function parameter or member 'caller' not described in '__ib_alloc_pd'
   drivers/infiniband/core/verbs.c:1581: warning: Function parameter or member 'qp' not described in '_ib_modify_qp'
   drivers/infiniband/core/verbs.c:1581: warning: Function parameter or member 'attr' not described in '_ib_modify_qp'
   drivers/infiniband/core/verbs.c:1581: warning: Function parameter or member 'attr_mask' not described in '_ib_modify_qp'
   drivers/infiniband/core/verbs.c:1581: warning: Function parameter or member 'udata' not described in '_ib_modify_qp'
--
>> drivers/irqchip/irq-brcmstb-l2.c:278:12: sparse: sparse: symbol 'brcmstb_l2_edge_intc_of_init' was not declared. Should it be static?
>> drivers/irqchip/irq-brcmstb-l2.c:285:12: sparse: sparse: symbol 'brcmstb_l2_lvl_intc_of_init' was not declared. Should it be static?
   drivers/irqchip/irq-brcmstb-l2.c:278:12: warning: no previous prototype for 'brcmstb_l2_edge_intc_of_init' [-Wmissing-prototypes]
     278 | int __init brcmstb_l2_edge_intc_of_init(struct device_node *np,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-brcmstb-l2.c:285:12: warning: no previous prototype for 'brcmstb_l2_lvl_intc_of_init' [-Wmissing-prototypes]
     285 | int __init brcmstb_l2_lvl_intc_of_init(struct device_node *np,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/mtd/nand/raw/nand_base.c:277:17: sparse: sparse: cast from restricted __le16
   drivers/mtd/nand/raw/nand_base.c: In function 'nand_command':
   drivers/mtd/nand/raw/nand_base.c:848:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     848 |                 if (column == -1 && page_addr == -1)
         |                    ^
   drivers/mtd/nand/raw/nand_base.c:851:9: note: here
     851 |         default:
         |         ^~~~~~~
   drivers/mtd/nand/raw/nand_base.c: In function 'nand_command_lp':
   drivers/mtd/nand/raw/nand_base.c:998:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
     998 |                 chip->cmd_ctrl(mtd, NAND_CMD_NONE,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     999 |                                NAND_NCE | NAND_CTRL_CHANGE);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:1002:9: note: here
    1002 |         default:
         |         ^~~~~~~
   drivers/mtd/nand/raw/nand_base.c: In function 'nand_scan_tail':
   drivers/mtd/nand/raw/nand_base.c:6511:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6511 |                 if (!ecc->read_page)
         |                    ^
   drivers/mtd/nand/raw/nand_base.c:6514:9: note: here
    6514 |         case NAND_ECC_HW:
         |         ^~~~
   drivers/mtd/nand/raw/nand_base.c:6530:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6530 |                 if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
         |                    ^
   drivers/mtd/nand/raw/nand_base.c:6533:9: note: here
    6533 |         case NAND_ECC_HW_SYNDROME:
         |         ^~~~
   drivers/mtd/nand/raw/nand_base.c:6568:27: warning: this statement may fall through [-Wimplicit-fallthrough=]
    6568 |                 ecc->algo = NAND_ECC_HAMMING;
         |                 ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:6570:9: note: here
    6570 |         case NAND_ECC_SOFT:
         |         ^~~~
--
>> drivers/mtd/nand/raw/hisi504_nand.c:373:26: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/mtd/nand/raw/hisi504_nand.c:378:26: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/mtd/nand/raw/hisi504_nand.c:487:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] <asn:2> *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:487:17: sparse:     expected void *
   drivers/mtd/nand/raw/hisi504_nand.c:487:17: sparse:     got void [noderef] <asn:2> *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:499:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] <asn:2> *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:499:17: sparse:     expected void *
   drivers/mtd/nand/raw/hisi504_nand.c:499:17: sparse:     got void [noderef] <asn:2> *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:622:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] <asn:2> *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:622:9: sparse:     expected void *
   drivers/mtd/nand/raw/hisi504_nand.c:622:9: sparse:     got void [noderef] <asn:2> *mmio
--
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/control.c:451:17: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/control.c: In function 'i2400m_get_device_info':
   drivers/net/wimax/i2400m/control.c:961:31: warning: implicit conversion from 'enum <anonymous>' to 'enum i2400m_tlv' [-Wenum-conversion]
     961 |                               I2400M_TLV_DETAILED_DEVICE_INFO, sizeof(*ddi));
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wimax/i2400m/debug-levels.h:30,
                    from drivers/net/wimax/i2400m/control.c:86:
   drivers/net/wimax/i2400m/control.c: In function 'i2400m_report_tlv_system_state':
   include/linux/wimax/debug.h:200:4: warning: this statement may fall through [-Wimplicit-fallthrough=]
     200 | do {                                                                    22-      |    ^
   include/linux/wimax/debug.h:404:36: note: in expansion of macro '_d_printf'
     404 | #define d_printf(l, _dev, f, a...) _d_printf(l, "", _dev, f, ## a)
         |                                    ^~~~~~~~~
   drivers/net/wimax/i2400m/control.c:354:17: note: in expansion of macro 'd_printf'
     354 |                 d_printf(1, dev, "entering BS-negotiated idle moden");
         |                 ^~~~~~~~
   drivers/net/wimax/i2400m/control.c:355:9: note: here
     355 |         case I2400M_SS_DISCONNECTING:
         |         ^~~~
   drivers/net/wimax/i2400m/control.c:708: warning: Excess function parameter 'msg_skb' description in 'i2400m_msg_to_dev'
   drivers/net/wimax/i2400m/control.c:1196: warning: Function parameter or member 'arg' not described in 'i2400m_set_init_config'
   drivers/net/wimax/i2400m/control.c:1196: warning: Excess function parameter 'arg_size' description in 'i2400m_set_init_config'
--
>> drivers/net/wimax/i2400m/fw.c:194:36: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/wimax/i2400m/fw.c:195:34: sparse: sparse: invalid assignment: +=
   drivers/net/wimax/i2400m/fw.c:195:34: sparse:    left side has type unsigned int
   drivers/net/wimax/i2400m/fw.c:195:34: sparse:    right side has type restricted __le32
   drivers/net/wimax/i2400m/fw.c:196:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/wimax/i2400m/fw.c:196:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/wimax/i2400m/fw.c:196:66: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/wimax/i2400m/fw.c:261:27: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/fw.c:261:27: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/fw.c:261:27: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/fw.c:261:27: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/fw.c:261:27: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/fw.c:261:27: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/fw.c:261:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:261:25: sparse:     expected restricted __le32
   drivers/net/wimax/i2400m/fw.c:261:25: sparse:     got unsigned int
   drivers/net/wimax/i2400m/fw.c:262:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:262:25: sparse:     expected restricted __le32
   drivers/net/wimax/i2400m/fw.c:262:25: sparse:     got unsigned int
   drivers/net/wimax/i2400m/fw.c:263:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:263:25: sparse:     expected restricted __le32
   drivers/net/wimax/i2400m/fw.c:263:25: sparse:     got unsigned int
   drivers/net/wimax/i2400m/fw.c:264:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:27: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:264:25: sparse:     expected restricted __le32
   drivers/net/wimax/i2400m/fw.c:264:25: sparse:     got unsigned int
   drivers/net/wimax/i2400m/fw.c:417:48: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:417:48: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:417:48: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:417:48: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:417:48: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:417:48: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/fw.c:417:41: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/wimax/i2400m/fw.c:485:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] data_size @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:485:24: sparse:     expected restricted __le32 [usertype] data_size
   drivers/net/wimax/i2400m/fw.c:485:24: sparse:     got unsigned int
>> drivers/net/wimax/i2400m/fw.c:486:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] target_addr @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:486:26: sparse:     expected restricted __le32 [usertype] target_addr
   drivers/net/wimax/i2400m/fw.c:486:26: sparse:     got unsigned int
>> drivers/net/wimax/i2400m/fw.c:487:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] block_checksum @@     got unsigned int @@
   drivers/net/wimax/i2400m/fw.c:487:29: sparse:     expected restricted __le32 [usertype] block_checksum
   drivers/net/wimax/i2400m/fw.c:487:29: sparse:     got unsigned int
   drivers/net/wimax/i2400m/fw.c:512:27: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/wimax/i2400m/fw.c:1085:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long addr @@     got restricted __le32 const [usertype] address @@
   drivers/net/wimax/i2400m/fw.c:1085:62: sparse:     expected unsigned long addr
   drivers/net/wimax/i2400m/fw.c:1085:62: sparse:     got restricted __le32 const [usertype] address
   drivers/net/wimax/i2400m/fw.c:587: warning: Function parameter or member 'i2400m' not described in 'i2400m_bm_cmd'
   drivers/net/wimax/i2400m/fw.c:587: warning: Excess function parameter 'returns' description in 'i2400m_bm_cmd'
   drivers/net/wimax/i2400m/fw.c:649: warning: Function parameter or member 'chunk' not described in 'i2400m_download_chunk'
   drivers/net/wimax/i2400m/fw.c:649: warning: Function parameter or member '__chunk_len' not described in 'i2400m_download_chunk'
   drivers/net/wimax/i2400m/fw.c:649: warning: Excess function parameter 'buf' description in 'i2400m_download_chunk'
   drivers/net/wimax/i2400m/fw.c:649: warning: Excess function parameter 'buf_len' description in 'i2400m_download_chunk'
   drivers/net/wimax/i2400m/fw.c:1551: warning: Function parameter or member 'flags' not described in 'i2400m_dev_bootstrap'
--
>> drivers/net/wimax/i2400m/op-rfkill.c:104:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] length @@     got unsigned long @@
   drivers/net/wimax/i2400m/op-rfkill.c:104:25: sparse:     expected restricted __le16 [usertype] length
   drivers/net/wimax/i2400m/op-rfkill.c:104:25: sparse:     got unsigned long
>> drivers/net/wimax/i2400m/op-rfkill.c:173:14: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/op-rfkill.c:173:14: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/op-rfkill.c:173:14: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/op-rfkill.c:173:14: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/op-rfkill.c:173:14: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/op-rfkill.c:173:14: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/op-rfkill.c:174:14: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/op-rfkill.c:174:14: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/op-rfkill.c:174:14: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/op-rfkill.c:174:14: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/op-rfkill.c:174:14: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/op-rfkill.c:174:14: sparse: sparse: cast to restricted __le32
--
>> drivers/net/wimax/i2400m/tx.c:788:35: sparse: sparse: cast to restricted __le16
>> drivers/net/wimax/i2400m/tx.c:788:35: sparse: sparse: cast to restricted __le16
>> drivers/net/wimax/i2400m/tx.c:788:35: sparse: sparse: cast to restricted __le16
>> drivers/net/wimax/i2400m/tx.c:788:35: sparse: sparse: cast to restricted __le16
>> drivers/net/wimax/i2400m/tx.c:788:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] num_pls @@     got int @@
   drivers/net/wimax/i2400m/tx.c:788:33: sparse:     expected restricted __le16 [usertype] num_pls
   drivers/net/wimax/i2400m/tx.c:788:33: sparse:     got int
>> drivers/net/wimax/i2400m/tx.c:896:32: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:896:32: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:896:32: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:896:32: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:896:32: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:896:32: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:896:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] barker @@     got unsigned int @@
   drivers/net/wimax/i2400m/tx.c:896:30: sparse:     expected restricted __le32 [usertype] barker
   drivers/net/wimax/i2400m/tx.c:896:30: sparse:     got unsigned int
   drivers/net/wimax/i2400m/tx.c:897:34: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/tx.c:897:34: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/tx.c:897:34: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/tx.c:897:34: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/tx.c:897:34: sparse: sparse: cast to restricted __le32
   drivers/net/wimax/i2400m/tx.c:897:34: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:897:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sequence @@     got unsigned int @@
   drivers/net/wimax/i2400m/tx.c:897:32: sparse:     expected restricted __le32 [usertype] sequence
   drivers/net/wimax/i2400m/tx.c:897:32: sparse:     got unsigned int
   drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast from restricted __le16
   drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast from restricted __le16
   drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast from restricted __le16
   drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast from restricted __le16
   drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast from restricted __le16
   drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast to restricted __le32
>> drivers/net/wimax/i2400m/tx.c:899:15: sparse: sparse: cast from restricted __le16
   drivers/net/wimax/i2400m/tx.c: In function 'i2400m_tx':
   drivers/net/wimax/i2400m/tx.c:784:44: warning: array subscript <unknown> is outside array bounds of 'struct i2400m_pld[0]' [-Warray-bounds=]
     784 |                 i2400m_pld_set(&tx_msg->pld[num_pls], buf_len, pl_type);
         |                                 ~~~~~~~~~~~^~~~~~~~~
   In file included from drivers/net/wimax/i2400m/i2400m.h:160,
                    from drivers/net/wimax/i2400m/tx.c:249:
   include/uapi/linux/wimax/i2400m.h:322:27: note: while referencing 'pld'
     322 |         struct i2400m_pld pld[0];
         |                           ^~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:13,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arm64/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm64/include/asm/bitops.h:40,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:29,
                    from drivers/net/wimax/i2400m/tx.c:246:
   drivers/net/wimax/i2400m/tx.c:786:49: warning: array subscript <unknown> is outside array bounds of 'struct i2400m_pld[0]' [-Warray-bounds=]
     786 |                          le32_to_cpu(tx_msg->pld[num_pls].val),
         |                                      ~~~~~~~~~~~^~~~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     64-      |                                       ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   include/linux/wimax/debug.h:404:36: note: in expansion of macro '_d_printf'
     404 | #define d_printf(l, _dev, f, a...) _d_printf(l, "", _dev, f, ## a)
         |                                    ^~~~~~~~~
   drivers/net/wimax/i2400m/tx.c:785:17: note: in expansion of macro 'd_printf'
     785 |                 d_printf(3, dev, "pld 0x%08x (type 0x%1x len 0x%04zxn",
         |                 ^~~~~~~~
   include/uapi/linux/wimax/i2400m.h:322:27: note: while referencing 'pld'
     322 |         struct i2400m_pld pld[0];
         |                           ^~~
   drivers/net/wimax/i2400m/tx.c:717: warning: Function parameter or member 'i2400m' not described in 'i2400m_tx'
   drivers/net/wimax/i2400m/tx.c:966: warning: Function parameter or member 'i2400m' not described in 'i2400m_tx_setup'
   drivers/net/wimax/i2400m/tx.c:1007: warning: Function parameter or member 'i2400m' not described in 'i2400m_tx_release'
--
>> drivers/phy/qualcomm/phy-qcom-ufs.c:93:21: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/phy/qualcomm/phy-qcom-ufs.c:94:32: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/phy/qualcomm/phy-qcom-ufs.c:105:21: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/phy/qualcomm/phy-qcom-ufs.c:512:6: sparse: sparse: symbol 'ufs_qcom_phy_disable_iface_clk' was not declared. Should it be static?
   drivers/phy/qualcomm/phy-qcom-ufs.c:512:6: warning: no previous prototype for 'ufs_qcom_phy_disable_iface_clk' [-Wmissing-prototypes]
     512 | void ufs_qcom_phy_disable_iface_clk(struct ufs_qcom_phy *phy)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/phy/rockchip/phy-rockchip-typec.c:403:16: sparse: sparse: symbol 'usb3_pll_cfg' was not declared. Should it be static?
>> drivers/phy/rockchip/phy-rockchip-typec.c:420:16: sparse: sparse: symbol 'dp_pll_cfg' was not declared. Should it be static?
   drivers/phy/rockchip/phy-rockchip-typec.c:369: warning: cannot understand function prototype: 'struct rockchip_usb3phy_port_cfg '
--
>> drivers/platform/chrome/cros_ec_debugfs.c:266:30: sparse: sparse: symbol 'cros_ec_console_log_fops' was not declared. Should it be static?
>> drivers/platform/chrome/cros_ec_debugfs.c:275:30: sparse: sparse: symbol 'cros_ec_pdinfo_fops' was not declared. Should it be static?
   drivers/platform/chrome/cros_ec_debugfs.c: In function 'cros_ec_pdinfo_read':
   drivers/platform/chrome/cros_ec_debugfs.c:234:15: warning: taking address of packed member of 'struct <anonymous>' may result in an unaligned pointer value [-Waddress-of-packed-member]
     234 |         msg = &ec_buf.msg;
         |               ^~~~~~~~~~~
--
>> drivers/usb/gadget/udc/renesas_usb3.c:1539:17: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/renesas_usb3.c:1542:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] addr @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/gadget/udc/renesas_usb3.c:1542:43: sparse:     expected unsigned short [usertype] addr
   drivers/usb/gadget/udc/renesas_usb3.c:1542:43: sparse:     got restricted __le16 [usertype] wValue
>> drivers/usb/gadget/udc/renesas_usb3.c:1599:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] status @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/renesas_usb3.c:1599:24: sparse:     expected unsigned short [assigned] [usertype] status
   drivers/usb/gadget/udc/renesas_usb3.c:1599:24: sparse:     got restricted __le16 [usertype]
   drivers/usb/gadget/udc/renesas_usb3.c:1767:17: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/renesas_usb3.c: In function 'renesas_usb3_init_ep.isra':
   drivers/usb/gadget/udc/renesas_usb3.c:2516:73: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 6 [-Wformat-truncation=]
    2516 |                 snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
         |                                                                         ^~
   drivers/usb/gadget/udc/renesas_usb3.c:2516:70: note: directive argument in the range [-2147483639, 2147483646]
    2516 |                 snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
         |                                                                      ^~~~~~
   drivers/usb/gadget/udc/renesas_usb3.c:2516:17: note: 'snprintf' output between 4 and 14 bytes into a destination of size 8
    2516 |                 snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/usb/isp1760/isp1760-udc.c:212:24: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-udc.c:212:24: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-udc.c:212:24: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-udc.c:212:24: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-udc.c:212:24: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-udc.c:212:24: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-udc.c:214:31: sparse: sparse: cast to restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:214:31: sparse: sparse: cast to restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:214:31: sparse: sparse: cast to restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:214:31: sparse: sparse: cast to restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:268:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-udc.c:268:53: sparse:     expected unsigned int [usertype] val
   drivers/usb/isp1760/isp1760-udc.c:268:53: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-udc.c:270:17: sparse: sparse: cast from restricted __le16
>> drivers/usb/isp1760/isp1760-udc.c:270:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/isp1760/isp1760-udc.c:270:17: sparse:     expected unsigned short [usertype] val
   drivers/usb/isp1760/isp1760-udc.c:270:17: sparse:     got restricted __le16 [usertype]
   drivers/usb/isp1760/isp1760-udc.c:270:17: sparse: sparse: cast from restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:270:17: sparse: sparse: cast from restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:485:9: sparse: sparse: cast from restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:485:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/usb/isp1760/isp1760-udc.c:485:9: sparse:     expected unsigned short [usertype] val
   drivers/usb/isp1760/isp1760-udc.c:485:9: sparse:     got restricted __le16 [usertype]
   drivers/usb/isp1760/isp1760-udc.c:485:9: sparse: sparse: cast from restricted __le16
   drivers/usb/isp1760/isp1760-udc.c:485:9: sparse: sparse: cast from restricted __le16
--
>> drivers/usb/misc/usb251xb.c:448:36: sparse: sparse: cast to restricted __be32
   drivers/usb/misc/usb251xb.c:462:36: sparse: sparse: cast to restricted __be32
   drivers/usb/misc/usb251xb.c:476:36: sparse: sparse: cast to restricted __be32
--
>> drivers/usb/renesas_usbhs/common.c:164:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] wValue @@     got unsigned short @@
   drivers/usb/renesas_usbhs/common.c:164:25: sparse:     expected restricted __le16 [usertype] wValue
   drivers/usb/renesas_usbhs/common.c:164:25: sparse:     got unsigned short
>> drivers/usb/renesas_usbhs/common.c:165:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] wIndex @@     got unsigned short @@
   drivers/usb/renesas_usbhs/common.c:165:25: sparse:     expected restricted __le16 [usertype] wIndex
   drivers/usb/renesas_usbhs/common.c:165:25: sparse:     got unsigned short
>> drivers/usb/renesas_usbhs/common.c:166:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] wLength @@     got unsigned short @@
   drivers/usb/renesas_usbhs/common.c:166:25: sparse:     expected restricted __le16 [usertype] wLength
   drivers/usb/renesas_usbhs/common.c:166:25: sparse:     got unsigned short
>> drivers/usb/renesas_usbhs/common.c:172:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] data @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/renesas_usbhs/common.c:172:39: sparse:     expected unsigned short [usertype] data
   drivers/usb/renesas_usbhs/common.c:172:39: sparse:     got restricted __le16 [usertype] wValue
>> drivers/usb/renesas_usbhs/common.c:173:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] data @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/renesas_usbhs/common.c:173:39: sparse:     expected unsigned short [usertype] data
   drivers/usb/renesas_usbhs/common.c:173:39: sparse:     got restricted __le16 [usertype] wIndex
>> drivers/usb/renesas_usbhs/common.c:174:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] data @@     got restricted __le16 [usertype] wLength @@
   drivers/usb/renesas_usbhs/common.c:174:39: sparse:     expected unsigned short [usertype] data
   drivers/usb/renesas_usbhs/common.c:174:39: sparse:     got restricted __le16 [usertype] wLength
--
>> drivers/watchdog/zx2967_wdt.c:181:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *regmap @@     got struct regmap * @@
   drivers/watchdog/zx2967_wdt.c:181:16: sparse:     expected void [noderef] <asn:2> *regmap
   drivers/watchdog/zx2967_wdt.c:181:16: sparse:     got struct regmap *
>> drivers/watchdog/zx2967_wdt.c:187:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct regmap *map @@     got void [noderef] <asn:2> *regmap @@
   drivers/watchdog/zx2967_wdt.c:187:9: sparse:     expected struct regmap *map
   drivers/watchdog/zx2967_wdt.c:187:9: sparse:     got void [noderef] <asn:2> *regmap
--
   fs/compat_ioctl.c:602:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char *iomem_base @@     got void [noderef] <asn:1> * @@
   fs/compat_ioctl.c:602:28: sparse:     expected unsigned char *iomem_base
   fs/compat_ioctl.c:602:28: sparse:     got void [noderef] <asn:1> *
>> fs/compat_ioctl.c:613:21: sparse: sparse: Using plain integer as NULL pointer
--
>> kernel/dma/coherent.c:56:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *mem_base @@     got void * @@
   kernel/dma/coherent.c:56:18: sparse:     expected void [noderef] <asn:2> *mem_base
   kernel/dma/coherent.c:56:18: sparse:     got void *
>> kernel/dma/coherent.c:72:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *virt_base @@     got void [noderef] <asn:2> *mem_base @@
   kernel/dma/coherent.c:72:28: sparse:     expected void *virt_base
   kernel/dma/coherent.c:72:28: sparse:     got void [noderef] <asn:2> *mem_base
>> kernel/dma/coherent.c:85:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] <asn:2> *mem_base @@
   kernel/dma/coherent.c:85:26: sparse:     expected void *addr
   kernel/dma/coherent.c:85:26: sparse:     got void [noderef] <asn:2> *mem_base
--
   kernel/locking/rwsem-xadd.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:141:1: sparse: sparse: cast truncates bits from constant value (ffffffff00000000 becomes 0)
>> arch/arm64/include/asm/cmpxchg.h:141:1: sparse: sparse: cast truncates bits from constant value (ffffffff00000000 becomes 0)
>> arch/arm64/include/asm/cmpxchg.h:141:1: sparse: sparse: cast truncates bits from constant value (ffffffff00000000 becomes 0)
>> arch/arm64/include/asm/cmpxchg.h:141:1: sparse: sparse: cast truncates bits from constant value (ffffffff00000000 becomes 0)
--
>> lib/test_overflow.c:381:16: sparse: sparse: cast truncates bits from constant value (12c becomes 2c)
>> lib/test_overflow.c:383:16: sparse: sparse: cast truncates bits from constant value (1112c becomes 112c)
>> lib/test_overflow.c:385:16: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/test_overflow.c:386:16: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/test_overflow.c:403:16: sparse: sparse: cast truncates bits from constant value (12c becomes 2c)
   lib/test_overflow.c:405:16: sparse: sparse: cast truncates bits from constant value (1112c becomes 112c)
   lib/test_overflow.c:407:16: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
   lib/test_overflow.c:408:16: sparse: sparse: cast truncates bits from constant value (10811112c becomes 811112c)
>> lib/test_overflow.c:413:16: sparse: sparse: cast truncates bits from constant value (100 becomes 0)
   lib/test_overflow.c:415:16: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   lib/test_overflow.c:417:16: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   lib/test_overflow.c:418:16: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   In file included from include/linux/device.h:29,
                    from lib/test_overflow.c:7:
   lib/test_overflow.c: In function 'test_overflow_shift':
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        18-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 21-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:337:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     337 |         err |= TEST_ONE_SHIFT(1, 0, unsigned int, 1U << 0, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        27-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 30-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:338:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     338 |         err |= TEST_ONE_SHIFT(1, 20, unsigned int, 1U << 20, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        36-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 39-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:339:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     339 |         err |= TEST_ONE_SHIFT(1, 31, unsigned int, 1U << 31, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        45-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 48-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:340:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     340 |         err |= TEST_ONE_SHIFT(0xFFFFU, 16, unsigned int, 0xFFFFU << 16, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:43: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        54-      |                                           ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 57-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:340:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     340 |         err |= TEST_ONE_SHIFT(0xFFFFU, 16, unsigned int, 0xFFFFU << 16, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        63-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 66-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:341:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     341 |         err |= TEST_ONE_SHIFT(1, 0, u32, 1U << 0, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        72-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 75-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:342:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     342 |         err |= TEST_ONE_SHIFT(1, 20, u32, 1U << 20, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        81-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 84-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:343:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     343 |         err |= TEST_ONE_SHIFT(1, 31, u32, 1U << 31, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        90-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 93-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:344:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     344 |         err |= TEST_ONE_SHIFT(0xFFFFU, 16, u32, 0xFFFFU << 16, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:43: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        99-      |                                           ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
     302 |         bool __of = check_shl_overflow(__a, __s, &__d);                 102-      |                     ^~~~~~~~~~~~~~~~~~
   lib/test_overflow.c:344:16: note: in expansion of macro 'TEST_ONE_SHIFT'
     344 |         err |= TEST_ONE_SHIFT(0xFFFFU, 16, u32, 0xFFFFU << 16, false);
         |                ^~~~~~~~~~~~~~
   include/linux/overflow.h:232:33: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     232 |         (_to_shift != _s || *_d < 0 || _a < 0 ||                        108-      |                                 ^
   lib/test_overflow.c:302:21: note: in expansion of macro 'check_shl_overflow'
--
>> mm/kmemleak.c:920:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *ptr @@     got void const *ptr @@
   mm/kmemleak.c:920:39: sparse:     expected void const [noderef] <asn:3> *ptr
   mm/kmemleak.c:920:39: sparse:     got void const *ptr
>> mm/kmemleak.c:979:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *ptr @@     got void const [noderef] <asn:3> *ptr @@
   mm/kmemleak.c:979:50: sparse:     expected void const *ptr
   mm/kmemleak.c:979:50: sparse:     got void const [noderef] <asn:3> *ptr
   mm/kmemleak.c:1069:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *ptr @@     got void const [noderef] <asn:3> *ptr @@
   mm/kmemleak.c:1069:49: sparse:     expected void const *ptr
   mm/kmemleak.c:1069:49: sparse:     got void const [noderef] <asn:3> *ptr
>> mm/kmemleak.c:2061:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] <asn:3> *ptr @@     got void const *ptr @@
   mm/kmemleak.c:2061:49: sparse:     expected void const [noderef] <asn:3> *ptr
   mm/kmemleak.c:2061:49: sparse:     got void const *ptr
   mm/kmemleak.c:1685:13: sparse: sparse: context imbalance in 'kmemleak_seq_start' - different lock contexts for basic block
   mm/kmemleak.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h):
   include/linux/rcupdate.h:681:9: sparse: sparse: context imbalance in 'kmemleak_seq_stop' - unexpected unlock
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from mm/kmemleak.c:74:
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'kmemleak_disable' at mm/kmemleak.c:1958:6:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'int[1]' [-Warray-bounds=]
     259 |         asm volatile(                                                   28-      |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:291:1: note: in expansion of macro '__CMPXCHG_CASE'
     291 | __CMPXCHG_CASE(w,  ,  mb_4, dmb ish,  , l, "memory")
         | ^~~~~~~~~~~~~~
   mm/kmemleak.c: In function 'kmemleak_disable':
   mm/kmemleak.c:217:12: note: object 'kmemleak_error' of size 4
     217 | static int kmemleak_error;
         |            ^~~~~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'kmemleak_disable' at mm/kmemleak.c:1958:6:
   arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'int[1]' [-Warray-bounds=]
     259 |         asm volatile(                                                   41-      |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:291:1: note: in expansion of macro '__CMPXCHG_CASE'
     291 | __CMPXCHG_CASE(w,  ,  mb_4, dmb ish,  , l, "memory")
         | ^~~~~~~~~~~~~~
   mm/kmemleak.c: In function 'kmemleak_disable':
   mm/kmemleak.c:217:12: note: object 'kmemleak_error' of size 4
     217 | static int kmemleak_error;
         |            ^~~~~~~~~~~~~~
--
>> net/bridge/netfilter/ebtables.c:747:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned char [usertype] proto @@     got restricted __be16 [usertype] ethproto @@
   net/bridge/netfilter/ebtables.c:747:16: sparse:     expected unsigned char [usertype] proto
   net/bridge/netfilter/ebtables.c:747:16: sparse:     got restricted __be16 [usertype] ethproto
>> net/bridge/netfilter/ebtables.c:384:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned char [usertype] proto @@     got restricted __be16 const [usertype] ethproto @@
   net/bridge/netfilter/ebtables.c:384:16: sparse:     expected unsigned char [usertype] proto
   net/bridge/netfilter/ebtables.c:384:16: sparse:     got restricted __be16 const [usertype] ethproto
   net/bridge/netfilter/ebtables.c:421:16: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned char [usertype] proto @@     got restricted __be16 const [usertype] ethproto @@
   net/bridge/netfilter/ebtables.c:421:16: sparse:     expected unsigned char [usertype] proto
   net/bridge/netfilter/ebtables.c:421:16: sparse:     got restricted __be16 const [usertype] ethproto
   In file included from include/linux/netfilter/x_tables.h:9,
                    from net/bridge/netfilter/ebtables.c:21:
   net/bridge/netfilter/ebtables.c: In function 'do_update_counters.isra':
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:34: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                  ^
   In file included from net/bridge/netfilter/ebtables.c:22:
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:34: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                  ^
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:51: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                                   ^
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:51: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                                   ^
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
--
>> net/ceph/crypto.c:219:9: sparse: sparse: Variable length array is used.
   In file included from include/linux/ceph/ceph_fs.h:16,
                    from include/linux/ceph/types.h:11,
                    from include/linux/ceph/decode.h:11,
                    from net/ceph/crypto.c:16:
   include/linux/ceph/msgr.h:67:1: warning: alignment 1 of 'struct ceph_entity_addr' is less than 8 [-Wpacked-not-aligned]
      67 | } __attribute__ ((packed));
         | ^
--
>> net/dsa/legacy.c:474:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const *[assigned] sw_addr @@
   net/dsa/legacy.c:474:44: sparse:     expected restricted __be32 const [usertype] *p
   net/dsa/legacy.c:474:44: sparse:     got unsigned int const *[assigned] sw_addr
>> net/dsa/legacy.c:502:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const *[assigned] port_reg @@
   net/dsa/legacy.c:502:51: sparse:     expected restricted __be32 const [usertype] *p
   net/dsa/legacy.c:502:51: sparse:     got unsigned int const *[assigned] port_reg
--
>> net/dsa/tag_mtk.c:80:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] hdr @@     got unsigned short [usertype] @@
   net/dsa/tag_mtk.c:80:13: sparse:     expected restricted __be16 [usertype] hdr
   net/dsa/tag_mtk.c:80:13: sparse:     got unsigned short [usertype]
   net/dsa/tag_mtk.c:90:17: sparse: sparse: restricted __be16 degrades to integer
--
   net/dsa/tag_qca.c:59:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   net/dsa/tag_qca.c:59:15: sparse:     expected unsigned short [usertype]
   net/dsa/tag_qca.c:59:15: sparse:     got restricted __be16 [usertype]
>> net/dsa/tag_qca.c:79:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] hdr @@     got unsigned short [usertype] @@
   net/dsa/tag_qca.c:79:13: sparse:     expected restricted __be16 [usertype] hdr
   net/dsa/tag_qca.c:79:13: sparse:     got unsigned short [usertype]
   net/dsa/tag_qca.c:82:16: sparse: sparse: restricted __be16 degrades to integer
   net/dsa/tag_qca.c:92:17: sparse: sparse: restricted __be16 degrades to integer
--
>> net/netfilter/core.c:586:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got void ( *[noderef] <asn:4> * )( ... ) @@
   net/netfilter/core.c:586:26: sparse:     expected void const volatile *p
   net/netfilter/core.c:586:26: sparse:     got void ( *[noderef] <asn:4> * )( ... )
>> net/netfilter/core.c:586:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got void ( *[noderef] <asn:4> * )( ... ) @@
   net/netfilter/core.c:586:26: sparse:     expected void const volatile *p
   net/netfilter/core.c:586:26: sparse:     got void ( *[noderef] <asn:4> * )( ... )
   net/netfilter/core.c:586:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/core.c:586:26: sparse:    void ( [noderef] <asn:4> * )( ... )
   net/netfilter/core.c:586:26: sparse:    void ( * )( ... )
--
>> net/netfilter/nf_nat_core.c:707:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_nat_core.c:707:25: sparse:    struct nf_nat_l4proto const [noderef] <asn:4> *
   net/netfilter/nf_nat_core.c:707:25: sparse:    struct nf_nat_l4proto const *
   In file included from include/net/ip_tunnels.h:16,
                    from include/net/gre.h:6,
                    from include/linux/netfilter/nf_conntrack_proto_gre.h:5,
                    from include/net/netfilter/nf_conntrack.h:25,
                    from net/netfilter/nf_nat_core.c:22:
   In function 'net_generic',
       inlined from 'nf_nat_register_fn' at net/netfilter/nf_nat_core.c:908:28:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'nf_nat_register_fn':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'nf_nat_unregister_fn' at net/netfilter/nf_nat_core.c:986:28:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'nf_nat_unregister_fn':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
--
>> net/netfilter/nft_counter.c:158:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct nft_counter_percpu_priv [noderef] <asn:3> *priv @@     got struct nft_counter_percpu_priv *priv @@
   net/netfilter/nft_counter.c:158:35: sparse:     expected struct nft_counter_percpu_priv [noderef] <asn:3> *priv
   net/netfilter/nft_counter.c:158:35: sparse:     got struct nft_counter_percpu_priv *priv
>> net/netfilter/nft_counter.c:113:20: sparse: sparse: dereference of noderef expression
--
>> net/tls/tls_main.c:746:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t ( *static [addressable] [assigned] [toplevel] poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   net/tls/tls_main.c:746:31: sparse:     expected restricted __poll_t ( *static [addressable] [assigned] [toplevel] poll )( ... )
   net/tls/tls_main.c:746:31: sparse:     got unsigned int ( * )( ... )
--
>> net/tls/tls_sw.c:1302:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int ( *sk_poll )( ... ) @@     got restricted __poll_t ( *const poll )( ... ) @@
   net/tls/tls_sw.c:1302:36: sparse:     expected unsigned int ( *sk_poll )( ... )
   net/tls/tls_sw.c:1302:36: sparse:     got restricted __poll_t ( *const poll )( ... )
--
>> net/tls/tls_device.c:559:19: sparse: sparse: cast to restricted __be32
--
>> security/selinux/ss/ebitmap.c:389:28: sparse: sparse: cast to restricted __le32
>> security/selinux/ss/ebitmap.c:389:28: sparse: sparse: cast to restricted __le32
>> security/selinux/ss/ebitmap.c:389:28: sparse: sparse: cast to restricted __le32
>> security/selinux/ss/ebitmap.c:389:28: sparse: sparse: cast to restricted __le32
>> security/selinux/ss/ebitmap.c:389:28: sparse: sparse: cast to restricted __le32
>> security/selinux/ss/ebitmap.c:389:28: sparse: sparse: cast to restricted __le32
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
>> security/selinux/ss/ebitmap.c:431:23: sparse: sparse: cast to restricted __le64
--
>> security/smack/smack_lsm.c:2588:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] dport @@     got unsigned short [usertype] @@
   security/smack/smack_lsm.c:2588:27: sparse:     expected restricted __be16 [usertype] dport
   security/smack/smack_lsm.c:2588:27: sparse:     got unsigned short [usertype]
   security/smack/smack_lsm.c:4880:17: sparse: sparse: cast removes address space '<asn:4>' of expression
>> security/smack/smack_lsm.c:1845:50: sparse: sparse: dereference of noderef expression
>> security/smack/smack_lsm.c:1845:50: sparse: sparse: dereference of noderef expression
   security/smack/smack_lsm.c: In function 'smack_d_instantiate':
   security/smack/smack_lsm.c:3475:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3475 |                 final = &smack_known_star;
         |                 ~~~~~~^~~~~~~~~~~~~~~~~~~
   security/smack/smack_lsm.c:3484:9: note: here
    3484 |         default:
         |         ^~~~~~~
   security/smack/smack_lsm.c:398: warning: Function parameter or member 'mode' not described in 'smk_ptrace_mode'
   security/smack/smack_lsm.c:514: warning: Function parameter or member 'typefrom_file' not described in 'smack_syslog'
   security/smack/smack_lsm.c:514: warning: Excess function parameter 'type' description in 'smack_syslog'
   security/smack/smack_lsm.c:1279: warning: Function parameter or member 'path' not described in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1279: warning: Excess function parameter 'mnt' description in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1279: warning: Excess function parameter 'dentry' description in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1721: warning: Function parameter or member 'file' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1721: warning: Function parameter or member 'reqprot' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1721: warning: Function parameter or member 'prot' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1721: warning: Function parameter or member 'flags' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1939: warning: Excess function parameter 'cred' description in 'smack_file_open'
   security/smack/smack_lsm.c:1967: warning: Function parameter or member 'cred' not described in 'smack_cred_alloc_blank'
   security/smack/smack_lsm.c:1967: warning: Excess function parameter 'new' description in 'smack_cred_alloc_blank'
   security/smack/smack_lsm.c:2225: warning: Excess function parameter 'policy' description in 'smack_task_setscheduler'
   security/smack/smack_lsm.c:2225: warning: Excess function parameter 'lp' description in 'smack_task_setscheduler'
   security/smack/smack_lsm.c:2697: warning: Function parameter or member 'sk' not described in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2697: warning: Function parameter or member 'act' not described in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2697: warning: Excess function parameter 'sock' description in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:3110: warning: Function parameter or member 'ipc' not described in 'smack_shm_shmat'
   security/smack/smack_lsm.c:3110: warning: Excess function parameter 'isp' description in 'smack_shm_shmat'
--
   sound/core/pcm_native.c:591:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_state_t [usertype] state @@     got int state @@
   sound/core/pcm_native.c:591:51: sparse:     expected restricted snd_pcm_state_t [usertype] state
   sound/core/pcm_native.c:591:51: sparse:     got int state
   sound/core/pcm_native.c:756:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:756:38: sparse:     expected int state
   sound/core/pcm_native.c:756:38: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:768:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:768:38: sparse:     expected int state
   sound/core/pcm_native.c:768:38: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:817:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:817:38: sparse:     expected int state
   sound/core/pcm_native.c:817:38: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1227:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_state_t [usertype] state @@     got int state @@
   sound/core/pcm_native.c:1227:32: sparse:     expected restricted snd_pcm_state_t [usertype] state
   sound/core/pcm_native.c:1227:32: sparse:     got int state
   sound/core/pcm_native.c:1251:31: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:1251:31: sparse:     expected int state
   sound/core/pcm_native.c:1251:31: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1258:40: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:1258:40: sparse:     expected int state
   sound/core/pcm_native.c:1258:40: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1284:28: sparse: sparse: restricted snd_pcm_state_t degrades to integer
   sound/core/pcm_native.c:1286:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_state_t [usertype] state @@     got int state @@
   sound/core/pcm_native.c:1286:40: sparse:     expected restricted snd_pcm_state_t [usertype] state
   sound/core/pcm_native.c:1286:40: sparse:     got int state
   sound/core/pcm_native.c:1310:64: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] state @@
   sound/core/pcm_native.c:1310:64: sparse:     expected int state
   sound/core/pcm_native.c:1310:64: sparse:     got restricted snd_pcm_state_t [usertype] state
   sound/core/pcm_native.c:1326:38: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:1326:38: sparse:     expected int state
   sound/core/pcm_native.c:1326:38: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1700:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:1700:38: sparse:     expected int state
   sound/core/pcm_native.c:1700:38: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1766:61: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:1766:61: sparse:     expected int state
   sound/core/pcm_native.c:1766:61: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1767:63: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int state @@     got restricted snd_pcm_state_t [usertype] @@
   sound/core/pcm_native.c:1767:63: sparse:     expected int state
   sound/core/pcm_native.c:1767:63: sparse:     got restricted snd_pcm_state_t [usertype]
   sound/core/pcm_native.c:1784:76: sparse: sparse: incorrect type in initializer (different base types) @@     expected int new_state @@     got restricted snd_pcm_state_t @@
   sound/core/pcm_native.c:1784:76: sparse:     expected int new_state
   sound/core/pcm_native.c:1784:76: sparse:     got restricted snd_pcm_state_t
   sound/core/pcm_native.c:2105:26: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/pcm_native.c:2109:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [assigned] k @@
   sound/core/pcm_native.c:2109:54: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/pcm_native.c:2109:54: sparse:     got unsigned int [assigned] k
   sound/core/pcm_native.c:2127:26: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/pcm_native.c:2131:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [assigned] k @@
   sound/core/pcm_native.c:2131:54: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/pcm_native.c:2131:54: sparse:     got unsigned int [assigned] k
   sound/core/pcm_native.c:2311:30: sparse: sparse: restricted snd_pcm_access_t degrades to integer
   sound/core/pcm_native.c:2313:30: sparse: sparse: restricted snd_pcm_access_t degrades to integer
   sound/core/pcm_native.c:2316:38: sparse: sparse: restricted snd_pcm_access_t degrades to integer
   sound/core/pcm_native.c:2318:38: sparse: sparse: restricted snd_pcm_access_t degrades to integer
   sound/core/pcm_native.c:2320:38: sparse: sparse: restricted snd_pcm_access_t degrades to integer
   sound/core/pcm_native.c:2330:86: sparse: sparse: restricted snd_pcm_subformat_t degrades to integer
   sound/core/pcm_native.c: note: in included file:
>> sound/core/pcm_compat.c:226:13: sparse: sparse: incorrect type in initializer (different base types) @@     expected signed int __pu_val @@     got restricted snd_pcm_state_t [addressable] [assigned] [usertype] state @@
   sound/core/pcm_compat.c:226:13: sparse:     expected signed int __pu_val
   sound/core/pcm_compat.c:226:13: sparse:     got restricted snd_pcm_state_t [addressable] [assigned] [usertype] state
>> sound/core/pcm_compat.c:235:13: sparse: sparse: incorrect type in initializer (different base types) @@     expected signed int __pu_val @@     got restricted snd_pcm_state_t [addressable] [assigned] [usertype] suspended_state @@
   sound/core/pcm_compat.c:235:13: sparse:     expected signed int __pu_val
   sound/core/pcm_compat.c:235:13: sparse:     got restricted snd_pcm_state_t [addressable] [assigned] [usertype] suspended_state
>> sound/core/pcm_compat.c:525:13: sparse: sparse: incorrect type in initializer (different base types) @@     expected signed int __pu_val @@     got restricted snd_pcm_state_t [assigned] [usertype] state @@
   sound/core/pcm_compat.c:525:13: sparse:     expected signed int __pu_val
   sound/core/pcm_compat.c:525:13: sparse:     got restricted snd_pcm_state_t [assigned] [usertype] state
   sound/core/pcm_compat.c:528:13: sparse: sparse: incorrect type in initializer (different base types) @@     expected signed int __pu_val @@     got restricted snd_pcm_state_t [addressable] [assigned] [usertype] suspended_state @@
   sound/core/pcm_compat.c:528:13: sparse:     expected signed int __pu_val
   sound/core/pcm_compat.c:528:13: sparse:     got restricted snd_pcm_state_t [addressable] [assigned] [usertype] suspended_state
   sound/core/pcm_native.c:128:9: sparse: sparse: context imbalance in '__snd_pcm_stream_lock_mode' - different lock contexts for basic block
   sound/core/pcm_native.c:138:28: sparse: sparse: context imbalance in '__snd_pcm_stream_unlock_mode' - unexpected unlock
   sound/core/pcm_native.c:1098:52: sparse: sparse: context imbalance in 'snd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c: In function 'constrain_mask_params':
   sound/core/pcm_native.c:285:25: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     285 |         struct snd_mask old_mask;
         |                         ^~~~~~~~
   sound/core/pcm_native.c: In function 'constrain_interval_params':
   sound/core/pcm_native.c:321:29: warning: variable 'old_interval' set but not used [-Wunused-but-set-variable]
     321 |         struct snd_interval old_interval;
         |                             ^~~~~~~~~~~~
   sound/core/pcm_native.c: In function 'constrain_params_by_rules':
   sound/core/pcm_native.c:362:29: warning: variable 'old_interval' set but not used [-Wunused-but-set-variable]
     362 |         struct snd_interval old_interval;
         |                             ^~~~~~~~~~~~
   sound/core/pcm_native.c:361:25: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     361 |         struct snd_mask old_mask;
         |                         ^~~~~~~~
   sound/core/pcm_native.c: In function 'snd_pcm_hw_params_choose':
   sound/core/pcm_native.c:633:29: warning: variable 'old_interval' set but not used [-Wunused-but-set-variable]
     633 |         struct snd_interval old_interval;
         |                             ^~~~~~~~~~~~
   sound/core/pcm_native.c:632:25: warning: variable 'old_mask' set but not used [-Wunused-but-set-variable]
     632 |         struct snd_mask old_mask;
         |                         ^~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/poll.h:12,
                    from include/sound/info.h:25,
                    from sound/core/pcm_native.c:33:
   sound/core/pcm_compat.c: In function 'snd_pcm_status_user_compat':
   sound/core/pcm_compat.c:218:33: warning: taking address of packed member of 'struct snd_pcm_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
     218 |                                 (u32 __user *)(&src->audio_tstamp_data)))
   arch/arm64/include/asm/uaccess.h:311:43: note: in definition of macro '__get_user_check'
     311 |         __typeof__(*(ptr)) __user *__p = (ptr);                         105-      |                                           ^~~
   arch/arm64/include/asm/uaccess.h:334:25: note: in expansion of macro '__get_user'
     334 | #define get_user        __get_user
         |                         ^~~~~~~~~~
   sound/core/pcm_compat.c:217:20: note: in expansion of macro 'get_user'
     217 |         if (ext && get_user(status.audio_tstamp_data,
         |                    ^~~~~~~~
   sound/core/pcm_compat.c:226:36: warning: taking address of packed member of 'struct snd_pcm_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
     226 |         if (put_user(status.state, &src->state) ||
   arch/arm64/include/asm/uaccess.h:380:43: note: in definition of macro '__put_user_check'
     380 |         __typeof__(*(ptr)) __user *__p = (ptr);                         116-      |                                           ^~~
   arch/arm64/include/asm/uaccess.h:403:25: note: in expansion of macro '__put_user'
     403 | #define put_user        __put_user
         |                         ^~~~~~~~~~
   sound/core/pcm_compat.c:226:13: note: in expansion of macro 'put_user'
     226 |         if (put_user(status.state, &src->state) ||
         |             ^~~~~~~~
   sound/core/pcm_compat.c:229:39: warning: taking address of packed member of 'struct snd_pcm_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
     229 |             put_user(status.appl_ptr, &src->appl_ptr) ||
   arch/arm64/include/asm/uaccess.h:380:43: note: in definition of macro '__put_user_check'
     380 |         __typeof__(*(ptr)) __user *__p = (ptr);                         127-      |                                           ^~~
   arch/arm64/include/asm/uaccess.h:403:25: note: in expansion of macro '__put_user'
     403 | #define put_user        __put_user
         |                         ^~~~~~~~~~
   sound/core/pcm_compat.c:229:13: note: in expansion of macro 'put_user'
     229 |             put_user(status.appl_ptr, &src->appl_ptr) ||
         |             ^~~~~~~~
   sound/core/pcm_compat.c:230:37: warning: taking address of packed member of 'struct snd_pcm_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
     230 |             put_user(status.hw_ptr, &src->hw_ptr) ||
   arch/arm64/include/asm/uaccess.h:380:43: note: in definition of macro '__put_user_check'
     380 |         __typeof__(*(ptr)) __user *__p = (ptr);                         138-      |                                           ^~~
   arch/arm64/include/asm/uaccess.h:403:25: note: in expansion of macro '__put_user'
     403 | #define put_user        __put_user
         |                         ^~~~~~~~~~
   sound/core/pcm_compat.c:230:13: note: in expansion of macro 'put_user'
     230 |             put_user(status.hw_ptr, &src->hw_ptr) ||
         |             ^~~~~~~~
   sound/core/pcm_compat.c:231:36: warning: taking address of packed member of 'struct snd_pcm_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
     231 |             put_user(status.delay, &src->delay) ||
   arch/arm64/include/asm/uaccess.h:380:43: note: in definition of macro '__put_user_check'
     380 |         __typeof__(*(ptr)) __user *__p = (ptr);                         149-      |                                           ^~~
   arch/arm64/include/asm/uaccess.h:403:25: note: in expansion of macro '__put_user'
     403 | #define put_user        __put_user
         |                         ^~~~~~~~~~
   sound/core/pcm_compat.c:231:13: note: in expansion of macro 'put_user'
     231 |             put_user(status.delay, &src->delay) ||
         |             ^~~~~~~~
   sound/core/pcm_compat.c:232:36: warning: taking address of packed member of 'struct snd_pcm_status32' may result in an unaligned pointer value [-Waddress-of-packed-member]
     232 |             put_user(status.avail, &src->avail) ||
   arch/arm64/include/asm/uaccess.h:380:43: note: in definition of macro '__put_user_check'
     380 |         __typeof__(*(ptr)) __user *__p = (ptr);                         160-      |                                           ^~~
   arch/arm64/include/asm/uaccess.h:403:25: note: in expansion of macro '__put_user'
     403 | #define put_user        __put_user
         |                         ^~~~~~~~~~
   sound/core/pcm_compat.c:232:13: note: in expansion of macro 'put_user'
     232 |             put_user(status.avail, &src->avail) ||
--
>> sound/soc/codecs/rt5645.c:680:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short reg @@     got restricted __be16 [usertype] @@
   sound/soc/codecs/rt5645.c:680:33: sparse:     expected unsigned short reg
   sound/soc/codecs/rt5645.c:680:33: sparse:     got restricted __be16 [usertype]
>> sound/soc/codecs/rt5645.c:681:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short val @@     got restricted __be16 [usertype] @@
   sound/soc/codecs/rt5645.c:681:33: sparse:     expected unsigned short val
   sound/soc/codecs/rt5645.c:681:33: sparse:     got restricted __be16 [usertype]
>> sound/soc/codecs/rt5645.c:706:35: sparse: sparse: cast to restricted __be16
   sound/soc/codecs/rt5645.c:707:35: sparse: sparse: cast to restricted __be16
   sound/soc/codecs/rt5645.c:1623:38: warning: 'rt5645_if3_adc_in_mux' defined but not used [-Wunused-const-variable=]
    1623 | static const struct snd_kcontrol_new rt5645_if3_adc_in_mux =
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt5645.c:1312:38: warning: 'rt5645_inr_mux' defined but not used [-Wunused-const-variable=]
    1312 | static const struct snd_kcontrol_new rt5645_inr_mux =
         |                                      ^~~~~~~~~~~~~~
   sound/soc/codecs/rt5645.c:1301:38: warning: 'rt5645_inl_mux' defined but not used [-Wunused-const-variable=]
    1301 | static const struct snd_kcontrol_new rt5645_inl_mux =
         |                                      ^~~~~~~~~~~~~~

vim +1379 arch/arm64/kernel/ptrace.c

478fcb2cdb2351 Will Deacon 2012-03-05  1362  
478fcb2cdb2351 Will Deacon 2012-03-05  1363  static int compat_ptrace_write_user(struct task_struct *tsk, compat_ulong_t off,
478fcb2cdb2351 Will Deacon 2012-03-05  1364  				    compat_ulong_t val)
478fcb2cdb2351 Will Deacon 2012-03-05  1365  {
478fcb2cdb2351 Will Deacon 2012-03-05  1366  	int ret;
c168870704bcde Will Deacon 2014-06-02  1367  	mm_segment_t old_fs = get_fs();
478fcb2cdb2351 Will Deacon 2012-03-05  1368  
478fcb2cdb2351 Will Deacon 2012-03-05  1369  	if (off & 3 || off >= COMPAT_USER_SZ)
478fcb2cdb2351 Will Deacon 2012-03-05  1370  		return -EIO;
478fcb2cdb2351 Will Deacon 2012-03-05  1371  
478fcb2cdb2351 Will Deacon 2012-03-05  1372  	if (off >= sizeof(compat_elf_gregset_t))
478fcb2cdb2351 Will Deacon 2012-03-05  1373  		return 0;
478fcb2cdb2351 Will Deacon 2012-03-05  1374  
c168870704bcde Will Deacon 2014-06-02  1375  	set_fs(KERNEL_DS);
478fcb2cdb2351 Will Deacon 2012-03-05  1376  	ret = copy_regset_from_user(tsk, &user_aarch32_view,
478fcb2cdb2351 Will Deacon 2012-03-05  1377  				    REGSET_COMPAT_GPR, off,
478fcb2cdb2351 Will Deacon 2012-03-05  1378  				    sizeof(compat_ulong_t),
478fcb2cdb2351 Will Deacon 2012-03-05 @1379  				    &val);
c168870704bcde Will Deacon 2014-06-02  1380  	set_fs(old_fs);
c168870704bcde Will Deacon 2014-06-02  1381  
478fcb2cdb2351 Will Deacon 2012-03-05  1382  	return ret;
478fcb2cdb2351 Will Deacon 2012-03-05  1383  }
478fcb2cdb2351 Will Deacon 2012-03-05  1384  

:::::: The code at line 1379 was first introduced by commit
:::::: 478fcb2cdb2351dcfc3fb23f42d76f4436ee4149 arm64: Debugging support

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
