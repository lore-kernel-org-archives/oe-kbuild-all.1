Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EE2AD13
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761871583; cv=none; b=EERtBSMwWtW+f2u9qmjImSluXKE8bsF8tPkdT/Zob6tstycdnSEDtp80I9GlrW15edW261qxrpfcEdV/oQk7DN2kQnl/rDWtlhWFKXxpzCfQFNvvygc3akUZLyPSwdkGO7NmYMlFRUPKbakaK1BDA12pAN5rkR822nSf+D0uZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761871583; c=relaxed/simple;
	bh=rYvL6so9ydruyTYvF7lLZ8zsUeS/zrKX2nNkLjRiksI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=endhqpbj4xIt8Znq3OnwfpGWBvnQFf3wdR2R4Xi2EgDcP3VhkrSK1OOf8y8Lj7AJxOhZ1Q0J/XYP8gMLij0YIIF40W4Hv3g0DrJj5g9z5BV2wSg2kYKhX7+u2/xI7YjdmpE48kjiu0eXRydr6OtV99UWIdqYAYRl5X4JC5NadvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwRX/sRI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwRX/sRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761871582; x=1793407582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYvL6so9ydruyTYvF7lLZ8zsUeS/zrKX2nNkLjRiksI=;
  b=kwRX/sRIzdkLBQFpKatBfuxjaPLTowcLGvj1gEsxWpz8O5oMm/TQV3ta
   iD360OGNGTtiHp89dm/lGV/KIfkwONHwkks97M8kYW4i2wEMkWmPbM2Y4
   DBWlJJLnE7ozklFGtyjuyzr+nQk/S1yWctBP3djHn1wGESEizd1V2wH/w
   wrkTNVJsEufXFzRnOeMxGaE2vKcUPtOU0gGIh+zUQo9UGRgTleanjQtfw
   HJJ2zk82Pqy4c8QS5bRvOWmpczg0MWzLWXyxAjmrPv9MRABbPD8VGSf70
   v+IDAPCCSKTg6+Ue0bnDyO5mucPgpg7e8FltuYaY/osPn2BokW+7HxmUe
   w==;
X-CSE-ConnectionGUID: 8cehwQIyRoKJY681QeXSQg==
X-CSE-MsgGUID: WuugebGzTXKq/i4bRwEzXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75145336"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="75145336"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 17:46:22 -0700
X-CSE-ConnectionGUID: b78H4B+9To6bSe3pQEmE9A==
X-CSE-MsgGUID: T6uF06zsQ4C6bE7cMPcLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="216754369"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 17:46:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEdHV-000MdM-2Y;
	Fri, 31 Oct 2025 00:46:17 +0000
Date: Fri, 31 Oct 2025 08:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3064/3064] mm/page_alloc.c:699
 __del_page_from_free_list() warn: inconsistent indenting
Message-ID: <202510310815.0k5TUFKn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 10f78461ef205a15e190d1474673dfa9add58723 [3064/3064] mm: page_alloc: consolidate free page accounting
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251031/202510310815.0k5TUFKn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310815.0k5TUFKn-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:699 __del_page_from_free_list() warn: inconsistent indenting

vim +699 mm/page_alloc.c

6ab0136310961e Alexander Duyck 2020-04-06  690  
10f78461ef205a Johannes Weiner 2024-03-20  691  static inline void __del_page_from_free_list(struct page *page, struct zone *zone,
10f78461ef205a Johannes Weiner 2024-03-20  692  					     unsigned int order, int migratetype)
6ab0136310961e Alexander Duyck 2020-04-06  693  {
10f78461ef205a Johannes Weiner 2024-03-20  694  		VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
10f78461ef205a Johannes Weiner 2024-03-20  695  		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
10f78461ef205a Johannes Weiner 2024-03-20  696  		     get_pageblock_migratetype(page), migratetype, 1 << order);
10f78461ef205a Johannes Weiner 2024-03-20  697  
36e66c554b5c6a Alexander Duyck 2020-04-06  698  	/* clear reported state and update reported page count */
36e66c554b5c6a Alexander Duyck 2020-04-06 @699  	if (page_reported(page))
36e66c554b5c6a Alexander Duyck 2020-04-06  700  		__ClearPageReported(page);
36e66c554b5c6a Alexander Duyck 2020-04-06  701  
bf75f200569dd0 Mel Gorman      2022-06-24  702  	list_del(&page->buddy_list);
6ab0136310961e Alexander Duyck 2020-04-06  703  	__ClearPageBuddy(page);
6ab0136310961e Alexander Duyck 2020-04-06  704  	set_page_private(page, 0);
6ab0136310961e Alexander Duyck 2020-04-06  705  	zone->free_area[order].nr_free--;
6ab0136310961e Alexander Duyck 2020-04-06  706  }
6ab0136310961e Alexander Duyck 2020-04-06  707  

:::::: The code at line 699 was first introduced by commit
:::::: 36e66c554b5c6a9d17a229faca7a61693527b0bd mm: introduce Reported pages

:::::: TO: Alexander Duyck <alexander.h.duyck@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
