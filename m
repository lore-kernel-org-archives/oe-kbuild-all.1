Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796332010EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 23:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766445948; cv=none; b=UFXezKNdmrM0s/nrY6vlcb+O2eB4ynX3/y85SvK1R2c46aRjkuehCZsLcu8js5zKBpzPeSYeP5NE/9wdRFiDbUlSzPjxfgG05YfRSv/eNrgFLbSSRz3yDG+C48jMLF93qifoWDATLkclpihxB+0jKU6JdM1K0zWKAz25sGJBZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766445948; c=relaxed/simple;
	bh=RwaagXf0+jFFqyatX/Pp9EeeOXRIO1bDeiReCwupMok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pAzhYkN8t2/ACoAzcqgWKT7yImzmXBDMuxkpR6FmhpH4FzHo2MtWzOwQ0bTRaXE3h9mSLBt1UcfSCpO4wEYfTht3Of7IWNetZGRPYdItaAYoHvQ2+9IItPDr9TnRolja+ZsW77LRcn6RYS9w8E0ArNuClgJ0G041QY4CKQCxIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlWJFqM9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlWJFqM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766445946; x=1797981946;
  h=date:from:to:cc:subject:message-id;
  bh=RwaagXf0+jFFqyatX/Pp9EeeOXRIO1bDeiReCwupMok=;
  b=jlWJFqM9yCDRcjYDKPbX2gWSCmCN1YW4817qEfgJBl1zwdLOZi8SU2iA
   NjQS7c/OWwH7U61r1lJPlh0TsuapgxMtGFYhnNQWi4J0OY83CZ4Z8mkPF
   hqRQ6M2J9urWHWr0U9aTz9U+xqyt46hTxM63r4hEd7TyGFyzT2g36cm0f
   H69OB/MNsqo8CAvEt1o70GuS+AUn7M5tvW/AX3R10q3cHGejrTcyLghIT
   wTSBEoFt1Hhg8PUERrOzN7fp2nWK1nW+0W9r+LNjbJQUppt3X9DpiRvwB
   J1hkTIPTA18+OpkyCLhv8okPNaYrP1k+p06byexxoM7Ovtd5SZCDgM75R
   w==;
X-CSE-ConnectionGUID: AhBzFKIdRdeQHxJH8rD14w==
X-CSE-MsgGUID: swCEPVxFQcmDETJdCRsYiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93772274"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="93772274"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:25:45 -0800
X-CSE-ConnectionGUID: N64YMrhvTqKrGFqN8CxSeA==
X-CSE-MsgGUID: KjCAR70qRYmepkqv7iGxUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198883190"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 15:25:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpHZ-000000001Db-3MvH;
	Mon, 22 Dec 2025 23:25:41 +0000
Date: Tue, 23 Dec 2025 07:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/locking.c:328:36: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202512230833.8oD8V2yT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/799] bcachefs: move btree files to subdir
config: riscv-randconfig-r133-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230833.8oD8V2yT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230833.8oD8V2yT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230833.8oD8V2yT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> fs/bcachefs/btree/locking.c:328:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/locking.c:328:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/locking.c:328:36: sparse:    struct btree_path *
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> fs/bcachefs/btree/key_cache.c:849:9: sparse: sparse: dereference of noderef expression
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
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
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> fs/bcachefs/btree/interior.c:1191:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.c:1191:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.c:1191:18: sparse:    unsigned int enum bch_watermark

vim +328 fs/bcachefs/btree/locking.c

33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  297  
96d994b37cfcf4 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  298  int bch2_check_for_deadlock(struct btree_trans *trans, struct printbuf *cycle)
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  299  {
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  300  	struct lock_graph g;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  301  	struct trans_waiting_for_lock *top;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  302  	struct btree_bkey_cached_common *b;
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  303  	btree_path_idx_t path_idx;
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  304  	int ret = 0;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  305  
3398124444b900 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-26  306  	g.nr = 0;
3398124444b900 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-26  307  
0ef9ab34f442f7 fs/bcachefs/btree_locking.c Alan Huang      2024-10-10  308  	if (trans->lock_must_abort && !trans->lock_may_not_fail) {
40405557b92dfe fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  309  		if (cycle)
40405557b92dfe fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  310  			return -1;
40405557b92dfe fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  311  
c13fbb7de2fc4f fs/bcachefs/btree_locking.c Kent Overstreet 2024-01-04  312  		trace_would_deadlock(&g, trans);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  313  		return btree_trans_restart(trans, BCH_ERR_transaction_restart_would_deadlock);
0d7009d7ca99ad fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  314  	}
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  315  
896f1b316f8e8f fs/bcachefs/btree_locking.c Kent Overstreet 2022-10-12  316  	lock_graph_down(&g, trans);
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  317  
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  318  	/* trans->paths is rcu protected vs. freeing */
18dad454cd16cb fs/bcachefs/btree_locking.c Kent Overstreet 2025-05-24  319  	guard(rcu)();
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  320  	if (cycle)
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  321  		cycle->atomic++;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  322  next:
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  323  	if (!g.nr)
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  324  		goto out;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  325  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  326  	top = &g.g[g.nr - 1];
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  327  
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12 @328  	struct btree_path *paths = rcu_dereference(top->trans->paths);
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  329  	if (!paths)
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  330  		goto up;
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  331  
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  332  	unsigned long *paths_allocated = trans_paths_allocated(paths);
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  333  
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  334  	trans_for_each_path_idx_from(paths_allocated, *trans_paths_nr(paths),
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  335  				     path_idx, top->path_idx) {
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  336  		struct btree_path *path = paths + path_idx;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  337  		if (!path->nodes_locked)
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  338  			continue;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  339  
f154c3eb429a34 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-27  340  		if (path_idx != top->path_idx) {
f154c3eb429a34 fs/bcachefs/btree_locking.c Kent Overstreet 2023-05-27  341  			top->path_idx		= path_idx;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  342  			top->level		= 0;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  343  			top->lock_start_time	= 0;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  344  		}
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  345  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  346  		for (;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  347  		     top->level < BTREE_MAX_DEPTH;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  348  		     top->level++, top->lock_start_time = 0) {
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  349  			int lock_held = btree_node_locked_type(path, top->level);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  350  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  351  			if (lock_held == BTREE_NODE_UNLOCKED)
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  352  				continue;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  353  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  354  			b = &READ_ONCE(path->l[top->level].b)->c;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  355  
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  356  			if (IS_ERR_OR_NULL(b)) {
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  357  				/*
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  358  				 * If we get here, it means we raced with the
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  359  				 * other thread updating its btree_path
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  360  				 * structures - which means it can't be blocked
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  361  				 * waiting on a lock:
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  362  				 */
b169138d482980 fs/bcachefs/btree_locking.c Alan Huang      2024-10-03  363  				if (!lock_graph_remove_non_waiters(&g, g.g)) {
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  364  					/*
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  365  					 * If lock_graph_remove_non_waiters()
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  366  					 * didn't do anything, it must be
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  367  					 * because we're being called by debugfs
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  368  					 * checking for lock cycles, which
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  369  					 * invokes us on btree_transactions that
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  370  					 * aren't actually waiting on anything.
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  371  					 * Just bail out:
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  372  					 */
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  373  					lock_graph_pop_all(&g);
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  374  				}
80df5b8cacceb2 fs/bcachefs/btree_locking.c Kent Overstreet 2023-01-20  375  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  376  				goto next;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  377  			}
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  378  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  379  			if (list_empty_careful(&b->lock.wait_list))
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  380  				continue;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  381  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  382  			raw_spin_lock(&b->lock.wait_lock);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  383  			list_for_each_entry(trans, &b->lock.wait_list, locking_wait.list) {
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  384  				BUG_ON(b != trans->locking);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  385  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  386  				if (top->lock_start_time &&
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  387  				    time_after_eq64(top->lock_start_time, trans->locking_wait.start_time))
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  388  					continue;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  389  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  390  				top->lock_start_time = trans->locking_wait.start_time;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  391  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  392  				/* Don't check for self deadlock: */
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  393  				if (trans == top->trans ||
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  394  				    !lock_type_conflicts(lock_held, trans->locking_wait.lock_want))
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  395  					continue;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  396  
6547ebabdaac44 fs/bcachefs/btree_locking.c Kent Overstreet 2023-06-19  397  				closure_get(&trans->ref);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  398  				raw_spin_unlock(&b->lock.wait_lock);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  399  
6547ebabdaac44 fs/bcachefs/btree_locking.c Kent Overstreet 2023-06-19  400  				ret = lock_graph_descend(&g, trans, cycle);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  401  				if (ret)
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  402  					goto out;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  403  				goto next;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  404  
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  405  			}
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  406  			raw_spin_unlock(&b->lock.wait_lock);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  407  		}
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  408  	}
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  409  up:
97940308bbe3f8 fs/bcachefs/btree_locking.c Kent Overstreet 2025-09-08  410  	if (cycle)
40a44873a5ca98 fs/bcachefs/btree_locking.c Kent Overstreet 2022-10-02  411  		print_chain(cycle, &g);
896f1b316f8e8f fs/bcachefs/btree_locking.c Kent Overstreet 2022-10-12  412  	lock_graph_up(&g);
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  413  	goto next;
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  414  out:
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  415  	if (cycle)
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  416  		--cycle->atomic;
fea153a84557c9 fs/bcachefs/btree_locking.c Kent Overstreet 2023-12-12  417  	return ret;
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  418  }
33bd5d068603f9 fs/bcachefs/btree_locking.c Kent Overstreet 2022-08-22  419  

:::::: The code at line 328 was first introduced by commit
:::::: fea153a84557c982542527143950dbef434731c2 bcachefs: rcu protect trans->paths

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
