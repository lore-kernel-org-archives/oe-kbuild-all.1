Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831232D7BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 00:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782433361; cv=none; b=T25pvQdmSYR8hVwYjJm4u2Eamc0PctTA0rgz+uiA63XsTnbeXEQhQE3WNXuhxwUzV2AZpi+NacH19E8GYVBBHwyL6ciDuzOvpAr6y51UyEUuczBEI8j28NZXPsyUA2pBofTlPeeIUXbCnxsNkmBTORfVXGBgJbDCkBpdrnyDDbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782433361; c=relaxed/simple;
	bh=rTYFDnWDGaMvBtbtmEnAD/lY/AzhYjhcF5A1qxqyA2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UjUjY35lAEDbzGsGF7Pz/olbjfFiADkZNJUaKSxivbwXIQXVmVfPjbtzwUQmdGmvWv1BCQqTyHpIgHlyy08TL1ModU1GD0R1JhsvpF6qKS0Bed580zetbD4Dt08qCHYBiDaeEHgqFxvdg6brrdWg3gKTYT274DjcB2KIiwcIYhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDOZDOrl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDOZDOrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782433359; x=1813969359;
  h=date:from:to:cc:subject:message-id;
  bh=rTYFDnWDGaMvBtbtmEnAD/lY/AzhYjhcF5A1qxqyA2Q=;
  b=oDOZDOrlBZL+TNfBtyffPxKkeGwBxLUFfNIFmTKl5M7Hev3rqon1IWj2
   p9FtxcfljKewM5StaLw5Z6y+TXEwSSsrtzT6vug5+xvaxYbFn6qWAQRL3
   /i8Sk9sXjKfhj6FrJHMz96YbyhiChFTMSoAcQOrc/Y7O6FX9kagzZwpnC
   5L8v7Mtec2sOf4+bu13CJ58QGX+UeCnawBhLQAXuk1x6Jv2ijkghz2GmZ
   qLdmJmuwHgoUOUPSLwlIfhL4XtuEyWa72DtxzDPOuHWj/Ok0u01reC9X2
   OKIp8KZXI0T2tlqUG/mK1dM43IJJfeR7FBB7riCfK0ixVG9hZrRgRce9R
   g==;
X-CSE-ConnectionGUID: LKt7n+RBSmyK+qjpUd4DTQ==
X-CSE-MsgGUID: yUmAebOBQfq+PE3h/mKusg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="94619707"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="94619707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 17:22:39 -0700
X-CSE-ConnectionGUID: QQdBLJm4SIWteMzJhtAJfg==
X-CSE-MsgGUID: H/rf2XVXR6W90MHdpBAoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="251823323"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2026 17:22:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcuL4-000000004fn-47fk;
	Fri, 26 Jun 2026 00:22:34 +0000
Date: Fri, 26 Jun 2026 08:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 902/1155]
 fs/bcachefs/alloc/foreground.c:367:1: warning: the frame size of 1296 bytes
 is larger than 1280 bytes
Message-ID: <202606260834.mODQmopR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 906e2e30b6d9cc3e4e8293f8d758e9ff8dc3d8aa [902/1155] bcachefs: fix __bch2_trans_iter_init() ip parameter
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260626/202606260834.mODQmopR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606260834.mODQmopR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606260834.mODQmopR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/foreground.c: In function 'bch2_bucket_alloc_early':
>> fs/bcachefs/alloc/foreground.c:367:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     367 | }
         | ^
--
   fs/bcachefs/fs/check_extents.c: In function 'overlapping_extents_found':
>> fs/bcachefs/fs/check_extents.c:258:1: warning: the frame size of 1400 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     258 | }
         | ^
--
   fs/bcachefs/fs/dirent.c: In function 'bch2_fsck_remove_dirent':
>> fs/bcachefs/fs/dirent.c:688:1: warning: the frame size of 1312 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     688 | }
         | ^
--
   fs/bcachefs/snapshots/subvolume.c: In function 'check_subvol':
>> fs/bcachefs/snapshots/subvolume.c:165:1: warning: the frame size of 1408 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     165 | }
         | ^


vim +367 fs/bcachefs/alloc/foreground.c

f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  280  
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  281  /*
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  282   * This path is for before the freespace btree is initialized:
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  283   */
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  284  static noinline struct open_bucket *
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  285  bch2_bucket_alloc_early(struct btree_trans *trans,
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  286  			struct alloc_request *req,
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  287  			struct closure *cl)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  288  {
fbd152bf946987 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-12-06  289  	struct bch_fs *c = trans->c;
e038213658f09b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  290  	struct bch_dev *ca = req->ca;
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  291  	struct bkey_s_c k;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  292  	struct open_bucket *ob = NULL;
828552ca74a458 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-11-24  293  	u64 first_bucket = ca->mi.first_bucket;
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  294  	u64 *dev_alloc_cursor = &ca->alloc_cursor[req->btree_bitmap];
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  295  	u64 alloc_start = max(first_bucket, *dev_alloc_cursor);
e0fb0dccfd6fd8 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  296  	u64 alloc_cursor = alloc_start;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  297  	int ret;
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  298  
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  299  	/*
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  300  	 * Scan with an uncached iterator to avoid polluting the key cache. An
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  301  	 * uncached iter will return a cached key if one exists, but if not
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  302  	 * there is no other underlying protection for the associated key cache
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  303  	 * slot. To avoid racing bucket allocations, look up the cached key slot
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  304  	 * of any likely allocation candidate before attempting to proceed with
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  305  	 * the allocation. This provides proper exclusion on the associated
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  306  	 * bucket.
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  307  	 */
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  308  again:
db346e7120a6de fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-07-17  309  	for_each_btree_key_norestart(trans, iter, BTREE_ID_alloc, POS(ca->dev_idx, alloc_cursor),
5dd8c60e1e0448 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-07  310  			   BTREE_ITER_slots, k, ret) {
f6ecd9850b5e0b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  311  		u64 bucket = alloc_cursor = k.k->p.offset;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  312  
e88a75ebe86c1d fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-11-24  313  		if (bkey_ge(k.k->p, POS(ca->dev_idx, ca->mi.nbuckets)))
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  314  			break;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  315  
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  316  		if (req->btree_bitmap != BTREE_BITMAP_ANY &&
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  317  		    req->btree_bitmap != bch2_dev_btree_bitmap_marked_sectors(ca,
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  318  				bucket_to_sector(ca, bucket), ca->mi.bucket_size)) {
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  319  			if (req->btree_bitmap == BTREE_BITMAP_YES &&
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  320  			    bucket_to_sector(ca, bucket) > 64ULL << ca->mi.btree_bitmap_shift)
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  321  				break;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  322  
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  323  			bucket = sector_to_bucket(ca,
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  324  					round_up(bucket_to_sector(ca, bucket) + 1,
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  325  						 1ULL << ca->mi.btree_bitmap_shift));
7c84dc243819ab fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  326  			bch2_btree_iter_set_pos(&iter, POS(ca->dev_idx, bucket));
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  327  			req->counters.buckets_seen++;
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  328  			req->counters.skipped_mi_btree_bitmap++;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  329  			continue;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  330  		}
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  331  
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  332  		struct bch_alloc_v4 a_convert;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  333  		const struct bch_alloc_v4 *a = bch2_alloc_to_v4(k, &a_convert);
19a614d2e4beed fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-30  334  		if (a->data_type != BCH_DATA_free)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  335  			continue;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  336  
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  337  		/* now check the cached key to serialize concurrent allocs of the bucket */
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  338  		CLASS(btree_iter, citer)(trans, BTREE_ID_alloc, k.k->p, BTREE_ITER_cached|BTREE_ITER_nopreserve);
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  339  		struct bkey_s_c ck = bch2_btree_iter_peek_slot(&citer);
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  340  		ret = bkey_err(ck);
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  341  		if (ret)
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  342  			break;
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  343  
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  344  		a = bch2_alloc_to_v4(ck, &a_convert);
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  345  		if (a->data_type == BCH_DATA_free) {
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  346  			req->counters.buckets_seen++;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  347  
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  348  			ob = may_alloc_bucket(c, req, k.k->p)
e038213658f09b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  349  				? __try_alloc_bucket(c, req, k.k->p.offset, a->gen, cl)
fbd152bf946987 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-12-06  350  				: NULL;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  351  			if (ob)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  352  				break;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  353  		}
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  354  	}
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  355  
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  356  	if (!ob && ret)
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  357  		ob = ERR_PTR(ret);
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  358  
e0fb0dccfd6fd8 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  359  	if (!ob && alloc_start > first_bucket) {
e0fb0dccfd6fd8 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  360  		alloc_cursor = alloc_start = first_bucket;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  361  		goto again;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  362  	}
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  363  
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  364  	*dev_alloc_cursor = alloc_cursor;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  365  
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  366  	return ob;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09 @367  }
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  368  

:::::: The code at line 367 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
