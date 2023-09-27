Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058C30FA0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695847774; x=1727383774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fi6UUGRMC8fO+4LJqJSJr4wrO+TeaxRkTg0YB8CZy6w=;
  b=XCBKYaoEXjn8OAMCv6WxEQejhDn+Hgx4i1NJ6LXWi1EB7aEm7CG+cp1v
   JluzgF7uAJ91HKdn3/ojXM/hj60oLZ5hD8PQ2hgFfZSUTN+R19VALKv9f
   3JUxtV/vRmVnM4nvK0luUXF4yQsRthTzK4XuKc3bkPtekD9n0c1E+nx3F
   DE3Ms+jyrG/0ubIX6q8j93aNMyKVNcSGG+KMuwdmwXQ4NRpTGWr62vRzJ
   GsTa1N/Ef14L/KKi2K/H82/xMPzcjZ8iibRnjDrn/HHcM0t/qLL79e5bj
   06IV6PIl46BiuMOo4gXXK+lQn9VsCIt4XsNey5K94Jajq9xgOrOIgw0/P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384720407"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="384720407"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873045292"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="873045292"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 13:49:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlbTN-0000fF-2o;
	Wed, 27 Sep 2023 20:49:29 +0000
Date: Thu, 28 Sep 2023 04:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24/30]
 drivers/cpufreq/kvm-cpufreq.c:101:20: error: implicit declaration of
 function 'sched_cpu_util_freq'
Message-ID: <202309280436.j4lX5SqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   3ec3b19f2cfd36ac8d8188c411844daa94192ac4
commit: adc2b4c6af434db264d6e58e740fca5ae876df86 [24/30] CHROMIUM: BACKPORT: FROMLIST: cpufreq: add kvm-cpufreq driver
config: i386-randconfig-054-20230928 (https://download.01.org/0day-ci/archive/20230928/202309280436.j4lX5SqS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280436.j4lX5SqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280436.j4lX5SqS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'kvm_cpufreq_setutil_hyp':
>> drivers/cpufreq/kvm-cpufreq.c:101:20: error: implicit declaration of function 'sched_cpu_util_freq' [-Werror=implicit-function-declaration]
     101 |         u32 util = sched_cpu_util_freq(policy->cpu);
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:429:33: note: in expansion of macro '__arm_smccc_1_1'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
     332 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:413:33: note: in expansion of macro '__arm_smccc_1_1'
     413 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:466:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     466 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
     331 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:372:37: note: in expansion of macro '__declare_arg_1'
     372 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:373:37: note: in expansion of macro '___declare_args'
     373 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:391:17: note: in expansion of macro '__declare_args'
     391 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \


vim +/sched_cpu_util_freq +101 drivers/cpufreq/kvm-cpufreq.c

    97	
    98	static unsigned int kvm_cpufreq_setutil_hyp(struct cpufreq_policy *policy)
    99	{
   100		struct arm_smccc_res hvc_res;
 > 101		u32 util = sched_cpu_util_freq(policy->cpu);
   102		u32 cap = arch_scale_cpu_capacity(policy->cpu);
   103		u32 threshold = cap - (cap >> 2);
   104	
   105		if (util > threshold)
   106			util = (cap + threshold) >> 1;
   107	
   108		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
   109				     util, &hvc_res);
   110	
   111		return hvc_res.a0;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
