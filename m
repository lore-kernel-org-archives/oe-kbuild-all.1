Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB467C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690665134; x=1722201134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5xinBK6hSPWsJrE1kfLgF5/KuC/H8qIsScD2vc0HOc=;
  b=KVP+iff5aITp64gIpis+haUY7FaQQtH6ChwUeTrb9kWfqGpVCg5O0rQr
   Gbnt0KYoa8d3wunjVzIgQ4R+4bYhWESdPoQG/xPuY52Zm/c4dw5ucl6lj
   Ya4Eeqi3oMYar2FnO2cb2iGCh56l4DF834PoHoAslAozS9D9JSwNGXOWI
   Ncr5wkdXkuk1HlhGv7VzfXf7Dy5IXAQw2ghxPdBOoRfvkPmTPmahlCTDv
   Pac9PRhYmeoyfXbXU0szkMFfM+2ZPnzWxBf53ievJcZxF+FODRGamSVya
   KXdrx/NHWMC8CmsoRlaEz+v2mtY+vub9xupVGvWig37tXPmsVfKUXvNkg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="358822208"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="358822208"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 14:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="677869719"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="677869719"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Jul 2023 14:12:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPrED-0004IV-20;
	Sat, 29 Jul 2023 21:12:02 +0000
Date: Sun, 30 Jul 2023 05:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/get_writeable_feature_regs 3/3]
 arch/arm64/kvm/sys_regs.c:3642:5: warning: no previous prototype for
 'kvm_get_writeable_feature_regs'
Message-ID: <202307300555.SplHph7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/get_writeable_feature_regs
head:   940bf6a71f52952f6d9e77bc3af0579af83e10b8
commit: 940bf6a71f52952f6d9e77bc3af0579af83e10b8 [3/3] KVM: arm64: kvm_get_writeable_feature_regs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230730/202307300555.SplHph7G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300555.SplHph7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300555.SplHph7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2345:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2345 |         PMU_PMEVTYPER_EL0(23),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[380].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2345:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2345 |         PMU_PMEVTYPER_EL0(23),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2346:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2346 |         PMU_PMEVTYPER_EL0(24),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[381].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2346:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2346 |         PMU_PMEVTYPER_EL0(24),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2347:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2347 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[382].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2347:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2347 |         PMU_PMEVTYPER_EL0(25),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2348:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2348 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[383].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2348:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2348 |         PMU_PMEVTYPER_EL0(26),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2349:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2349 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[384].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2349:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2349 |         PMU_PMEVTYPER_EL0(27),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2350:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2350 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[385].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2350:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2350 |         PMU_PMEVTYPER_EL0(28),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2351:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2351 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[386].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2351:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2351 |         PMU_PMEVTYPER_EL0(29),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: warning: initialized field overwritten [-Woverride-init]
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2352:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2352 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1130:20: note: (near initialization for 'sys_reg_descs[387].reset')
    1130 |           .reset = reset_pmevtyper,                                     \
         |                    ^~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2352:9: note: in expansion of macro 'PMU_PMEVTYPER_EL0'
    2352 |         PMU_PMEVTYPER_EL0(30),
         |         ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2358:20: warning: initialized field overwritten [-Woverride-init]
    2358 |           .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
         |                    ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2358:20: note: (near initialization for 'sys_reg_descs[388].reset')
>> arch/arm64/kvm/sys_regs.c:3642:5: warning: no previous prototype for 'kvm_get_writeable_feature_regs' [-Wmissing-prototypes]
    3642 | int kvm_get_writeable_feature_regs(struct kvm *kvm, u64 __user *masks)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_get_writeable_feature_regs +3642 arch/arm64/kvm/sys_regs.c

  3641	
> 3642	int kvm_get_writeable_feature_regs(struct kvm *kvm, u64 __user *masks)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
