Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4D87FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680682205; x=1712218205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/m8m6lAD1Mb6PrZtRVU4004a1Ax/sPTZmNPSUe4u+8=;
  b=XHWWoBBttfC1zJGLUYRUfcpfu2fKKgZSHOJIdnAzOPcUj55fEIR4CVwF
   DEmq+Y5qXPf9gwZ600UXcigv8EUCFdceTfqANVH0UfKqYLT+qrbZ+HmBo
   VgItz0286OmB4nd5fvP3L8HhQqab10AMjgdkMjll24Vnly/VlOvh+7DYy
   pZ9i4bZF7p5Pac5bFonur8BMxJiGEVRUmYsjQLoIeKs0wQWnAt7UJHxm1
   QB5uwLfSvoQRpCjlq+IbUAjCoj1Cv44jQEqiZkuqbNZK+v8HYWu2PABSB
   W8SaRBUAOHI76M3CSewjCmRZVx3gWk/ewJ6SF4C0YmICAJ7ZgBJOycTbW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326430830"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="326430830"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 01:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686664551"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="686664551"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 01:10:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjyDT-000QPK-1I;
	Wed, 05 Apr 2023 08:10:03 +0000
Date: Wed, 5 Apr 2023 16:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 109/111]
 arch/arm64/kvm/sys_regs.c:627:13: error: implicit declaration of function
 'kvm_vcpu_has_pmu'; did you mean 'kvm_vcpu_is_be'?
Message-ID: <202304051559.dobiG02Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   2adf01e9af586f04ea8bec5dabbd370aceacdccb
commit: 4b52943eb2009f35a0f759c984483e89f73ff353 [109/111] KVM: arm64: Hide PMU registers from userspace when not available
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230405/202304051559.dobiG02Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=4b52943eb2009f35a0f759c984483e89f73ff353
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 4b52943eb2009f35a0f759c984483e89f73ff353
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051559.dobiG02Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'pmu_visibility':
>> arch/arm64/kvm/sys_regs.c:627:13: error: implicit declaration of function 'kvm_vcpu_has_pmu'; did you mean 'kvm_vcpu_is_be'? [-Werror=implicit-function-declaration]
     627 |         if (kvm_vcpu_has_pmu(vcpu))
         |             ^~~~~~~~~~~~~~~~
         |             kvm_vcpu_is_be
>> arch/arm64/kvm/sys_regs.c:630:16: error: 'REG_HIDDEN' undeclared (first use in this function); did you mean 'FTR_HIDDEN'?
     630 |         return REG_HIDDEN;
         |                ^~~~~~~~~~
         |                FTR_HIDDEN
   arch/arm64/kvm/sys_regs.c:630:16: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/sys_regs.c: At top level:
   arch/arm64/kvm/sys_regs.c:1556:20: warning: initialized field overwritten [-Woverride-init]
    1556 |           .reset = reset_pmcr, .reg = PMCR_EL0 },
         |                    ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1556:20: note: (near initialization for 'sys_reg_descs[197].reset')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/bsearch.h:5,
                    from arch/arm64/kvm/sys_regs.c:12:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1568:45: note: in expansion of macro 'NULL'
    1568 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[203].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1568:45: note: in expansion of macro 'NULL'
    1568 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1570:45: note: in expansion of macro 'NULL'
    1570 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[204].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1570:45: note: in expansion of macro 'NULL'
    1570 |           .access = access_pmceid, .reset = NULL },
         |                                             ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1574:50: note: in expansion of macro 'NULL'
    1574 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[206].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1574:50: note: in expansion of macro 'NULL'
    1574 |           .access = access_pmu_evtyper, .reset = NULL },
         |                                                  ^~~~
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1576:49: note: in expansion of macro 'NULL'
    1576 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'sys_reg_descs[207].reset')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm64/kvm/sys_regs.c:1576:49: note: in expansion of macro 'NULL'
    1576 |           .access = access_pmu_evcntr, .reset = NULL },
         |                                                 ^~~~
   arch/arm64/kvm/sys_regs.c:1582:20: warning: initialized field overwritten [-Woverride-init]
    1582 |           .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1582:20: note: (near initialization for 'sys_reg_descs[208].reset')
   arch/arm64/kvm/sys_regs.c:1662:20: warning: initialized field overwritten [-Woverride-init]
    1662 |           .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1662:20: note: (near initialization for 'sys_reg_descs[277].reset')
   arch/arm64/kvm/sys_regs.c: In function 'pmu_visibility':
   arch/arm64/kvm/sys_regs.c:631:1: error: control reaches end of non-void function [-Werror=return-type]
     631 | }
         | ^
   cc1: some warnings being treated as errors


vim +627 arch/arm64/kvm/sys_regs.c

   623	
   624	static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
   625					   const struct sys_reg_desc *r)
   626	{
 > 627		if (kvm_vcpu_has_pmu(vcpu))
   628			return 0;
   629	
 > 630		return REG_HIDDEN;
   631	}
   632	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
