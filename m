Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41B3D9E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727631345; cv=none; b=kMpTaSoHzqcLxuSx7OEpWtDTerOhjy/psREq/Oz8pRDq9qUTEDmzPP/CgZ8QjFBFIjJNO6MnDlWsriNZQG5jn543IZQPn+GZqMA0MjptGnjDbhcjYHDFQljV3vmQYbGARZ1VF5aY7aZkp2MQnOYUwvO9swndI4CyX9RHz9XQ//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727631345; c=relaxed/simple;
	bh=OZAkstR8eGO4+nypKtz5B9u+UOTktALzwg0srjWed3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k20fDHBB815pdEzjr8vUFMW2+WfglPDLicNyuAIOn+AxYaAVpG4M5Zy76tNTmZwBwAe1hgpwAPRzjaZ8OtLOBSsKDoWsXklRyrO1Hhyb4FnT/SYGrnMzVERc2DIbojq2+59xTxpT3iwIBPj8r3D9mEYoCS3j9yT90YwPECZI2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjujVmI1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjujVmI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727631343; x=1759167343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZAkstR8eGO4+nypKtz5B9u+UOTktALzwg0srjWed3k=;
  b=ZjujVmI1mrVSHOlSg/UwMeaj7BL0j7aJGAYIdTWoeN4NSFfDP1CKy4tP
   LmdnR1R8+6k5bSfh6jz7aQnlwu1qIFjpIUjuQNPAwVdVgzkfqnbLi8pvQ
   Y6icQ6F9/LUE1FFOsjN5kemASctXEsRlYX19ovksGx5lMkrj/pFVk1hWD
   5NSQo9DuVB6eU6HgyCIXOMw4eJUz1w7aZvlNn/loca6a/ddNP1v4xQlL4
   6eeytnfv5wQxOtLNQd1i5C478+TMx65Oj/kRkDwEtSJ9YJbwGMNUR88/N
   3dUvIaBIv/nlRLVSjb084O1sVBd1tcnHuFyJ1ykcBNJHG1lkdz2wJiF3+
   Q==;
X-CSE-ConnectionGUID: UfCPvo2WTwWq/8DUmsNVBA==
X-CSE-MsgGUID: lsKXkUYIT5mrY8gPh1D6Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26596740"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26596740"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:35:42 -0700
X-CSE-ConnectionGUID: xwHqrh/XSLGEhq2aYiY8fA==
X-CSE-MsgGUID: Xl6pl6OKRnGavYMm0Ua/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77150288"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Sep 2024 10:35:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxpa-000OVt-2d;
	Sun, 29 Sep 2024 17:35:38 +0000
Date: Mon, 30 Sep 2024 01:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16089/30000]
 arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable
 for global register variables on this target
Message-ID: <202409300131.UCq7Om7a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0988d5e5eb47d35a2babb4c0d6b6b81aa0fccbd3
commit: 78568d28ad62c586e32e3989de5354fcb014c09f [16089/30000] scripts: Fix issue of module signing with openssl 3.x
config: arm64-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300131.UCq7Om7a-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300131.UCq7Om7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300131.UCq7Om7a-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: AARCH32_EL0 [=n]
   Selected by [y]:
   - ARCH_MXC [=y] && COMPAT [=y]
   arch/arm64/Makefile:44: Detected assembler with broken .inst; disassembly will be unreliable
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:102:
   In file included from include/linux/preempt.h:78:
   In file included from arch/arm64/include/asm/preempt.h:5:
   In file included from include/linux/thread_info.h:14:
   In file included from include/linux/thread_bits.h:32:
   In file included from arch/arm64/include/asm/thread_info.h:18:
>> arch/arm64/include/asm/stack_pointer.h:8:51: error: register 'sp' unsuitable for global register variables on this target
   register unsigned long current_stack_pointer asm ("sp");
   ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
   ^
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r0 asm("r0");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r1 asm("r1");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r2 asm("r2");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:372:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r3 asm("r3");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:373:3: note: expanded from macro '__arm_smccc_1_1'
   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
   ^
   <scratch space>:110:1: note: expanded from here
   __declare_arg_0
   ^
   include/linux/arm-smccc.h:308:34: note: expanded from macro '__declare_arg_0'
   register unsigned long arg0 asm("r0") = (u32)a0
   ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_smc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r0 asm("r0");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_smc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r1 asm("r1");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_smc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r2 asm("r2");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_smc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:372:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r3 asm("r3");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:449:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_smc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:396:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:373:3: note: expanded from macro '__arm_smccc_1_1'
   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
   ^
   <scratch space>:112:1: note: expanded from here
   __declare_arg_0
   ^
   include/linux/arm-smccc.h:308:34: note: expanded from macro '__declare_arg_0'
   register unsigned long arg0 asm("r0") = (u32)a0
   ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
>> arch/arm64/include/asm/archrandom.h:20:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:452:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   __fail_smccc_1_1(__VA_ARGS__);                                          ^
   include/linux/arm-smccc.h:421:3: note: expanded from macro '__fail_smccc_1_1'
   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);                 ^
   include/linux/arm-smccc.h:355:37: note: expanded from macro '__declare_args'
   #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:354:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
   ^
   <scratch space>:114:1: note: expanded from here
   __declare_arg_0
   ^
   include/linux/arm-smccc.h:308:34: note: expanded from macro '__declare_arg_0'
   register unsigned long arg0 asm("r0") = (u32)a0
   ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r0' in asm
   arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
   ^
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:369:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r0 asm("r0");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:370:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r1 asm("r1");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'
   arm_smccc_1_1_hvc(__VA_ARGS__);                                         ^
   include/linux/arm-smccc.h:412:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
   ^
   include/linux/arm-smccc.h:371:33: note: expanded from macro '__arm_smccc_1_1'
   register unsigned long r2 asm("r2");                                                                  ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:21:
   In file included from include/linux/sysfs.h:17:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/mutex.h:19:
   In file included from arch/arm64/include/asm/processor.h:38:
   In file included from arch/arm64/include/asm/pointer_auth.h:6:
   In file included from include/linux/random.h:104:
   arch/arm64/include/asm/archrandom.h:66:3: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:446:4: note: expanded from macro 'arm_smccc_1_1_invoke'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: AARCH32_EL0 [=n]
   Selected by [y]:
   - ARCH_MXC [=y] && COMPAT [=y]


vim +/sp +8 arch/arm64/include/asm/stack_pointer.h

a9ea0017ebe888 Mark Rutland 2016-11-03  4  
a9ea0017ebe888 Mark Rutland 2016-11-03  5  /*
a9ea0017ebe888 Mark Rutland 2016-11-03  6   * how to get the current stack pointer from C
a9ea0017ebe888 Mark Rutland 2016-11-03  7   */
a9ea0017ebe888 Mark Rutland 2016-11-03 @8  register unsigned long current_stack_pointer asm ("sp");
a9ea0017ebe888 Mark Rutland 2016-11-03  9  

:::::: The code at line 8 was first introduced by commit
:::::: a9ea0017ebe8889dfa136cac2aa7ae0ee6915e1f arm64: factor out current_stack_pointer

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
