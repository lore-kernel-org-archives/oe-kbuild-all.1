Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF5149C6F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754607; cv=none; b=PEHYqN/qmN/TCg4s452x2/JsIOHtrHIwvUop+pMsizeAP/J+JcfCjjcfYwWihbsRVo3RiBaSbQd7W0zxyKGKDItfxM/mi4CeMaG7uVy3PXq7mxE2WBxLPe483NFLITF91RjGozjn1X7zNJfCvnzcvXCyau5JGVx3A49q+dXIra4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754607; c=relaxed/simple;
	bh=qjx/1ZA+EXG+Eon2eVjkrM7LEPGPlgbSZpTVqK8Hj7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EUzlNJpk03rRldOx8j1cyuvNk3yHi5VaLa/ZbToCwue5q0pu5Nz5g9SZKf+ivUnlZwd+hST+S2WuMFNquqFUmC6FVjshxawh2kybS3ThbN2HoHLt8ldet51mnZU+XrmlpH7YtaptZNN7asQ8dJ+6Uw0IxV44n88YTgzm+PJTT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RouxzQm9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RouxzQm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723754605; x=1755290605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjx/1ZA+EXG+Eon2eVjkrM7LEPGPlgbSZpTVqK8Hj7k=;
  b=RouxzQm9Fh/xOMmBRbEpMnZJQ01/XKOyPeH/DKmymkbX8I2oVQQlN/oV
   zPf8Ce3RtClq4VLRREQCY22LK63NYZ0jzYUwpmUuDKHXdPguTl51vzGTx
   /IKwcv+FowUdSpeIW/q1JZFXP1WbFNgZBkX1zJ37+Qh9fbdWhZQXsP20q
   wj57CXLKnjKbYc9ivnyYKzGB5/zNeUpxOcduLPiFJOSY4BGgjhFOv9P8V
   6g1UpldG58rGygPP8tdp8i3z3ov+Km0CxK0rBG8iEadCos1UFUBxfjoSq
   BcgZR9RsCJewIzVBL3PX/gGD5g9T3iCPg6jXpA0raeNS3I7uzcRIb0ysg
   w==;
X-CSE-ConnectionGUID: PrGfrtKRRj6yZREZPDbD5Q==
X-CSE-MsgGUID: pdTB/9CvTZOgUKO7qus2pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21675207"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="21675207"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 13:43:24 -0700
X-CSE-ConnectionGUID: ujiYXbRzQd+U0OoOVzoueg==
X-CSE-MsgGUID: 4DLYAvafQuGGJW7YkDIP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59142456"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2024 13:43:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sehJY-0005aB-1D;
	Thu, 15 Aug 2024 20:43:20 +0000
Date: Fri, 16 Aug 2024 04:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 86/86] arch/x86/kvm/mmu/spte.c:243:17:
 error: expected '}' before 'else'
Message-ID: <202408160457.AF488m7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   611850ae46de0bdd0ae46c81ea4050547fd65346
commit: 611850ae46de0bdd0ae46c81ea4050547fd65346 [86/86] KVM: x86/mmu: Fold all of make_spte()'s writable handling into one if-else
config: i386-randconfig-004-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160457.AF488m7h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408160457.AF488m7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408160457.AF488m7h-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/spte.c: In function 'make_spte':
   arch/x86/kvm/mmu/spte.c:239:19: error: expected expression before '/' token
     239 |                  */
         |                   ^
>> arch/x86/kvm/mmu/spte.c:243:17: error: expected '}' before 'else'
     243 |                 else
         |                 ^~~~
>> arch/x86/kvm/mmu/spte.c:165:14: warning: unused variable 'wrprot' [-Wunused-variable]
     165 |         bool wrprot = false;
         |              ^~~~~~
   arch/x86/kvm/mmu/spte.c: At top level:
>> arch/x86/kvm/mmu/spte.c:248:9: error: expected identifier or '(' before 'if'
     248 |         if (prefetch)
         |         ^~
   In file included from include/asm-generic/bug.h:7,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/mmu/spte.c:12:
>> include/linux/once_lite.h:27:10: error: expected identifier or '(' before '{' token
      27 |         ({                                                              \
         |          ^
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/spte.c:251:9: note: in expansion of macro 'WARN_ONCE'
     251 |         WARN_ONCE(is_rsvd_spte(&vcpu->arch.mmu->shadow_zero_check, spte, level),
         |         ^~~~~~~~~
   arch/x86/kvm/mmu/spte.c:260:9: error: expected identifier or '(' before 'if'
     260 |         if ((spte & PT_WRITABLE_MASK) && kvm_slot_dirty_track_enabled(slot)) {
         |         ^~
>> arch/x86/kvm/mmu/spte.c:266:9: warning: data definition has no type or storage class
     266 |         *new_spte = spte;
         |         ^
>> arch/x86/kvm/mmu/spte.c:266:10: error: type defaults to 'int' in declaration of 'new_spte' [-Werror=implicit-int]
     266 |         *new_spte = spte;
         |          ^~~~~~~~
>> arch/x86/kvm/mmu/spte.c:266:21: error: 'spte' undeclared here (not in a function)
     266 |         *new_spte = spte;
         |                     ^~~~
>> arch/x86/kvm/mmu/spte.c:267:9: error: expected identifier or '(' before 'return'
     267 |         return wrprot;
         |         ^~~~~~
>> arch/x86/kvm/mmu/spte.c:268:1: error: expected identifier or '(' before '}' token
     268 | }
         | ^
   arch/x86/kvm/mmu/spte.c: In function 'make_spte':
>> arch/x86/kvm/mmu/spte.c:246:9: warning: control reaches end of non-void function [-Wreturn-type]
     246 |         }
         |         ^
   cc1: some warnings being treated as errors


vim +243 arch/x86/kvm/mmu/spte.c

   156	
   157	bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
   158		       const struct kvm_memory_slot *slot,
   159		       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
   160		       u64 old_spte, bool prefetch, bool can_unsync,
   161		       bool host_writable, u64 *new_spte)
   162	{
   163		int level = sp->role.level;
   164		u64 spte = SPTE_MMU_PRESENT_MASK;
 > 165		bool wrprot = false;
   166	
   167		/*
   168		 * For the EPT case, shadow_present_mask has no RWX bits set if
   169		 * exec-only page table entries are supported.  In that case,
   170		 * ACC_USER_MASK and shadow_user_mask are used to represent
   171		 * read access.  See FNAME(gpte_access) in paging_tmpl.h.
   172		 */
   173		WARN_ON_ONCE((pte_access | shadow_present_mask) == SHADOW_NONPRESENT_VALUE);
   174	
   175		if (sp->role.ad_disabled)
   176			spte |= SPTE_TDP_AD_DISABLED;
   177		else if (kvm_mmu_page_ad_need_write_protect(sp))
   178			spte |= SPTE_TDP_AD_WRPROT_ONLY;
   179	
   180		spte |= shadow_present_mask;
   181		if (!prefetch)
   182			spte |= spte_shadow_accessed_mask(spte);
   183	
   184		/*
   185		 * For simplicity, enforce the NX huge page mitigation even if not
   186		 * strictly necessary.  KVM could ignore the mitigation if paging is
   187		 * disabled in the guest, as the guest doesn't have any page tables to
   188		 * abuse.  But to safely ignore the mitigation, KVM would have to
   189		 * ensure a new MMU is loaded (or all shadow pages zapped) when CR0.PG
   190		 * is toggled on, and that's a net negative for performance when TDP is
   191		 * enabled.  When TDP is disabled, KVM will always switch to a new MMU
   192		 * when CR0.PG is toggled, but leveraging that to ignore the mitigation
   193		 * would tie make_spte() further to vCPU/MMU state, and add complexity
   194		 * just to optimize a mode that is anything but performance critical.
   195		 */
   196		if (level > PG_LEVEL_4K && (pte_access & ACC_EXEC_MASK) &&
   197		    is_nx_huge_page_enabled(vcpu->kvm)) {
   198			pte_access &= ~ACC_EXEC_MASK;
   199		}
   200	
   201		if (pte_access & ACC_EXEC_MASK)
   202			spte |= shadow_x_mask;
   203		else
   204			spte |= shadow_nx_mask;
   205	
   206		if (pte_access & ACC_USER_MASK)
   207			spte |= shadow_user_mask;
   208	
   209		if (level > PG_LEVEL_4K)
   210			spte |= PT_PAGE_SIZE_MASK;
   211	
   212		if (shadow_memtype_mask)
   213			spte |= kvm_x86_call(get_mt_mask)(vcpu, gfn,
   214							  kvm_is_mmio_pfn(pfn));
   215		if (host_writable)
   216			spte |= shadow_host_writable_mask;
   217		else
   218			pte_access &= ~ACC_WRITE_MASK;
   219	
   220		if (shadow_me_value && !kvm_is_mmio_pfn(pfn))
   221			spte |= shadow_me_value;
   222	
   223		spte |= (u64)pfn << PAGE_SHIFT;
   224	
   225		if (pte_access & ACC_WRITE_MASK) {
   226			/*
   227			 * Unsync shadow pages that are reachable by the new, writable
   228			 * SPTE.  Write-protect the SPTE if the page can't be unsync'd,
   229			 * e.g. it's write-tracked (upper-level SPs) or has one or more
   230			 * shadow pages and unsync'ing pages is not allowed.
   231			 *
   232			 * When overwriting an existing leaf SPTE, and the old SPTE was
   233			 * writable, skip trying to unsync shadow pages as any relevant
   234			 * shadow pages must already be unsync, i.e. the hash lookup is
   235			 * unnecessary (and expensive).  Note, this relies on KVM not
   236			 * changing PFNs without first zapping the old SPTE, which is
   237			 * guaranteed by both the shadow MMU and the TDP MMU.
   238			 */
   239			 */
   240			if ((!is_last_spte(old_spte, level) || !is_writable_pte(old_spte)) &&
   241			    mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, can_unsync, prefetch))
   242				wrprot = true;
 > 243			else
   244				spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask |
   245					spte_shadow_dirty_mask(spte);
 > 246		}
   247	
 > 248		if (prefetch)
   249			spte = mark_spte_for_access_track(spte);
   250	
   251		WARN_ONCE(is_rsvd_spte(&vcpu->arch.mmu->shadow_zero_check, spte, level),
   252			  "spte = 0x%llx, level = %d, rsvd bits = 0x%llx", spte, level,
   253			  get_rsvd_bits(&vcpu->arch.mmu->shadow_zero_check, spte, level));
   254	
   255		/*
   256		 * Mark the memslot dirty *after* modifying it for access tracking.
   257		 * Unlike folios, memslots can be safely marked dirty out of mmu_lock,
   258		 * i.e. in the fast page fault handler.
   259		 */
   260		if ((spte & PT_WRITABLE_MASK) && kvm_slot_dirty_track_enabled(slot)) {
   261			/* Enforced by kvm_mmu_hugepage_adjust. */
   262			WARN_ON_ONCE(level > PG_LEVEL_4K);
   263			mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
   264		}
   265	
 > 266		*new_spte = spte;
 > 267		return wrprot;
 > 268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
