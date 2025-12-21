Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522C128816
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766302919; cv=none; b=Y8t4QE1rJMJKSavBbeHdFXVzVpJH+1CmkXTtygv/vGdAAHo6MYxOMOWaSwLf9q+yVo2y5AR1McOZE18lVOiAbGXHgdXM7G5C3vpTGH21GBA0qrnVw1rOaYaA7wzzxHudOLzY8vWUhqepG9I05SKsYqn49RBBW9Uwwwk3g3S8o3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766302919; c=relaxed/simple;
	bh=W+V0TD+jONJAYwrihi/QQdvI7RpWCF7hXiek7bcErqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8TdJb6pHq06GNrxsqVyEB+7We0WVlVCIjRYwhF5sNjzGzvJuTJDX36mzYVKQGvvMh/B1TZ4gRe27AQ2s2GtHlcCK7CisRKmFErLhjHwcV1gJ59v2qEyTHb0f7hSXVR99Vsn9XYWyWolpLOIJeRwMcGRQUy3ptnEJSwThBQdCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7lzs7+W; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7lzs7+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766302918; x=1797838918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+V0TD+jONJAYwrihi/QQdvI7RpWCF7hXiek7bcErqQ=;
  b=D7lzs7+Wl031rSX8QskgKCzTieCjaoZGMqNLaqdoqVLYMfit2jx006CT
   27GpK12jg2T3qg0tPuU3T4gVfKxoc6LNgzNdW2wY5nL40KXyRbdpC+oMX
   iUpYPkTHuiC+KXoFGc9cYOT6CnMvT0gVLDk/qRNjzvdET63ubECWT4/Cw
   FZTRDZgCbLuJvLnIOOUE7XY6CaRwbsee6HM9+qR0AYAfv42OHgzCv2IRl
   MZULNB7OCsTCKOvYVuQzk5/CXICfnQAr/Bgn0JFoS3QbHaok6ECRsbCk9
   VXXeZrrAYyfmOQZT5xdhQsG8OfgMRqNryBgaPBYiSDu81kPtFkZb2XvbC
   w==;
X-CSE-ConnectionGUID: UXSzXpI+RkuKDex/0lrCUw==
X-CSE-MsgGUID: +Le97lYdRpuDUNqBMIshpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68351107"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68351107"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 23:41:58 -0800
X-CSE-ConnectionGUID: fI18tgGWQOutf7+DsabqIQ==
X-CSE-MsgGUID: atdDBqM0QVyWyilWPVUQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203378544"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2025 23:41:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXE4f-000000004y8-3hQg;
	Sun, 21 Dec 2025 07:41:53 +0000
Date: Sun, 21 Dec 2025 08:41:04 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:hugetlb-init/v0 27/28] mm/hugetlb_vmemmap.c:802:14: error:
 implicit declaration of function 'hugetlb_bootmem_allocated'; did you mean
 'hugetlb_bootmem_alloc'?
Message-ID: <202512210834.YHPLSyhE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v0
head:   292ef08ce02ab877991020b00c1c4710ba07bcc5
commit: 280d6f20bf3968dd188012e8a061a752d88ef96f [27/28] dev: Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512210834.YHPLSyhE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210834.YHPLSyhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210834.YHPLSyhE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb_vmemmap.c: In function 'hugetlb_vmemmap_init_early':
>> mm/hugetlb_vmemmap.c:802:14: error: implicit declaration of function 'hugetlb_bootmem_allocated'; did you mean 'hugetlb_bootmem_alloc'? [-Wimplicit-function-declaration]
     802 |         if (!hugetlb_bootmem_allocated())
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              hugetlb_bootmem_alloc


vim +802 mm/hugetlb_vmemmap.c

b1222550fbf738 Frank van der Linden 2025-02-28  785  
b1222550fbf738 Frank van der Linden 2025-02-28  786  /*
b1222550fbf738 Frank van der Linden 2025-02-28  787   * Initialize memmap section for a gigantic page, HVO-style.
b1222550fbf738 Frank van der Linden 2025-02-28  788   */
b1222550fbf738 Frank van der Linden 2025-02-28  789  void __init hugetlb_vmemmap_init_early(int nid)
b1222550fbf738 Frank van der Linden 2025-02-28  790  {
b1222550fbf738 Frank van der Linden 2025-02-28  791  	unsigned long psize, paddr, section_size;
b1222550fbf738 Frank van der Linden 2025-02-28  792  	unsigned long ns, i, pnum, pfn, nr_pages;
b1222550fbf738 Frank van der Linden 2025-02-28  793  	unsigned long start, end;
b1222550fbf738 Frank van der Linden 2025-02-28  794  	struct huge_bootmem_page *m = NULL;
b1222550fbf738 Frank van der Linden 2025-02-28  795  	void *map;
b1222550fbf738 Frank van der Linden 2025-02-28  796  
b1222550fbf738 Frank van der Linden 2025-02-28  797  	/*
b1222550fbf738 Frank van der Linden 2025-02-28  798  	 * Noting to do if bootmem pages were not allocated
b1222550fbf738 Frank van der Linden 2025-02-28  799  	 * early in boot, or if HVO wasn't enabled in the
b1222550fbf738 Frank van der Linden 2025-02-28  800  	 * first place.
b1222550fbf738 Frank van der Linden 2025-02-28  801  	 */
b1222550fbf738 Frank van der Linden 2025-02-28 @802  	if (!hugetlb_bootmem_allocated())
b1222550fbf738 Frank van der Linden 2025-02-28  803  		return;
b1222550fbf738 Frank van der Linden 2025-02-28  804  
b1222550fbf738 Frank van der Linden 2025-02-28  805  	if (!READ_ONCE(vmemmap_optimize_enabled))
b1222550fbf738 Frank van der Linden 2025-02-28  806  		return;
b1222550fbf738 Frank van der Linden 2025-02-28  807  
b1222550fbf738 Frank van der Linden 2025-02-28  808  	section_size = (1UL << PA_SECTION_SHIFT);
b1222550fbf738 Frank van der Linden 2025-02-28  809  
b1222550fbf738 Frank van der Linden 2025-02-28  810  	list_for_each_entry(m, &huge_boot_pages[nid], list) {
b1222550fbf738 Frank van der Linden 2025-02-28  811  		if (!vmemmap_should_optimize_bootmem_page(m))
b1222550fbf738 Frank van der Linden 2025-02-28  812  			continue;
b1222550fbf738 Frank van der Linden 2025-02-28  813  
b1222550fbf738 Frank van der Linden 2025-02-28  814  		nr_pages = pages_per_huge_page(m->hstate);
b1222550fbf738 Frank van der Linden 2025-02-28  815  		psize = nr_pages << PAGE_SHIFT;
b1222550fbf738 Frank van der Linden 2025-02-28  816  		paddr = virt_to_phys(m);
b1222550fbf738 Frank van der Linden 2025-02-28  817  		pfn = PHYS_PFN(paddr);
b1222550fbf738 Frank van der Linden 2025-02-28  818  		map = pfn_to_page(pfn);
b1222550fbf738 Frank van der Linden 2025-02-28  819  		start = (unsigned long)map;
b1222550fbf738 Frank van der Linden 2025-02-28  820  		end = start + nr_pages * sizeof(struct page);
b1222550fbf738 Frank van der Linden 2025-02-28  821  
b1222550fbf738 Frank van der Linden 2025-02-28  822  		if (vmemmap_populate_hvo(start, end, nid,
b1222550fbf738 Frank van der Linden 2025-02-28  823  					HUGETLB_VMEMMAP_RESERVE_SIZE) < 0)
b1222550fbf738 Frank van der Linden 2025-02-28  824  			continue;
b1222550fbf738 Frank van der Linden 2025-02-28  825  
b1222550fbf738 Frank van der Linden 2025-02-28  826  		memmap_boot_pages_add(HUGETLB_VMEMMAP_RESERVE_SIZE / PAGE_SIZE);
b1222550fbf738 Frank van der Linden 2025-02-28  827  
b1222550fbf738 Frank van der Linden 2025-02-28  828  		pnum = pfn_to_section_nr(pfn);
b1222550fbf738 Frank van der Linden 2025-02-28  829  		ns = psize / section_size;
b1222550fbf738 Frank van der Linden 2025-02-28  830  
b1222550fbf738 Frank van der Linden 2025-02-28  831  		for (i = 0; i < ns; i++) {
b1222550fbf738 Frank van der Linden 2025-02-28  832  			sparse_init_early_section(nid, map, pnum,
b1222550fbf738 Frank van der Linden 2025-02-28  833  					SECTION_IS_VMEMMAP_PREINIT);
b1222550fbf738 Frank van der Linden 2025-02-28  834  			map += section_map_size();
b1222550fbf738 Frank van der Linden 2025-02-28  835  			pnum++;
b1222550fbf738 Frank van der Linden 2025-02-28  836  		}
b1222550fbf738 Frank van der Linden 2025-02-28  837  
b1222550fbf738 Frank van der Linden 2025-02-28  838  		m->flags |= HUGE_BOOTMEM_HVO;
b1222550fbf738 Frank van der Linden 2025-02-28  839  	}
b1222550fbf738 Frank van der Linden 2025-02-28  840  }
b1222550fbf738 Frank van der Linden 2025-02-28  841  

:::::: The code at line 802 was first introduced by commit
:::::: b1222550fbf73840e31a103305d03ad53b8f5a59 mm/hugetlb: do pre-HVO for bootmem allocated pages

:::::: TO: Frank van der Linden <fvdl@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
