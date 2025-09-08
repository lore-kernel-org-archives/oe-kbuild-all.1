Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E12F0C6C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348416; cv=none; b=HSGNtYkIglzdPE+gMc4KPFtYKw/ccMU84Qs7wgWdVTbYpdVtFqMcdAIlDwYvJ/fEUGAIUQ+V/XFM7SHcVrQAqD54MY1Pr3MUbHsnm3469Qb+R9KDXd8j7alWWY5fagnYAdk+fnQ7S+9aedaSlRYdzZxXaeMmHQceINbdbnOLz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348416; c=relaxed/simple;
	bh=A3wOVSJJb2+aMWJSL1L4euYQwJIajJcx4igK14YeKyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6GfdHE15AxR0PIQIL2gbwkRidADCDrWsdEyPfXNNIaZbYQk6a0PQl9T4VnrAis+Nh65mfZ7o0EUUBSJZ4B+D4wVOknUho958RbhAC8Rr1KTBhYPU0PvBBJiJJEqx0b+ius1MQ4YFEAaRTaANkxI9V+EDs3rkDyZtDmwHPkWJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFLSwOWx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFLSwOWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757348414; x=1788884414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3wOVSJJb2+aMWJSL1L4euYQwJIajJcx4igK14YeKyw=;
  b=hFLSwOWxOC0xVen4Vo7o6nVcNrIXtj5VzpZr7S4Sb9YXu8fq0+vP15h5
   dkQbVafNhDkb8Uv32u0O94qkTzdPiPEhAyomTOmp3RCfTlqItXNZ/7SV5
   QdWl2kPBpJXUOE6VexII41q/mDj2hSrqinxVbeDGCSyWxe4jTln32pjlu
   KZh0VA0m0s6/aeTJLULE8ocfGwzdUuCKmnHqh0+UGkU6AGtePyzWbowg3
   xEIFmWyETqLwDepoceuMj9jx+FMAYAQ7OypuPyx0TcFZA/hw6trSgxLMG
   xDqDdGYL4rWBFCmp/lXtQ2XJ4uqSiGjTo63YgaSje03MchD/JqRyQZtgo
   g==;
X-CSE-ConnectionGUID: fmz5ajb0SP+BoonEuVS4EA==
X-CSE-MsgGUID: w/rzHbIBTNGxH5fFlLydmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58823805"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="58823805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:20:14 -0700
X-CSE-ConnectionGUID: 2nZIDXtTTpazx2sx5m2jIQ==
X-CSE-MsgGUID: VV91HK49TZ+0ouGoDV0Mrg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2025 09:20:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvebC-0003yV-1U;
	Mon, 08 Sep 2025 16:20:10 +0000
Date: Tue, 9 Sep 2025 00:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2868/2868] arch/arm64/kvm/sys_regs.c:282:19:
 warning: unused variable 'val'
Message-ID: <202509090252.kSGtR6Xq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   00fccee10860a6b522c55bd4b2f4b40d349c2b52
commit: bd2967e62cdff04cb036b503622eea13c5cfb1be [2868/2868] arm64: Fix actlr_el1 can not set problem in guest
config: arm64-randconfig-003-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090252.kSGtR6Xq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090252.kSGtR6Xq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090252.kSGtR6Xq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'access_actlr':
>> arch/arm64/kvm/sys_regs.c:282:19: warning: unused variable 'val' [-Wunused-variable]
     282 |  u64 mask, shift, val;
         |                   ^~~
   arch/arm64/kvm/sys_regs.c: At top level:
   arch/arm64/kvm/sys_regs.c:2373:59: warning: initialized field overwritten [-Woverride-init]
    2373 |  { PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
         |                                                           ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2373:59: note: (near initialization for 'sys_reg_descs[345].reset')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:71,
                    from include/linux/compiler.h:270,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from arch/arm64/kvm/sys_regs.c:12:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2387:39: note: in expansion of macro 'NULL'
    2387 |    .access = access_pmswinc, .reset = NULL },
         |                                       ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[349].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2387:39: note: in expansion of macro 'NULL'
    2387 |    .access = access_pmswinc, .reset = NULL },
         |                                       ^~~~
   arch/arm64/kvm/sys_regs.c:2389:38: warning: initialized field overwritten [-Woverride-init]
    2389 |    .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
         |                                      ^~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2389:38: note: (near initialization for 'sys_reg_descs[350].reset')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:71,
                    from include/linux/compiler.h:270,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from arch/arm64/kvm/sys_regs.c:12:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2391:38: note: in expansion of macro 'NULL'
    2391 |    .access = access_pmceid, .reset = NULL },
         |                                      ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[351].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2391:38: note: in expansion of macro 'NULL'
    2391 |    .access = access_pmceid, .reset = NULL },
         |                                      ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2393:38: note: in expansion of macro 'NULL'
    2393 |    .access = access_pmceid, .reset = NULL },
         |                                      ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[352].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2393:38: note: in expansion of macro 'NULL'
    2393 |    .access = access_pmceid, .reset = NULL },
         |                                      ^~~~
   arch/arm64/kvm/sys_regs.c:2395:42: warning: initialized field overwritten [-Woverride-init]
    2395 |    .access = access_pmu_evcntr, .reset = reset_unknown,
         |                                          ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2395:42: note: (near initialization for 'sys_reg_descs[353].reset')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:71,
                    from include/linux/compiler.h:270,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from arch/arm64/kvm/sys_regs.c:12:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2398:43: note: in expansion of macro 'NULL'
    2398 |    .access = access_pmu_evtyper, .reset = NULL },
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[354].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2398:43: note: in expansion of macro 'NULL'
    2398 |    .access = access_pmu_evtyper, .reset = NULL },
         |                                           ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:2400:42: note: in expansion of macro 'NULL'
    2400 |    .access = access_pmu_evcntr, .reset = NULL },
         |                                          ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[355].reset')

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/val +282 arch/arm64/kvm/sys_regs.c

   277	
   278	static bool access_actlr(struct kvm_vcpu *vcpu,
   279				 struct sys_reg_params *p,
   280				 const struct sys_reg_desc *r)
   281	{
 > 282		u64 mask, shift, val;
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
