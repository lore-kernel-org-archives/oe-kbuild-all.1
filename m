Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F69B11184
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693156683; x=1724692683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wERZng3VDxs4MDVo0k25IAxr9GaB9fXBARRx+6bY7U=;
  b=bENsoRVYUcafyyDoKnDLLx+zU+44lJwQPk9LUyJEgqiMLgTLv6NoSP4L
   HQJ/mv/4lQSdSvSjzHSsrvWSIKKhe552qByr5CxSnkJc3TLWV2vAFTqxL
   eAgdjHHmN6CkxWybmgcpUtO+JCAOD/d7K7U51WMpSkiBYzrVmi2D9+GOH
   DvufD0kY7va3R+gTSBcprFm+fp9l1DVn6r5nwK6HGyu4xVwvhHFBhwsRN
   W+L/WmgCJmZ+3lZq+z14etiNDI00meomc5SILK7iWBOh3JL4MBeSy9NMz
   7GNFMqzdbSlRKquNUtDOfvz1awDdt8IGXYCjJqy21jJ1GEBXiB6ArhVa4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461325722"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461325722"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="731589653"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="731589653"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 10:17:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJOf-00061r-2B;
	Sun, 27 Aug 2023 17:17:57 +0000
Date: Mon, 28 Aug 2023 01:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ruifeng Gao <ruifeng.gao@intel.com>,
	Kai Huang <kai.huang@intel.com>
Subject: [intel-tdx:osv-integration 125/272]
 arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202308280100.gcXY0GYj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git osv-integration
head:   5617f3b0634401156d29e3d8d107db54f66bd3d6
commit: 74d79c60913f99a5e9378c2e64e381301800f9fc [125/272] KVM: x86/tdp_mmu: Support TDX private mapping for TDP MMU
config: x86_64-randconfig-123-20230827 (https://download.01.org/0day-ci/archive/20230828/202308280100.gcXY0GYj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280100.gcXY0GYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280100.gcXY0GYj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu * @@
   arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:627:17: sparse:     got unsigned long long [noderef] [usertype] __rcu *
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr @@
   arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse:     expected void const volatile *v
   arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse:     got unsigned long long [noderef] [usertype] __rcu *__ai_ptr
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/x86/kvm/mmu/tdp_mmu.c:829:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:829:30: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:829:30: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:837:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:837:28: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:837:28: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:1335:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1335:25: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1335:25: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1611:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:1611:9: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:1611:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:336:13: sparse: sparse: context imbalance in 'tdp_mmu_unlink_sp' - different lock contexts for basic block
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: dereference of noderef expression
>> arch/x86/kvm/mmu/tdp_mmu.c:691:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     got unsigned long long [usertype] *sptep
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'tdp_mmu_alloc_sp_for_split' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:736:34: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
>> arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:765:42: sparse:     got unsigned long long [usertype] *sptep

vim +627 arch/x86/kvm/mmu/tdp_mmu.c

   521	
   522	/**
   523	 * handle_changed_spte - handle bookkeeping associated with an SPTE change
   524	 * @kvm: kvm instance
   525	 * @as_id: the address space of the paging structure the SPTE was a part of
   526	 * @gfn: the base GFN that was mapped by the SPTE
   527	 * @old_spte: The value of the SPTE before the change
   528	 * @new_spte: The value of the SPTE after the change
   529	 * @role: the role of the PT the SPTE is part of in the paging structure
   530	 * @shared: This operation may not be running under the exclusive use of
   531	 *	    the MMU lock and the operation must synchronize with other
   532	 *	    threads that might be modifying SPTEs.
   533	 *
   534	 * Handle bookkeeping that might result from the modification of a SPTE.  Note,
   535	 * dirty logging updates are handled in common code, not here (see make_spte()
   536	 * and fast_pf_fix_direct_spte()).
   537	 */
   538	static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
   539					u64 old_spte, u64 new_spte,
   540					union kvm_mmu_page_role role, bool shared)
   541	{
   542		bool is_private = kvm_mmu_page_role_is_private(role);
   543		int level = role.level;
   544		bool was_present = is_shadow_present_pte(old_spte);
   545		bool is_present = is_shadow_present_pte(new_spte);
   546		bool was_leaf = was_present && is_last_spte(old_spte, level);
   547		bool is_leaf = is_present && is_last_spte(new_spte, level);
   548		kvm_pfn_t old_pfn = spte_to_pfn(old_spte);
   549		kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
   550		bool pfn_changed = old_pfn != new_pfn;
   551	
   552		WARN_ON(level > PT64_ROOT_MAX_LEVEL);
   553		WARN_ON(level < PG_LEVEL_4K);
   554		WARN_ON(gfn & (KVM_PAGES_PER_HPAGE(level) - 1));
   555	
   556		/*
   557		 * If this warning were to trigger it would indicate that there was a
   558		 * missing MMU notifier or a race with some notifier handler.
   559		 * A present, leaf SPTE should never be directly replaced with another
   560		 * present leaf SPTE pointing to a different PFN. A notifier handler
   561		 * should be zapping the SPTE before the main MM's page table is
   562		 * changed, or the SPTE should be zeroed, and the TLBs flushed by the
   563		 * thread before replacement.
   564		 */
   565		if (was_leaf && is_leaf && pfn_changed) {
   566			pr_err("Invalid SPTE change: cannot replace a present leaf\n"
   567			       "SPTE with another present leaf SPTE mapping a\n"
   568			       "different PFN!\n"
   569			       "as_id: %d gfn: %llx old_spte: %llx new_spte: %llx level: %d",
   570			       as_id, gfn, old_spte, new_spte, level);
   571	
   572			/*
   573			 * Crash the host to prevent error propagation and guest data
   574			 * corruption.
   575			 */
   576			BUG();
   577		}
   578	
   579		if (old_spte == new_spte)
   580			return;
   581	
   582		trace_kvm_tdp_mmu_spte_changed(as_id, gfn, level, old_spte, new_spte);
   583	
   584		if (is_leaf)
   585			check_spte_writable_invariants(new_spte);
   586	
   587		/*
   588		 * The only times a SPTE should be changed from a non-present to
   589		 * non-present state is when an MMIO entry is installed/modified/
   590		 * removed. In that case, there is nothing to do here.
   591		 */
   592		if (!was_present && !is_present) {
   593			/*
   594			 * If this change does not involve a MMIO SPTE or removed SPTE,
   595			 * it is unexpected. Log the change, though it should not
   596			 * impact the guest since both the former and current SPTEs
   597			 * are nonpresent.
   598			 */
   599			if (WARN_ON(!is_mmio_spte(kvm, old_spte) &&
   600				    !is_mmio_spte(kvm, new_spte) &&
   601				    !is_removed_spte(new_spte)))
   602				pr_err("Unexpected SPTE change! Nonpresent SPTEs\n"
   603				       "should not be replaced with another,\n"
   604				       "different nonpresent SPTE, unless one or both\n"
   605				       "are MMIO SPTEs, or the new SPTE is\n"
   606				       "a temporary removed SPTE.\n"
   607				       "as_id: %d gfn: %llx old_spte: %llx new_spte: %llx level: %d",
   608				       as_id, gfn, old_spte, new_spte, level);
   609			return;
   610		}
   611	
   612		if (is_leaf != was_leaf)
   613			kvm_update_page_stats(kvm, level, is_leaf ? 1 : -1);
   614	
   615		if (was_leaf && is_dirty_spte(old_spte) &&
   616		    (!is_present || !is_dirty_spte(new_spte) || pfn_changed))
   617			kvm_set_pfn_dirty(old_pfn);
   618	
   619		/*
   620		 * Recursively handle child PTs if the change removed a subtree from
   621		 * the paging structure.  Note the WARN on the PFN changing without the
   622		 * SPTE being converted to a hugepage (leaf) or being zapped.  Shadow
   623		 * pages are kernel allocations and should never be migrated.
   624		 */
   625		if (was_present && !was_leaf &&
   626		    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed))) {
 > 627			KVM_BUG_ON(is_private != is_private_sptep(spte_to_child_pt(old_spte, level)),
   628				   kvm);
   629			handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
   630		}
   631	
   632		/*
   633		 * Secure-EPT requires to remove Secure-EPT tables after removing
   634		 * children.  hooks after handling lower page table by above
   635		 * handle_remove_pt().
   636		 */
   637		if (is_private && !is_present)
   638			handle_removed_private_spte(kvm, gfn, old_spte, new_spte, role.level);
   639	
   640		if (was_leaf && is_accessed_spte(old_spte) &&
   641		    (!is_present || !is_accessed_spte(new_spte) || pfn_changed))
   642			kvm_set_pfn_accessed(spte_to_pfn(old_spte));
   643	}
   644	
   645	static int __must_check __set_private_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
   646							   gfn_t gfn, u64 old_spte,
   647							   u64 new_spte, int level)
   648	{
   649		bool was_present = is_shadow_present_pte(old_spte);
   650		bool is_present = is_shadow_present_pte(new_spte);
   651		bool is_leaf = is_present && is_last_spte(new_spte, level);
   652		kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
   653		int ret = 0;
   654	
   655		lockdep_assert_held(&kvm->mmu_lock);
   656		/* TDP MMU doesn't change present -> present */
   657		KVM_BUG_ON(was_present, kvm);
   658	
   659		/*
   660		 * Use different call to either set up middle level
   661		 * private page table, or leaf.
   662		 */
   663		if (is_leaf)
   664			ret = static_call(kvm_x86_set_private_spte)(kvm, gfn, level, new_pfn);
   665		else {
   666			void *private_spt = get_private_spt(gfn, new_spte, level);
   667	
   668			KVM_BUG_ON(!private_spt, kvm);
   669			ret = static_call(kvm_x86_link_private_spt)(kvm, gfn, level, private_spt);
   670		}
   671	
   672		return ret;
   673	}
   674	
   675	static int __must_check set_private_spte_present(struct kvm *kvm, tdp_ptep_t sptep,
   676							 gfn_t gfn, u64 old_spte,
   677							 u64 new_spte, int level)
   678	{
   679		int ret;
   680	
   681		/*
   682		 * For private page table, callbacks are needed to propagate SPTE
   683		 * change into the protected page table.  In order to atomically update
   684		 * both the SPTE and the protected page tables with callbacks, utilize
   685		 * freezing SPTE.
   686		 * - Freeze the SPTE. Set entry to REMOVED_SPTE.
   687		 * - Trigger callbacks for protected page tables.
   688		 * - Unfreeze the SPTE.  Set the entry to new_spte.
   689		 */
   690		lockdep_assert_held(&kvm->mmu_lock);
 > 691		if (!try_cmpxchg64(sptep, &old_spte, REMOVED_SPTE))
   692			return -EBUSY;
   693	
   694		ret = __set_private_spte_present(kvm, sptep, gfn, old_spte, new_spte, level);
   695		if (ret)
   696			__kvm_tdp_mmu_write_spte(sptep, old_spte);
   697		else
   698			__kvm_tdp_mmu_write_spte(sptep, new_spte);
   699		return ret;
   700	}
   701	
   702	/*
   703	 * tdp_mmu_set_spte_atomic - Set a TDP MMU SPTE atomically
   704	 * and handle the associated bookkeeping.  Do not mark the page dirty
   705	 * in KVM's dirty bitmaps.
   706	 *
   707	 * If setting the SPTE fails because it has changed, iter->old_spte will be
   708	 * refreshed to the current value of the spte.
   709	 *
   710	 * @kvm: kvm instance
   711	 * @iter: a tdp_iter instance currently on the SPTE that should be set
   712	 * @new_spte: The value the SPTE should be set to
   713	 * Return:
   714	 * * 0      - If the SPTE was set.
   715	 * * -EBUSY - If the SPTE cannot be set. In this case this function will have
   716	 *            no side-effects other than setting iter->old_spte to the last
   717	 *            known value of the spte.
   718	 */
   719	static inline int __must_check tdp_mmu_set_spte_atomic(struct kvm *kvm,
   720							       struct tdp_iter *iter,
   721							       u64 new_spte)
   722	{
   723		u64 *sptep = rcu_dereference(iter->sptep);
   724		bool freezed = false;
   725	
   726		/*
   727		 * The caller is responsible for ensuring the old SPTE is not a REMOVED
   728		 * SPTE.  KVM should never attempt to zap or manipulate a REMOVED SPTE,
   729		 * and pre-checking before inserting a new SPTE is advantageous as it
   730		 * avoids unnecessary work.
   731		 */
   732		WARN_ON_ONCE(iter->yielded || is_removed_spte(iter->old_spte));
   733	
   734		lockdep_assert_held_read(&kvm->mmu_lock);
   735	
   736		if (is_private_sptep(iter->sptep) && !is_removed_spte(new_spte)) {
   737			int ret;
   738	
   739			if (is_shadow_present_pte(new_spte)) {
   740				ret = set_private_spte_present(kvm, iter->sptep, iter->gfn,
   741							       iter->old_spte, new_spte, iter->level);
   742				if (ret)
   743					return ret;
   744			} else {
   745				if (!try_cmpxchg64(sptep, &iter->old_spte, REMOVED_SPTE))
   746					return -EBUSY;
   747				freezed = true;
   748			}
   749		} else {
   750			/*
   751			 * Note, fast_pf_fix_direct_spte() can also modify TDP MMU SPTEs
   752			 * and does not hold the mmu_lock.  On failure, i.e. if a
   753			 * different logical CPU modified the SPTE, try_cmpxchg64()
   754			 * updates iter->old_spte with the current value, so the caller
   755			 * operates on fresh data, e.g. if it retries
   756			 * tdp_mmu_set_spte_atomic()
   757			 */
   758			if (!try_cmpxchg64(sptep, &iter->old_spte, new_spte))
   759				return -EBUSY;
   760		}
   761	
   762		handle_changed_spte(kvm, iter->as_id, iter->gfn, iter->old_spte,
   763				    new_spte, sptep_to_sp(sptep)->role, true);
   764		if (freezed)
 > 765			__kvm_tdp_mmu_write_spte(sptep, new_spte);
   766		return 0;
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
