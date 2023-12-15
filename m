Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160330114
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjBnhR6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702661717; x=1734197717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7dxTjWoBiO/Co7H7hD81xj206psMLIVMlEXlmE4Q+Dg=;
  b=KjBnhR6HJUlcToqNJH4F0m0DpHfFzqZgoGvUmfcV3gbeevWLMQp0j/gu
   4e1lUaefrHDaKiz3QrIIAWBAc2Ohq/5eMo3xDQ+esXIUChYSXbUEPG386
   4F5Vhg5vJVREGIIPaETE9gV/msxTDKnG3A1J9D/c5Wuao74JJH+CCNDiy
   GVQmWnHFGPhbn+ktvaCKgR6G+EmJVhimUhXUm6tLvfFo4dLiY7eu6GHsj
   TzSlzeOO0XKgT07zSDL46cLy87SPjif7fbHn8LaBmHyJVEv6GGZTq5x6Q
   tF7AkaHuQ2W/NXpEBwDa2AKbCu3Wm0pXinqNxAhwpFsDpBhOgmxldmgWx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2475043"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2475043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="22915811"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2023 09:35:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEC5e-0000Yd-27;
	Fri, 15 Dec 2023 17:35:11 +0000
Date: Sat, 16 Dec 2023 01:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7961/8213] fs/bcachefs/btree_locking.c:309:36:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202312160153.ovUEsxo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 20bad4b1e542c112a53fe3b3e63abe439746978c [7961/8213] bcachefs: rcu protect trans->paths
config: csky-randconfig-r113-20231215 (https://download.01.org/0day-ci/archive/20231216/202312160153.ovUEsxo6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231216/202312160153.ovUEsxo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160153.ovUEsxo6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_locking.c: note: in included file:
   fs/bcachefs/bcachefs.h:1007:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/btree_locking.c:309:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/bcachefs/btree_locking.c:309:36: sparse:    struct btree_path [noderef] __rcu *
>> fs/bcachefs/btree_locking.c:309:36: sparse:    struct btree_path *
   fs/bcachefs/btree_locking.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
   fs/bcachefs/btree_iter.c: note: in included file:
   fs/bcachefs/bcachefs.h:1007:9: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_iter.c: note: in included file (through fs/bcachefs/btree_types.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/replicas_types.h:24:34: sparse: sparse: array of flexible structures
>> fs/bcachefs/btree_iter.c:3090:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/bcachefs/btree_iter.c:3090:36: sparse:    struct btree_path [noderef] __rcu *
>> fs/bcachefs/btree_iter.c:3090:36: sparse:    struct btree_path *
   fs/bcachefs/btree_iter.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_iter.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_unlock' - unexpected unlock
   fs/bcachefs/btree_iter.c:2781:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_lock' - different lock contexts for basic block
   fs/bcachefs/btree_iter.c:3022:9: sparse: sparse: context imbalance in 'bch2_trans_put' - different lock contexts for basic block

vim +309 fs/bcachefs/btree_locking.c

   278	
   279	int bch2_check_for_deadlock(struct btree_trans *trans, struct printbuf *cycle)
   280	{
   281		struct lock_graph g;
   282		struct trans_waiting_for_lock *top;
   283		struct btree_bkey_cached_common *b;
   284		btree_path_idx_t path_idx;
   285		int ret = 0;
   286	
   287		g.nr = 0;
   288	
   289		if (trans->lock_must_abort) {
   290			if (cycle)
   291				return -1;
   292	
   293			trace_would_deadlock(&g, trans, _RET_IP_);
   294			return btree_trans_restart(trans, BCH_ERR_transaction_restart_would_deadlock);
   295		}
   296	
   297		lock_graph_down(&g, trans);
   298	
   299		/* trans->paths is rcu protected vs. freeing */
   300		rcu_read_lock();
   301		if (cycle)
   302			cycle->atomic++;
   303	next:
   304		if (!g.nr)
   305			goto out;
   306	
   307		top = &g.g[g.nr - 1];
   308	
 > 309		struct btree_path *paths = rcu_dereference(top->trans->paths);
   310		if (!paths)
   311			goto up;
   312	
   313		unsigned long *paths_allocated = trans_paths_allocated(paths);
   314	
   315		trans_for_each_path_idx_from(paths_allocated, *trans_paths_nr(paths),
   316					     path_idx, top->path_idx) {
   317			struct btree_path *path = paths + path_idx;
   318			if (!path->nodes_locked)
   319				continue;
   320	
   321			if (path_idx != top->path_idx) {
   322				top->path_idx		= path_idx;
   323				top->level		= 0;
   324				top->lock_start_time	= 0;
   325			}
   326	
   327			for (;
   328			     top->level < BTREE_MAX_DEPTH;
   329			     top->level++, top->lock_start_time = 0) {
   330				int lock_held = btree_node_locked_type(path, top->level);
   331	
   332				if (lock_held == BTREE_NODE_UNLOCKED)
   333					continue;
   334	
   335				b = &READ_ONCE(path->l[top->level].b)->c;
   336	
   337				if (IS_ERR_OR_NULL(b)) {
   338					/*
   339					 * If we get here, it means we raced with the
   340					 * other thread updating its btree_path
   341					 * structures - which means it can't be blocked
   342					 * waiting on a lock:
   343					 */
   344					if (!lock_graph_remove_non_waiters(&g)) {
   345						/*
   346						 * If lock_graph_remove_non_waiters()
   347						 * didn't do anything, it must be
   348						 * because we're being called by debugfs
   349						 * checking for lock cycles, which
   350						 * invokes us on btree_transactions that
   351						 * aren't actually waiting on anything.
   352						 * Just bail out:
   353						 */
   354						lock_graph_pop_all(&g);
   355					}
   356	
   357					goto next;
   358				}
   359	
   360				if (list_empty_careful(&b->lock.wait_list))
   361					continue;
   362	
   363				raw_spin_lock(&b->lock.wait_lock);
   364				list_for_each_entry(trans, &b->lock.wait_list, locking_wait.list) {
   365					BUG_ON(b != trans->locking);
   366	
   367					if (top->lock_start_time &&
   368					    time_after_eq64(top->lock_start_time, trans->locking_wait.start_time))
   369						continue;
   370	
   371					top->lock_start_time = trans->locking_wait.start_time;
   372	
   373					/* Don't check for self deadlock: */
   374					if (trans == top->trans ||
   375					    !lock_type_conflicts(lock_held, trans->locking_wait.lock_want))
   376						continue;
   377	
   378					closure_get(&trans->ref);
   379					raw_spin_unlock(&b->lock.wait_lock);
   380	
   381					ret = lock_graph_descend(&g, trans, cycle);
   382					if (ret)
   383						goto out;
   384					goto next;
   385	
   386				}
   387				raw_spin_unlock(&b->lock.wait_lock);
   388			}
   389		}
   390	up:
   391		if (g.nr > 1 && cycle)
   392			print_chain(cycle, &g);
   393		lock_graph_up(&g);
   394		goto next;
   395	out:
   396		if (cycle)
   397			--cycle->atomic;
   398		rcu_read_unlock();
   399		return ret;
   400	}
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
