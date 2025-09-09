Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554DE2D3ED9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411625; cv=none; b=n0RqoS5Sl4atJVwQPGXYOWV7PYhoF3v23Ggb2n9BOnKjbOZ/R6pAsN0xRAaFHG53+Nw+hPV0YsXPGrWzUehv/AqzU+43UUnYT4IWiBMZPUUvbCi7BHS3u4/VjkXVcgJIybkrn+f/q4gQwSMu6LNs+W8Hq/7BAWrjVtjtG3UB42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411625; c=relaxed/simple;
	bh=JLw5nVHCfXu/IpaRCk6H6wltSfFkoAYXKz9OLO9aVFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIf4qzQzkwn+41hsPerf4V+UqMFbbaouuz93h65UFuUliasU9Qk8tulzZSyT8ainH8P1FP4emlL2rO+up8P+lqU7KFqu+KslyARi1y9iFPRO5g1wG+3ad6DIwmHjFeuAeFAHPhKihi9riR+w+3W7SUfQ74ioQK11JlZwmmUBpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JA3PhWmw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA3PhWmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757411623; x=1788947623;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JLw5nVHCfXu/IpaRCk6H6wltSfFkoAYXKz9OLO9aVFs=;
  b=JA3PhWmwBmYxvUrECLJa+7hOwLPxtM2p3bdt7pNxxPD+oEEPTiiuVh+s
   sKcxUG5F0fWpf+osZolLbUwsAXVQPvtw/AlM9RYwYl4RxM4eT1TNGhKwM
   Q65iLyiWQkaWbtmZ4ufSu//w9NEIaRIeq2M7IG9aLcB9Boz1r2x92L2nJ
   brYAIyvKCEayo/tqwI138THSvh4sj+kANV/OTWXEMUzbtxHPDSn2t2Mfv
   2chfQaPsNoHxO0QDBo9/BJUUslmc2RwlYTxddfzS9M/Im6Ejx77+qejbu
   /u/L8XdvRqU1NHL+5/6PCrHCign83IF6LqE7titFB/soahwo1M6LpjHfS
   g==;
X-CSE-ConnectionGUID: StN9HMNWTzWbRnT5entlgQ==
X-CSE-MsgGUID: zeOT8cSTTvKJSUY8MOghAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59625789"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59625789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:53:42 -0700
X-CSE-ConnectionGUID: puKGAdopT1mrfOKGlCFpUw==
X-CSE-MsgGUID: bKDCOw+IQCSrVaUA9jTANA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2025 02:53:41 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvv2h-0004ix-1N;
	Tue, 09 Sep 2025 09:53:39 +0000
Date: Tue, 9 Sep 2025 17:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/3] mm/memory.c:1709: warning:
 Function parameter or member 'mm_wr_locked' not described in 'unmap_vmas'
Message-ID: <202509091752.37b87NI4-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c
commit: 2ff3b23c7fde9ad4a23158d219b9e9a5a0e90982 [0/3] UPSTREAM: mm: introduce __vm_flags_mod and use it in untrack_pfn
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250909/202509091752.37b87NI4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091752.37b87NI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091752.37b87NI4-lkp@intel.com/

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
