Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268F27EFE3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771203616; cv=none; b=g/ew2sRa2yEDGRVzgpr8XpInM1HQ+RWDGr/6Tt9/ydTK/gBhkiSJ6gqYjlohe+LIofkNofjxpAiv4tKar2d7HJ1N1j8scF/MScew0qg7iGpKBcyDmWtfgbSN9pN72zn2sHEoutGAPbPh1vt1O6DmZMRioIYcWFzb7FDcnmHgnHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771203616; c=relaxed/simple;
	bh=yD7vqX060HZ+mZUhQ5iGttCZL4CDsEzRiUAvY7B8Np0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PYWNlOlL62LPSXtr9KGntLCwNcOc4DBEMFRDSrEzRcCjgQ/gvdth6qeVmRJjigByzanMm2EeIMQOeolOZWesmVfvBiic/qQRbLlLJ1e4NY0BkQN+3qh4EFRT21AILUwSlOB5/nbIvGoeiFwSkq5rekzzmiFFDALIDDt880O/McU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6WgNHWJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6WgNHWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771203614; x=1802739614;
  h=date:from:to:cc:subject:message-id;
  bh=yD7vqX060HZ+mZUhQ5iGttCZL4CDsEzRiUAvY7B8Np0=;
  b=a6WgNHWJvWJGhFLu6YWzrSCXMiQ9aDFkOAPi9qw46MW3XeqOOGETRSEC
   9NpWmvAEuMi5rEV3O22A4MxVbY8ryrawzUNdOS+/Sqs+E2uOWm37/q9wK
   JX/yF75ytPp41tHRUszo3HAdnQ7U5Z2lwdsV5VrB1kON4ZWO9wo8SK+k6
   vJukehlCRuagxAj1u1E0EKsvDbGEgzaBKBtlR4kb/VeeSC2diRSuJA9nd
   /ckL6UkZQCsFym+SlFzW0pR9gRxok3nvBH/juk8IqvDinAxfqI3sPK5Ud
   aiYz1rFhk8sWj1pwo1OmkK6u+uegj2tEvTcARjpGyj4OOrl3QIujZT55n
   g==;
X-CSE-ConnectionGUID: +a3hfa5SSYy8e5QXf5CUdg==
X-CSE-MsgGUID: wPlX6dg2TTqgzoHoGyRK/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72190172"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72190172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:00:14 -0800
X-CSE-ConnectionGUID: WQPiIK/cRKWYwHbqNVZfEQ==
X-CSE-MsgGUID: eKH2GPLyQIeCdaFzyMpBzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212705554"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Feb 2026 17:00:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrmy9-00000000zHU-2ycv;
	Mon, 16 Feb 2026 01:00:09 +0000
Date: Mon, 16 Feb 2026 08:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Chao Yu <chao@kernel.org>
Subject: fs/f2fs/data.c:2406:39: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202602160813.wQNfgNwj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: 05e65c14ea59a401cec4284e9d612f9d5dc1b3f8 f2fs: support large folio for immutable non-compressed case
date:   9 weeks ago
config: sparc64-randconfig-r122-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160813.wQNfgNwj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160813.wQNfgNwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160813.wQNfgNwj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/data.c:2406:39: sparse: sparse: Using plain integer as NULL pointer

vim +2406 fs/f2fs/data.c

  2400	
  2401	static int f2fs_read_data_large_folio(struct inode *inode,
  2402			struct readahead_control *rac, struct folio *folio)
  2403	{
  2404		struct bio *bio = NULL;
  2405		sector_t last_block_in_bio = 0;
> 2406		struct f2fs_map_blocks map = {0, };
  2407		pgoff_t index, offset;
  2408		unsigned max_nr_pages = rac ? readahead_count(rac) :
  2409					folio_nr_pages(folio);
  2410		unsigned nrpages;
  2411		struct f2fs_folio_state *ffs;
  2412		int ret = 0;
  2413	
  2414		if (!IS_IMMUTABLE(inode))
  2415			return -EOPNOTSUPP;
  2416	
  2417		if (f2fs_compressed_file(inode))
  2418			return -EOPNOTSUPP;
  2419	
  2420		map.m_seg_type = NO_CHECK_TYPE;
  2421	
  2422		if (rac)
  2423			folio = readahead_folio(rac);
  2424	next_folio:
  2425		if (!folio)
  2426			goto out;
  2427	
  2428		index = folio->index;
  2429		offset = 0;
  2430		ffs = NULL;
  2431		nrpages = folio_nr_pages(folio);
  2432	
  2433		for (; nrpages; nrpages--) {
  2434			sector_t block_nr;
  2435			/*
  2436			 * Map blocks using the previous result first.
  2437			 */
  2438			if ((map.m_flags & F2FS_MAP_MAPPED) &&
  2439					index > map.m_lblk &&
  2440					index < (map.m_lblk + map.m_len))
  2441				goto got_it;
  2442	
  2443			/*
  2444			 * Then do more f2fs_map_blocks() calls until we are
  2445			 * done with this page.
  2446			 */
  2447			memset(&map, 0, sizeof(map));
  2448			map.m_seg_type = NO_CHECK_TYPE;
  2449			map.m_lblk = index;
  2450			map.m_len = max_nr_pages;
  2451	
  2452			ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
  2453			if (ret)
  2454				goto err_out;
  2455	got_it:
  2456			if ((map.m_flags & F2FS_MAP_MAPPED)) {
  2457				block_nr = map.m_pblk + index - map.m_lblk;
  2458				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
  2459							DATA_GENERIC_ENHANCE_READ)) {
  2460					ret = -EFSCORRUPTED;
  2461					goto err_out;
  2462				}
  2463			} else {
  2464				folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
  2465				if (f2fs_need_verity(inode, index) &&
  2466				    !fsverity_verify_page(folio_file_page(folio,
  2467									index))) {
  2468					ret = -EIO;
  2469					goto err_out;
  2470				}
  2471				continue;
  2472			}
  2473	
  2474			/*
  2475			 * This page will go to BIO.  Do we need to send this
  2476			 * BIO off first?
  2477			 */
  2478			if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
  2479							last_block_in_bio, block_nr) ||
  2480				!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
  2481	submit_and_realloc:
  2482				f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2483				bio = NULL;
  2484			}
  2485			if (bio == NULL)
  2486				bio = f2fs_grab_read_bio(inode, block_nr,
  2487						max_nr_pages,
  2488						f2fs_ra_op_flags(rac),
  2489						index, false);
  2490	
  2491			/*
  2492			 * If the page is under writeback, we need to wait for
  2493			 * its completion to see the correct decrypted data.
  2494			 */
  2495			f2fs_wait_on_block_writeback(inode, block_nr);
  2496	
  2497			if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
  2498						offset << PAGE_SHIFT))
  2499				goto submit_and_realloc;
  2500	
  2501			if (folio_test_large(folio)) {
  2502				ffs = ffs_find_or_alloc(folio);
  2503	
  2504				/* set the bitmap to wait */
  2505				spin_lock_irq(&ffs->state_lock);
  2506				ffs->read_pages_pending++;
  2507				spin_unlock_irq(&ffs->state_lock);
  2508			}
  2509	
  2510			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
  2511			f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
  2512					F2FS_BLKSIZE);
  2513			last_block_in_bio = block_nr;
  2514			index++;
  2515			offset++;
  2516		}
  2517		if (rac) {
  2518			folio = readahead_folio(rac);
  2519			goto next_folio;
  2520		}
  2521	err_out:
  2522		/* Nothing was submitted. */
  2523		if (!bio) {
  2524			if (!ret)
  2525				folio_mark_uptodate(folio);
  2526			folio_unlock(folio);
  2527			return ret;
  2528		}
  2529	
  2530		if (ret) {
  2531			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2532	
  2533			/* Wait bios and clear uptodate. */
  2534			folio_lock(folio);
  2535			folio_clear_uptodate(folio);
  2536			folio_unlock(folio);
  2537		}
  2538	out:
  2539		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
  2540		return ret;
  2541	}
  2542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
