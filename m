Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6F22DFA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 06:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769235542; cv=none; b=B9t0HQHgC6Z+zZsB8kmqPd/d9fRVODAEczUIsqwDG3lv/javfvD+BLJclCQNHct6veCbzj/XptsrJW06TIPPM9zDTUOwVF1bLLAh/01cXVkZ98f+QsJb88QncoIXOW5gFEChS35RGwNQLNs8aaFxaXtcizjLZDo40VJKsdABwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769235542; c=relaxed/simple;
	bh=iLc/4cF9asrW44++zmg6zIjUjEzwM9jz5Dh8TTmU+TA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NvOiIUk62tLKEi5p4k8+Ss2qwrNQ9Hv1ASiNufPn9lHsxwuMSlRGmLDUBeyXQzKoxDQa0WnerFz9c5AusoOPFQd7Aankwhy46Heptn45CCsy/mBQ55s89oBIicoI/4g4dO0s6NShB7jgnxTpn9/uVCDCC/zGy0sKmU1xu9Q9MrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7h16ELs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7h16ELs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769235539; x=1800771539;
  h=date:from:to:cc:subject:message-id;
  bh=iLc/4cF9asrW44++zmg6zIjUjEzwM9jz5Dh8TTmU+TA=;
  b=k7h16ELsgYcDe9pjf64UxWv/mFPs0krqh+IQdBHjSor7YYiCkUOFiTi0
   R8SPSqr6MHP4prUnM3Pefm9NBFgEWmuVYKXqnGSE1RxQhUs3kXG8rqsk2
   LK2LTFmiEVHdkgX2j8S3ri29MiYsNhZyQm5muwMT5hGHo/sj5jc/covEt
   Kx6yCDno/FDwkTyi8PWyWOHZg+fSXv6QHd1rvRWzFG8IoX2g+wpjldDOm
   rt8LIGQ7zwbNxwWIsJ43Jre9miQPNoZD3UwTBWmrB6q4/Ul2Svr1dyU/K
   HnDZAhTLuVZWksyCkBgUCTiu6InZ8/2HTa63zuBeZoXWIkWNSQCxl6aql
   w==;
X-CSE-ConnectionGUID: oowGfnzBRNyVuL1fcwZH0g==
X-CSE-MsgGUID: krqbRO3UTaKL7+wbRm6UaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70203082"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70203082"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:18:59 -0800
X-CSE-ConnectionGUID: Cns4+3JkQ6SBgtfEqelPZQ==
X-CSE-MsgGUID: y6+xxJGwRkS1L8BFcCUI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="206465188"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 22:18:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWz0-00000000UxW-30Tm;
	Sat, 24 Jan 2026 06:18:54 +0000
Date: Sat, 24 Jan 2026 14:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 246/248]
 fs/bcachefs/data/update.c:344:1: warning: the frame size of 1360 bytes is
 larger than 1280 bytes
Message-ID: <202601241411.vpP9rx6L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1310ef4f3109a9e87aab48a8d8a1c15bccd9ece2
commit: 730b9f954426e617bab26d320626a7d5e581cf2b [246/248] bcachefs: Check that data updates don't reduce durability
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260124/202601241411.vpP9rx6L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241411.vpP9rx6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241411.vpP9rx6L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/update.c: In function 'data_update_index_update_key':
>> fs/bcachefs/data/update.c:344:1: warning: the frame size of 1360 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     344 | }
         | ^


vim +344 fs/bcachefs/data/update.c

d385ca5603a3af fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  135  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  136  static int data_update_index_update_key(struct btree_trans *trans,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  137  					struct data_update *u,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  138  					struct btree_iter *iter)
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  139  {
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  140  	struct bch_fs *c = trans->c;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  141  	struct bkey_s_c old = bkey_i_to_s_c(u->k.k);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  142  
4dcd1cae72912a fs/bcachefs/data_update.c Kent Overstreet 2022-11-14  143  	bch2_trans_begin(trans);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  144  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  145  	struct bkey_s_c k = bkey_try(bch2_btree_iter_peek_slot(iter));
5945219ab7e9ac fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  146  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  147  	/* make a local copy, so that we can trace it after the transaction commit:  */
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  148  	k = bkey_i_to_s_c(errptr_try(bch2_bkey_make_mut_noupdate(trans, k)));
5945219ab7e9ac fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  149  
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  150  	/*
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  151  	 * We're calling set_needs_reconcile() on both @insert and @new,
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  152  	 * and it can add a bch_extent_reconcile and additional
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  153  	 * pointers to BCH_SB_MEMBER_INVALID if the extent is now
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  154  	 * degraded due to option changes:
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  155  	 */
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  156  	struct bkey_i_extent *new = bkey_i_to_extent(bch2_keylist_front(&u->op.insert_keys));
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  157  	new = errptr_try(bch2_trans_kmalloc(trans, bkey_bytes(&new->k) +
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  158  				 sizeof(struct bch_extent_reconcile) +
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  159  				 sizeof(struct bch_extent_ptr) * BCH_REPLICAS_MAX));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  160  	bkey_copy(&new->k_i, bch2_keylist_front(&u->op.insert_keys));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  161  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  162  	struct bkey_i *insert = errptr_try(bch2_trans_kmalloc(trans,
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  163  				    bkey_bytes(k.k) +
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  164  				    bkey_val_bytes(&new->k) +
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  165  				    sizeof(struct bch_extent_reconcile) +
09db8aab33e52c fs/bcachefs/data/update.c Kent Overstreet 2025-10-12  166  				    sizeof(struct bch_extent_ptr) * BCH_REPLICAS_MAX));
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  167  	bkey_reassemble(insert, k);
4a9eb20efa9f07 fs/bcachefs/data_update.c Kent Overstreet 2025-05-22  168  
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  169  	bch2_cut_front(c, iter->pos,	&new->k_i);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  170  	bch2_cut_front(c, iter->pos,	insert);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  171  	bch2_cut_back(new->k.p,		insert);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  172  	bch2_cut_back(insert->k.p,	&new->k_i);
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  173  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  174  	if (!bch2_extents_match(c, k, old)) {
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  175  		count_data_update_key_fail(u, k, bkey_i_to_s_c(&new->k_i), insert, "no match:");
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  176  		bch2_btree_iter_advance(iter);
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  177  		return 0;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  178  	}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  179  
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  180  	struct bch_inode_opts opts;
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  181  	try(bch2_bkey_get_io_opts(trans, NULL, k, &opts));
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  182  
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  183  	/*
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  184  	 * @old: extent that we read from
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  185  	 * @insert: key that we're going to update, initialized from
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  186  	 * extent currently in btree - same as @old unless we raced with
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  187  	 * other updates
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  188  	 * @new: extent with new pointers that we'll be adding to @insert
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  189  	 *
77cf6b5a3a079b fs/bcachefs/data/update.c Kent Overstreet 2026-01-03  190  	 * Fist, drop ptrs_kill from @new:
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  191  	 */
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  192  	const union bch_extent_entry *entry_c;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  193  	struct extent_ptr_decoded p;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  194  	struct bch_extent_ptr *ptr;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  195  
0fcd4eae5829f5 fs/bcachefs/data/update.c Kent Overstreet 2025-12-29  196  	if (u->opts.ptrs_kill_ec)
0fcd4eae5829f5 fs/bcachefs/data/update.c Kent Overstreet 2025-12-29  197  		bch2_bkey_drop_ec_mask(c, insert, u->opts.ptrs_kill_ec);
0fcd4eae5829f5 fs/bcachefs/data/update.c Kent Overstreet 2025-12-29  198  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  199  	unsigned rewrites_found = 0, ptr_bit = 1;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  200  	bkey_for_each_ptr_decode(old.k, bch2_bkey_ptrs_c(old), p, entry_c) {
77cf6b5a3a079b fs/bcachefs/data/update.c Kent Overstreet 2026-01-03  201  		if ((ptr_bit & u->opts.ptrs_kill) &&
44c1946444a82a fs/bcachefs/data/update.c Kent Overstreet 2025-11-05  202  		    (ptr = bch2_extent_has_ptr(c, old, p, bkey_i_to_s(insert)))) {
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  203  			if (ptr_bit & u->opts.ptrs_io_error)
44c1946444a82a fs/bcachefs/data/update.c Kent Overstreet 2025-11-05  204  				bch2_bkey_drop_ptr_noerror(c, bkey_i_to_s(insert), ptr);
0bf6463036f1c7 fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  205  			else if (!ptr->cached)
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  206  				bch2_extent_ptr_set_cached(c, &opts, bkey_i_to_s(insert), ptr);
0bf6463036f1c7 fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  207  
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  208  			rewrites_found |= ptr_bit;
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  209  		}
015fafc49bbf81 fs/bcachefs/data_update.c Kent Overstreet 2024-10-20  210  		ptr_bit <<= 1;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  211  	}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  212  
77cf6b5a3a079b fs/bcachefs/data/update.c Kent Overstreet 2026-01-03  213  	if (u->opts.ptrs_kill && !rewrites_found) {
26df9915fe4f06 fs/bcachefs/data/update.c Kent Overstreet 2026-01-19  214  		struct bkey_durability durability;
26df9915fe4f06 fs/bcachefs/data/update.c Kent Overstreet 2026-01-19  215  		try(bch2_bkey_durability(trans, k, &durability));
0cc51545ca6962 fs/bcachefs/data/update.c Kent Overstreet 2025-12-24  216  
26df9915fe4f06 fs/bcachefs/data/update.c Kent Overstreet 2026-01-19  217  		if (durability.total >= opts.data_replicas) {
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  218  			count_data_update_key_fail(u, k, bkey_i_to_s_c(&new->k_i), insert,
5945219ab7e9ac fs/bcachefs/data/update.c Kent Overstreet 2025-10-16  219  						   "no rewrites found:");
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  220  			bch2_btree_iter_advance(iter);
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  221  			return 0;
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  222  		}
0cc51545ca6962 fs/bcachefs/data/update.c Kent Overstreet 2025-12-24  223  	}
7f5c5d20f01483 fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  224  
d7dd3fb84f05a0 fs/bcachefs/data_update.c Kent Overstreet 2023-01-07  225  	/*
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  226  	 * A replica that we just wrote might conflict with a replica
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  227  	 * that we want to keep, due to racing with another move:
d7dd3fb84f05a0 fs/bcachefs/data_update.c Kent Overstreet 2023-01-07  228  	 */
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  229  	if (!u->opts.no_devs_have) {
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  230  		const struct bch_extent_ptr *ptr_c;
7a49cae1960fba fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  231  		bch2_bkey_drop_ptrs_noerror(bkey_i_to_s(&new->k_i), p, entry,
7a49cae1960fba fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  232  			((ptr_c = bch2_bkey_has_device_c(c, bkey_i_to_s_c(insert), p.ptr.dev)) &&
7a49cae1960fba fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  233  			 !ptr_c->cached));
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  234  	} else {
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  235  		const struct bch_extent_ptr *ptr_c;
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  236  		bch2_bkey_drop_ptrs_noerror(bkey_i_to_s(insert), p, entry,
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  237  			((ptr_c = bch2_bkey_has_device_c(c, bkey_i_to_s_c(&new->k_i), p.ptr.dev)) &&
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  238  			 !ptr_c->cached));
a86f2860029908 fs/bcachefs/data/update.c Kent Overstreet 2025-12-13  239  	}
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  240  
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  241  	if (!bkey_val_u64s(&new->k)) {
e40c9a06251432 fs/bcachefs/data/update.c Kent Overstreet 2025-11-28  242  		count_data_update_key_fail(u, k,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  243  				    bkey_i_to_s_c(bch2_keylist_front(&u->op.insert_keys)),
880d14d77ea984 fs/bcachefs/data_update.c Kent Overstreet 2025-09-27  244  				    insert, "new replicas conflicted:");
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  245  		bch2_btree_iter_advance(iter);
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  246  		return 0;
bb6c4b92fd8566 fs/bcachefs/data_update.c Kent Overstreet 2023-03-10  247  	}
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  248  
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  249  	/* Now, drop pointers that conflict with what we just wrote: */
7a49cae1960fba fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  250  	bch2_bkey_drop_ptrs_noerror(bkey_i_to_s(insert), p, entry,
7a49cae1960fba fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  251  		bch2_bkey_has_device(c, bkey_i_to_s(&new->k_i), p.ptr.dev));
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  252  
a184baa633639c fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  253  	/* Add the pointers we just wrote: */
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  254  	union bch_extent_entry *entry;
57c723de7d4c59 fs/bcachefs/data_update.c Kent Overstreet 2023-03-04  255  	extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
44c1946444a82a fs/bcachefs/data/update.c Kent Overstreet 2025-11-05  256  		bch2_extent_ptr_decoded_append(c, insert, &p);
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  257  
2b07b20ee6702c fs/bcachefs/data/update.c Kent Overstreet 2025-12-24  258  	try(bch2_bkey_drop_extra_durability(trans, &opts, bkey_i_to_s(insert)));
2b07b20ee6702c fs/bcachefs/data/update.c Kent Overstreet 2025-12-24  259  
ec2537c2c93df7 fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  260  	bch2_bkey_drop_extra_cached_ptrs(c, &opts, bkey_i_to_s(insert));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  261  
a580dc4d613691 fs/bcachefs/data/update.c Kent Overstreet 2026-01-17  262  	bch2_bkey_propagate_incompressible(c, insert, k);
a580dc4d613691 fs/bcachefs/data/update.c Kent Overstreet 2026-01-17  263  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  264  	bool should_check_enospc = false;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  265  	s64 i_sectors_delta = 0, disk_sectors_delta = 0;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  266  	try(bch2_sum_sector_overwrites(trans, iter, insert,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  267  				       &should_check_enospc,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  268  				       &i_sectors_delta,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  269  				       &disk_sectors_delta));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  270  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  271  	if (disk_sectors_delta > (s64) u->op.res.sectors)
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  272  		try(bch2_disk_reservation_add(c, &u->op.res,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  273  					disk_sectors_delta - u->op.res.sectors,
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  274  					!should_check_enospc
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  275  					? BCH_DISK_RESERVATION_NOFAIL : 0));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  276  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  277  	struct bpos next_pos = insert->k.p;
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  278  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  279  	try(bch2_trans_log_str(trans, bch2_data_update_type_strs[u->opts.type]));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  280  	try(bch2_trans_log_bkey(trans, u->btree_id, 0, u->k.k));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  281  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  282  	try(bch2_insert_snapshot_whiteouts(trans, u->btree_id, k.k->p, bkey_start_pos(&insert->k)));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  283  	try(bch2_insert_snapshot_whiteouts(trans, u->btree_id, k.k->p, insert->k.p));
c501fef6deb1de fs/bcachefs/data_update.c Kent Overstreet 2022-06-13  284  
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  285  	/*
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  286  	 * This set_needs_reconcile call is only for verifying that the data we
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  287  	 * just wrote was written correctly, otherwise we could fail to flag
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  288  	 * incorrectly written data due to needs_rb already being set on the
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  289  	 * existing extent
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  290  	 */
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  291  	try(bch2_bkey_set_needs_reconcile(trans, NULL, &opts, &new->k_i,
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  292  					  SET_NEEDS_REBALANCE_foreground,
d772c15601e0ae fs/bcachefs/data/update.c Kent Overstreet 2025-08-19  293  					  u->op.opts.change_cookie));
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  294  	/* This is the real set_needs_reconcile() call */
581f7e27bc9728 fs/bcachefs/data/update.c Kent Overstreet 2025-11-12  295  	try(bch2_bkey_set_needs_reconcile(trans, NULL, &opts, insert,
f25f76a79cce39 fs/bcachefs/data_update.c Kent Overstreet 2025-08-23  296  					  SET_NEEDS_REBALANCE_foreground,
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  297  					  u->op.opts.change_cookie));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  298  
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  299  	if (u->op.opts.change_cookie == c->opt_change_cookie) {
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  300  		struct bkey_durability old_durability, new_durability;
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  301  		try(bch2_bkey_durability(trans, k, &old_durability));
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  302  		try(bch2_bkey_durability(trans, bkey_i_to_s_c(insert), &new_durability));
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  303  
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  304  		if (new_durability.total < old_durability.total &&
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  305  		    new_durability.total < min(u->op.opts.data_replicas, opts.data_replicas)) {
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  306  			CLASS(bch_log_msg, msg)(c);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  307  			prt_printf(&msg.m, "Data update would have reduced extent durability:\n");
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  308  			prt_printf(&msg.m, "Old extent %u, new %u, option specifies %u\n",
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  309  				   old_durability.total,
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  310  				   new_durability.total,
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  311  				   opts.data_replicas);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  312  			prt_str(&msg.m, "old: ");
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  313  			bch2_bkey_val_to_text(&msg.m, c, k);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  314  			prt_newline(&msg.m);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  315  
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  316  			prt_str(&msg.m, "new: ");
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  317  			bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(insert));
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  318  			prt_newline(&msg.m);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  319  
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  320  			bch2_data_update_to_text(&msg.m, u);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  321  			bch2_fs_emergency_read_only(c, &msg.m);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  322  			return bch_err_throw(c, emergency_ro);
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  323  		}
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  324  	}
730b9f954426e6 fs/bcachefs/data/update.c Kent Overstreet 2026-01-23  325  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  326  	try(bch2_trans_update(trans, iter, insert, BTREE_UPDATE_internal_snapshot_node));
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  327  	try(bch2_trans_commit(trans, &u->op.res, NULL,
cb52d23e77a6e5 fs/bcachefs/data_update.c Kent Overstreet 2023-11-11  328  			      BCH_TRANS_COMMIT_no_check_rw|
cb52d23e77a6e5 fs/bcachefs/data_update.c Kent Overstreet 2023-11-11  329  			      BCH_TRANS_COMMIT_no_enospc|
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  330  			      u->opts.commit_flags));
c7378d0e5e23db fs/bcachefs/data_update.c Kent Overstreet 2025-05-13  331  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  332  	bch2_btree_iter_set_pos(iter, next_pos);
674cfc26240b78 fs/bcachefs/data_update.c Kent Overstreet 2022-08-27  333  
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  334  	event_add_trace(c, data_update_key, new->k.size, buf, ({
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  335  		prt_str(&buf, "\nold: ");
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  336  		bch2_bkey_val_to_text(&buf, c, old);
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  337  		prt_str(&buf, "\nk:   ");
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  338  		bch2_bkey_val_to_text(&buf, c, k);
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  339  		prt_str(&buf, "\nnew: ");
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  340  		bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(insert));
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  341  	}));
abb687e3851cbb fs/bcachefs/data/update.c Kent Overstreet 2025-11-25  342  
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  343  	return 0;
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08 @344  }
d31fc1c200e6bc fs/bcachefs/data/update.c Kent Overstreet 2025-11-08  345  

:::::: The code at line 344 was first introduced by commit
:::::: d31fc1c200e6bc8b1a8f13b2ffa46d9fee90bc0f bcachefs: data_update_index_update_key()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
