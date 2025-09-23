Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9A27465C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758593363; cv=none; b=FCX6Xb0Lxs4EU8jHBweVIblYyzk44fUisy0MnUE8x+88k2BqyOWUe1L3uM3/pFeKGcU2t3qG+zDI+jsAihfDlBp2WZ1Ql8CREdn3oQT5uNB53hJtke8OmvcAnZked1w30+6t5VlEh5igYTYFk//J5kSe6eelsI20OfLQwDH7oO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758593363; c=relaxed/simple;
	bh=3rqHK0q4RkiS11XXfNX4k94ntyyAHk4hRKsh98M8A+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJYIZO6o6qsBIuT6J/nh2y7XQudkz+uUXCkz0fmZHWLZJrxJz/+kJO1lqCvFBZ5HB40mSuAgx/3TrNuKBTxlfeAYYoHVWMb6f5pLl2JndGHwgf2psgVJaSnh8kqrsXO5/9wUouOV8RVMkUa7Q67Herklc2PMznHyeFjRnrYJLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ7Bfipn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ7Bfipn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758593361; x=1790129361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rqHK0q4RkiS11XXfNX4k94ntyyAHk4hRKsh98M8A+s=;
  b=kQ7BfipnvFhSV+6X+M5eI82IgWP7rTEXxB/aOcqEZuojgj53zbHHGpN9
   HYvbQZKgVqCgsdRiHvF6D60a2owjNZscgLGIGv9du8lBZEmsaD/GXQlgR
   WS90hO3vPYHZr4DYn+qfswqwHPF4s9rsCIQjcINh5jyGgcWPGHj0/4enj
   JJ2kl5KHG6Vrdv1/kMhiX307enj9xlSgeW36KqxIBi2MEWt2jT6JTQbhm
   NE1xdpwD8sQlsBbTpi/72FxBhEH916ceAbAnUgopFPm96QAzlPoJuguV0
   7GTulh2pQAn2SnKDMOuoTD8eUsBrhH9+JOYg0F9fLaXcrkwlIyDxxgGqt
   w==;
X-CSE-ConnectionGUID: H+Gk3wFnQI+HfVhWDAozIA==
X-CSE-MsgGUID: K1vj+fRGT+22Xrb0vfg2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60780556"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60780556"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 19:09:20 -0700
X-CSE-ConnectionGUID: 0SbUteFcRE2/gwYGNjXAEA==
X-CSE-MsgGUID: 6wWTjmSlRIGmuPrik2K28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="180632786"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Sep 2025 19:09:19 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0sSz-0002eh-0B;
	Tue, 23 Sep 2025 02:09:17 +0000
Date: Tue, 23 Sep 2025 10:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 123/123] mm/memory.c:5355:12: warning:
 no previous prototype for 'set_zero_pte'
Message-ID: <202509231044.nNQ1NDdB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9b3db453632000dc689f48634f7e31f84c375e37
commit: 9e140b4929df571403945b797b1e898bf574619c [123/123] anolis: mm: support filling in zero page if read fault in file hole
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250923/202509231044.nNQ1NDdB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231044.nNQ1NDdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231044.nNQ1NDdB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:5355:12: warning: no previous prototype for 'set_zero_pte' [-Wmissing-prototypes]
    5355 | vm_fault_t set_zero_pte(struct vm_fault *vmf, struct folio *folio,
         |            ^~~~~~~~~~~~
--
>> mm/memory.c:5357: warning: Function parameter or member 'vmf' not described in 'set_zero_pte'
>> mm/memory.c:5357: warning: Function parameter or member 'folio' not described in 'set_zero_pte'
>> mm/memory.c:5357: warning: Function parameter or member 'page' not described in 'set_zero_pte'
>> mm/memory.c:5357: warning: Function parameter or member 'nr' not described in 'set_zero_pte'
>> mm/memory.c:5357: warning: Function parameter or member 'addr' not described in 'set_zero_pte'


vim +/set_zero_pte +5355 mm/memory.c

  5351	
  5352	/**
  5353	 * set_zero_pte - Set zero page PTE to point to pages in a folio.
  5354	 */
> 5355	vm_fault_t set_zero_pte(struct vm_fault *vmf, struct folio *folio,
  5356			struct page *page, unsigned int nr, unsigned long addr)
> 5357	{
  5358		struct vm_area_struct *vma = vmf->vma;
  5359		struct folio *new_folio;
  5360		bool uffd_wp = vmf_orig_pte_uffd_wp(vmf);
  5361		bool write = vmf->flags & FAULT_FLAG_WRITE;
  5362		bool prefault = !in_range(vmf->address, addr, nr * PAGE_SIZE);
  5363		pte_t entry;
  5364	
  5365		flush_icache_pages(vma, page, nr);
  5366		entry = mk_pte(page, vma->vm_page_prot);
  5367	
  5368		if (prefault && arch_wants_old_prefaulted_pte())
  5369			entry = pte_mkold(entry);
  5370		else
  5371			entry = pte_sw_mkyoung(entry);
  5372	
  5373		if (write)
  5374			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
  5375		if (unlikely(uffd_wp))
  5376			entry = pte_mkuffd_wp(entry);
  5377	
  5378		/*
  5379		 * If it's zero page, vmf->ptl should be held to avoid other VMAs that share
  5380		 * the same xarray do the same page fault simultaneously, which may
  5381		 * leads to wrong semantic of MMAP_PRIVATE.
  5382		 *
  5383		 * E.g:
  5384		 *          MMAP_PRIVATE                         MMAP_SHARED
  5385		 *          do_read_fault
  5386		 *						do_shared_fault
  5387		 *	    check pagecache
  5388		 *						   alloc_page
  5389		 *						add_to_pagecache
  5390		 *					      try_to_unmap_zeropage
  5391		 *		set_pte
  5392		 *
  5393		 * In this scenario, zero page can not be unmapped.
  5394		 * If found the page cache entry here, corresponding page cache
  5395		 * has been set. Thus retry it to get the valid page cache not
  5396		 * the zero page.
  5397		 */
  5398		new_folio = filemap_get_entry(vma->vm_file->f_mapping, vmf->pgoff);
  5399	
  5400		if (new_folio) {
  5401			folio_put(new_folio);
  5402			return VM_FAULT_RETRY;
  5403		}
  5404	
  5405		entry = pte_mkspecial(entry);
  5406	
  5407		set_ptes(vma->vm_mm, addr, vmf->pte, entry, nr);
  5408	
  5409		/* no need to invalidate: a not-present page won't be cached */
  5410		update_mmu_cache_range(vmf, vma, addr, vmf->pte, nr);
  5411	
  5412		return 0;
  5413	}
  5414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
