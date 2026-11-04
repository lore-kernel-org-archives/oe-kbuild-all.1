Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828094;
	b=Obft6/Smsq6fy9F3TtzZWyOElhaFdiYYd8+m92q2c6QMpEfroF2eIG0wK1Q+N0fAMweH
	 YsfHI5bPGZtGtkSIOEwNlxbUYKKTzXROKaYPAEDgkCKg6IuJOJxUyJqLUhmnwB4i2SBzB
	 cgM/G9U3RMoYEVz5ecLWyzJFfK/+rKJOE7PjZ4mpDRrBmuQaHwj+A99f9bQKZPHXUL99E
	 xCZAxXwkBTxFoaxIRmhk9nnOG96X6PnZhJXqCHKnQ5dWrMzFG5k2iomsEs7ujMgcT2leu
	 4locaSgS6noQSFUP72zA2kcJQxIH5oxTS0c2f/JL5aoDcdqIOOwqqi0Y2Vmk2YwL4mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828094;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1kqQd8hW2vj/GfmVzOp9AtV2YkGN4INd6bJAZ5oF4nA=;
	b=rBy/PCtqdC1A9v1ujqiT3tIC082a41hoOOFSub+mIeeKua7H1smv8DwByemEDB9MUP4L
	 +FX24+kZCrBsthuObG5JPVewfNZ43QHkfPuCyw9K7Dq0ePFkoQ8xpVEaKhjGWROMGX/Ys
	 oVLZ1APiygk0MR0peilxP8NCgCCP4fsc/nFxJBRnPZbCLxWS4HTqYiexOm9qyoH3wCvZA
	 QsEHA0dJDTKxZAlAAEiaxkxjDSMvDcJLtSvzWRJB9wHvaWJ1cIYjP2GEiTbpTFeUXJ7gQ
	 48/0WK72X8gVwXCFTzGd/+m1/9ZWDwPQ22LuZtckgmSRMKEtBmV3aaSzFFBr/QASBtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e89NoDNa;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8E7606A328
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 21:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8E7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e89NoDNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793828094; x=1825364094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R76iLfPq9CYNuAmSweThJNA9PXjXsEhbbGIh4p/5sSU=;
  b=e89NoDNaRhuDRvps95J38ZpUm+zbsaZOv2PHZwBYZVaXb4ddS2QOrXie
   Oej/GB1XelQbi1LZOleVIwPpYN4E0zI2RZmYb3s0vB3VKPySYh/dgn0L9
   aCmu0FPgSqx4SCj+1c3UKk9kXVxdAhJMNhXHJBlgld4kvfP+thJef0PwS
   VVilsvsylus+pUvGXa9BTxYbHwdy4+bNrahMgI9vTdiBs54C3fwYcdOzk
   27QArA79D/NR0t/SNf65M6FaundMdMwRWgfA9GZXiUddwUKCf2CJ4qQSZ
   SceEWDpLGgt9KmLeHL+Vp/im7WC141M2s7uU6AusvEIUALz7e9zT9xlrt
   g==;
X-CSE-ConnectionGUID: wiAmLtqtTxiO26IvI/66fg==
X-CSE-MsgGUID: 9nTugXThRTeFlWAEpGawVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2498608"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2498608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:34:53 -0800
X-CSE-ConnectionGUID: zPLFiXaTQqCb+AFkgmI/0g==
X-CSE-MsgGUID: i3s51CjlSI+7hjMBPRD0mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7140865"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2026 13:34:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOid7-00000000l4f-0XET;
	Wed, 04 Nov 2026 21:34:49 +0000
Date: Thu, 5 Nov 2026 05:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm/mmu_notifier: add
 MMU_NOTIFIER_RANGE_PERM_UPGRADE
Message-ID: <202611050548.ggmHuEHD-lkp@intel.com>
References: <20261029143336.390231-5-clopez@suse.de>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029143336.390231-5-clopez@suse.de>

Hi Carlos,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v7.3 next-20261030]
[cannot apply to akpm-mm/mm-everything kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-L-pez/mm-mprotect-add-MM_CP_PERM_UPGRADE/20261029-153334
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20261029143336.390231-5-clopez%40suse.de
patch subject: [RFC PATCH 2/4] mm/mmu_notifier: add MMU_NOTIFIER_RANGE_PERM_UPGRADE
config: sh-defconfig (https://download.01.org/0day-ci/archive/20261105/202611050548.ggmHuEHD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050548.ggmHuEHD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050548.ggmHuEHD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'hugetlb_change_protection':
>> mm/hugetlb.c:6509:22: warning: variable 'mn_flags' set but not used [-Wunused-but-set-variable=]
    6509 |         unsigned int mn_flags = 0;
         |                      ^~~~~~~~


vim +/mn_flags +6509 mm/hugetlb.c

  6496	
  6497	long hugetlb_change_protection(struct vm_area_struct *vma,
  6498			unsigned long address, unsigned long end,
  6499			pgprot_t newprot, unsigned long cp_flags)
  6500	{
  6501		struct mm_struct *mm = vma->vm_mm;
  6502		unsigned long start = address;
  6503		pte_t *ptep;
  6504		pte_t pte;
  6505		struct hstate *h = hstate_vma(vma);
  6506		long pages = 0, psize = huge_page_size(h);
  6507		struct mmu_notifier_range range;
  6508		unsigned long last_addr_mask;
> 6509		unsigned int mn_flags = 0;
  6510		bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
  6511		bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
  6512		bool uffd_rwp = cp_flags & MM_CP_UFFD_RWP;
  6513		bool uffd_rwp_resolve = cp_flags & MM_CP_UFFD_RWP_RESOLVE;
  6514		struct mmu_gather tlb;
  6515	
  6516		if (mm_cp_is_perm_upgrade(cp_flags))
  6517			mn_flags |= MMU_NOTIFIER_RANGE_PERM_UPGRADE;
  6518	
  6519		/*
  6520		 * In the case of shared PMDs, the area to flush could be beyond
  6521		 * start/end.  Set range.start/range.end to cover the maximum possible
  6522		 * range if PMD sharing is possible.
  6523		 */
  6524		mmu_notifier_range_init(&range, MMU_NOTIFY_PROTECTION_VMA,
  6525					mn_flags, mm, start, end);
  6526		adjust_range_if_pmd_sharing_possible(vma, &range.start, &range.end);
  6527	
  6528		BUG_ON(address >= end);
  6529		flush_cache_range(vma, range.start, range.end);
  6530		tlb_gather_mmu_vma(&tlb, vma);
  6531	
  6532		mmu_notifier_invalidate_range_start(&range);
  6533		hugetlb_vma_lock_write(vma);
  6534		i_mmap_lock_write(vma->vm_file->f_mapping);
  6535		last_addr_mask = hugetlb_mask_last_page(h);
  6536		for (; address < end; address += psize) {
  6537			softleaf_t entry;
  6538			spinlock_t *ptl;
  6539	
  6540			ptep = hugetlb_walk(vma, address, psize);
  6541			if (!ptep) {
  6542				/*
  6543				 * uffd_wp installs a pte marker on the unpopulated
  6544				 * entry; uffd_rwp does not install markers so the
  6545				 * allocation is unnecessary for it.
  6546				 */
  6547				if (!uffd_wp) {
  6548					address |= last_addr_mask;
  6549					continue;
  6550				}
  6551				/*
  6552				 * Userfaultfd wr-protect requires pgtable
  6553				 * pre-allocations to install pte markers.
  6554				 */
  6555				ptep = huge_pte_alloc(mm, vma, address, psize);
  6556				if (!ptep) {
  6557					pages = -ENOMEM;
  6558					break;
  6559				}
  6560			}
  6561			ptl = huge_pte_lock(h, mm, ptep);
  6562			if (huge_pmd_unshare(&tlb, vma, address, ptep)) {
  6563				/*
  6564				 * When uffd-wp is enabled on the vma, unshare
  6565				 * shouldn't happen at all.  Warn about it if it
  6566				 * happened due to some reason.
  6567				 */
  6568				WARN_ON_ONCE(uffd_wp || uffd_wp_resolve ||
  6569					     uffd_rwp || uffd_rwp_resolve);
  6570				pages++;
  6571				spin_unlock(ptl);
  6572				address |= last_addr_mask;
  6573				continue;
  6574			}
  6575			pte = huge_ptep_get(mm, address, ptep);
  6576			if (huge_pte_none(pte)) {
  6577				if (unlikely(uffd_wp))
  6578					/* Safe to modify directly (none->non-present). */
  6579					set_huge_pte_at(mm, address, ptep,
  6580							make_pte_marker(PTE_MARKER_UFFD_WP),
  6581							psize);
  6582				goto next;
  6583			}
  6584	
  6585			entry = softleaf_from_pte(pte);
  6586			if (unlikely(softleaf_is_hwpoison(entry))) {
  6587				/* Nothing to do. */
  6588			} else if (unlikely(softleaf_is_migration(entry))) {
  6589				struct folio *folio = softleaf_to_folio(entry);
  6590				pte_t newpte = pte;
  6591	
  6592				if (softleaf_is_migration_write(entry)) {
  6593					if (folio_test_anon(folio))
  6594						entry = make_readable_exclusive_migration_entry(
  6595									swp_offset(entry));
  6596					else
  6597						entry = make_readable_migration_entry(
  6598									swp_offset(entry));
  6599					newpte = swp_entry_to_pte(entry);
  6600					pages++;
  6601				}
  6602	
  6603				if (uffd_wp || uffd_rwp)
  6604					newpte = pte_swp_mkuffd(newpte);
  6605				else if (uffd_wp_resolve || uffd_rwp_resolve)
  6606					newpte = pte_swp_clear_uffd(newpte);
  6607				if (!pte_same(pte, newpte))
  6608					set_huge_pte_at(mm, address, ptep, newpte, psize);
  6609			} else if (unlikely(pte_is_marker(pte))) {
  6610				/*
  6611				 * Do nothing on a poison marker; page is
  6612				 * corrupted, permissions do not apply. Here
  6613				 * pte_marker_uffd_wp()==true implies !poison
  6614				 * because they're mutual exclusive.
  6615				 */
  6616				if (pte_is_uffd_wp_marker(pte) &&
  6617				    (uffd_wp_resolve || uffd_rwp_resolve))
  6618					/* Safe to modify directly (non-present->none). */
  6619					huge_pte_clear(mm, address, ptep, psize);
  6620			} else {
  6621				pte_t old_pte;
  6622				unsigned int shift = huge_page_shift(hstate_vma(vma));
  6623	
  6624				/* Already protnone with uffd bit set? Nothing to do. */
  6625				if (uffd_rwp && pte_protnone(pte) && huge_pte_uffd(pte))
  6626					goto next;
  6627	
  6628				old_pte = huge_ptep_modify_prot_start(vma, address, ptep);
  6629				pte = huge_pte_modify(old_pte, newprot);
  6630				pte = arch_make_huge_pte(pte, shift, vma->vm_flags);
  6631				if (uffd_wp || uffd_rwp)
  6632					pte = huge_pte_mkuffd(pte);
  6633				else if (uffd_wp_resolve || uffd_rwp_resolve)
  6634					pte = huge_pte_clear_uffd(pte);
  6635	
  6636				/* Preserve RWP protection across mprotect() */
  6637				if (userfaultfd_rwp(vma) && huge_pte_uffd(pte)) {
  6638					pte = huge_pte_modify(pte, PAGE_NONE);
  6639					pte = arch_make_huge_pte(pte, shift, vma->vm_flags);
  6640				}
  6641	
  6642				huge_ptep_modify_prot_commit(vma, address, ptep, old_pte, pte);
  6643				pages++;
  6644				tlb_remove_huge_tlb_entry(h, &tlb, ptep, address);
  6645			}
  6646	
  6647	next:
  6648			spin_unlock(ptl);
  6649			cond_resched();
  6650		}
  6651	
  6652		tlb_flush_mmu_tlbonly(&tlb);
  6653		huge_pmd_unshare_flush(&tlb, vma);
  6654		/*
  6655		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() we are
  6656		 * downgrading page table protection not changing it to point to a new
  6657		 * page.
  6658		 *
  6659		 * See Documentation/mm/mmu_notifier.rst
  6660		 */
  6661		i_mmap_unlock_write(vma->vm_file->f_mapping);
  6662		hugetlb_vma_unlock_write(vma);
  6663		mmu_notifier_invalidate_range_end(&range);
  6664		tlb_finish_mmu(&tlb);
  6665	
  6666		return pages > 0 ? (pages << h->order) : pages;
  6667	}
  6668	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
