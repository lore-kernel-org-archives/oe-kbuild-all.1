Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1831717B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 20:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927127; cv=none; b=Sofi4WP4ssgFanCAXnYNh1bNnOP0e0VFoH7IuVblNuUF/a6x9L1m34Lx/+3uXPgIyvCA+NePy2UH52LAJ6cVgbwnTdBx17yW2cyD6hNDVMaD5F9W00YM1gAP2U4qCmewZEV3iK78lSAOd6vC9AtIeDN3PxX7ak4M7tQkyA6fsFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927127; c=relaxed/simple;
	bh=cqZjsdf+MTTmFGSn+uyZt5xLIuNKrDsLqhhshxvyxg0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P4NTCy5SLaP/RcGmh3fIbVkws4yBytceZTk/l6Ae6v55+FD/VbKu2CguLMCKsKSaJgyfqhsGCPJ11zRWB6Hy7DWJS8VwU48+1k5i3GD0Dd4NxROLfZUb+xPo8Hi60i4NvSuW9/kNsuMyRaDvgNQSvMacsC/fOme6Kn+4pend8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnLNZPoM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnLNZPoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777927126; x=1809463126;
  h=date:from:to:cc:subject:message-id;
  bh=cqZjsdf+MTTmFGSn+uyZt5xLIuNKrDsLqhhshxvyxg0=;
  b=GnLNZPoM8Q9LIrvaplcp844mv+PfpnOIyfaCNnGr5VwB9pe3GqWglT1j
   7miFecoINFvuMN4Yeyg7oD9NwYvAEMnTkYRyU6qF5niqLY89Sq/aH3d9T
   JTOPI/xJdtkeMhDCZ39yMVBAXF5W3JzPzP04eAD5KQI97P3o1FVOI80b/
   ynEvy2ba1oIgnYdPbMtdzmpvav09lIHORlOie/RVQESK/eBG6n9oTzc13
   FvW/o6A6Ps641N714u7aOhDUBygpvJUb0eAbuAmgNWXSy3D2xCssNHtnL
   iJtYf35QJGSIL9RBSz0kEMNtyMVW/cExIfqeJJCbtXaOu44dyxHLgLUHc
   w==;
X-CSE-ConnectionGUID: mYHnceXhRm+c/DDPEJq31A==
X-CSE-MsgGUID: imVEZCDSRdGNaVm1zuZciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89379318"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89379318"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 13:38:45 -0700
X-CSE-ConnectionGUID: SZFQhD6VSaqO6/x2mI3DVQ==
X-CSE-MsgGUID: mYsAgMNaR8WbzNxRPsl2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="237381401"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2026 13:38:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK03t-000000005xb-2Lsb;
	Mon, 04 May 2026 20:38:41 +0000
Date: Mon, 04 May 2026 22:37:52 +0200
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/vmx.c:8700:17: error: too many arguments to
 function 'kvm_mmu_set_ept_masks'
Message-ID: <202605042245.NbBLImkL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-TDX-VMX-rework-EPT_VIOLATION_EXEC_FOR_RING3_LIN-into-PROT_MASK/20260504-091004
head:   66a2ec9db3dee4c9e472efc3fb444fc726c6bef1
commit: 822c3a707d8f39385941aafca01e435f5983f672 KVM: VMX: enable use of MBEC
date:   19 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260504/202605042245.NbBLImkL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042245.NbBLImkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605042245.NbBLImkL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function 'vmx_hardware_setup':
>> arch/x86/kvm/vmx/vmx.c:8700:17: error: too many arguments to function 'kvm_mmu_set_ept_masks'
    8700 |                 kvm_mmu_set_ept_masks(enable_ept_ad_bits, enable_mbec);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kvm/vmx/common.h:8,
                    from arch/x86/kvm/vmx/vmx.c:57:
   arch/x86/kvm/mmu.h:96:6: note: declared here
      96 | void kvm_mmu_set_ept_masks(bool has_ad_bits);
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/kvm_mmu_set_ept_masks +8700 arch/x86/kvm/vmx/vmx.c

  8672	
  8673		if (!cpu_has_vmx_ple()) {
  8674			ple_gap = 0;
  8675			ple_window = 0;
  8676			ple_window_grow = 0;
  8677			ple_window_max = 0;
  8678			ple_window_shrink = 0;
  8679		}
  8680	
  8681		if (!cpu_has_vmx_apicv())
  8682			enable_apicv = 0;
  8683		if (!enable_apicv)
  8684			vt_x86_ops.sync_pir_to_irr = NULL;
  8685	
  8686		if (!enable_apicv || !cpu_has_vmx_ipiv())
  8687			enable_ipiv = false;
  8688	
  8689		if (cpu_has_vmx_tsc_scaling())
  8690			kvm_caps.has_tsc_control = true;
  8691	
  8692		kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
  8693		kvm_caps.tsc_scaling_ratio_frac_bits = 48;
  8694		kvm_caps.has_bus_lock_exit = cpu_has_vmx_bus_lock_detection();
  8695		kvm_caps.has_notify_vmexit = cpu_has_notify_vmexit();
  8696	
  8697		set_bit(0, vmx_vpid_bitmap); /* 0 is reserved for host */
  8698	
  8699		if (enable_ept)
> 8700			kvm_mmu_set_ept_masks(enable_ept_ad_bits, enable_mbec);
  8701		else
  8702			vt_x86_ops.get_mt_mask = NULL;
  8703	
  8704		/*
  8705		 * Setup shadow_me_value/shadow_me_mask to include MKTME KeyID
  8706		 * bits to shadow_zero_check.
  8707		 */
  8708		vmx_setup_me_spte_mask();
  8709	
  8710		kvm_configure_mmu(enable_ept, 0, vmx_get_max_ept_level(),
  8711				  ept_caps_to_lpage_level(vmx_capability.ept));
  8712	
  8713		/*
  8714		 * Only enable PML when hardware supports PML feature, and both EPT
  8715		 * and EPT A/D bit features are enabled -- PML depends on them to work.
  8716		 */
  8717		if (!enable_ept || !enable_ept_ad_bits || !cpu_has_vmx_pml())
  8718			enable_pml = 0;
  8719	
  8720		if (!cpu_has_vmx_preemption_timer())
  8721			enable_preemption_timer = false;
  8722	
  8723		if (enable_preemption_timer) {
  8724			u64 use_timer_freq = 5000ULL * 1000 * 1000;
  8725	
  8726			cpu_preemption_timer_multi =
  8727				vmx_misc_preemption_timer_rate(vmcs_config.misc);
  8728	
  8729			if (tsc_khz)
  8730				use_timer_freq = (u64)tsc_khz * 1000;
  8731			use_timer_freq >>= cpu_preemption_timer_multi;
  8732	
  8733			/*
  8734			 * KVM "disables" the preemption timer by setting it to its max
  8735			 * value.  Don't use the timer if it might cause spurious exits
  8736			 * at a rate faster than 0.1 Hz (of uninterrupted guest time).
  8737			 */
  8738			if (use_timer_freq > 0xffffffffu / 10)
  8739				enable_preemption_timer = false;
  8740		}
  8741	
  8742		if (!enable_preemption_timer) {
  8743			vt_x86_ops.set_hv_timer = NULL;
  8744			vt_x86_ops.cancel_hv_timer = NULL;
  8745		}
  8746	
  8747		kvm_caps.supported_mce_cap |= MCG_LMCE_P;
  8748		kvm_caps.supported_mce_cap |= MCG_CMCI_P;
  8749	
  8750		if (pt_mode != PT_MODE_SYSTEM && pt_mode != PT_MODE_HOST_GUEST)
  8751			return -EINVAL;
  8752		if (!enable_ept || !enable_pmu || !cpu_has_vmx_intel_pt())
  8753			pt_mode = PT_MODE_SYSTEM;
  8754		if (pt_mode == PT_MODE_HOST_GUEST)
  8755			vt_init_ops.handle_intel_pt_intr = vmx_handle_intel_pt_intr;
  8756		else
  8757			vt_init_ops.handle_intel_pt_intr = NULL;
  8758	
  8759		setup_default_sgx_lepubkeyhash();
  8760	
  8761		vmx_set_cpu_caps();
  8762	
  8763		/*
  8764		 * Configure nested capabilities after core CPU capabilities so that
  8765		 * nested support can be conditional on base support, e.g. so that KVM
  8766		 * can hide/show features based on kvm_cpu_cap_has().
  8767		 */
  8768		if (nested) {
  8769			r = nested_vmx_hardware_setup(kvm_vmx_exit_handlers);
  8770			if (r)
  8771				return r;
  8772		}
  8773	
  8774		kvm_set_posted_intr_wakeup_handler(pi_wakeup_handler);
  8775	
  8776		/*
  8777		 * On Intel CPUs that lack self-snoop feature, letting the guest control
  8778		 * memory types may result in unexpected behavior. So always ignore guest
  8779		 * PAT on those CPUs and map VM as writeback, not allowing userspace to
  8780		 * disable the quirk.
  8781		 *
  8782		 * On certain Intel CPUs (e.g. SPR, ICX), though self-snoop feature is
  8783		 * supported, UC is slow enough to cause issues with some older guests (e.g.
  8784		 * an old version of bochs driver uses ioremap() instead of ioremap_wc() to
  8785		 * map the video RAM, causing wayland desktop to fail to get started
  8786		 * correctly). To avoid breaking those older guests that rely on KVM to force
  8787		 * memory type to WB, provide KVM_X86_QUIRK_IGNORE_GUEST_PAT to preserve the
  8788		 * safer (for performance) default behavior.
  8789		 *
  8790		 * On top of this, non-coherent DMA devices need the guest to flush CPU
  8791		 * caches properly.  This also requires honoring guest PAT, and is forced
  8792		 * independent of the quirk in vmx_ignore_guest_pat().
  8793		 */
  8794		if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
  8795			kvm_caps.supported_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
  8796	
  8797		kvm_caps.inapplicable_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
  8798	
  8799		return 0;
  8800	}
  8801	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
