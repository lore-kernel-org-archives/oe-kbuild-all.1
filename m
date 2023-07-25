Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F37486
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690275050; x=1721811050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Iv16GDUViWEPCVHJUTS01sgM1AOytFA075A+fLiZ+s=;
  b=jf0avcDgofgMfaD6WIpC+1xrtrSGiTsPav+kGFR6CQD0Qc/AMcPDwsb4
   6yn9JNFXRp+qe2ZgkHV25rnk0S/lVNbsuhqH7nruHKCa90m9O0E3xGtyb
   5zbYSU6QU5pXIvyyYII2lt38V0UWX1/IaTjmRx0g312nspAZ9iBFnTWyN
   4Z1d81XEt0HPiTaEW5nFSgwQi/KMB3jWIWuGL23Vy51skuRTdZSBunANc
   ySUhvnn6iqr79koeeFR7IMJwN9mg9198O+H2f81zJodTjH99dn6QKM8Un
   L48mw/cxcMGgcpaonY7A8+tZh83LjPfcKl7glxyQVMknPUgXRuD9RHYEC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365119657"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="365119657"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 01:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="676155075"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="676155075"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 01:50:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qODkl-000ATE-0s;
	Tue, 25 Jul 2023 08:50:47 +0000
Date: Tue, 25 Jul 2023 16:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2
 reboot-mode driver
Message-ID: <202307251602.zQABbJGF-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on 6eaae198076080886b9e7d57f4ae06fa782f90ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/power-reset-reboot-mode-Allow-magic-to-be-0/20230725-063351
base:   6eaae198076080886b9e7d57f4ae06fa782f90ef
patch link:    https://lore.kernel.org/r/20230724223057.1208122-5-quic_eberman%40quicinc.com
patch subject: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2 reboot-mode driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230725/202307251602.zQABbJGF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251602.zQABbJGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251602.zQABbJGF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/psci/psci.c:25:10: fatal error: asm/cpuidle.h: No such file or directory
      25 | #include <asm/cpuidle.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.
--
   drivers/firmware/smccc/smccc.c: In function 'arm_smccc_version_init':
>> drivers/firmware/smccc/smccc.c:30:32: error: implicit declaration of function 'smccc_probe_trng' [-Werror=implicit-function-declaration]
      30 |         smccc_trng_available = smccc_probe_trng();
         |                                ^~~~~~~~~~~~~~~~
   In file included from drivers/firmware/smccc/smccc.c:10:
   include/linux/arm-smccc.h:536:49: error: expected string literal before 'SMCCC_HVC_INST'
     536 | #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:499:30: note: in definition of macro '__arm_smccc_1_1'
     499 |                              inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:570:25: note: in expansion of macro 'arm_smccc_1_1_hvc'
     570 |                         arm_smccc_1_1_hvc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/smccc.c:37:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      37 |                 arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:438:29: warning: unused variable 'arg1' [-Wunused-variable]
     438 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_1'
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
   drivers/firmware/smccc/smccc.c:37:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      37 |                 arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:437:32: warning: unused variable 'arg0' [-Wunused-variable]
     437 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_1'
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
   drivers/firmware/smccc/smccc.c:37:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      37 |                 arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:520:49: error: expected string literal before 'SMCCC_SMC_INST'
     520 | #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:499:30: note: in definition of macro '__arm_smccc_1_1'
     499 |                              inst "\n" :                                \
         |                              ^~~~
   include/linux/arm-smccc.h:573:25: note: in expansion of macro 'arm_smccc_1_1_smc'
     573 |                         arm_smccc_1_1_smc(__VA_ARGS__);                 \
         |                         ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/smccc.c:37:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      37 |                 arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:438:29: warning: unused variable 'arg1' [-Wunused-variable]
     438 |         register typeof(a1) arg1 asm("r1") = __a1
         |                             ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_1'
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
   drivers/firmware/smccc/smccc.c:37:17: note: in expansion of macro 'arm_smccc_1_1_invoke'
      37 |                 arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:437:32: warning: unused variable 'arg0' [-Wunused-variable]
     437 |         register unsigned long arg0 asm("r0") = (u32)a0;                        \
         |                                ^~~~
   include/linux/arm-smccc.h:478:37: note: in expansion of macro '__declare_arg_1'
     478 | #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~
   include/linux/arm-smccc.h:479:37: note: in expansion of macro '___declare_args'
     479 | #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:497:17: note: in expansion of macro '__declare_args'
--
>> drivers/firmware/smccc/kvm_guest.c:11:10: fatal error: asm/hypervisor.h: No such file or directory
      11 | #include <asm/hypervisor.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +25 drivers/firmware/psci/psci.c

bff60792f994a8 drivers/firmware/psci.c      Mark Rutland      2015-07-31  24  
8b6f2499ac45d5 drivers/firmware/psci.c      Lorenzo Pieralisi 2016-02-01 @25  #include <asm/cpuidle.h>
bff60792f994a8 drivers/firmware/psci.c      Mark Rutland      2015-07-31  26  #include <asm/cputype.h>
6e085e0ac9cf16 drivers/firmware/psci/psci.c Will Deacon       2020-12-09  27  #include <asm/hypervisor.h>
bff60792f994a8 drivers/firmware/psci.c      Mark Rutland      2015-07-31  28  #include <asm/system_misc.h>
bff60792f994a8 drivers/firmware/psci.c      Mark Rutland      2015-07-31  29  #include <asm/smp_plat.h>
faf7ec4a92c023 drivers/firmware/psci.c      Sudeep Holla      2015-06-18  30  #include <asm/suspend.h>
bff60792f994a8 drivers/firmware/psci.c      Mark Rutland      2015-07-31  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
