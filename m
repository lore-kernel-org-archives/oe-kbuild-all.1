Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021B3612D8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769891492; cv=none; b=Pw+ZJFLXMl7XcPeeB/f5YLORYQzJitwBnYPR5a/e2CdIycIQj7xmtXIYeJAvDefw77nAIjhSLq1pFHDbDYFKMLZi8rz4auPjxtjlQjvpF9eMffPXjli416Dwt5uE0h8rvH5OpqA/CnYGc65YUUb6uC2ep2Lx0AAa732EnhTAJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769891492; c=relaxed/simple;
	bh=AhbVl5uQDlSVETNMeRtfUSjdrCLfjioiVa/jlOsTBao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YLLC4eApjSsW5hha4ZGhDsP4Q90A8c8v3xfZ/a9LMzxjjo1cOQWS1o6D57MxK7bEDvK/61dHH+Wd93NcJtItKosKwiOKbS2c1DLZmeJhCfsK36vKJ8xqQ++CO92M4Zc087hRMOQ3ahqJ3US0fVqDcD3BTT9pKF2tuG0VJge3fWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMHCzz5T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMHCzz5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769891490; x=1801427490;
  h=date:from:to:cc:subject:message-id;
  bh=AhbVl5uQDlSVETNMeRtfUSjdrCLfjioiVa/jlOsTBao=;
  b=cMHCzz5TWr0dj1F1XKwW4Vj5cJDUmq6iKCNOUn0JTk8JiG4ggLNaG7WG
   +JEK0Uck0KV7gi7+pYZ2HmpoZMVC/Z6Jkb1ai/iAnlUYsQTGuKkcmmbLh
   mva/8jt7HqdkcatVjzNYxtbyUBeZVefKzovCf2oCA6B5W81646azAuaM9
   EfOirFp8+9DyAGug2U1Xc9G20LJ8mycPQeXddSwxYH7DS8xNWltDtczkf
   P5z2nrMh3tpIqhg86QckTuiqRtx9QDQNkyw775LMy3ZgwGLF1LULySIB0
   /X0GulpL7gVhhrJ4j+d7k3+8Y9N+y3z2QprCP3hOBBMMbRGagz7X/1cte
   w==;
X-CSE-ConnectionGUID: /eTyuizJTLWJ53XXgEDEGw==
X-CSE-MsgGUID: C8AylArxSVmGA6SaWosKLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81739201"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81739201"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 12:31:29 -0800
X-CSE-ConnectionGUID: NVHZQVZ7QOSlC0adM3Cv8g==
X-CSE-MsgGUID: 9F+WGcj+S9Ojud+OfuBlTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="213661489"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jan 2026 12:31:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmHcr-00000000eNc-3qSy;
	Sat, 31 Jan 2026 20:31:25 +0000
Date: Sun, 01 Feb 2026 04:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-redo-drop-extra-durability
 256/256] fs/bcachefs/data/update.c:381:18: warning: unused variable
 'ptrs_kill_ec'
Message-ID: <202602010458.ukMZZCGM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-redo-drop-extra-durability
head:   9689d5b81bde8a726da90b47841374aad5bd1632
commit: 9689d5b81bde8a726da90b47841374aad5bd1632 [256/256] redo drop_extra_durability, data_update_index_update_key()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260201/202602010458.ukMZZCGM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010458.ukMZZCGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010458.ukMZZCGM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/update.c: In function 'data_update_index_update_key':
>> fs/bcachefs/data/update.c:381:18: warning: unused variable 'ptrs_kill_ec' [-Wunused-variable]
     381 |         unsigned ptrs_kill_ec   = ptr_mask_remap(c, old, u->opts.ptrs_kill_ec,  bkey_i_to_s_c(insert));
         |                  ^~~~~~~~~~~~
>> fs/bcachefs/data/update.c:380:18: warning: unused variable 'ptrs_kill' [-Wunused-variable]
     380 |         unsigned ptrs_kill      = ptr_mask_remap(c, old, u->opts.ptrs_kill,     bkey_i_to_s_c(insert));
         |                  ^~~~~~~~~


vim +/ptrs_kill_ec +381 fs/bcachefs/data/update.c

   254	
   255	static int data_update_index_update_key(struct btree_trans *trans,
   256						struct data_update *u,
   257						struct btree_iter *iter)
   258	{
   259		struct bch_fs *c = trans->c;
   260	
   261		bch2_trans_begin(trans);
   262	
   263		/*
   264		 * @old: extent that we read from
   265		 * @new: newly written replicas
   266		 *
   267		 * First, remap since the extent may have been changed by other data
   268		 * updates (copygc is allowed to race with other data updates):
   269		 */
   270		struct bkey_s_c old	= bkey_i_to_s_c(u->k.k);
   271		struct bkey_s_c k	= bkey_try(bch2_btree_iter_peek_slot(iter));
   272		struct bkey_i_extent *new = bkey_i_to_extent(bch2_keylist_front(&u->op.insert_keys));
   273	
   274		if (!bch2_extents_match(c, k, old)) {
   275			count_data_update_key_fail(u, k, bkey_i_to_s_c(&new->k_i), NULL, "no match:");
   276			bch2_btree_iter_advance(iter);
   277			return 0;
   278		}
   279	
   280		/* make a local copy, so that we can trace it after the transaction commit:  */
   281		k = bkey_i_to_s_c(errptr_try(bch2_bkey_make_mut_noupdate(trans, k)));
   282	
   283		/*
   284		 * We're calling set_needs_reconcile() on both @insert and @new,
   285		 * and it can add a bch_extent_reconcile and additional
   286		 * pointers to BCH_SB_MEMBER_INVALID if the extent is now
   287		 * degraded due to option changes:
   288		 */
   289		new = errptr_try(bch2_trans_kmalloc(trans, bkey_bytes(&new->k) +
   290					 sizeof(struct bch_extent_reconcile) +
   291					 sizeof(struct bch_extent_ptr) * BCH_REPLICAS_MAX));
   292		bkey_copy(&new->k_i, bch2_keylist_front(&u->op.insert_keys));
   293	
   294		struct bkey_i *insert = errptr_try(bch2_trans_kmalloc(trans,
   295					    bkey_bytes(k.k) +
   296					    bkey_val_bytes(&new->k) +
   297					    sizeof(struct bch_extent_reconcile) +
   298					    sizeof(struct bch_extent_ptr) * BCH_REPLICAS_MAX));
   299		bkey_reassemble(insert, k);
   300	
   301		bch2_cut_front(c, iter->pos,	&new->k_i);
   302		bch2_cut_back(insert->k.p,	&new->k_i);
   303	
   304		bch2_cut_front(c, iter->pos,	insert);
   305		bch2_cut_back(new->k.p,		insert);
   306	
   307		if (!u->opts.no_devs_have) {
   308			/* Don't replace non-cached replicas with cached: */
   309			if (u->opts.ptrs_kill)
   310				bkey_for_each_ptr(bch2_bkey_ptrs_c(bkey_i_to_s_c(&new->k_i)), ptr)
   311					BUG_ON(ptr->cached);
   312	
   313			/*
   314			 * Drop replicas in the existing extent that conflict with what
   315			 * we just wrote - but only if they were explicitly specified in
   316			 * ptrs_kill:
   317			 * A replica that we just wrote might conflict with a replica
   318			 * that we want to keep, due to racing with another move:
   319			 */
   320			unsigned ptrs_conflict = bkey_ptr_conflicts_mask(c, bkey_i_to_s_c(insert), bkey_i_to_s_c(&new->k_i)) &
   321				ptr_mask_remap(c, old, u->opts.ptrs_kill, bkey_i_to_s_c(insert));
   322			bch2_bkey_drop_ptrs_mask(c, insert, ptrs_conflict);
   323	
   324	
   325			/* Any conflicts that are left over were useless writes -
   326			 * perhaps due to a copygc race:
   327			 */
   328			ptrs_conflict = bkey_ptr_conflicts_mask(c, bkey_i_to_s_c(&new->k_i), bkey_i_to_s_c(insert));
   329			if (ptrs_conflict) {
   330				event_add_trace(c, data_update_useless_write_fail,
   331						k.k->size * hweight32(ptrs_conflict), buf, ({
   332					ptr_bits_to_text(&buf, ptrs_conflict, "conflicted");
   333					prt_printf(&buf, "wrote: ");
   334					bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&new->k_i));
   335					prt_newline(&buf);
   336					bch2_data_update_to_text(&buf, u);
   337				}));
   338	
   339				bch2_bkey_drop_ptrs_mask(c, &new->k_i, ptrs_conflict);
   340	
   341				if (!bkey_val_u64s(&new->k)) {
   342					count_data_update_key_fail(u, k,
   343								   bkey_i_to_s_c(bch2_keylist_front(&u->op.insert_keys)),
   344								   insert, "new replicas conflicted:");
   345					bch2_btree_iter_advance(iter);
   346					return 0;
   347				}
   348			}
   349		} else {
   350			/*
   351			 * Drop all conflicts from the existing extent, not the newly
   352			 * written replicas:
   353			 *
   354			 * When converting an extent to erasure coding, we don't
   355			 * disallow the write from allocating on the extent's existing
   356			 * devices: we just want a new replica that will have a stripe
   357			 * pointer added asynchronously by erasure coding, and it can
   358			 * overwrite whichever device it happens to land on
   359			 *
   360			 * XXX: make sure drop_extra_replicas does not drop the new
   361			 * replica
   362			 */
   363			unsigned ptrs_conflict = bkey_ptr_conflicts_mask(c, bkey_i_to_s_c(insert), bkey_i_to_s_c(&new->k_i));
   364			bch2_bkey_drop_ptrs_mask(c, insert, ptrs_conflict);
   365		}
   366	
   367		/* Now, merge newly written replicas:
   368		 * Since these are appended to the end of @insert, they don't invalidate
   369		 * our pointer masks:
   370		 */
   371		struct extent_ptr_decoded p;
   372		union bch_extent_entry *entry;
   373		extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
   374			bch2_extent_ptr_decoded_append(c, insert, &p);
   375	
   376		/* Remap masks after creating @insert: bch2_extent_ptr_decoded_append()
   377		 * will not necessarily add the new pointer to the end of the extent, it
   378		 * tries to avoid creating new crc entries
   379		 */
 > 380		unsigned ptrs_kill	= ptr_mask_remap(c, old, u->opts.ptrs_kill,	bkey_i_to_s_c(insert));
 > 381		unsigned ptrs_kill_ec	= ptr_mask_remap(c, old, u->opts.ptrs_kill_ec,	bkey_i_to_s_c(insert));
   382		unsigned ptrs_io_error	= ptr_mask_remap(c, old, u->opts.ptrs_io_error,	bkey_i_to_s_c(insert));
   383	
   384	
   385		struct bch_inode_opts opts;
   386		try(bch2_bkey_get_io_opts(trans, NULL, k, &opts));
   387	
   388		struct bkey_ptr_durabilities d;
   389		try(bkey_ptr_durabilities(trans, bkey_i_to_s_c(insert), &d));
   390	
   391		select_extra_durability_ptrs(c, &opts, &d, ptrs_io_error);
   392	
   393		try(bch2_bkey_drop_extra_durability(trans, &opts, bkey_i_to_s(insert)));
   394	
   395		bch2_bkey_drop_extra_cached_ptrs(c, &opts, bkey_i_to_s(insert));
   396	
   397		bch2_bkey_propagate_incompressible(c, insert, k);
   398	
   399		bool should_check_enospc = false;
   400		s64 i_sectors_delta = 0, disk_sectors_delta = 0;
   401		try(bch2_sum_sector_overwrites(trans, iter, insert,
   402					       &should_check_enospc,
   403					       &i_sectors_delta,
   404					       &disk_sectors_delta));
   405	
   406		if (disk_sectors_delta > (s64) u->op.res.sectors)
   407			try(bch2_disk_reservation_add(c, &u->op.res,
   408						disk_sectors_delta - u->op.res.sectors,
   409						!should_check_enospc
   410						? BCH_DISK_RESERVATION_NOFAIL : 0));
   411	
   412		struct bpos next_pos = insert->k.p;
   413	
   414		try(bch2_trans_log_str(trans, bch2_data_update_type_strs[u->opts.type]));
   415		try(bch2_trans_log_bkey(trans, u->btree_id, 0, u->k.k));
   416	
   417		try(bch2_insert_snapshot_whiteouts(trans, u->btree_id, k.k->p, bkey_start_pos(&insert->k)));
   418		try(bch2_insert_snapshot_whiteouts(trans, u->btree_id, k.k->p, insert->k.p));
   419	
   420		if (u->op.opts.change_cookie == c->opt_change_cookie) {
   421			struct bkey_durability old_durability, new_durability;
   422			try(bch2_bkey_durability(trans, k, &old_durability));
   423			try(bch2_bkey_durability(trans, bkey_i_to_s_c(insert), &new_durability));
   424	
   425			if ((new_durability.total < old_durability.total &&
   426			     new_durability.total < min(u->op.opts.data_replicas, opts.data_replicas)) ||
   427			    !new_durability.total) {
   428				CLASS(bch_log_msg, msg)(c);
   429				prt_printf(&msg.m, "Data update would have reduced extent durability:\n");
   430				prt_printf(&msg.m, "Old extent %u, new %u, option specifies %u\n",
   431					   old_durability.total,
   432					   new_durability.total,
   433					   opts.data_replicas);
   434				prt_str(&msg.m, "orig: ");
   435				bch2_bkey_val_to_text(&msg.m, c, k);
   436				prt_newline(&msg.m);
   437	
   438				prt_str(&msg.m, "wrote: ");
   439				bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(bch2_keylist_front(&u->op.insert_keys)));
   440				prt_newline(&msg.m);
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
