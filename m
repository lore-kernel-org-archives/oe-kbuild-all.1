Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28602364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683709286; x=1715245286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLVmEFnRXxgRq32O2/3FR/+wMDyTCdxPF9VGOR76Guk=;
  b=D+DpMehAdrIgfxiotUy5sbDjRlvOfdZfySGD9Rcqm/SodXoNlgB9xMzs
   zW4fjDOlUdvtvjQc0LFA40t4W6aGWMq0jCxfZV0xjtdyDf7fyvD4YmGOD
   4EHy696ssCRdyyL0DXp8dG8KPiTEGp5rVy3nL7U/ZURqAzobNpXBwfqFN
   dCzlXF040ESmpNvq1YWBqbUgdbgq6gQVX2Ry3lIhJoV7F0MvTWN4jcSY0
   s3yR4lVB5DiHmcQBklR/Oz84EejhtdXXwQTneG8oh+3Qsoz6Lkw3kU1HL
   /Gi0BUFQ5dHnWHvYoD8SY/0RWXt6/YkIIZ8TkVxhe+R6BvkbOKbYcv4b0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348996564"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="348996564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="768848320"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="768848320"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 02:01:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwfhK-00035E-3D;
	Wed, 10 May 2023 09:01:23 +0000
Date: Wed, 10 May 2023 17:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24/27]
 include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1'
Message-ID: <202305101606.V9xnENNU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   38c9505e848341b872cc86bab96f3f746a5c7e5d
commit: adc2b4c6af434db264d6e58e740fca5ae876df86 [24/27] CHROMIUM: BACKPORT: FROMLIST: cpufreq: add kvm-cpufreq driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305101606.V9xnENNU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout adc2b4c6af434db264d6e58e740fca5ae876df86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpufreq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101606.V9xnENNU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpufreq/kvm-cpufreq.c:7:
   drivers/cpufreq/kvm-cpufreq.c: In function 'kvm_scale_freq_tick':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'remote_get_freqtbl_num_entries':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'remote_populate_freqtbl':
   include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
     429 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:392:30: note: in definition of macro '__arm_smccc_1_1'
     392 |                 asm volatile(inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:463:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     463 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c:78:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      78 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:332:29: warning: unused variable 'arg1' [-Wunused-variable]
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
>> include/linux/arm-smccc.h:331:32: warning: unused variable 'arg0' [-Wunused-variable]
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
   drivers/cpufreq/kvm-cpufreq.c:108:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     108 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_UTIL_HINT_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/arg1 +332 include/linux/arm-smccc.h

f2d3b2e8759a58 Marc Zyngier 2018-02-06  323  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  324  #define __declare_arg_0(a0, res)					\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  325  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc7 Andrew Scull 2020-09-15  326  	register unsigned long arg0 asm("r0") = (u32)a0
f2d3b2e8759a58 Marc Zyngier 2018-02-06  327  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  328  #define __declare_arg_1(a0, a1, res)					\
755a8bf5579d22 Marc Zyngier 2018-08-24  329  	typeof(a1) __a1 = a1;						\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  330  	struct arm_smccc_res   *___res = res;				\
0794a974d74dc7 Andrew Scull 2020-09-15 @331  	register unsigned long arg0 asm("r0") = (u32)a0;			\
0794a974d74dc7 Andrew Scull 2020-09-15 @332  	register typeof(a1) arg1 asm("r1") = __a1
f2d3b2e8759a58 Marc Zyngier 2018-02-06  333  

:::::: The code at line 332 was first introduced by commit
:::::: 0794a974d74dc777a212a3c58dd236f507360348 smccc: Use separate variables for args and results

:::::: TO: Andrew Scull <ascull@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
