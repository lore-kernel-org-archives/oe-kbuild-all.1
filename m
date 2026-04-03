Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB637FF5A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205734; cv=none; b=ol/ZGy/TBjs6ZtjA4+IzGS3BUolJJCFGUAJzNYwmw2jSc1wx+UkDxF5PCtLGeK59/MmuWNC6IPq5vSB8b1Ecm3wgokOdcS+bJqJPZ6zSKIiFicU2PV9HGS3wXFg59CaIopFUIxhaQVSdqHZbr77OcDmghYTrBkv+hJzrX4mG+YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205734; c=relaxed/simple;
	bh=D/2wqcLAjgU9Gx5rUu4J98A+92bCLOGq7xL8q3oKhd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bpDTnC+gByBQJfjaG/QL2AeBbV4qWHvZu8Sia2Qdofqu3QQZKBZ+akdzKGrxWjv99Jkk3FQfKNTwvd/vllAjmM66F+ZJ2qUbYFst7m6m097qDgon3K4+v/d+W5wolyImuoomAn7kOa2kXcucuCXeiBAfa7d1h6O9rZq7BKi7qJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTG+y0s1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTG+y0s1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205729; x=1806741729;
  h=date:from:to:cc:subject:message-id;
  bh=D/2wqcLAjgU9Gx5rUu4J98A+92bCLOGq7xL8q3oKhd4=;
  b=VTG+y0s1smojVHy2i467TyTkndz3s/TZWsWxcslUKH7XftG4zKomrgoX
   D68Y4eZduFewvDu7NlTdVTswQbBs2GUho6+onicBgmvbNh09dP3+NzaJs
   sniiXjUiK1wb/0eCcxq7bJp2SV4re5nooPWoTQun5pDHRasEnMzPhzMOJ
   O2MRtVZCWmKF5aBd3WL3RfRbHwVkAcZkXqWToqCzDdM297PAAmjyV/Jri
   ic2KOsBDBjHCJVAl4+kGknJ90zoPnmuIm3TwRwgIn2uMqINq968iOA00N
   K2rk870DpxswRsyzPRNu4lcQcZwJ62f/WpGOKTC9K/1uAGmfdPBNpZESg
   w==;
X-CSE-ConnectionGUID: HqYKvI+1Q2GfYIbijFLFzQ==
X-CSE-MsgGUID: lceHGEKPTOeYqf8i3Wzo3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86973963"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86973963"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: BoFL3rsIRACS+TikqyJbIA==
X-CSE-MsgGUID: wGDz25OQQZ239CydRzXtow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834242"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-0000000012v-2WCC;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] mm/page_isolation.c:186:
 warning: Function parameter or member 'failed_pfn' not described in
 'start_isolate_page_range'
Message-ID: <202604022145.xjsglPzE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Minchan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3345d7186397130229186427c1c89125d9687c46
commit: 60d2dad38e3dce7359b318c436dd06e5a55da15a [1/1] ANDROID: mm: cma: skip problematic pageblock
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260402/202604022145.xjsglPzE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022145.xjsglPzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022145.xjsglPzE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_isolation.c:186: warning: Function parameter or member 'failed_pfn' not described in 'start_isolate_page_range'


vim +186 mm/page_isolation.c

a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  141  
9b7ea46a82b31c Qian Cai          2019-03-28  142  /**
9b7ea46a82b31c Qian Cai          2019-03-28  143   * start_isolate_page_range() - make page-allocation-type of range of pages to
9b7ea46a82b31c Qian Cai          2019-03-28  144   * be MIGRATE_ISOLATE.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  145   * @start_pfn:		The lower PFN of the range to be isolated.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  146   * @end_pfn:		The upper PFN of the range to be isolated.
9b7ea46a82b31c Qian Cai          2019-03-28  147   *			start_pfn/end_pfn must be aligned to pageblock_order.
9b7ea46a82b31c Qian Cai          2019-03-28  148   * @migratetype:	Migrate type to set in error recovery.
9b7ea46a82b31c Qian Cai          2019-03-28  149   * @flags:		The following flags are allowed (they can be combined in
9b7ea46a82b31c Qian Cai          2019-03-28  150   *			a bit mask)
756d25be457fc5 David Hildenbrand 2019-11-30  151   *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
756d25be457fc5 David Hildenbrand 2019-11-30  152   *					 e.g., skip over PageHWPoison() pages
aa218795cb5fd5 David Hildenbrand 2020-05-07  153   *					 and PageOffline() pages.
9b7ea46a82b31c Qian Cai          2019-03-28  154   *			REPORT_FAILURE - report details about the failure to
9b7ea46a82b31c Qian Cai          2019-03-28  155   *			isolate the range
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  156   *
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  157   * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  158   * the range will never be allocated. Any free pages and pages freed in the
9b7ea46a82b31c Qian Cai          2019-03-28  159   * future will not be allocated again. If specified range includes migrate types
9b7ea46a82b31c Qian Cai          2019-03-28  160   * other than MOVABLE or CMA, this will fail with -EBUSY. For isolating all
9b7ea46a82b31c Qian Cai          2019-03-28  161   * pages in the range finally, the caller have to free all pages in the range.
9b7ea46a82b31c Qian Cai          2019-03-28  162   * test_page_isolated() can be used for test it.
2c7452a075d4db Mike Kravetz      2018-04-05  163   *
2c7452a075d4db Mike Kravetz      2018-04-05  164   * There is no high level synchronization mechanism that prevents two threads
2c7452a075d4db Mike Kravetz      2018-04-05  165   * from trying to isolate overlapping ranges. If this happens, one thread
2c7452a075d4db Mike Kravetz      2018-04-05  166   * will notice pageblocks in the overlapping range already set to isolate.
2c7452a075d4db Mike Kravetz      2018-04-05  167   * This happens in set_migratetype_isolate, and set_migratetype_isolate
2c7452a075d4db Mike Kravetz      2018-04-05  168   * returns an error. We then clean up by restoring the migration type on
2c7452a075d4db Mike Kravetz      2018-04-05  169   * pageblocks we may have modified and return -EBUSY to caller. This
2c7452a075d4db Mike Kravetz      2018-04-05  170   * prevents two threads from simultaneously working on overlapping ranges.
9b7ea46a82b31c Qian Cai          2019-03-28  171   *
9683182612214a Pavel Tatashin    2020-09-18  172   * Please note that there is no strong synchronization with the page allocator
9683182612214a Pavel Tatashin    2020-09-18  173   * either. Pages might be freed while their page blocks are marked ISOLATED.
7612921f2376d5 Vlastimil Babka   2020-12-14  174   * A call to drain_all_pages() after isolation can flush most of them. However
7612921f2376d5 Vlastimil Babka   2020-12-14  175   * in some cases pages might still end up on pcp lists and that would allow
9683182612214a Pavel Tatashin    2020-09-18  176   * for their allocation even when they are in fact isolated already. Depending
ec6e8c7e03147c Vlastimil Babka   2020-12-14  177   * on how strong of a guarantee the caller needs, zone_pcp_disable/enable()
ec6e8c7e03147c Vlastimil Babka   2020-12-14  178   * might be used to flush and disable pcplist before isolation and enable after
ec6e8c7e03147c Vlastimil Babka   2020-12-14  179   * unisolation.
9683182612214a Pavel Tatashin    2020-09-18  180   *
3fa0c7c79d2499 David Hildenbrand 2020-10-15  181   * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  182   */
0815f3d81d76df Michal Nazarewicz 2012-04-03  183  int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
60d2dad38e3dce Minchan Kim       2021-06-29  184  			     unsigned migratetype, int flags,
60d2dad38e3dce Minchan Kim       2021-06-29  185  			     unsigned long *failed_pfn)
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16 @186  {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  187  	unsigned long pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  188  	unsigned long undo_pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  189  	struct page *page;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  190  
fec174d6699e2e Naoya Horiguchi   2016-01-14  191  	BUG_ON(!IS_ALIGNED(start_pfn, pageblock_nr_pages));
fec174d6699e2e Naoya Horiguchi   2016-01-14  192  	BUG_ON(!IS_ALIGNED(end_pfn, pageblock_nr_pages));
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  193  
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  194  	for (pfn = start_pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  195  	     pfn < end_pfn;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  196  	     pfn += pageblock_nr_pages) {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  197  		page = __first_valid_page(pfn, pageblock_nr_pages);
9b7ea46a82b31c Qian Cai          2019-03-28  198  		if (page) {
9b7ea46a82b31c Qian Cai          2019-03-28  199  			if (set_migratetype_isolate(page, migratetype, flags)) {
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  200  				undo_pfn = pfn;
60d2dad38e3dce Minchan Kim       2021-06-29  201  				if (failed_pfn)
60d2dad38e3dce Minchan Kim       2021-06-29  202  					*failed_pfn = page_to_pfn(page);
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  203  				goto undo;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  204  			}
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  205  		}
9b7ea46a82b31c Qian Cai          2019-03-28  206  	}
3fa0c7c79d2499 David Hildenbrand 2020-10-15  207  	return 0;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  208  undo:
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  209  	for (pfn = start_pfn;
dbc0e4cefd0038 KAMEZAWA Hiroyuki 2007-11-14  210  	     pfn < undo_pfn;
2ce13640b3f4c8 Michal Hocko      2017-07-06  211  	     pfn += pageblock_nr_pages) {
2ce13640b3f4c8 Michal Hocko      2017-07-06  212  		struct page *page = pfn_to_online_page(pfn);
2ce13640b3f4c8 Michal Hocko      2017-07-06  213  		if (!page)
2ce13640b3f4c8 Michal Hocko      2017-07-06  214  			continue;
2ce13640b3f4c8 Michal Hocko      2017-07-06  215  		unset_migratetype_isolate(page, migratetype);
2ce13640b3f4c8 Michal Hocko      2017-07-06  216  	}
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  217  
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  218  	return -EBUSY;
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  219  }
a5d76b54a3f3a4 KAMEZAWA Hiroyuki 2007-10-16  220  

:::::: The code at line 186 was first introduced by commit
:::::: a5d76b54a3f3a40385d7f76069a2feac9f1bad63 memory unplug: page isolation

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
