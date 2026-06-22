Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3152139EF0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122583; cv=none; b=T4Wx5O9L3uxSU50rzNU+xxCwXjBnvaIZM1bRouPBRgOsqUaUmfvnEDROdq5CFchUpIX9CJ3Hg/7iKiGInW9TmYrswz6QkzLSgHg/LuDnjxN/E2GqK8ttSuYZMjWOpsI34hepKnlv5Ug1CaET1DkyaTjbAiGUakIZbyR089K1SjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122583; c=relaxed/simple;
	bh=Ezw24O3pUNhcPccP+K5QyJauFSYVPD58ql9Js7X+gak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ELGYwmJhGOLCTwt7LCT6prXRYvK727tk5wXQL5fgkxBh9OkiA9O0UJCkk5q1PQ2ifDp41d90TEUSv60znG48Rr5nxWBVs7+TyNs6T5aeEUm5peSedZGE6TBl0u3xJcGemrB2dMGCpo+ZZ/+6XzmC67g/8c2SXIJw+s9tvoGy0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEgMjxC0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEgMjxC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782122581; x=1813658581;
  h=date:from:to:cc:subject:message-id;
  bh=Ezw24O3pUNhcPccP+K5QyJauFSYVPD58ql9Js7X+gak=;
  b=NEgMjxC00/pSqrCOvZArKPI5RBLEOrU4hWh9z8UNevLQbiDY/c1CeTLX
   aTroECqtcoKUAoEW/1DgNlXZWs01alrBezKyBa6nmT08HzgpmOWPxDJAi
   mAB7Jl42BPYV7KlyvPV45W4IY3VR/xFTFUGQhHIdTRULUZ09ueQTpDg7c
   FvgukATcgyOjoWb+oyKZqMkFw6j1FoPAgOSNyz8d2nUX2O3xsgtku0Eln
   uvUD8y11bbfgQuXvdd6qY23mKA0ZM49h1i7OaWuboBA3lPMQIvAu/t2xs
   oKB26dacLiRt4KZRK0Om8kgfkS5v5jj25T9kUa7w7UU0CS4j2mi4uU7N4
   Q==;
X-CSE-ConnectionGUID: V8hpcN/tT9+bKM36AunOEA==
X-CSE-MsgGUID: hFfFgs+SRcq/AEloNKUbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86530616"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86530616"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:03:00 -0700
X-CSE-ConnectionGUID: NiZXPYDIQV6LgEF1AF4ZOw==
X-CSE-MsgGUID: Vaz+0ArVSouJz/efK/c68Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="253521981"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 03:02:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbbUS-000000000xF-18Hy;
	Mon, 22 Jun 2026 10:02:53 +0000
Date: Mon, 22 Jun 2026 18:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/mprotect.c:700:43: sparse: sparse: cast to non-scalar
Message-ID: <202606221720.CGRCyQ8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 3a6455d56bd7c4cfb1ea35ddae052943065e338e mm: convert do_brk_flags() to use vma_flags_t
date:   3 months ago
config: alpha-randconfig-r111-20260618 (https://download.01.org/0day-ci/archive/20260622/202606221720.CGRCyQ8e-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221720.CGRCyQ8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3a6455d56bd7 ("mm: convert do_brk_flags() to use vma_flags_t")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221720.CGRCyQ8e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mprotect.c:700:43: sparse: sparse: cast to non-scalar
>> mm/mprotect.c:700:43: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
   arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast to non-scalar
   arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:475:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:475:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:468:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:468:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar

vim +700 mm/mprotect.c

   693	
   694	int
   695	mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
   696		       struct vm_area_struct *vma, struct vm_area_struct **pprev,
   697		       unsigned long start, unsigned long end, vm_flags_t newflags)
   698	{
   699		struct mm_struct *mm = vma->vm_mm;
 > 700		const vma_flags_t old_vma_flags = READ_ONCE(vma->flags);
   701		vma_flags_t new_vma_flags = legacy_to_vma_flags(newflags);
   702		long nrpages = (end - start) >> PAGE_SHIFT;
   703		unsigned int mm_cp_flags = 0;
   704		unsigned long charged = 0;
   705		int error;
   706	
   707		if (vma_is_sealed(vma))
   708			return -EPERM;
   709	
   710		if (vma_flags_same_pair(&old_vma_flags, &new_vma_flags)) {
   711			*pprev = vma;
   712			return 0;
   713		}
   714	
   715		/*
   716		 * Do PROT_NONE PFN permission checks here when we can still
   717		 * bail out without undoing a lot of state. This is a rather
   718		 * uncommon case, so doesn't need to be very optimized.
   719		 */
   720		if (arch_has_pfn_modify_check() &&
   721		    vma_flags_test_any(&old_vma_flags, VMA_PFNMAP_BIT,
   722				       VMA_MIXEDMAP_BIT) &&
   723		    !vma_flags_test_any_mask(&new_vma_flags, VMA_ACCESS_FLAGS)) {
   724			pgprot_t new_pgprot = vm_get_page_prot(newflags);
   725	
   726			error = walk_page_range(current->mm, start, end,
   727					&prot_none_walk_ops, &new_pgprot);
   728			if (error)
   729				return error;
   730		}
   731	
   732		/*
   733		 * If we make a private mapping writable we increase our commit;
   734		 * but (without finer accounting) cannot reduce our commit if we
   735		 * make it unwritable again except in the anonymous case where no
   736		 * anon_vma has yet to be assigned.
   737		 *
   738		 * hugetlb mapping were accounted for even if read-only so there is
   739		 * no need to account for them here.
   740		 */
   741		if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
   742			/* Check space limits when area turns into data. */
   743			if (!may_expand_vm(mm, &new_vma_flags, nrpages) &&
   744			    may_expand_vm(mm, &old_vma_flags, nrpages))
   745				return -ENOMEM;
   746			if (!vma_flags_test_any(&old_vma_flags,
   747					VMA_ACCOUNT_BIT, VMA_WRITE_BIT, VMA_HUGETLB_BIT,
   748					VMA_SHARED_BIT, VMA_NORESERVE_BIT)) {
   749				charged = nrpages;
   750				if (security_vm_enough_memory_mm(mm, charged))
   751					return -ENOMEM;
   752				vma_flags_set(&new_vma_flags, VMA_ACCOUNT_BIT);
   753			}
   754		} else if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
   755			   vma_is_anonymous(vma) && !vma->anon_vma) {
   756			vma_flags_clear(&new_vma_flags, VMA_ACCOUNT_BIT);
   757		}
   758	
   759		newflags = vma_flags_to_legacy(new_vma_flags);
   760		vma = vma_modify_flags(vmi, *pprev, vma, start, end, &newflags);
   761		if (IS_ERR(vma)) {
   762			error = PTR_ERR(vma);
   763			goto fail;
   764		}
   765		new_vma_flags = legacy_to_vma_flags(newflags);
   766	
   767		*pprev = vma;
   768	
   769		/*
   770		 * vm_flags and vm_page_prot are protected by the mmap_lock
   771		 * held in write mode.
   772		 */
   773		vma_start_write(vma);
   774		vm_flags_reset_once(vma, newflags);
   775		if (vma_wants_manual_pte_write_upgrade(vma))
   776			mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
   777		vma_set_page_prot(vma);
   778	
   779		change_protection(tlb, vma, start, end, mm_cp_flags);
   780	
   781		if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
   782		    !vma_flags_test(&new_vma_flags, VMA_ACCOUNT_BIT))
   783			vm_unacct_memory(nrpages);
   784	
   785		/*
   786		 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
   787		 * fault on access.
   788		 */
   789		if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
   790			const vma_flags_t mask =
   791				vma_flags_and(&old_vma_flags, VMA_WRITE_BIT,
   792					      VMA_SHARED_BIT, VMA_LOCKED_BIT);
   793	
   794			if (vma_flags_same(&mask, VMA_LOCKED_BIT))
   795				populate_vma_page_range(vma, start, end, NULL);
   796		}
   797	
   798		vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
   799		vm_stat_account(mm, newflags, nrpages);
   800		perf_event_mmap(vma);
   801		return 0;
   802	
   803	fail:
   804		vm_unacct_memory(charged);
   805		return error;
   806	}
   807	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
