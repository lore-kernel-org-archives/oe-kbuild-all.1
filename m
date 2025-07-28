Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C211482E7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753678915; cv=none; b=NKXelVOCmlbONFXW/BwxcxRpyfLm5YRQr6eDJlwdxpUUTjeB8C6ROqFmdRe7rpTWn6I6oLqhgj0lPZb/cNEAncfaJQEb0kYY/MNVY57bSEKCrHKPavrx741RLIhi17AVs6qJEjQdwt+9H94IFK637+hbbO5JVgVihZeVFEbsILQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753678915; c=relaxed/simple;
	bh=HxRpH8pHeawvUPl9lMUlmGtO4bfTumyM7N4TamXAmMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRXCvVN+eoPMdtuFaKJlv9DQCYSt7dveeNON4XQ6mS4uNmTsA9EBpeOMY0PVgmpNv/3Xru4xfnbCBPSwJsX1rTgrDTXBYRnWI5lwag12ssg4RlSi4AQnHTvMOi9Jrc7Vqb8515azXz3izjiunW0RqLzBmW7K2tI4oLQEDc8P9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFa59riU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFa59riU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753678914; x=1785214914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HxRpH8pHeawvUPl9lMUlmGtO4bfTumyM7N4TamXAmMc=;
  b=aFa59riUvLhqutrqUxa2ngx6y7dtKzwXeUohkvApfo/b1Ad5AGGD04OV
   TprFrAExLgu5dY7GlWhbGQPNCDA0GcvUunQBREHKNL0Yt52XksRqGcW+H
   PO6UQD0Y6T09CDiZmoVsnoXWiR2JdbXUDVnJEXIrMQLd0G3AqjHqwWnP2
   vz10KBp82is774K5koSrlZz6DtElKPSlpLNh1F1iFfh4kBECOZsNrpJ4P
   xiWI2N4R2vkgzIljs1YNNIhd5o/a/EdOeb9WqxOBvT8eErzPzMsGo4KQi
   ZG4J1GkJ9taA3f/TALIjLvLZnrv+KKjzAIQeaIgkluRROK3Pw3qatdnnR
   w==;
X-CSE-ConnectionGUID: jq4snX8tTJeVGHka2KFk5Q==
X-CSE-MsgGUID: rNqibu9fT+amrI2X15yECQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="73369622"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73369622"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 22:01:54 -0700
X-CSE-ConnectionGUID: +het22chT1K12unEsLm+aw==
X-CSE-MsgGUID: B/nJ+5DPRnWr+aDlNb4OmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="199456862"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 27 Jul 2025 22:01:52 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugFzi-0000UR-0Y;
	Mon, 28 Jul 2025 05:01:50 +0000
Date: Mon, 28 Jul 2025 07:01:15 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] mm/memory.c:1718: warning: Function
 parameter or member 'details' not described in 'zap_page_range'
Message-ID: <202507280748.Q4H9dLLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Qi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 41aa13e68be21943e440b9f8df819ce65301fd26 [92/92] bytedance: add details parameter for zap_page_range()
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507280748.Q4H9dLLn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280748.Q4H9dLLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280748.Q4H9dLLn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:1718: warning: Function parameter or member 'details' not described in 'zap_page_range'


vim +1718 mm/memory.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1707  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1708  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  1709   * zap_page_range - remove user pages in a given range
^1da177e4c3f41 Linus Torvalds 2005-04-16  1710   * @vma: vm_area_struct holding the applicable pages
eb4546bbbdb160 Randy Dunlap   2012-06-20  1711   * @start: starting address of pages to zap
^1da177e4c3f41 Linus Torvalds 2005-04-16  1712   * @size: number of bytes to zap
f5cc4eef9987d0 Al Viro        2012-03-05  1713   *
f5cc4eef9987d0 Al Viro        2012-03-05  1714   * Caller must protect the VMA list
^1da177e4c3f41 Linus Torvalds 2005-04-16  1715   */
7e027b14d53e97 Linus Torvalds 2012-05-06  1716  void zap_page_range(struct vm_area_struct *vma, unsigned long start,
41aa13e68be219 Qi Zheng       2025-04-01  1717  		unsigned long size, struct zap_details *details)
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1718  {
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1719  	struct mmu_notifier_range range;
d16dfc550f5326 Peter Zijlstra 2011-05-24  1720  	struct mmu_gather tlb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1721  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1722  	lru_add_drain();
7269f999934b28 Jérôme Glisse  2019-05-13  1723  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
6f4f13e8d9e27c Jérôme Glisse  2019-05-13  1724  				start, start + size);
a72afd873089c6 Will Deacon    2021-01-27  1725  	tlb_gather_mmu(&tlb, vma->vm_mm);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1726  	update_hiwater_rss(vma->vm_mm);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1727  	mmu_notifier_invalidate_range_start(&range);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1728  	for ( ; vma && vma->vm_start < range.end; vma = vma->vm_next)
41aa13e68be219 Qi Zheng       2025-04-01  1729  		unmap_single_vma(&tlb, vma, start, range.end, details);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1730  	mmu_notifier_invalidate_range_end(&range);
ae8eba8b5d723a Will Deacon    2021-01-27  1731  	tlb_finish_mmu(&tlb);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1732  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1733  

:::::: The code at line 1718 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
