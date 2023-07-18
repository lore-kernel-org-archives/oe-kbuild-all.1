Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A8EDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 00:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689640698; x=1721176698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yE+Wj2JRc1fv0sNvLfKeqNtN+AVqjrMgulykj0q0Kv0=;
  b=dGfGApDQNOQBRo6mqvWk8vixfZ+93+1Diq957Vpkyj6GJ/A9Y9WgNBL5
   GAl0qGstvwO+PsMmh+RXvCjC+aqc5hV9PFMPIq9y/CCCjh/uGtv5UlpT8
   VrCbA19q8my7pnX4tkrFTjERkiewa3rB+bKZIWx8YsVhIaHyN87SEDzYH
   EpNAZcvGaGXxSM2+M7kCadoxIdBNshsmVvEq+gwqXi7cIt63Uq2VbkQ+4
   KqIgV8XmgybgAiuY+zqUyAkMMTZ+QBBOOTg1TlowzdUZIsvDTPkpFoDot
   Rh1qzHpYGtyoALsLNLX08RYJVfcqJSUDXsENVaxoAy5WbJuxVNBSIABq8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452450722"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="452450722"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="788851652"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="788851652"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2023 17:38:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLYjF-000A1g-0o;
	Tue, 18 Jul 2023 00:38:13 +0000
Date: Tue, 18 Jul 2023 08:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 35/36] include/linux/arm-smccc.h:485:29:
 error: '__declare_arg_3' undeclared
Message-ID: <202307180837.RceV83eP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   643039cbab79355ceb1ce9a91e2a7483a44bec05
commit: fceebffabbb6a664115469aac95d243048b09d22 [35/36] arm64: smccc: replace custom COUNT_ARGS() & CONCATENATE() implementations
config: arm64-randconfig-r016-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180837.RceV83eP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180837.RceV83eP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180837.RceV83eP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/arm-smccc.h:8,
                    from drivers/clocksource/arm_arch_timer.c:29:
   drivers/clocksource/arm_arch_timer.c: In function 'kvm_arch_ptp_get_crosststamp':
>> include/linux/arm-smccc.h:485:29: error: '__declare_arg_3' undeclared (first use in this function)
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:485:29: note: each undeclared identifier is reported only once for each function it appears in
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:417:38: error: 'arg0' undeclared (first use in this function); did you mean 'r0'?
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^~~~
   include/linux/arm-smccc.h:418:33: note: in expansion of macro '__constraint_read_0'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:418:59: error: 'arg1' undeclared (first use in this function); did you mean 'r1'?
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                                           ^~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:420:59: error: 'arg3' undeclared (first use in this function); did you mean 'r3'?
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/clocksource/arm_arch_timer.c:1795:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
    1795 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_PTP_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/clocksource/arm_arch_timer.c:1784:13: warning: variable 'ptp_counter' set but not used [-Wunused-but-set-variable]
    1784 |         u32 ptp_counter;
         |             ^~~~~~~~~~~
--
   In file included from include/linux/arm-smccc.h:8,
                    from arch/arm64/kernel/proton-pack.c:20:
   arch/arm64/kernel/proton-pack.c: In function 'spectre_v2_get_cpu_fw_mitigation_state':
>> include/linux/arm-smccc.h:485:29: error: '__declare_arg_3' undeclared (first use in this function)
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:485:29: note: each undeclared identifier is reported only once for each function it appears in
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:417:38: error: 'arg0' undeclared (first use in this function); did you mean 'r0'?
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^~~~
   include/linux/arm-smccc.h:418:33: note: in expansion of macro '__constraint_read_0'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:418:59: error: 'arg1' undeclared (first use in this function); did you mean 'r1'?
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                                           ^~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:420:59: error: 'arg3' undeclared (first use in this function); did you mean 'r3'?
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:186:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     186 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c: In function 'call_smc_arch_workaround_1':
>> include/linux/arm-smccc.h:485:29: error: '__declare_arg_2' undeclared (first use in this function)
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:510:33: note: in expansion of macro '__arm_smccc_1_1'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:239:9: note: in expansion of macro 'arm_smccc_1_1_smc'
     239 |         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:417:38: error: 'arg0' undeclared (first use in this function); did you mean 'r0'?
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^~~~
   include/linux/arm-smccc.h:418:33: note: in expansion of macro '__constraint_read_0'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_2'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:510:33: note: in expansion of macro '__arm_smccc_1_1'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:239:9: note: in expansion of macro 'arm_smccc_1_1_smc'
     239 |         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:418:59: error: 'arg1' undeclared (first use in this function); did you mean 'r1'?
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                                           ^~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_2'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:510:33: note: in expansion of macro '__arm_smccc_1_1'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:239:9: note: in expansion of macro 'arm_smccc_1_1_smc'
     239 |         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_2'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:510:33: note: in expansion of macro '__arm_smccc_1_1'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:239:9: note: in expansion of macro 'arm_smccc_1_1_smc'
     239 |         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:510:33: note: in expansion of macro '__arm_smccc_1_1'
     510 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:239:9: note: in expansion of macro 'arm_smccc_1_1_smc'
     239 |         arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c: In function 'call_hvc_arch_workaround_1':
>> include/linux/arm-smccc.h:485:29: error: '__declare_arg_2' undeclared (first use in this function)
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:245:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
     245 |         arm_smccc_1_1_hvc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:417:38: error: 'arg0' undeclared (first use in this function); did you mean 'r0'?
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^~~~
   include/linux/arm-smccc.h:418:33: note: in expansion of macro '__constraint_read_0'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_2'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:245:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
     245 |         arm_smccc_1_1_hvc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:418:59: error: 'arg1' undeclared (first use in this function); did you mean 'r1'?
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                                           ^~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_2'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:245:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
     245 |         arm_smccc_1_1_hvc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_2'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:245:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
     245 |         arm_smccc_1_1_hvc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:245:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
     245 |         arm_smccc_1_1_hvc(ARM_SMCCC_ARCH_WORKAROUND_1, NULL);
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c: In function 'spectre_v4_get_cpu_fw_mitigation_state':
>> include/linux/arm-smccc.h:485:29: error: '__declare_arg_3' undeclared (first use in this function)
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:493:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     493 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:417:38: error: 'arg0' undeclared (first use in this function); did you mean 'r0'?
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^~~~
   include/linux/arm-smccc.h:418:33: note: in expansion of macro '__constraint_read_0'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:493:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     493 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:418:59: error: 'arg1' undeclared (first use in this function); did you mean 'r1'?
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                                           ^~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:493:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     493 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:493:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     493 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:59: error: 'arg3' undeclared (first use in this function); did you mean 'r3'?
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:493:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     493 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:493:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
     493 |         arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c: In function 'spectre_v4_enable_fw_mitigation':
   include/linux/arm-smccc.h:485:29: error: '__declare_arg_3' undeclared (first use in this function)
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                             ^~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:485:17: note: in expansion of macro 'CONCATENATE'
     485 |                 CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));   \
         |                 ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     563 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:619:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
     619 |                 arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_WORKAROUND_2, false, NULL);
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:417:38: error: 'arg0' undeclared (first use in this function); did you mean 'r0'?
     417 | #define __constraint_read_0     "r" (arg0)
         |                                      ^~~~
   include/linux/arm-smccc.h:418:33: note: in expansion of macro '__constraint_read_0'
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_3'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:563:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
..


vim +/__declare_arg_3 +485 include/linux/arm-smccc.h

   416	
 > 417	#define __constraint_read_0	"r" (arg0)
 > 418	#define __constraint_read_1	__constraint_read_0, "r" (arg1)
 > 419	#define __constraint_read_2	__constraint_read_1, "r" (arg2)
 > 420	#define __constraint_read_3	__constraint_read_2, "r" (arg3)
 > 421	#define __constraint_read_4	__constraint_read_3, "r" (arg4)
 > 422	#define __constraint_read_5	__constraint_read_4, "r" (arg5)
 > 423	#define __constraint_read_6	__constraint_read_5, "r" (arg6)
 > 424	#define __constraint_read_7	__constraint_read_6, "r" (arg7)
   425	
   426	#define __declare_arg_0(a0, res)					\
   427		struct arm_smccc_res   *___res = res;				\
   428		register unsigned long arg0 asm("r0") = (u32)a0
   429	
   430	#define __declare_arg_1(a0, a1, res)					\
   431		typeof(a1) __a1 = a1;						\
   432		struct arm_smccc_res   *___res = res;				\
   433		register unsigned long arg0 asm("r0") = (u32)a0;			\
   434		register typeof(a1) arg1 asm("r1") = __a1
   435	
   436	#define __declare_arg_2(a0, a1, a2, res)				\
   437		typeof(a1) __a1 = a1;						\
   438		typeof(a2) __a2 = a2;						\
   439		struct arm_smccc_res   *___res = res;				\
   440		register unsigned long arg0 asm("r0") = (u32)a0;			\
   441		register typeof(a1) arg1 asm("r1") = __a1;			\
   442		register typeof(a2) arg2 asm("r2") = __a2
   443	
   444	#define __declare_arg_3(a0, a1, a2, a3, res)				\
   445		typeof(a1) __a1 = a1;						\
   446		typeof(a2) __a2 = a2;						\
   447		typeof(a3) __a3 = a3;						\
   448		struct arm_smccc_res   *___res = res;				\
   449		register unsigned long arg0 asm("r0") = (u32)a0;			\
   450		register typeof(a1) arg1 asm("r1") = __a1;			\
   451		register typeof(a2) arg2 asm("r2") = __a2;			\
   452		register typeof(a3) arg3 asm("r3") = __a3
   453	
   454	#define __declare_arg_4(a0, a1, a2, a3, a4, res)			\
   455		typeof(a4) __a4 = a4;						\
   456		__declare_arg_3(a0, a1, a2, a3, res);				\
   457		register typeof(a4) arg4 asm("r4") = __a4
   458	
   459	#define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)			\
   460		typeof(a5) __a5 = a5;						\
   461		__declare_arg_4(a0, a1, a2, a3, a4, res);			\
   462		register typeof(a5) arg5 asm("r5") = __a5
   463	
   464	#define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)		\
   465		typeof(a6) __a6 = a6;						\
   466		__declare_arg_5(a0, a1, a2, a3, a4, a5, res);			\
   467		register typeof(a6) arg6 asm("r6") = __a6
   468	
   469	#define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)		\
   470		typeof(a7) __a7 = a7;						\
   471		__declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);		\
   472		register typeof(a7) arg7 asm("r7") = __a7
   473	
   474	/*
   475	 * We have an output list that is not necessarily used, and GCC feels
   476	 * entitled to optimise the whole sequence away. "volatile" is what
   477	 * makes it stick.
   478	 */
   479	#define __arm_smccc_1_1(inst, ...)					\
   480		do {								\
   481			register unsigned long r0 asm("r0");			\
   482			register unsigned long r1 asm("r1");			\
   483			register unsigned long r2 asm("r2");			\
   484			register unsigned long r3 asm("r3"); 			\
 > 485			CONCATENATE(__declare_arg_, COUNT_ARGS(__VA_ARGS__));	\
   486			asm volatile(SMCCC_SVE_CHECK				\
   487				     inst "\n" :				\
   488				     "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)	\
 > 489				     : CONCATENATE(__constraint_read_,		\
   490						   COUNT_ARGS(__VA_ARGS__))	\
   491				     : smccc_sve_clobbers "memory");		\
 > 492			if (___res)						\
   493				*___res = (typeof(*___res)){r0, r1, r2, r3};	\
   494		} while (0)
   495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
