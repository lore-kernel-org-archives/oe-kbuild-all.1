Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0022134CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690272474; x=1721808474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bacTe2BLbk74OkKQJKqQGgmJYm718+4h2quXijkG6gI=;
  b=hyDc+ASJEyZ0Q/LCrQMmxfqSUDra7GMtQ9HqavFpHJYlON3DvYQaryoo
   KigHxImehDlrrzwtDeeOnh3ONU0N4pj02mDCDjhoH2UIkOWS3aCcNYnV1
   dxf04AZjbo78wRrEdPVfG5KT1lNwInfk8EyNUj4s7teUGOiv9YtD7azuh
   PD0YqZOLPVGxzVwF1XifcO2leknWLJ0EsEouyjzPMqj2fWGDMjExo4VPr
   uF4JyRmhhWplUvUZfJytba5ofttiAzR4zP7sqiYVaX1eA5Ur3EDy6+Slz
   L1KtRvdmqz939KozRj8DeQ5nt1wqQhkB1q9y5/OjUCgRAOOiMnaoP4CSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352549893"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="352549893"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 01:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849920119"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="849920119"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Jul 2023 01:07:43 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOD55-000AS6-0L;
	Tue, 25 Jul 2023 08:07:43 +0000
Date: Tue, 25 Jul 2023 16:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2
 reboot-mode driver
Message-ID: <202307251507.Da5Sn5qi-lkp@intel.com>
References: <20230724223057.1208122-5-quic_eberman@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724223057.1208122-5-quic_eberman@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6eaae198076080886b9e7d57f4ae06fa782f90ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/power-reset-reboot-mode-Allow-magic-to-be-0/20230725-063351
base:   6eaae198076080886b9e7d57f4ae06fa782f90ef
patch link:    https://lore.kernel.org/r/20230724223057.1208122-5-quic_eberman%40quicinc.com
patch subject: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2 reboot-mode driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230725/202307251507.Da5Sn5qi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251507.Da5Sn5qi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251507.Da5Sn5qi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/smccc/kvm_guest.c:15:13: warning: no previous prototype for 'kvm_init_hyp_services' [-Wmissing-prototypes]
      15 | void __init kvm_init_hyp_services(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/smccc/kvm_guest.c:5:
   drivers/firmware/smccc/kvm_guest.c: In function 'kvm_init_hyp_services':
   include/linux/arm-smccc.h:536:49: error: expected string literal before 'SMCCC_HVC_INST'
     536 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:499:30: note: in definition of macro '__arm_smccc_1_1'
     499 |                              inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:570:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     570 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:432:32: warning: unused variable 'arg0' [-Wunused-variable]
     432 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_0'
     478 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:479:37: note: in expansion of macro '___declare_args'
     479 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:497:17: note: in expansion of macro '__declare_args'
     497 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:536:33: note: in expansion of macro '__arm_smccc_1_1'
     536 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:570:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     570 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:520:49: error: expected string literal before 'SMCCC_SMC_INST'
     520 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:499:30: note: in definition of macro '__arm_smccc_1_1'
     499 |                              inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:573:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     573 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:432:32: warning: unused variable 'arg0' [-Wunused-variable]
     432 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_0'
     478 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:479:37: note: in expansion of macro '___declare_args'
     479 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:497:17: note: in expansion of macro '__declare_args'
     497 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:520:33: note: in expansion of macro '__arm_smccc_1_1'
     520 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:573:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     573 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:23:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      23 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:536:49: error: expected string literal before 'SMCCC_HVC_INST'
     536 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:499:30: note: in definition of macro '__arm_smccc_1_1'
     499 |                              inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:570:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     570 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:31:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      31 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:432:32: warning: unused variable 'arg0' [-Wunused-variable]
     432 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_0'
     478 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:479:37: note: in expansion of macro '___declare_args'
     479 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:497:17: note: in expansion of macro '__declare_args'
     497 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:536:33: note: in expansion of macro '__arm_smccc_1_1'
     536 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:570:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     570 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:31:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      31 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:520:49: error: expected string literal before 'SMCCC_SMC_INST'
     520 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:499:30: note: in definition of macro '__arm_smccc_1_1'
     499 |                              inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:573:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     573 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:31:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      31 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:432:32: warning: unused variable 'arg0' [-Wunused-variable]
     432 |         register unsigned long arg0 asm("r0") = (u32)a0
         |                                ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_0'
     478 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:479:37: note: in expansion of macro '___declare_args'
     479 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:497:17: note: in expansion of macro '__declare_args'
     497 |                 __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:520:33: note: in expansion of macro '__arm_smccc_1_1'
     520 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                 ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:573:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     573 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:31:9: note: in expansion of macro 'arm_smccc_1_1_invoke'
      31 |         arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, &res);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c: At top level:
>> drivers/firmware/smccc/kvm_guest.c:44:6: warning: no previous prototype for 'kvm_arm_hyp_service_available' [-Wmissing-prototypes]
      44 | bool kvm_arm_hyp_service_available(u32 func_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_init_hyp_services +15 drivers/firmware/smccc/kvm_guest.c

6e085e0ac9cf16 Will Deacon 2020-12-09  14  
6e085e0ac9cf16 Will Deacon 2020-12-09 @15  void __init kvm_init_hyp_services(void)
6e085e0ac9cf16 Will Deacon 2020-12-09  16  {
6e085e0ac9cf16 Will Deacon 2020-12-09  17  	struct arm_smccc_res res;
6e085e0ac9cf16 Will Deacon 2020-12-09  18  	u32 val[4];
6e085e0ac9cf16 Will Deacon 2020-12-09  19  
6e085e0ac9cf16 Will Deacon 2020-12-09  20  	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
6e085e0ac9cf16 Will Deacon 2020-12-09  21  		return;
6e085e0ac9cf16 Will Deacon 2020-12-09  22  
6e085e0ac9cf16 Will Deacon 2020-12-09  23  	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
6e085e0ac9cf16 Will Deacon 2020-12-09  24  	if (res.a0 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0 ||
6e085e0ac9cf16 Will Deacon 2020-12-09  25  	    res.a1 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1 ||
6e085e0ac9cf16 Will Deacon 2020-12-09  26  	    res.a2 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2 ||
6e085e0ac9cf16 Will Deacon 2020-12-09  27  	    res.a3 != ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3)
6e085e0ac9cf16 Will Deacon 2020-12-09  28  		return;
6e085e0ac9cf16 Will Deacon 2020-12-09  29  
6e085e0ac9cf16 Will Deacon 2020-12-09  30  	memset(&res, 0, sizeof(res));
6e085e0ac9cf16 Will Deacon 2020-12-09  31  	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID, &res);
6e085e0ac9cf16 Will Deacon 2020-12-09  32  
6e085e0ac9cf16 Will Deacon 2020-12-09  33  	val[0] = lower_32_bits(res.a0);
6e085e0ac9cf16 Will Deacon 2020-12-09  34  	val[1] = lower_32_bits(res.a1);
6e085e0ac9cf16 Will Deacon 2020-12-09  35  	val[2] = lower_32_bits(res.a2);
6e085e0ac9cf16 Will Deacon 2020-12-09  36  	val[3] = lower_32_bits(res.a3);
6e085e0ac9cf16 Will Deacon 2020-12-09  37  
6e085e0ac9cf16 Will Deacon 2020-12-09  38  	bitmap_from_arr32(__kvm_arm_hyp_services, val, ARM_SMCCC_KVM_NUM_FUNCS);
6e085e0ac9cf16 Will Deacon 2020-12-09  39  
6e085e0ac9cf16 Will Deacon 2020-12-09  40  	pr_info("hypervisor services detected (0x%08lx 0x%08lx 0x%08lx 0x%08lx)\n",
6e085e0ac9cf16 Will Deacon 2020-12-09  41  		 res.a3, res.a2, res.a1, res.a0);
6e085e0ac9cf16 Will Deacon 2020-12-09  42  }
6e085e0ac9cf16 Will Deacon 2020-12-09  43  
6e085e0ac9cf16 Will Deacon 2020-12-09 @44  bool kvm_arm_hyp_service_available(u32 func_id)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
