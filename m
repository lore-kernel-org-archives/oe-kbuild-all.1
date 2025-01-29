Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26777193084
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137455; cv=none; b=hrm8054VwxE6orTlTos2+osry16YKTRksuZ6ZTXyTXZGnBmTgYB8QBhUHrwK5c6WieutTXmXLj9/9QIjZR9T1CK7xmsvfwGcdXzK/AQ+jxLMTL0Z1mdAdkPjVJqLxXzBx7HAH43GoJU5HChDLyLDVJHk8sUfAvZNmIawosIW7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137455; c=relaxed/simple;
	bh=2kTBeLitdY+YT4WlRyi9NoZpg3ha4IGh29dE13uGcMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJb0sY/1gYA0pem+O5TSN2gIImFI8SKJdOcxPHgrSA3BHEQc3LEuE5nI7Yp7FpaNscipnBh0udWqgYDQ81n8lDTRhJGcncisMr1wK7q7yLzP5wu/fBxm7URaENfyNM7qpDaOEApqOTqYQ/OK5n6JF9+tF/YPgmfGEeiio2Zq3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjJlhkgk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjJlhkgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738137453; x=1769673453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2kTBeLitdY+YT4WlRyi9NoZpg3ha4IGh29dE13uGcMQ=;
  b=hjJlhkgkJ8bABOdIAJ+WZyVbqfpDC4WPtQMwSxrgSkIUn4VefieHAu5q
   AA90s9ylrob/OC2ksfI+ZeTWiCUb6gEZMArb+GlKqYygVZV8zkDnPSCAe
   A4vjsBI7aOE+xopN923h2TLguGDuvQNQWTsLbJKVXpZHLuZpDgowHGD3R
   0mqzqLT70yAvEcTUlDMcHPuNRzcFhQPXMOOb8caD/xeXxxVp9Dc/+lXyv
   yrSxIGyspXYmpRaaKo8X5VMWysjj1sAElkL1s0JhS6iEGZQefE+iJRt+F
   cf5Bir4FaJDFtK6GbMzTqrCuogFYiNlwgtKdwwHc+aPQ4dHsQiAH1mICu
   w==;
X-CSE-ConnectionGUID: YwRwocs3TvScecWyeEpq1g==
X-CSE-MsgGUID: d00baGerS0e6fihilrvfxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49294749"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="49294749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 23:57:32 -0800
X-CSE-ConnectionGUID: Z1S2ZfYvQ7yl0VzCmB7cmg==
X-CSE-MsgGUID: SHqBNoIUQZOAZOTEscrwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146161581"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 23:57:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td2wz-000ikJ-0e;
	Wed, 29 Jan 2025 07:57:29 +0000
Date: Wed, 29 Jan 2025 15:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 6/20] drivers/iommu/iommu-pages.c:38:47:
 error: 'NR_IOMMU_PAGES' undeclared; did you mean 'NR_MEMMAP_PAGES'?
Message-ID: <202501291522.t1FvqrVh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pages
head:   470a82a6588cba1a19210a78a710620a15b6019b
commit: 6c72aac62af905e9c969c12aa399d8bed4b4d033 [6/20] iommu/pages: De-inline the substantial functions
config: riscv-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291522.t1FvqrVh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291522.t1FvqrVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291522.t1FvqrVh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommu-pages.c: In function 'iommu_alloc_pages_node':
>> drivers/iommu/iommu-pages.c:38:47: error: 'NR_IOMMU_PAGES' undeclared (first use in this function); did you mean 'NR_MEMMAP_PAGES'?
      38 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
         |                                               ^~~~~~~~~~~~~~
         |                                               NR_MEMMAP_PAGES
   drivers/iommu/iommu-pages.c:38:47: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/iommu-pages.c: In function '__iommu_free_page':
   drivers/iommu/iommu-pages.c:50:47: error: 'NR_IOMMU_PAGES' undeclared (first use in this function); did you mean 'NR_MEMMAP_PAGES'?
      50 |         mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
         |                                               ^~~~~~~~~~~~~~
         |                                               NR_MEMMAP_PAGES


vim +38 drivers/iommu/iommu-pages.c

     9	
    10	/**
    11	 * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
    12	 *                          specific NUMA node
    13	 * @nid: memory NUMA node id
    14	 * @gfp: buddy allocator flags
    15	 * @order: page order
    16	 *
    17	 * Returns the virtual address of the allocated page. The page must be
    18	 * freed either by calling iommu_free_page() or via iommu_put_pages_list().
    19	 */
    20	void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
    21	{
    22		const unsigned long pgcnt = 1UL << order;
    23		struct page *page;
    24	
    25		page = alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
    26		if (unlikely(!page))
    27			return NULL;
    28	
    29		/*
    30		 * All page allocations that should be reported to as "iommu-pagetables"
    31		 * to userspace must use one of the functions below. This includes
    32		 * allocations of page-tables and other per-iommu_domain configuration
    33		 * structures.
    34		 *
    35		 * This is necessary for the proper accounting as IOMMU state can be
    36		 * rather large, i.e. multiple gigabytes in size.
    37		 */
  > 38		mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
    39		mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
    40	
    41		return page_address(page);
    42	}
    43	EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
