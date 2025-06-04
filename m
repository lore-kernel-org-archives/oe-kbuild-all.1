Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2BD28FA89
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042415; cv=none; b=SH9T7DLsEK6ypFvA6IMF4P+OXlic8sLOGh6YWMMPOSIj6Y4aqaWkoSlvZGgsOmDjcYditrmsESJQk34n4VpznpIHh+yP/Rs9n8stRA9mhiFzg/2QLqTQZffzQIg7DvV5I/mvuuxxvnTNBpsqhVqNrH8v7DClklcOVaWI5B5Sieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042415; c=relaxed/simple;
	bh=7HTOMgy8AxkQCJPwRw6DO9XoPSnFMR7KBiyJx9Ctowo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlmJkGG2Zot57AKSSECiuOgdElPpYcSQCbEp/JVHOPkqxTT8f0II4bgbsspyNrRQ+LHllxr73XjrD6jjgDj/auNNVu+PNsHD7Geq9O3qGBJY0+V/okeaaPZul3egF4yO+OQc4Jxh/0gvDsH5m35HBKWOiCzAZxegfBzKUJOEc6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e59A9uYb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e59A9uYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749042413; x=1780578413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7HTOMgy8AxkQCJPwRw6DO9XoPSnFMR7KBiyJx9Ctowo=;
  b=e59A9uYbS7mJ8DVk641qAXnN2SmXhWLQW4zv/wajACu8bTKVJV2x0lxO
   YusY3rVhPaVvKht8A1eFDQGFAkrYmkBBOJl4VjlG/xfvm/BvEu4o2qV06
   bWduIy/laXI6/zEyrmmg6LwbP+ncKBfoB3mKyM1xbsW+S/uJ8M9aw//I5
   WV1mMrayUWeLDhWz3zUtMrz3MP1X7RL2Ztz7hvgYoafkQ6G+7PV2VmgeM
   jlnNWQXN7OVJkMu2dnZq7gVUATYjFl5DRcbyLkmC8OjCya9ojHrCJelCs
   6QkqJIzf2iXqhDKL8jasvtGFlvNK7WoPI0FFudoSI5qQvwEAW9ZqvexY4
   g==;
X-CSE-ConnectionGUID: p6kT1zDrTQadGyucLV/XsA==
X-CSE-MsgGUID: mm6kaDKeSaOFw0mG9NRCag==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51038488"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51038488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 06:06:52 -0700
X-CSE-ConnectionGUID: oncxmDQdTOig5Yo2h8pqDw==
X-CSE-MsgGUID: 7x6fMuy4TrK962pFf8+gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145778674"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2025 06:06:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMnpQ-00038r-19;
	Wed, 04 Jun 2025 13:06:48 +0000
Date: Wed, 4 Jun 2025 21:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 31/59] mm/mm_init.c:1512:30: error:
 'PAGE_BLOCK_ORDER' undeclared; did you mean 'PAGE_BLOCK_ORDER_CEIL'?
Message-ID: <202506042058.XgvABCE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   80bb0b2983e95be26d929303d589276875c8900a
commit: 2bb7d2079ada079bd9f25c92e6a4618ee1ce22db [31/59] mm: rename CONFIG_PAGE_BLOCK_ORDER to CONFIG_PAGE_BLOCK_ORDER_CEIL.
config: powerpc64-randconfig-002-20250604 (https://download.01.org/0day-ci/archive/20250604/202506042058.XgvABCE0-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042058.XgvABCE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042058.XgvABCE0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'set_pageblock_order':
>> mm/mm_init.c:1512:30: error: 'PAGE_BLOCK_ORDER' undeclared (first use in this function); did you mean 'PAGE_BLOCK_ORDER_CEIL'?
    1512 |         unsigned int order = PAGE_BLOCK_ORDER;
         |                              ^~~~~~~~~~~~~~~~
         |                              PAGE_BLOCK_ORDER_CEIL
   mm/mm_init.c:1512:30: note: each undeclared identifier is reported only once for each function it appears in


vim +1512 mm/mm_init.c

9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1508) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1509) /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1510) void __init set_pageblock_order(void)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1511) {
e13e7922d03439 Juan Yescas         2025-05-21 @1512  	unsigned int order = PAGE_BLOCK_ORDER;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1513) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1514) 	/* Check that pageblock_nr_pages has not already been setup */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1515) 	if (pageblock_order)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1516) 		return;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1517) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1518) 	/* Don't let pageblocks exceed the maximum allocation granularity. */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1519) 	if (HPAGE_SHIFT > PAGE_SHIFT && HUGETLB_PAGE_ORDER < order)
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1520) 		order = HUGETLB_PAGE_ORDER;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1521) 
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1522) 	/*
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1523) 	 * Assume the largest contiguous order of interest is a huge page.
e99fb98d478a04 Kefeng Wang         2023-12-22  1524  	 * This value may be variable depending on boot parameters on powerpc.
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1525) 	 */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1526) 	pageblock_order = order;
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1527) }
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1528) #else /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1529) 

:::::: The code at line 1512 was first introduced by commit
:::::: e13e7922d03439e374c263049af5f740ceae6346 mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order

:::::: TO: Juan Yescas <jyescas@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
