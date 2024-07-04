Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0E1ABCD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100591; cv=none; b=ec4vzwbmSBsQmw7XN3h6I4WUl9g8z0Gz7udFK0Sv3GVt5nL6SotskPl//cjZt0rUNys4veyqnPkRIio2vTVPcMWtnU5KXQ+YH46jih3vpheUVV3yHeWBI5AMC2NK6TZHbPEZ9tdvyOATl0Mr8BR8Eqex40S+KgrBcw5qMi0M53s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100591; c=relaxed/simple;
	bh=L428f3W1Vf7roKBQKdLEyAvdXvNOaTPKegVgEkbocok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFh6yvtZVU1Bpa9bwMLU02mGfwVlosUMNtl0vfqf+TEl5WibqHo8UGC3i7+vbYDZAochP58y1ibVEA91chdZvmeEGSdDu928arSxNoMiG77DGeh2CwEw1JZI2PF9p4sSP3ItMjFbkURyngJTLugmtGQzWfaLzW3sr99bwa9Xsuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJ8ibo6y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJ8ibo6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720100590; x=1751636590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L428f3W1Vf7roKBQKdLEyAvdXvNOaTPKegVgEkbocok=;
  b=UJ8ibo6ycTskIw3GKGqhS0DbsfvF0rKVRzHsl3Xb5SqDO5l8XEQy0Ulm
   bpxub4O066xFuidvqv4qCHRl7iGbhDvaYw2D3u5p/iz62W3pZXD3r8Css
   z6AWQK754mioFQoHFa6ZOPH2VpcahwWyIdRNSt84t3Ads6F438smdmenM
   yecObDSNG4lPV91lSBVun22iDqRfhhuhLeUrvXTVn7z62AKRDvDy78d6R
   CRrV4PvEZpUhlHRkZgPP70bTGCQSjVOyS2S27qNWz2oqYkaSFc4Au8LZl
   9QX4/5qxWWEjDsr7nEXFyXF9W9csWHhghpPz0N9BILPBqoqv98XfbCYDH
   Q==;
X-CSE-ConnectionGUID: b0bKoB5HRvWD4VRJ3wwJ9g==
X-CSE-MsgGUID: tJ6EvLW3R86ccXbFwYU1lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17217076"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17217076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 06:43:10 -0700
X-CSE-ConnectionGUID: oJ6v0KdsSTamD4B0l9oXIw==
X-CSE-MsgGUID: Iu+q3anmQzG7ao1znTb97g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="77734769"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jul 2024 06:43:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPMjq-000R2o-1v;
	Thu, 04 Jul 2024 13:43:06 +0000
Date: Thu, 4 Jul 2024 21:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 41/53]
 drivers/iommu/generic_pt/pt_alloc.c:56:49: error: 'NR_IOMMU_PAGES'
 undeclared
Message-ID: <202407042112.wOzaDz4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 12980891d978237b73dacbbb96a3ca45f6eda6d2 [41/53] genpt: Add an allocator for page table levels
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240704/202407042112.wOzaDz4T-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042112.wOzaDz4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042112.wOzaDz4T-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/generic_pt/pt_alloc.c: In function 'pt_radix_alloc':
>> drivers/iommu/generic_pt/pt_alloc.c:56:49: error: 'NR_IOMMU_PAGES' undeclared (first use in this function)
      56 |         mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, 1UL << order);
         |                                                 ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/pt_alloc.c:56:49: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/generic_pt/pt_alloc.c: In function 'pt_radix_free_list':
   drivers/iommu/generic_pt/pt_alloc.c:72:57: error: 'NR_IOMMU_PAGES' undeclared (first use in this function)
      72 |                 mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, -pgcnt);
         |                                                         ^~~~~~~~~~~~~~


vim +/NR_IOMMU_PAGES +56 drivers/iommu/generic_pt/pt_alloc.c

    28	
    29	void *pt_radix_alloc(struct pt_common *owner, int nid, size_t log2size,
    30			     gfp_t gfp)
    31	{
    32		struct pt_radix_meta *meta;
    33		unsigned int order = log2size - PAGE_SHIFT;
    34		struct folio *folio;
    35	
    36		/*
    37		 * FIXME we need to support sub page size tables, eg to allow a 4K table
    38		 * on a 64K kernel. This should be done by allocating extra memory
    39		 * per page and placing the pointer in the meta. The extra memory can
    40		 * contain the additional list heads and rcu's required.
    41		 */
    42		if (log2size < PAGE_SHIFT)
    43			order = 0;
    44	
    45		nid = NUMA_NO_NODE; // FIXME
    46		folio = (struct folio *)alloc_pages_node(
    47			nid, gfp | __GFP_ZERO | __GFP_COMP, order);
    48		if (!folio)
    49			return ERR_PTR(-ENOMEM);
    50	
    51		meta = folio_to_meta(folio);
    52		meta->owner = owner;
    53		meta->free_next = NULL;
    54		meta->log2size = log2size;
    55	
  > 56		mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, 1UL << order);
    57		lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, 1UL << order);
    58	
    59		return folio_address(folio);
    60	}
    61	EXPORT_SYMBOL_NS_GPL(pt_radix_alloc, GENERIC_PT);
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
