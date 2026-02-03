Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE833D3B3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147296; cv=none; b=qkc+bXAB/WnXvb9+AWqMyFLXiy6W5zX1QQlJ3VNEFFbCsSN85tL1vBeiwnsjGVrslvhF29NOvFJVNrortl6zRt9nHFE7Zrr8NivNBzrrKaqMAOm/H0FsjywptX9d/jXk4AgTkqerOVcJ5BlMLREMGaciICx3i5M9mm0f8R9ttXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147296; c=relaxed/simple;
	bh=DtUardcqV8auT5zwEESpXzFLhkjwAtLDCtUUTVcGVuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L+zinsFs30KFlBpQ8/Rd86U1c7skZMoYuQKfcOogwwy3z0UtdhmO4+iwwLzuqlp5A+f7NE8IDgjkVDrEPd0RkdXPYVUDg3VDcqTkaIuxdHK4OaBT/tiDmrwkcnqzkpIR8xFBmRu4LBrns1PIA8K6wfGZkuiOR+Ca6VnsJ+wqSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4/O1iYU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4/O1iYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770147294; x=1801683294;
  h=date:from:to:cc:subject:message-id;
  bh=DtUardcqV8auT5zwEESpXzFLhkjwAtLDCtUUTVcGVuo=;
  b=U4/O1iYUPNZHhKeYgbm2WviucdvV36Bgt6RqzYTs6JITdgI23GaHoiZB
   TSYqo/6ntvDUxrSc/g2OjDgRHZ9nrlaoQHsydx0XahMSrQ+O2wnuyddmO
   iSswDY77MsVnNqobPhfniVo9dzmNTArehIB39hZ/Ro9LwOxrBB8LOiLYU
   +45fYtQR0MOokuKI1m1T8VpbBY5mCvc0h2w7UmrhRW2o7ygq0hB9+d6QE
   mqwrBFU5rV5hMWQF85CHpnRLFw/FAibGWiTZz/4MnJ+gQ9a4FeHtB4yQ9
   M6zb8oULQmwESME/ZxNpT+73RdWX6/s3hsFWLxbPkkZe0CQI/o6Gh+ECs
   A==;
X-CSE-ConnectionGUID: /Jj6lDK+Tqe9RQRyrtBU7A==
X-CSE-MsgGUID: XKOMnUpKR+6FQ2FEkG8dDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82069215"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="82069215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 11:34:53 -0800
X-CSE-ConnectionGUID: G0D720ElQ7SnWR4yvfj/VQ==
X-CSE-MsgGUID: N25hypwcQ62FfVUU5n7ePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210064544"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2026 11:34:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnMAj-000000003SL-3qMT;
	Tue, 03 Feb 2026 19:34:49 +0000
Date: Tue, 03 Feb 2026 20:34:37 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/f2fs/data.c:2523:30: error: too many arguments to
 function 'fsverity_verify_page'
Message-ID: <202602032012.tpmpGBsg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-fsverity-tree/20260203-214224
head:   f616ce4610a093c31c591de82787e2f8f5bc9f6a
commit: f616ce4610a093c31c591de82787e2f8f5bc9f6a linux-next: build failure after merge of the fsverity tree
date:   6 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260203/202602032012.tpmpGBsg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032012.tpmpGBsg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032012.tpmpGBsg-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_read_data_large_folio':
   fs/f2fs/data.c:2523:51: error: passing argument 1 of 'fsverity_verify_page' from incompatible pointer type [-Wincompatible-pointer-types]
    2523 |                             !fsverity_verify_page(vi, folio_file_page(folio,
         |                                                   ^~
         |                                                   |
         |                                                   struct fsverity_info *
   In file included from fs/f2fs/f2fs.h:29,
                    from fs/f2fs/data.c:24:
   include/linux/fsverity.h:298:54: note: expected 'struct page *' but argument is of type 'struct fsverity_info *'
     298 | static inline bool fsverity_verify_page(struct page *page)
         |                                         ~~~~~~~~~~~~~^~~~
>> fs/f2fs/data.c:2523:30: error: too many arguments to function 'fsverity_verify_page'
    2523 |                             !fsverity_verify_page(vi, folio_file_page(folio,
         |                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/fsverity.h:298:20: note: declared here
     298 | static inline bool fsverity_verify_page(struct page *page)
         |                    ^~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/data.c:2555:57: error: passing argument 2 of 'f2fs_grab_read_bio' makes integer from pointer without a cast [-Wint-conversion]
    2555 |                         bio = f2fs_grab_read_bio(inode, vi, block_nr,
         |                                                         ^~
         |                                                         |
         |                                                         struct fsverity_info *
   fs/f2fs/data.c:1097:68: note: expected 'block_t' {aka 'unsigned int'} but argument is of type 'struct fsverity_info *'
    1097 | static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
         |                                                            ~~~~~~~~^~~~~~~
>> fs/f2fs/data.c:2555:31: error: too many arguments to function 'f2fs_grab_read_bio'
    2555 |                         bio = f2fs_grab_read_bio(inode, vi, block_nr,
         |                               ^~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:1097:20: note: declared here
    1097 | static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
         |                    ^~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c: In function 'f2fs_mpage_readpages':
>> fs/f2fs/data.c:2629:58: error: 'vi' undeclared (first use in this function)
    2629 |                 return f2fs_read_data_large_folio(inode, vi, rac, folio);
         |                                                          ^~
   fs/f2fs/data.c:2629:58: note: each undeclared identifier is reported only once for each function it appears in


vim +/fsverity_verify_page +2523 fs/f2fs/data.c

  2449	
  2450	static int f2fs_read_data_large_folio(struct inode *inode,
  2451			struct fsverity_info *vi,
  2452			struct readahead_control *rac, struct folio *folio)
  2453	{
  2454		struct bio *bio = NULL;
  2455		sector_t last_block_in_bio = 0;
  2456		struct f2fs_map_blocks map = {0, };
  2457		pgoff_t index, offset, next_pgofs = 0;
  2458		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2459					folio_nr_pages(folio);
  2460		unsigned nrpages;
  2461		struct f2fs_folio_state *ffs;
  2462		int ret = 0;
  2463		bool folio_in_bio;
  2464	
  2465		if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
  2466			if (folio)
  2467				folio_unlock(folio);
  2468			return -EOPNOTSUPP;
  2469		}
  2470	
  2471		map.m_seg_type = NO_CHECK_TYPE;
  2472	
  2473		if (rac)
  2474			folio = readahead_folio(rac);
  2475	next_folio:
  2476		if (!folio)
  2477			goto out;
  2478	
  2479		folio_in_bio = false;
  2480		index = folio->index;
  2481		offset = 0;
  2482		ffs = NULL;
  2483		nrpages = folio_nr_pages(folio);
  2484	
  2485		for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
  2486			sector_t block_nr;
  2487			/*
  2488			 * Map blocks using the previous result first.
  2489			 */
  2490			if (map.m_flags & F2FS_MAP_MAPPED) {
  2491				if (index > map.m_lblk &&
  2492					index < (map.m_lblk + map.m_len))
  2493					goto got_it;
  2494			} else if (index < next_pgofs) {
  2495				/* hole case */
  2496				goto got_it;
  2497			}
  2498	
  2499			/*
  2500			 * Then do more f2fs_map_blocks() calls until we are
  2501			 * done with this page.
  2502			 */
  2503			memset(&map, 0, sizeof(map));
  2504			map.m_next_pgofs = &next_pgofs;
  2505			map.m_seg_type = NO_CHECK_TYPE;
  2506			map.m_lblk = index;
  2507			map.m_len = max_nr_pages;
  2508	
  2509			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2510			if (ret)
  2511				goto err_out;
  2512	got_it:
  2513			if ((map.m_flags & F2FS_MAP_MAPPED)) {
  2514				block_nr = map.m_pblk + index - map.m_lblk;
  2515				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2516							DATA_GENERIC_ENHANCE_READ)) {
  2517					ret = -EFSCORRUPTED;
  2518					goto err_out;
  2519				}
  2520			} else {
  2521				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2522				if (f2fs_need_verity(inode, index) &&
> 2523				    !fsverity_verify_page(vi, folio_file_page(folio,
  2524									index))) {
  2525					ret = -EIO;
  2526					goto err_out;
  2527				}
  2528				continue;
  2529			}
  2530	
  2531			/* We must increment read_pages_pending before possible BIOs submitting
  2532			 * to prevent from premature folio_end_read() call on folio
  2533			 */
  2534			if (folio_test_large(folio)) {
  2535				ffs = ffs_find_or_alloc(folio);
  2536	
  2537				/* set the bitmap to wait */
  2538				spin_lock_irq(&ffs->state_lock);
  2539				ffs->read_pages_pending++;
  2540				spin_unlock_irq(&ffs->state_lock);
  2541			}
  2542	
  2543			/*
  2544			 * This page will go to BIO.  Do we need to send this
  2545			 * BIO off first?
  2546			 */
  2547			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2548							last_block_in_bio, block_nr) ||
  2549				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2550	submit_and_realloc:
  2551				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2552				bio = NULL;
  2553			}
  2554			if (bio == NULL)
> 2555				bio = f2fs_grab_read_bio(inode, vi, block_nr,
  2556						max_nr_pages,
  2557						f2fs_ra_op_flags(rac),
  2558						index, false);
  2559	
  2560			/*
  2561			 * If the page is under writeback, we need to wait for
  2562			 * its completion to see the correct decrypted data.
  2563			 */
  2564			f2fs_wait_on_block_writeback(inode, block_nr);
  2565	
  2566			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2567						offset << PAGE_SHIFT))
  2568				goto submit_and_realloc;
  2569	
  2570			folio_in_bio = true;
  2571			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2572			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2573					F2FS_BLKSIZE);
  2574			last_block_in_bio = block_nr;
  2575		}
  2576		trace_f2fs_read_folio(folio, DATA);
  2577	err_out:
  2578		if (!folio_in_bio) {
  2579			folio_end_read(folio, !ret);
  2580			if (ret)
  2581				return ret;
  2582		}
  2583		if (rac) {
  2584			folio = readahead_folio(rac);
  2585			goto next_folio;
  2586		}
  2587	out:
  2588		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2589		if (ret) {
  2590			/* Wait bios and clear uptodate. */
  2591			folio_lock(folio);
  2592			folio_clear_uptodate(folio);
  2593			folio_unlock(folio);
  2594		}
  2595		return ret;
  2596	}
  2597	
  2598	/*
  2599	 * This function was originally taken from fs/mpage.c, and customized for f2fs.
  2600	 * Major change was from block_size == page_size in f2fs by default.
  2601	 */
  2602	static int f2fs_mpage_readpages(struct inode *inode,
  2603			struct readahead_control *rac, struct folio *folio)
  2604	{
  2605		struct bio *bio = NULL;
  2606		sector_t last_block_in_bio = 0;
  2607		struct f2fs_map_blocks map;
  2608	#ifdef CONFIG_F2FS_FS_COMPRESSION
  2609		struct compress_ctx cc = {
  2610			.inode = inode,
  2611			.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
  2612			.cluster_size = F2FS_I(inode)->i_cluster_size,
  2613			.cluster_idx = NULL_CLUSTER,
  2614			.rpages = NULL,
  2615			.cpages = NULL,
  2616			.nr_rpages = 0,
  2617			.nr_cpages = 0,
  2618		};
  2619		pgoff_t nc_cluster_idx = NULL_CLUSTER;
  2620		pgoff_t index;
  2621	#endif
  2622		pgoff_t next_pgofs = 0;
  2623		unsigned nr_pages = rac ? readahead_count(rac) : 1;
  2624		struct address_space *mapping = rac ? rac->mapping : folio->mapping;
  2625		unsigned max_nr_pages = nr_pages;
  2626		int ret = 0;
  2627	
  2628		if (mapping_large_folio_support(mapping))
> 2629			return f2fs_read_data_large_folio(inode, vi, rac, folio);
  2630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
