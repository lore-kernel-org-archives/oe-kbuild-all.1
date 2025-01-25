Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448A15A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 07:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737788970; cv=none; b=fCD770jVOHGe5mttaiHwc9f6Xo+txCfPZmonEWiWwrrl5FNOlRsOPZBE8dvIfKEQcyInlaIWkYzUfvtpkI5h+IeO0o1+jRpD8uil/yUuSdsN0T/cmDpoMgVg70hq1Iy3f9Krosma6V2WF+6Fg2Fy56Xa+pWrRVYClHbNBUtk+LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737788970; c=relaxed/simple;
	bh=3Y7AIL1hIL3/DY3IdW671MkQPEZ3xNxKJfizYZnJsGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QxB33C6u6MVv3epllZwCPL6lk3g7am3pF/u6B0Oq6owemxmH13ahG9lEBVmPBTl1iA+OasT1HS5v95OO4M5O0BUC9o/pthBc4kRdD9ejbGXt5617sEc13TgfpBZpDLQaPJ/yQ3HD69XvNXKu55h6dAPMyGmzylv7dgZ/TMqj8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flAmZ4t2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flAmZ4t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737788968; x=1769324968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Y7AIL1hIL3/DY3IdW671MkQPEZ3xNxKJfizYZnJsGI=;
  b=flAmZ4t2TCU901l7lrm0kH0wrP3p8oyqJIE6ISCtpH9obdd98TCWnMxi
   xMMkxyLK8gh6GSBrf1BtGRMgIBq/n+Hz0Zc5VvpDQlniKsRA24G6qmH4C
   1Px6ZkIi943lo21nPVA1szNWK+tAZZWSnzbPS0btiFT8iUzagApkOX1Ib
   o3vvxZibJeuA0cvKjegUkgCO17vzaY1GS57DRlvubsdIheRumaZjLbvtJ
   B+WFqieCEVfm3hLw+f6oWtT6nkN5EjFppfENFnzlGwa89P13ihj1PdOJy
   w1gTHahE1Rr2YRzTF0zJKnMtLFrcJIa3Dw3WoySc2BxaFPa2yC9Oen6QB
   g==;
X-CSE-ConnectionGUID: FsTYkIr2S4+YcI9xMM8TQQ==
X-CSE-MsgGUID: eDbelly9RaGPsEf6W0Mt2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63680064"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="63680064"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 23:09:28 -0800
X-CSE-ConnectionGUID: NSqPVXStTM28+Ow0IWkrsg==
X-CSE-MsgGUID: QCIJF5z3RxCIFZxcFenozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145197956"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jan 2025 23:09:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbaIG-000dah-1E;
	Sat, 25 Jan 2025 07:09:24 +0000
Date: Sat, 25 Jan 2025 15:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 11/12] mm/memory.c:730:9: error:
 'entry' undeclared; did you mean 'dentry'?
Message-ID: <202501251431.7wXkBDcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   1693aa537b530ade1b82a54169a772386b4b7af7
commit: 838bd156d6fb55c5fd169934f349829386bc28d7 [11/12] mm/memory: detect writability in restore_exclusive_pte() through can_change_pte_writable()
config: arc-randconfig-001-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251431.7wXkBDcZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251431.7wXkBDcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251431.7wXkBDcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'restore_exclusive_pte':
>> mm/memory.c:730:9: error: 'entry' undeclared (first use in this function); did you mean 'dentry'?
     730 |         entry = pte_to_swp_entry(orig_pte);
         |         ^~~~~
         |         dentry
   mm/memory.c:730:9: note: each undeclared identifier is reported only once for each function it appears in
>> mm/memory.c:737:31: error: too few arguments to function 'pte_mkwrite'
     737 |                         pte = pte_mkwrite(pte);
         |                               ^~~~~~~~~~~
   In file included from include/asm-generic/io.h:1108,
                    from arch/arc/include/asm/io.h:229,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/arc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from mm/memory.c:42:
   include/linux/pgtable.h:839:21: note: declared here
     839 | static inline pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
         |                     ^~~~~~~~~~~


vim +730 mm/memory.c

28093f9f34cede Gerald Schaefer   2016-04-28  717  
b756a3b5e7ead8 Alistair Popple   2021-06-30  718  static void restore_exclusive_pte(struct vm_area_struct *vma,
f7fd4c350285c7 David Hildenbrand 2025-01-22  719  		struct folio *folio, struct page *page, unsigned long address,
f7fd4c350285c7 David Hildenbrand 2025-01-22  720  		pte_t *ptep, pte_t orig_pte)
b756a3b5e7ead8 Alistair Popple   2021-06-30  721  {
b756a3b5e7ead8 Alistair Popple   2021-06-30  722  	pte_t pte;
b756a3b5e7ead8 Alistair Popple   2021-06-30  723  
f7fd4c350285c7 David Hildenbrand 2025-01-22  724  	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
f7fd4c350285c7 David Hildenbrand 2025-01-22  725  
b756a3b5e7ead8 Alistair Popple   2021-06-30  726  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
c33c794828f212 Ryan Roberts      2023-06-12  727  	if (pte_swp_soft_dirty(orig_pte))
b756a3b5e7ead8 Alistair Popple   2021-06-30  728  		pte = pte_mksoft_dirty(pte);
b756a3b5e7ead8 Alistair Popple   2021-06-30  729  
c33c794828f212 Ryan Roberts      2023-06-12 @730  	entry = pte_to_swp_entry(orig_pte);
c33c794828f212 Ryan Roberts      2023-06-12  731  	if (pte_swp_uffd_wp(orig_pte))
b756a3b5e7ead8 Alistair Popple   2021-06-30  732  		pte = pte_mkuffd_wp(pte);
838bd156d6fb55 David Hildenbrand 2025-01-24  733  
838bd156d6fb55 David Hildenbrand 2025-01-24  734  	if ((vma->vm_flags & VM_WRITE) &&
838bd156d6fb55 David Hildenbrand 2025-01-24  735  	    can_change_pte_writable(vma, address, pte)) {
838bd156d6fb55 David Hildenbrand 2025-01-24  736  		if (folio_test_dirty(folio))
838bd156d6fb55 David Hildenbrand 2025-01-24 @737  			pte = pte_mkwrite(pte);
838bd156d6fb55 David Hildenbrand 2025-01-24  738  		pte = pte_mkwrite(pte, vma);
838bd156d6fb55 David Hildenbrand 2025-01-24  739  	}
b756a3b5e7ead8 Alistair Popple   2021-06-30  740  
b832a354d787bf David Hildenbrand 2023-12-20  741  	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
b832a354d787bf David Hildenbrand 2023-12-20  742  					   PageAnonExclusive(page)), folio);
1eba86c096e35e Pasha Tatashin    2022-01-14  743  	set_pte_at(vma->vm_mm, address, ptep, pte);
1eba86c096e35e Pasha Tatashin    2022-01-14  744  
b756a3b5e7ead8 Alistair Popple   2021-06-30  745  	/*
b756a3b5e7ead8 Alistair Popple   2021-06-30  746  	 * No need to invalidate - it was non-present before. However
b756a3b5e7ead8 Alistair Popple   2021-06-30  747  	 * secondary CPUs may have mappings that need invalidating.
b756a3b5e7ead8 Alistair Popple   2021-06-30  748  	 */
b756a3b5e7ead8 Alistair Popple   2021-06-30  749  	update_mmu_cache(vma, address, ptep);
b756a3b5e7ead8 Alistair Popple   2021-06-30  750  }
b756a3b5e7ead8 Alistair Popple   2021-06-30  751  

:::::: The code at line 730 was first introduced by commit
:::::: c33c794828f21217f72ce6fc140e0d34e0d56bff mm: ptep_get() conversion

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
