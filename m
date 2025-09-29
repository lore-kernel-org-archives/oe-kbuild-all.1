Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279316132F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759115740; cv=none; b=ptp3o1OJmWyeyi/ySSjSoDLzMKT3UxLVTkr3hCnEVkZ99iDE6Zlko4vrXA7xh3FvFxKJnkXH7MRXdhNapQE/uVnV9QmLfffh02ofK5puSHnsndGwm1dVaKG51z0qy4gYldj1ZazDLg7hJa7MLNo5NUVgUim69xWkv0ETVWn7eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759115740; c=relaxed/simple;
	bh=CMflEKXccTMoaU4d6zVaQNl6cvVYvIGlJQhQA1cF4Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvJrOLnRofOsC67Fouh5NE57BYSYUA50vL7D1kSRHUBCK6XyMyBNrFt6vjrQIJcJwEOH2kGzkErtI6dL3x4KIpfAnE8X0dPkho7Zr38DQHYAsRVMxCqjZvqIUJeopExhhVwMz9IjSytcxjKvRhb+05s43W/GVTu8tiCEH5Z5jUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbDktTRg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbDktTRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759115739; x=1790651739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CMflEKXccTMoaU4d6zVaQNl6cvVYvIGlJQhQA1cF4Fg=;
  b=HbDktTRgj7mtus3X2EDMiIbPWlj/wPbxqXT8fMcJuaG8auDN1cnQmxr8
   RJkLfpUfuFtsfjM58DlK6Tj+Ds+pUDCdtVje8tWKAKBsG2f7KWv5hqR4m
   067+2Rpp0Hn9mZyQylnXsSYSX7DPvviXFo4iTqbUfqTCXJKpaTeqXZ6Ch
   SZ6Bl7E2qPH5oSlOQc/siZDXEyAzvL09N2R27azDyV+GgwPzXjk9IIAnO
   Z8mUOfiHP4VsYQ6I0En+pwzYxqlHGDeO24PhjX1hmnhmbh+vILccw3j5B
   WCwx/ad3cKEJ4sgUk+OBgpWDsUcgA4bBHaC1v15rPNaBzv5cr2Zoh+NEl
   g==;
X-CSE-ConnectionGUID: oHvXSS3XRNyXhZcmFs4k8w==
X-CSE-MsgGUID: /hwxOjLzRlqHPASuRUMRrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72783992"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="72783992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 20:15:38 -0700
X-CSE-ConnectionGUID: NKG/MxI7QV+Kj6w5rTngXw==
X-CSE-MsgGUID: KEoD+0lZSgO0L/MLsJyCQQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO a2c9da549b7f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2025 20:15:36 -0700
Received: from kbuild by a2c9da549b7f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v34MQ-00001D-0U;
	Mon, 29 Sep 2025 03:15:34 +0000
Date: Mon, 29 Sep 2025 11:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv3 1/5] mm/rmap: Fix a mlock race condition in
 folio_referenced_one()
Message-ID: <202509291120.IEg83u7W-lkp@intel.com>
References: <20250923110310.689126-2-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923110310.689126-2-kirill@shutemov.name>

Hi Kiryl,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.17-rc7]
[also build test ERROR on linus/master]
[cannot apply to akpm-mm/mm-everything next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiryl-Shutsemau/mm-rmap-Fix-a-mlock-race-condition-in-folio_referenced_one/20250923-190546
base:   v6.17-rc7
patch link:    https://lore.kernel.org/r/20250923110310.689126-2-kirill%40shutemov.name
patch subject: [PATCHv3 1/5] mm/rmap: Fix a mlock race condition in folio_referenced_one()
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20250929/202509291120.IEg83u7W-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291120.IEg83u7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291120.IEg83u7W-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'folio_referenced_one':
>> mm/rmap.c:874:42: error: 'PVMW_PGTABLE_CROSSSED' undeclared (first use in this function)
     874 |                         if (pvmw.flags & PVMW_PGTABLE_CROSSSED)
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   mm/rmap.c:874:42: note: each undeclared identifier is reported only once for each function it appears in


vim +/PVMW_PGTABLE_CROSSSED +874 mm/rmap.c

   845	
   846	/*
   847	 * arg: folio_referenced_arg will be passed
   848	 */
   849	static bool folio_referenced_one(struct folio *folio,
   850			struct vm_area_struct *vma, unsigned long address, void *arg)
   851	{
   852		struct folio_referenced_arg *pra = arg;
   853		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
   854		int ptes = 0, referenced = 0;
   855	
   856		while (page_vma_mapped_walk(&pvmw)) {
   857			address = pvmw.address;
   858	
   859			if (vma->vm_flags & VM_LOCKED) {
   860				ptes++;
   861				pra->mapcount--;
   862	
   863				/* Only mlock fully mapped pages */
   864				if (pvmw.pte && ptes != pvmw.nr_pages)
   865					continue;
   866	
   867				/*
   868				 * All PTEs must be protected by page table lock in
   869				 * order to mlock the page.
   870				 *
   871				 * If page table boundary has been cross, current ptl
   872				 * only protect part of ptes.
   873				 */
 > 874				if (pvmw.flags & PVMW_PGTABLE_CROSSSED)
   875					continue;
   876	
   877				/* Restore the mlock which got missed */
   878				mlock_vma_folio(folio, vma);
   879				page_vma_mapped_walk_done(&pvmw);
   880				pra->vm_flags |= VM_LOCKED;
   881				return false; /* To break the loop */
   882			}
   883	
   884			/*
   885			 * Skip the non-shared swapbacked folio mapped solely by
   886			 * the exiting or OOM-reaped process. This avoids redundant
   887			 * swap-out followed by an immediate unmap.
   888			 */
   889			if ((!atomic_read(&vma->vm_mm->mm_users) ||
   890			    check_stable_address_space(vma->vm_mm)) &&
   891			    folio_test_anon(folio) && folio_test_swapbacked(folio) &&
   892			    !folio_maybe_mapped_shared(folio)) {
   893				pra->referenced = -1;
   894				page_vma_mapped_walk_done(&pvmw);
   895				return false;
   896			}
   897	
   898			if (lru_gen_enabled() && pvmw.pte) {
   899				if (lru_gen_look_around(&pvmw))
   900					referenced++;
   901			} else if (pvmw.pte) {
   902				if (ptep_clear_flush_young_notify(vma, address,
   903							pvmw.pte))
   904					referenced++;
   905			} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
   906				if (pmdp_clear_flush_young_notify(vma, address,
   907							pvmw.pmd))
   908					referenced++;
   909			} else {
   910				/* unexpected pmd-mapped folio? */
   911				WARN_ON_ONCE(1);
   912			}
   913	
   914			pra->mapcount--;
   915		}
   916	
   917		if (referenced)
   918			folio_clear_idle(folio);
   919		if (folio_test_clear_young(folio))
   920			referenced++;
   921	
   922		if (referenced) {
   923			pra->referenced++;
   924			pra->vm_flags |= vma->vm_flags & ~VM_LOCKED;
   925		}
   926	
   927		if (!pra->mapcount)
   928			return false; /* To break the loop */
   929	
   930		return true;
   931	}
   932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
