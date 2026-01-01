Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFEB4C92
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767233668; cv=none; b=UyxCa7FI9JmRZSa7rXO44At064ODf0tg4E9ZeVEwqBbZMgI3J14+UZbK+WgX2clHjg05km4Wte64ddhRhV4Pblaglbpf6SdABmuRQFiKJ7GKhNgdkOx1WGqWX8fu0ab4lzDgoG5QtBpN3/JKi1atIwA7Sjims74VPYja8e0MNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767233668; c=relaxed/simple;
	bh=ULQrQGbn38gIWB7LrVWWR/XNoMdeCpJxD9Q07B2Q448=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tTkJ5dvJ+RwW7azytFEWJKDS/pVms12BVmsENIUQkjW8Zu26zQciPQzevPyTUPODGO2UW1qtEqWFfcYJZ0O/BDoqY6ppWpfqwwdosrKTp8CcgeuWns5JmzkRg1X7UuaIpA89hkVeWPoZq3Zr1WWsPTZJrS6jq2/6XRDi6uX+Wpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoZ/b15G; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoZ/b15G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767233665; x=1798769665;
  h=date:from:to:cc:subject:message-id;
  bh=ULQrQGbn38gIWB7LrVWWR/XNoMdeCpJxD9Q07B2Q448=;
  b=LoZ/b15G+8IHlKEfTKR/eLKpmS3OxrvEQGdNlgoPmzcH/hdLCRPHTlDp
   nSnOrNMqll83/XUcwrXZEl7HE7UeJCu5qc6d2HmLl+Sl0ObbZ2DKF5K7u
   w5ziAGuEsTT4IkrKfq7oQxikmLiyIsh8qjWsVfQL/LX7akQLL5MbMbFJi
   afZXjP2otKAs6WQ+vGvgIaIq4s5oEtn0/tvb1kco7rnAd622UnB/UO6Ft
   ulSxW/aMvoFMbcJcoACdTagmKU5enAba/yLn2TY5+p2vor0uj1Z9bf2FI
   pS0EfnRH1a6AcQ9DBR03c4a5GLy7ZCLIZhMrtK89Rzy0fQ0i9uM+hJKyh
   w==;
X-CSE-ConnectionGUID: 9UgO5uJdRL2fXilLuk+mWg==
X-CSE-MsgGUID: umKv2lQ4RCWs3/roi4chuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79094134"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="79094134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 18:14:25 -0800
X-CSE-ConnectionGUID: h5rAGaR2ToiUQ1GrBO5EUw==
X-CSE-MsgGUID: DmJKtE78TxGd8tNoZdoTWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="232236065"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Dec 2025 18:14:23 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb8Ci-000000001bx-2cVy;
	Thu, 01 Jan 2026 02:14:20 +0000
Date: Thu, 01 Jan 2026 10:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1]
 arch/x86/include/asm/kvm-x86-ops.h:79:1: warning: pointer type mismatch
 ('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'void
 *')
Message-ID: <202601011001.tMrTshx2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   2a4d4d03042153eb4338672fb1f4d9f9a0099464
commit: 4f7c6137c2b309f7c6157366eb3396cbc2180b5a [0/1] KVM: x86: allow defining return-0 static calls
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260101/202601011001.tMrTshx2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011001.tMrTshx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011001.tMrTshx2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/vpsp.c:12:
   In file included from include/linux/kvm_host.h:36:
   In file included from arch/x86/include/asm/kvm_host.h:1432:
>> arch/x86/include/asm/kvm-x86-ops.h:79:1: warning: pointer type mismatch ('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'void *') [-Wpointer-type-mismatch]
      79 | KVM_X86_OP_OPTIONAL_RET0(guest_apic_has_interrupt)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1430:54: note: expanded from macro 'KVM_X86_OP_OPTIONAL_RET0'
    1430 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
    1431 |                            (void *) __static_call_return0);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:116:42: note: expanded from macro 'static_call_update'
     116 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
   In file included from drivers/crypto/ccp/vpsp.c:12:
   In file included from include/linux/kvm_host.h:36:
   In file included from arch/x86/include/asm/kvm_host.h:1432:
>> arch/x86/include/asm/kvm-x86-ops.h:85:1: warning: pointer type mismatch ('int (*)(struct kvm *, unsigned int)' and 'void *') [-Wpointer-type-mismatch]
      85 | KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1430:54: note: expanded from macro 'KVM_X86_OP_OPTIONAL_RET0'
    1430 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
    1431 |                            (void *) __static_call_return0);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:116:42: note: expanded from macro 'static_call_update'
     116 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
   In file included from drivers/crypto/ccp/vpsp.c:12:
   In file included from include/linux/kvm_host.h:36:
   In file included from arch/x86/include/asm/kvm_host.h:1432:
>> arch/x86/include/asm/kvm-x86-ops.h:86:1: warning: pointer type mismatch ('int (*)(struct kvm *, u64)' (aka 'int (*)(struct kvm *, unsigned long long)') and 'void *') [-Wpointer-type-mismatch]
      86 | KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1430:54: note: expanded from macro 'KVM_X86_OP_OPTIONAL_RET0'
    1430 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
    1431 |                            (void *) __static_call_return0);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:116:42: note: expanded from macro 'static_call_update'
     116 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
   In file included from drivers/crypto/ccp/vpsp.c:12:
   In file included from include/linux/kvm_host.h:36:
   In file included from arch/x86/include/asm/kvm_host.h:1432:
>> arch/x86/include/asm/kvm-x86-ops.h:87:1: warning: pointer type mismatch ('u64 (*)(struct kvm_vcpu *, gfn_t, bool)' (aka 'unsigned long long (*)(struct kvm_vcpu *, unsigned long long, _Bool)') and 'void *') [-Wpointer-type-mismatch]
      87 | KVM_X86_OP_OPTIONAL_RET0(get_mt_mask)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1430:54: note: expanded from macro 'KVM_X86_OP_OPTIONAL_RET0'
    1430 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
    1431 |                            (void *) __static_call_return0);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:116:42: note: expanded from macro 'static_call_update'
     116 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
   In file included from drivers/crypto/ccp/vpsp.c:12:
   In file included from include/linux/kvm_host.h:36:
   In file included from arch/x86/include/asm/kvm_host.h:1432:
   arch/x86/include/asm/kvm-x86-ops.h:106:1: warning: pointer type mismatch ('bool (*)(struct kvm_vcpu *)' (aka '_Bool (*)(struct kvm_vcpu *)') and 'void *') [-Wpointer-type-mismatch]
     106 | KVM_X86_OP_OPTIONAL_RET0(dy_apicv_has_pending_interrupt)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:1430:54: note: expanded from macro 'KVM_X86_OP_OPTIONAL_RET0'
    1430 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
    1431 |                            (void *) __static_call_return0);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:116:42: note: expanded from macro 'static_call_update'
     116 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                 ^~~~
   drivers/crypto/ccp/vpsp.c:775:6: warning: no previous prototype for function 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     775 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^
   drivers/crypto/ccp/vpsp.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         | ^
         | static 
   drivers/crypto/ccp/vpsp.c:1022:5: warning: no previous prototype for function 'vpsp_do_cmd' [-Wmissing-prototypes]
    1022 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^
   drivers/crypto/ccp/vpsp.c:1022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1022 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         | ^
         | static 
   7 warnings generated.


vim +79 arch/x86/include/asm/kvm-x86-ops.h

     5	
     6	/*
     7	 * KVM_X86_OP() and KVM_X86_OP_OPTIONAL() are used to help generate
     8	 * both DECLARE/DEFINE_STATIC_CALL() invocations and
     9	 * "static_call_update()" calls.
    10	 *
    11	 * KVM_X86_OP_OPTIONAL() can be used for those functions that can have
    12	 * a NULL definition, for example if "static_call_cond()" will be used
    13	 * at the call sites.  KVM_X86_OP_OPTIONAL_RET0() can be used likewise
    14	 * to make a definition optional, but in this case the default will
    15	 * be __static_call_return0.
    16	 */
    17	KVM_X86_OP(hardware_enable)
    18	KVM_X86_OP(hardware_disable)
    19	KVM_X86_OP(hardware_unsetup)
    20	KVM_X86_OP(has_emulated_msr)
    21	KVM_X86_OP(vcpu_after_set_cpuid)
    22	KVM_X86_OP(vm_init)
    23	KVM_X86_OP_OPTIONAL(vm_destroy)
    24	KVM_X86_OP(vcpu_create)
    25	KVM_X86_OP(vcpu_free)
    26	KVM_X86_OP(vcpu_reset)
    27	KVM_X86_OP(prepare_guest_switch)
    28	KVM_X86_OP(vcpu_load)
    29	KVM_X86_OP(vcpu_put)
    30	KVM_X86_OP(update_exception_bitmap)
    31	KVM_X86_OP(get_msr)
    32	KVM_X86_OP(set_msr)
    33	KVM_X86_OP(get_segment_base)
    34	KVM_X86_OP(get_segment)
    35	KVM_X86_OP(get_cpl)
    36	KVM_X86_OP(set_segment)
    37	KVM_X86_OP(get_cs_db_l_bits)
    38	KVM_X86_OP(set_cr0)
    39	KVM_X86_OP(set_cr4)
    40	KVM_X86_OP(set_efer)
    41	KVM_X86_OP(get_idt)
    42	KVM_X86_OP(set_idt)
    43	KVM_X86_OP(get_gdt)
    44	KVM_X86_OP(set_gdt)
    45	KVM_X86_OP(sync_dirty_debug_regs)
    46	KVM_X86_OP(set_dr7)
    47	KVM_X86_OP(cache_reg)
    48	KVM_X86_OP(get_rflags)
    49	KVM_X86_OP(set_rflags)
    50	KVM_X86_OP(tlb_flush_all)
    51	KVM_X86_OP(tlb_flush_current)
    52	KVM_X86_OP_OPTIONAL(tlb_remote_flush)
    53	KVM_X86_OP_OPTIONAL(tlb_remote_flush_with_range)
    54	KVM_X86_OP(tlb_flush_gva)
    55	KVM_X86_OP(tlb_flush_guest)
    56	KVM_X86_OP(run)
    57	KVM_X86_OP(handle_exit)
    58	KVM_X86_OP(skip_emulated_instruction)
    59	KVM_X86_OP_OPTIONAL(update_emulated_instruction)
    60	KVM_X86_OP(set_interrupt_shadow)
    61	KVM_X86_OP(get_interrupt_shadow)
    62	KVM_X86_OP(patch_hypercall)
    63	KVM_X86_OP(set_irq)
    64	KVM_X86_OP(set_nmi)
    65	KVM_X86_OP(queue_exception)
    66	KVM_X86_OP(cancel_injection)
    67	KVM_X86_OP(interrupt_allowed)
    68	KVM_X86_OP(nmi_allowed)
    69	KVM_X86_OP(get_nmi_mask)
    70	KVM_X86_OP(set_nmi_mask)
    71	KVM_X86_OP(enable_nmi_window)
    72	KVM_X86_OP(enable_irq_window)
    73	KVM_X86_OP_OPTIONAL(update_cr8_intercept)
    74	KVM_X86_OP(check_apicv_inhibit_reasons)
    75	KVM_X86_OP_OPTIONAL(pre_update_apicv_exec_ctrl)
    76	KVM_X86_OP(refresh_apicv_exec_ctrl)
    77	KVM_X86_OP_OPTIONAL(hwapic_irr_update)
    78	KVM_X86_OP_OPTIONAL(hwapic_isr_update)
  > 79	KVM_X86_OP_OPTIONAL_RET0(guest_apic_has_interrupt)
    80	KVM_X86_OP_OPTIONAL(load_eoi_exitmap)
    81	KVM_X86_OP_OPTIONAL(set_virtual_apic_mode)
    82	KVM_X86_OP_OPTIONAL(set_apic_access_page_addr)
    83	KVM_X86_OP(deliver_posted_interrupt)
    84	KVM_X86_OP_OPTIONAL(sync_pir_to_irr)
  > 85	KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
  > 86	KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
  > 87	KVM_X86_OP_OPTIONAL_RET0(get_mt_mask)
    88	KVM_X86_OP(load_mmu_pgd)
    89	KVM_X86_OP(has_wbinvd_exit)
    90	KVM_X86_OP(write_l1_tsc_offset)
    91	KVM_X86_OP(get_exit_info)
    92	KVM_X86_OP(check_intercept)
    93	KVM_X86_OP(handle_exit_irqoff)
    94	KVM_X86_OP(request_immediate_exit)
    95	KVM_X86_OP(sched_in)
    96	KVM_X86_OP_OPTIONAL(slot_enable_log_dirty)
    97	KVM_X86_OP_OPTIONAL(slot_disable_log_dirty)
    98	KVM_X86_OP_OPTIONAL(flush_log_dirty)
    99	KVM_X86_OP_OPTIONAL(enable_log_dirty_pt_masked)
   100	KVM_X86_OP_OPTIONAL(pre_block)
   101	KVM_X86_OP_OPTIONAL(post_block)
   102	KVM_X86_OP_OPTIONAL(vcpu_blocking)
   103	KVM_X86_OP_OPTIONAL(vcpu_unblocking)
   104	KVM_X86_OP(update_pi_irte)
   105	KVM_X86_OP_OPTIONAL(apicv_post_state_restore)
   106	KVM_X86_OP_OPTIONAL_RET0(dy_apicv_has_pending_interrupt)
   107	KVM_X86_OP_OPTIONAL(set_hv_timer)
   108	KVM_X86_OP_OPTIONAL(cancel_hv_timer)
   109	KVM_X86_OP(setup_mce)
   110	KVM_X86_OP(smi_allowed)
   111	KVM_X86_OP(pre_enter_smm)
   112	KVM_X86_OP(pre_leave_smm)
   113	KVM_X86_OP(enable_smi_window)
   114	KVM_X86_OP_OPTIONAL(mem_enc_op)
   115	KVM_X86_OP_OPTIONAL(mem_enc_reg_region)
   116	KVM_X86_OP_OPTIONAL(mem_enc_unreg_region)
   117	KVM_X86_OP(get_msr_feature)
   118	KVM_X86_OP(can_emulate_instruction)
   119	KVM_X86_OP(apic_init_signal_blocked)
   120	KVM_X86_OP_OPTIONAL(enable_direct_tlbflush)
   121	KVM_X86_OP_OPTIONAL(migrate_timers)
   122	KVM_X86_OP(msr_filter_changed)
   123	KVM_X86_OP(complete_emulated_msr)
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
