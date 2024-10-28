Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02218FDA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730109352; cv=none; b=pb2NyysaOh1hpwHtNN3aokEllYIas9jOO7GKPMXkKJvaNrA1Pdh8oird4bUleWtZ5z86dEsQx2Fl3KXqY/lH81nobBZzlKdX1I2aHvnYYLN7i2fuuxgbvW+mUyIIRq+JH6QGt/7/SwyHyA/u9iuwYp6v4FzXeJ7rziN7UScB6Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730109352; c=relaxed/simple;
	bh=EfVoWvPeQ4LnU8ukulVox/kgL+tPsNtePuOU0rNfT0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQowpYLJhFmaIuyqTjoy8m/HQNQc2Z7ZmMUXuICMAooJrhgSTPaMBNP7ERqJN+k2wPJ8BlILZEpnbnVQuTpD1Q8W7bIq5VTkET4/6oPCFE+vhuj3zgXckPIzoGGJkjAbNx5OLHPqS5pRScHQcxRQWKaRD7tcLklRb8KGhvW4iO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/ocApTh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/ocApTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730109351; x=1761645351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EfVoWvPeQ4LnU8ukulVox/kgL+tPsNtePuOU0rNfT0U=;
  b=Z/ocApThlSXDQxLmVqwUyyHvBfA89ED+tBG0cqGC8b2snDOv2/YG60RJ
   WRPEuVHnw8GJcNVcUa7xjIvBVZd002496H7m/tBcQfjEtyyqxL8I/AFr3
   vOotYEUZBrl80fXaJzDCFgIapKhQJovJZt8P1MjlM4e8JnoYleImfOcut
   MR14mIRetyesmbk3J4+d5ojpqCpyU7o7G+HB+i8MIrHu4Mdhmd87KCstu
   87rD3EdiS7mc0LniDW4+YXG47kyXVuyinAZ9K/Rh06QRVAwN6Zrp756l+
   xpjIh4341jU7pL2pKVGz9d2W8xtATK2tDuRkT1H9N5/optA5a5OTFCP6j
   A==;
X-CSE-ConnectionGUID: 3OPbs2MhRiaPNYr8qkeAHA==
X-CSE-MsgGUID: WBVYyYuQQluHRNsRgxLvWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29889161"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29889161"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:55:50 -0700
X-CSE-ConnectionGUID: GGkjewQvTMCqRKvd4/Fbsg==
X-CSE-MsgGUID: ZPKEzTmdS6WAi3OEn6vo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81668862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2024 02:55:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5MTS-000cH6-2u;
	Mon, 28 Oct 2024 09:55:46 +0000
Date: Mon, 28 Oct 2024 17:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 141/148]
 fs/bcachefs/btree_iter.c:2668:41-42: Unneeded semicolon
Message-ID: <202410281741.fvwVF2Ru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   94e538060c93b0d601bdbfc91f495a8ebbf56b6c
commit: a9e16001658d3ba0e90954652b859bcf0a7cd1e3 [141/148] bcachefs: Implement bch2_btree_iter_prev_min()
config: m68k-randconfig-r051-20241027 (https://download.01.org/0day-ci/archive/20241028/202410281741.fvwVF2Ru-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281741.fvwVF2Ru-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_iter.c:2668:41-42: Unneeded semicolon

vim +2668 fs/bcachefs/btree_iter.c

  2556	
  2557	/**
  2558	 * bch2_btree_iter_peek_prev_min() - returns first key less than or equal to
  2559	 * iterator's current position
  2560	 * @iter:	iterator to peek from
  2561	 * @end:	search limit: returns keys greater than or equal to @end
  2562	 *
  2563	 * Returns:	key if found, or an error extractable with bkey_err().
  2564	 */
  2565	struct bkey_s_c bch2_btree_iter_peek_prev_min(struct btree_iter *iter, struct bpos end)
  2566	{
  2567		struct btree_trans *trans = iter->trans;
  2568		struct bpos search_key = iter->pos;
  2569		struct bkey_s_c k;
  2570		btree_path_idx_t saved_path = 0;
  2571	
  2572		bch2_trans_verify_not_unlocked(trans);
  2573		bch2_btree_iter_verify_entry_exit(iter);
  2574		EBUG_ON((iter->flags & BTREE_ITER_filter_snapshots) && bpos_eq(end, POS_MIN));
  2575	
  2576		int ret = trans_maybe_inject_restart(trans, _RET_IP_);
  2577		if (unlikely(ret)) {
  2578			k = bkey_s_c_err(ret);
  2579			goto out_no_locked;
  2580		}
  2581	
  2582		if (iter->flags & BTREE_ITER_filter_snapshots)
  2583			search_key.snapshot = U32_MAX;
  2584	
  2585		while (1) {
  2586			k = __bch2_btree_iter_peek_prev(iter, search_key);
  2587			if (unlikely(!k.k))
  2588				goto end;
  2589			if (unlikely(bkey_err(k)))
  2590				goto out_no_locked;
  2591	
  2592			if (iter->flags & BTREE_ITER_filter_snapshots) {
  2593				struct btree_path *s = saved_path ? trans->paths + saved_path : NULL;
  2594				if (s && bpos_lt(k.k->p, SPOS(s->pos.inode, s->pos.offset, iter->snapshot))) {
  2595					/*
  2596					 * If we have a saved candidate, and we're past
  2597					 * the last possible snapshot overwrite, return
  2598					 * it:
  2599					 */
  2600					bch2_path_put_nokeep(trans, iter->path,
  2601						      iter->flags & BTREE_ITER_intent);
  2602					iter->path = saved_path;
  2603					saved_path = 0;
  2604					k = bch2_btree_path_peek_slot(btree_iter_path(trans, iter), &iter->k);
  2605					break;
  2606				}
  2607	
  2608				/*
  2609				 * We need to check against @end before FILTER_SNAPSHOTS because
  2610				 * if we get to a different inode that requested we might be
  2611				 * seeing keys for a different snapshot tree that will all be
  2612				 * filtered out.
  2613				 */
  2614				if (unlikely(bkey_lt(k.k->p, end)))
  2615					goto end;
  2616	
  2617				if (!bch2_snapshot_is_ancestor(trans->c, iter->snapshot, k.k->p.snapshot)) {
  2618					search_key = bpos_predecessor(k.k->p);
  2619					continue;
  2620				}
  2621	
  2622				if (k.k->p.snapshot != iter->snapshot) {
  2623					/*
  2624					 * Have a key visible in iter->snapshot, but
  2625					 * might have overwrites: - save it and keep
  2626					 * searching. Unless it's a whiteout - then drop
  2627					 * our previous saved candidate:
  2628					 */
  2629					if (saved_path) {
  2630						bch2_path_put_nokeep(trans, saved_path,
  2631						      iter->flags & BTREE_ITER_intent);
  2632						saved_path = 0;
  2633					}
  2634	
  2635					if (!bkey_whiteout(k.k)) {
  2636						saved_path = btree_path_clone(trans, iter->path,
  2637									iter->flags & BTREE_ITER_intent,
  2638									_THIS_IP_);
  2639						trace_btree_path_save_pos(trans,
  2640									  trans->paths + iter->path,
  2641									  trans->paths + saved_path);
  2642					}
  2643	
  2644					search_key = bpos_predecessor(k.k->p);
  2645					continue;
  2646				}
  2647	
  2648				if (bkey_whiteout(k.k)) {
  2649					search_key = bkey_predecessor(iter, k.k->p);
  2650					search_key.snapshot = U32_MAX;
  2651					continue;
  2652				}
  2653			}
  2654	
  2655			EBUG_ON(iter->flags & BTREE_ITER_all_snapshots		? bpos_gt(k.k->p, iter->pos) :
  2656				iter->flags & BTREE_ITER_is_extents		? bkey_ge(bkey_start_pos(k.k), iter->pos) :
  2657										  bkey_gt(k.k->p, iter->pos));
  2658	
  2659			if (unlikely(iter->flags & BTREE_ITER_all_snapshots	? bpos_lt(k.k->p, end) :
  2660				     iter->flags & BTREE_ITER_is_extents	? bkey_le(k.k->p, end) :
  2661										  bkey_lt(k.k->p, end)))
  2662				goto end;
  2663	
  2664			break;
  2665		}
  2666	
  2667		/* Extents can straddle iter->pos: */
> 2668		iter->pos = bpos_min(iter->pos, k.k->p);;
  2669	
  2670		if (iter->flags & BTREE_ITER_filter_snapshots)
  2671			iter->pos.snapshot = iter->snapshot;
  2672	out_no_locked:
  2673		if (saved_path)
  2674			bch2_path_put_nokeep(trans, saved_path, iter->flags & BTREE_ITER_intent);
  2675	
  2676		bch2_btree_iter_verify_entry_exit(iter);
  2677		bch2_btree_iter_verify(iter);
  2678		return k;
  2679	end:
  2680		bch2_btree_iter_set_pos(iter, end);
  2681		k = bkey_s_c_null;
  2682		goto out_no_locked;
  2683	}
  2684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
