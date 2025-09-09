Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2023D7F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404591; cv=none; b=NrEKmXzUCPfkNg6XZ6g11p4ZrCzG6+rNzI1Xgv0C2s2Om+KQjMkEOuglJOlPanq5NyVmQSfl8R01/XUxb1fdBdNQX/++uw1axAjp23q1kSVRgIrZySJXfCjcnffiri3IRfHS1uveSvKBg2ZmnzznNgYEdivmuMvkbFSnuk4Uc+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404591; c=relaxed/simple;
	bh=e/zxguoebNFfwhlj2xZE4qmfmoCgH+VqPnSHm6TMv38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0rtsTbDtg+4LWPWpbBN4rqE0XKEze/UHSY5rr+a9Fk5uS7xnrAO8O5HnBsst0Oldaq5kUYCAmsq7l5j9KSvBgaJ+PnnV3Z4HUp4eIFHY83jl5CFUkM5qothFd2gysxkagdXbVFCEXoF6bUXbCWeLpZR8u2Vq3fbX5kw5lkEuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F55cB5o4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F55cB5o4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757404590; x=1788940590;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e/zxguoebNFfwhlj2xZE4qmfmoCgH+VqPnSHm6TMv38=;
  b=F55cB5o4+pGdAEpvzhen2ZXsTJt2/jWSQBpaB++mnstQd+rxT/FNTkF4
   J3YATzzNtI+LYPRFdm12W2sFq+m+vqmSgStZT2sdJMJXRmk9rozTq5R24
   wAYFNKleI3eJ3jd4NJUkxgtiX2K61ljv2NZs2eq0isdlXZcfW5AGAySKv
   vMeG8a+xMyqXAgl5MF8haogmN9rzNlThisjmA3O9NAJyAveK4OZEhdpO1
   C5G4hpGjhryRA1ZWD2YUP6JnQoqu60/hFdF6IXXluu7lL/+cFuEH5VPhg
   L4OXIf0KDviEBpiEIjPNdrkHNUCZm/WKLTmunmL3KY/esIHR2n9MWHK9r
   A==;
X-CSE-ConnectionGUID: 9RPTtUGESx+m/h80PueNww==
X-CSE-MsgGUID: c5fZcNNbSMW90ph5FEI1sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59786513"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59786513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 00:56:29 -0700
X-CSE-ConnectionGUID: FouFGn3LS4iQaMIL1uEwEA==
X-CSE-MsgGUID: D35+eUYUTImE4sWk5oJ6YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="203792271"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Sep 2025 00:56:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvtDF-0004c9-2E;
	Tue, 09 Sep 2025 07:56:25 +0000
Date: Tue, 9 Sep 2025 15:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/3] mm/memory.c:1709: warning:
 Function parameter or member 'start_t' not described in 'unmap_vmas'
Message-ID: <202509091523.1AqvRG1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Liam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c
commit: e9fdabfc2aeb273168e60795e68896dfdeed6fdd [0/3] FROMLIST: BACKPORT: mm: Change do_vmi_align_munmap() side tree index
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250909/202509091523.1AqvRG1w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091523.1AqvRG1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091523.1AqvRG1w-lkp@intel.com/

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
