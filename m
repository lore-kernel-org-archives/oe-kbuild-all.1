Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7C329E72
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403283; cv=none; b=aDVnaPVMIr9Fd4JcFK7Eyjq1WlyQDeKNTY2M8QzBe5sO1dF3Og65uvxpGT4w+HdmbSz/mlC6vr9q8E4134sP95gauTPDd3fLkB0k3SFHBSTEfR8RNRuAZKPhdNGLNZSNNLaRy2hP6ovgur7S44OpQf15dq/Dn6SzbA6uzshiZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403283; c=relaxed/simple;
	bh=xddu5jLbTIfasaxoRIZGeUAYd511d+5Ful9AqPt4qLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQuSPozV7Agx6/f5lNa7KDZJiU/SZQd/8+9/ZjnLQorxdoq+600NFPEdiJcRLo3u9sE67AFwwwwN6uOtohDVteBtlXfMbN0vW+CC9SIeuiADbx03gSpcatz44fQAEre7xYLuMSplgjHMkSkh5+Gi2sUnv4BmXSHzeCRY/Hse6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eM3LUdl2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eM3LUdl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765403282; x=1796939282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xddu5jLbTIfasaxoRIZGeUAYd511d+5Ful9AqPt4qLE=;
  b=eM3LUdl25e+3PM6qMhMbQeGuOlttxOu15oejJl+iAlw4ra47lwja9t4g
   o+JzqzmmNDH/rTZcqEfaehyXwlpbQ1vSDeNJ8JC7Vny4EKcq1WEpRxx54
   5fZyQysHw+PMOxx7WVC5T+OI0WRqiJeugjR5BU4v33MhS446JTVwH728k
   3sXKtclv5H+EUizILNxDK12yajzu2RiCIrtGSuBqdXGDa/FPsdANXNeOE
   WA9q58kPkmV0lFusEwYAetIkqaA14yaksNYjmjK1rYdMdkba2psUdsR65
   StFFSRNUb6KOwgqhURCiLdeKQYcAM3DYnIFKV72l4n14LHZaCpzKVTSSR
   Q==;
X-CSE-ConnectionGUID: ePRJlIsMSHOwzA+nli3Hwg==
X-CSE-MsgGUID: Z9usnehQQIK39zgUbIiDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78002268"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78002268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:47:59 -0800
X-CSE-ConnectionGUID: ahvZr2gvTEyi5nQF8jw7JA==
X-CSE-MsgGUID: SkaZLK2cTY63XGes8LnL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196680153"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 13:47:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTS2N-000000003nh-22SJ;
	Wed, 10 Dec 2025 21:47:55 +0000
Date: Thu, 11 Dec 2025 05:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 42/43] fs/f2fs/data.c:2415:39: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202512110537.xZUn29sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   13d355591b3e47aa8c2f9ee5e80cda47f3a8071d
commit: 45862c2acdb90a83a4c2cfec50251d55ebb5d42a [42/43] f2fs: support large folio for immutable non-compressed case
config: x86_64-randconfig-122-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110537.xZUn29sz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110537.xZUn29sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110537.xZUn29sz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/data.c:2415:39: sparse: sparse: Using plain integer as NULL pointer

vim +2415 fs/f2fs/data.c

  2409	
  2410	static int f2fs_read_data_large_folio(struct inode *inode,
  2411			struct readahead_control *rac, struct folio *folio)
  2412	{
  2413		struct bio *bio = NULL;
  2414		sector_t last_block_in_bio = 0;
> 2415		struct f2fs_map_blocks map = {0, };
  2416		pgoff_t index, offset;
  2417		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2418					folio_nr_pages(folio);
  2419		unsigned nrpages;
  2420		struct f2fs_folio_state *ffs;
  2421		int ret = 0;
  2422	
  2423		if (!IS_IMMUTABLE(inode))
  2424			return -EOPNOTSUPP;
  2425	
  2426		if (f2fs_compressed_file(inode))
  2427			return -EOPNOTSUPP;
  2428	
  2429		map.m_seg_type = NO_CHECK_TYPE;
  2430	
  2431		if (rac)
  2432			folio = readahead_folio(rac);
  2433	next_folio:
  2434		if (!folio)
  2435			goto out;
  2436	
  2437		index = folio->index;
  2438		offset = 0;
  2439		ffs = NULL;
  2440		nrpages = folio_nr_pages(folio);
  2441	
  2442		for (; nrpages; nrpages--) {
  2443			sector_t block_nr;
  2444			/*
  2445			 * Map blocks using the previous result first.
  2446			 */
  2447			if ((map.m_flags & F2FS_MAP_MAPPED) &&
  2448					index > map.m_lblk &&
  2449					index < (map.m_lblk + map.m_len))
  2450				goto got_it;
  2451	
  2452			/*
  2453			 * Then do more f2fs_map_blocks() calls until we are
  2454			 * done with this page.
  2455			 */
  2456			memset(&map, 0, sizeof(map));
  2457			map.m_seg_type = NO_CHECK_TYPE;
  2458			map.m_lblk = index;
  2459			map.m_len = max_nr_pages;
  2460	
  2461			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2462			if (ret)
  2463				goto err_out;
  2464	got_it:
  2465			if ((map.m_flags & F2FS_MAP_MAPPED)) {
  2466				block_nr = map.m_pblk + index - map.m_lblk;
  2467				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2468							DATA_GENERIC_ENHANCE_READ)) {
  2469					ret = -EFSCORRUPTED;
  2470					goto err_out;
  2471				}
  2472			} else {
  2473				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2474				if (f2fs_need_verity(inode, index) &&
  2475				    !fsverity_verify_page(folio_file_page(folio,
  2476									index))) {
  2477					ret = -EIO;
  2478					goto err_out;
  2479				}
  2480				continue;
  2481			}
  2482	
  2483			/*
  2484			 * This page will go to BIO.  Do we need to send this
  2485			 * BIO off first?
  2486			 */
  2487			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2488							last_block_in_bio, block_nr) ||
  2489				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2490	submit_and_realloc:
  2491				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2492				bio = NULL;
  2493			}
  2494			if (bio == NULL)
  2495				bio = f2fs_grab_read_bio(inode, block_nr,
  2496						max_nr_pages,
  2497						f2fs_ra_op_flags(rac),
  2498						index, false);
  2499	
  2500			/*
  2501			 * If the page is under writeback, we need to wait for
  2502			 * its completion to see the correct decrypted data.
  2503			 */
  2504			f2fs_wait_on_block_writeback(inode, block_nr);
  2505	
  2506			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2507						offset << PAGE_SHIFT))
  2508				goto submit_and_realloc;
  2509	
  2510			if (folio_test_large(folio)) {
  2511				ffs = ffs_find_or_alloc(folio);
  2512	
  2513				/* set the bitmap to wait */
  2514				spin_lock_irq(&ffs->state_lock);
  2515				ffs->read_pages_pending++;
  2516				spin_unlock_irq(&ffs->state_lock);
  2517			}
  2518	
  2519			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2520			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2521					F2FS_BLKSIZE);
  2522			last_block_in_bio = block_nr;
  2523			index++;
  2524			offset++;
  2525		}
  2526		if (rac) {
  2527			folio = readahead_folio(rac);
  2528			goto next_folio;
  2529		}
  2530	err_out:
  2531		/* Nothing was submitted. */
  2532		if (!bio) {
  2533			if (!ret)
  2534				folio_mark_uptodate(folio);
  2535			folio_unlock(folio);
  2536			return ret;
  2537		}
  2538	
  2539		if (ret) {
  2540			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2541	
  2542			/* Wait bios and clear uptodate. */
  2543			folio_lock(folio);
  2544			folio_clear_uptodate(folio);
  2545			folio_unlock(folio);
  2546		}
  2547	out:
  2548		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2549		return ret;
  2550	}
  2551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
