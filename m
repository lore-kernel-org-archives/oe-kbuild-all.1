Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7665017D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 05:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694496323; x=1726032323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TB6ypRdYhux97a+jNvaWbN8K4Q81uDo6mqY+EXtSRIM=;
  b=IWnH4AfkUzRYTFeMzE9IEQU9eev41Ds/ZicRiohpHxWUy1u9rP0kG57t
   tTYIRzNneEldSDiLokMhddMcEbqhPUI48FjbX78V9796d0GrALO4pIpJi
   48OmMhprRG9KTBq0wup3tGjzySUiDUaZZYOQF9U4KmK93cBKtP8JL63t2
   Preq/aa5t2oJSoE4tlnsaorAfBkEILeQw1AO6SqmaWc49pGc03kejTnT8
   KLPJfAYDmdk/2KEoeOCg6DUzsf+XJvzTbAyI1Qp1DPlDmXe15xsj+LM63
   SELmJXc4C74Mvko1v05WuwUBry/5f3bdBAFvS8kzj/e30M0pfIPiODbbA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378188941"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="378188941"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 22:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886815321"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="886815321"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2023 22:24:55 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfvtn-0007NC-0h;
	Tue, 12 Sep 2023 05:25:19 +0000
Date: Tue, 12 Sep 2023 13:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 22/22] arch/arm64/kvm/sys_regs.c:1508:42:
 error: 'SYS_ID_AA64SMFR1_EL1' undeclared; did you mean
 'SYS_ID_AA64MMFR1_EL1'?
Message-ID: <202309121313.KZ5IuToM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   ef6f1cbc96dcd3e50e1e42e7269f3f90a1199abc
commit: ef6f1cbc96dcd3e50e1e42e7269f3f90a1199abc [22/22] KVM: arm64: Support SME version configuration via ID registers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230912/202309121313.KZ5IuToM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121313.KZ5IuToM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121313.KZ5IuToM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'read_sanitised_id_aa64smfr_el1':
>> arch/arm64/kvm/sys_regs.c:1508:42: error: 'SYS_ID_AA64SMFR1_EL1' undeclared (first use in this function); did you mean 'SYS_ID_AA64MMFR1_EL1'?
    1508 |         u64 val = read_sanitised_ftr_reg(SYS_ID_AA64SMFR1_EL1);
         |                                          ^~~~~~~~~~~~~~~~~~~~
         |                                          SYS_ID_AA64MMFR1_EL1
   arch/arm64/kvm/sys_regs.c:1508:42: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/arm64/kvm/sys_regs.c:34:
   arch/arm64/kvm/sys_regs.c: At top level:
>> arch/arm64/kvm/sys_regs.c:2070:20: error: 'SYS_ID_AA64SMFR1_EL1' undeclared here (not in a function); did you mean 'SYS_ID_AA64MMFR1_EL1'?
    2070 |         { SYS_DESC(SYS_ID_AA64SMFR1_EL1),
         |                    ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.h:237:32: note: in definition of macro 'Op0'
     237 | #define Op0(_x)         .Op0 = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:245:13: note: in expansion of macro 'sys_reg_Op0'
     245 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |             ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2070:11: note: in expansion of macro 'SYS_DESC'
    2070 |         { SYS_DESC(SYS_ID_AA64SMFR1_EL1),
         |           ^~~~~~~~
>> arch/arm64/kvm/sys_regs.c:2074:20: error: 'read_sanitised_id_aa64smfr1_el1' undeclared here (not in a function); did you mean 'read_sanitised_id_aa64smfr_el1'?
    2074 |           .reset = read_sanitised_id_aa64smfr1_el1, },
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    read_sanitised_id_aa64smfr_el1
   arch/arm64/kvm/sys_regs.c:2223:20: warning: initialized field overwritten [-Woverride-init]
    2223 |           .reset = reset_pmcr, .reg = PMCR_EL0 },
         |                    ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2223:20: note: (near initialization for 'sys_reg_descs[233].reset')
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
   arch/arm64/kvm/sys_regs.c:2236:46: note: in expansion of macro 'NULL'
    2236 |           .access = access_pmswinc, .reset = NULL },
         |                                              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[237].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2236:46: note: in expansion of macro 'NULL'
    2236 |           .access = access_pmswinc, .reset = NULL },
         |                                              ^~~~
   arch/arm64/kvm/sys_regs.c:2238:45: warning: initialized field overwritten [-Woverride-init]
    2238 |           .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
         |                                             ^~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2238:45: note: (near initialization for 'sys_reg_descs[238].reset')
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2240:45: note: in expansion of macro 'NULL'
    2240 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[239].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2240:45: note: in expansion of macro 'NULL'
    2240 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2242:45: note: in expansion of macro 'NULL'
    2242 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[240].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2242:45: note: in expansion of macro 'NULL'
    2242 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   arch/arm64/kvm/sys_regs.c:2244:49: warning: initialized field overwritten [-Woverride-init]
    2244 |           .access = access_pmu_evcntr, .reset = reset_unknown,
         |                                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2244:49: note: (near initialization for 'sys_reg_descs[241].reset')
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2247:50: note: in expansion of macro 'NULL'
    2247 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[242].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2247:50: note: in expansion of macro 'NULL'
    2247 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2249:49: note: in expansion of macro 'NULL'
    2249 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[243].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2249:49: note: in expansion of macro 'NULL'
    2249 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   arch/arm64/kvm/sys_regs.c:2255:20: warning: initialized field overwritten [-Woverride-init]
    2255 |           .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2255:20: note: (near initialization for 'sys_reg_descs[244].reset')
   arch/arm64/kvm/sys_regs.c:1136:20: warning: initialized field overwritten [-Woverride-init]
    1136 |           .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
         |                    ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2345:9: note: in expansion of macro 'PMU_PMEVCNTR_EL0'
    2345 |         PMU_PMEVCNTR_EL0(0),
         |         ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1136:20: note: (near initialization for 'sys_reg_descs[327].reset')
    1136 |           .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
         |                    ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2345:9: note: in expansion of macro 'PMU_PMEVCNTR_EL0'
    2345 |         PMU_PMEVCNTR_EL0(0),


vim +1508 arch/arm64/kvm/sys_regs.c

  1504	
  1505	static u64 read_sanitised_id_aa64smfr_el1(struct kvm_vcpu *vcpu,
  1506						  const struct sys_reg_desc *rd)
  1507	{
> 1508		u64 val = read_sanitised_ftr_reg(SYS_ID_AA64SMFR1_EL1);
  1509	
  1510		if (!vcpu_has_sme(vcpu))
  1511			val = 0;
  1512	
  1513		return val;
  1514	}
  1515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
