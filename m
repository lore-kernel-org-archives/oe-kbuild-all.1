Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DC3314B9D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767641364; cv=none; b=anmlCkfy4D20ZWbYogzLqNGJPqvbSf9t8HSluGmoQLJ6jZqugHY3cH2VVLCBpMRno8VhyGgcw9trVg55xtWzU5d0mF3RgaXSgfRFplZ2/6suSoaTlAb8YwkHNtfN8CpBW+xSk0fQwMsogWcD5bP8wUo/uhjve9q+KFAwXDHI4bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767641364; c=relaxed/simple;
	bh=wC/ctqcXPhWM3xuZHihWiZxVA6m0k/hTYmd7Y11Ratg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZeVnFlpLugXHtaW4roMK6LoWc+rhCMFdczCCU60HxxeudI6EtiD9FwpHlZCEplEG4Og6gkxS6DjsLfhesXBXbyYF4rdjB1GqOOl1Ch1Zcxmso/OEnH9DnBj78VEA1/yQFY8cx9N9dtTEPxDP5kh3MgEqxn0SpEJXeVUpeu8VJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBKl1peS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBKl1peS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767641363; x=1799177363;
  h=date:from:to:cc:subject:message-id;
  bh=wC/ctqcXPhWM3xuZHihWiZxVA6m0k/hTYmd7Y11Ratg=;
  b=nBKl1peSRF2GwpvvZ9Wzp6E6b0JEnk7LSPlUrByDp5ojdaKd4pO3Bliw
   46830D8tfiAlildMqk6VqBAFNxZSOr7+9x37JSV+ubzGZwHHqqvyXqngQ
   FhEZtzTY6KLM9STakIPl/DflfDPQ2CCUGERYgvnL2/Z+qVpwWzWxPAOi7
   oU1oMkhv2SPeNivqitYvCZDdW9RRGlRMz8gy65rubWIkdQu/GgFCHa4pb
   DTvR5FSkEzBJulUmgPTxVV8CO3Lqe5eSyPKpkOxqQJOjYOALua3s48R7R
   8FLvyd2pYhZCFYCjzQ9He+vDY6HzyLGI/gAw7SWJPauTfSXMJItmWajSV
   g==;
X-CSE-ConnectionGUID: NjrVIOpLSC6t9ESvlfQl3A==
X-CSE-MsgGUID: cDFxl/j6RYWOQ6kL9FVmlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68209277"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68209277"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 11:29:22 -0800
X-CSE-ConnectionGUID: jlRIdAVnQ+qNtj44guBGHg==
X-CSE-MsgGUID: n+snch/lQz2z6lnHgaFlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207355777"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jan 2026 11:29:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcqGU-000000001SH-20uM;
	Mon, 05 Jan 2026 19:29:18 +0000
Date: Tue, 06 Jan 2026 03:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2] mm/memory.c:5355:12:
 warning: no previous prototype for 'set_zero_pte'
Message-ID: <202601060338.pszQUoRo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f64b5635bc6da0e12f72f202d7ac1b5bb5457209
commit: 9e140b4929df571403945b797b1e898bf574619c [2/2] anolis: mm: support filling in zero page if read fault in file hole
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260106/202601060338.pszQUoRo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060338.pszQUoRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060338.pszQUoRo-lkp@intel.com/

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
