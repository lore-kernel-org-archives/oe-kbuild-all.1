Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE1F8405B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026892; cv=none; b=CaGD+mL1mZC8YlzY35Wao32hEQkC992zZWn45mjJLYL1WLrpkKQxhDZCQuniGcBhwBOeb+Laj+GVIeLZV9VacscJLyd5iOqWUi8ddyLoOTJFs/0FN76JVnNs8f1ax5CF8pMvJdhhZjhoXvFZJ9e1GYKS2rt1RxoFOBg4J4nqLAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026892; c=relaxed/simple;
	bh=uUcG4ueqo4aDKX6sq0fsVLjN/etCWtJNlb9OkLiVhEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kO5YNxQuFgvRzMG/MsF5q1wzGHRsg82I6r8xs/jXc7gYXqV+xBViIKAKqkDpX1EhVd5fKb+wo5SewOofgYXP8ScL4aHXCgeDWJYqtIw9rmR/5nsQwusft9Sp+gD7RY2vqxtUOG/qqeuEw3kOXHRXVH+bPTZta+AvDVEd8HxpEVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFgoH0b5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFgoH0b5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711026891; x=1742562891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uUcG4ueqo4aDKX6sq0fsVLjN/etCWtJNlb9OkLiVhEU=;
  b=oFgoH0b5VltYdbH+xvfV6FLyPSS5+y9B9L2nIHfnrGcXsCEZ+fpHcmeS
   otPTEucrzZ8u4z/GBJLwF+qty1QlShhluZZNNORqJxmqdKOYfdQtawqZA
   I7+Y6wilLRcUHgCDM7Cbli4+DHbJESKEqz/aRjMKDzFYBNiqznUR1jRXf
   KdyAkFTlPpA6wvQOZ1aCugU5ejnNhQTWEvkT+w7tFDXWi2E4HvllSmuOg
   sKXl8KtHTAea8SpftRGuIt/phmFoVu7HlHdbCuUeF71o58P7ZX8NQWICF
   5bsRbh1osbn7H4iuqXZJt0jSk4mBS71vBW6VDwmoHDcGs/pyWoli6ebMo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5904352"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5904352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 06:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="18974602"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2024 06:14:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnIFo-000JRb-1U;
	Thu, 21 Mar 2024 13:14:44 +0000
Date: Thu, 21 Mar 2024 21:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@suse.de>,
	Zi Yan <ziy@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] mm: page_isolation: prepare for hygienic freelists
Message-ID: <202403212118.ye7lcKjD-lkp@intel.com>
References: <20240320180429.678181-10-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320180429.678181-10-hannes@cmpxchg.org>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-page_alloc-remove-pcppage-migratetype-caching/20240321-020814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240320180429.678181-10-hannes%40cmpxchg.org
patch subject: [PATCH 09/10] mm: page_isolation: prepare for hygienic freelists
config: i386-randconfig-003-20240321 (https://download.01.org/0day-ci/archive/20240321/202403212118.ye7lcKjD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212118.ye7lcKjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212118.ye7lcKjD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_alloc.c: In function 'move_freepages_block_isolate':
>> mm/page_alloc.c:688:17: warning: array subscript 11 is above array bounds of 'struct free_area[11]' [-Warray-bounds]
     688 |  zone->free_area[order].nr_free--;
         |  ~~~~~~~~~~~~~~~^~~~~~~
>> mm/page_alloc.c:688:17: warning: array subscript 11 is above array bounds of 'struct free_area[11]' [-Warray-bounds]


vim +688 mm/page_alloc.c

6ab0136310961eb Alexander Duyck 2020-04-06  677  
6ab0136310961eb Alexander Duyck 2020-04-06  678  static inline void del_page_from_free_list(struct page *page, struct zone *zone,
6ab0136310961eb Alexander Duyck 2020-04-06  679  					   unsigned int order)
6ab0136310961eb Alexander Duyck 2020-04-06  680  {
36e66c554b5c6a9 Alexander Duyck 2020-04-06  681  	/* clear reported state and update reported page count */
36e66c554b5c6a9 Alexander Duyck 2020-04-06  682  	if (page_reported(page))
36e66c554b5c6a9 Alexander Duyck 2020-04-06  683  		__ClearPageReported(page);
36e66c554b5c6a9 Alexander Duyck 2020-04-06  684  
bf75f200569dd05 Mel Gorman      2022-06-24  685  	list_del(&page->buddy_list);
6ab0136310961eb Alexander Duyck 2020-04-06  686  	__ClearPageBuddy(page);
6ab0136310961eb Alexander Duyck 2020-04-06  687  	set_page_private(page, 0);
6ab0136310961eb Alexander Duyck 2020-04-06 @688  	zone->free_area[order].nr_free--;
6ab0136310961eb Alexander Duyck 2020-04-06  689  }
6ab0136310961eb Alexander Duyck 2020-04-06  690  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
