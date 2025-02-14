Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB7228CB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523588; cv=none; b=AazjEeHasGVwyHLq07bj/Dlrv7rNR59BSqgp/UaXn77UAbtlSYwDRIb9JoQ1vJybRm+Wba+m0ZBvKwTXnwG3qCUdtXgX8Qgtvh+i0HaeWGHla1DmRPz+IZL15WvW2xLB7Raj8fKN0oLE3XKAJ8aQNQdDU3RBikdqyqexu6cY0K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523588; c=relaxed/simple;
	bh=xfHrQgVrFncICpHdVMTMZ4fffqIq3eEdg2sIyEe0Jyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WdN6AtJPzj/0zhOJZQfZdRATtgX0LXLsRUTpOZzatp4eL09uAt2GZDifqU0AkuK86y80bVg+CoaQf5B+jTj4BnjPIXBCELviINJOEYSweH3InWpP/bz9Yru9V45jyXg+bvlsZdZNJycj/hAb2tMKUqwH7tCNzqTlYZJ7AELcW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFwZ5C3U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFwZ5C3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739523588; x=1771059588;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xfHrQgVrFncICpHdVMTMZ4fffqIq3eEdg2sIyEe0Jyg=;
  b=NFwZ5C3UBbUu68xBeYhaXPa0nUCLj+R2jDtu28qasM4l3L+bo4DRTbep
   OZk3+4w92HuVjQK1lJ8SZTuYZr6s0bDxNtqfz/WRbZ7rjA3dE5LiHznPx
   s+dcHku/PVT8iP7UQlq5PT8ixXk6FKiAafn7VvSEW2Z+0Pc03HsvNDa/V
   2SUyU0fslsG6kJDEQ1nuw239E3v2CnTvlrybjFwvt3qCi0TQvdsTOhCM1
   Vq9Cpo3sXp4jMfpb0OEIvJvLOquShJ2C1jRkaqJKCOmkeLsOBHxT297dM
   1rOfG+wCRLPjnzUAkcxCT7KjmzkBQucUmwZi/0Lz6eCMxXMNFxfNXzYCv
   w==;
X-CSE-ConnectionGUID: iWNhIrVpTpCJaKo9ziF6hw==
X-CSE-MsgGUID: lCy3gKlqTgO98kq8e30ERw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57672383"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="57672383"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 00:59:45 -0800
X-CSE-ConnectionGUID: ewcJKy3TT3W/Mv69cSNh9A==
X-CSE-MsgGUID: X1i2DtiLT76x3VHduNlWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144339766"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2025 00:59:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tirXx-0019IR-1d;
	Fri, 14 Feb 2025 08:59:41 +0000
Date: Fri, 14 Feb 2025 16:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/memory.c:1709:
 warning: Function parameter or member 'start_t' not described in
 'unmap_vmas'
Message-ID: <202502141650.Lp06FbOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: e9fdabfc2aeb273168e60795e68896dfdeed6fdd [249/249] FROMLIST: BACKPORT: mm: Change do_vmi_align_munmap() side tree index
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250214/202502141650.Lp06FbOT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141650.Lp06FbOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141650.Lp06FbOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:1709: warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'end_t' not described in 'unmap_vmas'


vim +1709 mm/memory.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1685  
f5cc4eef9987d0 Al Viro         2012-03-05  1686  /**
f5cc4eef9987d0 Al Viro         2012-03-05  1687   * unmap_vmas - unmap a range of memory covered by a list of vma's
f5cc4eef9987d0 Al Viro         2012-03-05  1688   * @tlb: address of the caller's struct mmu_gather
763ecb035029f5 Liam R. Howlett 2022-09-06  1689   * @mt: the maple tree
f5cc4eef9987d0 Al Viro         2012-03-05  1690   * @vma: the starting vma
f5cc4eef9987d0 Al Viro         2012-03-05  1691   * @start_addr: virtual address at which to start unmapping
f5cc4eef9987d0 Al Viro         2012-03-05  1692   * @end_addr: virtual address at which to end unmapping
f5cc4eef9987d0 Al Viro         2012-03-05  1693   *
f5cc4eef9987d0 Al Viro         2012-03-05  1694   * Unmap all pages in the vma list.
f5cc4eef9987d0 Al Viro         2012-03-05  1695   *
f5cc4eef9987d0 Al Viro         2012-03-05  1696   * Only addresses between `start' and `end' will be unmapped.
f5cc4eef9987d0 Al Viro         2012-03-05  1697   *
f5cc4eef9987d0 Al Viro         2012-03-05  1698   * The VMA list must be sorted in ascending virtual address order.
f5cc4eef9987d0 Al Viro         2012-03-05  1699   *
f5cc4eef9987d0 Al Viro         2012-03-05  1700   * unmap_vmas() assumes that the caller will flush the whole unmapped address
f5cc4eef9987d0 Al Viro         2012-03-05  1701   * range after unmap_vmas() returns.  So the only responsibility here is to
f5cc4eef9987d0 Al Viro         2012-03-05  1702   * ensure that any thus-far unmapped pages are flushed before unmap_vmas()
f5cc4eef9987d0 Al Viro         2012-03-05  1703   * drops the lock and schedules.
f5cc4eef9987d0 Al Viro         2012-03-05  1704   */
763ecb035029f5 Liam R. Howlett 2022-09-06  1705  void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
f5cc4eef9987d0 Al Viro         2012-03-05  1706  		struct vm_area_struct *vma, unsigned long start_addr,
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1707  		unsigned long end_addr, unsigned long start_t,
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1708  		unsigned long end_t)
f5cc4eef9987d0 Al Viro         2012-03-05 @1709  {
ac46d4f3c43241 Jérôme Glisse   2018-12-28  1710  	struct mmu_notifier_range range;
999dad824c39ed Peter Xu        2022-05-12  1711  	struct zap_details details = {
04ada095dcfc4a Mike Kravetz    2022-11-14  1712  		.zap_flags = ZAP_FLAG_DROP_MARKER | ZAP_FLAG_UNMAP,
999dad824c39ed Peter Xu        2022-05-12  1713  		/* Careful - we need to zap private pages too! */
999dad824c39ed Peter Xu        2022-05-12  1714  		.even_cows = true,
999dad824c39ed Peter Xu        2022-05-12  1715  	};
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1716  	MA_STATE(mas, mt, start_t, start_t);
f5cc4eef9987d0 Al Viro         2012-03-05  1717  
6f4f13e8d9e27c Jérôme Glisse   2019-05-13  1718  	mmu_notifier_range_init(&range, MMU_NOTIFY_UNMAP, 0, vma, vma->vm_mm,
6f4f13e8d9e27c Jérôme Glisse   2019-05-13  1719  				start_addr, end_addr);
ac46d4f3c43241 Jérôme Glisse   2018-12-28  1720  	mmu_notifier_invalidate_range_start(&range);
763ecb035029f5 Liam R. Howlett 2022-09-06  1721  	do {
999dad824c39ed Peter Xu        2022-05-12  1722  		unmap_single_vma(tlb, vma, start_addr, end_addr, &details);
e9fdabfc2aeb27 Liam R. Howlett 2023-04-28  1723  	} while ((vma = mas_find(&mas, end_t - 1)) != NULL);
ac46d4f3c43241 Jérôme Glisse   2018-12-28  1724  	mmu_notifier_invalidate_range_end(&range);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1725  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1726  

:::::: The code at line 1709 was first introduced by commit
:::::: f5cc4eef9987d0b517364d01e290d6438e47ee5d VM: make zap_page_range() callers that act on a single VMA use separate helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
