Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64650176255
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802862; cv=none; b=ryLEfEYPRtnjBcAJOTwXgvxia9IigEpIxCw5ettuG8/pfut90EFk4JHkrBv6V179MNb7J134rlVJGDcvgeD79tTLji3kwzd4QCcovRAqQwksvqcNP/Of9l0GMWnqNWTE3100fDl6hgUZbrsvLSfn3u27eFSAlPMnQN/KgwiL2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802862; c=relaxed/simple;
	bh=sZr1WjEx/HNWaFD1OqFKqz13Kis0xX6pGMRmaVR7Gec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZUxSxXR6x4SEEyrQ+A0BbR9ErCg1lyfw0GwivzYBuhxynj+cT4IahzJne1l0RPL9WGpvDuVhlSFQ16q9zZmaI4hOgFpG9hxYMvAp+8Fiwn0n79V/qsxeUVwey18Tl8vflWCcTONeY7LZsiRW9X7cxQNtaQ4lIRH/HWmEOvEUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euIibarc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euIibarc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720802860; x=1752338860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZr1WjEx/HNWaFD1OqFKqz13Kis0xX6pGMRmaVR7Gec=;
  b=euIibarcCV0N2Pbg2p2bCl6useZJCXfR5HwLKDlJyMrN5C7xlW+Ex7Xw
   Rpp/F6bBzPQ6tDmIn/UPXK5CxHlbiO1CAZfrVpU/47WH08getNPjlPBtc
   FZ9VkkpihTZIrfJm/BZ35/ctc4POyXlvOo9LuzChBbjwmhnJaydcSG3Vz
   qLEEUXldxaiRErmGTrJiJKGT1Xmtz3LXKRLyG/sAn6l1DQAavgsNb9CFd
   ePrbBMWmH7W9Vrpl7NjntiWli6uEt5iNWqTxEpkfxtpltcOfJ+hZrTK60
   50b6vs+WnLkAeX3Lxck+sfPMjBULVMPkkN4t2k9Y8fHQAktqR5wmUH5uT
   g==;
X-CSE-ConnectionGUID: +snrwrsHQ4WkZrwyTseqXw==
X-CSE-MsgGUID: w/GWpCvPTZaC9We21VotTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17872914"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="17872914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 09:47:38 -0700
X-CSE-ConnectionGUID: bdtxWTK7SeW6evmu0liMQQ==
X-CSE-MsgGUID: q/rkbEoeR4uk0aF1suPv6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="54157231"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2024 09:47:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSJQk-000b0y-0f;
	Fri, 12 Jul 2024 16:47:34 +0000
Date: Sat, 13 Jul 2024 00:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 2/10]
 drivers/iommu/generic_pt/pt_alloc.c:56:49: error: 'NR_IOMMU_PAGES'
 undeclared
Message-ID: <202407130034.Bu3yHQfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   262ff230b5cf17a8a573be8dbee522de7a36a87a
commit: 5082473c62fd387bdbf136fb1eef8c78b0dc1633 [2/10] genpt: Add an allocator for page table levels
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240713/202407130034.Bu3yHQfH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130034.Bu3yHQfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130034.Bu3yHQfH-lkp@intel.com/

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
