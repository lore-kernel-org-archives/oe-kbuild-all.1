Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E813D891
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 23:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713570198; cv=none; b=ZQuIZSf9JH8J0L9GR7altPV67JGeEvROksW/NFJurF+543QltCFpoD+q30rXLWWBDVGy3FRmPQ3v9Ks/ceqgH81x/7ndmPD89SH4ukKN2xyzz20JSMJq5WpEeUT3lv94E1bnDucRDfU5xunOBwPvpyKxLfAEIBsaicFYrX0BoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713570198; c=relaxed/simple;
	bh=qsEeiuUY76LX56UCam3iGYpMMfwHo58dv9Dkpr0Fr7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bte5qG/iYjDKgkxpcaOWQf7bLwLwXF/hNToLQqFiz2B3h920nWW5qAfgQEvpGCoBMpkxpec5BOiBFbk3U0nHK+ek3cWHneBTmKrRRXJY000gWqeYNkC/b8RLP/CzwTBTSahNmNUS11HDp7Jk0/qk8LXU9WLG5dn+WGjluldLUsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EenRvzuw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EenRvzuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713570196; x=1745106196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsEeiuUY76LX56UCam3iGYpMMfwHo58dv9Dkpr0Fr7k=;
  b=EenRvzuwmLKvkA27ecNM7KH16W2BkFkjSbV7bhVHLPDNDCK5YZ+M/4NX
   HMr0ZLAGFMgKkSRSgS+khG/DJBMmV0cGST4b+SORGTdW37v8o4ioAubl9
   KVhlhiS5bI51qA2m/iV/IKtfvrV0Zu/a4r+nWWGsomAenbrtPmTFqYr31
   R12TzLK6mRQlKu4N7zR35m3st3sjOc/r8NMRR7WnBsioOgq/EYHcIGwvO
   0Q1mgeOrZpOqfNmsRLEl8VL4i6bPKq4oDlWcRYR3bQqqigxsnZloEtJ4C
   VSU+sA3H8mXzb/K63rRdEJsoGynnykW51S0EnFPmqopctbY/hiqiMPH/w
   Q==;
X-CSE-ConnectionGUID: U0GaHSweQWWSauX+m6JBrA==
X-CSE-MsgGUID: A0Q/zxq8SMqRj9YZ4xaUMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9732955"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9732955"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 16:43:15 -0700
X-CSE-ConnectionGUID: rMn2ZaG5T8GoEtI6u25kiw==
X-CSE-MsgGUID: SL1Ba4EGSYKYZyefzIh3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23537632"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2024 16:43:14 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxxst-000AYc-1n;
	Fri, 19 Apr 2024 23:43:11 +0000
Date: Sat, 20 Apr 2024 07:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/virt_enable_less_sucky 2/4]
 arch/x86/include/asm/kvm_host.h:1609:2: error: unknown type name
 'cpu_emergency_virt_cb'
Message-ID: <202404200746.R3izLrf2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/virt_enable_less_sucky
head:   5a4973b46ba550977b8ad51970f8a26494e65a8f
commit: eb37cd848b9a267681c225f1a6a0176cfe7c088c [2/4] KVM: x86: Register emergency virt callback in common code, via kvm_x86_ops
config: i386-buildonly-randconfig-003-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200746.R3izLrf2-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200746.R3izLrf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200746.R3izLrf2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45,
                    from arch/x86/events/intel/core.c:17:
>> arch/x86/include/asm/kvm_host.h:1609:2: error: unknown type name 'cpu_emergency_virt_cb'
     cpu_emergency_virt_cb *emergency_disable;
     ^~~~~~~~~~~~~~~~~~~~~


vim +/cpu_emergency_virt_cb +1609 arch/x86/include/asm/kvm_host.h

  1601	
  1602	struct kvm_x86_ops {
  1603		const char *name;
  1604	
  1605		int (*check_processor_compatibility)(void);
  1606	
  1607		int (*hardware_enable)(void);
  1608		void (*hardware_disable)(void);
> 1609		cpu_emergency_virt_cb *emergency_disable;
  1610	
  1611		void (*hardware_unsetup)(void);
  1612		bool (*has_emulated_msr)(struct kvm *kvm, u32 index);
  1613		void (*vcpu_after_set_cpuid)(struct kvm_vcpu *vcpu);
  1614	
  1615		unsigned int vm_size;
  1616		int (*vm_init)(struct kvm *kvm);
  1617		void (*vm_destroy)(struct kvm *kvm);
  1618	
  1619		/* Create, but do not attach this VCPU */
  1620		int (*vcpu_precreate)(struct kvm *kvm);
  1621		int (*vcpu_create)(struct kvm_vcpu *vcpu);
  1622		void (*vcpu_free)(struct kvm_vcpu *vcpu);
  1623		void (*vcpu_reset)(struct kvm_vcpu *vcpu, bool init_event);
  1624	
  1625		void (*prepare_switch_to_guest)(struct kvm_vcpu *vcpu);
  1626		void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
  1627		void (*vcpu_put)(struct kvm_vcpu *vcpu);
  1628	
  1629		void (*update_exception_bitmap)(struct kvm_vcpu *vcpu);
  1630		int (*get_msr)(struct kvm_vcpu *vcpu, struct msr_data *msr);
  1631		int (*set_msr)(struct kvm_vcpu *vcpu, struct msr_data *msr);
  1632		u64 (*get_segment_base)(struct kvm_vcpu *vcpu, int seg);
  1633		void (*get_segment)(struct kvm_vcpu *vcpu,
  1634				    struct kvm_segment *var, int seg);
  1635		int (*get_cpl)(struct kvm_vcpu *vcpu);
  1636		void (*set_segment)(struct kvm_vcpu *vcpu,
  1637				    struct kvm_segment *var, int seg);
  1638		void (*get_cs_db_l_bits)(struct kvm_vcpu *vcpu, int *db, int *l);
  1639		bool (*is_valid_cr0)(struct kvm_vcpu *vcpu, unsigned long cr0);
  1640		void (*set_cr0)(struct kvm_vcpu *vcpu, unsigned long cr0);
  1641		void (*post_set_cr3)(struct kvm_vcpu *vcpu, unsigned long cr3);
  1642		bool (*is_valid_cr4)(struct kvm_vcpu *vcpu, unsigned long cr4);
  1643		void (*set_cr4)(struct kvm_vcpu *vcpu, unsigned long cr4);
  1644		int (*set_efer)(struct kvm_vcpu *vcpu, u64 efer);
  1645		void (*get_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
  1646		void (*set_idt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
  1647		void (*get_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
  1648		void (*set_gdt)(struct kvm_vcpu *vcpu, struct desc_ptr *dt);
  1649		void (*sync_dirty_debug_regs)(struct kvm_vcpu *vcpu);
  1650		void (*set_dr7)(struct kvm_vcpu *vcpu, unsigned long value);
  1651		void (*cache_reg)(struct kvm_vcpu *vcpu, enum kvm_reg reg);
  1652		unsigned long (*get_rflags)(struct kvm_vcpu *vcpu);
  1653		void (*set_rflags)(struct kvm_vcpu *vcpu, unsigned long rflags);
  1654		bool (*get_if_flag)(struct kvm_vcpu *vcpu);
  1655	
  1656		void (*flush_tlb_all)(struct kvm_vcpu *vcpu);
  1657		void (*flush_tlb_current)(struct kvm_vcpu *vcpu);
  1658	#if IS_ENABLED(CONFIG_HYPERV)
  1659		int  (*flush_remote_tlbs)(struct kvm *kvm);
  1660		int  (*flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
  1661						gfn_t nr_pages);
  1662	#endif
  1663	
  1664		/*
  1665		 * Flush any TLB entries associated with the given GVA.
  1666		 * Does not need to flush GPA->HPA mappings.
  1667		 * Can potentially get non-canonical addresses through INVLPGs, which
  1668		 * the implementation may choose to ignore if appropriate.
  1669		 */
  1670		void (*flush_tlb_gva)(struct kvm_vcpu *vcpu, gva_t addr);
  1671	
  1672		/*
  1673		 * Flush any TLB entries created by the guest.  Like tlb_flush_gva(),
  1674		 * does not need to flush GPA->HPA mappings.
  1675		 */
  1676		void (*flush_tlb_guest)(struct kvm_vcpu *vcpu);
  1677	
  1678		int (*vcpu_pre_run)(struct kvm_vcpu *vcpu);
  1679		enum exit_fastpath_completion (*vcpu_run)(struct kvm_vcpu *vcpu,
  1680							  bool force_immediate_exit);
  1681		int (*handle_exit)(struct kvm_vcpu *vcpu,
  1682			enum exit_fastpath_completion exit_fastpath);
  1683		int (*skip_emulated_instruction)(struct kvm_vcpu *vcpu);
  1684		void (*update_emulated_instruction)(struct kvm_vcpu *vcpu);
  1685		void (*set_interrupt_shadow)(struct kvm_vcpu *vcpu, int mask);
  1686		u32 (*get_interrupt_shadow)(struct kvm_vcpu *vcpu);
  1687		void (*patch_hypercall)(struct kvm_vcpu *vcpu,
  1688					unsigned char *hypercall_addr);
  1689		void (*inject_irq)(struct kvm_vcpu *vcpu, bool reinjected);
  1690		void (*inject_nmi)(struct kvm_vcpu *vcpu);
  1691		void (*inject_exception)(struct kvm_vcpu *vcpu);
  1692		void (*cancel_injection)(struct kvm_vcpu *vcpu);
  1693		int (*interrupt_allowed)(struct kvm_vcpu *vcpu, bool for_injection);
  1694		int (*nmi_allowed)(struct kvm_vcpu *vcpu, bool for_injection);
  1695		bool (*get_nmi_mask)(struct kvm_vcpu *vcpu);
  1696		void (*set_nmi_mask)(struct kvm_vcpu *vcpu, bool masked);
  1697		/* Whether or not a virtual NMI is pending in hardware. */
  1698		bool (*is_vnmi_pending)(struct kvm_vcpu *vcpu);
  1699		/*
  1700		 * Attempt to pend a virtual NMI in hardware.  Returns %true on success
  1701		 * to allow using static_call_ret0 as the fallback.
  1702		 */
  1703		bool (*set_vnmi_pending)(struct kvm_vcpu *vcpu);
  1704		void (*enable_nmi_window)(struct kvm_vcpu *vcpu);
  1705		void (*enable_irq_window)(struct kvm_vcpu *vcpu);
  1706		void (*update_cr8_intercept)(struct kvm_vcpu *vcpu, int tpr, int irr);
  1707		bool (*check_apicv_inhibit_reasons)(enum kvm_apicv_inhibit reason);
  1708		const unsigned long required_apicv_inhibits;
  1709		bool allow_apicv_in_x2apic_without_x2apic_virtualization;
  1710		void (*refresh_apicv_exec_ctrl)(struct kvm_vcpu *vcpu);
  1711		void (*hwapic_irr_update)(struct kvm_vcpu *vcpu, int max_irr);
  1712		void (*hwapic_isr_update)(int isr);
  1713		bool (*guest_apic_has_interrupt)(struct kvm_vcpu *vcpu);
  1714		void (*load_eoi_exitmap)(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap);
  1715		void (*set_virtual_apic_mode)(struct kvm_vcpu *vcpu);
  1716		void (*set_apic_access_page_addr)(struct kvm_vcpu *vcpu);
  1717		void (*deliver_interrupt)(struct kvm_lapic *apic, int delivery_mode,
  1718					  int trig_mode, int vector);
  1719		int (*sync_pir_to_irr)(struct kvm_vcpu *vcpu);
  1720		int (*set_tss_addr)(struct kvm *kvm, unsigned int addr);
  1721		int (*set_identity_map_addr)(struct kvm *kvm, u64 ident_addr);
  1722		u8 (*get_mt_mask)(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio);
  1723	
  1724		void (*load_mmu_pgd)(struct kvm_vcpu *vcpu, hpa_t root_hpa,
  1725				     int root_level);
  1726	
  1727		bool (*has_wbinvd_exit)(void);
  1728	
  1729		u64 (*get_l2_tsc_offset)(struct kvm_vcpu *vcpu);
  1730		u64 (*get_l2_tsc_multiplier)(struct kvm_vcpu *vcpu);
  1731		void (*write_tsc_offset)(struct kvm_vcpu *vcpu);
  1732		void (*write_tsc_multiplier)(struct kvm_vcpu *vcpu);
  1733	
  1734		/*
  1735		 * Retrieve somewhat arbitrary exit information.  Intended to
  1736		 * be used only from within tracepoints or error paths.
  1737		 */
  1738		void (*get_exit_info)(struct kvm_vcpu *vcpu, u32 *reason,
  1739				      u64 *info1, u64 *info2,
  1740				      u32 *exit_int_info, u32 *exit_int_info_err_code);
  1741	
  1742		int (*check_intercept)(struct kvm_vcpu *vcpu,
  1743				       struct x86_instruction_info *info,
  1744				       enum x86_intercept_stage stage,
  1745				       struct x86_exception *exception);
  1746		void (*handle_exit_irqoff)(struct kvm_vcpu *vcpu);
  1747	
  1748		void (*sched_in)(struct kvm_vcpu *vcpu, int cpu);
  1749	
  1750		/*
  1751		 * Size of the CPU's dirty log buffer, i.e. VMX's PML buffer.  A zero
  1752		 * value indicates CPU dirty logging is unsupported or disabled.
  1753		 */
  1754		int cpu_dirty_log_size;
  1755		void (*update_cpu_dirty_logging)(struct kvm_vcpu *vcpu);
  1756	
  1757		const struct kvm_x86_nested_ops *nested_ops;
  1758	
  1759		void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
  1760		void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
  1761	
  1762		int (*pi_update_irte)(struct kvm *kvm, unsigned int host_irq,
  1763				      uint32_t guest_irq, bool set);
  1764		void (*pi_start_assignment)(struct kvm *kvm);
  1765		void (*apicv_pre_state_restore)(struct kvm_vcpu *vcpu);
  1766		void (*apicv_post_state_restore)(struct kvm_vcpu *vcpu);
  1767		bool (*dy_apicv_has_pending_interrupt)(struct kvm_vcpu *vcpu);
  1768	
  1769		int (*set_hv_timer)(struct kvm_vcpu *vcpu, u64 guest_deadline_tsc,
  1770				    bool *expired);
  1771		void (*cancel_hv_timer)(struct kvm_vcpu *vcpu);
  1772	
  1773		void (*setup_mce)(struct kvm_vcpu *vcpu);
  1774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
