Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BFE1A712
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+7rgB6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700055418; x=1731591418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJ5qAybifBXtLFl1BCkMFw3tNAD5VXXnoyauRuqC+fA=;
  b=E+7rgB6DqEtLjJepHrvnDsyM9OE56I2jj4jWDkADCG4Hj5Jzy15uVMUo
   LurdJdMezH2VKwysUhS0Pw95afxF55hebsH8DyI+NO4GI+s0TnFdhQfYm
   0XLzfA2hYlr6o1HhCHVq7DlCWfMRm2i/Gq5mdlczNCXa19VU0ychBTZNo
   7U3wg87NMa4H6wmF7evz0WG+Ov2K06Aa8tHHSWVlpavPjbHUgaewswmfU
   TqVnyF/U7OVDkK2e6l/z5M/rI0OcqkfWNFHJli8kgvl5MiG/NvJa3Pynm
   ut60QJhUTTXAE5XactEE0NwGy+uTGvZLKA+4CEzKghx/G5sUJRSLum8fa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381269849"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="381269849"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938484996"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938484996"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 05:36:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3G4a-0000Mk-34;
	Wed, 15 Nov 2023 13:36:52 +0000
Date: Wed, 15 Nov 2023 21:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1215/1493] fs/bcachefs/data_update.c:321:1:
 warning: the frame size of 1072 bytes is larger than 1024 bytes
Message-ID: <202311152125.a3QaKtRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc962b35b139dd52319e6fc0f4bab00593bf38c9
commit: 701ff57eb3d7c86c9a53de959e0c48fa8ca446d4 [1215/1493] bcachefs: Check for nonce offset inconsistency in data_update path
config: i386-buildonly-randconfig-004-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152125.a3QaKtRw-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152125.a3QaKtRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152125.a3QaKtRw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/data_update.c:10:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:2: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |  prt_vprintf(err_msg, fmt, args);
         |  ^~~~~~~~~~~
   fs/bcachefs/data_update.c: In function '__bch2_data_update_index_update':
>> fs/bcachefs/data_update.c:321:1: warning: the frame size of 1072 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     321 | }
         | ^


vim +321 fs/bcachefs/data_update.c

bb6c4b92fd8566 Kent Overstreet 2023-03-10   90  
4dcd1cae72912a Kent Overstreet 2022-11-14   91  static int __bch2_data_update_index_update(struct btree_trans *trans,
4dcd1cae72912a Kent Overstreet 2022-11-14   92  					   struct bch_write_op *op)
c501fef6deb1de Kent Overstreet 2022-06-13   93  {
c501fef6deb1de Kent Overstreet 2022-06-13   94  	struct bch_fs *c = op->c;
c501fef6deb1de Kent Overstreet 2022-06-13   95  	struct btree_iter iter;
c501fef6deb1de Kent Overstreet 2022-06-13   96  	struct data_update *m =
c501fef6deb1de Kent Overstreet 2022-06-13   97  		container_of(op, struct data_update, op);
c501fef6deb1de Kent Overstreet 2022-06-13   98  	struct keylist *keys = &op->insert_keys;
c501fef6deb1de Kent Overstreet 2022-06-13   99  	struct bkey_buf _new, _insert;
c501fef6deb1de Kent Overstreet 2022-06-13  100  	int ret = 0;
c501fef6deb1de Kent Overstreet 2022-06-13  101  
c501fef6deb1de Kent Overstreet 2022-06-13  102  	bch2_bkey_buf_init(&_new);
c501fef6deb1de Kent Overstreet 2022-06-13  103  	bch2_bkey_buf_init(&_insert);
c501fef6deb1de Kent Overstreet 2022-06-13  104  	bch2_bkey_buf_realloc(&_insert, c, U8_MAX);
c501fef6deb1de Kent Overstreet 2022-06-13  105  
4dcd1cae72912a Kent Overstreet 2022-11-14  106  	bch2_trans_iter_init(trans, &iter, m->btree_id,
c501fef6deb1de Kent Overstreet 2022-06-13  107  			     bkey_start_pos(&bch2_keylist_front(keys)->k),
c501fef6deb1de Kent Overstreet 2022-06-13  108  			     BTREE_ITER_SLOTS|BTREE_ITER_INTENT);
c501fef6deb1de Kent Overstreet 2022-06-13  109  
c501fef6deb1de Kent Overstreet 2022-06-13  110  	while (1) {
c501fef6deb1de Kent Overstreet 2022-06-13  111  		struct bkey_s_c k;
7f5c5d20f01483 Kent Overstreet 2022-06-13  112  		struct bkey_s_c old = bkey_i_to_s_c(m->k.k);
57c723de7d4c59 Kent Overstreet 2023-03-04  113  		struct bkey_i *insert = NULL;
c501fef6deb1de Kent Overstreet 2022-06-13  114  		struct bkey_i_extent *new;
57c723de7d4c59 Kent Overstreet 2023-03-04  115  		const union bch_extent_entry *entry_c;
57c723de7d4c59 Kent Overstreet 2023-03-04  116  		union bch_extent_entry *entry;
c501fef6deb1de Kent Overstreet 2022-06-13  117  		struct extent_ptr_decoded p;
57c723de7d4c59 Kent Overstreet 2023-03-04  118  		struct bch_extent_ptr *ptr;
57c723de7d4c59 Kent Overstreet 2023-03-04  119  		const struct bch_extent_ptr *ptr_c;
c501fef6deb1de Kent Overstreet 2022-06-13  120  		struct bpos next_pos;
b08b492ed3068b Kent Overstreet 2021-11-08  121  		bool should_check_enospc;
c501fef6deb1de Kent Overstreet 2022-06-13  122  		s64 i_sectors_delta = 0, disk_sectors_delta = 0;
57c723de7d4c59 Kent Overstreet 2023-03-04  123  		unsigned rewrites_found = 0, durability, i;
c501fef6deb1de Kent Overstreet 2022-06-13  124  
4dcd1cae72912a Kent Overstreet 2022-11-14  125  		bch2_trans_begin(trans);
c501fef6deb1de Kent Overstreet 2022-06-13  126  
c501fef6deb1de Kent Overstreet 2022-06-13  127  		k = bch2_btree_iter_peek_slot(&iter);
c501fef6deb1de Kent Overstreet 2022-06-13  128  		ret = bkey_err(k);
c501fef6deb1de Kent Overstreet 2022-06-13  129  		if (ret)
c501fef6deb1de Kent Overstreet 2022-06-13  130  			goto err;
c501fef6deb1de Kent Overstreet 2022-06-13  131  
c501fef6deb1de Kent Overstreet 2022-06-13  132  		new = bkey_i_to_extent(bch2_keylist_front(keys));
c501fef6deb1de Kent Overstreet 2022-06-13  133  
bb6c4b92fd8566 Kent Overstreet 2023-03-10  134  		if (!bch2_extents_match(k, old)) {
bb6c4b92fd8566 Kent Overstreet 2023-03-10  135  			trace_move_extent_fail2(m, k, bkey_i_to_s_c(&new->k_i),
bb6c4b92fd8566 Kent Overstreet 2023-03-10  136  						NULL, "no match:");
57c723de7d4c59 Kent Overstreet 2023-03-04  137  			goto nowork;
bb6c4b92fd8566 Kent Overstreet 2023-03-10  138  		}
c501fef6deb1de Kent Overstreet 2022-06-13  139  
c501fef6deb1de Kent Overstreet 2022-06-13  140  		bkey_reassemble(_insert.k, k);
c501fef6deb1de Kent Overstreet 2022-06-13  141  		insert = _insert.k;
c501fef6deb1de Kent Overstreet 2022-06-13  142  
c501fef6deb1de Kent Overstreet 2022-06-13  143  		bch2_bkey_buf_copy(&_new, c, bch2_keylist_front(keys));
c501fef6deb1de Kent Overstreet 2022-06-13  144  		new = bkey_i_to_extent(_new.k);
c501fef6deb1de Kent Overstreet 2022-06-13  145  		bch2_cut_front(iter.pos, &new->k_i);
c501fef6deb1de Kent Overstreet 2022-06-13  146  
c501fef6deb1de Kent Overstreet 2022-06-13  147  		bch2_cut_front(iter.pos,	insert);
c501fef6deb1de Kent Overstreet 2022-06-13  148  		bch2_cut_back(new->k.p,		insert);
c501fef6deb1de Kent Overstreet 2022-06-13  149  		bch2_cut_back(insert->k.p,	&new->k_i);
c501fef6deb1de Kent Overstreet 2022-06-13  150  
7f5c5d20f01483 Kent Overstreet 2022-06-13  151  		/*
7f5c5d20f01483 Kent Overstreet 2022-06-13  152  		 * @old: extent that we read from
7f5c5d20f01483 Kent Overstreet 2022-06-13  153  		 * @insert: key that we're going to update, initialized from
7f5c5d20f01483 Kent Overstreet 2022-06-13  154  		 * extent currently in btree - same as @old unless we raced with
7f5c5d20f01483 Kent Overstreet 2022-06-13  155  		 * other updates
7f5c5d20f01483 Kent Overstreet 2022-06-13  156  		 * @new: extent with new pointers that we'll be adding to @insert
7f5c5d20f01483 Kent Overstreet 2022-06-13  157  		 *
7f5c5d20f01483 Kent Overstreet 2022-06-13  158  		 * Fist, drop rewrite_ptrs from @new:
7f5c5d20f01483 Kent Overstreet 2022-06-13  159  		 */
7f5c5d20f01483 Kent Overstreet 2022-06-13  160  		i = 0;
57c723de7d4c59 Kent Overstreet 2023-03-04  161  		bkey_for_each_ptr_decode(old.k, bch2_bkey_ptrs_c(old), p, entry_c) {
7f5c5d20f01483 Kent Overstreet 2022-06-13  162  			if (((1U << i) & m->data_opts.rewrite_ptrs) &&
57c723de7d4c59 Kent Overstreet 2023-03-04  163  			    (ptr = bch2_extent_has_ptr(old, p, bkey_i_to_s(insert))) &&
57c723de7d4c59 Kent Overstreet 2023-03-04  164  			    !ptr->cached) {
57c723de7d4c59 Kent Overstreet 2023-03-04  165  				bch2_extent_ptr_set_cached(bkey_i_to_s(insert), ptr);
57c723de7d4c59 Kent Overstreet 2023-03-04  166  				rewrites_found |= 1U << i;
7f5c5d20f01483 Kent Overstreet 2022-06-13  167  			}
7f5c5d20f01483 Kent Overstreet 2022-06-13  168  			i++;
c501fef6deb1de Kent Overstreet 2022-06-13  169  		}
c501fef6deb1de Kent Overstreet 2022-06-13  170  
57c723de7d4c59 Kent Overstreet 2023-03-04  171  		if (m->data_opts.rewrite_ptrs &&
57c723de7d4c59 Kent Overstreet 2023-03-04  172  		    !rewrites_found &&
bb6c4b92fd8566 Kent Overstreet 2023-03-10  173  		    bch2_bkey_durability(c, k) >= m->op.opts.data_replicas) {
bb6c4b92fd8566 Kent Overstreet 2023-03-10  174  			trace_move_extent_fail2(m, k, bkey_i_to_s_c(&new->k_i), insert, "no rewrites found:");
57c723de7d4c59 Kent Overstreet 2023-03-04  175  			goto nowork;
bb6c4b92fd8566 Kent Overstreet 2023-03-10  176  		}
7f5c5d20f01483 Kent Overstreet 2022-06-13  177  
d7dd3fb84f05a0 Kent Overstreet 2023-01-07  178  		/*
57c723de7d4c59 Kent Overstreet 2023-03-04  179  		 * A replica that we just wrote might conflict with a replica
57c723de7d4c59 Kent Overstreet 2023-03-04  180  		 * that we want to keep, due to racing with another move:
d7dd3fb84f05a0 Kent Overstreet 2023-01-07  181  		 */
57c723de7d4c59 Kent Overstreet 2023-03-04  182  restart_drop_conflicting_replicas:
57c723de7d4c59 Kent Overstreet 2023-03-04  183  		extent_for_each_ptr(extent_i_to_s(new), ptr)
57c723de7d4c59 Kent Overstreet 2023-03-04  184  			if ((ptr_c = bch2_bkey_has_device_c(bkey_i_to_s_c(insert), ptr->dev)) &&
57c723de7d4c59 Kent Overstreet 2023-03-04  185  			    !ptr_c->cached) {
57c723de7d4c59 Kent Overstreet 2023-03-04  186  				bch2_bkey_drop_ptr_noerror(bkey_i_to_s(&new->k_i), ptr);
57c723de7d4c59 Kent Overstreet 2023-03-04  187  				goto restart_drop_conflicting_replicas;
c501fef6deb1de Kent Overstreet 2022-06-13  188  			}
c501fef6deb1de Kent Overstreet 2022-06-13  189  
bb6c4b92fd8566 Kent Overstreet 2023-03-10  190  		if (!bkey_val_u64s(&new->k)) {
bb6c4b92fd8566 Kent Overstreet 2023-03-10  191  			trace_move_extent_fail2(m, k, bkey_i_to_s_c(&new->k_i), insert, "new replicas conflicted:");
57c723de7d4c59 Kent Overstreet 2023-03-04  192  			goto nowork;
bb6c4b92fd8566 Kent Overstreet 2023-03-10  193  		}
57c723de7d4c59 Kent Overstreet 2023-03-04  194  
57c723de7d4c59 Kent Overstreet 2023-03-04  195  		/* Now, drop pointers that conflict with what we just wrote: */
57c723de7d4c59 Kent Overstreet 2023-03-04  196  		extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
57c723de7d4c59 Kent Overstreet 2023-03-04  197  			if ((ptr = bch2_bkey_has_device(bkey_i_to_s(insert), p.ptr.dev)))
57c723de7d4c59 Kent Overstreet 2023-03-04  198  				bch2_bkey_drop_ptr_noerror(bkey_i_to_s(insert), ptr);
57c723de7d4c59 Kent Overstreet 2023-03-04  199  
57c723de7d4c59 Kent Overstreet 2023-03-04  200  		durability = bch2_bkey_durability(c, bkey_i_to_s_c(insert)) +
57c723de7d4c59 Kent Overstreet 2023-03-04  201  			bch2_bkey_durability(c, bkey_i_to_s_c(&new->k_i));
57c723de7d4c59 Kent Overstreet 2023-03-04  202  
57c723de7d4c59 Kent Overstreet 2023-03-04  203  		/* Now, drop excess replicas: */
57c723de7d4c59 Kent Overstreet 2023-03-04  204  restart_drop_extra_replicas:
57c723de7d4c59 Kent Overstreet 2023-03-04  205  		bkey_for_each_ptr_decode(old.k, bch2_bkey_ptrs(bkey_i_to_s(insert)), p, entry) {
57c723de7d4c59 Kent Overstreet 2023-03-04  206  			unsigned ptr_durability = bch2_extent_ptr_durability(c, &p);
57c723de7d4c59 Kent Overstreet 2023-03-04  207  
57c723de7d4c59 Kent Overstreet 2023-03-04  208  			if (!p.ptr.cached &&
57c723de7d4c59 Kent Overstreet 2023-03-04  209  			    durability - ptr_durability >= m->op.opts.data_replicas) {
57c723de7d4c59 Kent Overstreet 2023-03-04  210  				durability -= ptr_durability;
be9e782df3cb55 Kent Overstreet 2023-10-27  211  
57c723de7d4c59 Kent Overstreet 2023-03-04  212  				bch2_extent_ptr_set_cached(bkey_i_to_s(insert), &entry->ptr);
57c723de7d4c59 Kent Overstreet 2023-03-04  213  				goto restart_drop_extra_replicas;
57c723de7d4c59 Kent Overstreet 2023-03-04  214  			}
c501fef6deb1de Kent Overstreet 2022-06-13  215  		}
c501fef6deb1de Kent Overstreet 2022-06-13  216  
57c723de7d4c59 Kent Overstreet 2023-03-04  217  		/* Finally, add the pointers we just wrote: */
57c723de7d4c59 Kent Overstreet 2023-03-04  218  		extent_for_each_ptr_decode(extent_i_to_s(new), p, entry)
57c723de7d4c59 Kent Overstreet 2023-03-04  219  			bch2_extent_ptr_decoded_append(insert, &p);
c501fef6deb1de Kent Overstreet 2022-06-13  220  
7f5c5d20f01483 Kent Overstreet 2022-06-13  221  		bch2_bkey_narrow_crcs(insert, (struct bch_extent_crc_unpacked) { 0 });
c501fef6deb1de Kent Overstreet 2022-06-13  222  		bch2_extent_normalize(c, bkey_i_to_s(insert));
c501fef6deb1de Kent Overstreet 2022-06-13  223  
4dcd1cae72912a Kent Overstreet 2022-11-14  224  		ret = bch2_sum_sector_overwrites(trans, &iter, insert,
c501fef6deb1de Kent Overstreet 2022-06-13  225  						 &should_check_enospc,
c501fef6deb1de Kent Overstreet 2022-06-13  226  						 &i_sectors_delta,
c501fef6deb1de Kent Overstreet 2022-06-13  227  						 &disk_sectors_delta);
c501fef6deb1de Kent Overstreet 2022-06-13  228  		if (ret)
c501fef6deb1de Kent Overstreet 2022-06-13  229  			goto err;
c501fef6deb1de Kent Overstreet 2022-06-13  230  
c501fef6deb1de Kent Overstreet 2022-06-13  231  		if (disk_sectors_delta > (s64) op->res.sectors) {
c501fef6deb1de Kent Overstreet 2022-06-13  232  			ret = bch2_disk_reservation_add(c, &op->res,
c501fef6deb1de Kent Overstreet 2022-06-13  233  						disk_sectors_delta - op->res.sectors,
c501fef6deb1de Kent Overstreet 2022-06-13  234  						!should_check_enospc
c501fef6deb1de Kent Overstreet 2022-06-13  235  						? BCH_DISK_RESERVATION_NOFAIL : 0);
c501fef6deb1de Kent Overstreet 2022-06-13  236  			if (ret)
c501fef6deb1de Kent Overstreet 2022-06-13  237  				goto out;
c501fef6deb1de Kent Overstreet 2022-06-13  238  		}
c501fef6deb1de Kent Overstreet 2022-06-13  239  
c501fef6deb1de Kent Overstreet 2022-06-13  240  		next_pos = insert->k.p;
c501fef6deb1de Kent Overstreet 2022-06-13  241  
701ff57eb3d7c8 Kent Overstreet 2023-11-03  242  		/*
701ff57eb3d7c8 Kent Overstreet 2023-11-03  243  		 * Check for nonce offset inconsistency:
701ff57eb3d7c8 Kent Overstreet 2023-11-03  244  		 * This is debug code - we've been seeing this bug rarely, and
701ff57eb3d7c8 Kent Overstreet 2023-11-03  245  		 * it's been hard to reproduce, so this should give us some more
701ff57eb3d7c8 Kent Overstreet 2023-11-03  246  		 * information when it does occur:
701ff57eb3d7c8 Kent Overstreet 2023-11-03  247  		 */
701ff57eb3d7c8 Kent Overstreet 2023-11-03  248  		struct printbuf err = PRINTBUF;
701ff57eb3d7c8 Kent Overstreet 2023-11-03  249  		int invalid = bch2_bkey_invalid(c, bkey_i_to_s_c(insert), __btree_node_type(0, m->btree_id), 0, &err);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  250  		printbuf_exit(&err);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  251  
701ff57eb3d7c8 Kent Overstreet 2023-11-03  252  		if (invalid) {
701ff57eb3d7c8 Kent Overstreet 2023-11-03  253  			struct printbuf buf = PRINTBUF;
701ff57eb3d7c8 Kent Overstreet 2023-11-03  254  
701ff57eb3d7c8 Kent Overstreet 2023-11-03  255  			prt_str(&buf, "about to insert invalid key in data update path");
701ff57eb3d7c8 Kent Overstreet 2023-11-03  256  			prt_str(&buf, "\nold: ");
701ff57eb3d7c8 Kent Overstreet 2023-11-03  257  			bch2_bkey_val_to_text(&buf, c, old);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  258  			prt_str(&buf, "\nk:   ");
701ff57eb3d7c8 Kent Overstreet 2023-11-03  259  			bch2_bkey_val_to_text(&buf, c, k);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  260  			prt_str(&buf, "\nnew: ");
701ff57eb3d7c8 Kent Overstreet 2023-11-03  261  			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(insert));
701ff57eb3d7c8 Kent Overstreet 2023-11-03  262  
701ff57eb3d7c8 Kent Overstreet 2023-11-03  263  			bch2_print_string_as_lines(KERN_ERR, buf.buf);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  264  			printbuf_exit(&buf);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  265  
701ff57eb3d7c8 Kent Overstreet 2023-11-03  266  			bch2_fatal_error(c);
701ff57eb3d7c8 Kent Overstreet 2023-11-03  267  			goto out;
701ff57eb3d7c8 Kent Overstreet 2023-11-03  268  		}
701ff57eb3d7c8 Kent Overstreet 2023-11-03  269  
ad520141b15578 Kent Overstreet 2023-05-27  270  		ret =   bch2_insert_snapshot_whiteouts(trans, m->btree_id,
ad520141b15578 Kent Overstreet 2023-05-27  271  						k.k->p, bkey_start_pos(&insert->k)) ?:
ad520141b15578 Kent Overstreet 2023-05-27  272  			bch2_insert_snapshot_whiteouts(trans, m->btree_id,
fb3f57bb1177ae Kent Overstreet 2023-10-20  273  						k.k->p, insert->k.p) ?:
fb3f57bb1177ae Kent Overstreet 2023-10-20  274  			bch2_bkey_set_needs_rebalance(c, insert,
fb3f57bb1177ae Kent Overstreet 2023-10-20  275  						      op->opts.background_target,
fb3f57bb1177ae Kent Overstreet 2023-10-20  276  						      op->opts.background_compression) ?:
fb3f57bb1177ae Kent Overstreet 2023-10-20  277  			bch2_trans_update(trans, &iter, insert,
c501fef6deb1de Kent Overstreet 2022-06-13  278  				BTREE_UPDATE_INTERNAL_SNAPSHOT_NODE) ?:
4dcd1cae72912a Kent Overstreet 2022-11-14  279  			bch2_trans_commit(trans, &op->res,
a1ee777bfcceeb Kent Overstreet 2022-11-03  280  				NULL,
b40901b0f71825 Kent Overstreet 2023-03-13  281  				BTREE_INSERT_NOCHECK_RW|
c501fef6deb1de Kent Overstreet 2022-06-13  282  				BTREE_INSERT_NOFAIL|
c501fef6deb1de Kent Overstreet 2022-06-13  283  				m->data_opts.btree_insert_flags);
c501fef6deb1de Kent Overstreet 2022-06-13  284  		if (!ret) {
c501fef6deb1de Kent Overstreet 2022-06-13  285  			bch2_btree_iter_set_pos(&iter, next_pos);
674cfc26240b78 Kent Overstreet 2022-08-27  286  
674cfc26240b78 Kent Overstreet 2022-08-27  287  			this_cpu_add(c->counters[BCH_COUNTER_move_extent_finish], new->k.size);
5a21764db13877 Kent Overstreet 2023-04-20  288  			trace_move_extent_finish2(c, bkey_i_to_s_c(&new->k_i));
c501fef6deb1de Kent Overstreet 2022-06-13  289  		}
c501fef6deb1de Kent Overstreet 2022-06-13  290  err:
549d173c1bd9b5 Kent Overstreet 2022-07-17  291  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
c501fef6deb1de Kent Overstreet 2022-06-13  292  			ret = 0;
c501fef6deb1de Kent Overstreet 2022-06-13  293  		if (ret)
c501fef6deb1de Kent Overstreet 2022-06-13  294  			break;
c501fef6deb1de Kent Overstreet 2022-06-13  295  next:
e88a75ebe86c1d Kent Overstreet 2022-11-24  296  		while (bkey_ge(iter.pos, bch2_keylist_front(keys)->k.p)) {
c501fef6deb1de Kent Overstreet 2022-06-13  297  			bch2_keylist_pop_front(keys);
c501fef6deb1de Kent Overstreet 2022-06-13  298  			if (bch2_keylist_empty(keys))
c501fef6deb1de Kent Overstreet 2022-06-13  299  				goto out;
c501fef6deb1de Kent Overstreet 2022-06-13  300  		}
c501fef6deb1de Kent Overstreet 2022-06-13  301  		continue;
57c723de7d4c59 Kent Overstreet 2023-03-04  302  nowork:
d5eade93452bd1 Kent Overstreet 2023-10-23  303  		if (m->stats && m->stats) {
c501fef6deb1de Kent Overstreet 2022-06-13  304  			BUG_ON(k.k->p.offset <= iter.pos.offset);
d5eade93452bd1 Kent Overstreet 2023-10-23  305  			atomic64_inc(&m->stats->keys_raced);
c501fef6deb1de Kent Overstreet 2022-06-13  306  			atomic64_add(k.k->p.offset - iter.pos.offset,
d5eade93452bd1 Kent Overstreet 2023-10-23  307  				     &m->stats->sectors_raced);
c501fef6deb1de Kent Overstreet 2022-06-13  308  		}
674cfc26240b78 Kent Overstreet 2022-08-27  309  
c26463ce9940d1 Kent Overstreet 2023-05-26  310  		this_cpu_inc(c->counters[BCH_COUNTER_move_extent_fail]);
674cfc26240b78 Kent Overstreet 2022-08-27  311  
c501fef6deb1de Kent Overstreet 2022-06-13  312  		bch2_btree_iter_advance(&iter);
c501fef6deb1de Kent Overstreet 2022-06-13  313  		goto next;
c501fef6deb1de Kent Overstreet 2022-06-13  314  	}
c501fef6deb1de Kent Overstreet 2022-06-13  315  out:
4dcd1cae72912a Kent Overstreet 2022-11-14  316  	bch2_trans_iter_exit(trans, &iter);
c501fef6deb1de Kent Overstreet 2022-06-13  317  	bch2_bkey_buf_exit(&_insert, c);
c501fef6deb1de Kent Overstreet 2022-06-13  318  	bch2_bkey_buf_exit(&_new, c);
549d173c1bd9b5 Kent Overstreet 2022-07-17  319  	BUG_ON(bch2_err_matches(ret, BCH_ERR_transaction_restart));
c501fef6deb1de Kent Overstreet 2022-06-13  320  	return ret;
c501fef6deb1de Kent Overstreet 2022-06-13 @321  }
c501fef6deb1de Kent Overstreet 2022-06-13  322  

:::::: The code at line 321 was first introduced by commit
:::::: c501fef6deb1de13d45d22a3df32906adf17275b bcachefs: Pull out data_update.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
