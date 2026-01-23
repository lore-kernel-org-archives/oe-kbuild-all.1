Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468D7396B72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 05:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769146305; cv=none; b=NDFD3+htfab8MASen+b+HERzOnhS69rBgcK9knU+GPuFOmHytAHaHd6ZNT5SdEkm0qo6AQvT/WvwnjtMQw79xd3FcwN6eaCteN/KPqvvadW0X2RctK5iQdIpQSViIaFZhg+Ww7GMyGV1DBCUEybiueYUyZwPU09dtMIXaWOIld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769146305; c=relaxed/simple;
	bh=f5SrFG6A2h9KT9dEVlbGP4dErF5eK8ev/7fJZ4vlIuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pjtFUCRNVLgKzlbpnF65MLvdbuPNlwXODP1XWyXTVLeLRqhuveFZE3j+qgGJdjMXGuSC0tvysLWyrwPmIu536ZdFR7Ow+VSQcFh3ZKQDARy449HJYjA72lPwD7FWc64eRq3PUvPQeIXhZv7q/9iPqOas2QKRCepVe0PlhbBZaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htFm2poZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htFm2poZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769146301; x=1800682301;
  h=date:from:to:cc:subject:message-id;
  bh=f5SrFG6A2h9KT9dEVlbGP4dErF5eK8ev/7fJZ4vlIuI=;
  b=htFm2poZnQZZnSHnFgRN/vj1qxZwHmYu7Z1HPYWJkMPosvt30BW1hMLk
   6Uw4SvL9d7p3DJ698Ju9zMk6jJ2ZkTM+QhxkKXNRrCLl/vPli2owVdGEp
   IQqI8N4PSBSDQTYftjF3Hg2Uao5yoUCBTMlSVyX/ydPwOCOYhrq9cfTmq
   J3hA1svPoV1hzxNvgTPOCvXr36jXtrmyj7qCbdNReqPhNiuaZurT7Cmd4
   1JmchIlVPhRH5WfZ3uXTREiN3F+brCzaCtqQtganJcR/cFcYxk0DY1Djq
   zhjgzWzHe/X5sSk8dU7gN7DT71wD/uuh3JdBMmju0zANg71eCqet78Qph
   w==;
X-CSE-ConnectionGUID: DrAq9ZWgRDqxgRG5nQvvcQ==
X-CSE-MsgGUID: Fpqi7Q/cTZ+XwyFKUd6M3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70563175"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70563175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 21:31:36 -0800
X-CSE-ConnectionGUID: FkM+Y42pSzSuiBj+il9C4Q==
X-CSE-MsgGUID: ueoEpgSYSFuMSo1hMpTQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211443434"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jan 2026 21:31:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj9lc-00000000TYW-0K7s;
	Fri, 23 Jan 2026 05:31:32 +0000
Date: Fri, 23 Jan 2026 13:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] mm/shmem.c:2567:1:
 warning: label 'alloced' defined but not used
Message-ID: <202601231340.wJ8qpZfF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   22d898bf7ba07008f717e5807c0a2e6b43c3c38b
commit: f7c3a55656ccd32a44f4bf8a142c84203095fad9 [1/1] ANDROID: mm: shmem: add vendor hooks in shmem folio allocation path
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260123/202601231340.wJ8qpZfF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231340.wJ8qpZfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231340.wJ8qpZfF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_get_folio_gfp':
>> mm/shmem.c:2567:1: warning: label 'alloced' defined but not used [-Wunused-label]
    2567 | alloced:
         | ^~~~~~~


vim +/alloced +2567 mm/shmem.c

c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2557  
e7a2ab7b3bb5d8 Baolin Wang             2024-06-11  2558  	folio = shmem_alloc_and_add_folio(vmf, gfp, inode, index, fault_mm, 0);
3022fd7af9604d Hugh Dickins            2023-09-29  2559  	if (IS_ERR(folio)) {
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2560) 		error = PTR_ERR(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  2561  		if (error == -EEXIST)
3022fd7af9604d Hugh Dickins            2023-09-29  2562  			goto repeat;
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2563) 		folio = NULL;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2564  		goto unlock;
779750d20b93bb Kiryl Shutsemau         2016-07-26  2565  	}
54af60421822bb Hugh Dickins            2011-08-03  2566  
3022fd7af9604d Hugh Dickins            2023-09-29 @2567  alloced:
1635f6a74152f1 Hugh Dickins            2012-05-29  2568  	alloced = true;
e7a2ab7b3bb5d8 Baolin Wang             2024-06-11  2569  	if (folio_test_large(folio) &&
779750d20b93bb Kiryl Shutsemau         2016-07-26  2570  	    DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE) <
de5b85262e2038 Hugh Dickins            2024-08-25  2571  					folio_next_index(folio)) {
3022fd7af9604d Hugh Dickins            2023-09-29  2572  		struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
3022fd7af9604d Hugh Dickins            2023-09-29  2573  		struct shmem_inode_info *info = SHMEM_I(inode);
779750d20b93bb Kiryl Shutsemau         2016-07-26  2574  		/*
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2575) 		 * Part of the large folio is beyond i_size: subject
779750d20b93bb Kiryl Shutsemau         2016-07-26  2576  		 * to shrink under memory pressure.
779750d20b93bb Kiryl Shutsemau         2016-07-26  2577  		 */
779750d20b93bb Kiryl Shutsemau         2016-07-26  2578  		spin_lock(&sbinfo->shrinklist_lock);
d041353dc98a63 Cong Wang               2017-08-10  2579  		/*
d041353dc98a63 Cong Wang               2017-08-10  2580  		 * _careful to defend against unlocked access to
d041353dc98a63 Cong Wang               2017-08-10  2581  		 * ->shrink_list in shmem_unused_huge_shrink()
d041353dc98a63 Cong Wang               2017-08-10  2582  		 */
d041353dc98a63 Cong Wang               2017-08-10  2583  		if (list_empty_careful(&info->shrinklist)) {
779750d20b93bb Kiryl Shutsemau         2016-07-26  2584  			list_add_tail(&info->shrinklist,
779750d20b93bb Kiryl Shutsemau         2016-07-26  2585  				      &sbinfo->shrinklist);
779750d20b93bb Kiryl Shutsemau         2016-07-26  2586  			sbinfo->shrinklist_len++;
779750d20b93bb Kiryl Shutsemau         2016-07-26  2587  		}
779750d20b93bb Kiryl Shutsemau         2016-07-26  2588  		spin_unlock(&sbinfo->shrinklist_lock);
779750d20b93bb Kiryl Shutsemau         2016-07-26  2589  	}
779750d20b93bb Kiryl Shutsemau         2016-07-26  2590  
3022fd7af9604d Hugh Dickins            2023-09-29  2591  	if (sgp == SGP_WRITE)
3022fd7af9604d Hugh Dickins            2023-09-29  2592  		folio_set_referenced(folio);
ec9516fbc5fa81 Hugh Dickins            2012-05-29  2593  	/*
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2594) 	 * Let SGP_FALLOC use the SGP_WRITE optimization on a new folio.
1635f6a74152f1 Hugh Dickins            2012-05-29  2595  	 */
1635f6a74152f1 Hugh Dickins            2012-05-29  2596  	if (sgp == SGP_FALLOC)
1635f6a74152f1 Hugh Dickins            2012-05-29  2597  		sgp = SGP_WRITE;
1635f6a74152f1 Hugh Dickins            2012-05-29  2598  clear:
1635f6a74152f1 Hugh Dickins            2012-05-29  2599  	/*
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2600) 	 * Let SGP_WRITE caller clear ends if write does not fill folio;
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2601) 	 * but SGP_FALLOC on a folio fallocated earlier must initialize
1635f6a74152f1 Hugh Dickins            2012-05-29  2602  	 * it now, lest undo on failure cancel our earlier guarantee.
ec9516fbc5fa81 Hugh Dickins            2012-05-29  2603  	 */
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2604) 	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2605) 		long i, n = folio_nr_pages(folio);
800d8c63b2e989 Kiryl Shutsemau         2016-07-26  2606  
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2607) 		for (i = 0; i < n; i++)
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2608) 			clear_highpage(folio_page(folio, i));
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2609) 		flush_dcache_folio(folio);
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2610) 		folio_mark_uptodate(folio);
ec9516fbc5fa81 Hugh Dickins            2012-05-29  2611  	}
bde05d1ccd5126 Hugh Dickins            2012-05-29  2612  
54af60421822bb Hugh Dickins            2011-08-03  2613  	/* Perhaps the file has been truncated since we checked */
75edd345e8ede5 Hugh Dickins            2016-05-19  2614  	if (sgp <= SGP_CACHE &&
09cbfeaf1a5a67 Kiryl Shutsemau         2016-04-01  2615  	    ((loff_t)index << PAGE_SHIFT) >= i_size_read(inode)) {
54af60421822bb Hugh Dickins            2011-08-03  2616  		error = -EINVAL;
267a4c76bbdb95 Hugh Dickins            2015-12-11  2617  		goto unlock;
e83c32e8f92724 Hugh Dickins            2011-07-25  2618  	}
63ec1973ddf3eb Matthew Wilcox (Oracle  2020-10-13  2619) out:
fc26babbc7d45a Matthew Wilcox (Oracle  2022-09-02  2620) 	*foliop = folio;
54af60421822bb Hugh Dickins            2011-08-03  2621  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2622  
59a16ead572330 Hugh Dickins            2011-05-11  2623  	/*
54af60421822bb Hugh Dickins            2011-08-03  2624  	 * Error recovery.
59a16ead572330 Hugh Dickins            2011-05-11  2625  	 */
d189922862e03c Hugh Dickins            2012-07-11  2626  unlock:
3022fd7af9604d Hugh Dickins            2023-09-29  2627  	if (alloced)
3022fd7af9604d Hugh Dickins            2023-09-29  2628  		filemap_remove_folio(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  2629  	shmem_recalc_inode(inode, 0, 0);
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2630) 	if (folio) {
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2631) 		folio_unlock(folio);
b1d0ec3a9a250b Matthew Wilcox (Oracle  2022-05-12  2632) 		folio_put(folio);
54af60421822bb Hugh Dickins            2011-08-03  2633  	}
54af60421822bb Hugh Dickins            2011-08-03  2634  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2635  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  2636  

:::::: The code at line 2567 was first introduced by commit
:::::: 3022fd7af9604d44ec43da8a4398872989599b18 shmem: _add_to_page_cache() before shmem_inode_acct_blocks()

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
