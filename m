Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4332CEDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 01:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689642558; x=1721178558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYl0Xc/O4k/KHyXQp59CSRVgOkJbLhmoLznGb4zJbec=;
  b=E193DbRd8/tVNPskJNWimyyVvr0FSJDkkk1nTHA86sm5wG8P50A/jui+
   b84vbhwSxttX7JqA9IfXILfK3yq0rt4hJINyw4lWK992C4lUEQ+hTfqqv
   SHFsmEN/LUMtg4umHdPIjxBN85aQuqKfRs6p+d+8FLK4wmaZ34ungf4nt
   66p5Qz3gKIJWRz8AcEbVX/ZrNm4ShcneErktuPQhYs8ZGTy10WcYTeFaQ
   3p7nPuuzMMzoXI/zNS5Lb3BU0dM/hrARG3kWvoxPJ3b1MKpiHJ1pe93ag
   vbRA0Zl4m2b+1rt+PZdsq+gif/zbOPd+NpHydbTneArZSrWGecRq7YiLT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396916340"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="396916340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673719960"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673719960"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2023 18:09:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLZDG-000A3m-0e;
	Tue, 18 Jul 2023 01:09:14 +0000
Date: Tue, 18 Jul 2023 09:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 35/36] arch/arm64/hyperv/hv_core.c:28:33:
 warning: variable 'output_address' set but not used
Message-ID: <202307180935.HWK2YvKG-lkp@intel.com>
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
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307180935.HWK2YvKG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180935.HWK2YvKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180935.HWK2YvKG-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:421:33: note: in expansion of macro '__constraint_read_3'
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:422:33: note: in expansion of macro '__constraint_read_4'
     422 | #define __constraint_read_5     __constraint_read_4, "r" (arg5)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_5'
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
   arch/arm64/hyperv/hv_core.c:33:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      33 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:59: error: 'arg3' undeclared (first use in this function); did you mean 'r3'?
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                                           ^~~~
   include/linux/arm-smccc.h:421:33: note: in expansion of macro '__constraint_read_3'
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:422:33: note: in expansion of macro '__constraint_read_4'
     422 | #define __constraint_read_5     __constraint_read_4, "r" (arg5)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_5'
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
   arch/arm64/hyperv/hv_core.c:33:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      33 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:421:59: error: 'arg4' undeclared (first use in this function)
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                                           ^~~~
   include/linux/arm-smccc.h:422:33: note: in expansion of macro '__constraint_read_4'
     422 | #define __constraint_read_5     __constraint_read_4, "r" (arg5)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_5'
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
   arch/arm64/hyperv/hv_core.c:33:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      33 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:422:59: error: 'arg5' undeclared (first use in this function)
     422 | #define __constraint_read_5     __constraint_read_4, "r" (arg5)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_5'
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
   arch/arm64/hyperv/hv_core.c:33:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      33 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/hyperv/hv_core.c:33:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      33 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control,
         |         ^~~~~~~~~~~~~~~~~
>> arch/arm64/hyperv/hv_core.c:28:33: warning: variable 'output_address' set but not used [-Wunused-but-set-variable]
      28 |         u64                     output_address;
         |                                 ^~~~~~~~~~~~~~
>> arch/arm64/hyperv/hv_core.c:27:33: warning: variable 'input_address' set but not used [-Wunused-but-set-variable]
      27 |         u64                     input_address;
         |                                 ^~~~~~~~~~~~~
   arch/arm64/hyperv/hv_core.c: In function 'hv_do_fast_hypercall8':
   include/linux/arm-smccc.h:485:29: error: '__declare_arg_4' undeclared (first use in this function)
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
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
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
   include/linux/arm-smccc.h:421:33: note: in expansion of macro '__constraint_read_3'
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_4'
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
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:418:59: error: 'arg1' undeclared (first use in this function); did you mean 'r1'?
     418 | #define __constraint_read_1     __constraint_read_0, "r" (arg1)
         |                                                           ^~~~
   include/linux/arm-smccc.h:419:33: note: in expansion of macro '__constraint_read_1'
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:421:33: note: in expansion of macro '__constraint_read_3'
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_4'
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
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:419:59: error: 'arg2' undeclared (first use in this function); did you mean 'r2'?
     419 | #define __constraint_read_2     __constraint_read_1, "r" (arg2)
         |                                                           ^~~~
   include/linux/arm-smccc.h:420:33: note: in expansion of macro '__constraint_read_2'
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:421:33: note: in expansion of macro '__constraint_read_3'
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_4'
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
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:420:59: error: 'arg3' undeclared (first use in this function); did you mean 'r3'?
     420 | #define __constraint_read_3     __constraint_read_2, "r" (arg3)
         |                                                           ^~~~
   include/linux/arm-smccc.h:421:33: note: in expansion of macro '__constraint_read_3'
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_4'
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
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:421:59: error: 'arg4' undeclared (first use in this function)
     421 | #define __constraint_read_4     __constraint_read_3, "r" (arg4)
         |                                                           ^~~~
   include/linux/args.h:25:24: note: in expansion of macro '__constraint_read_4'
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
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/hyperv/hv_core.c:52:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      52 |         arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
         |         ^~~~~~~~~~~~~~~~~
>> arch/arm64/hyperv/hv_core.c:48:33: warning: variable 'control' set but not used [-Wunused-but-set-variable]
      48 |         u64                     control;
         |                                 ^~~~~~~
   arch/arm64/hyperv/hv_core.c: In function 'hv_set_vpreg':
   include/linux/arm-smccc.h:485:29: error: '__declare_arg_9' undeclared (first use in this function)
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
   arch/arm64/hyperv/hv_core.c:64:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      64 |         arm_smccc_1_1_hvc(HV_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:489:44: error: expected string literal before '__constraint_read_9'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                            ^~~~~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/arm-smccc.h:489:32: note: in expansion of macro 'CONCATENATE'
     489 |                              : CONCATENATE(__constraint_read_,          \
         |                                ^~~~~~~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/hyperv/hv_core.c:64:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      64 |         arm_smccc_1_1_hvc(HV_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:492:21: error: '___res' undeclared (first use in this function)
     492 |                 if (___res)                                             \
         |                     ^~~~~~
   include/linux/arm-smccc.h:526:33: note: in expansion of macro '__arm_smccc_1_1'
     526 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   arch/arm64/hyperv/hv_core.c:64:9: note: in expansion of macro 'arm_smccc_1_1_hvc'
      64 |         arm_smccc_1_1_hvc(HV_FUNC_ID,
         |         ^~~~~~~~~~~~~~~~~


vim +/output_address +28 arch/arm64/hyperv/hv_core.c

57d276bbbd3224 Michael Kelley 2021-08-04  20  
57d276bbbd3224 Michael Kelley 2021-08-04  21  /*
57d276bbbd3224 Michael Kelley 2021-08-04  22   * hv_do_hypercall- Invoke the specified hypercall
57d276bbbd3224 Michael Kelley 2021-08-04  23   */
57d276bbbd3224 Michael Kelley 2021-08-04  24  u64 hv_do_hypercall(u64 control, void *input, void *output)
57d276bbbd3224 Michael Kelley 2021-08-04  25  {
57d276bbbd3224 Michael Kelley 2021-08-04  26  	struct arm_smccc_res	res;
57d276bbbd3224 Michael Kelley 2021-08-04 @27  	u64			input_address;
57d276bbbd3224 Michael Kelley 2021-08-04 @28  	u64			output_address;
57d276bbbd3224 Michael Kelley 2021-08-04  29  
57d276bbbd3224 Michael Kelley 2021-08-04  30  	input_address = input ? virt_to_phys(input) : 0;
57d276bbbd3224 Michael Kelley 2021-08-04  31  	output_address = output ? virt_to_phys(output) : 0;
57d276bbbd3224 Michael Kelley 2021-08-04  32  
57d276bbbd3224 Michael Kelley 2021-08-04 @33  	arm_smccc_1_1_hvc(HV_FUNC_ID, control,
57d276bbbd3224 Michael Kelley 2021-08-04  34  			  input_address, output_address, &res);
57d276bbbd3224 Michael Kelley 2021-08-04  35  	return res.a0;
57d276bbbd3224 Michael Kelley 2021-08-04  36  }
57d276bbbd3224 Michael Kelley 2021-08-04  37  EXPORT_SYMBOL_GPL(hv_do_hypercall);
57d276bbbd3224 Michael Kelley 2021-08-04  38  
57d276bbbd3224 Michael Kelley 2021-08-04  39  /*
57d276bbbd3224 Michael Kelley 2021-08-04  40   * hv_do_fast_hypercall8 -- Invoke the specified hypercall
57d276bbbd3224 Michael Kelley 2021-08-04  41   * with arguments in registers instead of physical memory.
57d276bbbd3224 Michael Kelley 2021-08-04  42   * Avoids the overhead of virt_to_phys for simple hypercalls.
57d276bbbd3224 Michael Kelley 2021-08-04  43   */
57d276bbbd3224 Michael Kelley 2021-08-04  44  
57d276bbbd3224 Michael Kelley 2021-08-04  45  u64 hv_do_fast_hypercall8(u16 code, u64 input)
57d276bbbd3224 Michael Kelley 2021-08-04  46  {
57d276bbbd3224 Michael Kelley 2021-08-04  47  	struct arm_smccc_res	res;
57d276bbbd3224 Michael Kelley 2021-08-04 @48  	u64			control;
57d276bbbd3224 Michael Kelley 2021-08-04  49  
57d276bbbd3224 Michael Kelley 2021-08-04  50  	control = (u64)code | HV_HYPERCALL_FAST_BIT;
57d276bbbd3224 Michael Kelley 2021-08-04  51  
57d276bbbd3224 Michael Kelley 2021-08-04 @52  	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input, &res);
57d276bbbd3224 Michael Kelley 2021-08-04  53  	return res.a0;
57d276bbbd3224 Michael Kelley 2021-08-04  54  }
57d276bbbd3224 Michael Kelley 2021-08-04  55  EXPORT_SYMBOL_GPL(hv_do_fast_hypercall8);
57d276bbbd3224 Michael Kelley 2021-08-04  56  

:::::: The code at line 28 was first introduced by commit
:::::: 57d276bbbd322409bb6f7c6446187a29953f8ded arm64: hyperv: Add Hyper-V hypercall and register access utilities

:::::: TO: Michael Kelley <mikelley@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
