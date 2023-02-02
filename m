Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD663B7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675345115; x=1706881115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72n2hAeqj5NBMBe5RqYWSFlJYW5Nw8pcBJGlZOoqiAQ=;
  b=mKtk2OAOIkoal17+Osxk/7yXCoySR/cLZzOFdC4UwblAylrqhO0mTmSO
   octd2rWhQ/EbLjKq7jfU+S3PqemwSYlkfEHagYGqkYMsLi0KLTV17aVNU
   AeA3QtkZE7VaDz90Jv0La0tTw4KyXAIQ81XZtdGl7aJ4CSxJ1819Ja2XY
   PF9UT1qA6xxK8sMujGm1PjYNpkboLnmn4xYJFgKONEBK5A6agM0EX8jwo
   mZQKpi760t6yqwxZzhBSgmDNZF78/oIR1Wb28EmN0Rxcu86pD09r69hrt
   PKcO9Dt4oAXYLFiSn+j3u907G+QAOTNyGizxjX2H7vN2HIDVQi+UHyV+X
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312090779"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="312090779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 05:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658730820"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="658730820"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Feb 2023 05:38:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNZnM-0006YG-20;
	Thu, 02 Feb 2023 13:38:32 +0000
Date: Thu, 2 Feb 2023 21:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5688/6870]
 arch/arm64/kvm/hyp/nvhe/switch.c:337:5: warning: no previous prototype for
 '__pkvm_register_hyp_panic_notifier'
Message-ID: <202302022103.iBZs5d8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b2487c5b2bdbac887caa086038f90c88f31f30af
commit: 7d969932eec583efdec695b4ee5d57ba6a88a186 [5688/6870] ANDROID: KVM: arm64: Introduce a hyp panic module notifier
config: arm64-buildonly-randconfig-r005-20230130 (https://download.01.org/0day-ci/archive/20230202/202302022103.iBZs5d8R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 7d969932eec583efdec695b4ee5d57ba6a88a186
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/switch.c:183:43: warning: initialized field overwritten [-Woverride-init]
     183 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:183:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:184:43: warning: initialized field overwritten [-Woverride-init]
     184 |         [ESR_ELx_EC_HVC64]              = kvm_hyp_handle_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:184:43: note: (near initialization for 'hyp_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:185:43: warning: initialized field overwritten [-Woverride-init]
     185 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:185:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:186:43: warning: initialized field overwritten [-Woverride-init]
     186 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: warning: initialized field overwritten [-Woverride-init]
     187 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: warning: initialized field overwritten [-Woverride-init]
     188 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: warning: initialized field overwritten [-Woverride-init]
     189 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: warning: initialized field overwritten [-Woverride-init]
     190 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: warning: initialized field overwritten [-Woverride-init]
     195 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: note: (near initialization for 'pvm_exit_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/switch.c:196:43: warning: initialized field overwritten [-Woverride-init]
     196 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:196:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: warning: initialized field overwritten [-Woverride-init]
     197 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:197:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: warning: initialized field overwritten [-Woverride-init]
     198 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: warning: initialized field overwritten [-Woverride-init]
     199 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:199:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: warning: initialized field overwritten [-Woverride-init]
     200 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: warning: initialized field overwritten [-Woverride-init]
     201 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: note: (near initialization for 'pvm_exit_handlers[9]')
>> arch/arm64/kvm/hyp/nvhe/switch.c:337:5: warning: no previous prototype for '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     337 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct kvm_cpu_context *host_ctxt))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:342:28: warning: no previous prototype for 'hyp_panic' [-Wmissing-prototypes]
     342 | asmlinkage void __noreturn hyp_panic(void)
         |                            ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:371:28: warning: no previous prototype for 'hyp_panic_bad_stack' [-Wmissing-prototypes]
     371 | asmlinkage void __noreturn hyp_panic_bad_stack(void)
         |                            ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:376:17: warning: no previous prototype for 'kvm_unexpected_el2_exception' [-Wmissing-prototypes]
     376 | asmlinkage void kvm_unexpected_el2_exception(void)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_hyp_panic_notifier +337 arch/arm64/kvm/hyp/nvhe/switch.c

   192	
   193	static const exit_handler_fn pvm_exit_handlers[] = {
   194		[0 ... ESR_ELx_EC_MAX]		= NULL,
   195		[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
   196		[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
   197		[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
   198		[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 > 199		[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
   200		[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
   201		[ESR_ELx_EC_PAC]		= kvm_hyp_handle_ptrauth,
   202	};
   203	
   204	static const exit_handler_fn *kvm_get_exit_handler_array(struct kvm_vcpu *vcpu)
   205	{
   206		if (unlikely(vcpu_is_protected(vcpu)))
   207			return pvm_exit_handlers;
   208	
   209		return hyp_exit_handlers;
   210	}
   211	
   212	/*
   213	 * Some guests (e.g., protected VMs) are not be allowed to run in AArch32.
   214	 * The ARMv8 architecture does not give the hypervisor a mechanism to prevent a
   215	 * guest from dropping to AArch32 EL0 if implemented by the CPU. If the
   216	 * hypervisor spots a guest in such a state ensure it is handled, and don't
   217	 * trust the host to spot or fix it.  The check below is based on the one in
   218	 * kvm_arch_vcpu_ioctl_run().
   219	 *
   220	 * Returns false if the guest ran in AArch32 when it shouldn't have, and
   221	 * thus should exit to the host, or true if a the guest run loop can continue.
   222	 */
   223	static void early_exit_filter(struct kvm_vcpu *vcpu, u64 *exit_code)
   224	{
   225		if (unlikely(vcpu_is_protected(vcpu) && vcpu_mode_is_32bit(vcpu))) {
   226			/*
   227			 * As we have caught the guest red-handed, decide that it isn't
   228			 * fit for purpose anymore by making the vcpu invalid. The VMM
   229			 * can try and fix it by re-initializing the vcpu with
   230			 * KVM_ARM_VCPU_INIT, however, this is likely not possible for
   231			 * protected VMs.
   232			 */
   233			vcpu->arch.target = -1;
   234			*exit_code &= BIT(ARM_EXIT_WITH_SERROR_BIT);
   235			*exit_code |= ARM_EXCEPTION_IL;
   236		}
   237	}
   238	
   239	/* Switch to the guest for legacy non-VHE systems */
   240	int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
   241	{
   242		struct kvm_cpu_context *host_ctxt;
   243		struct kvm_cpu_context *guest_ctxt;
   244		struct kvm_s2_mmu *mmu;
   245		bool pmu_switch_needed;
   246		u64 exit_code;
   247	
   248		/*
   249		 * Having IRQs masked via PMR when entering the guest means the GIC
   250		 * will not signal the CPU of interrupts of lower priority, and the
   251		 * only way to get out will be via guest exceptions.
   252		 * Naturally, we want to avoid this.
   253		 */
   254		if (system_uses_irq_prio_masking()) {
   255			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
   256			pmr_sync();
   257		}
   258	
   259		host_ctxt = &this_cpu_ptr(&kvm_host_data)->host_ctxt;
   260		host_ctxt->__hyp_running_vcpu = vcpu;
   261		guest_ctxt = &vcpu->arch.ctxt;
   262	
   263		pmu_switch_needed = __pmu_switch_to_guest(vcpu);
   264	
   265		__sysreg_save_state_nvhe(host_ctxt);
   266		/*
   267		 * We must flush and disable the SPE buffer for nVHE, as
   268		 * the translation regime(EL1&0) is going to be loaded with
   269		 * that of the guest. And we must do this before we change the
   270		 * translation regime to EL2 (via MDCR_EL2_E2PB == 0) and
   271		 * before we load guest Stage1.
   272		 */
   273		__debug_save_host_buffers_nvhe(vcpu);
   274	
   275		__kvm_adjust_pc(vcpu);
   276	
   277		/*
   278		 * We must restore the 32-bit state before the sysregs, thanks
   279		 * to erratum #852523 (Cortex-A57) or #853709 (Cortex-A72).
   280		 *
   281		 * Also, and in order to be able to deal with erratum #1319537 (A57)
   282		 * and #1319367 (A72), we must ensure that all VM-related sysreg are
   283		 * restored before we enable S2 translation.
   284		 */
   285		__sysreg32_restore_state(vcpu);
   286		__sysreg_restore_state_nvhe(guest_ctxt);
   287	
   288		mmu = kern_hyp_va(vcpu->arch.hw_mmu);
   289		__load_stage2(mmu, kern_hyp_va(mmu->arch));
   290		__activate_traps(vcpu);
   291	
   292		__hyp_vgic_restore_state(vcpu);
   293		__timer_enable_traps(vcpu);
   294	
   295		__debug_switch_to_guest(vcpu);
   296	
   297		do {
   298			/* Jump in the fire! */
   299			exit_code = __guest_enter(vcpu);
   300	
   301			/* And we're baaack! */
   302		} while (fixup_guest_exit(vcpu, &exit_code));
   303	
   304		__sysreg_save_state_nvhe(guest_ctxt);
   305		__sysreg32_save_state(vcpu);
   306		__timer_disable_traps(vcpu);
   307		__hyp_vgic_save_state(vcpu);
   308	
   309		__deactivate_traps(vcpu);
   310		__load_host_stage2();
   311	
   312		__sysreg_restore_state_nvhe(host_ctxt);
   313	
   314		if (vcpu->arch.fp_state == FP_STATE_GUEST_OWNED)
   315			__fpsimd_save_fpexc32(vcpu);
   316	
   317		__debug_switch_to_host(vcpu);
   318		/*
   319		 * This must come after restoring the host sysregs, since a non-VHE
   320		 * system may enable SPE here and make use of the TTBRs.
   321		 */
   322		__debug_restore_host_buffers_nvhe(vcpu);
   323	
   324		if (pmu_switch_needed)
   325			__pmu_switch_to_host(vcpu);
   326	
   327		/* Returning to host will clear PSR.I, remask PMR if needed */
   328		if (system_uses_irq_prio_masking())
   329			gic_write_pmr(GIC_PRIO_IRQOFF);
   330	
   331		host_ctxt->__hyp_running_vcpu = NULL;
   332	
   333		return exit_code;
   334	}
   335	
   336	static void (*hyp_panic_notifier)(struct kvm_cpu_context *host_ctxt);
 > 337	int __pkvm_register_hyp_panic_notifier(void (*cb)(struct kvm_cpu_context *host_ctxt))
   338	{
   339		return cmpxchg(&hyp_panic_notifier, NULL, cb) ? -EBUSY : 0;
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
