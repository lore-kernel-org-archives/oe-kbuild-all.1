Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F82594B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 04:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311004; cv=none; b=PjFh1GEy0/GPbA6s2LQoqrvx9L8N+lLsXSHH2wrw8H9i3ip4awNoXzUizULsNCR5P6DYSUCL7VV/XvVjL4PsclRkPXb7mTDGdLaE1shb6+X112NQiGeuwH77WAG5xI+/BPryUXJ4rpF3Kb3mPrCf59PoZybvRBVb6ZL90nOgoCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311004; c=relaxed/simple;
	bh=QJYu+6YPnmSJr6Pc6/Z3kB+dfFrCRz7QMw8Hak2Yut8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pdk1ziJNeufA35JjvoHfSopfR7F1rPcDSpbcroZSfgAXDJaBtBrnSt5I0dKixFT7t8Ul9rcSO/RBfSZ6KPUGKtYmNbIDmyyuDqgSjw9mKHY3aDeJk+FJlVpvnQFT4Vbt8VL+iehCOgZcwfeuWfq+RTfZBK6MGVmuuM2Zqa7uyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heDWEFIf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heDWEFIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736311002; x=1767847002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJYu+6YPnmSJr6Pc6/Z3kB+dfFrCRz7QMw8Hak2Yut8=;
  b=heDWEFIfDhlBVN5GqQzmXC2l9gF75Yzot+GXghBcI5eIxkEhW5LrTDrE
   rvx0vNwcelMhYYDyxkPm3d7AFN/BfTdgWQZqwZPBsuDbc+iHmC2va6QAy
   6a8fE6cuBqFddIKNYqQ9AGqJrJg3YQTAy6L+4GwmaDduzc7b2qrQTchMN
   zQIA4rF8lr62DpgozusxkJPiRWe5JTEkT4LBt3lWDrem8KuV51HI46KNE
   uwuRSvZNpcOhdlZfuJAHkVPAqhmMosWhbQquczHabb6KG5qjJqEHpT7Ma
   Vp0M0puzpj9+o+FmfatuM32V++1u/twUClKEjvypilvkU/UoyI3EYgOWU
   Q==;
X-CSE-ConnectionGUID: wCr8YrTrRSG4uXWhi+7R+A==
X-CSE-MsgGUID: 4NxUpGWiQn+Gu3UD+XnQng==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47936998"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47936998"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 20:36:42 -0800
X-CSE-ConnectionGUID: Ox9bBkAGQbiUysYGmdkD9g==
X-CSE-MsgGUID: njLPJIEBRNi5XZIEj6pP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="102891005"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jan 2025 20:36:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVNo6-000FcJ-25;
	Wed, 08 Jan 2025 04:36:38 +0000
Date: Wed, 8 Jan 2025 12:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 6/6] mm/filemap.c:3673: multiple
 definition of `migrate_misplaced_folio_batch';
 kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
Message-ID: <202501081207.oyoJs5Zx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   f0ee5c0e0a10b84b9902233b72857eac2f524c48
commit: f0ee5c0e0a10b84b9902233b72857eac2f524c48 [6/6] migrate,sysfs: add pagecache promotion
config: loongarch-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081207.oyoJs5Zx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081207.oyoJs5Zx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081207.oyoJs5Zx-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: mm/filemap.o: in function `migrate_misplaced_folio_batch':
>> mm/filemap.c:3673: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/folio-compat.o: in function `migrate_misplaced_folio_batch':
   mm/folio-compat.c:97: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/swap.o: in function `migrate_misplaced_folio_batch':
   include/trace/events/pagemap.h:28: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/vmscan.o: in function `migrate_misplaced_folio_batch':
   mm/vmscan.c:1598: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/shmem.o: in function `migrate_misplaced_folio_batch':
   mm/shmem.c:4642: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/compaction.o: in function `migrate_misplaced_folio_batch':
   compaction.c:(.text+0x0): multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/debug.o: in function `migrate_misplaced_folio_batch':
   mm/debug.c:174: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/gup.o: in function `migrate_misplaced_folio_batch':
   mm/gup.c:2213: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/memory.o: in function `migrate_misplaced_folio_batch':
   mm/memory.c:1074: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/mprotect.o: in function `migrate_misplaced_folio_batch':
   include/linux/mman.h:86: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/rmap.o: in function `migrate_misplaced_folio_batch':
   mm/rmap.c:948: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/page_alloc.o: in function `migrate_misplaced_folio_batch':
   mm/page_alloc.c:1717: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/memory_hotplug.o: in function `migrate_misplaced_folio_batch':
   mm/memory_hotplug.c:1413: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/hugetlb.o: in function `migrate_misplaced_folio_batch':
   mm/hugetlb.c:2746: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/migrate.o: in function `migrate_misplaced_folio_batch':
   mm/migrate.c:947: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: mm/page_isolation.o: in function `migrate_misplaced_folio_batch':
   mm/page_isolation.c:431: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: fs/aio.o: in function `migrate_misplaced_folio_batch':
   fs/aio.c:1451: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here
   loongarch64-linux-ld: fs/hugetlbfs/inode.o: in function `migrate_misplaced_folio_batch':
   fs/hugetlbfs/inode.c:853: multiple definition of `migrate_misplaced_folio_batch'; kernel/sched/fair.o:kernel/sched/fair.c:13271: first defined here


vim +3673 mm/filemap.c

f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3602  
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3603  vm_fault_t filemap_map_pages(struct vm_fault *vmf,
bae473a423f65e4 Kirill A. Shutemov      2016-07-26  3604  			     pgoff_t start_pgoff, pgoff_t end_pgoff)
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3605  {
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3606  	struct vm_area_struct *vma = vmf->vma;
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3607  	struct file *file = vma->vm_file;
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3608  	struct address_space *mapping = file->f_mapping;
743a2753a02e805 Pankaj Raghav           2024-08-22  3609  	pgoff_t file_end, last_pgoff = start_pgoff;
9d3af4b448a119a Will Deacon             2021-01-14  3610  	unsigned long addr;
070e807c690bf9a Matthew Wilcox          2018-05-17  3611  	XA_STATE(xas, &mapping->i_pages, start_pgoff);
820b05e92bdf07d Matthew Wilcox (Oracle  2021-03-12  3612) 	struct folio *folio;
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3613  	vm_fault_t ret = 0;
ceca44991f3dd5a Kefeng Wang             2024-04-12  3614  	unsigned long rss = 0;
ceca44991f3dd5a Kefeng Wang             2024-04-12  3615  	unsigned int nr_pages = 0, mmap_miss = 0, mmap_miss_saved, folio_type;
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3616  
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3617  	rcu_read_lock();
de74976eb65151a Yin Fengwei             2023-08-02  3618  	folio = next_uptodate_folio(&xas, mapping, end_pgoff);
820b05e92bdf07d Matthew Wilcox (Oracle  2021-03-12  3619) 	if (!folio)
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3620  		goto out;
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3621  
8808ecab3afc189 Matthew Wilcox (Oracle  2023-01-16  3622) 	if (filemap_map_pmd(vmf, folio, start_pgoff)) {
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3623  		ret = VM_FAULT_NOPAGE;
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3624  		goto out;
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3625  	}
83929372f629001 Kirill A. Shutemov      2016-07-26  3626  
9d3af4b448a119a Will Deacon             2021-01-14  3627  	addr = vma->vm_start + ((start_pgoff - vma->vm_pgoff) << PAGE_SHIFT);
9d3af4b448a119a Will Deacon             2021-01-14  3628  	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, addr, &vmf->ptl);
65747aaf42b7db6 Hugh Dickins            2023-06-08  3629  	if (!vmf->pte) {
65747aaf42b7db6 Hugh Dickins            2023-06-08  3630  		folio_unlock(folio);
65747aaf42b7db6 Hugh Dickins            2023-06-08  3631  		folio_put(folio);
65747aaf42b7db6 Hugh Dickins            2023-06-08  3632  		goto out;
65747aaf42b7db6 Hugh Dickins            2023-06-08  3633  	}
ceca44991f3dd5a Kefeng Wang             2024-04-12  3634  
743a2753a02e805 Pankaj Raghav           2024-08-22  3635  	file_end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE) - 1;
743a2753a02e805 Pankaj Raghav           2024-08-22  3636  	if (end_pgoff > file_end)
743a2753a02e805 Pankaj Raghav           2024-08-22  3637  		end_pgoff = file_end;
743a2753a02e805 Pankaj Raghav           2024-08-22  3638  
ceca44991f3dd5a Kefeng Wang             2024-04-12  3639  	folio_type = mm_counter_file(folio);
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3640  	do {
de74976eb65151a Yin Fengwei             2023-08-02  3641  		unsigned long end;
7267ec008b5cd8b Kirill A. Shutemov      2016-07-26  3642  
9d3af4b448a119a Will Deacon             2021-01-14  3643  		addr += (xas.xa_index - last_pgoff) << PAGE_SHIFT;
070e807c690bf9a Matthew Wilcox          2018-05-17  3644  		vmf->pte += xas.xa_index - last_pgoff;
070e807c690bf9a Matthew Wilcox          2018-05-17  3645  		last_pgoff = xas.xa_index;
d98388cef5315d0 Minjie Du               2023-09-21  3646  		end = folio_next_index(folio) - 1;
de74976eb65151a Yin Fengwei             2023-08-02  3647  		nr_pages = min(end, end_pgoff) - xas.xa_index + 1;
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3648  
c8be03806738c86 Yin Fengwei             2023-09-14  3649  		if (!folio_test_large(folio))
c8be03806738c86 Yin Fengwei             2023-09-14  3650  			ret |= filemap_map_order0_folio(vmf,
ceca44991f3dd5a Kefeng Wang             2024-04-12  3651  					folio, addr, &rss, &mmap_miss);
c8be03806738c86 Yin Fengwei             2023-09-14  3652  		else
de74976eb65151a Yin Fengwei             2023-08-02  3653  			ret |= filemap_map_folio_range(vmf, folio,
c8be03806738c86 Yin Fengwei             2023-09-14  3654  					xas.xa_index - folio->index, addr,
ceca44991f3dd5a Kefeng Wang             2024-04-12  3655  					nr_pages, &rss, &mmap_miss);
46bdb4277f98e70 Will Deacon             2020-11-24  3656  
820b05e92bdf07d Matthew Wilcox (Oracle  2021-03-12  3657) 		folio_unlock(folio);
820b05e92bdf07d Matthew Wilcox (Oracle  2021-03-12  3658) 		folio_put(folio);
c8be03806738c86 Yin Fengwei             2023-09-14  3659  	} while ((folio = next_uptodate_folio(&xas, mapping, end_pgoff)) != NULL);
ceca44991f3dd5a Kefeng Wang             2024-04-12  3660  	add_mm_counter(vma->vm_mm, folio_type, rss);
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3661  	pte_unmap_unlock(vmf->pte, vmf->ptl);
b6273b55d88539c Takaya Saeki            2024-08-13  3662  	trace_mm_filemap_map_pages(mapping, start_pgoff, end_pgoff);
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3663  out:
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3664  	rcu_read_unlock();
c8be03806738c86 Yin Fengwei             2023-09-14  3665  
c8be03806738c86 Yin Fengwei             2023-09-14  3666  	mmap_miss_saved = READ_ONCE(file->f_ra.mmap_miss);
c8be03806738c86 Yin Fengwei             2023-09-14  3667  	if (mmap_miss >= mmap_miss_saved)
c8be03806738c86 Yin Fengwei             2023-09-14  3668  		WRITE_ONCE(file->f_ra.mmap_miss, 0);
c8be03806738c86 Yin Fengwei             2023-09-14  3669  	else
c8be03806738c86 Yin Fengwei             2023-09-14  3670  		WRITE_ONCE(file->f_ra.mmap_miss, mmap_miss_saved - mmap_miss);
c8be03806738c86 Yin Fengwei             2023-09-14  3671  
f9ce0be71d1fbb0 Kirill A. Shutemov      2020-12-19  3672  	return ret;
f1820361f83d556 Kirill A. Shutemov      2014-04-07 @3673  }
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3674  EXPORT_SYMBOL(filemap_map_pages);
f1820361f83d556 Kirill A. Shutemov      2014-04-07  3675  

:::::: The code at line 3673 was first introduced by commit
:::::: f1820361f83d556a7f0a9f629100f3825e594328 mm: implement ->map_pages for page cache

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
