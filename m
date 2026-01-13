Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6982FD689
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768333665; cv=none; b=HBfEYuvaiT45taW4YhVGfMeCeFJcj5e2YNlaIQzaKGeNM5qK6UhJpE+XJzWkCzhgiCX9Om8UNR2JXwolkpjgDsjlWRIBB91fPHmkWyS5TbCWKMVPsfdnMFJtiddg2VEpBI5MVFgMK2y2ujqdbFo1/Eum/4xqu1lPVxzqHZBFAG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768333665; c=relaxed/simple;
	bh=qxmHdKHCIu14utVCPo5GsYAQ2YqqZdIlOq3eMH5gX6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oFhJvKEiTBfT4LfAtN2ue92tll00/sYFTuiPHGPC2Ph+g2VGs6w71oPYP85vJuO6Lofdux89Va2gsDwciG1B4lM56dgLyGARMSwkB2QlvGunl35XUKhuIQF8YNZvLWqfjaLCliCveFDxHyCF7bI/9Tx8yPKEXiC0STw8xWIybGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJNqE6Mn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJNqE6Mn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768333663; x=1799869663;
  h=date:from:to:cc:subject:message-id;
  bh=qxmHdKHCIu14utVCPo5GsYAQ2YqqZdIlOq3eMH5gX6A=;
  b=SJNqE6MnI//Yp3FUgRmAwlexQquCNRQW62je2Rq4GwqObzXl5r28iG9m
   Pc2fw8esSIQGPtHDW/Dk8fkQuFIwaicVI5LwwvWjlQAzVi3yUaJAK8gpZ
   76oY0ULcQwq7QluM6Z9AWGeVUBBUlptp+z5a0pqOkMCqmoMAeberbXO1g
   sP+M/89WSqgJPKZrm7dOEpihynuCS+bhOVZ/FhvhDA+3CDIIjmi/xkB9T
   3OAiw4W+Zgc+XJ7IH8d5D5M0BrmRZP8FYMC2Ek3zfBIOIDuGEqYF2V2Z3
   SdprjHluhDrf1wQSStZLXbfgPfSPW9O+4Afhemi50ACDDkeZzOlJB2pj7
   w==;
X-CSE-ConnectionGUID: JvgAonqYTi6Apk81mD1jEg==
X-CSE-MsgGUID: WipTcziURfCcKRY4j6bnDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68834353"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68834353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:47:43 -0800
X-CSE-ConnectionGUID: 7v4vRwnZQKmp2f+NS0UhgA==
X-CSE-MsgGUID: OL5nw5m0QOCscMIX0Z9TpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204263531"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 11:47:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkMc-00000000FIR-2bIf;
	Tue, 13 Jan 2026 19:47:38 +0000
Date: Wed, 14 Jan 2026 03:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 1/43] fs/f2fs/data.c:2406:39: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202601140305.KrgvXyN6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   96bc5abf22b2308817c557c08d6cffff9607955f
commit: 05e65c14ea59a401cec4284e9d612f9d5dc1b3f8 [1/43] f2fs: support large folio for immutable non-compressed case
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140305.KrgvXyN6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140305.KrgvXyN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140305.KrgvXyN6-lkp@intel.com/

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
