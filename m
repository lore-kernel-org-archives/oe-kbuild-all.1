Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439670814
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 18:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733163587; cv=none; b=PKx3A4fDWIAClBFbNUCcgvIUYi/iqZosaBdiF/vWjz1ZCJne90XnD4mpo7ijsStGTgtwpFrSjNZx+XjLyJOTDwWvVPtweIsWAIxSeq8e7pJZer1fm1L+vF99hpPzst2pU8/bVG15Xj7HyR4RLYPEngkPSm2wL6Tg4i7KXwqw8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733163587; c=relaxed/simple;
	bh=i4ygpbrEZmb5RWeD36WQNnNTQ/WbZQBxWtIcEnm9fK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7VdwSycd60Lk+CuQLTR8GKeYqwUSA8LQd0CAizS6oZBRP5BfeuEddhE3/LKHAOkVmkBre/6naVQ7wLrGy02QlqhX0x/8KbQ/7Lw24DJo5/Jx2hZ3WKMpMH6MQeAA48rxYWT5xVgX4ajFHvE0DBwJGjkM2EiOOYswxTEa0y1bWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qijp09vu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qijp09vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733163585; x=1764699585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i4ygpbrEZmb5RWeD36WQNnNTQ/WbZQBxWtIcEnm9fK8=;
  b=Qijp09vuWdROPqYIm+hd4i1yu8ccbJh7JARC0dDSUGftUV7h0WjXV4Tx
   9sjCdOmEo8aPBj3u/4T37AEJ7EY1geJHv7DCpwumjZpPsrVfrqYeAzl7x
   YbCE0KvgGlrLSJ4pFWsupy5bwimbe7nfPuKJ/Z5QrYuBkjhC5gbJ+c8Gb
   odscgo2A+iqrQO+/gD+GSlqwWB0AEjTEjy0p9ls6wA+vmVSNo4Hve6gfT
   dUSiib3Y7wWOroo5qPSV/jbTYzKBI4D6VpI+h3IUOUqtkVB5ofkh8xLzl
   n361jiz6R1psZTc1Yw896mG0TqTJX0F0/EqKdWBZhzCrsY+HQgkLTbV4g
   A==;
X-CSE-ConnectionGUID: nCOivbWZT3GSvJ+6oCwy4A==
X-CSE-MsgGUID: P1oIITo2R7SuzQRE5Knk3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33593345"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33593345"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:19:45 -0800
X-CSE-ConnectionGUID: wlbr6m97Svy2RqVvjuMQAQ==
X-CSE-MsgGUID: 0Es682X/RVGW5pQzKYJznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93586160"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2024 10:19:44 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIB1K-0002iL-0S;
	Mon, 02 Dec 2024 18:19:42 +0000
Date: Tue, 3 Dec 2024 02:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8024/10675] fs/bcachefs/btree_iter.c:2673:41-42:
 Unneeded semicolon
Message-ID: <202412030231.Le2rZGwp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f486c8aa16b8172f63bddc70116a0c897a7f3f02
commit: 8a6a42421fd265c9c2c6039a29fca6ad5e5b6fe9 [8024/10675] bcachefs: Implement bch2_btree_iter_prev_min()
config: arc-randconfig-r054-20241111 (https://download.01.org/0day-ci/archive/20241203/202412030231.Le2rZGwp-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030231.Le2rZGwp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_iter.c:2673:41-42: Unneeded semicolon

vim +2673 fs/bcachefs/btree_iter.c

  2567	
  2568	/**
  2569	 * bch2_btree_iter_peek_prev_min() - returns first key less than or equal to
  2570	 * iterator's current position
  2571	 * @iter:	iterator to peek from
  2572	 * @end:	search limit: returns keys greater than or equal to @end
  2573	 *
  2574	 * Returns:	key if found, or an error extractable with bkey_err().
  2575	 */
  2576	struct bkey_s_c bch2_btree_iter_peek_prev_min(struct btree_iter *iter, struct bpos end)
  2577	{
  2578		struct btree_trans *trans = iter->trans;
  2579		struct bpos search_key = iter->pos;
  2580		struct bkey_s_c k;
  2581		btree_path_idx_t saved_path = 0;
  2582	
  2583		bch2_trans_verify_not_unlocked_or_in_restart(trans);
  2584		bch2_btree_iter_verify_entry_exit(iter);
  2585		EBUG_ON((iter->flags & BTREE_ITER_filter_snapshots) && bpos_eq(end, POS_MIN));
  2586	
  2587		if (iter->flags & BTREE_ITER_filter_snapshots)
  2588			search_key.snapshot = U32_MAX;
  2589	
  2590		while (1) {
  2591			k = __bch2_btree_iter_peek_prev(iter, search_key);
  2592			if (unlikely(!k.k))
  2593				goto end;
  2594			if (unlikely(bkey_err(k)))
  2595				goto out_no_locked;
  2596	
  2597			if (iter->flags & BTREE_ITER_filter_snapshots) {
  2598				struct btree_path *s = saved_path ? trans->paths + saved_path : NULL;
  2599				if (s && bpos_lt(k.k->p, SPOS(s->pos.inode, s->pos.offset, iter->snapshot))) {
  2600					/*
  2601					 * If we have a saved candidate, and we're past
  2602					 * the last possible snapshot overwrite, return
  2603					 * it:
  2604					 */
  2605					bch2_path_put_nokeep(trans, iter->path,
  2606						      iter->flags & BTREE_ITER_intent);
  2607					iter->path = saved_path;
  2608					saved_path = 0;
  2609					k = bch2_btree_path_peek_slot(btree_iter_path(trans, iter), &iter->k);
  2610					break;
  2611				}
  2612	
  2613				/*
  2614				 * We need to check against @end before FILTER_SNAPSHOTS because
  2615				 * if we get to a different inode that requested we might be
  2616				 * seeing keys for a different snapshot tree that will all be
  2617				 * filtered out.
  2618				 */
  2619				if (unlikely(bkey_lt(k.k->p, end)))
  2620					goto end;
  2621	
  2622				if (!bch2_snapshot_is_ancestor(trans->c, iter->snapshot, k.k->p.snapshot)) {
  2623					search_key = bpos_predecessor(k.k->p);
  2624					continue;
  2625				}
  2626	
  2627				if (k.k->p.snapshot != iter->snapshot) {
  2628					/*
  2629					 * Have a key visible in iter->snapshot, but
  2630					 * might have overwrites: - save it and keep
  2631					 * searching. Unless it's a whiteout - then drop
  2632					 * our previous saved candidate:
  2633					 */
  2634					if (saved_path) {
  2635						bch2_path_put_nokeep(trans, saved_path,
  2636						      iter->flags & BTREE_ITER_intent);
  2637						saved_path = 0;
  2638					}
  2639	
  2640					if (!bkey_whiteout(k.k)) {
  2641						saved_path = btree_path_clone(trans, iter->path,
  2642									iter->flags & BTREE_ITER_intent,
  2643									_THIS_IP_);
  2644						trace_btree_path_save_pos(trans,
  2645									  trans->paths + iter->path,
  2646									  trans->paths + saved_path);
  2647					}
  2648	
  2649					search_key = bpos_predecessor(k.k->p);
  2650					continue;
  2651				}
  2652	
  2653				if (bkey_whiteout(k.k)) {
  2654					search_key = bkey_predecessor(iter, k.k->p);
  2655					search_key.snapshot = U32_MAX;
  2656					continue;
  2657				}
  2658			}
  2659	
  2660			EBUG_ON(iter->flags & BTREE_ITER_all_snapshots		? bpos_gt(k.k->p, iter->pos) :
  2661				iter->flags & BTREE_ITER_is_extents		? bkey_ge(bkey_start_pos(k.k), iter->pos) :
  2662										  bkey_gt(k.k->p, iter->pos));
  2663	
  2664			if (unlikely(iter->flags & BTREE_ITER_all_snapshots	? bpos_lt(k.k->p, end) :
  2665				     iter->flags & BTREE_ITER_is_extents	? bkey_le(k.k->p, end) :
  2666										  bkey_lt(k.k->p, end)))
  2667				goto end;
  2668	
  2669			break;
  2670		}
  2671	
  2672		/* Extents can straddle iter->pos: */
> 2673		iter->pos = bpos_min(iter->pos, k.k->p);;
  2674	
  2675		if (iter->flags & BTREE_ITER_filter_snapshots)
  2676			iter->pos.snapshot = iter->snapshot;
  2677	out_no_locked:
  2678		if (saved_path)
  2679			bch2_path_put_nokeep(trans, saved_path, iter->flags & BTREE_ITER_intent);
  2680	
  2681		bch2_btree_iter_verify_entry_exit(iter);
  2682		bch2_btree_iter_verify(iter);
  2683		return k;
  2684	end:
  2685		bch2_btree_iter_set_pos(iter, end);
  2686		k = bkey_s_c_null;
  2687		goto out_no_locked;
  2688	}
  2689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
