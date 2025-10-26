Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D40226290
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761501915; cv=none; b=TJDSqsDOFuehDiR+H7AJCb0EKM7loKQUVuGch1eBopXnC9nJRvZu5lZwKe1Q3L9ihkxkEbVdpymqKzsraX6FO2jBBNMilyHOKVL84ELz3wWLBp9XZaqRT4wW/5nj2QbPmGt8ETKTfN3xNFbPIyf/k40iKvwOrI6oLCg6t0tIuwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761501915; c=relaxed/simple;
	bh=D0d6DCaMUmlj9cRWsgvXZuSOX2tkkTt3YSSpOHefLxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocmnSM9NUbYIhk5i5gN57/ynpVlBRiJrGpaPtpiZV2LnH8MZsfLxEvNomSYmAh8ouuex4QPEjUf8DJLvsvPTvpt2cjhZqzoQsJ7p8j8vsKiFidRKPhWi3N+iG+dKCXh9FVDC8jHtYpMKLR5ho2BumzNCUB7yaovb5U8pT395HiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zfj9IZ6c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zfj9IZ6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761501913; x=1793037913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0d6DCaMUmlj9cRWsgvXZuSOX2tkkTt3YSSpOHefLxw=;
  b=Zfj9IZ6cUrIhzra1Aoyu+8HUtMe16AdOYPvjwYz5yRoWex8tGp3LVsYo
   WP40Afw3jIJEATJrxXMMAwz2O8XapKnEbqN0iznEAuu76Tq6vE4nFXLqo
   QpJcBrWtBaVp1oyNR7s3vFebVqovHyMWxxBXIGvTOY2diM0cJtqCit3DU
   kMx59vOqpoINKoiOhrcqx5dOcEEAIHTHWrsCJZnDIhpw8aFvBoHubgzFP
   HitfC28WuHBFaSuT6ZaRgGYIM4DJxNZSRIhxbGBqxCrmLAaW/oBFDmqGy
   YYTfVCZwibj5YlYU7ks0nYevAj8G1dk6TRgkYwMVxFtPtZpYw6yMKe2vA
   A==;
X-CSE-ConnectionGUID: 1xeSSaW5Ql2nIg0gPFUqYQ==
X-CSE-MsgGUID: SfFB/fxkS4W8N8XIi4g54Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73882999"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="73882999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 11:05:12 -0700
X-CSE-ConnectionGUID: aF4ceSV/TsOAf15xl3N5fg==
X-CSE-MsgGUID: DNKSADFpQbaHRU6BV8r23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184560496"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2025 11:05:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD576-000GHf-1F;
	Sun, 26 Oct 2025 18:05:08 +0000
Date: Mon, 27 Oct 2025 02:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 458/674]
 fs/bcachefs/btree/locking.c:328:36: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202510270140.YtdTjLbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   f7d5a6c33da8fc6327cb2536fd82028fa3d68cbb
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/674] bcachefs: move btree files to subdir
config: powerpc-randconfig-r112-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270140.YtdTjLbw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270140.YtdTjLbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270140.YtdTjLbw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/locking.c:328:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/locking.c:328:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/locking.c:328:36: sparse:    struct btree_path *
--
>> fs/bcachefs/btree/key_cache.c:849:9: sparse: sparse: dereference of noderef expression
--
>> fs/bcachefs/btree/iter.c:1713:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1713:9: sparse:    unsigned long [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1713:9: sparse:    unsigned long *
   fs/bcachefs/btree/iter.c:1714:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1714:9: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1714:9: sparse:    struct btree_path *
   fs/bcachefs/btree/iter.c:1715:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1715:9: sparse:    unsigned short [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1715:9: sparse:    unsigned short [usertype] *
   fs/bcachefs/btree/iter.c:1716:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1716:9: sparse:    struct btree_insert_entry [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1716:9: sparse:    struct btree_insert_entry *
   fs/bcachefs/btree/iter.c:3735:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:3735:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/iter.c:3735:36: sparse:    struct btree_path *
   fs/bcachefs/btree/iter.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:373:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_unlock' - unexpected unlock
   fs/bcachefs/btree/iter.c:3355:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_lock' - different lock contexts for basic block
   fs/bcachefs/btree/iter.c:3633:9: sparse: sparse: context imbalance in 'bch2_trans_put' - different lock contexts for basic block
--
>> fs/bcachefs/btree/interior.c:1191:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.c:1191:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.c:1191:18: sparse:    unsigned int enum bch_watermark

vim +328 fs/bcachefs/btree/locking.c

33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  297  
96d994b37cfcf46 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  298  int bch2_check_for_deadlock(struct btree_trans *trans, struct printbuf *cycle)
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  299  {
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  300  	struct lock_graph g;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  301  	struct trans_waiting_for_lock *top;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  302  	struct btree_bkey_cached_common *b;
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  303  	btree_path_idx_t path_idx;
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  304  	int ret = 0;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  305  
3398124444b9007 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-26  306  	g.nr = 0;
3398124444b9007 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-26  307  
0ef9ab34f442f72 fs/bcachefs/btree_locking.c Alan Huang      2024-10-10  308  	if (trans->lock_must_abort && !trans->lock_may_not_fail) {
40405557b92dfe9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  309  		if (cycle)
40405557b92dfe9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  310  			return -1;
40405557b92dfe9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  311  
c13fbb7de2fc4fd fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-04  312  		trace_would_deadlock(&g, trans);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  313  		return btree_trans_restart(trans, BCH_ERR_transaction_restart_would_deadlock);
0d7009d7ca99ad9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  314  	}
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  315  
896f1b316f8e8f5 fs/bcachefs/btree_locking.c Kent Overstreet 2022-10-12  316  	lock_graph_down(&g, trans);
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  317  
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  318  	/* trans->paths is rcu protected vs. freeing */
18dad454cd16cbb fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-24  319  	guard(rcu)();
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  320  	if (cycle)
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  321  		cycle->atomic++;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  322  next:
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  323  	if (!g.nr)
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  324  		goto out;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  325  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  326  	top = &g.g[g.nr - 1];
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  327  
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12 @328  	struct btree_path *paths = rcu_dereference(top->trans->paths);
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  329  	if (!paths)
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  330  		goto up;
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  331  
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  332  	unsigned long *paths_allocated = trans_paths_allocated(paths);
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  333  
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  334  	trans_for_each_path_idx_from(paths_allocated, *trans_paths_nr(paths),
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  335  				     path_idx, top->path_idx) {
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  336  		struct btree_path *path = paths + path_idx;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  337  		if (!path->nodes_locked)
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  338  			continue;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  339  
f154c3eb429a340 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-27  340  		if (path_idx != top->path_idx) {
f154c3eb429a340 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-27  341  			top->path_idx		= path_idx;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  342  			top->level		= 0;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  343  			top->lock_start_time	= 0;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  344  		}
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  345  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  346  		for (;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  347  		     top->level < BTREE_MAX_DEPTH;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  348  		     top->level++, top->lock_start_time = 0) {
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  349  			int lock_held = btree_node_locked_type(path, top->level);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  350  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  351  			if (lock_held == BTREE_NODE_UNLOCKED)
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  352  				continue;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  353  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  354  			b = &READ_ONCE(path->l[top->level].b)->c;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  355  
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  356  			if (IS_ERR_OR_NULL(b)) {
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  357  				/*
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  358  				 * If we get here, it means we raced with the
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  359  				 * other thread updating its btree_path
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  360  				 * structures - which means it can't be blocked
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  361  				 * waiting on a lock:
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  362  				 */
b169138d482980d fs/bcachefs/btree_locking.c Alan Huang      2024-10-03  363  				if (!lock_graph_remove_non_waiters(&g, g.g)) {
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  364  					/*
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  365  					 * If lock_graph_remove_non_waiters()
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  366  					 * didn't do anything, it must be
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  367  					 * because we're being called by debugfs
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  368  					 * checking for lock cycles, which
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  369  					 * invokes us on btree_transactions that
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  370  					 * aren't actually waiting on anything.
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  371  					 * Just bail out:
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  372  					 */
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  373  					lock_graph_pop_all(&g);
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  374  				}
80df5b8cacceb25 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  375  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  376  				goto next;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  377  			}
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  378  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  379  			if (list_empty_careful(&b->lock.wait_list))
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  380  				continue;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  381  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  382  			raw_spin_lock(&b->lock.wait_lock);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  383  			list_for_each_entry(trans, &b->lock.wait_list, locking_wait.list) {
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  384  				BUG_ON(b != trans->locking);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  385  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  386  				if (top->lock_start_time &&
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  387  				    time_after_eq64(top->lock_start_time, trans->locking_wait.start_time))
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  388  					continue;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  389  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  390  				top->lock_start_time = trans->locking_wait.start_time;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  391  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  392  				/* Don't check for self deadlock: */
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  393  				if (trans == top->trans ||
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  394  				    !lock_type_conflicts(lock_held, trans->locking_wait.lock_want))
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  395  					continue;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  396  
6547ebabdaac440 fs/bcachefs/btree_locking.c Kent Overstreet 2023-06-19  397  				closure_get(&trans->ref);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  398  				raw_spin_unlock(&b->lock.wait_lock);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  399  
6547ebabdaac440 fs/bcachefs/btree_locking.c Kent Overstreet 2023-06-19  400  				ret = lock_graph_descend(&g, trans, cycle);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  401  				if (ret)
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  402  					goto out;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  403  				goto next;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  404  
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  405  			}
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  406  			raw_spin_unlock(&b->lock.wait_lock);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  407  		}
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  408  	}
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  409  up:
97940308bbe3f80 fs/bcachefs/btree_locking.c Kent Overstreet 2025-09-08  410  	if (cycle)
40a44873a5ca984 fs/bcachefs/btree_locking.c Kent Overstreet 2022-10-02  411  		print_chain(cycle, &g);
896f1b316f8e8f5 fs/bcachefs/btree_locking.c Kent Overstreet 2022-10-12  412  	lock_graph_up(&g);
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  413  	goto next;
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  414  out:
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  415  	if (cycle)
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  416  		--cycle->atomic;
fea153a84557c98 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  417  	return ret;
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  418  }
33bd5d068603f9e fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  419  

:::::: The code at line 328 was first introduced by commit
:::::: fea153a84557c982542527143950dbef434731c2 bcachefs: rcu protect trans->paths

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
