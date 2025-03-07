Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DE18BC36
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 22:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741388184; cv=none; b=jSjxRWEBsNitXbguNDqlNG4ojpETsF/EE5TwKDTkB3xjEj8RTJCa0E3gp0yQOIpYg4b8aEbDPxCf+sZ+W7y7jDqAUOX9ZtYv7O7b5zmbb2m48crr6chvm8pEJ5UtxD9URIEM5KcZMI4gsz6ruS3+U1s29b8imk2zk2iaTJXiV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741388184; c=relaxed/simple;
	bh=XMgZyZCybN4cbdr0PFZWpeUlvibszcAUe3W9TUOxRc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IlX3lEoqIPdAbgTBjTJNJhR/pbZdK9sjc0DO1EeO9AaEw2I4V0jNm7OPgWISBZXhbn7YTisGm4T5aqNv5/h5ncQiDPUZlMXK8evCVK33mLDsjexPWxnWotdIE2uNgN5GVlfVK03jVTyD4ocB9X3Ny2y2I5aqn6SJFGNOajr4GWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/V36RgJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/V36RgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741388182; x=1772924182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMgZyZCybN4cbdr0PFZWpeUlvibszcAUe3W9TUOxRc0=;
  b=f/V36RgJS7/wCzuIXRj82/YmhfXZzBIapAmrMRy+QSOb2EaZ/MXawOgo
   dNeg1tiYhbpn6JoZYwDrqeBUeAtiwLdEsa7I874QVUlm2mMePv6QmFNV2
   dQ/3wjJ7yZc6vTIaeKrtG+DjiQbSkRR2+4sebaJlq/ZSWLv2o55HDu4hY
   NVFTysZmWmpQV8XJuc8cLiebb3CeyXWR2vBz1WmDy79VDyPMQqkCacxVC
   CgbeprCljiXWOFjcjIaPNqSFYhL8w/U49vG03izl4N+ODLBLHhGdQ4W0v
   sJA/M2sqfrCp/lJeKeUKoHjAj7gAEc4IBMVTixpou4GeB+V0lN7u1of02
   Q==;
X-CSE-ConnectionGUID: jHqQNt8yRoCQ7SfUBai9yQ==
X-CSE-MsgGUID: r9Tcy13vT4G/wk9bn8GKVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42157104"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="42157104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 14:56:22 -0800
X-CSE-ConnectionGUID: t7UfIMIgQ+iuaECbOc3CCQ==
X-CSE-MsgGUID: luvNMasmQM6mg644U4hHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119383323"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 14:56:21 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqgc6-00019b-0i;
	Fri, 07 Mar 2025 22:56:18 +0000
Date: Sat, 8 Mar 2025 06:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] mm/shmem.c:2361:1: warning:
 label 'alloced' defined but not used
Message-ID: <202503080631.JoKQrG7n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   68a380ba195d471b9ab81db23a5854289dd1c678
commit: add2b5a560c69b21c09e79e7d808ad0215c61797 [3/3] ANDROID: mm: shmem: add vendor hooks in shmem folio allocation path
config: i386-buildonly-randconfig-006-20250308 (https://download.01.org/0day-ci/archive/20250308/202503080631.JoKQrG7n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080631.JoKQrG7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080631.JoKQrG7n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_get_folio_gfp':
>> mm/shmem.c:2361:1: warning: label 'alloced' defined but not used [-Wunused-label]
    2361 | alloced:
         | ^~~~~~~
   mm/shmem.c: At top level:
>> mm/shmem.c:1644:14: warning: 'limit_gfp_mask' defined but not used [-Wunused-function]
    1644 | static gfp_t limit_gfp_mask(gfp_t huge_gfp, gfp_t limit_gfp)
         |              ^~~~~~~~~~~~~~


vim +/alloced +2361 mm/shmem.c

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2351  
e7a2ab7b3bb5d8 Baolin Wang             2024-06-11  2352  	folio = shmem_alloc_and_add_folio(vmf, gfp, inode, index, fault_mm, 0);
3022fd7af9604d Hugh Dickins            2023-09-29  2353  	if (IS_ERR(folio)) {
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2354) 		error = PTR_ERR(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  2355  		if (error == -EEXIST)
3022fd7af9604d Hugh Dickins            2023-09-29  2356  			goto repeat;
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2357) 		folio = NULL;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2358  		goto unlock;
779750d20b93bb Kirill A. Shutemov      2016-07-26  2359  	}
54af60421822bb Hugh Dickins            2011-08-03  2360  
3022fd7af9604d Hugh Dickins            2023-09-29 @2361  alloced:
1635f6a74152f1 Hugh Dickins            2012-05-29  2362  	alloced = true;
e7a2ab7b3bb5d8 Baolin Wang             2024-06-11  2363  	if (folio_test_large(folio) &&
779750d20b93bb Kirill A. Shutemov      2016-07-26  2364  	    DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE) <
de5b85262e2038 Hugh Dickins            2024-08-25  2365  					folio_next_index(folio)) {
3022fd7af9604d Hugh Dickins            2023-09-29  2366  		struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
3022fd7af9604d Hugh Dickins            2023-09-29  2367  		struct shmem_inode_info *info = SHMEM_I(inode);
779750d20b93bb Kirill A. Shutemov      2016-07-26  2368  		/*
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2369) 		 * Part of the large folio is beyond i_size: subject
779750d20b93bb Kirill A. Shutemov      2016-07-26  2370  		 * to shrink under memory pressure.
779750d20b93bb Kirill A. Shutemov      2016-07-26  2371  		 */
779750d20b93bb Kirill A. Shutemov      2016-07-26  2372  		spin_lock(&sbinfo->shrinklist_lock);
d041353dc98a63 Cong Wang               2017-08-10  2373  		/*
d041353dc98a63 Cong Wang               2017-08-10  2374  		 * _careful to defend against unlocked access to
d041353dc98a63 Cong Wang               2017-08-10  2375  		 * ->shrink_list in shmem_unused_huge_shrink()
d041353dc98a63 Cong Wang               2017-08-10  2376  		 */
d041353dc98a63 Cong Wang               2017-08-10  2377  		if (list_empty_careful(&info->shrinklist)) {
779750d20b93bb Kirill A. Shutemov      2016-07-26  2378  			list_add_tail(&info->shrinklist,
779750d20b93bb Kirill A. Shutemov      2016-07-26  2379  				      &sbinfo->shrinklist);
779750d20b93bb Kirill A. Shutemov      2016-07-26  2380  			sbinfo->shrinklist_len++;
779750d20b93bb Kirill A. Shutemov      2016-07-26  2381  		}
779750d20b93bb Kirill A. Shutemov      2016-07-26  2382  		spin_unlock(&sbinfo->shrinklist_lock);
779750d20b93bb Kirill A. Shutemov      2016-07-26  2383  	}
779750d20b93bb Kirill A. Shutemov      2016-07-26  2384  
3022fd7af9604d Hugh Dickins            2023-09-29  2385  	if (sgp == SGP_WRITE)
3022fd7af9604d Hugh Dickins            2023-09-29  2386  		folio_set_referenced(folio);
ec9516fbc5fa81 Hugh Dickins            2012-05-29  2387  	/*
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2388) 	 * Let SGP_FALLOC use the SGP_WRITE optimization on a new folio.
1635f6a74152f1 Hugh Dickins            2012-05-29  2389  	 */
1635f6a74152f1 Hugh Dickins            2012-05-29  2390  	if (sgp == SGP_FALLOC)
1635f6a74152f1 Hugh Dickins            2012-05-29  2391  		sgp = SGP_WRITE;
1635f6a74152f1 Hugh Dickins            2012-05-29  2392  clear:
1635f6a74152f1 Hugh Dickins            2012-05-29  2393  	/*
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2394) 	 * Let SGP_WRITE caller clear ends if write does not fill folio;
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2395) 	 * but SGP_FALLOC on a folio fallocated earlier must initialize
1635f6a74152f1 Hugh Dickins            2012-05-29  2396  	 * it now, lest undo on failure cancel our earlier guarantee.
ec9516fbc5fa81 Hugh Dickins            2012-05-29  2397  	 */
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2398) 	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2399) 		long i, n = folio_nr_pages(folio);
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  2400  
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2401) 		for (i = 0; i < n; i++)
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2402) 			clear_highpage(folio_page(folio, i));
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2403) 		flush_dcache_folio(folio);
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2404) 		folio_mark_uptodate(folio);
ec9516fbc5fa81 Hugh Dickins            2012-05-29  2405  	}
bde05d1ccd5126 Hugh Dickins            2012-05-29  2406  
54af60421822bb Hugh Dickins            2011-08-03  2407  	/* Perhaps the file has been truncated since we checked */
75edd345e8ede5 Hugh Dickins            2016-05-19  2408  	if (sgp <= SGP_CACHE &&
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  2409  	    ((loff_t)index << PAGE_SHIFT) >= i_size_read(inode)) {
54af60421822bb Hugh Dickins            2011-08-03  2410  		error = -EINVAL;
267a4c76bbdb95 Hugh Dickins            2015-12-11  2411  		goto unlock;
e83c32e8f92724 Hugh Dickins            2011-07-25  2412  	}
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  2413) out:
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2414) 	*foliop = folio;
54af60421822bb Hugh Dickins            2011-08-03  2415  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2416  
59a16ead572330 Hugh Dickins            2011-05-11  2417  	/*
54af60421822bb Hugh Dickins            2011-08-03  2418  	 * Error recovery.
59a16ead572330 Hugh Dickins            2011-05-11  2419  	 */
d189922862e03c Hugh Dickins            2012-07-11  2420  unlock:
3022fd7af9604d Hugh Dickins            2023-09-29  2421  	if (alloced)
3022fd7af9604d Hugh Dickins            2023-09-29  2422  		filemap_remove_folio(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  2423  	shmem_recalc_inode(inode, 0, 0);
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2424) 	if (folio) {
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2425) 		folio_unlock(folio);
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2426) 		folio_put(folio);
54af60421822bb Hugh Dickins            2011-08-03  2427  	}
54af60421822bb Hugh Dickins            2011-08-03  2428  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2429  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  2430  

:::::: The code at line 2361 was first introduced by commit
:::::: 3022fd7af9604d44ec43da8a4398872989599b18 shmem: _add_to_page_cache() before shmem_inode_acct_blocks()

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
