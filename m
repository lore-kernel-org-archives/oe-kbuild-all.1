Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FDD10A1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9FP5B61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700303964; x=1731839964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YO7hN2Z+pVvySlX3XsAEObFdP/Gmug/jm1BiGEAPduI=;
  b=Q9FP5B61T2CWCvis1tt1DsGpFxx2LJiOBUNsgWV3XZQ4jG0JBBbYA6ie
   d7YiaRFCKyWigaI6gy3aiSaEbi80bTQBfEJckgGgrlp90mrU4obQjWDu3
   2H2maDN72W7wEVbxL2aHGoFqgTcK/ajzuK3c7e6vh7OL3zgRGD4TYcwjM
   N7InjgUgD2+CbWIKEw1QTekX2RhXz2cHSl8qEIFuGOEitlBqDLLLE0pxJ
   Lm0pEf0hnEXKXWtJb5pudJLtCFB0NIYT92GMNG3ZGCKOsxIN8A7k9ZqFV
   StrFKz9trCgF7M3nZ7GPbyb31zCJRAXnLFvUzldyZnIpVMzmoVQPdC2yD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="391200921"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="391200921"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 02:39:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="883381071"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="883381071"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2023 02:39:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4IjO-0003oJ-1p;
	Sat, 18 Nov 2023 10:39:18 +0000
Date: Sat, 18 Nov 2023 18:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 23/26] arch/arm64/kvm/sys_regs.c:1592:12:
 warning: 'read_sanitised_id_aa64smfr0_el1' defined but not used
Message-ID: <202311181853.lm3NHUES-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   8a76f0a3874718ecb420e3c8915c591d751b5d6c
commit: 5c193236894fdc86f576d1051efb89875536112d [23/26] KVM: arm64: Support SME version configuration via ID registers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231118/202311181853.lm3NHUES-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181853.lm3NHUES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181853.lm3NHUES-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2541:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2541 |         PMU_PMEVTYPER_EL0(23),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[381].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2541:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2541 |         PMU_PMEVTYPER_EL0(23),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2542:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2542 |         PMU_PMEVTYPER_EL0(24),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[382].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2542:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2542 |         PMU_PMEVTYPER_EL0(24),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2543:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2543 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[383].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2543:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2543 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2544:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2544 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[384].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2544:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2544 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2545:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2545 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[385].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2545:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2545 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2546:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2546 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[386].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2546:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2546 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2547:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2547 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[387].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2547:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2547 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: warning: initialized field overwritten [-Woverride-init]
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2548:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2548 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1217:20: note: (near initialization for 'sys_reg_descs[388].reset')
    1217 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2548:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2548 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2554:20: warning: initialized field overwritten [-Woverride-init]
    2554 |           .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2554:20: note: (near initialization for 'sys_reg_descs[389].reset')
>> arch/arm64/kvm/sys_regs.c:1592:12: warning: 'read_sanitised_id_aa64smfr0_el1' defined but not used [-Wunused-function]
    1592 | static u64 read_sanitised_id_aa64smfr0_el1(struct kvm_vcpu *vcpu,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:1578:12: warning: 'read_sanitised_id_aa64pfr1_el1' defined but not used [-Wunused-function]
    1578 | static u64 read_sanitised_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/read_sanitised_id_aa64smfr0_el1 +1592 arch/arm64/kvm/sys_regs.c

  1577	
> 1578	static u64 read_sanitised_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
  1579						  const struct sys_reg_desc *rd)
  1580	{
  1581		u64 val = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
  1582	
  1583		if (!vcpu_has_sme(vcpu))
  1584			val &= ~ID_AA64PFR1_EL1_SME_MASK;
  1585	
  1586		if (!kvm_has_mte(vcpu->kvm))
  1587			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
  1588	
  1589		return val;
  1590	}
  1591	
> 1592	static u64 read_sanitised_id_aa64smfr0_el1(struct kvm_vcpu *vcpu,
  1593						  const struct sys_reg_desc *rd)
  1594	{
  1595		u64 val = read_sanitised_ftr_reg(SYS_ID_AA64SMFR0_EL1);
  1596	
  1597		if (!vcpu_has_sme(vcpu))
  1598			val = 0;
  1599	
  1600		return val;
  1601	}
  1602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
