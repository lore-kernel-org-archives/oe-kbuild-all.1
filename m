Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48151A9FB7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763832431; cv=none; b=b8vEBxJQkurWTczr2utETsoFoT5jW72Aow9oE1iYZaEZzpsPYv5EHpO+tyXxCMY6AMfu8Xncy3EE6EmJyECvq5ESOocviS0KrankHHsqJMp/dh7lIX32R15Lr2xNxiHaE2gqMk35eTChLP8eHg+rT6fFuvGkJyAXDcapK45jaUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763832431; c=relaxed/simple;
	bh=XBWE4HNE03KVKBCNjtDkAYqEL74A//3jYopyGPatw+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpm/PqiXcYzZDYOva5kKUoSqvUJIaYJU+mthzIeOhOMgkxZppe5KAm3iO9VjEgpyyKZtguWKlilIx9fDqK0rizswHPtIiM3Z9pvz7Of8CEe3b8OgA8GyFNiv9NB2WmsXGNBkzbzQ5sRb/x37DwzpEeItz3SahViWBBEGcsumr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbA4/8+E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbA4/8+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763832430; x=1795368430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBWE4HNE03KVKBCNjtDkAYqEL74A//3jYopyGPatw+0=;
  b=FbA4/8+El+jZExh/Ba2XFn7s5eXqLmQ6O7IlPLFr+MaPLUr00mBaeHiy
   KpkrojtRDe0eftq1sdEm7gZBS4zdL+OszBtYZc3wUITPJNqyeTR/NnV+o
   nwXZUyd8BsoS4DNRuJx5ddxMxwgTe0TiVeghFMgS4kWa5hu6AWEmC9N4P
   drRJnlhLDyh5bI9eMsXbQdoNt1yKy3x8pIxrP1ahDiF1Y10MnjDGfc8+g
   6c7QNG5YYik5rdHBU9pNpqhHIHWKhZDnF+E/pBg/YHVpxCIkGU1q15Zyl
   rStvMM1+kVA7lJiORL/kI6mZplHaw5JBC5VZF8GGmoqT2Cp+Lx5k9Qm2q
   Q==;
X-CSE-ConnectionGUID: WQtXQAmQSjSti1bk6sBkag==
X-CSE-MsgGUID: Hzde9+02RwmDud9ZXfoYqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65927574"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65927574"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 09:27:08 -0800
X-CSE-ConnectionGUID: q9cRp+xRQjWyrT8PjbUntA==
X-CSE-MsgGUID: PaSQuxUjThmA8jAAZY0Wuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222588254"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 09:27:08 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMrO5-0007ip-0f;
	Sat, 22 Nov 2025 17:27:05 +0000
Date: Sun, 23 Nov 2025 01:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Mingrui <liumingrui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3301/3301] drivers/misc/zcopy/zcopy.c:259:5:
 warning: no previous prototype for 'attach_huge_pmd'
Message-ID: <202511230145.Q8A14oTe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   40e02117ca786975378e324ac2e14cc00b00206e
commit: 2125c55fc8765bced7091ccef19d2733a9ad9de0 [3301/3301] zcopy: Extend PMD trans hugepage mapping ability
config: arm64-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230145.Q8A14oTe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230145.Q8A14oTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230145.Q8A14oTe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/zcopy/zcopy.c:259:5: warning: no previous prototype for 'attach_huge_pmd' [-Wmissing-prototypes]
     259 | int attach_huge_pmd(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
         |     ^~~~~~~~~~~~~~~


vim +/attach_huge_pmd +259 drivers/misc/zcopy/zcopy.c

   258	
 > 259	int attach_huge_pmd(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
   260			unsigned long dst_addr, unsigned long src_addr, pmd_t *dst_pmdp, pmd_t *src_pmdp)
   261	{
   262		struct mm_struct *dst_mm, *src_mm;
   263		spinlock_t *src_ptl, *dst_ptl;
   264		struct page *src_thp_page, *orig_thp_page;
   265		pmd_t pmd, orig_pmd;
   266		pgtable_t pgtable;
   267	
   268	
   269		if (!vma_is_anonymous(dst_vma))
   270			return -EINVAL;
   271	
   272		dst_mm = dst_vma->vm_mm;
   273		src_mm = src_vma->vm_mm;
   274	
   275		/* alloc a pgtable for new pmdp */
   276		pgtable = pte_alloc_one(dst_mm);
   277		if (unlikely(!pgtable))
   278			return -ENOMEM;
   279	
   280		src_ptl = pmd_lockptr(src_mm, src_pmdp);
   281		dst_ptl = pmd_lockptr(dst_mm, dst_pmdp);
   282	
   283		spin_lock(src_ptl);
   284		pmd = *src_pmdp;
   285		src_thp_page = pmd_page(pmd);
   286		if (unlikely(!PageHead(src_thp_page))) {
   287			pr_err("VM assertion failed: it is not a head page\n");
   288			spin_unlock(src_ptl);
   289			return -EINVAL;
   290		}
   291	
   292		get_page(src_thp_page);
   293		atomic_inc(compound_mapcount_ptr(src_thp_page));
   294		spin_unlock(src_ptl);
   295	
   296		spin_lock_nested(dst_ptl, SINGLE_DEPTH_NESTING);
   297		orig_pmd = *dst_pmdp;
   298		/* umap the old page mappings */
   299		if (!pmd_none(orig_pmd)) {
   300			orig_thp_page = pmd_page(orig_pmd);
   301			put_page(orig_thp_page);
   302			atomic_dec(compound_mapcount_ptr(orig_thp_page));
   303			zcopy_add_mm_counter(dst_mm, MM_ANONPAGES, -HPAGE_PMD_NR);
   304			mm_dec_nr_ptes(dst_mm);
   305		}
   306	
   307		zcopy_add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
   308		mm_inc_nr_ptes(dst_mm);
   309		zcopy_pgtable_trans_huge_deposit(dst_mm, dst_pmdp, pgtable);
   310		zcopy_set_pmd_at(dst_mm, dst_addr, dst_pmdp, pmd);
   311		flush_tlb_range(dst_vma, dst_addr, dst_addr + HPAGE_PMD_SIZE);
   312		spin_unlock(dst_ptl);
   313	
   314		return 0;
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
