Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DF61A6822
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786764673; cv=none; b=eVp+BPpLfPXqVnOWM4URRY8g7Xoco+s8HLDyaR6HFf3zXdhbhuGqAm5Fy6v4OUVcA3IMmECF4uamdgopTboygZTbgCeL3szPekmAtYPfVDG0oTI6RDMtfmktPjTGfVvSpmKZOZ2QEq7mp6dZc0mH0oUqEXeFzjKNoYGhd1voIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786764673; c=relaxed/simple;
	bh=V+bGNBo5wvyiwe2220J8dDRiegKSR22M5g93BCEctKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i7stM8COXgTonQQE46AxWSDeO9Pqdpxc9YGlSft5pwq40YIsGeIv8kTJnRrVDOMAmCBI4qpsJAuJTpytg8FiYFwJWt5O3JGo8okUKADQ3Baw33y+LGazvhuTupiMfZutKAGs4mAq3txKU+SREYULNSLyi24oUxWnAeOQH1A6I6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGaFEYJE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGaFEYJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786764670; x=1818300670;
  h=date:from:to:cc:subject:message-id;
  bh=V+bGNBo5wvyiwe2220J8dDRiegKSR22M5g93BCEctKc=;
  b=UGaFEYJEr4kVdoaSqwPrTKiuN91EeljqwvZ3la0Y1oNamLycCUsVbBZN
   az8TklG/beJYFMVhZHWl9nU6aQMVBsfemER5/XbGEsI5r5iDynBbgIARr
   509mpB1t1n8huUaHOdOcsKlULAbqs6clzIfEo1HujFT8DsiCb+DSppKFh
   5bzUMali8/c2WjxIWm98X+JM6GxoP4S9Rx8VsVSOyhW9y+lrNsZJ0k5NI
   LQmNOEPO0hwpv5LAuvwLLeQkFcrFk9fvTQRsR0NBztIgmV1JGC6TFMZI4
   bhygRYXEXZlBncgYR0Xkdm6vVVK2133xmoMnVBQ4NmoZsWerVwmCjnsA+
   w==;
X-CSE-ConnectionGUID: 8Wu5E29WQ2CTulce5PV+rw==
X-CSE-MsgGUID: Gw6h7UmkQ92aGspQ4s/SAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91152456"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="91152456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 20:31:10 -0700
X-CSE-ConnectionGUID: 9nlF4HpARnWcnpMofFks2Q==
X-CSE-MsgGUID: SPdje5HgQH6TWUpOeAT69Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="260151143"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Aug 2026 20:31:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv56v-00000000azy-3ste;
	Sat, 15 Aug 2026 03:31:05 +0000
Date: Sat, 15 Aug 2026 11:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/x86/kvm/vmx/vmx.c:8608 vmx_hardware_setup() warn: inconsistent indenting
Message-ID: <202608151124.cGhsbsTf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   56f164d7f06bd11dfa205c568ed165eff6a03fe4
commit: 4055f250a3294b3054f042f8f04dcc277a78bc5c [1/1] KVM: x86: Introduce Intel specific quirk KVM_X86_QUIRK_IGNORE_GUEST_PAT
config: x86_64-randconfig-161-20260814 (https://download.01.org/0day-ci/archive/20260815/202608151124.cGhsbsTf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151124.cGhsbsTf-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/vmx.c:8608 vmx_hardware_setup() warn: inconsistent indenting

vim +8608 arch/x86/kvm/vmx/vmx.c

  8481	
  8482		if (!cpu_has_vmx_ple()) {
  8483			ple_gap = 0;
  8484			ple_window = 0;
  8485			ple_window_grow = 0;
  8486			ple_window_max = 0;
  8487			ple_window_shrink = 0;
  8488		}
  8489	
  8490		if (!cpu_has_vmx_apicv())
  8491			enable_apicv = 0;
  8492		if (!enable_apicv)
  8493			vt_x86_ops.sync_pir_to_irr = NULL;
  8494	
  8495		if (!enable_apicv || !cpu_has_vmx_ipiv())
  8496			enable_ipiv = false;
  8497	
  8498		if (cpu_has_vmx_tsc_scaling())
  8499			kvm_caps.has_tsc_control = true;
  8500	
  8501		kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
  8502		kvm_caps.tsc_scaling_ratio_frac_bits = 48;
  8503		kvm_caps.has_bus_lock_exit = cpu_has_vmx_bus_lock_detection();
  8504		kvm_caps.has_notify_vmexit = cpu_has_notify_vmexit();
  8505	
  8506		set_bit(0, vmx_vpid_bitmap); /* 0 is reserved for host */
  8507	
  8508		if (enable_ept)
  8509			kvm_mmu_set_ept_masks(enable_ept_ad_bits,
  8510					      cpu_has_vmx_ept_execute_only());
  8511	
  8512		/*
  8513		 * Setup shadow_me_value/shadow_me_mask to include MKTME KeyID
  8514		 * bits to shadow_zero_check.
  8515		 */
  8516		vmx_setup_me_spte_mask();
  8517	
  8518		kvm_configure_mmu(enable_ept, 0, vmx_get_max_ept_level(),
  8519				  ept_caps_to_lpage_level(vmx_capability.ept));
  8520	
  8521		/*
  8522		 * Only enable PML when hardware supports PML feature, and both EPT
  8523		 * and EPT A/D bit features are enabled -- PML depends on them to work.
  8524		 */
  8525		if (!enable_ept || !enable_ept_ad_bits || !cpu_has_vmx_pml())
  8526			enable_pml = 0;
  8527	
  8528		if (!enable_pml)
  8529			vt_x86_ops.cpu_dirty_log_size = 0;
  8530	
  8531		if (!cpu_has_vmx_preemption_timer())
  8532			enable_preemption_timer = false;
  8533	
  8534		if (enable_preemption_timer) {
  8535			u64 use_timer_freq = 5000ULL * 1000 * 1000;
  8536	
  8537			cpu_preemption_timer_multi =
  8538				vmx_misc_preemption_timer_rate(vmcs_config.misc);
  8539	
  8540			if (tsc_khz)
  8541				use_timer_freq = (u64)tsc_khz * 1000;
  8542			use_timer_freq >>= cpu_preemption_timer_multi;
  8543	
  8544			/*
  8545			 * KVM "disables" the preemption timer by setting it to its max
  8546			 * value.  Don't use the timer if it might cause spurious exits
  8547			 * at a rate faster than 0.1 Hz (of uninterrupted guest time).
  8548			 */
  8549			if (use_timer_freq > 0xffffffffu / 10)
  8550				enable_preemption_timer = false;
  8551		}
  8552	
  8553		if (!enable_preemption_timer) {
  8554			vt_x86_ops.set_hv_timer = NULL;
  8555			vt_x86_ops.cancel_hv_timer = NULL;
  8556		}
  8557	
  8558		kvm_caps.supported_mce_cap |= MCG_LMCE_P;
  8559		kvm_caps.supported_mce_cap |= MCG_CMCI_P;
  8560	
  8561		if (pt_mode != PT_MODE_SYSTEM && pt_mode != PT_MODE_HOST_GUEST)
  8562			return -EINVAL;
  8563		if (!enable_ept || !enable_pmu || !cpu_has_vmx_intel_pt())
  8564			pt_mode = PT_MODE_SYSTEM;
  8565		if (pt_mode == PT_MODE_HOST_GUEST)
  8566			vt_init_ops.handle_intel_pt_intr = vmx_handle_intel_pt_intr;
  8567		else
  8568			vt_init_ops.handle_intel_pt_intr = NULL;
  8569	
  8570		setup_default_sgx_lepubkeyhash();
  8571	
  8572		if (nested) {
  8573			nested_vmx_setup_ctls_msrs(&vmcs_config, vmx_capability.ept);
  8574	
  8575			r = nested_vmx_hardware_setup(kvm_vmx_exit_handlers);
  8576			if (r)
  8577				return r;
  8578		}
  8579	
  8580		vmx_set_cpu_caps();
  8581	
  8582		r = alloc_kvm_area();
  8583		if (r && nested)
  8584			nested_vmx_hardware_unsetup();
  8585	
  8586		kvm_set_posted_intr_wakeup_handler(pi_wakeup_handler);
  8587	
  8588		/*
  8589		 * On Intel CPUs that lack self-snoop feature, letting the guest control
  8590		 * memory types may result in unexpected behavior. So always ignore guest
  8591		 * PAT on those CPUs and map VM as writeback, not allowing userspace to
  8592		 * disable the quirk.
  8593		 *
  8594		 * On certain Intel CPUs (e.g. SPR, ICX), though self-snoop feature is
  8595		 * supported, UC is slow enough to cause issues with some older guests (e.g.
  8596		 * an old version of bochs driver uses ioremap() instead of ioremap_wc() to
  8597		 * map the video RAM, causing wayland desktop to fail to get started
  8598		 * correctly). To avoid breaking those older guests that rely on KVM to force
  8599		 * memory type to WB, provide KVM_X86_QUIRK_IGNORE_GUEST_PAT to preserve the
  8600		 * safer (for performance) default behavior.
  8601		 *
  8602		 * On top of this, non-coherent DMA devices need the guest to flush CPU
  8603		 * caches properly.  This also requires honoring guest PAT, and is forced
  8604		 * independent of the quirk in vmx_ignore_guest_pat().
  8605		 */
  8606		if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
  8607			kvm_caps.supported_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
> 8608	       kvm_caps.inapplicable_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
  8609		return r;
  8610	}
  8611	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
