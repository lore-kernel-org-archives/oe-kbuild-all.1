Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6B23BCE3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604601; cv=none; b=jDkfb6GVIHUPk51Kfg1xo5BW4pYpRCZs4LYDMRevtGIIt3BNQIzPB/CkBMHgRLEBffBOg8m4jQX8FjkH/rzLUou83sLPu60NRw3LAiJUMpQc/NJddKtP6Eyp4KYC4DBh7WSwQqkKq/iBIFcFbQYymMxbBJRGBxWeEzebJrSs8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604601; c=relaxed/simple;
	bh=RS/5S90ig9Ptg/71lY4eHS/u/f1iPhu1UupIfIUioic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ge9pvkzdKSEH/nJQ+mbPM+qaXg3/Cp4i/UOXbST0MJCA4Vcineu5kTnXKZcHqIoYlHQlt4TFJdk0g5YWjHZTDo9+MhtAbKPnQlFgZEC53RVzy6+t7f1G9i5rWIy3AVjZHJV6hFzOSwPofxurLq61ItyksXfDbVPrRNCUkulWWw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFqXcYI7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFqXcYI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743604599; x=1775140599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RS/5S90ig9Ptg/71lY4eHS/u/f1iPhu1UupIfIUioic=;
  b=OFqXcYI7bM0hdM+hrVij1jdOFx7Wzva6OlR2rR243LU66YP8F5fh8KJ4
   80LuLjmvcb1mBG51rAP6GYPHfzT6me+a3ryvynjRfCqKcGfpRkVGokx+i
   gkBr2cp9/CXU15ksdq4ReW8Hs2u7TiwFkM+twb4fdK9em4WuVo14QxcpJ
   VsuPpyoQnTPO65+8XHt5DZkyMZA+S5+y51EFD4TUbYwNXWe8LS3OIPU4t
   1iXVQv9IQdB9y9iZiVPL/D0dvPiCEa1mq4hI3ckv1A24NYqFdPBhzMfRV
   w+QF/RRlRXmHi7pMSUKd90Vgx5ZtPS25PRapy1Esq1ZEu/g3qrdflbiGz
   g==;
X-CSE-ConnectionGUID: 90tWpSOoSJGHBGN8sDJ4CQ==
X-CSE-MsgGUID: 7YfQO8HuQIumqucg5hShqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55967061"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55967061"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 07:36:35 -0700
X-CSE-ConnectionGUID: C4cabxNfSLGXjFAqs9e7tg==
X-CSE-MsgGUID: WhalDC0MRfeKpySq8PoRYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="163944595"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2025 07:36:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzzCh-000AmY-2I;
	Wed, 02 Apr 2025 14:36:31 +0000
Date: Wed, 2 Apr 2025 22:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>
Subject: [intel-tdx:tdx_kvm_dev-2025-04-01 116/175]
 arch/x86/kvm/vmx/vmx.c:8531 vmx_hardware_setup() warn: inconsistent
 indenting
Message-ID: <202504022242.Bi5MYGyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2025-04-01
head:   4dd797afe5bccb7a36475aae9df8f71eabb7676a
commit: c9c1e20b4c7d60fa084b3257525d21a49fe651a1 [116/175] KVM: x86: Introduce Intel specific quirk KVM_X86_QUIRK_IGNORE_GUEST_PAT
config: i386-randconfig-r071-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022242.Bi5MYGyU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022242.Bi5MYGyU-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/vmx.c:8531 vmx_hardware_setup() warn: inconsistent indenting

vim +8531 arch/x86/kvm/vmx/vmx.c

  8407	
  8408		if (!cpu_has_vmx_ple()) {
  8409			ple_gap = 0;
  8410			ple_window = 0;
  8411			ple_window_grow = 0;
  8412			ple_window_max = 0;
  8413			ple_window_shrink = 0;
  8414		}
  8415	
  8416		if (!cpu_has_vmx_apicv())
  8417			enable_apicv = 0;
  8418		if (!enable_apicv)
  8419			vt_x86_ops.sync_pir_to_irr = NULL;
  8420	
  8421		if (!enable_apicv || !cpu_has_vmx_ipiv())
  8422			enable_ipiv = false;
  8423	
  8424		if (cpu_has_vmx_tsc_scaling())
  8425			kvm_caps.has_tsc_control = true;
  8426	
  8427		kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
  8428		kvm_caps.tsc_scaling_ratio_frac_bits = 48;
  8429		kvm_caps.has_bus_lock_exit = cpu_has_vmx_bus_lock_detection();
  8430		kvm_caps.has_notify_vmexit = cpu_has_notify_vmexit();
  8431	
  8432		set_bit(0, vmx_vpid_bitmap); /* 0 is reserved for host */
  8433	
  8434		if (enable_ept)
  8435			kvm_mmu_set_ept_masks(enable_ept_ad_bits,
  8436					      cpu_has_vmx_ept_execute_only());
  8437	
  8438		/*
  8439		 * Setup shadow_me_value/shadow_me_mask to include MKTME KeyID
  8440		 * bits to shadow_zero_check.
  8441		 */
  8442		vmx_setup_me_spte_mask();
  8443	
  8444		kvm_configure_mmu(enable_ept, 0, vmx_get_max_ept_level(),
  8445				  ept_caps_to_lpage_level(vmx_capability.ept));
  8446	
  8447		/*
  8448		 * Only enable PML when hardware supports PML feature, and both EPT
  8449		 * and EPT A/D bit features are enabled -- PML depends on them to work.
  8450		 */
  8451		if (!enable_ept || !enable_ept_ad_bits || !cpu_has_vmx_pml())
  8452			enable_pml = 0;
  8453	
  8454		if (!cpu_has_vmx_preemption_timer())
  8455			enable_preemption_timer = false;
  8456	
  8457		if (enable_preemption_timer) {
  8458			u64 use_timer_freq = 5000ULL * 1000 * 1000;
  8459	
  8460			cpu_preemption_timer_multi =
  8461				vmx_misc_preemption_timer_rate(vmcs_config.misc);
  8462	
  8463			if (tsc_khz)
  8464				use_timer_freq = (u64)tsc_khz * 1000;
  8465			use_timer_freq >>= cpu_preemption_timer_multi;
  8466	
  8467			/*
  8468			 * KVM "disables" the preemption timer by setting it to its max
  8469			 * value.  Don't use the timer if it might cause spurious exits
  8470			 * at a rate faster than 0.1 Hz (of uninterrupted guest time).
  8471			 */
  8472			if (use_timer_freq > 0xffffffffu / 10)
  8473				enable_preemption_timer = false;
  8474		}
  8475	
  8476		if (!enable_preemption_timer) {
  8477			vt_x86_ops.set_hv_timer = NULL;
  8478			vt_x86_ops.cancel_hv_timer = NULL;
  8479		}
  8480	
  8481		kvm_caps.supported_mce_cap |= MCG_LMCE_P;
  8482		kvm_caps.supported_mce_cap |= MCG_CMCI_P;
  8483	
  8484		if (pt_mode != PT_MODE_SYSTEM && pt_mode != PT_MODE_HOST_GUEST)
  8485			return -EINVAL;
  8486		if (!enable_ept || !enable_pmu || !cpu_has_vmx_intel_pt())
  8487			pt_mode = PT_MODE_SYSTEM;
  8488		if (pt_mode == PT_MODE_HOST_GUEST)
  8489			vt_init_ops.handle_intel_pt_intr = vmx_handle_intel_pt_intr;
  8490		else
  8491			vt_init_ops.handle_intel_pt_intr = NULL;
  8492	
  8493		setup_default_sgx_lepubkeyhash();
  8494	
  8495		if (nested) {
  8496			nested_vmx_setup_ctls_msrs(&vmcs_config, vmx_capability.ept);
  8497	
  8498			r = nested_vmx_hardware_setup(kvm_vmx_exit_handlers);
  8499			if (r)
  8500				return r;
  8501		}
  8502	
  8503		vmx_set_cpu_caps();
  8504	
  8505		r = alloc_kvm_area();
  8506		if (r && nested)
  8507			nested_vmx_hardware_unsetup();
  8508	
  8509		kvm_set_posted_intr_wakeup_handler(pi_wakeup_handler);
  8510	
  8511		/*
  8512		 * On Intel CPUs that lack self-snoop feature, letting the guest control
  8513		 * memory types may result in unexpected behavior. So always ignore guest
  8514		 * PAT on those CPUs and map VM as writeback, not allowing userspace to
  8515		 * disable the quirk.
  8516		 *
  8517		 * On certain Intel CPUs (e.g. SPR, ICX), though self-snoop feature is
  8518		 * supported, UC is slow enough to cause issues with some older guests (e.g.
  8519		 * an old version of bochs driver uses ioremap() instead of ioremap_wc() to
  8520		 * map the video RAM, causing wayland desktop to fail to get started
  8521		 * correctly). To avoid breaking those older guests that rely on KVM to force
  8522		 * memory type to WB, provide KVM_X86_QUIRK_IGNORE_GUEST_PAT to preserve the
  8523		 * safer (for performance) default behavior.
  8524		 *
  8525		 * On top of this, non-coherent DMA devices need the guest to flush CPU
  8526		 * caches properly.  This also requires honoring guest PAT, and is forced
  8527		 * independent of the quirk in vmx_ignore_guest_pat().
  8528		 */
  8529		if (!static_cpu_has(X86_FEATURE_SELFSNOOP))
  8530			kvm_caps.supported_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
> 8531	       kvm_caps.inapplicable_quirks &= ~KVM_X86_QUIRK_IGNORE_GUEST_PAT;
  8532		return r;
  8533	}
  8534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
