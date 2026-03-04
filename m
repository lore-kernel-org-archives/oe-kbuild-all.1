Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331613093D3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591773; cv=none; b=OZfYTFEdA2GeAZHB6tevESCFxBZtUT0FAcCmeMpkyQ+mLaWu/QcSdHaXY+Oh3Pb7HPqhn7kXeWH8WAQj9j6JtGAIKlARTmJvJzD7o+iJMkAI5w7cXOLCl2F0yRkm+3f1Mbe8OW5ArTu8rr7blTLYhnuEPQ8OVnlyaSUUdopd42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591773; c=relaxed/simple;
	bh=wbnnnzFZ8oUa+iP6iAdUQHwOo7MX8JpQ1Y0JLcLsbDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mqatVs3Gp02HjdIkrD1WuXHORxlMY/X9Ecdr+PGjEGgmVsxCzEKlUIDbP97ijeYh7W2CvCpxMbMdmJQokRRhd/22mQ4m+aajHlquUkovRscRzuBtUSQMD/QoGppjAEirXpA8T9zD8gzb6x7QJ3MSKVX1SlUIrarcJYUe+4VB5ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRsMwIo5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRsMwIo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772591770; x=1804127770;
  h=date:from:to:cc:subject:message-id;
  bh=wbnnnzFZ8oUa+iP6iAdUQHwOo7MX8JpQ1Y0JLcLsbDM=;
  b=LRsMwIo5TXA+j6xihyE5AdgczAGw1pC3Jd3MY9ROmkLytf1zoxnbjt9+
   mNPBxzqiCrQiz5qNSq5gu7cCJZ9vfJh28lUv1kB+SHzJ3aIepE2JXyc9q
   AUSeBlWIXba5ux8tuBUhhTEZx1OWE+oLYU+HgoEtfMxsakHffTlPZq6SV
   kBFQn5cK3TPkwI6Cncye6xSCky0JEn63q7qX5et6KoCKjxhLreqkAbOfE
   eIM+FWBNUnJ8OTYDdChXzCc3zXns7GCjHt69shCgh30zVSO1LOevKWQwK
   4ic6UrDAqb7TtZYjmoP0JMOBamDBPLYsEST862obnFg/RPMYfqfxzWw6y
   Q==;
X-CSE-ConnectionGUID: CcNSf9VRRoSoirwO8CDetg==
X-CSE-MsgGUID: 9cpgfGuoQqycD/T0xJ3XIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77513462"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="77513462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 18:36:09 -0800
X-CSE-ConnectionGUID: 7gwV+L+tSk6fWBmyWWOGtw==
X-CSE-MsgGUID: yxY+dOGdS2SO0TtgK54mnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="222679318"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2026 18:36:07 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxc5k-0000000038T-418S;
	Wed, 04 Mar 2026 02:36:04 +0000
Date: Wed, 04 Mar 2026 10:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6/6]
 drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
Message-ID: <202603041028.3rnM0Uia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8426c769398ef6f4ac3f61df3f3ec10bd11b0e50
commit: adc2b4c6af434db264d6e58e740fca5ae876df86 [6/6] CHROMIUM: BACKPORT: FROMLIST: cpufreq: add kvm-cpufreq driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260304/202603041028.3rnM0Uia-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041028.3rnM0Uia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041028.3rnM0Uia-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:387:33: note: expanded from macro '__arm_smccc_1_1'
     387 |                 register unsigned long r0 asm("r0");                    \
         |                                               ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:388:33: note: expanded from macro '__arm_smccc_1_1'
     388 |                 register unsigned long r1 asm("r1");                    \
         |                                               ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:389:33: note: expanded from macro '__arm_smccc_1_1'
     389 |                 register unsigned long r2 asm("r2");                    \
         |                                               ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:390:33: note: expanded from macro '__arm_smccc_1_1'
     390 |                 register unsigned long r3 asm("r3");                    \
         |                                               ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:228:1: note: expanded from here
     228 | __declare_arg_1
         | ^
   include/linux/arm-smccc.h:331:34: note: expanded from macro '__declare_arg_1'
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                         ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:228:1: note: expanded from here
     228 | __declare_arg_1
         | ^
   include/linux/arm-smccc.h:332:31: note: expanded from macro '__declare_arg_1'
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                                      ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: expected string literal in 'asm'
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:48: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:387:33: note: expanded from macro '__arm_smccc_1_1'
     387 |                 register unsigned long r0 asm("r0");                    \
         |                                               ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:388:33: note: expanded from macro '__arm_smccc_1_1'
     388 |                 register unsigned long r1 asm("r1");                    \
         |                                               ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:389:33: note: expanded from macro '__arm_smccc_1_1'
     389 |                 register unsigned long r2 asm("r2");                    \
         |                                               ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:390:33: note: expanded from macro '__arm_smccc_1_1'
     390 |                 register unsigned long r3 asm("r3");                    \
         |                                               ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:230:1: note: expanded from here
     230 | __declare_arg_1
         | ^
   include/linux/arm-smccc.h:331:34: note: expanded from macro '__declare_arg_1'
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                         ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:230:1: note: expanded from here
     230 | __declare_arg_1
         | ^
   include/linux/arm-smccc.h:332:31: note: expanded from macro '__declare_arg_1'
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                                      ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: expected string literal in 'asm'
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:413:48: note: expanded from macro 'arm_smccc_1_1_smc'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^
   drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:469:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     469 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:438:3: note: expanded from macro '__fail_smccc_1_1'
     438 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   include/linux/arm-smccc.h:373:37: note: expanded from macro '__declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:232:1: note: expanded from here
     232 | __declare_arg_1
         | ^
   include/linux/arm-smccc.h:331:34: note: expanded from macro '__declare_arg_1'
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                         ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:469:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     469 |                         __fail_smccc_1_1(__VA_ARGS__);                  \
         |                         ^
   include/linux/arm-smccc.h:438:3: note: expanded from macro '__fail_smccc_1_1'
     438 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^
   include/linux/arm-smccc.h:373:37: note: expanded from macro '__declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^
   <scratch space>:232:1: note: expanded from here
     232 | __declare_arg_1
         | ^
   include/linux/arm-smccc.h:332:31: note: expanded from macro '__declare_arg_1'
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                                      ^
   drivers/cpufreq/kvm-cpufreq.c:50:3: error: unknown register name 'r0' in asm
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:387:33: note: expanded from macro '__arm_smccc_1_1'
     387 |                 register unsigned long r0 asm("r0");                    \
         |                                               ^
   drivers/cpufreq/kvm-cpufreq.c:50:3: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:388:33: note: expanded from macro '__arm_smccc_1_1'
     388 |                 register unsigned long r1 asm("r1");                    \
         |                                               ^
   drivers/cpufreq/kvm-cpufreq.c:50:3: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^
   include/linux/arm-smccc.h:389:33: note: expanded from macro '__arm_smccc_1_1'
     389 |                 register unsigned long r2 asm("r2");                    \
         |                                               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/r1 +23 drivers/cpufreq/kvm-cpufreq.c

    17	
    18	static void kvm_scale_freq_tick(void)
    19	{
    20		unsigned long scale, cur_freq, max_freq;
    21		struct arm_smccc_res hvc_res;
    22	
  > 23		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
    24				0, &hvc_res);
    25	
    26		cur_freq = hvc_res.a0;
    27		max_freq = cpufreq_get_hw_max_freq(task_cpu(current));
    28		scale = (cur_freq << SCHED_CAPACITY_SHIFT) / max_freq;
    29	
    30		this_cpu_write(freq_scale, (unsigned long)scale);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
