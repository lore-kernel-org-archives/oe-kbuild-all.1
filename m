Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873937EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679118398; x=1710654398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w525EYsOskqerQEFdFaOTbKmGswW0KlNngwhqN9FbqE=;
  b=LIZTomZ98iWdXzu4czrdR+R+gvXmz7XHlsykMXs9vHGoVIwmDTCKn8N2
   G6XW8gXl0+VFYjQ4CDSSd/27x37vrvcaEpQYA3J47C6oj15GiR8x+SFyx
   +Xy34N8//N4p1+sslxT35jidsUjMg5HQDUsaz/rqXnJf/OGMkOtrpYmoo
   xXU0XRJ0kg1xoh3gabOWrvqHqkSKi8xLnJzr7iwSHuvIW8g1LZ4LR1UrO
   VhGRJMIMTT9zMhr/SR5Xrbb0dGHpboAg4pZrAZ51T5jMIWtSnPsedhYEb
   eVaJsDTMri+du+9c5RZwrICMTBGeiUlobw/LhRz72i68Jqn84PMOXF3a5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335905682"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="335905682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 22:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744788456"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="744788456"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 22:46:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdPOk-0009pi-14;
	Sat, 18 Mar 2023 05:46:34 +0000
Date: Sat, 18 Mar 2023 13:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-fgt 3/3]
 arch/arm64/kvm/hyp/include/hyp/switch.h:102:33: warning: variable
 'host_ctxt' set but not used
Message-ID: <202303181305.ZrHD1fpV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-fgt
head:   5cd718c2e5c52de666e2937dc655db3766bbc3b7
commit: 5cd718c2e5c52de666e2937dc655db3766bbc3b7 [3/3] KVM: arm64: Move FGT value configuration to vCPU state
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230318/202303181305.ZrHD1fpV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=5cd718c2e5c52de666e2937dc655db3766bbc3b7
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci kvm-arm64-fgt
        git checkout 5cd718c2e5c52de666e2937dc655db3766bbc3b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181305.ZrHD1fpV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__deactivate_traps_common':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:102:33: warning: variable 'host_ctxt' set but not used [-Wunused-but-set-variable]
     102 |         struct kvm_cpu_context *host_ctxt;
         |                                 ^~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c: At top level:
   arch/arm64/kvm/hyp/vhe/switch.c:107:43: warning: initialized field overwritten [-Woverride-init]
     107 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:107:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/vhe/switch.c:108:43: warning: initialized field overwritten [-Woverride-init]
     108 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:108:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/vhe/switch.c:109:43: warning: initialized field overwritten [-Woverride-init]
     109 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:109:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/vhe/switch.c:110:43: warning: initialized field overwritten [-Woverride-init]
     110 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:110:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/vhe/switch.c:111:43: warning: initialized field overwritten [-Woverride-init]
     111 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:111:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/vhe/switch.c:112:43: warning: initialized field overwritten [-Woverride-init]
     112 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:112:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/vhe/switch.c:113:43: warning: initialized field overwritten [-Woverride-init]
     113 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:113:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/vhe/switch.c:256:17: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     256 | void __noreturn hyp_panic(void)
         |                 ^~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:266:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     266 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
   arch/arm64/kvm/hyp/include/hyp/switch.h: In function '__deactivate_traps_common':
>> arch/arm64/kvm/hyp/include/hyp/switch.h:102:33: warning: variable 'host_ctxt' set but not used [-Wunused-but-set-variable]
     102 |         struct kvm_cpu_context *host_ctxt;
         |                                 ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c: At top level:
   arch/arm64/kvm/hyp/nvhe/switch.c:183:43: warning: initialized field overwritten [-Woverride-init]
     183 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:183:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:184:43: warning: initialized field overwritten [-Woverride-init]
     184 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:184:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:185:43: warning: initialized field overwritten [-Woverride-init]
     185 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:185:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:186:43: warning: initialized field overwritten [-Woverride-init]
     186 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: warning: initialized field overwritten [-Woverride-init]
     187 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: warning: initialized field overwritten [-Woverride-init]
     188 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: warning: initialized field overwritten [-Woverride-init]
     189 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:194:43: warning: initialized field overwritten [-Woverride-init]
     194 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:194:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: warning: initialized field overwritten [-Woverride-init]
     195 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:196:43: warning: initialized field overwritten [-Woverride-init]
     196 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:196:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: warning: initialized field overwritten [-Woverride-init]
     197 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: warning: initialized field overwritten [-Woverride-init]
     198 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: warning: initialized field overwritten [-Woverride-init]
     199 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: note: (near initialization for 'pvm_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:336:28: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     336 | asmlinkage void __noreturn hyp_panic(void)
         |                            ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:362:28: warning: no previous prototype for 'hyp_panic_bad_stack' [-Wmissing-prototypes]
     362 | asmlinkage void __noreturn hyp_panic_bad_stack(void)
         |                            ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:367:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     367 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/host_ctxt +102 arch/arm64/kvm/hyp/include/hyp/switch.h

    99	
   100	static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
   101	{
 > 102		struct kvm_cpu_context *host_ctxt;
   103	
   104		write_sysreg(vcpu->arch.mdcr_el2_host, mdcr_el2);
   105	
   106		write_sysreg(0, hstr_el2);
   107		if (kvm_arm_support_pmu_v3())
   108			write_sysreg(0, pmuserenr_el0);
   109	
   110		/* Restore the host FGT configuration here,  */
   111		if (cpus_have_final_cap(ARM64_HAS_FGT)) {
   112			host_ctxt = &this_cpu_ptr(&kvm_host_data)->host_ctxt;
   113	
   114			write_sysreg_s(__vcpu_sys_reg(vcpu, HFGRTR_EL2),
   115				       SYS_HFGRTR_EL2);
   116			write_sysreg_s(__vcpu_sys_reg(vcpu, HFGWTR_EL2),
   117				       SYS_HFGWTR_EL2);
   118		}
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
