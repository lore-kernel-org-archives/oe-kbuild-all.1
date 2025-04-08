Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB2E149DFF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120503; cv=none; b=G789hhZjf6JlwUJbWPvdqqTy3Wmj61ph9pWLedcP0kgHF7sRa4INX+SrjzJhojPTO0WAGHR3nuKmOjD9V9HcJAcKU6YkNjaAqwAZ3kJJi9W9SVmdctzn6dpRNg2Wez7PsJPON1FcRlFwyqgDkAn01z0EItEerNHPqwZajGyHeVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120503; c=relaxed/simple;
	bh=UA2Lkay5oM+b97NYy9ME9j5V6HO3uB8rUem8rAFtZtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDgJgzZilONsL98eMXn9NalhaY4pjQbIYNYBKDEnL8tO2L/cI0MUGFRePc590Z/4L/mXgvHjLDpglS40upvsiGwXxwZ0lcOowcmNuiQ/H+oUXZjxMy192WpvDm4i+geDsVRMTij0rrsQfEMZyabtv4RNPlVDJ2qTHXkbOa3EtaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeI6y0sw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeI6y0sw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120502; x=1775656502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UA2Lkay5oM+b97NYy9ME9j5V6HO3uB8rUem8rAFtZtA=;
  b=KeI6y0sweI8f5YduJb2JYmtJ9XCPsD0s7pYlRSNlejks+vzbYevwf93l
   mvHUU+sZ/VwqIqeTOML2tr+20M5hmjcQp0e3qQZnu9j+V4YslTWpKzc+a
   oQEzPE5m4NqqrU//IXVBpmKYBKYdIiAqxJ+zhNWUGDK9gjtoc6fmjvBK7
   4pzIWWgMZFGnPctdoRRREkn2vuz2mCe8FBQn7Ai+AMy2Gafu1QFoM/sv3
   +TPCl8hAbp9lDQ6ItIHVnoxOBEj6A7UOyVp/5FQyzLP9vLtJFVnQsyLnX
   +wjt4JoYo+Dp+5qpw3ZLQg6sKOXRIgtapF53fN4u/fMm51zQTZCqPlRmH
   Q==;
X-CSE-ConnectionGUID: 9jtaSh24SEyTdbsWtozxww==
X-CSE-MsgGUID: sW8r8up+ReKRn3pYXtZLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44803204"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44803204"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:55:01 -0700
X-CSE-ConnectionGUID: ph6P48g3Q9SuMuOjsbaHJA==
X-CSE-MsgGUID: 0RUDAqOXQP6Vcxg2JgLl6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128787955"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2025 06:55:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u29Pl-0007Vf-37;
	Tue, 08 Apr 2025 13:54:57 +0000
Date: Tue, 8 Apr 2025 21:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/sparse-vmemmap.c:430:
 warning: Function parameter or member 'altmap_pages' not described in
 'vmemmap_remap_alloc'
Message-ID: <202504082135.vI0loeOL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: 39dbfa37de5e4321e403a48914319dc98efa260b [9/9] anolis: virtio-mem: make memmap on movable memory can be offlined
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250408/202504082135.vI0loeOL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504082135.vI0loeOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504082135.vI0loeOL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/sparse-vmemmap.c:430: warning: Function parameter or member 'altmap_pages' not described in 'vmemmap_remap_alloc'


vim +430 mm/sparse-vmemmap.c

6c90fde2568cae Muchun Song    2021-06-30  414  
6c90fde2568cae Muchun Song    2021-06-30  415  /**
6c90fde2568cae Muchun Song    2021-06-30  416   * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
6c90fde2568cae Muchun Song    2021-06-30  417   *			 to the page which is from the @vmemmap_pages
6c90fde2568cae Muchun Song    2021-06-30  418   *			 respectively.
6c90fde2568cae Muchun Song    2021-06-30  419   * @start:	start address of the vmemmap virtual address range that we want
6c90fde2568cae Muchun Song    2021-06-30  420   *		to remap.
6c90fde2568cae Muchun Song    2021-06-30  421   * @end:	end address of the vmemmap virtual address range that we want to
6c90fde2568cae Muchun Song    2021-06-30  422   *		remap.
6c90fde2568cae Muchun Song    2021-06-30  423   * @reuse:	reuse address.
6c90fde2568cae Muchun Song    2021-06-30  424   * @gfp_mask:	GFP flag for allocating vmemmap pages.
b41bc642bc980a Muchun Song    2021-06-30  425   *
b41bc642bc980a Muchun Song    2021-06-30  426   * Return: %0 on success, negative error code otherwise.
6c90fde2568cae Muchun Song    2021-06-30  427   */
6c90fde2568cae Muchun Song    2021-06-30  428  int vmemmap_remap_alloc(unsigned long start, unsigned long end,
39dbfa37de5e43 zhongjiang-ali 2024-04-09  429  			unsigned long reuse, gfp_t gfp_mask, struct list_head *altmap_pages)
6c90fde2568cae Muchun Song    2021-06-30 @430  {
6c90fde2568cae Muchun Song    2021-06-30  431  	LIST_HEAD(vmemmap_pages);
6c90fde2568cae Muchun Song    2021-06-30  432  	struct vmemmap_remap_walk walk = {
6c90fde2568cae Muchun Song    2021-06-30  433  		.remap_pte	= vmemmap_restore_pte,
6c90fde2568cae Muchun Song    2021-06-30  434  		.reuse_addr	= reuse,
6c90fde2568cae Muchun Song    2021-06-30  435  		.vmemmap_pages	= &vmemmap_pages,
6c90fde2568cae Muchun Song    2021-06-30  436  	};
6c90fde2568cae Muchun Song    2021-06-30  437  
6c90fde2568cae Muchun Song    2021-06-30  438  	/* See the comment in the vmemmap_remap_free(). */
39dbfa37de5e43 zhongjiang-ali 2024-04-09  439  	if (!virtio_is_use_memmap(reuse))
6c90fde2568cae Muchun Song    2021-06-30  440  		BUG_ON(start - reuse != PAGE_SIZE);
6c90fde2568cae Muchun Song    2021-06-30  441  
39dbfa37de5e43 zhongjiang-ali 2024-04-09  442  	if (virtio_is_use_memmap(reuse))
39dbfa37de5e43 zhongjiang-ali 2024-04-09  443  		walk.vmemmap_pages = altmap_pages;
39dbfa37de5e43 zhongjiang-ali 2024-04-09  444  
39dbfa37de5e43 zhongjiang-ali 2024-04-09  445  	if (list_empty(walk.vmemmap_pages) && alloc_vmemmap_page_list(start,
39dbfa37de5e43 zhongjiang-ali 2024-04-09  446  			end, gfp_mask, walk.vmemmap_pages))
6c90fde2568cae Muchun Song    2021-06-30  447  		return -ENOMEM;
6c90fde2568cae Muchun Song    2021-06-30  448  
b41bc642bc980a Muchun Song    2021-06-30  449  	mmap_read_lock(&init_mm);
39dbfa37de5e43 zhongjiang-ali 2024-04-09  450  	if (virtio_is_use_memmap(reuse))
39dbfa37de5e43 zhongjiang-ali 2024-04-09  451  		vmemmap_remap_range(start, end, &walk);
39dbfa37de5e43 zhongjiang-ali 2024-04-09  452  	else
6c90fde2568cae Muchun Song    2021-06-30  453  		vmemmap_remap_range(reuse, end, &walk);
b41bc642bc980a Muchun Song    2021-06-30  454  	mmap_read_unlock(&init_mm);
6c90fde2568cae Muchun Song    2021-06-30  455  
6c90fde2568cae Muchun Song    2021-06-30  456  	return 0;
6c90fde2568cae Muchun Song    2021-06-30  457  }
39dbfa37de5e43 zhongjiang-ali 2024-04-09  458  EXPORT_SYMBOL(vmemmap_remap_alloc);
9e776aa02931f7 Muchun Song    2022-04-28  459  #endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
6c90fde2568cae Muchun Song    2021-06-30  460  

:::::: The code at line 430 was first introduced by commit
:::::: 6c90fde2568cae1da2c9d1d614a12fd729ba4caf mm: hugetlb: alloc the vmemmap pages associated with each HugeTLB page

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Xin Hao <xhao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
