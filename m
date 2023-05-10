Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549C6AA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683729997; x=1715265997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RaCfB2ZvZtn7AFx+ea2+MmSKpUV49Ns6L6+6BQoO70E=;
  b=PQdA4bm4B/xvqZ+BXMAq94b9hGI4G0DRFe55K27hBGDX0gmMbJ2huafX
   Kfn/qTkHy8TWRQSMuRQj/z64eE7u9kek9+w5bkz0QYuwmTFVcmuUpap1O
   XqZSS+5oP1BnBmtUkvNBgvZh/LyVUOe8myPS37iFRn4deaQ49pS3THeOc
   kPxwj06nObgkPi4vzitSOggkaBj+3aFlBLLqqrxOwgQCCPM17Y6S5R11L
   mckatKYDU9rXEtGBRTKW2jyWc8yVduGS4dP+/J+Rxu+AZBcYUtujbqptM
   PiDrNDDAuYhM/Y0ZNYriK5U36BBPrBWXODpY8y3J3BmTNUXiD4gYf7YyU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339477271"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="339477271"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 07:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768940825"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="768940825"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 07:46:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwl5O-0003Mt-2u;
	Wed, 10 May 2023 14:46:34 +0000
Date: Wed, 10 May 2023 22:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24/27]
 include/linux/arm-smccc.h:429:49: error: expected string literal before
 'SMCCC_HVC_INST'
Message-ID: <202305102227.wnZv1kr1-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305102227.wnZv1kr1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout adc2b4c6af434db264d6e58e740fca5ae876df86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102227.wnZv1kr1-lkp@intel.com/

Note: the android-common/mirror-chromeos-5.10-arcvm HEAD 38c9505e848341b872cc86bab96f3f746a5c7e5d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/cpufreq/kvm-cpufreq.c:7:
   drivers/cpufreq/kvm-cpufreq.c: In function 'kvm_scale_freq_tick':
>> include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
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
   drivers/cpufreq/kvm-cpufreq.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CUR_CPUFREQ_FUNC_ID,
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
>> include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
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
   drivers/cpufreq/kvm-cpufreq.c:50:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      50 |                 arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_GET_CPUFREQ_TBL_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/kvm-cpufreq.c: In function 'remote_populate_freqtbl':
>> include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
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
>> include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
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
>> include/linux/arm-smccc.h:429:49: error: expected string literal before 'SMCCC_HVC_INST'
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
>> include/linux/arm-smccc.h:413:49: error: expected string literal before 'SMCCC_SMC_INST'
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


vim +/SMCCC_HVC_INST +429 include/linux/arm-smccc.h

f2d3b2e8759a58 Marc Zyngier 2018-02-06  379  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  380  /*
f2d3b2e8759a58 Marc Zyngier 2018-02-06  381   * We have an output list that is not necessarily used, and GCC feels
f2d3b2e8759a58 Marc Zyngier 2018-02-06  382   * entitled to optimise the whole sequence away. "volatile" is what
f2d3b2e8759a58 Marc Zyngier 2018-02-06  383   * makes it stick.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  384   */
f2d3b2e8759a58 Marc Zyngier 2018-02-06  385  #define __arm_smccc_1_1(inst, ...)					\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  386  	do {								\
0794a974d74dc7 Andrew Scull 2020-09-15  387  		register unsigned long r0 asm("r0");			\
0794a974d74dc7 Andrew Scull 2020-09-15  388  		register unsigned long r1 asm("r1");			\
0794a974d74dc7 Andrew Scull 2020-09-15  389  		register unsigned long r2 asm("r2");			\
0794a974d74dc7 Andrew Scull 2020-09-15  390  		register unsigned long r3 asm("r3"); 			\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  391  		__declare_args(__count_args(__VA_ARGS__), __VA_ARGS__);	\
0794a974d74dc7 Andrew Scull 2020-09-15  392  		asm volatile(inst "\n" :				\
0794a974d74dc7 Andrew Scull 2020-09-15  393  			     "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)	\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  394  			     __constraints(__count_args(__VA_ARGS__)));	\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  395  		if (___res)						\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  396  			*___res = (typeof(*___res)){r0, r1, r2, r3};	\
f2d3b2e8759a58 Marc Zyngier 2018-02-06  397  	} while (0)
f2d3b2e8759a58 Marc Zyngier 2018-02-06  398  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  399  /*
f2d3b2e8759a58 Marc Zyngier 2018-02-06  400   * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
f2d3b2e8759a58 Marc Zyngier 2018-02-06  401   *
f2d3b2e8759a58 Marc Zyngier 2018-02-06  402   * This is a variadic macro taking one to eight source arguments, and
f2d3b2e8759a58 Marc Zyngier 2018-02-06  403   * an optional return structure.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  404   *
f2d3b2e8759a58 Marc Zyngier 2018-02-06  405   * @a0-a7: arguments passed in registers 0 to 7
f2d3b2e8759a58 Marc Zyngier 2018-02-06  406   * @res: result values from registers 0 to 3
f2d3b2e8759a58 Marc Zyngier 2018-02-06  407   *
f2d3b2e8759a58 Marc Zyngier 2018-02-06  408   * This macro is used to make SMC calls following SMC Calling Convention v1.1.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  409   * The content of the supplied param are copied to registers 0 to 7 prior
f2d3b2e8759a58 Marc Zyngier 2018-02-06  410   * to the SMC instruction. The return values are updated with the content
f2d3b2e8759a58 Marc Zyngier 2018-02-06  411   * from register 0 to 3 on return from the SMC instruction if not NULL.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  412   */
f2d3b2e8759a58 Marc Zyngier 2018-02-06 @413  #define arm_smccc_1_1_smc(...)	__arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
f2d3b2e8759a58 Marc Zyngier 2018-02-06  414  
f2d3b2e8759a58 Marc Zyngier 2018-02-06  415  /*
f2d3b2e8759a58 Marc Zyngier 2018-02-06  416   * arm_smccc_1_1_hvc() - make an SMCCC v1.1 compliant HVC call
f2d3b2e8759a58 Marc Zyngier 2018-02-06  417   *
f2d3b2e8759a58 Marc Zyngier 2018-02-06  418   * This is a variadic macro taking one to eight source arguments, and
f2d3b2e8759a58 Marc Zyngier 2018-02-06  419   * an optional return structure.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  420   *
f2d3b2e8759a58 Marc Zyngier 2018-02-06  421   * @a0-a7: arguments passed in registers 0 to 7
f2d3b2e8759a58 Marc Zyngier 2018-02-06  422   * @res: result values from registers 0 to 3
f2d3b2e8759a58 Marc Zyngier 2018-02-06  423   *
f2d3b2e8759a58 Marc Zyngier 2018-02-06  424   * This macro is used to make HVC calls following SMC Calling Convention v1.1.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  425   * The content of the supplied param are copied to registers 0 to 7 prior
f2d3b2e8759a58 Marc Zyngier 2018-02-06  426   * to the HVC instruction. The return values are updated with the content
f2d3b2e8759a58 Marc Zyngier 2018-02-06  427   * from register 0 to 3 on return from the HVC instruction if not NULL.
f2d3b2e8759a58 Marc Zyngier 2018-02-06  428   */
f2d3b2e8759a58 Marc Zyngier 2018-02-06 @429  #define arm_smccc_1_1_hvc(...)	__arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
f2d3b2e8759a58 Marc Zyngier 2018-02-06  430  

:::::: The code at line 429 was first introduced by commit
:::::: f2d3b2e8759a5833df6f022e42df2d581e6d843c arm/arm64: smccc: Implement SMCCC v1.1 inline primitive

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
