Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264AEC5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680696376; x=1712232376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COvpUxrwafFyrUgd+0Wx5Zhw8ZKa/ypZ8qtsEZu6WT4=;
  b=A5d+xrFQ4R7yg8FTFyuix7RCd19ljOWjaHD9SxzMLHBeukunulJvjj+C
   8L2/87yIsT7dwTdRsh69c6MFHIfMWFaKuvgGGRWJpBZOWWd/Lc4Si7beS
   GvuG72YFxyKFLOMTKrunFOcheXM6nazRFonZ25rNSPztE6/o38C99w3T6
   FAQnSg4rv8GqrCDbnAqUcZkpWPLj6OQnnLW8+f3AzGdHMua89ne++rhVZ
   iXf5yCXA9Onv/WIIqQmkjMjLietgZHLcw6Uaw+QmnEEr39Rdm8QzB8F+x
   LOqKcnjnw09l+C8buykPZe6F2qU84fcTkQsSLodQ89IGavWTgXswS3Bbx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342451992"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="342451992"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 05:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="717011991"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="717011991"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 05:06:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk1u0-000QWS-2o;
	Wed, 05 Apr 2023 12:06:12 +0000
Date: Wed, 5 Apr 2023 20:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 93/95] arch/arm64/kvm/sys_regs.c:993:47:
 error: 'const struct sys_reg_desc' has no member named 'visibility'
Message-ID: <202304051951.ejvm4Kvs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   da9af1395e70728c28eb2886e73b51487f2d0562
commit: 500da863092cdd213e0663372cbe6ab7fc0558c9 [93/95] KVM: arm64: Hide PMU registers from userspace when not available
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230405/202304051951.ejvm4Kvs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=500da863092cdd213e0663372cbe6ab7fc0558c9
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 500da863092cdd213e0663372cbe6ab7fc0558c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051951.ejvm4Kvs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'pmu_visibility':
   arch/arm64/kvm/sys_regs.c:621:13: error: implicit declaration of function 'kvm_vcpu_has_pmu'; did you mean 'kvm_vcpu_is_be'? [-Werror=implicit-function-declaration]
     621 |         if (kvm_vcpu_has_pmu(vcpu))
         |             ^~~~~~~~~~~~~~~~
         |             kvm_vcpu_is_be
   arch/arm64/kvm/sys_regs.c:624:16: error: 'REG_HIDDEN' undeclared (first use in this function); did you mean 'FTR_HIDDEN'?
     624 |         return REG_HIDDEN;
         |                ^~~~~~~~~~
         |                FTR_HIDDEN
   arch/arm64/kvm/sys_regs.c:624:16: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/sys_regs.c: At top level:
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1343:11: note: in expansion of macro 'PMU_SYS_REG'
    1343 |         { PMU_SYS_REG(SYS_PMINTENSET_EL1),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1343:11: note: in expansion of macro 'PMU_SYS_REG'
    1343 |         { PMU_SYS_REG(SYS_PMINTENSET_EL1),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[156].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1343:11: note: in expansion of macro 'PMU_SYS_REG'
    1343 |         { PMU_SYS_REG(SYS_PMINTENSET_EL1),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1343:11: note: in expansion of macro 'PMU_SYS_REG'
    1343 |         { PMU_SYS_REG(SYS_PMINTENSET_EL1),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[156].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1343:11: note: in expansion of macro 'PMU_SYS_REG'
    1343 |         { PMU_SYS_REG(SYS_PMINTENSET_EL1),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1345:11: note: in expansion of macro 'PMU_SYS_REG'
    1345 |         { PMU_SYS_REG(SYS_PMINTENCLR_EL1),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1345:11: note: in expansion of macro 'PMU_SYS_REG'
    1345 |         { PMU_SYS_REG(SYS_PMINTENCLR_EL1),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[157].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1345:11: note: in expansion of macro 'PMU_SYS_REG'
    1345 |         { PMU_SYS_REG(SYS_PMINTENCLR_EL1),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1345:11: note: in expansion of macro 'PMU_SYS_REG'
    1345 |         { PMU_SYS_REG(SYS_PMINTENCLR_EL1),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[157].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1345:11: note: in expansion of macro 'PMU_SYS_REG'
    1345 |         { PMU_SYS_REG(SYS_PMINTENCLR_EL1),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1380:11: note: in expansion of macro 'PMU_SYS_REG'
    1380 |         { PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1380:11: note: in expansion of macro 'PMU_SYS_REG'
    1380 |         { PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[183].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1380:11: note: in expansion of macro 'PMU_SYS_REG'
    1380 |         { PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1380:11: note: in expansion of macro 'PMU_SYS_REG'
    1380 |         { PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[183].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1380:11: note: in expansion of macro 'PMU_SYS_REG'
    1380 |         { PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1381:20: warning: initialized field overwritten [-Woverride-init]
    1381 |           .reset = reset_pmcr, .reg = PMCR_EL0 },
         |                    ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1381:20: note: (near initialization for 'sys_reg_descs[183].reset')
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1382:11: note: in expansion of macro 'PMU_SYS_REG'
    1382 |         { PMU_SYS_REG(SYS_PMCNTENSET_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1382:11: note: in expansion of macro 'PMU_SYS_REG'
    1382 |         { PMU_SYS_REG(SYS_PMCNTENSET_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[184].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1382:11: note: in expansion of macro 'PMU_SYS_REG'
    1382 |         { PMU_SYS_REG(SYS_PMCNTENSET_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1382:11: note: in expansion of macro 'PMU_SYS_REG'
    1382 |         { PMU_SYS_REG(SYS_PMCNTENSET_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[184].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1382:11: note: in expansion of macro 'PMU_SYS_REG'
    1382 |         { PMU_SYS_REG(SYS_PMCNTENSET_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1384:11: note: in expansion of macro 'PMU_SYS_REG'
    1384 |         { PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1384:11: note: in expansion of macro 'PMU_SYS_REG'
    1384 |         { PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[185].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1384:11: note: in expansion of macro 'PMU_SYS_REG'
    1384 |         { PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1384:11: note: in expansion of macro 'PMU_SYS_REG'
    1384 |         { PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[185].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1384:11: note: in expansion of macro 'PMU_SYS_REG'
    1384 |         { PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1386:11: note: in expansion of macro 'PMU_SYS_REG'
    1386 |         { PMU_SYS_REG(SYS_PMOVSCLR_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1386:11: note: in expansion of macro 'PMU_SYS_REG'
    1386 |         { PMU_SYS_REG(SYS_PMOVSCLR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[186].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1386:11: note: in expansion of macro 'PMU_SYS_REG'
    1386 |         { PMU_SYS_REG(SYS_PMOVSCLR_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1386:11: note: in expansion of macro 'PMU_SYS_REG'
    1386 |         { PMU_SYS_REG(SYS_PMOVSCLR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[186].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1386:11: note: in expansion of macro 'PMU_SYS_REG'
    1386 |         { PMU_SYS_REG(SYS_PMOVSCLR_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1388:11: note: in expansion of macro 'PMU_SYS_REG'
    1388 |         { PMU_SYS_REG(SYS_PMSWINC_EL0),
         |           ^~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1388:11: note: in expansion of macro 'PMU_SYS_REG'
    1388 |         { PMU_SYS_REG(SYS_PMSWINC_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[187].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1388:11: note: in expansion of macro 'PMU_SYS_REG'
    1388 |         { PMU_SYS_REG(SYS_PMSWINC_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1388:11: note: in expansion of macro 'PMU_SYS_REG'
    1388 |         { PMU_SYS_REG(SYS_PMSWINC_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[187].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1388:11: note: in expansion of macro 'PMU_SYS_REG'
    1388 |         { PMU_SYS_REG(SYS_PMSWINC_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1390:11: note: in expansion of macro 'PMU_SYS_REG'
    1390 |         { PMU_SYS_REG(SYS_PMSELR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1390:11: note: in expansion of macro 'PMU_SYS_REG'
    1390 |         { PMU_SYS_REG(SYS_PMSELR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[188].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1390:11: note: in expansion of macro 'PMU_SYS_REG'
    1390 |         { PMU_SYS_REG(SYS_PMSELR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1390:11: note: in expansion of macro 'PMU_SYS_REG'
    1390 |         { PMU_SYS_REG(SYS_PMSELR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[188].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1390:11: note: in expansion of macro 'PMU_SYS_REG'
    1390 |         { PMU_SYS_REG(SYS_PMSELR_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:47: error: 'const struct sys_reg_desc' has no member named 'visibility'
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                               ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1392:11: note: in expansion of macro 'PMU_SYS_REG'
    1392 |         { PMU_SYS_REG(SYS_PMCEID0_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: warning: initialization of 'int' from 'unsigned int (*)(const struct kvm_vcpu *, const struct sys_reg_desc *)' makes integer from pointer without a cast [-Wint-conversion]
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1392:11: note: in expansion of macro 'PMU_SYS_REG'
    1392 |         { PMU_SYS_REG(SYS_PMCEID0_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[189].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1392:11: note: in expansion of macro 'PMU_SYS_REG'
    1392 |         { PMU_SYS_REG(SYS_PMCEID0_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: error: initializer element is not computable at load time
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1392:11: note: in expansion of macro 'PMU_SYS_REG'
    1392 |         { PMU_SYS_REG(SYS_PMCEID0_EL0),
         |           ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:993:60: note: (near initialization for 'sys_reg_descs[189].reg')
     993 |         SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
         |                                                            ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1392:11: note: in expansion of macro 'PMU_SYS_REG'
    1392 |         { PMU_SYS_REG(SYS_PMCEID0_EL0),
         |           ^~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/bsearch.h:5,
                    from arch/arm64/kvm/sys_regs.c:23:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1393:45: note: in expansion of macro 'NULL'
    1393 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[189].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1393:45: note: in expansion of macro 'NULL'
    1393 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~


vim +993 arch/arm64/kvm/sys_regs.c

   980	
   981	/* Silly macro to expand the DBG{BCR,BVR,WVR,WCR}n_EL1 registers in one go */
   982	#define DBG_BCR_BVR_WCR_WVR_EL1(n)					\
   983		{ SYS_DESC(SYS_DBGBVRn_EL1(n)),					\
   984		  trap_bvr, reset_bvr, 0, 0, get_bvr, set_bvr },		\
   985		{ SYS_DESC(SYS_DBGBCRn_EL1(n)),					\
   986		  trap_bcr, reset_bcr, 0, 0, get_bcr, set_bcr },		\
   987		{ SYS_DESC(SYS_DBGWVRn_EL1(n)),					\
   988		  trap_wvr, reset_wvr, 0, 0,  get_wvr, set_wvr },		\
   989		{ SYS_DESC(SYS_DBGWCRn_EL1(n)),					\
   990		  trap_wcr, reset_wcr, 0, 0,  get_wcr, set_wcr }
   991	
   992	#define PMU_SYS_REG(r)						\
 > 993		SYS_DESC(r), .reset = reset_unknown, .visibility = pmu_visibility
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
