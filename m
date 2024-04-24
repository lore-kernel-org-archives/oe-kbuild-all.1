Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9414D2B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713933120; cv=none; b=lcQN/ZNNgArgegybvMEy4RT92tdJoqq5Q3LdRNULcBN5Cis6X8T9/KgLMLjaUwXg5wfJAFQ/dFnmDbGoN3Iw4EAMzkRtuz46O78kDkrlna2o+pCAspNoJCGuWoSYTLI5a+XnosC+sADgiZRcM+bDIbRtAKnE2heKOOfMl1KHWeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713933120; c=relaxed/simple;
	bh=vBpcok+w895ApjtRYNLrU0n1sAdZHMapcgCJu9aFmoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pt2H7ADq3UOIS/wytkxgX/23bvx2pwcQ+rAdDI8rey2XoM0fwy6NQYBabCO4BCCp9sebt4n6rN87Q8YwU63m79Ul3B4artEoJwfA08T/RxcHW4N7p2dpdyYKncb2jO9Mi99bm7+LWwewlbZLZ/wloJnz1E0x6/JG+bG6RPp5ZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzwqsQrg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzwqsQrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713933119; x=1745469119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBpcok+w895ApjtRYNLrU0n1sAdZHMapcgCJu9aFmoM=;
  b=MzwqsQrgx533SkzOcymxBXbnT/d2ZPVOL2IsB/uZyEyTp0A3ZtwYUn2N
   Rk0qzft1mHQhK2BMHnPuD+JyyDCa0bJXDRHfUKdFJSqMC6gUh0Im4glVh
   kNSvyLpjqjWNQGIgOD03nUWV7tPOHKQhf+5UyHzPKWwfwwbnjA98hIuY1
   kcMciDHzNtNVcMahIc+JWoYJtNg51B3wbohUdEqz2JnqL2E/S/B/PJxq2
   jFD0DH+957kIlz8M5ymxQbcF9zGGm44PgPJa818hr8y9C+XnedrEuYC1X
   qXNYOT00+nKDDNtaW1OQYauYCojTQT2TPiQYyTpTHJgUFyAxjkTQyFI1j
   A==;
X-CSE-ConnectionGUID: x2T2aK5ER/WRyiwVd0D6yA==
X-CSE-MsgGUID: ichf/tZMR+OEbf3BNYALcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9373842"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9373842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 21:31:58 -0700
X-CSE-ConnectionGUID: syp/LhP9TKW39RKHHf6AtA==
X-CSE-MsgGUID: fuyC4vu1SBWOtmNoH09w3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="25097706"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2024 21:31:57 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzUIU-0000rQ-2v;
	Wed, 24 Apr 2024 04:31:54 +0000
Date: Wed, 24 Apr 2024 12:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20240423-lbs-works 19/19] mm/truncate.c:242:25: error:
 passing argument 1 of 'split_folio_to_list' from incompatible pointer type
Message-ID: <202404241229.IF1571U5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20240423-lbs-works
head:   9cf528e9795349b84e2be8f2d01b234877894980
commit: 9cf528e9795349b84e2be8f2d01b234877894980 [19/19] mm: split a folio in minimum folio order chunks
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240424/202404241229.IF1571U5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241229.IF1571U5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241229.IF1571U5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:1114,
                    from arch/openrisc/include/asm/cacheflush.h:17,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/backing-dev.h:16,
                    from mm/truncate.c:12:
   mm/truncate.c: In function 'truncate_inode_partial_folio':
>> mm/truncate.c:242:25: error: passing argument 1 of 'split_folio_to_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
     242 |         if (split_folio(folio) == 0)
         |                         ^~~~~
         |                         |
         |                         struct folio *
   include/linux/huge_mm.h:90:44: note: in definition of macro 'split_folio'
      90 | #define split_folio(f) split_folio_to_list(f, NULL)
         |                                            ^
   include/linux/huge_mm.h:438:52: note: expected 'struct page *' but argument is of type 'struct folio *'
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                       ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
--
   mm/vmscan.c: In function 'shrink_folio_list':
>> mm/vmscan.c:1213:65: error: passing argument 1 of 'split_folio_to_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1213 |                                             split_folio_to_list(folio,
         |                                                                 ^~~~~
         |                                                                 |
         |                                                                 struct folio *
   In file included from include/linux/mm.h:1114,
                    from mm/vmscan.c:15:
   include/linux/huge_mm.h:438:52: note: expected 'struct page *' but argument is of type 'struct folio *'
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                       ~~~~~~~~~~~~~^~~~
   mm/vmscan.c:1221:65: error: passing argument 1 of 'split_folio_to_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1221 |                                         if (split_folio_to_list(folio,
         |                                                                 ^~~~~
         |                                                                 |
         |                                                                 struct folio *
   include/linux/huge_mm.h:438:52: note: expected 'struct page *' but argument is of type 'struct folio *'
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                       ~~~~~~~~~~~~~^~~~
   mm/vmscan.c:1235:49: error: passing argument 1 of 'split_folio_to_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1235 |                         if (split_folio_to_list(folio, folio_list))
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct folio *
   include/linux/huge_mm.h:438:52: note: expected 'struct page *' but argument is of type 'struct folio *'
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                       ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/mm.h:1114,
                    from include/linux/mman.h:5,
                    from mm/madvise.c:9:
   mm/madvise.c: In function 'madvise_cold_or_pageout_pte_range':
>> mm/madvise.c:466:43: error: passing argument 1 of 'split_folio_to_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
     466 |                         err = split_folio(folio);
         |                                           ^~~~~
         |                                           |
         |                                           struct folio *
   include/linux/huge_mm.h:90:44: note: in definition of macro 'split_folio'
      90 | #define split_folio(f) split_folio_to_list(f, NULL)
         |                                            ^
   include/linux/huge_mm.h:438:52: note: expected 'struct page *' but argument is of type 'struct folio *'
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                       ~~~~~~~~~~~~~^~~~
   mm/madvise.c: In function 'madvise_free_pte_range':
   mm/madvise.c:688:43: error: passing argument 1 of 'split_folio_to_list' from incompatible pointer type [-Werror=incompatible-pointer-types]
     688 |                         err = split_folio(folio);
         |                                           ^~~~~
         |                                           |
         |                                           struct folio *
   include/linux/huge_mm.h:90:44: note: in definition of macro 'split_folio'
      90 | #define split_folio(f) split_folio_to_list(f, NULL)
         |                                            ^
   include/linux/huge_mm.h:438:52: note: expected 'struct page *' but argument is of type 'struct folio *'
     438 | static inline int split_folio_to_list(struct page *page, struct list_head *list)
         |                                       ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/split_folio_to_list +242 mm/truncate.c

750b4987b0cd4d4 Nicholas Piggin         2009-09-16  198  
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  199) /*
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  200)  * Handle partial folios.  The folio may be entirely within the
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  201)  * range if a split has raced with us.  If not, we zero the part of the
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  202)  * folio that's within the [start, end] range, and then split the folio if
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  203)  * it's large.  split_page_range() will discard pages which now lie beyond
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  204)  * i_size, and we rely on the caller to discard pages which lie within a
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  205)  * newly created hole.
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  206)  *
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  207)  * Returns false if splitting failed so the caller can avoid
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  208)  * discarding the entire folio which is stubbornly unsplit.
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  209)  */
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  210) bool truncate_inode_partial_folio(struct folio *folio, loff_t start, loff_t end)
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  211) {
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  212) 	loff_t pos = folio_pos(folio);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  213) 	unsigned int offset, length;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  214) 
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  215) 	if (pos < start)
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  216) 		offset = start - pos;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  217) 	else
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  218) 		offset = 0;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  219) 	length = folio_size(folio);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  220) 	if (pos + length <= (u64)end)
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  221) 		length = length - offset;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  222) 	else
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  223) 		length = end + 1 - pos - offset;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  224) 
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  225) 	folio_wait_writeback(folio);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  226) 	if (length == folio_size(folio)) {
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  227) 		truncate_inode_folio(folio->mapping, folio);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  228) 		return true;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  229) 	}
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  230) 
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  231) 	/*
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  232) 	 * We may be zeroing pages we're about to discard, but it avoids
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  233) 	 * doing a complex calculation here, and then doing the zeroing
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  234) 	 * anyway if the page split fails.
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  235) 	 */
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  236) 	folio_zero_range(folio, offset, length);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  237) 
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  238) 	if (folio_has_private(folio))
5ad6b2bdaaea712 Matthew Wilcox (Oracle  2022-02-09  239) 		folio_invalidate(folio, offset, length);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  240) 	if (!folio_test_large(folio))
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  241) 		return true;
d788f5b374c2ba2 Matthew Wilcox (Oracle  2022-09-02 @242) 	if (split_folio(folio) == 0)
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  243) 		return true;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  244) 	if (folio_test_dirty(folio))
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  245) 		return false;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  246) 	truncate_inode_folio(folio->mapping, folio);
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  247) 	return true;
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  248) }
b9a8a4195c7d3a5 Matthew Wilcox (Oracle  2020-05-27  249) 

:::::: The code at line 242 was first introduced by commit
:::::: d788f5b374c2ba204fed57e39acf2452acc24812 mm: add split_folio()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
