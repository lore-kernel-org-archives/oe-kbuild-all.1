Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947CD1B86EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721422547; cv=none; b=NK3/TGK7vow9uKmtdiv3toco02mbhqqjfFe82l2/6jAHtDFnqhcZi+QNmej8J1sv5Jp/qugCPvITd4tCgSXNl+GfLQcxRjIwOppRFCfJy6i3W5KlE+IfypB1vFhVidwMOr7kqSWfZbCpd2S17sTWLQlhYnTivcOr0ghBEfg5yF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721422547; c=relaxed/simple;
	bh=TckQpGKKsmPUMod3xh6uMBbk7k3biWjX0Xd1POXWhZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVr7edTaFxEWrQHNXZYCwSYHcsBYM0jgkV+ENxyb9Ox7KxwEn6eHWermQmsr2GagEi/qY3T2GdyvfAZZTTG6LjIC8ZhGVjsrnv3xjQbkdhP7+a2oRxyUUXWPy384aA7SHdZWAe3Xuyqozn9jXCnEbuHnKYhYWE2+Nk5LnwN9nak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atqD1O5l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atqD1O5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721422546; x=1752958546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TckQpGKKsmPUMod3xh6uMBbk7k3biWjX0Xd1POXWhZY=;
  b=atqD1O5l1rNhZmI3do4xp1d8Tb6WPzV0jPnN7UWQ/lxGMKgRBhhSxG2k
   nV2IoypsRO6/YjIExhEFJiviQy8+en9uMa26M/0cunitYfLzBxQuHCa7+
   xPVPNr5YCuDsGtFpAoGOpXsdz7cI1kuycDK32oCZgpsSsN6WBt4EZD4I4
   94UBTSKdNCUJJ5m0do5pFF6g1uzWscayGmyGLI6n0A2oKRdiZO4HCabN0
   DlLxSHjEGlni9geRBUfHApBXJxQQgPHxlKKXmjCKM3iChDHKYH6FHefBT
   60Xxn6v3FecCGhKKCH7On6wdhUaX7TQtHtxma7OxiwgbVor2vp4TZ6Na1
   w==;
X-CSE-ConnectionGUID: cZm/XbmjSAOnBBQ2SwGfpg==
X-CSE-MsgGUID: SH4vW/bJTTG8jnBuuLkKsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18902947"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="18902947"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 13:55:45 -0700
X-CSE-ConnectionGUID: syO7QwH8R3OphMpCP/f2yg==
X-CSE-MsgGUID: 97ljSJF+RE6bVx5g0lBnew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="56361251"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jul 2024 13:55:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUudh-000iZ4-2x;
	Fri, 19 Jul 2024 20:55:41 +0000
Date: Sat, 20 Jul 2024 04:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/10] mm/pagewalk.c:739:40: error:
 passing argument 1 of 'huge_ptep_get' from incompatible pointer type
Message-ID: <202407200424.HPoLHs86-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   22d5156a61b8f9783984a24990a8a40d3993a513
commit: d80a4597b25823d1bcf9d253452fcbcbef4d5c68 [1/10] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240720/202407200424.HPoLHs86-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200424.HPoLHs86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200424.HPoLHs86-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pagewalk.c: In function 'folio_walk_start_hugetlb':
>> mm/pagewalk.c:739:40: error: passing argument 1 of 'huge_ptep_get' from incompatible pointer type [-Werror=incompatible-pointer-types]
     739 |                 pte = huge_ptep_get(vma->vm_mm, addr, ptep);
         |                                     ~~~^~~~~~~
         |                                        |
         |                                        struct mm_struct *
   In file included from arch/x86/include/asm/hugetlb.h:6,
                    from include/linux/hugetlb.h:820,
                    from mm/pagewalk.c:5:
   include/asm-generic/hugetlb.h:147:42: note: expected 'pte_t *' but argument is of type 'struct mm_struct *'
     147 | static inline pte_t huge_ptep_get(pte_t *ptep)
         |                                   ~~~~~~~^~~~
>> mm/pagewalk.c:739:23: error: too many arguments to function 'huge_ptep_get'
     739 |                 pte = huge_ptep_get(vma->vm_mm, addr, ptep);
         |                       ^~~~~~~~~~~~~
   include/asm-generic/hugetlb.h:147:21: note: declared here
     147 | static inline pte_t huge_ptep_get(pte_t *ptep)
         |                     ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/huge_ptep_get +739 mm/pagewalk.c

   723	
   724	static struct folio *folio_walk_start_hugetlb(struct vm_area_struct *vma,
   725			unsigned long addr, struct folio_walk *fw,
   726			folio_walk_flags_t flags)
   727	{
   728	#ifdef CONFIG_HUGETLB_PAGE
   729		struct hstate *h = hstate_vma(vma);
   730		unsigned long hmask = huge_page_mask(h);
   731		unsigned long sz = huge_page_size(h);
   732		struct page *page;
   733		pte_t *ptep, pte;
   734		spinlock_t *ptl;
   735	
   736		ptep = hugetlb_walk(vma, addr & hmask, sz);
   737		if (ptep) {
   738			ptl = huge_pte_lock(hstate_vma(vma), vma->vm_mm, ptep);
 > 739			pte = huge_ptep_get(vma->vm_mm, addr, ptep);
   740			if (pte_present(pte)) {
   741				page = pte_page(pte);
   742				goto found;
   743			} else if (!huge_pte_none(pte)) {
   744				swp_entry_t entry = pte_to_swp_entry(pte);
   745	
   746				if ((flags & FW_MIGRATION_ENTRIES) &&
   747				    is_migration_entry(entry)) {
   748					page = pfn_swap_entry_to_page(entry);
   749					goto found;
   750				}
   751			}
   752			spin_unlock(ptl);
   753		}
   754		hugetlb_vma_unlock_read(vma);
   755		return NULL;
   756	found:
   757		if (sz < PMD_SIZE)
   758			fw->level = FW_LEVEL_PTE;
   759		else if (sz < PUD_SIZE)
   760			fw->level = FW_LEVEL_PMD;
   761		else
   762			fw->level = FW_LEVEL_PUD;
   763		fw->ptep = ptep;
   764		fw->pte = pte;
   765		return __folio_walk_fill(fw, page, addr & (sz - 1), vma, ptl);
   766	#endif /* CONFIG_HUGETLB_PAGE */
   767		return NULL;
   768	}
   769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
