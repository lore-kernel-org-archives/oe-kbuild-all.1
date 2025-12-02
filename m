Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCC2773F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764638923; cv=none; b=aZL7xOvINtx5V4ZsxtuEFMdni1igYapPM6UezMW0DZhfAhwhaVQaANBekdJ9yMug9x5nH8mN0njx+edMnKUleTr9UJqH4UzmrjjGDbX3fQKXrX4DB2s1lPPsSHeu1bW59xbgiM/AgKCB+6LVDb69HB9vbWl9T7S+9uJY7CVU+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764638923; c=relaxed/simple;
	bh=/5Mlr0VoAY3bi48962v3Ie4RWCXWNrAUxvVB+/RpouY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DB4hrCNKwGgnIlTbBiUbAPjlBQtU7Wn1A2+ySkzPYPxUAXGSIL5tr2xPLNflAJszw1JYMMCCFv0U0lM0h1hARaGELk5sPaMWa8ohjSg/1Nn+bL2zVQrbt3ntAPscRL/ZCLFDLAR38K1fPt3BsfrjZZHd4BBZ1WTH5wattq8E2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2VKPFcm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2VKPFcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764638921; x=1796174921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5Mlr0VoAY3bi48962v3Ie4RWCXWNrAUxvVB+/RpouY=;
  b=f2VKPFcmMbCLtmG2g8sc7zYkR3JTxZrc9T+3+d1Qkufdu2bpUOasXOHc
   oxSxXNR1U6cxxqIEuD8d4l/Wg02s8wDsRWYDGtTOBrdt8IvX1aGPMDgvP
   VtCxufk+nVY9+5Rc3pNrlTFI15aIJY3jylhK3zgAaZFsPfkVXH+iDsyAa
   RkVbOxwae9G5YCuIwc+bEgSn/to6ow2f2iIhrWhAvpvhQgEc+9lsp5vP8
   l1CSuE6e/CzJhdr+omxRmJ3BtC3Tluz6cRtT7GQg0VQ7NR81Q2o/CJDEY
   iX5qgNsEHBbZPXgMYHemXmQJpaUtlNaSapD+1CHslTsR+qAUCNAucYCMQ
   g==;
X-CSE-ConnectionGUID: fA3DUoZUR0KqtTjK1tZuNg==
X-CSE-MsgGUID: GUrfjSSyRzK3ku44l/haHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66629335"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66629335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:26:50 -0800
X-CSE-ConnectionGUID: b/n4AKaZST6hcE1b1jp9Gw==
X-CSE-MsgGUID: DI2/1p2/QKu6V06hXGhCAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194064426"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 17:26:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFAE-000000009I3-1RpI;
	Tue, 02 Dec 2025 01:26:46 +0000
Date: Tue, 2 Dec 2025 09:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/memory.c:5355:12: warning: no
 previous prototype for 'set_zero_pte'
Message-ID: <202512020950.UwszBE65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f8b46025836b24add69b8d09beae8fd836ae26e3
commit: 9e140b4929df571403945b797b1e898bf574619c [1/1] anolis: mm: support filling in zero page if read fault in file hole
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251202/202512020950.UwszBE65-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020950.UwszBE65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020950.UwszBE65-lkp@intel.com/

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
