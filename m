Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63129A9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680706758; x=1712242758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRrlciPIAlvCf0YbTtqNenj6hpQOtkKsoWSKDg3xizM=;
  b=kSR7OS3ldw7JalBUBU+9emlxulAE4BOgO23VDINYP89bHczyVpi+H9v5
   CAuFXOxj5q54hOVrzfmhT5WY9OHrqIM0rpprHH0nMOTdmm0eIJFiHog/f
   Ri9gUR1ryFtSEDXQXjHkOkaCwUg6IX5bbqKbmUbzihO0K0qLVCuDPDZuY
   J2HYpFL03QXX5fhHc+36bJ/z3ELXFdj7YNjRGx2uMFijNfOAnLvCDvQrJ
   kZ3jgGSkdLQ8we8I48qJYEssRKJWktL/JbcjZ+Vz0t8tba9lQBd5Ta21E
   Zxddkh/6FQQZPy3/0uP5/+7dl1Bv3dSvClLu6mRgmFDBeKn6kMBT9oHwT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="339965525"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="339965525"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 07:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830387941"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="830387941"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2023 07:59:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk4bT-000Qag-1v;
	Wed, 05 Apr 2023 14:59:15 +0000
Date: Wed, 5 Apr 2023 22:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 188/190]
 arch/arm64/kvm/sys_regs.c:1095:24: error: 'ID_DFR0_PERFMON_IMP_DEF'
 undeclared; did you mean 'ID_DFR0_PERFMON_8_4'?
Message-ID: <202304052249.pH9CY0dO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   f66bda91158a61052c2dfa3b9acd3ec6e5333fba
commit: f0b4e13ec229c8ab546688ac097024656c311325 [188/190] KVM: arm64: PMU: Move the ID_AA64DFR0_EL1.PMUver limit to VM creation
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230405/202304052249.pH9CY0dO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=f0b4e13ec229c8ab546688ac097024656c311325
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout f0b4e13ec229c8ab546688ac097024656c311325
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304052249.pH9CY0dO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'pmuver_to_perfmon':
>> arch/arm64/kvm/sys_regs.c:1095:24: error: 'ID_DFR0_PERFMON_IMP_DEF' undeclared (first use in this function); did you mean 'ID_DFR0_PERFMON_8_4'?
    1095 |                 return ID_DFR0_PERFMON_IMP_DEF;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        ID_DFR0_PERFMON_8_4
   arch/arm64/kvm/sys_regs.c:1095:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/sys_regs.c: At top level:
   arch/arm64/kvm/sys_regs.c:1650:20: warning: initialized field overwritten [-Woverride-init]
    1650 |           .reset = reset_pmcr, .reg = PMCR_EL0 },
         |                    ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1650:20: note: (near initialization for 'sys_reg_descs[220].reset')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:71,
                    from include/linux/compiler.h:246,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from arch/arm64/kvm/sys_regs.c:12:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1663:46: note: in expansion of macro 'NULL'
    1663 |           .access = access_pmswinc, .reset = NULL },
         |                                              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[224].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1663:46: note: in expansion of macro 'NULL'
    1663 |           .access = access_pmswinc, .reset = NULL },
         |                                              ^~~~
   arch/arm64/kvm/sys_regs.c:1665:45: warning: initialized field overwritten [-Woverride-init]
    1665 |           .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
         |                                             ^~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1665:45: note: (near initialization for 'sys_reg_descs[225].reset')
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1667:45: note: in expansion of macro 'NULL'
    1667 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[226].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1667:45: note: in expansion of macro 'NULL'
    1667 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1669:45: note: in expansion of macro 'NULL'
    1669 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[227].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1669:45: note: in expansion of macro 'NULL'
    1669 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   arch/arm64/kvm/sys_regs.c:1671:49: warning: initialized field overwritten [-Woverride-init]
    1671 |           .access = access_pmu_evcntr, .reset = reset_unknown,
         |                                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1671:49: note: (near initialization for 'sys_reg_descs[228].reset')
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1674:50: note: in expansion of macro 'NULL'
    1674 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[229].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1674:50: note: in expansion of macro 'NULL'
    1674 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1676:49: note: in expansion of macro 'NULL'
    1676 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[230].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1676:49: note: in expansion of macro 'NULL'
    1676 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   arch/arm64/kvm/sys_regs.c:1682:20: warning: initialized field overwritten [-Woverride-init]
    1682 |           .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1682:20: note: (near initialization for 'sys_reg_descs[231].reset')
   arch/arm64/kvm/sys_regs.c:1002:20: warning: initialized field overwritten [-Woverride-init]
    1002 |           .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
         |                    ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1770:9: note: in expansion of macro 'PMU_PMEVCNTR_EL0'
    1770 |         PMU_PMEVCNTR_EL0(0),
         |         ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1002:20: note: (near initialization for 'sys_reg_descs[312].reset')
    1002 |           .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
         |                    ^~~~~~~~~~~~~~


vim +1095 arch/arm64/kvm/sys_regs.c

  1088	
  1089	static u8 pmuver_to_perfmon(u8 pmuver)
  1090	{
  1091		switch (pmuver) {
  1092		case ID_AA64DFR0_EL1_PMUVer_IMP:
  1093			return ID_DFR0_PERFMON_8_0;
  1094		case ID_AA64DFR0_EL1_PMUVer_IMP_DEF:
> 1095			return ID_DFR0_PERFMON_IMP_DEF;
  1096		default:
  1097			/* Anything ARMv8.1+ and NI have the same value. For now. */
  1098			return pmuver;
  1099		}
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
