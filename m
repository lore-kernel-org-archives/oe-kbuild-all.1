Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B10544AB8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738661; cv=none; b=hKKMzVLcNKKgvb379R9fk8zB5XMyiWuhwLsCd87xLpxr3atM0PnA+XvQHRqsIsbqyxcpJpu0U6fzMjdAizeOwN3uEkbyWZYhzzPgBZoXSiHyrxZRTMNGHlVh5OJ42VCM0sFQQb/Wq+zrSgnwVY+0EeRBs4NU5ZQke+zeHuoZNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738661; c=relaxed/simple;
	bh=671dB4KRPNQNoEgoo+0e4zEIp2EFirwB/COOxnzK8zY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tXlAkRVc80tPT3yjEjzsGHx15D+hJaQNWbTH6J8XAROJsoxy2EMXTBUmAFK+z0mel5hmbZEdfYWR1xnRreJzJf+PMb3XHdXtYD9RWyhgVHedQDlXQdu93/LK4VhIfaNkfOT8UafifUxTOKCh13WwTJ0pb93Izej2yBP+8Y2tz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B78immUo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B78immUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784738653; x=1816274653;
  h=date:from:to:cc:subject:message-id;
  bh=671dB4KRPNQNoEgoo+0e4zEIp2EFirwB/COOxnzK8zY=;
  b=B78immUo5x8Rq1Jl9MkDg+eC6xx3NmRjqowTIPmp/tfmCGRKk5GN2euv
   60270Q70eLpyKtf65ThTuL/4aZDvPEniUyI1MOzjXJyPBv1/U0FZUN71q
   9QZAZwwmgDCgV0qpuJTRhf2puM2cnOxZXDc+vnC5tpAeBcuMLv09oyeEU
   +aN0OVxk2UK2OlrHIvrYwV6b8PjkRf8A9hpzdH8sOWVFFp+fVpctkM9TF
   Cck4NZ1/NN8lSKJEAccWI40DrGVlvN8lJCdzlAfKUGBRUh0AkgAMPzN3v
   n+ff9W2A8S+3k2pxUtguafGQiTxpp+F36hFFAqe189aOM0JGhP7hMFkNy
   A==;
X-CSE-ConnectionGUID: LUKT5i5GQJqb4ys/VhprLw==
X-CSE-MsgGUID: 8n/gHSGSQxaOCl44X4v9YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85252953"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85252953"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 09:44:09 -0700
X-CSE-ConnectionGUID: B6JsOa+SQpizBtuBt7E/Vw==
X-CSE-MsgGUID: xEIXPMu2TgyC0sf48ND4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="296354133"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jul 2026 09:44:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wma37-00000000Ytd-015P;
	Wed, 22 Jul 2026 16:44:01 +0000
Date: Thu, 23 Jul 2026 00:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_ops-updates 2/3] mm/zswap.c:995:16: error:
 variable 'ctx' has initializer but incomplete type
Message-ID: <202607230027.7UY9zyzI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_ops-updates
head:   c80bf0cb4ab741f6c6dfac1d8c61e52b2c8a8491
commit: 8932d7f3e323ba9d8369a069dfd84acedb24c598 [2/3] mm/swap: add a new swap_ops.h header to allow for pluggable swap ops
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260723/202607230027.7UY9zyzI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230027.7UY9zyzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607230027.7UY9zyzI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_writeback_entry':
>> mm/zswap.c:995:16: error: variable 'ctx' has initializer but incomplete type
     995 |         struct swap_io_ctx ctx = {};
         |                ^~~~~~~~~~~
>> mm/zswap.c:995:28: error: storage size of 'ctx' isn't known
     995 |         struct swap_io_ctx ctx = {};
         |                            ^~~
>> mm/zswap.c:995:28: warning: unused variable 'ctx' [-Wunused-variable]


vim +/ctx +995 mm/zswap.c

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
78524b05f1a3e1 Kairui Song       2025-03-14   994  	struct swap_info_struct *si;
215fbe95e12f08 Christoph Hellwig 2026-07-13  @995  	struct swap_io_ctx ctx = {};
ff22f9299d7b2c Nhat Pham         2025-03-06   996  	int ret = 0;
9986d35d4ceb53 Johannes Weiner   2024-01-29   997  
9986d35d4ceb53 Johannes Weiner   2024-01-29   998  	/* try to allocate swap cache folio */
78524b05f1a3e1 Kairui Song       2025-03-14   999  	si = get_swap_device(swpentry);
78524b05f1a3e1 Kairui Song       2025-03-14  1000  	if (!si)
78524b05f1a3e1 Kairui Song       2025-03-14  1001  		return -EEXIST;
78524b05f1a3e1 Kairui Song       2025-03-14  1002  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1003  	mpol = get_task_policy(current);
e1e6750df3b473 Kairui Song       2026-05-17  1004  	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
a2e61ffb47493f Kairui Song       2026-05-17  1005  				       NO_INTERLEAVE_INDEX);
78524b05f1a3e1 Kairui Song       2025-03-14  1006  	put_swap_device(si);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1007  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1008  	/*
a2e61ffb47493f Kairui Song       2026-05-17  1009  	 * Swap cache allocation might fail due to OOM, or the entry
a2e61ffb47493f Kairui Song       2026-05-17  1010  	 * may already be cached due to concurrent swapin or have been
a2e61ffb47493f Kairui Song       2026-05-17  1011  	 * freed. If already cached, a concurrent swapin made the folio
a2e61ffb47493f Kairui Song       2026-05-17  1012  	 * hot, so skip it. For the unlikely concurrent shrinker case,
a2e61ffb47493f Kairui Song       2026-05-17  1013  	 * it will be unlinked and freed when invalidated anyway.
9986d35d4ceb53 Johannes Weiner   2024-01-29  1014  	 */
a2e61ffb47493f Kairui Song       2026-05-17  1015  	if (IS_ERR(folio))
a2e61ffb47493f Kairui Song       2026-05-17  1016  		return PTR_ERR(folio);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1017  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1018  	/*
9986d35d4ceb53 Johannes Weiner   2024-01-29  1019  	 * folio is locked, and the swapcache is now secured against
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1020  	 * concurrent swapping to and from the slot, and concurrent
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1021  	 * swapoff so we can safely dereference the zswap tree here.
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1022  	 * Verify that the swap entry hasn't been invalidated and recycled
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1023  	 * behind our backs, to avoid overwriting a new swap folio with
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1024  	 * old compressed data. Only when this is successful can the entry
f9c0f1c32cb568 Chengming Zhou    2024-02-04  1025  	 * be dereferenced.
9986d35d4ceb53 Johannes Weiner   2024-01-29  1026  	 */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1027  	tree = swap_zswap_tree(swpentry);
ff22f9299d7b2c Nhat Pham         2025-03-06  1028  	if (entry != xa_load(tree, offset)) {
ff22f9299d7b2c Nhat Pham         2025-03-06  1029  		ret = -ENOMEM;
ff22f9299d7b2c Nhat Pham         2025-03-06  1030  		goto out;
9986d35d4ceb53 Johannes Weiner   2024-01-29  1031  	}
9986d35d4ceb53 Johannes Weiner   2024-01-29  1032  
ff22f9299d7b2c Nhat Pham         2025-03-06  1033  	if (!zswap_decompress(entry, folio)) {
ff22f9299d7b2c Nhat Pham         2025-03-06  1034  		ret = -EIO;
ff22f9299d7b2c Nhat Pham         2025-03-06  1035  		goto out;
ff22f9299d7b2c Nhat Pham         2025-03-06  1036  	}
ff22f9299d7b2c Nhat Pham         2025-03-06  1037  
ff22f9299d7b2c Nhat Pham         2025-03-06  1038  	xa_erase(tree, offset);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1039  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1040  	count_vm_event(ZSWPWB);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1041  	if (entry->objcg)
e7ac4daeed91a2 Barry Song        2024-11-07  1042  		count_objcg_events(entry->objcg, ZSWPWB, 1);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1043  
a230c20e63efef Chengming Zhou    2024-02-04  1044  	zswap_entry_free(entry);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1045  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1046  	/* folio is up to date */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1047  	folio_mark_uptodate(folio);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1048  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1049  	/* move it to the tail of the inactive list after end_writeback */
9986d35d4ceb53 Johannes Weiner   2024-01-29  1050  	folio_set_reclaim(folio);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1051  
9986d35d4ceb53 Johannes Weiner   2024-01-29  1052  	/* start writeback */
215fbe95e12f08 Christoph Hellwig 2026-07-13  1053  	__swap_writepage(&ctx, folio);
215fbe95e12f08 Christoph Hellwig 2026-07-13  1054  	swap_write_submit(&ctx);
9986d35d4ceb53 Johannes Weiner   2024-01-29  1055  
ff22f9299d7b2c Nhat Pham         2025-03-06  1056  out:
a2e61ffb47493f Kairui Song       2026-05-17  1057  	if (ret) {
fd8d4f862f8c27 Kairui Song       2025-09-17  1058  		swap_cache_del_folio(folio);
ff22f9299d7b2c Nhat Pham         2025-03-06  1059  		folio_unlock(folio);
ff22f9299d7b2c Nhat Pham         2025-03-06  1060  	}
ff22f9299d7b2c Nhat Pham         2025-03-06  1061  	folio_put(folio);
ff22f9299d7b2c Nhat Pham         2025-03-06  1062  	return ret;
9986d35d4ceb53 Johannes Weiner   2024-01-29  1063  }
9986d35d4ceb53 Johannes Weiner   2024-01-29  1064  

:::::: The code at line 995 was first introduced by commit
:::::: 215fbe95e12f086dd301d3353ecac8ac95d15ce1 mm/swap: introduce struct swap_io_ctx

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
