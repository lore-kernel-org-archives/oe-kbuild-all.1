Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3318DB1A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778918010; cv=none; b=N3n75v11SN0S/NaYX2XQ1mWEZbhvVB4/fuZzSjHhnBAr2Zkw9mhjCI3fKZYkUHpIPMomOwMvN1BwwrWZdMWLHKaH9D92CaHf8BXsy359GPiSxZpYOJW4tr1sQYGg63gBiiZUvAtMQlPxPKDZ5biEyZunuIyu7GM/cxgWOxsUanw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778918010; c=relaxed/simple;
	bh=UAPg9FVCMwf8YE9NO2naQwRqQrRNTEEsL8avAWPK/HE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I5c9SFUHQfAMSRVGXn+5slL4q75pfWSjSxxqkwJhXRb7T/EsBYNt4IfGbUoWEmt/XGE3jtzV+P/IcHDtMAaHylQCRIZgNwJv3oNGzATDo0lTPDT2TXQOMUagYDRS7Sw4AP2uE+0MZM5zL1BtXD20aUyCBoD7asvufZye/EGOvJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkvNcY+W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkvNcY+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778918009; x=1810454009;
  h=date:from:to:cc:subject:message-id;
  bh=UAPg9FVCMwf8YE9NO2naQwRqQrRNTEEsL8avAWPK/HE=;
  b=IkvNcY+WKUW+6m9l0Uo8U4s8wQw+Md7JaqSK93m81egVYSsLaxK5zJkB
   ocnckyY0oJ7XqqM6bpRwcqHGCJVjDQIOblGeqqeLCDWRWa0qCK8Lq8IeZ
   +AS3vcNZVYpjz3laJXjQcLrRX0AgTDWR0S78STuNCLwnr8LiyUiDD3P9r
   KP6BDwgkbI74LGooOHsQXdUSzFAHdRNYbSC3bzpyY/5TxPkDms0PNiLBz
   XUaGWs/kZZhusMca++NzIlTHjAR2v6N5ifA3PfDcPa1HundzbtOppOW94
   uIERarRZVtNIVKeIalTwGD8F0+vd1T9ih0IkwbahBha/bswYCmuC4XBuS
   Q==;
X-CSE-ConnectionGUID: LNFc28U2SfqA0fXc9DcyDg==
X-CSE-MsgGUID: YqNXB9KhQF2+ttJRZrrRlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="82425671"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="82425671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 00:53:28 -0700
X-CSE-ConnectionGUID: ZM9oxIFBQpSiHsUSsZnIKA==
X-CSE-MsgGUID: 0nkqLYmsQoGrIhfknNA+sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="235882330"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2026 00:53:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO9ps-000000009I9-2ALN;
	Sat, 16 May 2026 07:53:24 +0000
Date: Sat, 16 May 2026 09:52:59 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/zswap.c:1057:26: error: passing argument 1 of
 '__swap_writepage' from incompatible pointer type
Message-ID: <202605160929.4XRsoqEH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/mm-merge-writeout-into-pageout/20260516-003650
head:   dfa0de1c1f86f5c4e96d214b3549d4c5d3be0068
commit: b44db93170f358db8179510ea15bb73b2194941c mm/swap: intoduce struct swap_io_ctx
date:   15 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260516/202605160929.4XRsoqEH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160929.4XRsoqEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160929.4XRsoqEH-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_writeback_entry':
>> mm/zswap.c:1057:26: error: passing argument 1 of '__swap_writepage' from incompatible pointer type [-Wincompatible-pointer-types]
    1057 |         __swap_writepage(folio, NULL);
         |                          ^~~~~
         |                          |
         |                          struct folio *
   In file included from mm/zswap.c:40:
   mm/swap.h:226:43: note: expected 'struct swap_io_ctx *' but argument is of type 'struct folio *'
     226 | void __swap_writepage(struct swap_io_ctx *ctx, struct folio *folio);
         |                       ~~~~~~~~~~~~~~~~~~~~^~~


vim +/__swap_writepage +1057 mm/zswap.c

f91e81d31c1ef7 Johannes Weiner   2024-01-29   971  
9986d35d4ceb53 Johannes Weiner   2024-01-29   972  /*********************************
9986d35d4ceb53 Johannes Weiner   2024-01-29   973  * writeback code
9986d35d4ceb53 Johannes Weiner   2024-01-29   974  **********************************/
9986d35d4ceb53 Johannes Weiner   2024-01-29   975  /*
9986d35d4ceb53 Johannes Weiner   2024-01-29   976   * Attempts to free an entry by adding a folio to the swap cache,
9986d35d4ceb53 Johannes Weiner   2024-01-29   977   * decompressing the entry data into the folio, and issuing a
9986d35d4ceb53 Johannes Weiner   2024-01-29   978   * bio write to write the folio back to the swap device.
9986d35d4ceb53 Johannes Weiner   2024-01-29   979   *
9986d35d4ceb53 Johannes Weiner   2024-01-29   980   * This can be thought of as a "resumed writeback" of the folio
9986d35d4ceb53 Johannes Weiner   2024-01-29   981   * to the swap device.  We are basically resuming the same swap
9986d35d4ceb53 Johannes Weiner   2024-01-29   982   * writeback path that was intercepted with the zswap_store()
9986d35d4ceb53 Johannes Weiner   2024-01-29   983   * in the first place.  After the folio has been decompressed into
9986d35d4ceb53 Johannes Weiner   2024-01-29   984   * the swap cache, the compressed version stored by zswap can be
9986d35d4ceb53 Johannes Weiner   2024-01-29   985   * freed.
9986d35d4ceb53 Johannes Weiner   2024-01-29   986   */
9986d35d4ceb53 Johannes Weiner   2024-01-29   987  static int zswap_writeback_entry(struct zswap_entry *entry,
9986d35d4ceb53 Johannes Weiner   2024-01-29   988  				 swp_entry_t swpentry)
9986d35d4ceb53 Johannes Weiner   2024-01-29   989  {
796c2c23e14e75 Chris Li          2024-03-26   990  	struct xarray *tree;
796c2c23e14e75 Chris Li          2024-03-26   991  	pgoff_t offset = swp_offset(swpentry);
9986d35d4ceb53 Johannes Weiner   2024-01-29   992  	struct folio *folio;
9986d35d4ceb53 Johannes Weiner   2024-01-29   993  	struct mempolicy *mpol;
9986d35d4ceb53 Johannes Weiner   2024-01-29   994  	bool folio_was_allocated;
78524b05f1a3e1 Kairui Song       2025-03-14   995  	struct swap_info_struct *si;
ff22f9299d7b2c Nhat Pham         2025-03-06   996  	int ret = 0;
9986d35d4ceb53 Johannes Weiner   2024-01-29   997  
9986d35d4ceb53 Johannes Weiner   2024-01-29   998  	/* try to allocate swap cache folio */
78524b05f1a3e1 Kairui Song       2025-03-14   999  	si = get_swap_device(swpentry);
78524b05f1a3e1 Kairui Song       2025-03-14  1000  	if (!si)
78524b05f1a3e1 Kairui Song       2025-03-14  1001  		return -EEXIST;
78524b05f1a3e1 Kairui Song       2025-03-14  1002  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1003  	mpol = get_task_policy(current);
d7cf0d54f21087 Kairui Song       2025-12-20  1004  	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, mpol,
de85024b34839e Kairui Song       2025-12-20  1005  				       NO_INTERLEAVE_INDEX, &folio_was_allocated);
78524b05f1a3e1 Kairui Song       2025-03-14  1006  	put_swap_device(si);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1007  	if (!folio)
9986d35d4ceb53 Johannes Weiner   2024-01-29  1008  		return -ENOMEM;
9986d35d4ceb53 Johannes Weiner   2024-01-29  1009  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1010  	/*
9986d35d4ceb53 Johannes Weiner   2024-01-29  1011  	 * Found an existing folio, we raced with swapin or concurrent
9986d35d4ceb53 Johannes Weiner   2024-01-29  1012  	 * shrinker. We generally writeback cold folios from zswap, and
9986d35d4ceb53 Johannes Weiner   2024-01-29  1013  	 * swapin means the folio just became hot, so skip this folio.
9986d35d4ceb53 Johannes Weiner   2024-01-29  1014  	 * For unlikely concurrent shrinker case, it will be unlinked
9986d35d4ceb53 Johannes Weiner   2024-01-29  1015  	 * and freed when invalidated by the concurrent shrinker anyway.
9986d35d4ceb53 Johannes Weiner   2024-01-29  1016  	 */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1017  	if (!folio_was_allocated) {
ff22f9299d7b2c Nhat Pham         2025-03-06  1018  		ret = -EEXIST;
ff22f9299d7b2c Nhat Pham         2025-03-06  1019  		goto out;
9986d35d4ceb53 Johannes Weiner   2024-01-29  1020  	}
9986d35d4ceb53 Johannes Weiner   2024-01-29  1021  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1022  	/*
9986d35d4ceb53 Johannes Weiner   2024-01-29  1023  	 * folio is locked, and the swapcache is now secured against
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1024  	 * concurrent swapping to and from the slot, and concurrent
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1025  	 * swapoff so we can safely dereference the zswap tree here.
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1026  	 * Verify that the swap entry hasn't been invalidated and recycled
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1027  	 * behind our backs, to avoid overwriting a new swap folio with
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1028  	 * old compressed data. Only when this is successful can the entry
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1029  	 * be dereferenced.
9986d35d4ceb53 Johannes Weiner   2024-01-29  1030  	 */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1031  	tree = swap_zswap_tree(swpentry);
ff22f9299d7b2c Nhat Pham         2025-03-06  1032  	if (entry != xa_load(tree, offset)) {
ff22f9299d7b2c Nhat Pham         2025-03-06  1033  		ret = -ENOMEM;
ff22f9299d7b2c Nhat Pham         2025-03-06  1034  		goto out;
9986d35d4ceb53 Johannes Weiner   2024-01-29  1035  	}
9986d35d4ceb53 Johannes Weiner   2024-01-29  1036  
ff22f9299d7b2c Nhat Pham         2025-03-06  1037  	if (!zswap_decompress(entry, folio)) {
ff22f9299d7b2c Nhat Pham         2025-03-06  1038  		ret = -EIO;
ff22f9299d7b2c Nhat Pham         2025-03-06  1039  		goto out;
ff22f9299d7b2c Nhat Pham         2025-03-06  1040  	}
ff22f9299d7b2c Nhat Pham         2025-03-06  1041  
ff22f9299d7b2c Nhat Pham         2025-03-06  1042  	xa_erase(tree, offset);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1043  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1044  	count_vm_event(ZSWPWB);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1045  	if (entry->objcg)
e7ac4daeed91a2 Barry Song        2024-11-07  1046  		count_objcg_events(entry->objcg, ZSWPWB, 1);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1047  
a230c20e63efef Chengming Zhou    2024-02-04  1048  	zswap_entry_free(entry);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1049  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1050  	/* folio is up to date */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1051  	folio_mark_uptodate(folio);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1052  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1053  	/* move it to the tail of the inactive list after end_writeback */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1054  	folio_set_reclaim(folio);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1055  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1056  	/* start writeback */
2ba8ffcefe8124 Christoph Hellwig 2025-06-10 @1057  	__swap_writepage(folio, NULL);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1058  
ff22f9299d7b2c Nhat Pham         2025-03-06  1059  out:
ff22f9299d7b2c Nhat Pham         2025-03-06  1060  	if (ret && ret != -EEXIST) {
fd8d4f862f8c27 Kairui Song       2025-09-17  1061  		swap_cache_del_folio(folio);
ff22f9299d7b2c Nhat Pham         2025-03-06  1062  		folio_unlock(folio);
ff22f9299d7b2c Nhat Pham         2025-03-06  1063  	}
ff22f9299d7b2c Nhat Pham         2025-03-06  1064  	folio_put(folio);
ff22f9299d7b2c Nhat Pham         2025-03-06  1065  	return ret;
9986d35d4ceb53 Johannes Weiner   2024-01-29  1066  }
9986d35d4ceb53 Johannes Weiner   2024-01-29  1067  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
