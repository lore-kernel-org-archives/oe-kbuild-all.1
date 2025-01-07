Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1A219AD70
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 21:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736287119; cv=none; b=MXSuhO9wUYJ04pXmGXqYCO3fN1UuX59Y5hFE0Ranu34MmUZtxi5C1eNiZlwlCXdyTmtUuhCPDUyuxX5ueHoZiUni3PN4xJZTEr+WKVzJANaeCrZql5cq3S7+1xMgHePwZxMBCVa7sCq+uMZXNUCDfHu8wLFIqxPs+V63YUncP/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736287119; c=relaxed/simple;
	bh=H7wJHh0/DSOR1TqRy/WOsvVQLNzkEuCkRTgYQay2KNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7YcFyT3EbSnVBw+lpmwgiYquvra0YnTJmSCAUdRuutZJnNDfT9pKuOjtcGeslr+HRcDdIn+Oq+N6KZu2aL0pTmjATLCrXr6z0ilzM1zaFqGk6ZUT8ZhmFQDLW6XUaFsIfM8mwSwNXHtD2fqSh6ITb5lIKRhgy1pOubfe/aWdSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHJVFzht; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHJVFzht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736287117; x=1767823117;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H7wJHh0/DSOR1TqRy/WOsvVQLNzkEuCkRTgYQay2KNo=;
  b=HHJVFzhtK4BNoyEWRqeLgduuaRs1QwdDlsMFhmqkPMIIx254n1fCC5Kj
   L3iahHmCwdIRnYtUAB5b4uzUrrjGaGUvUZp2ieg+1u9ozYEhz+TSLQNy1
   d+rJng1ZV2zuo+y9O8ul4AnfhoRiFO1Tf/eaZgteCt5F6sMWj253U5yvZ
   F+XX0SXTM5hyk2vM/ApyE67SOKDPDg8U/laV4TJYILPdgu7+0jPwnO37R
   fq23B+2taddUtNpMGxbVa5hWDKIwjeMnUueEhT2Kh1V3vbhEIVZyn7flW
   oc9g84g76z+883Vuk4DUCzVRbydPmtkoApHnsN5ZhpfLuX7eDLjpJyrU+
   Q==;
X-CSE-ConnectionGUID: 6gjUJqWiTpuc7aTf7mVZdA==
X-CSE-MsgGUID: bhYWGHTKRJ6nwHYg3Tcz5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47158970"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47158970"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 13:58:36 -0800
X-CSE-ConnectionGUID: Bb7cKi4GRl6QqektFwwpPA==
X-CSE-MsgGUID: tMTB+MgCSaWtCGUGJ40LVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103105871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 13:58:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVHaq-000FGB-2N;
	Tue, 07 Jan 2025 21:58:32 +0000
Date: Wed, 8 Jan 2025 05:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: kernel/power/snapshot.c:982: warning: Function parameter or struct
 member 'start_pfn' not described in 'register_nosave_region'
Message-ID: <202501080538.sini0wY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 33569ef3c754a82010f266b7b938a66a3ccf90a4 PM: hibernate: Remove register_nosave_region_late()
date:   2 years, 11 months ago
config: x86_64-randconfig-012-20241001 (https://download.01.org/0day-ci/archive/20250108/202501080538.sini0wY0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080538.sini0wY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080538.sini0wY0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/snapshot.c:330: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Data types related to memory bitmaps.
   kernel/power/snapshot.c:438: warning: Function parameter or struct member 'gfp_mask' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:438: warning: Function parameter or struct member 'safe_needed' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:438: warning: Function parameter or struct member 'ca' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:438: warning: Function parameter or struct member 'list' not described in 'alloc_rtree_node'
   kernel/power/snapshot.c:463: warning: Function parameter or struct member 'zone' not described in 'add_rtree_block'
   kernel/power/snapshot.c:463: warning: Function parameter or struct member 'gfp_mask' not described in 'add_rtree_block'
   kernel/power/snapshot.c:463: warning: Function parameter or struct member 'safe_needed' not described in 'add_rtree_block'
   kernel/power/snapshot.c:463: warning: Function parameter or struct member 'ca' not described in 'add_rtree_block'
   kernel/power/snapshot.c:536: warning: Function parameter or struct member 'gfp_mask' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:536: warning: Function parameter or struct member 'safe_needed' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:536: warning: Function parameter or struct member 'ca' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:536: warning: Function parameter or struct member 'start' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:536: warning: Function parameter or struct member 'end' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:571: warning: Function parameter or struct member 'zone' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:571: warning: Function parameter or struct member 'clear_nosave_free' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:678: warning: Function parameter or struct member 'bm' not described in 'memory_bm_create'
   kernel/power/snapshot.c:678: warning: Function parameter or struct member 'gfp_mask' not described in 'memory_bm_create'
   kernel/power/snapshot.c:678: warning: Function parameter or struct member 'safe_needed' not described in 'memory_bm_create'
   kernel/power/snapshot.c:720: warning: Function parameter or struct member 'clear_nosave_free' not described in 'memory_bm_free'
   kernel/power/snapshot.c:742: warning: Function parameter or struct member 'bm' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:742: warning: Function parameter or struct member 'pfn' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:742: warning: Function parameter or struct member 'addr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:742: warning: Function parameter or struct member 'bit_nr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:916: warning: expecting prototype for memory_bm_rtree_next_pfn(). Prototype was for memory_bm_next_pfn() instead
>> kernel/power/snapshot.c:982: warning: Function parameter or struct member 'start_pfn' not described in 'register_nosave_region'
>> kernel/power/snapshot.c:982: warning: Function parameter or struct member 'end_pfn' not described in 'register_nosave_region'
   kernel/power/snapshot.c:1254: warning: Function parameter or struct member 'zone' not described in 'saveable_highmem_page'
   kernel/power/snapshot.c:1254: warning: Function parameter or struct member 'pfn' not described in 'saveable_highmem_page'
   kernel/power/snapshot.c:1318: warning: Function parameter or struct member 'zone' not described in 'saveable_page'
   kernel/power/snapshot.c:1318: warning: Function parameter or struct member 'pfn' not described in 'saveable_page'
   kernel/power/snapshot.c:1389: warning: Function parameter or struct member 'dst' not described in 'safe_copy_page'
   kernel/power/snapshot.c:1389: warning: Function parameter or struct member 's_page' not described in 'safe_copy_page'
   kernel/power/snapshot.c:1602: warning: Function parameter or struct member 'x' not described in '__fraction'
   kernel/power/snapshot.c:1602: warning: Function parameter or struct member 'multiplier' not described in '__fraction'
   kernel/power/snapshot.c:1602: warning: Function parameter or struct member 'base' not described in '__fraction'
   kernel/power/snapshot.c:1893: warning: Function parameter or struct member 'nr_highmem' not described in 'count_pages_for_highmem'
   kernel/power/snapshot.c:1911: warning: Function parameter or struct member 'nr_pages' not described in 'enough_free_mem'
   kernel/power/snapshot.c:1911: warning: Function parameter or struct member 'nr_highmem' not described in 'enough_free_mem'
   kernel/power/snapshot.c:1934: warning: Function parameter or struct member 'safe_needed' not described in 'get_highmem_buffer'
   kernel/power/snapshot.c:1947: warning: Function parameter or struct member 'bm' not described in 'alloc_highmem_pages'
   kernel/power/snapshot.c:1947: warning: Function parameter or struct member 'nr_highmem' not described in 'alloc_highmem_pages'
   kernel/power/snapshot.c:1947: warning: expecting prototype for alloc_highmem_image_pages(). Prototype was for alloc_highmem_pages() instead
   kernel/power/snapshot.c:1982: warning: Function parameter or struct member 'copy_bm' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:1982: warning: Function parameter or struct member 'nr_pages' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:1982: warning: Function parameter or struct member 'nr_highmem' not described in 'swsusp_alloc'
   kernel/power/snapshot.c:2195: warning: Function parameter or struct member 'bm' not described in 'mark_unsafe_pages'
   kernel/power/snapshot.c:2230: warning: Function parameter or struct member 'info' not described in 'load_header'
   kernel/power/snapshot.c:2230: warning: expecting prototype for load header(). Prototype was for load_header() instead
   kernel/power/snapshot.c:2384: warning: Function parameter or struct member 'page' not described in 'get_highmem_page_buffer'
   kernel/power/snapshot.c:2384: warning: Function parameter or struct member 'ca' not described in 'get_highmem_page_buffer'
   kernel/power/snapshot.c:2569: warning: Function parameter or struct member 'bm' not described in 'get_buffer'
   kernel/power/snapshot.c:2569: warning: Function parameter or struct member 'ca' not described in 'get_buffer'
   kernel/power/snapshot.c:2693: warning: Function parameter or struct member 'handle' not described in 'snapshot_write_finalize'


vim +982 kernel/power/snapshot.c

307c5971c972ef Rafael J. Wysocki  2016-06-29   974  
74dfd666de861c Rafael J. Wysocki  2007-05-06   975  /**
ef96f639ea6634 Rafael J. Wysocki  2016-07-06   976   * register_nosave_region - Register a region of unsaveable memory.
ef96f639ea6634 Rafael J. Wysocki  2016-07-06   977   *
ef96f639ea6634 Rafael J. Wysocki  2016-07-06   978   * Register a range of page frames the contents of which should not be saved
ef96f639ea6634 Rafael J. Wysocki  2016-07-06   979   * during hibernation (to be used in the early initialization code).
74dfd666de861c Rafael J. Wysocki  2007-05-06   980   */
33569ef3c754a8 Amadeusz Sławiński 2022-01-19   981  void __init register_nosave_region(unsigned long start_pfn, unsigned long end_pfn)
74dfd666de861c Rafael J. Wysocki  2007-05-06  @982  {
74dfd666de861c Rafael J. Wysocki  2007-05-06   983  	struct nosave_region *region;
74dfd666de861c Rafael J. Wysocki  2007-05-06   984  
74dfd666de861c Rafael J. Wysocki  2007-05-06   985  	if (start_pfn >= end_pfn)
74dfd666de861c Rafael J. Wysocki  2007-05-06   986  		return;
74dfd666de861c Rafael J. Wysocki  2007-05-06   987  
74dfd666de861c Rafael J. Wysocki  2007-05-06   988  	if (!list_empty(&nosave_regions)) {
74dfd666de861c Rafael J. Wysocki  2007-05-06   989  		/* Try to extend the previous region (they should be sorted) */
74dfd666de861c Rafael J. Wysocki  2007-05-06   990  		region = list_entry(nosave_regions.prev,
74dfd666de861c Rafael J. Wysocki  2007-05-06   991  					struct nosave_region, list);
74dfd666de861c Rafael J. Wysocki  2007-05-06   992  		if (region->end_pfn == start_pfn) {
74dfd666de861c Rafael J. Wysocki  2007-05-06   993  			region->end_pfn = end_pfn;
74dfd666de861c Rafael J. Wysocki  2007-05-06   994  			goto Report;
74dfd666de861c Rafael J. Wysocki  2007-05-06   995  		}
74dfd666de861c Rafael J. Wysocki  2007-05-06   996  	}
74dfd666de861c Rafael J. Wysocki  2007-05-06   997  	/* This allocation cannot fail */
7e1c4e27928e5f Mike Rapoport      2018-10-30   998  	region = memblock_alloc(sizeof(struct nosave_region),
7e1c4e27928e5f Mike Rapoport      2018-10-30   999  				SMP_CACHE_BYTES);
8a7f97b902f4fb Mike Rapoport      2019-03-11  1000  	if (!region)
8a7f97b902f4fb Mike Rapoport      2019-03-11  1001  		panic("%s: Failed to allocate %zu bytes\n", __func__,
8a7f97b902f4fb Mike Rapoport      2019-03-11  1002  		      sizeof(struct nosave_region));
74dfd666de861c Rafael J. Wysocki  2007-05-06  1003  	region->start_pfn = start_pfn;
74dfd666de861c Rafael J. Wysocki  2007-05-06  1004  	region->end_pfn = end_pfn;
74dfd666de861c Rafael J. Wysocki  2007-05-06  1005  	list_add_tail(&region->list, &nosave_regions);
74dfd666de861c Rafael J. Wysocki  2007-05-06  1006   Report:
64ec72a1ece37d Joe Perches        2017-09-27  1007  	pr_info("Registered nosave memory: [mem %#010llx-%#010llx]\n",
cd38ca854de15b Bjorn Helgaas      2013-06-03  1008  		(unsigned long long) start_pfn << PAGE_SHIFT,
cd38ca854de15b Bjorn Helgaas      2013-06-03  1009  		((unsigned long long) end_pfn << PAGE_SHIFT) - 1);
74dfd666de861c Rafael J. Wysocki  2007-05-06  1010  }
74dfd666de861c Rafael J. Wysocki  2007-05-06  1011  

:::::: The code at line 982 was first introduced by commit
:::::: 74dfd666de861c97d47bdbd892f6d21b801d0247 swsusp: do not use page flags

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
