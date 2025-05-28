Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC51DC997
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 04:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748407511; cv=none; b=CsQGfvqWtWpW9mqUEmjfzmxDE050t5hIviHS16/Z/IFma5brG+m2jvlgG2705boOhy0m0IFC69J/lFLJYZWVYE6Cvu0uIAdoHI5joyo9XhEH2tBQvxAoJ547bYJxLlB8KQ86gfnSgv8fDtL2uaQOlKxCMNVMSsgCIQGDP/hFAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748407511; c=relaxed/simple;
	bh=FXCuoLNhhgsllrEYqsjY/ZCCunLQDgEK825TQXkYAXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtKKveJIAhKQKvfx9G2kyIDfjN8BnVcPLTcu3cathqWvvxtMbjHWaHGwp7nYQoGSA6102ZEFR8+aimwU64fi+N2hrKzACQmZQTOEMOIaXv/Dt60rCy64GPC0oxdl0LbuyRkuX9nQRcqyMQwvNaawGhwiyKe8dKFJpya+IfkOjGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgw9gElB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgw9gElB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748407509; x=1779943509;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FXCuoLNhhgsllrEYqsjY/ZCCunLQDgEK825TQXkYAXY=;
  b=Cgw9gElBN9raKwwRX1xd99PK1xP+qNfYK7rTj5rpO7R7dlvw4Ifyj/CE
   xRvUneT4T6sFYngYvF+g9gTCwObNrTxY/kq3COC8BOLHyH561vsfapAVx
   xJDyum7fA+MfyVzd1qZPUv7fw20bTaCyQiZIebjEw352SyhBixTqwiwIk
   WdYDgSDpAcGkxMB4IVOPKK3oKxlkE9rzPSTbXqidsmxcE5B8V9S9RAtYJ
   92o3EvFNH0Hrp1QIvxik+c8W3pyYd/ohSUdpLP/MvGf2MomEN4q2DgMph
   +uPB3k6aFspMUcfSwki9qyUcbkrLTGnbfL4R5YVM75jRnbSIAyCkEI6vh
   Q==;
X-CSE-ConnectionGUID: pn1eilzGSaSeAh+bN74X6Q==
X-CSE-MsgGUID: BFNdTYdiQRK6+M7tC4s4kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38040051"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="38040051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 21:45:08 -0700
X-CSE-ConnectionGUID: SGYkssWZTqaTJf6/xDMgZA==
X-CSE-MsgGUID: UBr1P/zWTxiY7OLb7Ev5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="142939058"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 21:45:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK8f3-000VHE-23;
	Wed, 28 May 2025 04:45:05 +0000
Date: Wed, 28 May 2025 12:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/385] mm/memory.c:1709: warning:
 Function parameter or member 'mm_wr_locked' not described in 'unmap_vmas'
Message-ID: <202505281225.C6p64N0b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ed91d589b2844cb67999b23119f18a01d3c1cedc
commit: 2ff3b23c7fde9ad4a23158d219b9e9a5a0e90982 [0/385] UPSTREAM: mm: introduce __vm_flags_mod and use it in untrack_pfn
config: x86_64-buildonly-randconfig-003-20250528 (https://download.01.org/0day-ci/archive/20250528/202505281225.C6p64N0b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281225.C6p64N0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281225.C6p64N0b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c:1709: warning: Function parameter or member 'start_t' not described in 'unmap_vmas'
   mm/memory.c:1709: warning: Function parameter or member 'end_t' not described in 'unmap_vmas'
>> mm/memory.c:1709: warning: Function parameter or member 'mm_wr_locked' not described in 'unmap_vmas'


vim +1709 mm/memory.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1685  
f5cc4eef9987d0 Al Viro            2012-03-05  1686  /**
f5cc4eef9987d0 Al Viro            2012-03-05  1687   * unmap_vmas - unmap a range of memory covered by a list of vma's
f5cc4eef9987d0 Al Viro            2012-03-05  1688   * @tlb: address of the caller's struct mmu_gather
763ecb035029f5 Liam R. Howlett    2022-09-06  1689   * @mt: the maple tree
f5cc4eef9987d0 Al Viro            2012-03-05  1690   * @vma: the starting vma
f5cc4eef9987d0 Al Viro            2012-03-05  1691   * @start_addr: virtual address at which to start unmapping
f5cc4eef9987d0 Al Viro            2012-03-05  1692   * @end_addr: virtual address at which to end unmapping
f5cc4eef9987d0 Al Viro            2012-03-05  1693   *
f5cc4eef9987d0 Al Viro            2012-03-05  1694   * Unmap all pages in the vma list.
f5cc4eef9987d0 Al Viro            2012-03-05  1695   *
f5cc4eef9987d0 Al Viro            2012-03-05  1696   * Only addresses between `start' and `end' will be unmapped.
f5cc4eef9987d0 Al Viro            2012-03-05  1697   *
f5cc4eef9987d0 Al Viro            2012-03-05  1698   * The VMA list must be sorted in ascending virtual address order.
f5cc4eef9987d0 Al Viro            2012-03-05  1699   *
f5cc4eef9987d0 Al Viro            2012-03-05  1700   * unmap_vmas() assumes that the caller will flush the whole unmapped address
f5cc4eef9987d0 Al Viro            2012-03-05  1701   * range after unmap_vmas() returns.  So the only responsibility here is to
f5cc4eef9987d0 Al Viro            2012-03-05  1702   * ensure that any thus-far unmapped pages are flushed before unmap_vmas()
f5cc4eef9987d0 Al Viro            2012-03-05  1703   * drops the lock and schedules.
f5cc4eef9987d0 Al Viro            2012-03-05  1704   */
763ecb035029f5 Liam R. Howlett    2022-09-06  1705  void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
f5cc4eef9987d0 Al Viro            2012-03-05  1706  		struct vm_area_struct *vma, unsigned long start_addr,
e9fdabfc2aeb27 Liam R. Howlett    2023-04-28  1707  		unsigned long end_addr, unsigned long start_t,
2ff3b23c7fde9a Suren Baghdasaryan 2023-01-26  1708  		unsigned long end_t, bool mm_wr_locked)
f5cc4eef9987d0 Al Viro            2012-03-05 @1709  {
ac46d4f3c43241 Jérôme Glisse      2018-12-28  1710  	struct mmu_notifier_range range;
999dad824c39ed Peter Xu           2022-05-12  1711  	struct zap_details details = {
04ada095dcfc4a Mike Kravetz       2022-11-14  1712  		.zap_flags = ZAP_FLAG_DROP_MARKER | ZAP_FLAG_UNMAP,
999dad824c39ed Peter Xu           2022-05-12  1713  		/* Careful - we need to zap private pages too! */
999dad824c39ed Peter Xu           2022-05-12  1714  		.even_cows = true,
999dad824c39ed Peter Xu           2022-05-12  1715  	};
e9fdabfc2aeb27 Liam R. Howlett    2023-04-28  1716  	MA_STATE(mas, mt, start_t, start_t);
f5cc4eef9987d0 Al Viro            2012-03-05  1717  
6f4f13e8d9e27c Jérôme Glisse      2019-05-13  1718  	mmu_notifier_range_init(&range, MMU_NOTIFY_UNMAP, 0, vma, vma->vm_mm,
6f4f13e8d9e27c Jérôme Glisse      2019-05-13  1719  				start_addr, end_addr);
ac46d4f3c43241 Jérôme Glisse      2018-12-28  1720  	mmu_notifier_invalidate_range_start(&range);
763ecb035029f5 Liam R. Howlett    2022-09-06  1721  	do {
2ff3b23c7fde9a Suren Baghdasaryan 2023-01-26  1722  		unmap_single_vma(tlb, vma, start_addr, end_addr, &details,
2ff3b23c7fde9a Suren Baghdasaryan 2023-01-26  1723  				 mm_wr_locked);
e9fdabfc2aeb27 Liam R. Howlett    2023-04-28  1724  	} while ((vma = mas_find(&mas, end_t - 1)) != NULL);
ac46d4f3c43241 Jérôme Glisse      2018-12-28  1725  	mmu_notifier_invalidate_range_end(&range);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1726  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1727  

:::::: The code at line 1709 was first introduced by commit
:::::: f5cc4eef9987d0b517364d01e290d6438e47ee5d VM: make zap_page_range() callers that act on a single VMA use separate helper

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
