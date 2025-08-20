Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9281A5B8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 01:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755654207; cv=none; b=c2tTX4g748U070aKVka+311ajw6RFITDZSDbX9Qik3zB0B4VA488ppNjSBs8klEQVkcOMKtiJYbgRmaUUg+USsgXrvqxATqFsKf7/GML2AOc8nv4odd2v0wyASgA1NTss3xPzUUiLz2i+cDbbdSm4Uu4lW65x7IQiNlNjiUwy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755654207; c=relaxed/simple;
	bh=2ZwvCpp52BuHrww1FUdQsLS5fT3r7vdzbN19H7ZQ4Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T2x7gAMuNDtY6BoOrRAV1AUAki6SL4j9HKgAqIB8cYeoO58vtCm/650PS1jsaI+rzB9d1W5dHDkPQnBJ7gEgBh5Lc8+IDVacTy+Ag3dkHL4YWLlv+NykdNthIlT7vBLi0fb8FM1hTap3tzzqviLJvMKSfZTRvpOP9gb04Kpepl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXUc1pYb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXUc1pYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755654205; x=1787190205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZwvCpp52BuHrww1FUdQsLS5fT3r7vdzbN19H7ZQ4Lo=;
  b=fXUc1pYb9tYR0y2I8W9ldYzhLvmaKTX7Sjl7ZB384bk8I3EECmwGZpJ2
   ek1WsKJ5wRCMTRMrU40QBs90bthmkJLxdvVJE/WEZc45fL1jG19BCgGB5
   3oPGOhD03/a18R8s3Fzm6bKMXI8IF+E00s5RJhnCG002GH70A3Kp7TFLK
   Bo0A0WgsgAcT1P9bAWbdG1zWQERGnCSgOuD6tGl3txUmG1rlGU8JmH99N
   ogOPQ57rF9Z+Di+qZNFHLCPc5eN2Q6lOHG38pEtfU8Ku4uEDygL2GHb0f
   E3uznTBmoJvKHZfgxDV4px1KtPR5ZafCi3yYGE7nDZRk2HJ2VihM4DybW
   A==;
X-CSE-ConnectionGUID: TleeKe58TrWmI/w4ITRiww==
X-CSE-MsgGUID: ebCl02A2TFSkajv0tAYPCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57117532"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57117532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 18:43:23 -0700
X-CSE-ConnectionGUID: wzHBIEzWQTK0EO8zy/ObQA==
X-CSE-MsgGUID: 0xF/KCdfRPuCc74cGA8wVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167907946"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2025 18:43:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoXqx-000HwN-03;
	Wed, 20 Aug 2025 01:43:05 +0000
Date: Wed, 20 Aug 2025 09:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5] mm/memory.c:5355:12: warning: no
 previous prototype for 'set_zero_pte'
Message-ID: <202508200942.1vvpaAsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b43a48ace14772532b2a6adb713e13cf9168ec41
commit: 47ecaf6120a6e0db61f60e7e110dfe880bbf1d14 [5/5] anolis: mm: support filling in zero page if read fault in file hole
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250820/202508200942.1vvpaAsZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200942.1vvpaAsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508200942.1vvpaAsZ-lkp@intel.com/

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
