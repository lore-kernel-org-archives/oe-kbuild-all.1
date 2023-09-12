Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1017E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 02:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694487373; x=1726023373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8VIc2ZeSiQFfIsfLgbTAne9hXIMdxxj5H1TIoldJwOk=;
  b=GGaeBGoh4M9ZGgn1xYq+BhYFrs9JY/rMfZai15bzfDqktgjRBC9zJngj
   Z4tTgrM3ZXz2xOQwzoiXhRNG3T7SHdaGs9SmHolsbQEs0KgYiO73kkogT
   NAs2J+fW7J9bP83TrPhdl1OkDEqcQb6BEJNvKXUwDbAmRVwsFHXU1zpla
   9s1bgv0aMg6kamEbIDzFqn2JrcjJOnCfs4+mdsWK5BT0EScU6NhCBtHEc
   782Dav+Hgkx6IJuejZIYkOZeBNj1Ct7QgG52atG+Ls5X6ZQhFeDb/gV34
   9R0ag169G7UM4torYND+RwiH9WmDeD5qiNsQA7FTvsVoghZpLglUTs75F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464629274"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="464629274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 19:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833735256"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833735256"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 19:56:11 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qftZR-0007Ay-0Z;
	Tue, 12 Sep 2023 02:56:09 +0000
Date: Tue, 12 Sep 2023 10:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 22/22] arch/arm64/kvm/sys_regs.c:1505:12:
 warning: 'read_sanitised_id_aa64smfr_el1' defined but not used
Message-ID: <202309121048.1g9L6iEK-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230912/202309121048.1g9L6iEK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121048.1g9L6iEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121048.1g9L6iEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2400:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2400 |         PMU_PMEVTYPER_EL0(23),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[381].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2400:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2400 |         PMU_PMEVTYPER_EL0(23),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2401:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2401 |         PMU_PMEVTYPER_EL0(24),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[382].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2401:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2401 |         PMU_PMEVTYPER_EL0(24),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2402:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2402 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[383].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2402:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2402 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2403:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2403 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[384].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2403:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2403 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2404:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2404 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[385].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2404:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2404 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2405:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2405 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[386].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2405:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2405 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2406:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2406 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[387].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2406:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2406 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: warning: initialized field overwritten [-Woverride-init]
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2407:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2407 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1142:20: note: (near initialization for 'sys_reg_descs[388].reset')
    1142 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2407:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2407 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2413:20: warning: initialized field overwritten [-Woverride-init]
    2413 |           .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2413:20: note: (near initialization for 'sys_reg_descs[389].reset')
>> arch/arm64/kvm/sys_regs.c:1505:12: warning: 'read_sanitised_id_aa64smfr_el1' defined but not used [-Wunused-function]
    1505 | static u64 read_sanitised_id_aa64smfr_el1(struct kvm_vcpu *vcpu,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/read_sanitised_id_aa64smfr_el1 +1505 arch/arm64/kvm/sys_regs.c

  1504	
> 1505	static u64 read_sanitised_id_aa64smfr_el1(struct kvm_vcpu *vcpu,
  1506						  const struct sys_reg_desc *rd)
  1507	{
  1508		u64 val = read_sanitised_ftr_reg(SYS_ID_AA64SMFR1_EL1);
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
