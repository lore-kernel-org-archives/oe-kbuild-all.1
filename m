Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455262AD2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776511018; cv=none; b=Oo/VKTg0Yk8mIVEbFuA9lMTsFML1Ds4I7BpRjtI+5P1Vd3J8u9DwWdnkTf4R2pvzen0O3/CgqUiZMl3rudLy1k74aU+9tMJdhxWRFhTkSM70hRs0CgD84ocZ/EkCuP+UjQ/pgBCE5FuGQQuC8NLQU4k1owEn6FxWT7aig6RywNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776511018; c=relaxed/simple;
	bh=PkeBNmAFT+DbTsbeXtUwI4fqHoYCv3UZfGQaADWvbV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UnvncDT6Er4EqLbeDVaKSDbomeoyugMll1jtnqYlgD35OC431eQhJ5x0JBgcqFPdJQ4HxI54B3LIHpc1IZNtzGgSOTcy0brSw1k12Wmo2f2led+ycmTKCxQ5QC/Nv64/A/GtlroVFEx9Fpk00mWG65mkVC5jXyTJ26eQimVE8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFLWKfxY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFLWKfxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776511016; x=1808047016;
  h=date:from:to:cc:subject:message-id;
  bh=PkeBNmAFT+DbTsbeXtUwI4fqHoYCv3UZfGQaADWvbV8=;
  b=YFLWKfxYhBkeKk11wMFmOCs8NM2RPocCr/tU4S0hEvw2K82OCiHC3Hhx
   S44gBFAV1qS2m9sxkV5rQrM3m4Tj1pBhCg8Unsy+AEKLl1n3TQ079Af2g
   fjQF+MKKa5+HtP+tH4S82yTOn5bOIimA4tJQ7a5nvBZL5+utyMmJuil0E
   /cOKBe4T+I2nwLr1EeLlFdQNVbAjBl+11YJnR3rFIRNKz8yd74Fxnzvxx
   ZB5E8/LOPv959YSv09j3oCTjbGgIU4U95IH29vAjOKEgEfeABAqGkicBH
   qV61oDk2dG3UXCUrUnA+i73il7OBMHmyqnPQJ5SvwJs0urBXyAsbzTNka
   A==;
X-CSE-ConnectionGUID: 3BRdIfssRgSpJRViRG6jNw==
X-CSE-MsgGUID: hZzU08AoQdehYovmS5qIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88884800"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="88884800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 04:16:55 -0700
X-CSE-ConnectionGUID: LIv7scxJT3KZH7cTPNkX8A==
X-CSE-MsgGUID: Ke0V9+EMRei4gLtdQowjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="233012449"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2026 04:16:54 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE3fQ-000000001Bg-0Bdt;
	Sat, 18 Apr 2026 11:16:52 +0000
Date: Sat, 18 Apr 2026 19:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd/rfc-v2 3/7] mm/memory.c:6347:21: error: implicit
 declaration of function 'userfaultfd_rwp'; did you mean 'userfaultfd_wp'?
Message-ID: <202604181947.lghRuCSY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/rfc-v2
head:   8f55f0ce2de130272cb80eee2434a185922b3340
commit: a5a0f28bfc37d5fb52d9268238be0f8280ca737c [3/7] userfaultfd: add UFFDIO_REGISTER_MODE_RWP
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260418/202604181947.lghRuCSY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604181947.lghRuCSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604181947.lghRuCSY-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'handle_pte_fault':
>> mm/memory.c:6347:21: error: implicit declaration of function 'userfaultfd_rwp'; did you mean 'userfaultfd_wp'? [-Wimplicit-function-declaration]
    6347 |                 if (userfaultfd_rwp(vmf->vma))
         |                     ^~~~~~~~~~~~~~~
         |                     userfaultfd_wp


vim +6347 mm/memory.c

  6242	
  6243	/*
  6244	 * The page faults may be spurious because of the racy access to the
  6245	 * page table.  For example, a non-populated virtual page is accessed
  6246	 * on 2 CPUs simultaneously, thus the page faults are triggered on
  6247	 * both CPUs.  However, it's possible that one CPU (say CPU A) cannot
  6248	 * find the reason for the page fault if the other CPU (say CPU B) has
  6249	 * changed the page table before the PTE is checked on CPU A.  Most of
  6250	 * the time, the spurious page faults can be ignored safely.  However,
  6251	 * if the page fault is for the write access, it's possible that a
  6252	 * stale read-only TLB entry exists in the local CPU and needs to be
  6253	 * flushed on some architectures.  This is called the spurious page
  6254	 * fault fixing.
  6255	 *
  6256	 * Note: flush_tlb_fix_spurious_fault() is defined as flush_tlb_page()
  6257	 * by default and used as such on most architectures, while
  6258	 * flush_tlb_fix_spurious_fault_pmd() is defined as NOP by default and
  6259	 * used as such on most architectures.
  6260	 */
  6261	static void fix_spurious_fault(struct vm_fault *vmf,
  6262				       enum pgtable_level ptlevel)
  6263	{
  6264		/* Skip spurious TLB flush for retried page fault */
  6265		if (vmf->flags & FAULT_FLAG_TRIED)
  6266			return;
  6267		/*
  6268		 * This is needed only for protection faults but the arch code
  6269		 * is not yet telling us if this is a protection fault or not.
  6270		 * This still avoids useless tlb flushes for .text page faults
  6271		 * with threads.
  6272		 */
  6273		if (vmf->flags & FAULT_FLAG_WRITE) {
  6274			if (ptlevel == PGTABLE_LEVEL_PTE)
  6275				flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
  6276							     vmf->pte);
  6277			else
  6278				flush_tlb_fix_spurious_fault_pmd(vmf->vma, vmf->address,
  6279								 vmf->pmd);
  6280		}
  6281	}
  6282	/*
  6283	 * These routines also need to handle stuff like marking pages dirty
  6284	 * and/or accessed for architectures that don't do it in hardware (most
  6285	 * RISC architectures).  The early dirtying is also good on the i386.
  6286	 *
  6287	 * There is also a hook called "update_mmu_cache()" that architectures
  6288	 * with external mmu caches can use to update those (ie the Sparc or
  6289	 * PowerPC hashed page tables that act as extended TLBs).
  6290	 *
  6291	 * We enter with non-exclusive mmap_lock (to exclude vma changes, but allow
  6292	 * concurrent faults).
  6293	 *
  6294	 * The mmap_lock may have been released depending on flags and our return value.
  6295	 * See filemap_fault() and __folio_lock_or_retry().
  6296	 */
  6297	static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
  6298	{
  6299		pte_t entry;
  6300	
  6301		if (unlikely(pmd_none(*vmf->pmd))) {
  6302			/*
  6303			 * Leave __pte_alloc() until later: because vm_ops->fault may
  6304			 * want to allocate huge page, and if we expose page table
  6305			 * for an instant, it will be difficult to retract from
  6306			 * concurrent faults and from rmap lookups.
  6307			 */
  6308			vmf->pte = NULL;
  6309			vmf->flags &= ~FAULT_FLAG_ORIG_PTE_VALID;
  6310		} else {
  6311			pmd_t dummy_pmdval;
  6312	
  6313			/*
  6314			 * A regular pmd is established and it can't morph into a huge
  6315			 * pmd by anon khugepaged, since that takes mmap_lock in write
  6316			 * mode; but shmem or file collapse to THP could still morph
  6317			 * it into a huge pmd: just retry later if so.
  6318			 *
  6319			 * Use the maywrite version to indicate that vmf->pte may be
  6320			 * modified, but since we will use pte_same() to detect the
  6321			 * change of the !pte_none() entry, there is no need to recheck
  6322			 * the pmdval. Here we choose to pass a dummy variable instead
  6323			 * of NULL, which helps new user think about why this place is
  6324			 * special.
  6325			 */
  6326			vmf->pte = pte_offset_map_rw_nolock(vmf->vma->vm_mm, vmf->pmd,
  6327							    vmf->address, &dummy_pmdval,
  6328							    &vmf->ptl);
  6329			if (unlikely(!vmf->pte))
  6330				return 0;
  6331			vmf->orig_pte = ptep_get_lockless(vmf->pte);
  6332			vmf->flags |= FAULT_FLAG_ORIG_PTE_VALID;
  6333	
  6334			if (pte_none(vmf->orig_pte)) {
  6335				pte_unmap(vmf->pte);
  6336				vmf->pte = NULL;
  6337			}
  6338		}
  6339	
  6340		if (!vmf->pte)
  6341			return do_pte_missing(vmf);
  6342	
  6343		if (!pte_present(vmf->orig_pte))
  6344			return do_swap_page(vmf);
  6345	
  6346		if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma)) {
> 6347			if (userfaultfd_rwp(vmf->vma))
  6348				return do_uffd_rwp(vmf);
  6349			return do_numa_page(vmf);
  6350		}
  6351	
  6352		spin_lock(vmf->ptl);
  6353		entry = vmf->orig_pte;
  6354		if (unlikely(!pte_same(ptep_get(vmf->pte), entry))) {
  6355			update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
  6356			goto unlock;
  6357		}
  6358		if (vmf->flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
  6359			if (!pte_write(entry))
  6360				return do_wp_page(vmf);
  6361			else if (likely(vmf->flags & FAULT_FLAG_WRITE))
  6362				entry = pte_mkdirty(entry);
  6363		}
  6364		entry = pte_mkyoung(entry);
  6365		if (ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
  6366					vmf->flags & FAULT_FLAG_WRITE))
  6367			update_mmu_cache_range(vmf, vmf->vma, vmf->address,
  6368					vmf->pte, 1);
  6369		else
  6370			fix_spurious_fault(vmf, PGTABLE_LEVEL_PTE);
  6371	unlock:
  6372		pte_unmap_unlock(vmf->pte, vmf->ptl);
  6373		return 0;
  6374	}
  6375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
