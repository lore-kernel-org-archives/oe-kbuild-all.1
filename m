Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524513A86C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 02:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758247415; cv=none; b=hCRBCDxTfz6e7l2CQ2y3MSffJl1WqRNLKduP6YgLN4LOUs0ee5guXp3ekmAGjxJj1OPrR0YqISin4c/KhyLX6Q3UXfvBOHT/rqRhHLJE4RMfgi/XEzoLjmn2ZpdFVGXsryoOdOkvoT3Q4/249L/XipmDGGVhEAv8hj43wdf6xEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758247415; c=relaxed/simple;
	bh=SW9iJ6FWV2HB8leWz/ebMmlxh2sOtTo2ft/lzT0FZZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixJpYiK5iTA444QTOphbEboy2mxidca1xhIgEZephETMAl3z2wbQ0MLm+4ZbFk8FT3SxIUtHvT3ozRP/iX9Ci6Ul1bZNm51jm73jRHII9OldJ1u4ABBgUVfXCKiF7o1kGURwDm8gFCtC/4+iqBnh+8FR8mpIV/SDgut9uT7zCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUkG0XN5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUkG0XN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758247412; x=1789783412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SW9iJ6FWV2HB8leWz/ebMmlxh2sOtTo2ft/lzT0FZZo=;
  b=QUkG0XN57vHcIGaaveONPv7h5GajaNJgsqXLqb4PURNlOOJ+UbpAN7FX
   ZnEAQOW1Sjc1g5v9H5yJrnApBCgBrLjNZQNwPiFRlwEBaG/bdBU4wCeVY
   oiT3mHV87OE+vSk6+p3yww3lKb+j/GjnVjY3cdzFalMjb9Iv/MIJDKevA
   0h4ixLLj2AmixwziFA6KPbK7xeSbtL9i+Rr6008URhU4TMCBwlhuPpn69
   uhWVuL14/a4tQDstlDHuW/cgoV+Csxs4qO29vBtQLgfltSDJVzmoGMVv1
   tnPPk9dS9WlXFF9yXyfcWRnyt5G7UK1iwM70sT/inrhlB9BM54YzjzQwD
   A==;
X-CSE-ConnectionGUID: Huq71tNHSI+ZVdZy0pdpuQ==
X-CSE-MsgGUID: fVO01zEVREOLsCBE2NrxlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83191142"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="83191142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 19:03:31 -0700
X-CSE-ConnectionGUID: fk/s/GaxT5CdgwTbXHHemA==
X-CSE-MsgGUID: kBFdVr2qRaCFBVrAyvnTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="199413734"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2025 19:03:30 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzQTA-0003uB-1H;
	Fri, 19 Sep 2025 02:03:28 +0000
Date: Fri, 19 Sep 2025 10:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] mm: hugetlb: allocate frozen pages in
 alloc_gigantic_folio()
Message-ID: <202509191000.RoubFuJ8-lkp@intel.com>
References: <20250918132000.1951232-9-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918132000.1951232-9-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-page_alloc-optimize-pfn_range_valid_contig/20250918-212431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250918132000.1951232-9-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 8/8] mm: hugetlb: allocate frozen pages in alloc_gigantic_folio()
config: riscv-randconfig-001-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191000.RoubFuJ8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191000.RoubFuJ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191000.RoubFuJ8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'alloc_gigantic_folio':
>> mm/hugetlb.c:1497:26: error: implicit declaration of function 'alloc_contig_frozen_pages'; did you mean 'alloc_frozen_pages'? [-Werror=implicit-function-declaration]
    1497 |  folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                          alloc_frozen_pages
>> mm/hugetlb.c:1497:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1497 |  folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
         |          ^
   cc1: some warnings being treated as errors


vim +1497 mm/hugetlb.c

  1471	
  1472	#define for_each_node_mask_to_alloc(next_node, nr_nodes, node, mask)		\
  1473		for (nr_nodes = nodes_weight(*mask);				\
  1474			nr_nodes > 0 &&						\
  1475			((node = hstate_next_node_to_alloc(next_node, mask)) || 1);	\
  1476			nr_nodes--)
  1477	
  1478	#define for_each_node_mask_to_free(hs, nr_nodes, node, mask)		\
  1479		for (nr_nodes = nodes_weight(*mask);				\
  1480			nr_nodes > 0 &&						\
  1481			((node = hstate_next_node_to_free(hs, mask)) || 1);	\
  1482			nr_nodes--)
  1483	
  1484	#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
  1485	static struct folio *alloc_gigantic_folio(int order, gfp_t gfp_mask,
  1486			int nid, nodemask_t *nodemask)
  1487	{
  1488		struct folio *folio;
  1489	
  1490		folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nodemask);
  1491		if (folio)
  1492			return folio;
  1493	
  1494		if (hugetlb_cma_exclusive_alloc())
  1495			return NULL;
  1496	
> 1497		folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
  1498								  nid, nodemask);
  1499		return folio;
  1500	}
  1501	#else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE */
  1502	static struct folio *alloc_gigantic_folio(int order, gfp_t gfp_mask, int nid,
  1503						  nodemask_t *nodemask)
  1504	{
  1505		return NULL;
  1506	}
  1507	#endif
  1508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
