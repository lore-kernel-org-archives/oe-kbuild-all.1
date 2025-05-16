Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339421ABDA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391133; cv=none; b=fbhJGTBOV+FDO7yOjtGBlu4wuhCSmEReTMe+uioHUF2LT18sUUPOdgNzDxFJ4+xl/OYlmb1rz2x3GQos9OZyi7tIdclqOY9fDlzMvn/xSi4F9ZQGFvEHLQ9CcYNpr44T/5sfIPMM8d70dYtMZ8Anoq3gQZIYQep/hQBx1vlxk2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391133; c=relaxed/simple;
	bh=2yC3wMvg2OhYfyDpU6OnAF/rnByHZ45Qcmq57DMTQ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dt3jjVOORR674yv1TgbYNFMgJpNeX6JKhyozQwVsDCIhxTAepIUBzQDY3fc4qbeA+ZC3bf3A7N136KC3KFPjjctPnWBIf62qfqane9EgJRcLrZfP1IS07Q8jDup4fsj8Pbb58slZYM1J4C2MnovojwwoPT+xlzf4ytQXGLnZRas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGt6ZiXC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGt6ZiXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747391131; x=1778927131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yC3wMvg2OhYfyDpU6OnAF/rnByHZ45Qcmq57DMTQ4w=;
  b=AGt6ZiXCz+/NSIHx6VaD0zxf+5A3UTG9Peb9Rogg8u2VAVXdfJhUrY8B
   +/6DKrLD8H3i7R9ZgsfiVqEqe3h/XxBLpOTBXoaDnawJx65FOl2RL16vb
   JoWEaT9aetlMlMMlND+zQfAOX1EUZ6o1RjZ/OR5g6sW78fu4CfJL3B4oT
   cQuvqGpm+Jias0HGOSHpqOHPCVgHdTvNbaMA75PcIiVfuTHm9sTU7q1r9
   95CAShJBLxdf3D8ruZh99h86PNHS3Z+E+YMlWsNUjwikp1BbsXi3BZvy6
   2nvngnv349bECtf349e01eUn5aHY8i0FaDJ6ngMDdzVRfY6fvxYE/bocm
   w==;
X-CSE-ConnectionGUID: yX+w5b1QQeK6SVXyS/7uAQ==
X-CSE-MsgGUID: hgeeYGjaQa+3uhlczmZ3VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53173798"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53173798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 03:25:30 -0700
X-CSE-ConnectionGUID: 2Kq9N5OSTUu63UJB7zMkRw==
X-CSE-MsgGUID: b4qsr+7sT2W3My9vcKBd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138569987"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2025 03:25:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFsFr-000JFD-1T;
	Fri, 16 May 2025 10:25:27 +0000
Date: Fri, 16 May 2025 18:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] mm/sparse-vmemmap.c:430:
 warning: Function parameter or member 'altmap_pages' not described in
 'vmemmap_remap_alloc'
Message-ID: <202505161817.flpBaoFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhongjiang-ali,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: 39dbfa37de5e4321e403a48914319dc98efa260b [5/5] anolis: virtio-mem: make memmap on movable memory can be offlined
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250516/202505161817.flpBaoFY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161817.flpBaoFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161817.flpBaoFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/sparse-vmemmap.c:430: warning: Function parameter or member 'altmap_pages' not described in 'vmemmap_remap_alloc'


vim +430 mm/sparse-vmemmap.c

6c90fde2568cae1 Muchun Song    2021-06-30  414  
6c90fde2568cae1 Muchun Song    2021-06-30  415  /**
6c90fde2568cae1 Muchun Song    2021-06-30  416   * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
6c90fde2568cae1 Muchun Song    2021-06-30  417   *			 to the page which is from the @vmemmap_pages
6c90fde2568cae1 Muchun Song    2021-06-30  418   *			 respectively.
6c90fde2568cae1 Muchun Song    2021-06-30  419   * @start:	start address of the vmemmap virtual address range that we want
6c90fde2568cae1 Muchun Song    2021-06-30  420   *		to remap.
6c90fde2568cae1 Muchun Song    2021-06-30  421   * @end:	end address of the vmemmap virtual address range that we want to
6c90fde2568cae1 Muchun Song    2021-06-30  422   *		remap.
6c90fde2568cae1 Muchun Song    2021-06-30  423   * @reuse:	reuse address.
6c90fde2568cae1 Muchun Song    2021-06-30  424   * @gfp_mask:	GFP flag for allocating vmemmap pages.
b41bc642bc980a7 Muchun Song    2021-06-30  425   *
b41bc642bc980a7 Muchun Song    2021-06-30  426   * Return: %0 on success, negative error code otherwise.
6c90fde2568cae1 Muchun Song    2021-06-30  427   */
6c90fde2568cae1 Muchun Song    2021-06-30  428  int vmemmap_remap_alloc(unsigned long start, unsigned long end,
39dbfa37de5e432 zhongjiang-ali 2024-04-09  429  			unsigned long reuse, gfp_t gfp_mask, struct list_head *altmap_pages)
6c90fde2568cae1 Muchun Song    2021-06-30 @430  {
6c90fde2568cae1 Muchun Song    2021-06-30  431  	LIST_HEAD(vmemmap_pages);
6c90fde2568cae1 Muchun Song    2021-06-30  432  	struct vmemmap_remap_walk walk = {
6c90fde2568cae1 Muchun Song    2021-06-30  433  		.remap_pte	= vmemmap_restore_pte,
6c90fde2568cae1 Muchun Song    2021-06-30  434  		.reuse_addr	= reuse,
6c90fde2568cae1 Muchun Song    2021-06-30  435  		.vmemmap_pages	= &vmemmap_pages,
6c90fde2568cae1 Muchun Song    2021-06-30  436  	};
6c90fde2568cae1 Muchun Song    2021-06-30  437  
6c90fde2568cae1 Muchun Song    2021-06-30  438  	/* See the comment in the vmemmap_remap_free(). */
39dbfa37de5e432 zhongjiang-ali 2024-04-09  439  	if (!virtio_is_use_memmap(reuse))
6c90fde2568cae1 Muchun Song    2021-06-30  440  		BUG_ON(start - reuse != PAGE_SIZE);
6c90fde2568cae1 Muchun Song    2021-06-30  441  
39dbfa37de5e432 zhongjiang-ali 2024-04-09  442  	if (virtio_is_use_memmap(reuse))
39dbfa37de5e432 zhongjiang-ali 2024-04-09  443  		walk.vmemmap_pages = altmap_pages;
39dbfa37de5e432 zhongjiang-ali 2024-04-09  444  
39dbfa37de5e432 zhongjiang-ali 2024-04-09  445  	if (list_empty(walk.vmemmap_pages) && alloc_vmemmap_page_list(start,
39dbfa37de5e432 zhongjiang-ali 2024-04-09  446  			end, gfp_mask, walk.vmemmap_pages))
6c90fde2568cae1 Muchun Song    2021-06-30  447  		return -ENOMEM;
6c90fde2568cae1 Muchun Song    2021-06-30  448  
b41bc642bc980a7 Muchun Song    2021-06-30  449  	mmap_read_lock(&init_mm);
39dbfa37de5e432 zhongjiang-ali 2024-04-09  450  	if (virtio_is_use_memmap(reuse))
39dbfa37de5e432 zhongjiang-ali 2024-04-09  451  		vmemmap_remap_range(start, end, &walk);
39dbfa37de5e432 zhongjiang-ali 2024-04-09  452  	else
6c90fde2568cae1 Muchun Song    2021-06-30  453  		vmemmap_remap_range(reuse, end, &walk);
b41bc642bc980a7 Muchun Song    2021-06-30  454  	mmap_read_unlock(&init_mm);
6c90fde2568cae1 Muchun Song    2021-06-30  455  
6c90fde2568cae1 Muchun Song    2021-06-30  456  	return 0;
6c90fde2568cae1 Muchun Song    2021-06-30  457  }
39dbfa37de5e432 zhongjiang-ali 2024-04-09  458  EXPORT_SYMBOL(vmemmap_remap_alloc);
9e776aa02931f7d Muchun Song    2022-04-28  459  #endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
6c90fde2568cae1 Muchun Song    2021-06-30  460  

:::::: The code at line 430 was first introduced by commit
:::::: 6c90fde2568cae1da2c9d1d614a12fd729ba4caf mm: hugetlb: alloc the vmemmap pages associated with each HugeTLB page

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Xin Hao <xhao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
