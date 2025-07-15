Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA22C1589
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 22:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617932; cv=none; b=LAV7RPs43vobaSh5tCBLLHph657d5y6yfRFBGgQMyC5PUqsEajj8aU/hg7GvIQLNmloymWYKmsu4w45CiVNbrmkQksKUhbigTg3N3FeQjH65mKo3Q4q/QH9P8ICWa0eUVAzBMoXndwn8U2z5agHIw+RSIsUuUNGtanMe8oMaY4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617932; c=relaxed/simple;
	bh=rLSbm85Z8Sjaah+4LFUysmJTz2e3m6tS6Qr9bl63kRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLx+fAvUrAoWrSr+ZExC160NXLTklk052dG2bvsv+Gbc1GRVS0xdSsB8gDqiA2xh0ejGp9mVCc8U9RyVw1VzLeR+hJaReRvvN989ifbLQm2x+D4mviuQzW7C/knE4YM1tszNFQkpE7g8sfsmLAffGLeJl7XV8gFt707Buw0BZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfEGBjV+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfEGBjV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752617930; x=1784153930;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rLSbm85Z8Sjaah+4LFUysmJTz2e3m6tS6Qr9bl63kRc=;
  b=MfEGBjV+qi0vXk8CQQ11fvujjzhadnb4D+r8qh8EnPIbHDhMHmOyM4wm
   ni0Z4RBihpZwNbUlZi9DtK9MtlQ2/FLdDeNpSIlKF4477cj4Dd86eDeSi
   sZ7StN9qdiNSbtBvrREWWZgNCCs60W2Z/kkQ3ChuehO5sRjjMxt342HmB
   RyZ1/xa6LPLedwQPUV6O6jOh5mIqGy9w2WGt5eYofL5qjMVxPStLUspAA
   SqH0WWvdNwE5rR61RvKS6gUwOK3lwjRLOaCMZ3Hvw6Uvf0xqkFSYftuDc
   uFSGhfdgJqfvoEx9PbdEZT6WxPU/eU/aquJ7Y7/epie5UFAsHbV6T+T/5
   A==;
X-CSE-ConnectionGUID: /uh64B2jR++vfpmrkGWjgg==
X-CSE-MsgGUID: cpsW6CCeRpG8/Prt7IYOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54727303"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54727303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:18:49 -0700
X-CSE-ConnectionGUID: saiM/qqSSfaBFzEAMwOXdA==
X-CSE-MsgGUID: D9LBJhJ4SxWw+WsQdpJKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="161659448"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jul 2025 15:18:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubnz3-000Bb5-1G;
	Tue, 15 Jul 2025 22:18:45 +0000
Date: Wed, 16 Jul 2025 06:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] mm/memory.c:1718: warning: Function
 parameter or member 'details' not described in 'zap_page_range'
Message-ID: <202507160651.B75pFdfp-lkp@intel.com>
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
commit: 41aa13e68be21943e440b9f8df819ce65301fd26 [0/92] bytedance: add details parameter for zap_page_range()
config: x86_64-buildonly-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160651.B75pFdfp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160651.B75pFdfp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160651.B75pFdfp-lkp@intel.com/

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
