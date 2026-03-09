Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9DB22D7B5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 02:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023028; cv=none; b=JFJkYwh0ZFyFrtMILuoRPjHed8zrUDqVANsNSTgFnZEuHbuCRQpscZXuSKw2iWxievfQzv9kVCvzsITPp4ynXA1Jt4bkDx7MBqefl4Zglmj+w2mLejggxSU8eMI5MGWLcPH/vZhrqrBH/QcA2Kr1Rkw6/V8XKJJhSYvc1ZgmhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023028; c=relaxed/simple;
	bh=SuQpE3dVhsl8hcjxfiorWWDJUz7obSuJp0mD/0ONV9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p6jliYUkZienZZKHUOju5Ia6xO5HBdQeEnijGCpvjlQGFx/gQ1SJ11uISdwf1mukR7PLWj3QjWeMHWdxuP8UwTABiOHQirWLn/83V9zqD6wcrDYw+0mFCokU1oXEw5fAss8NG14bggc4mi6RuFPfMXcIRWlH9AnPPU8QQZ3P6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ/epjum; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ/epjum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773023025; x=1804559025;
  h=date:from:to:cc:subject:message-id;
  bh=SuQpE3dVhsl8hcjxfiorWWDJUz7obSuJp0mD/0ONV9s=;
  b=eJ/epjumMexaBwpJZNvBFdU2/mzjAvDWlKTcb6HqKTwMLFLHMaFpfqhV
   Qr4NFe16a8SVEQ/fKTeNjw1jS2MdwQ+eGtTqiU20wQMNhtuYn6oK7K5ZM
   AJQyh/AVfc3ZnAD2iJFaZpH0RwxdM7nIKK4lrvT+aAWahK9UZJz02T8b2
   lffJDH/agIqNb0c/s+ADTvigbQ15htKT3OlSomUiKJb2Cb/u+NmvjE0i2
   Scop9AmYk4Y4t7NPRUr4WLg/koDqo/07FwaCdgMskueZY/rSm0hmP8Y+r
   4iyYhRu6dj3zRsyEaKrB+Md65C6/db9t3olyGG435Y6FKZ/MuPEaMxm7b
   g==;
X-CSE-ConnectionGUID: Ov5QpkP0R66r7VCr7zygAA==
X-CSE-MsgGUID: cd6uIa+6RSSmZ5Cbsevqng==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85394564"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85394564"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 19:23:44 -0700
X-CSE-ConnectionGUID: KGDLQ8/mREClTXDpgCowhQ==
X-CSE-MsgGUID: ps6sHo9ZRL6ySA/fdbWTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218807018"
Received: from lkp-server01.sh.intel.com (HELO 17db2bb44c9a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2026 19:23:42 -0700
Received: from kbuild by 17db2bb44c9a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzQHT-00000000045-2XLf;
	Mon, 09 Mar 2026 02:23:39 +0000
Date: Mon, 09 Mar 2026 10:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/update.c:451:1: warning: the frame size of 1480 bytes is
 larger than 1280 bytes
Message-ID: <202603091032.ERUU6rdm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/799] bcachefs: move data code to subdir
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260309/202603091032.ERUU6rdm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091032.ERUU6rdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091032.ERUU6rdm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/update.c: In function '__bch2_data_update_index_update':
>> fs/bcachefs/data/update.c:451:1: warning: the frame size of 1480 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     451 | }
         | ^


vim +451 fs/bcachefs/data/update.c

d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  207  
4dcd1cae72912a fs/bcachefs/data_update.c Kent Overstreet 2022-11-14  208  static int __bch2_data_update_index_update(struct btree_trans *trans,
4dcd1cae72912a fs/bcachefs/data_update.c Kent Overstreet 2022-11-14  209  					   struct bch_write_op *op)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  210  {
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  211  	struct bch_fs *c = op->c;
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  212  	struct data_update *m = container_of(op, struct data_update, op);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  213  	int ret = 0;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  214  
9c734c4857e939 fs/bcachefs/data_update.c Kent Overstreet 2025-07-30  215  	CLASS(btree_iter, iter)(trans, m->btree_id,
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  216  			     bkey_start_pos(&bch2_keylist_front(&op->insert_keys)->k),
5dd8c60e1e0448 fs/bcachefs/data_update.c Kent Overstreet 2024-04-07  217  			     BTREE_ITER_slots|BTREE_ITER_intent);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  218  
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  219  	while (1) {
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  220  		struct bkey_s_c k;
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  221  		struct bkey_s_c old = bkey_i_to_s_c(m->k.k);
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  222  		struct bkey_i *insert = NULL;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  223  		struct bkey_i_extent *new;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  224  		const union bch_extent_entry *entry_c;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  225  		union bch_extent_entry *entry;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  226  		struct extent_ptr_decoded p;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  227  		struct bch_extent_ptr *ptr;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  228  		const struct bch_extent_ptr *ptr_c;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  229  		struct bpos next_pos;
b08b492ed3068b fs/bcachefs/data_update.c Kent Overstreet 2021-11-08  230  		bool should_check_enospc;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  231  		s64 i_sectors_delta = 0, disk_sectors_delta = 0;
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  232  		unsigned rewrites_found = 0, durability, ptr_bit;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  233  
4dcd1cae72912a fs/bcachefs/data_update.c Kent Overstreet 2022-11-14  234  		bch2_trans_begin(trans);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  235  
7c84dc243819ab fs/bcachefs/data_update.c Kent Overstreet 2025-07-30  236  		k = bch2_btree_iter_peek_slot(&iter);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  237  		ret = bkey_err(k);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  238  		if (ret)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  239  			goto err;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  240  
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  241  		new = bkey_i_to_extent(bch2_keylist_front(&op->insert_keys));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  242  
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  243  		if (!bch2_extents_match(k, old)) {
157ea5834133c0 fs/bcachefs/data_update.c Kent Overstreet 2025-02-03  244  			trace_io_move_fail2(m, k, bkey_i_to_s_c(&new->k_i),
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  245  					    NULL, "no match:");
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  246  			goto nowork;
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  247  		}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  248  
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  249  		insert = bch2_trans_kmalloc(trans,
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  250  					    bkey_bytes(k.k) +
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  251  					    bkey_val_bytes(&new->k) +
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  252  					    sizeof(struct bch_extent_rebalance));
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  253  		ret = PTR_ERR_OR_ZERO(insert);
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  254  		if (ret)
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  255  			goto err;
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  256  
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  257  		bkey_reassemble(insert, k);
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  258  
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  259  		new = bch2_trans_kmalloc(trans, bkey_bytes(&new->k));
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  260  		ret = PTR_ERR_OR_ZERO(new);
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  261  		if (ret)
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  262  			goto err;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  263  
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  264  		bkey_copy(&new->k_i, bch2_keylist_front(&op->insert_keys));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  265  		bch2_cut_front(iter.pos, &new->k_i);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  266  
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  267  		bch2_cut_front(iter.pos,	insert);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  268  		bch2_cut_back(new->k.p,		insert);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  269  		bch2_cut_back(insert->k.p,	&new->k_i);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  270  
15f93920e982ea fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  271  		bch2_bkey_propagate_incompressible(insert, bkey_i_to_s_c(&new->k_i));
15f93920e982ea fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  272  
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  273  		/*
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  274  		 * @old: extent that we read from
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  275  		 * @insert: key that we're going to update, initialized from
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  276  		 * extent currently in btree - same as @old unless we raced with
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  277  		 * other updates
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  278  		 * @new: extent with new pointers that we'll be adding to @insert
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  279  		 *
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  280  		 * Fist, drop rewrite_ptrs from @new:
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  281  		 */
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  282  		ptr_bit = 1;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  283  		bkey_for_each_ptr_decode(old.k, bch2_bkey_ptrs_c(old), p, entry_c) {
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  284  			if ((ptr_bit & m->data_opts.rewrite_ptrs) &&
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  285  			    (ptr = bch2_extent_has_ptr(old, p, bkey_i_to_s(insert))) &&
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  286  			    !ptr->cached) {
a34eef6dd17946 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  287  				bch2_extent_ptr_set_cached(c, &m->op.opts,
a34eef6dd17946 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  288  							   bkey_i_to_s(insert), ptr);
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  289  				rewrites_found |= ptr_bit;
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  290  			}
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  291  			ptr_bit <<= 1;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  292  		}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  293  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  294  		if (m->data_opts.rewrite_ptrs &&
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  295  		    !rewrites_found &&
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  296  		    bch2_bkey_durability(c, k) >= m->op.opts.data_replicas) {
157ea5834133c0 fs/bcachefs/data_update.c Kent Overstreet 2025-02-03  297  			trace_io_move_fail2(m, k, bkey_i_to_s_c(&new->k_i), insert, "no rewrites found:");
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  298  			goto nowork;
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  299  		}
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  300  
d7dd3fb84f05a0 fs/bcachefs/data_update.c Kent Overstreet 2023-01-07  301  		/*
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  302  		 * A replica that we just wrote might conflict with a replica
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  303  		 * that we want to keep, due to racing with another move:
d7dd3fb84f05a0 fs/bcachefs/data_update.c Kent Overstreet 2023-01-07  304  		 */
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  305  restart_drop_conflicting_replicas:
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  306  		extent_for_each_ptr(extent_i_to_s(new), ptr)
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  307  			if ((ptr_c = bch2_bkey_has_device_c(bkey_i_to_s_c(insert), ptr->dev)) &&
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  308  			    !ptr_c->cached) {
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  309  				bch2_bkey_drop_ptr_noerror(bkey_i_to_s(&new->k_i), ptr);
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  310  				goto restart_drop_conflicting_replicas;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  311  			}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  312  
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  313  		if (!bkey_val_u64s(&new->k)) {
880d14d77ea984 fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  314  			trace_io_move_fail2(m, k,
880d14d77ea984 fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  315  					    bkey_i_to_s_c(bch2_keylist_front(&op->insert_keys)),
880d14d77ea984 fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  316  					    insert, "new replicas conflicted:");
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  317  			goto nowork;
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  318  		}
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  319  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  320  		/* Now, drop pointers that conflict with what we just wrote: */
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  321  		extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  322  			if ((ptr = bch2_bkey_has_device(bkey_i_to_s(insert), p.ptr.dev)))
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  323  				bch2_bkey_drop_ptr_noerror(bkey_i_to_s(insert), ptr);
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  324  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  325  		durability = bch2_bkey_durability(c, bkey_i_to_s_c(insert)) +
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  326  			bch2_bkey_durability(c, bkey_i_to_s_c(&new->k_i));
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  327  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  328  		/* Now, drop excess replicas: */
18dad454cd16cb fs/bcachefs/data_update.c Kent Overstreet 2025-05-24  329  		scoped_guard(rcu) {
f2736b9c791a12 fs/bcachefs/data_update.c Kent Overstreet 2024-06-11  330  restart_drop_extra_replicas:
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  331  			bkey_for_each_ptr_decode(old.k, bch2_bkey_ptrs(bkey_i_to_s(insert)), p, entry) {
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  332  				unsigned ptr_durability = bch2_extent_ptr_durability(c, &p);
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  333  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  334  				if (!p.ptr.cached &&
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  335  				    durability - ptr_durability >= m->op.opts.data_replicas) {
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  336  					durability -= ptr_durability;
be9e782df3cb55 fs/bcachefs/data_update.c Kent Overstreet 2023-10-27  337  
a34eef6dd17946 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  338  					bch2_extent_ptr_set_cached(c, &m->op.opts,
a34eef6dd17946 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  339  								   bkey_i_to_s(insert), &entry->ptr);
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  340  					goto restart_drop_extra_replicas;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  341  				}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  342  			}
18dad454cd16cb fs/bcachefs/data_update.c Kent Overstreet 2025-05-24  343  		}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  344  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  345  		/* Finally, add the pointers we just wrote: */
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  346  		extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  347  			bch2_extent_ptr_decoded_append(insert, &p);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  348  
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  349  		bch2_bkey_narrow_crcs(insert, (struct bch_extent_crc_unpacked) { 0 });
4e45e0d3d65530 fs/bcachefs/data_update.c Kent Overstreet 2025-09-07  350  		bch2_bkey_drop_extra_cached_ptrs(c, &m->op.opts, bkey_i_to_s(insert));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  351  
4dcd1cae72912a fs/bcachefs/data_update.c Kent Overstreet 2022-11-14  352  		ret = bch2_sum_sector_overwrites(trans, &iter, insert,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  353  						 &should_check_enospc,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  354  						 &i_sectors_delta,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  355  						 &disk_sectors_delta);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  356  		if (ret)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  357  			goto err;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  358  
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  359  		if (disk_sectors_delta > (s64) op->res.sectors) {
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  360  			ret = bch2_disk_reservation_add(c, &op->res,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  361  						disk_sectors_delta - op->res.sectors,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  362  						!should_check_enospc
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  363  						? BCH_DISK_RESERVATION_NOFAIL : 0);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  364  			if (ret)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  365  				goto out;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  366  		}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  367  
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  368  		next_pos = insert->k.p;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  369  
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  370  		/*
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  371  		 * Check for nonce offset inconsistency:
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  372  		 * This is debug code - we've been seeing this bug rarely, and
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  373  		 * it's been hard to reproduce, so this should give us some more
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  374  		 * information when it does occur:
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  375  		 */
a6f4794fcd8627 fs/bcachefs/data_update.c Kent Overstreet 2024-11-27  376  		int invalid = bch2_bkey_validate(c, bkey_i_to_s_c(insert),
a6f4794fcd8627 fs/bcachefs/data_update.c Kent Overstreet 2024-11-27  377  						 (struct bkey_validate_context) {
a6f4794fcd8627 fs/bcachefs/data_update.c Kent Overstreet 2024-11-27  378  							.btree	= m->btree_id,
a6f4794fcd8627 fs/bcachefs/data_update.c Kent Overstreet 2024-11-27  379  							.flags	= BCH_VALIDATE_commit,
a6f4794fcd8627 fs/bcachefs/data_update.c Kent Overstreet 2024-11-27  380  						 });
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  381  		if (unlikely(invalid)) {
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  382  			ret = data_update_invalid_bkey(m, old, k, insert);
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  383  			goto out;
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  384  		}
701ff57eb3d7c8 fs/bcachefs/data_update.c Kent Overstreet 2023-11-03  385  
d83a3e491f7a4c fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  386  		struct bch_inode_opts opts;
d83a3e491f7a4c fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  387  
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  388  		ret =   bch2_trans_log_str(trans, bch2_data_update_type_strs[m->type]) ?:
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  389  			bch2_trans_log_bkey(trans, m->btree_id, 0, m->k.k) ?:
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  390  			bch2_insert_snapshot_whiteouts(trans, m->btree_id,
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  391  						k.k->p, bkey_start_pos(&insert->k)) ?:
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  392  			bch2_insert_snapshot_whiteouts(trans, m->btree_id,
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  393  						k.k->p, insert->k.p) ?:
d83a3e491f7a4c fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  394  			bch2_inum_snapshot_opts_get(trans, k.k->p.inode, k.k->p.snapshot, &opts) ?:
a983668fdef752 fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  395  			bch2_bkey_set_needs_rebalance(c, &opts, insert,
f25f76a79cce39 fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  396  						      SET_NEEDS_REBALANCE_foreground,
a983668fdef752 fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  397  						      m->op.opts.change_cookie) ?:
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  398  			bch2_trans_update(trans, &iter, insert,
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  399  				BTREE_UPDATE_internal_snapshot_node);
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  400  		if (ret)
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  401  			goto err;
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  402  
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  403  		if (trace_data_update_enabled())
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  404  			trace_data_update2(m, old, k, insert);
25d1e39df0e284 fs/bcachefs/data_update.c Kent Overstreet 2023-11-24  405  
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  406  		if (bch2_bkey_sectors_need_rebalance(c, bkey_i_to_s_c(insert)) * k.k->size >
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  407  		    bch2_bkey_sectors_need_rebalance(c, k) * insert->k.size)
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  408  			trace_io_move_created_rebalance2(m, old, k, insert);
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  409  
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  410  		ret =   bch2_trans_commit(trans, &op->res,
a1ee777bfcceeb fs/bcachefs/data_update.c Kent Overstreet 2022-11-03  411  				NULL,
cb52d23e77a6e5 fs/bcachefs/data_update.c Kent Overstreet 2023-11-11  412  				BCH_TRANS_COMMIT_no_check_rw|
cb52d23e77a6e5 fs/bcachefs/data_update.c Kent Overstreet 2023-11-11  413  				BCH_TRANS_COMMIT_no_enospc|
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  414  				m->data_opts.btree_insert_flags);
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  415  		if (ret)
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  416  			goto err;
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  417  
7c84dc243819ab fs/bcachefs/data_update.c Kent Overstreet 2025-07-30  418  		bch2_btree_iter_set_pos(&iter, next_pos);
674cfc26240b78 fs/bcachefs/data_update.c Kent Overstreet 2022-08-27  419  
157ea5834133c0 fs/bcachefs/data_update.c Kent Overstreet 2025-02-03  420  		this_cpu_add(c->counters[BCH_COUNTER_io_move_finish], new->k.size);
157ea5834133c0 fs/bcachefs/data_update.c Kent Overstreet 2025-02-03  421  		if (trace_io_move_finish_enabled())
157ea5834133c0 fs/bcachefs/data_update.c Kent Overstreet 2025-02-03  422  			trace_io_move_finish2(m, &new->k_i, insert);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  423  err:
549d173c1bd9b5 fs/bcachefs/data_update.c Kent Overstreet 2022-07-17  424  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  425  			ret = 0;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  426  		if (ret)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  427  			break;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  428  next:
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  429  		while (bkey_ge(iter.pos, bch2_keylist_front(&op->insert_keys)->k.p)) {
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  430  			bch2_keylist_pop_front(&op->insert_keys);
d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  431  			if (bch2_keylist_empty(&op->insert_keys))
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  432  				goto out;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  433  		}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  434  		continue;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  435  nowork:
21e07cc966aab2 fs/bcachefs/data_update.c Daniel Hill     2023-11-27  436  		if (m->stats) {
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  437  			BUG_ON(k.k->p.offset <= iter.pos.offset);
d5eade93452bd1 fs/bcachefs/data_update.c Kent Overstreet 2023-10-23  438  			atomic64_inc(&m->stats->keys_raced);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  439  			atomic64_add(k.k->p.offset - iter.pos.offset,
d5eade93452bd1 fs/bcachefs/data_update.c Kent Overstreet 2023-10-23  440  				     &m->stats->sectors_raced);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  441  		}
674cfc26240b78 fs/bcachefs/data_update.c Kent Overstreet 2022-08-27  442  
157ea5834133c0 fs/bcachefs/data_update.c Kent Overstreet 2025-02-03  443  		count_event(c, io_move_fail);
674cfc26240b78 fs/bcachefs/data_update.c Kent Overstreet 2022-08-27  444  
7c84dc243819ab fs/bcachefs/data_update.c Kent Overstreet 2025-07-30  445  		bch2_btree_iter_advance(&iter);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  446  		goto next;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  447  	}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  448  out:
549d173c1bd9b5 fs/bcachefs/data_update.c Kent Overstreet 2022-07-17  449  	BUG_ON(bch2_err_matches(ret, BCH_ERR_transaction_restart));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  450  	return ret;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13 @451  }
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  452  

:::::: The code at line 451 was first introduced by commit
:::::: c501fef6deb1de13d45d22a3df32906adf17275b bcachefs: Pull out data_update.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
