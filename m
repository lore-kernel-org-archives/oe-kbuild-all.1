Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5B1DE4EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 04:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765685266; cv=none; b=I/zk054dO+9Owouz3VTF2UfKwsB5/1dBxwZuX6PM+LIp2WaVva42AVTbSxnleGgc6qd7hKWYiazDqRJzeuns2rkWPOhUc6Quke6DbWQtjKVgS6DYb7Q0RcKhsI+rNGuDLgS6e41mgYtDzJuV6vdZD1iOPuZdtmksq1cN+6yS/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765685266; c=relaxed/simple;
	bh=k0sNsvFN/A/RjacIJgkVRwbV18wbyG+x8L7fq+7v8DE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEhMumIS7Cb+Fccuf3Ob0DyQ3pARLviGNX8NVrHyTfzCOm1yw5xE/tgY8y5SxUKQMyzSqqt0m5EmEnYlu6A8J0AvPb9X3kRtv5AESHtRxSMVhg1Gdf6A+NKmiDUtTD5x5G8LrIMBKWPG057SF2iKGBdPp/vz6jXMBP7RXizaquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nflXKXHN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nflXKXHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765685264; x=1797221264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0sNsvFN/A/RjacIJgkVRwbV18wbyG+x8L7fq+7v8DE=;
  b=nflXKXHNIKQt2fTvciQx2g3mV/Oj7q3sZ6SqRnJLDvuaJKjIqqnfuiG4
   ctd+hFqk+FKmVmYU8T6JeGCkL0xbmJbRiDiP7F3f7TVu+B2hr1mZk/DNm
   Gv8fsnbCMVPqQzcevrmtdOsiV0R2wvVqh67UhLK7xPg9Kt5cIKeNzU9PZ
   ccyzqkzUmFXpdFKeox2u+hk75OYkESeci+s307D4ElfhQM7jSFzwoujXx
   5YjPiTtrCoNQX/vNCsVzBv0cQl3VcAREdt3JrFblfwZbGNBlQya9Pc0Wo
   0/aKRKRNAIAevr/z6ymOGBRm0A62++sH6iBTJ7BVa3ObQ0sYdG4RLqOOG
   g==;
X-CSE-ConnectionGUID: D0iYeJgaQ1O2dOCK6sNS8A==
X-CSE-MsgGUID: RrjjKDUeRS23qeYd2gYrmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67701629"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67701629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:07:41 -0800
X-CSE-ConnectionGUID: I5dxURjhQEmrBOTygTEovg==
X-CSE-MsgGUID: itiZretrT6+XTLCk4TPj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202528733"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 20:07:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUdOT-000000002Go-3Wjr;
	Sun, 14 Dec 2025 04:07:37 +0000
Date: Sun, 14 Dec 2025 05:07:24 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/memory.c:5355:12: warning:
 no previous prototype for 'set_zero_pte'
Message-ID: <202512140558.mhXFbqKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 9e140b4929df571403945b797b1e898bf574619c [50/50] anolis: mm: support filling in zero page if read fault in file hole
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140558.mhXFbqKv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140558.mhXFbqKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140558.mhXFbqKv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:5355:12: warning: no previous prototype for 'set_zero_pte' [-Wmissing-prototypes]
    5355 | vm_fault_t set_zero_pte(struct vm_fault *vmf, struct folio *folio,
         |            ^~~~~~~~~~~~
--
>> mm/memory.c:5357: warning: Function parameter or member 'vmf' not described in 'set_zero_pte'
>> mm/memory.c:5357: warning: Function parameter or member 'folio' not described in 'set_zero_pte'
>> mm/memory.c:5357: warning: Function parameter or member 'page' not described in 'set_zero_pte'
   mm/memory.c:5357: warning: Function parameter or member 'nr' not described in 'set_zero_pte'
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
