Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D56ADB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680882356; x=1712418356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqIujoiNHnvGfEIPZUAOC9ki5eUGoMZ6i/9+itPWa98=;
  b=jPWqrvbtSRciUgr+Ni06eS1xHIBJMzWmlh6Cc9pTfdL/l7y9vxfbM99A
   FkyGCHTDwmFNXOwHFWvxRcJFY488q8K4y+oOEMvcVtBrNzxt+DJo+Fv3T
   GlMczjh/sIAX3Z3SgJMAE/uEWtSDkI18kES9RPkCUo0C29ohiyv4k9IDG
   N6EV3rhcu+iR+NJt/RgXkj2NgToxQ58OgyV1l/9lC+GFazDim7WEG35je
   QTLuqReLrFwKlmUSwWc5s4PvFZHtUIGXD3dyu11nlrcZXjr84B6vdHfqq
   MCu+ft/ZkaeFl+bvWAwV6tC0DR3cWdkvG3A03KWPyX3r1zii4K4MRGrsk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="331662648"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="331662648"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 08:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="664931701"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="664931701"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 08:45:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkoHf-000SeR-1W;
	Fri, 07 Apr 2023 15:45:51 +0000
Date: Fri, 7 Apr 2023 23:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 91/335]
 arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202304072333.RpSkRY5H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3e6762343e0ddcb90b2e49af3a341051541d1a3a
commit: b8ac009e60bd9f87851931d6c17dafd1bee8e7b0 [91/335] KVM: x86/tdp_mmu: Support TDX private mapping for TDP MMU
config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072333.RpSkRY5H-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/b8ac009e60bd9f87851931d6c17dafd1bee8e7b0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b8ac009e60bd9f87851931d6c17dafd1bee8e7b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072333.RpSkRY5H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu * @@
   arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:684:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr @@
   arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse:     expected void const volatile *v
   arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse:     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:902:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:902:30: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:902:30: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:910:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:910:28: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:910:28: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:1414:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1414:25: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1414:25: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1670:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1670:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1670:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:394:13: sparse: sparse: context imbalance in 'tdp_mmu_unlink_sp' - different lock contexts for basic block
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: dereference of noderef expression
>> arch/x86/kvm/mmu/tdp_mmu.c:756:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     got unsigned long long [usertype] *sptep
   include/linux/rcupdate.h:804:9: sparse: sparse: context imbalance in 'tdp_mmu_alloc_sp_for_split' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:801:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:827:42: sparse:     got unsigned long long [usertype] *sptep

vim +684 arch/x86/kvm/mmu/tdp_mmu.c

   579	
   580	/**
   581	 * __handle_changed_spte - handle bookkeeping associated with an SPTE change
   582	 * @kvm: kvm instance
   583	 * @as_id: the address space of the paging structure the SPTE was a part of
   584	 * @gfn: the base GFN that was mapped by the SPTE
   585	 * @old_spte: The value of the SPTE before the change
   586	 * @new_spte: The value of the SPTE after the change
   587	 * @role: the role of the PT the SPTE is part of in the paging structure
   588	 * @shared: This operation may not be running under the exclusive use of
   589	 *	    the MMU lock and the operation must synchronize with other
   590	 *	    threads that might be modifying SPTEs.
   591	 *
   592	 * Handle bookkeeping that might result from the modification of a SPTE.
   593	 * This function must be called for all TDP SPTE modifications.
   594	 */
   595	static void __handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
   596					 u64 old_spte, u64 new_spte,
   597					 union kvm_mmu_page_role role, bool shared)
   598	{
   599		bool is_private = kvm_mmu_page_role_is_private(role);
   600		int level = role.level;
   601		bool was_present = is_shadow_present_pte(old_spte);
   602		bool is_present = is_shadow_present_pte(new_spte);
   603		bool was_leaf = was_present && is_last_spte(old_spte, level);
   604		bool is_leaf = is_present && is_last_spte(new_spte, level);
   605		kvm_pfn_t old_pfn = spte_to_pfn(old_spte);
   606		kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
   607		bool pfn_changed = old_pfn != new_pfn;
   608	
   609		WARN_ON(level > PT64_ROOT_MAX_LEVEL);
   610		WARN_ON(level < PG_LEVEL_4K);
   611		WARN_ON(gfn & (KVM_PAGES_PER_HPAGE(level) - 1));
   612	
   613		/*
   614		 * If this warning were to trigger it would indicate that there was a
   615		 * missing MMU notifier or a race with some notifier handler.
   616		 * A present, leaf SPTE should never be directly replaced with another
   617		 * present leaf SPTE pointing to a different PFN. A notifier handler
   618		 * should be zapping the SPTE before the main MM's page table is
   619		 * changed, or the SPTE should be zeroed, and the TLBs flushed by the
   620		 * thread before replacement.
   621		 */
   622		if (was_leaf && is_leaf && pfn_changed) {
   623			pr_err("Invalid SPTE change: cannot replace a present leaf\n"
   624			       "SPTE with another present leaf SPTE mapping a\n"
   625			       "different PFN!\n"
   626			       "as_id: %d gfn: %llx old_spte: %llx new_spte: %llx level: %d",
   627			       as_id, gfn, old_spte, new_spte, level);
   628	
   629			/*
   630			 * Crash the host to prevent error propagation and guest data
   631			 * corruption.
   632			 */
   633			BUG();
   634		}
   635	
   636		if (old_spte == new_spte)
   637			return;
   638	
   639		trace_kvm_tdp_mmu_spte_changed(as_id, gfn, level, old_spte, new_spte);
   640	
   641		if (is_leaf)
   642			check_spte_writable_invariants(new_spte);
   643	
   644		/*
   645		 * The only times a SPTE should be changed from a non-present to
   646		 * non-present state is when an MMIO entry is installed/modified/
   647		 * removed. In that case, there is nothing to do here.
   648		 */
   649		if (!was_present && !is_present) {
   650			/*
   651			 * If this change does not involve a MMIO SPTE or removed SPTE,
   652			 * it is unexpected. Log the change, though it should not
   653			 * impact the guest since both the former and current SPTEs
   654			 * are nonpresent.
   655			 */
   656			if (WARN_ON(!is_mmio_spte(kvm, old_spte) &&
   657				    !is_mmio_spte(kvm, new_spte) &&
   658				    !is_removed_spte(new_spte)))
   659				pr_err("Unexpected SPTE change! Nonpresent SPTEs\n"
   660				       "should not be replaced with another,\n"
   661				       "different nonpresent SPTE, unless one or both\n"
   662				       "are MMIO SPTEs, or the new SPTE is\n"
   663				       "a temporary removed SPTE.\n"
   664				       "as_id: %d gfn: %llx old_spte: %llx new_spte: %llx level: %d",
   665				       as_id, gfn, old_spte, new_spte, level);
   666			return;
   667		}
   668	
   669		if (is_leaf != was_leaf)
   670			kvm_update_page_stats(kvm, level, is_leaf ? 1 : -1);
   671	
   672		if (was_leaf && is_dirty_spte(old_spte) &&
   673		    (!is_present || !is_dirty_spte(new_spte) || pfn_changed))
   674			kvm_set_pfn_dirty(old_pfn);
   675	
   676		/*
   677		 * Recursively handle child PTs if the change removed a subtree from
   678		 * the paging structure.  Note the WARN on the PFN changing without the
   679		 * SPTE being converted to a hugepage (leaf) or being zapped.  Shadow
   680		 * pages are kernel allocations and should never be migrated.
   681		 */
   682		if (was_present && !was_leaf &&
   683		    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed))) {
 > 684			KVM_BUG_ON(is_private != is_private_sptep(spte_to_child_pt(old_spte, level)),
   685				   kvm);
   686			handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
   687		}
   688	
   689		/*
   690		 * Secure-EPT requires to remove Secure-EPT tables after removing
   691		 * children.  hooks after after handling lower page table by above
   692		 * handle_remove_pt().
   693		 */
   694		if (is_private && !is_present)
   695			handle_removed_private_spte(kvm, gfn, old_spte, new_spte, role.level);
   696	}
   697	
   698	static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
   699				       u64 old_spte, u64 new_spte,
   700				       union kvm_mmu_page_role role,
   701				       bool shared)
   702	{
   703		__handle_changed_spte(kvm, as_id, gfn, old_spte, new_spte, role, shared);
   704	
   705		handle_changed_spte_acc_track(old_spte, new_spte, role.level);
   706		handle_changed_spte_dirty_log(kvm, as_id, gfn, old_spte,
   707					      new_spte, role.level);
   708	}
   709	
   710	static int __must_check __set_private_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
   711							   gfn_t gfn, u64 old_spte,
   712							   u64 new_spte, int level)
   713	{
   714		bool was_present = is_shadow_present_pte(old_spte);
   715		bool is_present = is_shadow_present_pte(new_spte);
   716		bool is_leaf = is_present && is_last_spte(new_spte, level);
   717		kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
   718		int ret = 0;
   719	
   720		lockdep_assert_held(&kvm->mmu_lock);
   721		/* TDP MMU doesn't change present -> present */
   722		KVM_BUG_ON(was_present, kvm);
   723	
   724		/*
   725		 * Use different call to either set up middle level
   726		 * private page table, or leaf.
   727		 */
   728		if (is_leaf)
   729			ret = static_call(kvm_x86_set_private_spte)(kvm, gfn, level, new_pfn);
   730		else {
   731			void *private_spt = get_private_spt(gfn, new_spte, level);
   732	
   733			KVM_BUG_ON(!private_spt, kvm);
   734			ret = static_call(kvm_x86_link_private_spt)(kvm, gfn, level, private_spt);
   735		}
   736	
   737		return ret;
   738	}
   739	
   740	static int __must_check set_private_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
   741							 gfn_t gfn, u64 old_spte,
   742							 u64 new_spte, int level)
   743	{
   744		int ret;
   745	
   746		/*
   747		 * For private page table, callbacks are needed to propagate SPTE
   748		 * change into the protected page table.  In order to atomically update
   749		 * both the SPTE and the protected page tables with callbacks, utilize
   750		 * freezing SPTE.
   751		 * - Freeze the SPTE. Set entry to REMOVED_SPTE.
   752		 * - Trigger callbacks for protected page tables.
   753		 * - Unfreeze the SPTE.  Set the entry to new_spte.
   754		 */
   755		lockdep_assert_held(&kvm->mmu_lock);
 > 756		if (!try_cmpxchg64(sptep, &old_spte, REMOVED_SPTE))
   757			return -EBUSY;
   758	
   759		ret = __set_private_spte_present(kvm, sptep, gfn, old_spte, new_spte, level);
   760		if (ret)
   761			__kvm_tdp_mmu_write_spte(sptep, old_spte);
   762		else
   763			__kvm_tdp_mmu_write_spte(sptep, new_spte);
   764		return ret;
   765	}
   766	
   767	/*
   768	 * tdp_mmu_set_spte_atomic - Set a TDP MMU SPTE atomically
   769	 * and handle the associated bookkeeping.  Do not mark the page dirty
   770	 * in KVM's dirty bitmaps.
   771	 *
   772	 * If setting the SPTE fails because it has changed, iter->old_spte will be
   773	 * refreshed to the current value of the spte.
   774	 *
   775	 * @kvm: kvm instance
   776	 * @iter: a tdp_iter instance currently on the SPTE that should be set
   777	 * @new_spte: The value the SPTE should be set to
   778	 * Return:
   779	 * * 0      - If the SPTE was set.
   780	 * * -EBUSY - If the SPTE cannot be set. In this case this function will have
   781	 *            no side-effects other than setting iter->old_spte to the last
   782	 *            known value of the spte.
   783	 */
   784	static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
   785							       struct tdp_iter *iter,
   786							       u64 new_spte)
   787	{
   788		u64 *sptep = rcu_dereference(iter->sptep);
   789		bool freezed = false;
   790	
   791		/*
   792		 * The caller is responsible for ensuring the old SPTE is not a REMOVED
   793		 * SPTE.  KVM should never attempt to zap or manipulate a REMOVED SPTE,
   794		 * and pre-checking before inserting a new SPTE is advantageous as it
   795		 * avoids unnecessary work.
   796		 */
   797		WARN_ON_ONCE(iter->yielded || is_removed_spte(iter->old_spte));
   798	
   799		lockdep_assert_held_read(&kvm->mmu_lock);
   800	
   801		if (is_private_sptep(iter->sptep) && !is_removed_spte(new_spte)) {
   802			int ret;
   803	
   804			if (is_shadow_present_pte(new_spte)) {
   805				ret = set_private_spte_present(kvm, iter->sptep, iter->gfn,
   806							       iter->old_spte, new_spte, iter->level);
   807				if (ret)
   808					return ret;
   809			} else {
   810				if (!try_cmpxchg64(sptep, &iter->old_spte, REMOVED_SPTE))
   811					return -EBUSY;
   812				freezed = true;
   813			}
   814		} else {
   815			/*
   816			 * Note, fast_pf_fix_direct_spte() can also modify TDP MMU SPTEs
   817			 * and does not hold the mmu_lock.
   818			 */
   819			if (!try_cmpxchg64(sptep, &iter->old_spte, new_spte))
   820				return -EBUSY;
   821		}
   822	
   823		__handle_changed_spte(kvm, iter->as_id, iter->gfn, iter->old_spte,
   824				      new_spte, sptep_to_sp(sptep)->role, true);
   825		handle_changed_spte_acc_track(iter->old_spte, new_spte, iter->level);
   826		if (freezed)
 > 827			__kvm_tdp_mmu_write_spte(sptep, new_spte);
   828		return 0;
   829	}
   830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
