Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0B27A111
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732702; cv=none; b=PFhkMd4A6gqvfTudWoLlncqA8L5S4sB2ELR/k/4+zeXgVyFVP/ELIUNgAyGnpnuNpt6T1akd9lomWnzSrQH4batVSx8HYkdZj7gPBUUpeuV+I3yw3crmtHaGX7zscmzZxvjLPN2A5Fbunp3HDcQGFbIv98V9sUjB6z4yO+QRlYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732702; c=relaxed/simple;
	bh=DS0jU+gP1kkpyHLtXq0O6J1gonM7mMS7zo4b/aOwpn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVkPArtr9X7KBKr3vqkw+o1Hoj7Q9uK86/JDXQjuuinlK9HIZ3poYwgIriAaTg379uHSe+GqGpREcmCPVZXhiXVznGYwiriEMYiw1cNJ4LAMkkGQf8JPWlBoW6RTZm2yt6tq4oQbsaVcip0i2Hpz7jyOCJiS3Qe9CANInd7Kk/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebk6gU3J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebk6gU3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746732701; x=1778268701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DS0jU+gP1kkpyHLtXq0O6J1gonM7mMS7zo4b/aOwpn4=;
  b=ebk6gU3JeR1/URwEEkLqG71ZlMs4VKE8itf86aT+I8sT+opF3PdrJoIh
   AvFS6bX2Mdb7yjRYvr+kZIjnvSV4UXTXF+FCIp7hw22aGwvphYnPn5OnO
   kkVDT4ShFfTifXNnGdf5DHXkLeGbs4ca3Q6UgMgchlV7m1A7lRMSybL2E
   18yDnikiOBsouwRTymANuIRwnfguIY+XWgwa/cw4vDm6SL7mG+7IBznk4
   cB0nM4v0MvkRmtRx8N4MSSsbtbwvMtGP0tK6wx6OxBmW7tTIcsa/uYuDa
   WqpGk8HMQdg3OO4+wsoYPZUVeEXthEtrfQFpTSJZ5cHioQ+9ImIDYT8cZ
   A==;
X-CSE-ConnectionGUID: NisiSPcBTIeXzo4rD5BPVQ==
X-CSE-MsgGUID: YDRnLtPnSRCFkgJcF/Bd2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48651580"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48651580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:31:38 -0700
X-CSE-ConnectionGUID: 9hHCLiJkS6qKPPGO22+HoA==
X-CSE-MsgGUID: AYwMLRQLRGas2hX0ZF/tkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136906939"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 12:31:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD6xy-000BJ1-2j;
	Thu, 08 May 2025 19:31:34 +0000
Date: Fri, 9 May 2025 03:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Message-ID: <202505090301.YVJe7ViG-lkp@intel.com>
References: <20250507211059.2211628-5-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507211059.2211628-5-ziy@nvidia.com>

Hi Zi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to trace/for-next linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-page_isolation-make-page-isolation-a-standalone-bit/20250508-051305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250507211059.2211628-5-ziy%40nvidia.com
patch subject: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter from more functions.
config: i386-randconfig-r133-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090301.YVJe7ViG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090301.YVJe7ViG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090301.YVJe7ViG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_isolation.c:562:35: sparse: sparse: restricted isol_flags_t degrades to integer
   mm/page_isolation.c:565:35: sparse: sparse: restricted isol_flags_t degrades to integer
--
>> mm/page_alloc.c:6661:62: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long nr_migrated @@     got restricted acr_flags_t [usertype] alloc_flags @@
   mm/page_alloc.c:6661:62: sparse:     expected unsigned long nr_migrated
   mm/page_alloc.c:6661:62: sparse:     got restricted acr_flags_t [usertype] alloc_flags
>> mm/page_alloc.c:6664:50: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected restricted acr_flags_t [usertype] alloc_flags @@     got unsigned long [assigned] total_mapped @@
   mm/page_alloc.c:6664:50: sparse:     expected restricted acr_flags_t [usertype] alloc_flags
   mm/page_alloc.c:6664:50: sparse:     got unsigned long [assigned] total_mapped
   mm/page_alloc.c:2766:13: sparse: sparse: context imbalance in '__free_frozen_pages' - different lock contexts for basic block
   mm/page_alloc.c:2869:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:3159:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4987:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block

vim +562 mm/page_isolation.c

a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  516  
ce5df7764b3b2a Johannes Weiner         2023-05-19  517  /**
ce5df7764b3b2a Johannes Weiner         2023-05-19  518   * undo_isolate_page_range - undo effects of start_isolate_page_range()
ce5df7764b3b2a Johannes Weiner         2023-05-19  519   * @start_pfn:		The first PFN of the isolated range
ce5df7764b3b2a Johannes Weiner         2023-05-19  520   * @end_pfn:		The last PFN of the isolated range
ce5df7764b3b2a Johannes Weiner         2023-05-19  521   *
3b2d36e02a0f7a Zi Yan                  2025-05-07  522   * This finds and unsets every MIGRATE_ISOLATE page block in the given range
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  523   */
3b2d36e02a0f7a Zi Yan                  2025-05-07  524  void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  525  {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  526  	unsigned long pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  527  	struct page *page;
4f9bc69ac5ce34 Kefeng Wang             2022-09-07  528  	unsigned long isolate_start = pageblock_start_pfn(start_pfn);
5f7fa13fa858c1 Kefeng Wang             2022-09-07  529  	unsigned long isolate_end = pageblock_align(end_pfn);
6f8d2b8a262c6b Wang Xiaoqiang          2016-01-15  530  
6e263fff1de48f Zi Yan                  2022-05-12  531  	for (pfn = isolate_start;
6e263fff1de48f Zi Yan                  2022-05-12  532  	     pfn < isolate_end;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  533  	     pfn += pageblock_nr_pages) {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  534  		page = __first_valid_page(pfn, pageblock_nr_pages);
bbf9ce9719b5c6 Xishi Qiu               2017-05-03  535  		if (!page || !is_migrate_isolate_page(page))
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  536  			continue;
b66161f6c9ad0a Zi Yan                  2025-05-07  537  		unset_migratetype_isolate(page);
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  538  	}
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  539  }
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  540  /*
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  541   * Test all pages in the range is free(means isolated) or not.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  542   * all pages in [start_pfn...end_pfn) must be in the same zone.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  543   * zone->lock must be held before call this.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  544   *
ec3b6882509188 Neil Zhang              2016-04-01  545   * Returns the last tested pfn.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  546   */
fea85cff11de43 Joonsoo Kim             2016-01-14  547  static unsigned long
b023f46813cde6 Wen Congyang            2012-12-11  548  __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
756d25be457fc5 David Hildenbrand       2019-11-30  549  				  int flags)
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  550  {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  551  	struct page *page;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  552  
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  553  	while (pfn < end_pfn) {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  554  		page = pfn_to_page(pfn);
aa016d145d4c3b Vlastimil Babka         2015-09-08  555  		if (PageBuddy(page))
435b405c06119d Minchan Kim             2012-10-08  556  			/*
aa016d145d4c3b Vlastimil Babka         2015-09-08  557  			 * If the page is on a free list, it has to be on
aa016d145d4c3b Vlastimil Babka         2015-09-08  558  			 * the correct MIGRATE_ISOLATE freelist. There is no
aa016d145d4c3b Vlastimil Babka         2015-09-08  559  			 * simple way to verify that as VM_BUG_ON(), though.
435b405c06119d Minchan Kim             2012-10-08  560  			 */
ab130f9108dcf2 Matthew Wilcox (Oracle  2020-10-15  561) 			pfn += 1 << buddy_order(page);
756d25be457fc5 David Hildenbrand       2019-11-30 @562  		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
aa016d145d4c3b Vlastimil Babka         2015-09-08  563  			/* A HWPoisoned page cannot be also PageBuddy */
b023f46813cde6 Wen Congyang            2012-12-11  564  			pfn++;
aa218795cb5fd5 David Hildenbrand       2020-05-07  565  		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
aa218795cb5fd5 David Hildenbrand       2020-05-07  566  			 !page_count(page))
aa218795cb5fd5 David Hildenbrand       2020-05-07  567  			/*
aa218795cb5fd5 David Hildenbrand       2020-05-07  568  			 * The responsible driver agreed to skip PageOffline()
aa218795cb5fd5 David Hildenbrand       2020-05-07  569  			 * pages when offlining memory by dropping its
aa218795cb5fd5 David Hildenbrand       2020-05-07  570  			 * reference in MEM_GOING_OFFLINE.
aa218795cb5fd5 David Hildenbrand       2020-05-07  571  			 */
aa218795cb5fd5 David Hildenbrand       2020-05-07  572  			pfn++;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  573  		else
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  574  			break;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  575  	}
fea85cff11de43 Joonsoo Kim             2016-01-14  576  
fea85cff11de43 Joonsoo Kim             2016-01-14  577  	return pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  578  }
a5d76b54a3f3a4 KAMEZAWA Hiroyuki       2007-10-16  579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
