Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA42139B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383241; cv=none; b=CwA62pdEgGhmbimPqBuZZH5G18sk+3UmKVwDcYyo1PrZhuAk+ReW6gUmwDLNbMd9VKP2rKyXMkT63esLpPC5yUNsGNPEI33X3sFYvFOF5jhEgwTDtDIb06XNt0lIifMrElObTtk2ffIAxPjxNrXiVeU/TXAxh+0ZrqEnldtyrzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383241; c=relaxed/simple;
	bh=vkSn0OBHg2sntAj73riGGvaed3+xO+KSNQ+LDTdAglU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bHYsHlqIU9IdzlyNJDbVxceDjJFDv0HEAvinBf8M6PN5eVvsBlcIEaYGAPGfX+f7L4zfLmKFtGVhFCZISYW06ZQ5r2twy0E7eNck/8G22JiOQdwLHCSbnLNjJM9GrEpZ4ge2iY1dwP4uuz6djQsoL6GiLk7WjXlpdIrVR9ZfjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQVy7Ac2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQVy7Ac2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748383240; x=1779919240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkSn0OBHg2sntAj73riGGvaed3+xO+KSNQ+LDTdAglU=;
  b=dQVy7Ac28IkATBBMB3b05d1t7PE2mal7x8cv4BDcWA8+ll62ZRau3xFu
   VCPAYzFEx5JCHTSXiVFVt+oZvEDR2weOX9NdHMzfgZpa3gUofgrOulP+S
   t8GxXZdsMGfvDagwhAEHIVMJC2PPqRe+Ih87tE/tkS2F9IR0qbrgeQ5Qv
   vg7YlWsfmHh5MMHqT0/DRltzgv1iEACd/gQoHolhKWz0vPt83hjqWTawU
   5aLdxcjX61zKAO/Yl9ioRKN/Fv+nb+LJbuB5AJNQPuoFtmrJ5y8EdFiHt
   7d/YjGMdcwC5m3xPCpIBpXMR4zfSrgqkGVI2nB3Qj3otLyIFPHT96zNoE
   g==;
X-CSE-ConnectionGUID: 61cISdl3QIOxPPsalAgwcg==
X-CSE-MsgGUID: wNJqiBt3QWWS/hu35D0Ivg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61053326"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61053326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:00:37 -0700
X-CSE-ConnectionGUID: 2vQksFI4TDmeBnJDDAoCag==
X-CSE-MsgGUID: ziEgdg/7SseAle2mzPAhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="146869414"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 May 2025 15:00:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK2LZ-000V2S-2I;
	Tue, 27 May 2025 22:00:33 +0000
Date: Wed, 28 May 2025 05:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] mm/page_isolation.c:186:
 warning: Function parameter or member 'failed_pfn' not described in
 'start_isolate_page_range'
Message-ID: <202505280550.Y1yC8icQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   14f411bb7352f0fa2c69841b8c2ed1584f9db6de
commit: 60d2dad38e3dce7359b318c436dd06e5a55da15a [0/1] ANDROID: mm: cma: skip problematic pageblock
config: x86_64-buildonly-randconfig-003-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280550.Y1yC8icQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280550.Y1yC8icQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280550.Y1yC8icQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_isolation.c:186: warning: Function parameter or member 'failed_pfn' not described in 'start_isolate_page_range'


vim +186 mm/page_isolation.c

a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  141  
9b7ea46a82b31c7 Qian Cai          2019-03-28  142  /**
9b7ea46a82b31c7 Qian Cai          2019-03-28  143   * start_isolate_page_range() - make page-allocation-type of range of pages to
9b7ea46a82b31c7 Qian Cai          2019-03-28  144   * be MIGRATE_ISOLATE.
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  145   * @start_pfn:		The lower PFN of the range to be isolated.
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  146   * @end_pfn:		The upper PFN of the range to be isolated.
9b7ea46a82b31c7 Qian Cai          2019-03-28  147   *			start_pfn/end_pfn must be aligned to pageblock_order.
9b7ea46a82b31c7 Qian Cai          2019-03-28  148   * @migratetype:	Migrate type to set in error recovery.
9b7ea46a82b31c7 Qian Cai          2019-03-28  149   * @flags:		The following flags are allowed (they can be combined in
9b7ea46a82b31c7 Qian Cai          2019-03-28  150   *			a bit mask)
756d25be457fc54 David Hildenbrand 2019-11-30  151   *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
756d25be457fc54 David Hildenbrand 2019-11-30  152   *					 e.g., skip over PageHWPoison() pages
aa218795cb5fd58 David Hildenbrand 2020-05-07  153   *					 and PageOffline() pages.
9b7ea46a82b31c7 Qian Cai          2019-03-28  154   *			REPORT_FAILURE - report details about the failure to
9b7ea46a82b31c7 Qian Cai          2019-03-28  155   *			isolate the range
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  156   *
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  157   * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  158   * the range will never be allocated. Any free pages and pages freed in the
9b7ea46a82b31c7 Qian Cai          2019-03-28  159   * future will not be allocated again. If specified range includes migrate types
9b7ea46a82b31c7 Qian Cai          2019-03-28  160   * other than MOVABLE or CMA, this will fail with -EBUSY. For isolating all
9b7ea46a82b31c7 Qian Cai          2019-03-28  161   * pages in the range finally, the caller have to free all pages in the range.
9b7ea46a82b31c7 Qian Cai          2019-03-28  162   * test_page_isolated() can be used for test it.
2c7452a075d4db2 Mike Kravetz      2018-04-05  163   *
2c7452a075d4db2 Mike Kravetz      2018-04-05  164   * There is no high level synchronization mechanism that prevents two threads
2c7452a075d4db2 Mike Kravetz      2018-04-05  165   * from trying to isolate overlapping ranges. If this happens, one thread
2c7452a075d4db2 Mike Kravetz      2018-04-05  166   * will notice pageblocks in the overlapping range already set to isolate.
2c7452a075d4db2 Mike Kravetz      2018-04-05  167   * This happens in set_migratetype_isolate, and set_migratetype_isolate
2c7452a075d4db2 Mike Kravetz      2018-04-05  168   * returns an error. We then clean up by restoring the migration type on
2c7452a075d4db2 Mike Kravetz      2018-04-05  169   * pageblocks we may have modified and return -EBUSY to caller. This
2c7452a075d4db2 Mike Kravetz      2018-04-05  170   * prevents two threads from simultaneously working on overlapping ranges.
9b7ea46a82b31c7 Qian Cai          2019-03-28  171   *
9683182612214aa Pavel Tatashin    2020-09-18  172   * Please note that there is no strong synchronization with the page allocator
9683182612214aa Pavel Tatashin    2020-09-18  173   * either. Pages might be freed while their page blocks are marked ISOLATED.
7612921f2376d51 Vlastimil Babka   2020-12-14  174   * A call to drain_all_pages() after isolation can flush most of them. However
7612921f2376d51 Vlastimil Babka   2020-12-14  175   * in some cases pages might still end up on pcp lists and that would allow
9683182612214aa Pavel Tatashin    2020-09-18  176   * for their allocation even when they are in fact isolated already. Depending
ec6e8c7e03147c6 Vlastimil Babka   2020-12-14  177   * on how strong of a guarantee the caller needs, zone_pcp_disable/enable()
ec6e8c7e03147c6 Vlastimil Babka   2020-12-14  178   * might be used to flush and disable pcplist before isolation and enable after
ec6e8c7e03147c6 Vlastimil Babka   2020-12-14  179   * unisolation.
9683182612214aa Pavel Tatashin    2020-09-18  180   *
3fa0c7c79d2499a David Hildenbrand 2020-10-15  181   * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  182   */
0815f3d81d76dfb Michal Nazarewicz 2012-04-03  183  int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
60d2dad38e3dce7 Minchan Kim       2021-06-29  184  			     unsigned migratetype, int flags,
60d2dad38e3dce7 Minchan Kim       2021-06-29  185  			     unsigned long *failed_pfn)
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16 @186  {
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  187  	unsigned long pfn;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  188  	unsigned long undo_pfn;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  189  	struct page *page;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  190  
fec174d6699e2e3 Naoya Horiguchi   2016-01-14  191  	BUG_ON(!IS_ALIGNED(start_pfn, pageblock_nr_pages));
fec174d6699e2e3 Naoya Horiguchi   2016-01-14  192  	BUG_ON(!IS_ALIGNED(end_pfn, pageblock_nr_pages));
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  193  
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  194  	for (pfn = start_pfn;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  195  	     pfn < end_pfn;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  196  	     pfn += pageblock_nr_pages) {
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  197  		page = __first_valid_page(pfn, pageblock_nr_pages);
9b7ea46a82b31c7 Qian Cai          2019-03-28  198  		if (page) {
9b7ea46a82b31c7 Qian Cai          2019-03-28  199  			if (set_migratetype_isolate(page, migratetype, flags)) {
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  200  				undo_pfn = pfn;
60d2dad38e3dce7 Minchan Kim       2021-06-29  201  				if (failed_pfn)
60d2dad38e3dce7 Minchan Kim       2021-06-29  202  					*failed_pfn = page_to_pfn(page);
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  203  				goto undo;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  204  			}
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  205  		}
9b7ea46a82b31c7 Qian Cai          2019-03-28  206  	}
3fa0c7c79d2499a David Hildenbrand 2020-10-15  207  	return 0;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  208  undo:
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  209  	for (pfn = start_pfn;
dbc0e4cefd00383 KAMEZAWA Hiroyuki 2007-11-14  210  	     pfn < undo_pfn;
2ce13640b3f4c87 Michal Hocko      2017-07-06  211  	     pfn += pageblock_nr_pages) {
2ce13640b3f4c87 Michal Hocko      2017-07-06  212  		struct page *page = pfn_to_online_page(pfn);
2ce13640b3f4c87 Michal Hocko      2017-07-06  213  		if (!page)
2ce13640b3f4c87 Michal Hocko      2017-07-06  214  			continue;
2ce13640b3f4c87 Michal Hocko      2017-07-06  215  		unset_migratetype_isolate(page, migratetype);
2ce13640b3f4c87 Michal Hocko      2017-07-06  216  	}
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  217  
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  218  	return -EBUSY;
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  219  }
a5d76b54a3f3a40 KAMEZAWA Hiroyuki 2007-10-16  220  

:::::: The code at line 186 was first introduced by commit
:::::: a5d76b54a3f3a40385d7f76069a2feac9f1bad63 memory unplug: page isolation

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
