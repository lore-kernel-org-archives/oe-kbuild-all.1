Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14F28A72C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746733541; cv=none; b=gvhcF4dhd5xvY3HjYtVf7WQJgFlFCNdxH1vDCUTvtF4vL3gSHgO2DGyPqXFS5wOo4lKWiuk9CsMWlRSmZ1s8qzL1hWFWqWWn4R8xgOduX4dv+ksV4KMhBJTLC9/88N07jKGT6ctWvejt4x9i0sxAt3IDVEhcrORUDLaMF3fQpjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746733541; c=relaxed/simple;
	bh=uJ0U7bBSDnRuf96lvT5nTtOdFyLLd4uAWcqDpBFkMBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ua3XcwZlHTqcEkc1AwimL6O0BiFrykAdGQWAXWlAR+qLvx8ynq2EOdcwEHdIpUmeoPDluul4p6dQofzs9zcQQgKth7WjIq7CcRbIalGGoE2Qp4oWMgfmNXfbthboPw90JSgnL/erumlrgYozPf+LTVoOUD0krLOYVXKeAwwzwCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJ1D3p3p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJ1D3p3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746733540; x=1778269540;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uJ0U7bBSDnRuf96lvT5nTtOdFyLLd4uAWcqDpBFkMBs=;
  b=EJ1D3p3psTsnSqgHX1S+UnVsmWS6eB1rEUa2IFLo/KA940J25Ir1kFhr
   eCB3fH4TvWXVgY4J5WjJhErY0wmaxPocr/oVoD0naVsOow3oSxCWIXVGu
   HUZzAywrRPjCTEprnXQCf+UDYMEpFK6h7bBDJnfj2jNmqhk0URCaivGbd
   7bk32kMYZhoeQEwG8q6lPPN9q7/qQXtJ6XLAwKHs6u/yKGOMxKu5GyTjs
   WYQRVaTT58FASnZAIk6mxwFbWTlQLtRHu1Kjjj2tS1V9VVY9KLnZ7Ztqu
   oQCNbeMtR1Zm6fBgXKCkfgegwi/i9Gl6MO3hl5XceABGXtJeDoBxsbOAh
   Q==;
X-CSE-ConnectionGUID: 6EOMycrIRP6jl5wEdviQeA==
X-CSE-MsgGUID: EkKXWxMpRFSBENuUfg+G7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65955343"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="65955343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:45:40 -0700
X-CSE-ConnectionGUID: 5ou4VzpeTkGDzfGTJ95gIQ==
X-CSE-MsgGUID: WskvsP7VSHmGfVFsqqIDLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136403727"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 12:45:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD7BX-000BJf-36;
	Thu, 08 May 2025 19:45:35 +0000
Date: Fri, 9 May 2025 03:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] mm/memory.c:1718: warning: Function
 parameter or member 'details' not described in 'zap_page_range'
Message-ID: <202505090306.oT2DMZMX-lkp@intel.com>
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
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 41aa13e68be21943e440b9f8df819ce65301fd26 [0/1] bytedance: add details parameter for zap_page_range()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250509/202505090306.oT2DMZMX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090306.oT2DMZMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090306.oT2DMZMX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:1718: warning: Function parameter or member 'details' not described in 'zap_page_range'


vim +1718 mm/memory.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  1707  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1708  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  1709   * zap_page_range - remove user pages in a given range
^1da177e4c3f415 Linus Torvalds 2005-04-16  1710   * @vma: vm_area_struct holding the applicable pages
eb4546bbbdb160a Randy Dunlap   2012-06-20  1711   * @start: starting address of pages to zap
^1da177e4c3f415 Linus Torvalds 2005-04-16  1712   * @size: number of bytes to zap
f5cc4eef9987d0b Al Viro        2012-03-05  1713   *
f5cc4eef9987d0b Al Viro        2012-03-05  1714   * Caller must protect the VMA list
^1da177e4c3f415 Linus Torvalds 2005-04-16  1715   */
7e027b14d53e972 Linus Torvalds 2012-05-06  1716  void zap_page_range(struct vm_area_struct *vma, unsigned long start,
41aa13e68be2194 Qi Zheng       2025-04-01  1717  		unsigned long size, struct zap_details *details)
^1da177e4c3f415 Linus Torvalds 2005-04-16 @1718  {
ac46d4f3c43241f Jérôme Glisse  2018-12-28  1719  	struct mmu_notifier_range range;
d16dfc550f5326a Peter Zijlstra 2011-05-24  1720  	struct mmu_gather tlb;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1721  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1722  	lru_add_drain();
7269f999934b289 Jérôme Glisse  2019-05-13  1723  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
6f4f13e8d9e27ce Jérôme Glisse  2019-05-13  1724  				start, start + size);
a72afd873089c69 Will Deacon    2021-01-27  1725  	tlb_gather_mmu(&tlb, vma->vm_mm);
ac46d4f3c43241f Jérôme Glisse  2018-12-28  1726  	update_hiwater_rss(vma->vm_mm);
ac46d4f3c43241f Jérôme Glisse  2018-12-28  1727  	mmu_notifier_invalidate_range_start(&range);
ac46d4f3c43241f Jérôme Glisse  2018-12-28  1728  	for ( ; vma && vma->vm_start < range.end; vma = vma->vm_next)
41aa13e68be2194 Qi Zheng       2025-04-01  1729  		unmap_single_vma(&tlb, vma, start, range.end, details);
ac46d4f3c43241f Jérôme Glisse  2018-12-28  1730  	mmu_notifier_invalidate_range_end(&range);
ae8eba8b5d723a4 Will Deacon    2021-01-27  1731  	tlb_finish_mmu(&tlb);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1732  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  1733  

:::::: The code at line 1718 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
