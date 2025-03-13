Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEA4A11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 03:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741835842; cv=none; b=d0rsugC/pXBR9E5uLqPxOzihvDfvFoGkcxgDtOiQsoIP6VAc6RG1MUwA2aro8nuf3F7zaWkO/EVQuqyIyyWzdk8pYpb1Qu56FBh7LeGBpRKZTGmO463nn42f8AUqr7NwWcfA96dzeRtv3M0Q+6dFBKy+ii+XgDdPalsDT5AM4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741835842; c=relaxed/simple;
	bh=53pSc/zs4Da2Ji7RiTBltn/99bL3JyRfWRg4Rh0K2Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9LiC4N63qqIsvj5i0jyLyaMj/jpb6vv682nZBRmBd3rLxLoLWxPNyNFMTsCaZ+I/4UsntSQCHpqAwG92T2mWOAerbtLaBBqilWKHsoa2URHhOQUw+Ivsb9JxPK0qZVkIlt1sj11TGjeydKi9L6thLld6y3mmfq1hq9WiKkpZo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+eugdm1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+eugdm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741835840; x=1773371840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53pSc/zs4Da2Ji7RiTBltn/99bL3JyRfWRg4Rh0K2Ss=;
  b=T+eugdm1D06XClr10qEDoYa3l6wyXQmZwIevwKtabfaoVGc2+qR6xiD5
   EztInBsi25OgLFy+U+jIj5SJcgd6eUeE8uq0TIthjKdXK3l18thxOL9X8
   kthS0jjs6gOxPG3BkZ4ZIweIvSXy1fv2jwIWNnb3W4n1juOKrWkjwp0Kh
   3R/5eedsk3VMyFhszNlXQT39TOkZuuwuxlXsiMOTRt3EPObi+3jQGDfYd
   fqUOpQskapnwKlKQObNaDWdHxlq1FJFMuEud2fanqghleAFaERT5CRHAD
   hQjWvb1tIUdGerXRmvlT9azequnWu4Q721IGSs/F+tfc/+3TK1wh5S6iV
   g==;
X-CSE-ConnectionGUID: 2fSccdvgR2qrOYascw7cFg==
X-CSE-MsgGUID: KAajAy1SQpirNiiN+uzxgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43071231"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43071231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 20:17:19 -0700
X-CSE-ConnectionGUID: SWEBKqQxQ06GXMgL/FF2cA==
X-CSE-MsgGUID: ly9pkWG2RcWzjJMBA96/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="120875003"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Mar 2025 20:17:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsZ4N-00094q-2E;
	Thu, 13 Mar 2025 03:17:15 +0000
Date: Thu, 13 Mar 2025 11:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10324/10719] mm/huge_memory.c:3587:46: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202503131109.s7iuWfGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
commit: fb4b4b748b3a140c49115c9ad2973d56e6e1f7c5 [10324/10719] mm/huge_memory: unfreeze head folio after page cache entries are updated
config: mips-randconfig-r132-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131109.s7iuWfGq-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250313/202503131109.s7iuWfGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131109.s7iuWfGq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:3587:46: sparse: sparse: Using plain integer as NULL pointer
   mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:275:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:275:46: sparse: sparse: self-comparison always evaluates to false
   mm/huge_memory.c:2191:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
   include/linux/page-flags.h:275:46: sparse: sparse: self-comparison always evaluates to false
   mm/huge_memory.c:2229:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2353:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2493:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2690:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
   include/linux/page-flags.h:275:46: sparse: sparse: self-comparison always evaluates to false
   mm/huge_memory.c:3450:27: sparse: sparse: context imbalance in '__split_huge_page' - unexpected unlock
   include/linux/page-flags.h:275:46: sparse: sparse: self-comparison always evaluates to false
   mm/huge_memory.c: note: in included file (through include/linux/mm.h):
   include/linux/page_ref.h:291:27: sparse: sparse: context imbalance in '__split_unmapped_folio' - unexpected unlock
   mm/huge_memory.c:4112:17: sparse: sparse: context imbalance in 'split_huge_page_to_list_to_order' - different lock contexts for basic block
   mm/huge_memory.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:275:46: sparse: sparse: self-comparison always evaluates to false
   mm/huge_memory.c:4546:17: sparse: sparse: context imbalance in 'split_huge_pages_pid' - unexpected unlock

vim +3587 mm/huge_memory.c

  3518	
  3519	/*
  3520	 * It splits @folio into @new_order folios and copies the @folio metadata to
  3521	 * all the resulting folios.
  3522	 */
  3523	static void __split_folio_to_order(struct folio *folio, int old_order,
  3524			int new_order)
  3525	{
  3526		long new_nr_pages = 1 << new_order;
  3527		long nr_pages = 1 << old_order;
  3528		long i;
  3529	
  3530		/*
  3531		 * Skip the first new_nr_pages, since the new folio from them have all
  3532		 * the flags from the original folio.
  3533		 */
  3534		for (i = new_nr_pages; i < nr_pages; i += new_nr_pages) {
  3535			struct page *new_head = &folio->page + i;
  3536	
  3537			/*
  3538			 * Careful: new_folio is not a "real" folio before we cleared PageTail.
  3539			 * Don't pass it around before clear_compound_head().
  3540			 */
  3541			struct folio *new_folio = (struct folio *)new_head;
  3542	
  3543			VM_BUG_ON_PAGE(atomic_read(&new_folio->_mapcount) != -1, new_head);
  3544	
  3545			/*
  3546			 * Clone page flags before unfreezing refcount.
  3547			 *
  3548			 * After successful get_page_unless_zero() might follow flags change,
  3549			 * for example lock_page() which set PG_waiters.
  3550			 *
  3551			 * Note that for mapped sub-pages of an anonymous THP,
  3552			 * PG_anon_exclusive has been cleared in unmap_folio() and is stored in
  3553			 * the migration entry instead from where remap_page() will restore it.
  3554			 * We can still have PG_anon_exclusive set on effectively unmapped and
  3555			 * unreferenced sub-pages of an anonymous THP: we can simply drop
  3556			 * PG_anon_exclusive (-> PG_mappedtodisk) for these here.
  3557			 */
  3558			new_folio->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
  3559			new_folio->flags |= (folio->flags &
  3560					((1L << PG_referenced) |
  3561					 (1L << PG_swapbacked) |
  3562					 (1L << PG_swapcache) |
  3563					 (1L << PG_mlocked) |
  3564					 (1L << PG_uptodate) |
  3565					 (1L << PG_active) |
  3566					 (1L << PG_workingset) |
  3567					 (1L << PG_locked) |
  3568					 (1L << PG_unevictable) |
  3569	#ifdef CONFIG_ARCH_USES_PG_ARCH_2
  3570					 (1L << PG_arch_2) |
  3571	#endif
  3572	#ifdef CONFIG_ARCH_USES_PG_ARCH_3
  3573					 (1L << PG_arch_3) |
  3574	#endif
  3575					 (1L << PG_dirty) |
  3576					 LRU_GEN_MASK | LRU_REFS_MASK));
  3577	
  3578			new_folio->mapping = folio->mapping;
  3579			new_folio->index = folio->index + i;
  3580	
  3581			/*
  3582			 * page->private should not be set in tail pages. Fix up and warn once
  3583			 * if private is unexpectedly set.
  3584			 */
  3585			if (unlikely(new_folio->private)) {
  3586				VM_WARN_ON_ONCE_PAGE(true, new_head);
> 3587				new_folio->private = 0;
  3588			}
  3589	
  3590			if (folio_test_swapcache(folio))
  3591				new_folio->swap.val = folio->swap.val + i;
  3592	
  3593			/* Page flags must be visible before we make the page non-compound. */
  3594			smp_wmb();
  3595	
  3596			/*
  3597			 * Clear PageTail before unfreezing page refcount.
  3598			 *
  3599			 * After successful get_page_unless_zero() might follow put_page()
  3600			 * which needs correct compound_head().
  3601			 */
  3602			clear_compound_head(new_head);
  3603			if (new_order) {
  3604				prep_compound_page(new_head, new_order);
  3605				folio_set_large_rmappable(new_folio);
  3606			}
  3607	
  3608			if (folio_test_young(folio))
  3609				folio_set_young(new_folio);
  3610			if (folio_test_idle(folio))
  3611				folio_set_idle(new_folio);
  3612	
  3613			folio_xchg_last_cpupid(new_folio, folio_last_cpupid(folio));
  3614		}
  3615	
  3616		if (new_order)
  3617			folio_set_order(folio, new_order);
  3618		else
  3619			ClearPageCompound(&folio->page);
  3620	}
  3621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
