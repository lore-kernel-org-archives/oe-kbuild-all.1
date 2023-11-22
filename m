Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AE56B7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcx1R/O6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667988; x=1732203988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85wZv1X/UhJkJ2xfnh3X150OgDs1AY6/1M+ePL9r8mE=;
  b=fcx1R/O6e5Iya9uB05lQ584vGe+6NCd+lWitMmJsMPpnz7HI8OIwnvR0
   8ONdFoU2550hAwZqKCVNY/lEf6HvziAIbLK/7LOyauJ4iLwlE10df6OoD
   k+ucUrdIQLNPUUHVN8kW02d7pdpulG/x1BJpTNECgTAYA9hWwDAB/2GEL
   AZOlS50W/yRj0XK3BklQVYYxvLqVQCJbpM75PFWGnFlNm9qURSBRDogEE
   awR0Usf5U3x8b2vO6dWd0k8qGwOXd4NtiKx0Ws1nWxQnkFoAElSP/79Lv
   vB2OIPJifZCfaens3/j8mDQCDQeoqchZeEd42du51MZV5b7TAR6t/5LEe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5279486"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5279486"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837464090"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="837464090"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2023 07:46:25 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQk-0000dQ-2r;
	Wed, 22 Nov 2023 15:46:22 +0000
Date: Wed, 22 Nov 2023 23:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24/30]
 drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
Message-ID: <202311222210.G5HvVSUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   405b0c3781aa200f4b3bc1dc61d352f61544568d
commit: adc2b4c6af434db264d6e58e740fca5ae876df86 [24/30] CHROMIUM: BACKPORT: FROMLIST: cpufreq: add kvm-cpufreq driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311222210.G5HvVSUn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222210.G5HvVSUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222210.G5HvVSUn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
           arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
           ^
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:387:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r0 asm("r0");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:388:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r1 asm("r1");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:389:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r2 asm("r2");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:390:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r3 asm("r3");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:226:1: note: expanded from here
   __declare_arg_1
   ^
   include/linux/arm-smccc.h:331:34: note: expanded from macro '__declare_arg_1'
           register unsigned long arg0 asm("r0") = (u32)a0;                        \
                                           ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:226:1: note: expanded from here
   __declare_arg_1
   ^
   include/linux/arm-smccc.h:332:31: note: expanded from macro '__declare_arg_1'
           register typeof(a1) arg1 asm("r1") = __a1
                                        ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: expected string literal in 'asm'
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:48: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                                   ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:387:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r0 asm("r0");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:388:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r1 asm("r1");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:389:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r2 asm("r2");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r3' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:390:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r3 asm("r3");                    \
                                                 ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:228:1: note: expanded from here
   __declare_arg_1
   ^
   include/linux/arm-smccc.h:331:34: note: expanded from macro '__declare_arg_1'
           register unsigned long arg0 asm("r0") = (u32)a0;                        \
                                           ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:32: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:391:3: note: expanded from macro '__arm_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:228:1: note: expanded from here
   __declare_arg_1
   ^
   include/linux/arm-smccc.h:332:31: note: expanded from macro '__declare_arg_1'
           register typeof(a1) arg1 asm("r1") = __a1
                                        ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: expected string literal in 'asm'
   include/linux/arm-smccc.h:466:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_smc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:413:48: note: expanded from macro 'arm_smccc_1_1_smc'
   #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
                                                   ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r0' in asm
   include/linux/arm-smccc.h:469:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           __fail_smccc_1_1(__VA_ARGS__);                  \
                           ^
   include/linux/arm-smccc.h:438:3: note: expanded from macro '__fail_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   include/linux/arm-smccc.h:373:37: note: expanded from macro '__declare_args'
   #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
                                       ^
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:230:1: note: expanded from here
   __declare_arg_1
   ^
   include/linux/arm-smccc.h:331:34: note: expanded from macro '__declare_arg_1'
           register unsigned long arg0 asm("r0") = (u32)a0;                        \
                                           ^
>> drivers/cpufreq/kvm-cpufreq.c:23:2: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:469:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           __fail_smccc_1_1(__VA_ARGS__);                  \
                           ^
   include/linux/arm-smccc.h:438:3: note: expanded from macro '__fail_smccc_1_1'
                   __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
                   ^
   include/linux/arm-smccc.h:373:37: note: expanded from macro '__declare_args'
   #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
                                       ^
   include/linux/arm-smccc.h:372:37: note: expanded from macro '___declare_args'
   #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
                                       ^
   <scratch space>:230:1: note: expanded from here
   __declare_arg_1
   ^
   include/linux/arm-smccc.h:332:31: note: expanded from macro '__declare_arg_1'
           register typeof(a1) arg1 asm("r1") = __a1
                                        ^
   drivers/cpufreq/kvm-cpufreq.c:50:3: error: unknown register name 'r0' in asm
                   arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
                   ^
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:387:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r0 asm("r0");                    \
                                                 ^
   drivers/cpufreq/kvm-cpufreq.c:50:3: error: unknown register name 'r1' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:388:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r1 asm("r1");                    \
                                                 ^
   drivers/cpufreq/kvm-cpufreq.c:50:3: error: unknown register name 'r2' in asm
   include/linux/arm-smccc.h:463:4: note: expanded from macro 'arm_smccc_1_1_invoke'
                           arm_smccc_1_1_hvc(__VA_ARGS__);                 \
                           ^
   include/linux/arm-smccc.h:429:32: note: expanded from macro 'arm_smccc_1_1_hvc'
   #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
                                   ^
   include/linux/arm-smccc.h:389:33: note: expanded from macro '__arm_smccc_1_1'
                   register unsigned long r2 asm("r2");                    \
                                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/r0 +23 drivers/cpufreq/kvm-cpufreq.c

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
