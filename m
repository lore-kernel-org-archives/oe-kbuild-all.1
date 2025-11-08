Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654CC133
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762642980; cv=none; b=EegRtLB/e/2giUEUqVUWO6c9BbhGPgK7ZhDp+uXGLaYCQT5ybBMXTdnCMB+HcfLzcuwsw4vZ45qNtmaDI2mr9lKcpUaxNkfiwU3UxGD/oKztY0ziRpC3nWL0IFNZZMGKnKUY1G7TNFEuipA5H/SlKTJk6fNKOfJDMbMuVFK4s5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762642980; c=relaxed/simple;
	bh=ohjjELUjCKgn/ffomXrp0TvAgJ99jWuoNtTDEhdYoeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubVG665lp/1QhmxewasSjgWkY5p+tGJVepWtZ7atk0n1VRsg8QjA2s1AgKX2h0bMaWL/AQ//urU0yxlLrZSc6J2yIemgYE7m5ZW4xn2ACBXzoBuWTy4RyibCB/s/n40g17yTGInRuBw5OPy3+sL9+EzLZLTxqTnuk1oZIvL101Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcGBpGU6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcGBpGU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762642978; x=1794178978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohjjELUjCKgn/ffomXrp0TvAgJ99jWuoNtTDEhdYoeI=;
  b=JcGBpGU61JruO5SAN5x9WSuS95n6DeiHd9h77HY7Y4slVOr3iQqzIBnJ
   WCXQpAzrtbxrz/eIcc7sMBV4ujYIhMso9g3rO+sxRKlCLVpCV5zZrY5bc
   IBcBX8ZWWqPdDwzwYFG+cpYZM/fZBWsgQvDdljV4gf6vL51wNixXU1iUV
   DY0RLBlGCjnYgl26UVfNq69Vvdigkl3yyw1S7fVRlOJJyNpqtL4mkszHr
   9x53vXBIYmIKD0lI2KpRlaZhKpCMrBgFFYl6Rz1m4j1Ddpy7pzdDYhpZ/
   7Br6VfkWECOIAkHBKfA5X3gnbs22QWcOqGsltle4JBKViCI5MmVARjLeA
   g==;
X-CSE-ConnectionGUID: B+rdNd1GRN6aE3nk24izuQ==
X-CSE-MsgGUID: UvwiPPlwTkGD/yMPfs7CPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="68590526"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="68590526"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 15:02:58 -0800
X-CSE-ConnectionGUID: 5c6HvtBPQVyzzTtF6VrRKA==
X-CSE-MsgGUID: mGhxv9mbRiaU9qPdPEYI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="189062505"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Nov 2025 15:02:57 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHrxO-0001WP-2O;
	Sat, 08 Nov 2025 23:02:54 +0000
Date: Sun, 9 Nov 2025 07:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 614/811]
 fs/bcachefs/btree/commit.c:717:4: error: call to undeclared function
 '__WARN'; ISO C99 and later do not support implicit function declarations
Message-ID: <202511090642.k1QsU88Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   c87270de4b4a58b6a1d826147659fff9ea7df9f8
commit: d85853d9cbdc339f7f75c76ef54e568a9a3a14de [614/811] bcachefs: BCH_FSCK_ERR_validate_error_in_commit
config: powerpc64-randconfig-r073-20251109 (https://download.01.org/0day-ci/archive/20251109/202511090642.k1QsU88Y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090642.k1QsU88Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090642.k1QsU88Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree/commit.c:717:4: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     717 |                         __WARN();
         |                         ^
   fs/bcachefs/btree/commit.c:731:4: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     731 |                         __WARN();
         |                         ^
   2 errors generated.


vim +/__WARN +717 fs/bcachefs/btree/commit.c

   590	
   591	static inline int
   592	bch2_trans_commit_write_locked(struct btree_trans *trans,
   593				       enum bch_trans_commit_flags flags,
   594				       struct btree_insert_entry **stopped_at,
   595				       unsigned long trace_ip)
   596	{
   597		struct bch_fs *c = trans->c;
   598		struct btree_trans_commit_hook *h;
   599		unsigned u64s = 0;
   600		int ret = 0;
   601	
   602		bch2_trans_verify_not_unlocked_or_in_restart(trans);
   603	#if 0
   604		/* todo: bring back dynamic fault injection */
   605		if (race_fault()) {
   606			trace_and_count(c, trans_restart_fault_inject, trans, trace_ip);
   607			return btree_trans_restart(trans, BCH_ERR_transaction_restart_fault_inject);
   608		}
   609	#endif
   610		/*
   611		 * Check if the insert will fit in the leaf node with the write lock
   612		 * held, otherwise another thread could write the node changing the
   613		 * amount of space available:
   614		 */
   615	
   616		prefetch(&trans->c->journal.flags);
   617	
   618		trans_for_each_update(trans, i) {
   619			/* Multiple inserts might go to same leaf: */
   620			if (!same_leaf_as_prev(trans, i))
   621				u64s = 0;
   622	
   623			u64s += i->k->k.u64s;
   624			ret = !i->cached
   625				? btree_key_can_insert(trans, insert_l(trans, i)->b, u64s)
   626				: btree_key_can_insert_cached(trans, flags, trans->paths + i->path, u64s);
   627			if (ret) {
   628				*stopped_at = i;
   629				return ret;
   630			}
   631	
   632			i->k->k.needs_whiteout = false;
   633		}
   634	
   635		/*
   636		 * Don't get journal reservation until after we know insert will
   637		 * succeed:
   638		 */
   639		if (likely(!(flags & BCH_TRANS_COMMIT_no_journal_res))) {
   640			try(bch2_trans_journal_res_get(trans,
   641					(flags & BCH_WATERMARK_MASK)|
   642					JOURNAL_RES_GET_NONBLOCK));
   643	
   644			if (unlikely(trans->journal_transaction_names))
   645				journal_transaction_name(trans);
   646		}
   647	
   648		/*
   649		 * Not allowed to fail after we've gotten our journal reservation - we
   650		 * have to use it:
   651		 */
   652	
   653		if (IS_ENABLED(CONFIG_BCACHEFS_DEBUG) &&
   654		    !(flags & BCH_TRANS_COMMIT_no_journal_res)) {
   655			if (static_branch_unlikely(&bch2_journal_seq_verify))
   656				trans_for_each_update(trans, i)
   657					i->k->k.bversion.lo = trans->journal_res.seq;
   658			else if (static_branch_unlikely(&bch2_inject_invalid_keys))
   659				trans_for_each_update(trans, i)
   660					i->k->k.bversion = MAX_VERSION;
   661		}
   662	
   663		h = trans->hooks;
   664		while (h) {
   665			try(h->fn(trans, h));
   666			h = h->next;
   667		}
   668	
   669		struct bkey_i *accounting;
   670	
   671		scoped_guard(percpu_read, &c->mark_lock)
   672			for (accounting = btree_trans_subbuf_base(trans, &trans->accounting);
   673			     accounting != btree_trans_subbuf_top(trans, &trans->accounting);
   674			     accounting = bkey_next(accounting)) {
   675				ret = bch2_accounting_trans_commit_hook(trans,
   676							bkey_i_to_accounting(accounting), flags);
   677				if (unlikely(ret)) {
   678					for (struct bkey_i *i = btree_trans_subbuf_base(trans, &trans->accounting);
   679					     i != accounting;
   680					     i = bkey_next(i))
   681						bch2_accounting_trans_commit_revert(trans, bkey_i_to_accounting(i), flags);
   682					return ret;
   683				}
   684			}
   685	
   686		/* XXX: we only want to run this if deltas are nonzero */
   687		bch2_trans_account_disk_usage_change(trans);
   688	
   689		trans_for_each_update(trans, i)
   690			if (btree_node_type_has_atomic_triggers(i->bkey_type)) {
   691				ret = run_one_mem_trigger(trans, i, BTREE_TRIGGER_atomic|i->flags);
   692				if (bch2_fs_fatal_err_on(ret, c, "fatal error in transaction commit: %s", bch2_err_str(ret)))
   693					return ret;
   694			}
   695	
   696		if (unlikely(c->gc_pos.phase)) {
   697			ret = bch2_trans_commit_run_gc_triggers(trans);
   698			if (bch2_fs_fatal_err_on(ret, c, "fatal error in transaction commit: %s", bch2_err_str(ret)))
   699				return ret;
   700		}
   701	
   702		struct bkey_validate_context validate_context = { .from	= BKEY_VALIDATE_commit };
   703	
   704		if (!(flags & BCH_TRANS_COMMIT_no_journal_res))
   705			validate_context.flags = BCH_VALIDATE_write|BCH_VALIDATE_commit;
   706	
   707		for (struct jset_entry *i = btree_trans_journal_entries_start(trans);
   708		     i != btree_trans_journal_entries_top(trans);
   709		     i = vstruct_next(i)) {
   710			ret = bch2_journal_entry_validate(c, NULL, i,
   711							  bcachefs_metadata_version_current,
   712							  CPU_BIG_ENDIAN, validate_context);
   713			if (unlikely(ret)) {
   714				bch2_trans_inconsistent(trans, "invalid journal entry on insert from %s\n",
   715							trans->fn);
   716				bch2_sb_error_count(c, BCH_FSCK_ERR_validate_error_in_commit);
 > 717				__WARN();
   718				return ret;
   719			}
   720		}
   721	
   722		trans_for_each_update(trans, i) {
   723			validate_context.level	= i->level;
   724			validate_context.btree	= i->btree_id;
   725	
   726			ret = bch2_bkey_validate(c, bkey_i_to_s_c(i->k), validate_context);
   727			if (unlikely(ret)){
   728				bch2_trans_inconsistent(trans, "invalid bkey on insert from %s -> %ps\n",
   729							trans->fn, (void *) i->ip_allocated);
   730				bch2_sb_error_count(c, BCH_FSCK_ERR_validate_error_in_commit);
   731				__WARN();
   732				return ret;
   733			}
   734			btree_insert_entry_checks(trans, i);
   735		}
   736	
   737		if (likely(!(flags & BCH_TRANS_COMMIT_no_journal_res))) {
   738			struct journal *j = &c->journal;
   739			struct jset_entry *entry;
   740	
   741			trans_for_each_update(trans, i) {
   742				if (i->key_cache_already_flushed)
   743					continue;
   744	
   745				if (i->flags & BTREE_UPDATE_nojournal)
   746					continue;
   747	
   748				verify_update_old_key(trans, i);
   749	
   750				if (trans->journal_transaction_names) {
   751					entry = bch2_journal_add_entry(j, &trans->journal_res,
   752							       BCH_JSET_ENTRY_overwrite,
   753							       i->btree_id, i->level,
   754							       i->old_k.u64s);
   755					bkey_reassemble((struct bkey_i *) entry->start,
   756							(struct bkey_s_c) { &i->old_k, i->old_v });
   757				}
   758	
   759				entry = bch2_journal_add_entry(j, &trans->journal_res,
   760						       BCH_JSET_ENTRY_btree_keys,
   761						       i->btree_id, i->level,
   762						       i->k->k.u64s);
   763				bkey_copy((struct bkey_i *) entry->start, i->k);
   764			}
   765	
   766			memcpy_u64s_small(journal_res_entry(&c->journal, &trans->journal_res),
   767					  btree_trans_journal_entries_start(trans),
   768					  trans->journal_entries.u64s);
   769	
   770			EBUG_ON(trans->journal_res.u64s < trans->journal_entries.u64s);
   771	
   772			trans->journal_res.offset	+= trans->journal_entries.u64s;
   773			trans->journal_res.u64s		-= trans->journal_entries.u64s;
   774	
   775			if (trans->accounting.u64s)
   776				memcpy_u64s_small(bch2_journal_add_entry(j, &trans->journal_res,
   777								BCH_JSET_ENTRY_write_buffer_keys,
   778								BTREE_ID_accounting, 0,
   779								trans->accounting.u64s)->_data,
   780						  btree_trans_subbuf_base(trans, &trans->accounting),
   781						  trans->accounting.u64s);
   782	
   783			if (trans->journal_seq)
   784				*trans->journal_seq = trans->journal_res.seq;
   785		}
   786	
   787		trans_for_each_update(trans, i) {
   788			struct btree_path *path = trans->paths + i->path;
   789	
   790			if (!i->cached)
   791				bch2_btree_insert_key_leaf(trans, path, i->k, trans->journal_res.seq);
   792			else if (!i->key_cache_already_flushed)
   793				bch2_btree_insert_key_cached(trans, flags, i);
   794			else
   795				bch2_btree_key_cache_drop(trans, path);
   796		}
   797	
   798		return 0;
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
