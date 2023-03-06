Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50720F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 06:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678082936; x=1709618936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrNVI38DroRXSxumy5IMpQsaKDLFfnoesOQ4W2i4GtM=;
  b=KSh9NMOG4FEbWTxSNLdxR5I70QwRKjBW3zEVia0O4d/IoNNk6WEjLf8y
   iqxt8WQTwbnTjgVbjvmctm1LWhlHWGHxrTW4LBC7zmKE6ed2BMsKcOcEg
   ciIl6H0bNcQcZzgq7LCE0XDJqJU1Bjxx86LPl2JiHb+IGaKaF6rbg+hUP
   8dCMDs/uNA+y1gxMBLYc4qeoiLcs/yPfxgQMTwf3wB3QiqSZ6JAxyoZHH
   Fk5oY2BdKs2j8bDaZp3Xy99F2b67xo12HMvS5aPY43zevf3+vcWlJSxaX
   rJXYQ43+JC92h63sEvtgo6RmyK66mtK9Pvwbpm3psNJSH0uAVAAR+lgH1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315137687"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315137687"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 22:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819187458"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="819187458"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2023 22:08:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ41h-00005O-1j;
	Mon, 06 Mar 2023 06:08:49 +0000
Date: Mon, 6 Mar 2023 14:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-cpufeature-helpers 4/4]
 arch/arm64/kernel/cpufeature.c:145:28: error: 'SYS_AA64ISAR1_EL1' undeclared
 here (not in a function); did you mean 'SYS_ID_AA64ISAR1_EL1'?
Message-ID: <202303061459.4VjxJBit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-cpufeature-helpers
head:   4b2e58bb2dc6ecde22b915bd829b4dcbd069c666
commit: 4b2e58bb2dc6ecde22b915bd829b4dcbd069c666 [4/4] arm64/cpufeature: Use helper macro to specify ID register for capabilites
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230306/202303061459.4VjxJBit-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=4b2e58bb2dc6ecde22b915bd829b4dcbd069c666
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci arm64-cpufeature-helpers
        git checkout 4b2e58bb2dc6ecde22b915bd829b4dcbd069c666
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061459.4VjxJBit-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2414:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2414 |                 ARM64_CPUID_MATCH(ID_AA64MMFR1_EL1, HAFDBS, DBM)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2422:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2422 |                 ARM64_CPUID_MATCH(ID_AA64ISAR0_EL1, CRC32, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[24].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2422:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2422 |                 ARM64_CPUID_MATCH(ID_AA64ISAR0_EL1, CRC32, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2429:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2429 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, SSBS, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[25].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2429:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2429 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, SSBS, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2438:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2438 |                 ARM64_CPUID_MATCH(ID_AA64MMFR2_EL1, CnP, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[26].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2438:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2438 |                 ARM64_CPUID_MATCH(ID_AA64MMFR2_EL1, CnP, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2446:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2446 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, SB, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[27].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2446:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2446 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, SB, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2454:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2454 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, APA, PAuth)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[28].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2454:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2454 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, APA, PAuth)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2461:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2461 |                 ARM64_CPUID_MATCH(ID_AA64ISAR2_EL1, APA3, PAuth)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[29].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2461:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2461 |                 ARM64_CPUID_MATCH(ID_AA64ISAR2_EL1, APA3, PAuth)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2468:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2468 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, API, PAuth)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[30].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2468:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2468 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, API, PAuth)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2480:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[32].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2480:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                 ^~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:145:28: error: 'SYS_AA64ISAR1_EL1' undeclared here (not in a function); did you mean 'SYS_ID_AA64ISAR1_EL1'?
     145 |                 .sys_reg = SYS_##reg,                                                   \
         |                            ^~~~
   arch/arm64/kernel/cpufeature.c:2480:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                 ^~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:2480:35: error: 'AA64ISAR1_EL1_GPA_SHIFT' undeclared here (not in a function); did you mean 'ID_AA64ISAR1_EL1_GPA_SHIFT'?
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                                   ^~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:146:30: note: in definition of macro 'ARM64_CPUID_MATCH'
     146 |                 .field_pos = reg##_##field##_SHIFT,                                             \
         |                              ^~~
>> arch/arm64/kernel/cpufeature.c:2480:35: error: 'AA64ISAR1_EL1_GPA_WIDTH' undeclared here (not in a function); did you mean 'ID_AA64ISAR1_EL1_GPA_WIDTH'?
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                                   ^~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:147:32: note: in definition of macro 'ARM64_CPUID_MATCH'
     147 |                 .field_width = reg##_##field##_WIDTH,                                           \
         |                                ^~~
>> arch/arm64/kernel/cpufeature.c:2480:35: error: 'AA64ISAR1_EL1_GPA_SIGNED' undeclared here (not in a function); did you mean 'ID_AA64ISAR1_EL1_GPA_SIGNED'?
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                                   ^~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:148:25: note: in definition of macro 'ARM64_CPUID_MATCH'
     148 |                 .sign = reg##_##field##_SIGNED,                                                 \
         |                         ^~~
>> arch/arm64/kernel/cpufeature.c:2480:35: error: 'AA64ISAR1_EL1_GPA_IMP' undeclared here (not in a function); did you mean 'ID_AA64ISAR1_EL1_GPA_IMP'?
    2480 |                 ARM64_CPUID_MATCH(AA64ISAR1_EL1, GPA, IMP)
         |                                   ^~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:149:36: note: in definition of macro 'ARM64_CPUID_MATCH'
     149 |                 .min_field_value = reg##_##field##_##min_value,
         |                                    ^~~
>> arch/arm64/kernel/cpufeature.c:2487:17: error: implicit declaration of function 'ARM64_CPUID_MARCH'; did you mean 'ARM64_CPUID_MATCH'? [-Werror=implicit-function-declaration]
    2487 |                 ARM64_CPUID_MARCH(ID_AA64ISAR2_EL1, GPA3, IMP)
         |                 ^~~~~~~~~~~~~~~~~
         |                 ARM64_CPUID_MATCH
>> arch/arm64/kernel/cpufeature.c:2487:35: error: 'ID_AA64ISAR2_EL1' undeclared here (not in a function); did you mean 'ID_AA64ISAR2_EL1_BC'?
    2487 |                 ARM64_CPUID_MARCH(ID_AA64ISAR2_EL1, GPA3, IMP)
         |                                   ^~~~~~~~~~~~~~~~
         |                                   ID_AA64ISAR2_EL1_BC
>> arch/arm64/kernel/cpufeature.c:2487:53: error: 'GPA3' undeclared here (not in a function)
    2487 |                 ARM64_CPUID_MARCH(ID_AA64ISAR2_EL1, GPA3, IMP)
         |                                                     ^~~~
>> arch/arm64/kernel/cpufeature.c:2487:59: error: 'IMP' undeclared here (not in a function)
    2487 |                 ARM64_CPUID_MARCH(ID_AA64ISAR2_EL1, GPA3, IMP)
         |                                                           ^~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2494:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2494 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, GPI, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[34].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2494:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2494 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, GPI, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2528:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2528 |                 ARM64_CPUID_MATCH(ID_AA64MMFR2_EL1, E0PD, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[36].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2528:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2528 |                 ARM64_CPUID_MATCH(ID_AA64MMFR2_EL1, E0PD, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2536:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2536 |                 ARM64_CPUID_MATCH(ID_AA64ISAR0_EL1, RNDR, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[37].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2536:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2536 |                 ARM64_CPUID_MATCH(ID_AA64ISAR0_EL1, RNDR, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2549:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2549 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, BT, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[38].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2549:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2549 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, BT, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2560:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2560 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, MTE, MTE2)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[39].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2560:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2560 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, MTE, MTE2)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2567:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2567 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, MTE, MTE3)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[40].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2567:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2567 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, MTE, MTE3)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2575:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2575 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, LRCPC, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[41].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2575:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2575 |                 ARM64_CPUID_MATCH(ID_AA64ISAR1_EL1, LRCPC, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2584:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2584 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, SME, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: note: (near initialization for 'arm64_features[42].matches')
     144 |                 .matches = has_user_cpuid_feature,                                      \
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2584:17: note: in expansion of macro 'ARM64_CPUID_MATCH'
    2584 |                 ARM64_CPUID_MATCH(ID_AA64PFR1_EL1, SME, IMP)
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:144:28: warning: initialized field overwritten [-Woverride-init]
     144 |                 .matches = has_user_cpuid_feature,                                      \


vim +145 arch/arm64/kernel/cpufeature.c

8effeaaf2cacc8 Mark Rutland 2017-06-21  142  
cecade6156daf9 Mark Brown   2023-03-03  143  #define ARM64_CPUID_MATCH(reg, field, min_value)			\
cecade6156daf9 Mark Brown   2023-03-03  144  		.matches = has_user_cpuid_feature,					\
cecade6156daf9 Mark Brown   2023-03-03 @145  		.sys_reg = SYS_##reg,							\
cecade6156daf9 Mark Brown   2023-03-03  146  		.field_pos = reg##_##field##_SHIFT,						\
cecade6156daf9 Mark Brown   2023-03-03  147  		.field_width = reg##_##field##_WIDTH,						\
cecade6156daf9 Mark Brown   2023-03-03  148  		.sign = reg##_##field##_SIGNED,							\
cecade6156daf9 Mark Brown   2023-03-03  149  		.min_field_value = reg##_##field##_##min_value,
cecade6156daf9 Mark Brown   2023-03-03  150  

:::::: The code at line 145 was first introduced by commit
:::::: cecade6156daf919d5be40b057b78d0bddd1804a arm64/cpufeature: Move and rename the CPUID match helper

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
