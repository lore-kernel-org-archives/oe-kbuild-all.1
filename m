Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9708C1D63E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534191; cv=none; b=WS7t09CSOCNlNn/GO0vLVBdFC+Mz2knfEwrvFuE37rkVJLQ833d+T7WcvU/QPYuNMOVZhsrew7m3ZKi3dMA+kmCEZnMTkHFoiWg1bOCORLvWFZebleV1miFO1xCOQTZAuAkAAckoucwvccbvj0CCXZW0Mud5S5qgBCM+Yoy1dyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534191; c=relaxed/simple;
	bh=N8RM8zXRXgeE7TFdObfkI8+MhZDIFZtiswo8xPKnmI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZrJMbJTXkBw71KEWR7M/aJ2W8U4O/RwhIgha+rWYGwH755l1TIj87GM2zZTJ2YhFzkJJto7/QBj0LiYfOM7TtORJdEvDpNz9mJ+SHkDcKOEkDG0QkfjyyIl4XO+3x+KAeR6r+5WG4chgOFqzvTckaJHbdRDzYjHOPp1dRLnCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYR5Zybt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYR5Zybt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748534189; x=1780070189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N8RM8zXRXgeE7TFdObfkI8+MhZDIFZtiswo8xPKnmI8=;
  b=CYR5ZybtX8B7tJb5nh5fsOS9niZoSy5S95aaiuAKi+UWPTKix5h/ntYi
   ACi6eacxedrvo8JhLg3ocsY2H08SKEm/poSIl3tMDQ1zG4/uHFQLSlljH
   8UvGKFibkkf97n57O1vrzGvbDb2snQ90O/HhoYw46oFaffbje8HEi/RgK
   MZz9TXfn2a0mGoNut0kBLGYHD50QPIPQzN7zABC7C7HBzpQauD8dNkL5n
   UW2jbqRB6JvrsXG3KvQvuhxJX9LQSs9mgk5/8w8kA0cp5zpHvicj74N/7
   meIWp+vurg0ocnheDGas6JrRqxPtkFuG26X9tR45gJT4W7fWeVffp+VHM
   w==;
X-CSE-ConnectionGUID: lCRc4yvMR4mygFti8aLVIQ==
X-CSE-MsgGUID: +PXxFfqyTGykkc7ZuzCUfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50482505"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="50482505"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 08:56:28 -0700
X-CSE-ConnectionGUID: 3gjDXHYnQLalUk+2Geas2Q==
X-CSE-MsgGUID: gFN6oXzyT+Ovt91B0hYt8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="143633124"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2025 08:56:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKfcH-000WqH-1y;
	Thu, 29 May 2025 15:56:25 +0000
Date: Thu, 29 May 2025 23:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 318/319] fs/bcachefs/str_hash.c:345:1:
 warning: the frame size of 1328 bytes is larger than 1280 bytes
Message-ID: <202505292327.4rRXNJfQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   612eff333ca2014a51b5d56e04ed0003fa15be06
commit: df8ef355f2717c0644a6bc8131513296c41b6163 [318/319] bcachefs: bch2_str_hash_check_key() may now be called without snapshots_seen
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250529/202505292327.4rRXNJfQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505292327.4rRXNJfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505292327.4rRXNJfQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/str_hash.c: In function '__bch2_str_hash_check_key':
>> fs/bcachefs/str_hash.c:345:1: warning: the frame size of 1328 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     345 | }
         | ^


vim +345 fs/bcachefs/str_hash.c

6ea607ca61475f Kent Overstreet 2024-12-08  223  
6ea607ca61475f Kent Overstreet 2024-12-08  224  int __bch2_str_hash_check_key(struct btree_trans *trans,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  225  			      struct snapshots_seen *s,
6ea607ca61475f Kent Overstreet 2024-12-08  226  			      const struct bch_hash_desc *desc,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  227  			      struct bch_hash_info *hash_info,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  228  			      struct btree_iter *k_iter, struct bkey_s_c hash_k)
d4c9fc000bd1bc Kent Overstreet 2024-12-04  229  {
d4c9fc000bd1bc Kent Overstreet 2024-12-04  230  	struct bch_fs *c = trans->c;
9180ad2e161b70 Kent Overstreet 2025-03-21  231  	struct btree_iter iter = {};
d4c9fc000bd1bc Kent Overstreet 2024-12-04  232  	struct printbuf buf = PRINTBUF;
df8ef355f2717c Kent Overstreet 2025-05-28  233  	struct snapshots_seen s_local;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  234  	struct bkey_s_c k;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  235  	int ret = 0;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  236  
6ea607ca61475f Kent Overstreet 2024-12-08  237  	u64 hash = desc->hash_bkey(hash_info, hash_k);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  238  	if (hash_k.k->p.offset < hash)
d4c9fc000bd1bc Kent Overstreet 2024-12-04  239  		goto bad_hash;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  240  
6ea607ca61475f Kent Overstreet 2024-12-08  241  	for_each_btree_key_norestart(trans, iter, desc->btree_id,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  242  				     SPOS(hash_k.k->p.inode, hash, hash_k.k->p.snapshot),
21828e2306c83b Kent Overstreet 2025-05-28  243  				     BTREE_ITER_slots|
21828e2306c83b Kent Overstreet 2025-05-28  244  				     BTREE_ITER_with_updates, k, ret) {
d4c9fc000bd1bc Kent Overstreet 2024-12-04  245  		if (bkey_eq(k.k->p, hash_k.k->p))
d4c9fc000bd1bc Kent Overstreet 2024-12-04  246  			break;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  247  
6ea607ca61475f Kent Overstreet 2024-12-08  248  		if (k.k->type == desc->key_type &&
6ea607ca61475f Kent Overstreet 2024-12-08  249  		    !desc->cmp_bkey(k, hash_k))
d4c9fc000bd1bc Kent Overstreet 2024-12-04  250  			goto duplicate_entries;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  251  
d4c9fc000bd1bc Kent Overstreet 2024-12-04  252  		if (bkey_deleted(k.k)) {
d4c9fc000bd1bc Kent Overstreet 2024-12-04  253  			bch2_trans_iter_exit(trans, &iter);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  254  			goto bad_hash;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  255  		}
d4c9fc000bd1bc Kent Overstreet 2024-12-04  256  	}
d4c9fc000bd1bc Kent Overstreet 2024-12-04  257  out:
d4c9fc000bd1bc Kent Overstreet 2024-12-04  258  	bch2_trans_iter_exit(trans, &iter);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  259  	printbuf_exit(&buf);
df8ef355f2717c Kent Overstreet 2025-05-28  260  	if (s == &s_local)
df8ef355f2717c Kent Overstreet 2025-05-28  261  		darray_exit(&s_local.ids);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  262  	return ret;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  263  bad_hash:
6ea607ca61475f Kent Overstreet 2024-12-08  264  	/*
6ea607ca61475f Kent Overstreet 2024-12-08  265  	 * Before doing any repair, check hash_info itself:
6ea607ca61475f Kent Overstreet 2024-12-08  266  	 */
6ea607ca61475f Kent Overstreet 2024-12-08  267  	ret = check_inode_hash_info_matches_root(trans, hash_k.k->p.inode, hash_info);
6ea607ca61475f Kent Overstreet 2024-12-08  268  	if (ret)
6ea607ca61475f Kent Overstreet 2024-12-08  269  		goto out;
6ea607ca61475f Kent Overstreet 2024-12-08  270  
df8ef355f2717c Kent Overstreet 2025-05-28  271  	if (!s) {
df8ef355f2717c Kent Overstreet 2025-05-28  272  		s = &s_local;
df8ef355f2717c Kent Overstreet 2025-05-28  273  		s->pos = k_iter->pos;
df8ef355f2717c Kent Overstreet 2025-05-28  274  		darray_init(&s->ids);
df8ef355f2717c Kent Overstreet 2025-05-28  275  
df8ef355f2717c Kent Overstreet 2025-05-28  276  		ret = bch2_get_snapshot_overwrites(trans, desc->btree_id, k_iter->pos, &s->ids);
df8ef355f2717c Kent Overstreet 2025-05-28  277  		if (ret)
df8ef355f2717c Kent Overstreet 2025-05-28  278  			goto out;
df8ef355f2717c Kent Overstreet 2025-05-28  279  	}
df8ef355f2717c Kent Overstreet 2025-05-28  280  
d4c9fc000bd1bc Kent Overstreet 2024-12-04  281  	if (fsck_err(trans, hash_table_key_wrong_offset,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  282  		     "hash table key at wrong offset: btree %s inode %llu offset %llu, hashed to %llu\n%s",
6ea607ca61475f Kent Overstreet 2024-12-08  283  		     bch2_btree_id_str(desc->btree_id), hash_k.k->p.inode, hash_k.k->p.offset, hash,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  284  		     (printbuf_reset(&buf),
d4c9fc000bd1bc Kent Overstreet 2024-12-04  285  		      bch2_bkey_val_to_text(&buf, c, hash_k), buf.buf))) {
d4c9fc000bd1bc Kent Overstreet 2024-12-04  286  		struct bkey_i *new = bch2_bkey_make_mut_noupdate(trans, hash_k);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  287  		if (IS_ERR(new))
d4c9fc000bd1bc Kent Overstreet 2024-12-04  288  			return PTR_ERR(new);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  289  
6ea607ca61475f Kent Overstreet 2024-12-08  290  		k = bch2_hash_set_or_get_in_snapshot(trans, &iter, *desc, hash_info,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  291  				       (subvol_inum) { 0, hash_k.k->p.inode },
d4c9fc000bd1bc Kent Overstreet 2024-12-04  292  				       hash_k.k->p.snapshot, new,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  293  				       STR_HASH_must_create|
d4c9fc000bd1bc Kent Overstreet 2024-12-04  294  				       BTREE_ITER_with_updates|
d4c9fc000bd1bc Kent Overstreet 2024-12-04  295  				       BTREE_UPDATE_internal_snapshot_node);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  296  		ret = bkey_err(k);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  297  		if (ret)
d4c9fc000bd1bc Kent Overstreet 2024-12-04  298  			goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  299  		if (k.k)
d4c9fc000bd1bc Kent Overstreet 2024-12-04  300  			goto duplicate_entries;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  301  
df8ef355f2717c Kent Overstreet 2025-05-28  302  		ret =   bch2_insert_snapshot_whiteouts(trans, desc->btree_id,
df8ef355f2717c Kent Overstreet 2025-05-28  303  						       k_iter->pos, new->k.p) ?:
df8ef355f2717c Kent Overstreet 2025-05-28  304  			bch2_hash_delete_at(trans, *desc, hash_info, k_iter,
21828e2306c83b Kent Overstreet 2025-05-28  305  					    BTREE_ITER_with_updates|
d4c9fc000bd1bc Kent Overstreet 2024-12-04  306  					    BTREE_UPDATE_internal_snapshot_node) ?:
6ea607ca61475f Kent Overstreet 2024-12-08  307  			bch2_fsck_update_backpointers(trans, s, *desc, hash_info, new) ?:
d4c9fc000bd1bc Kent Overstreet 2024-12-04  308  			bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc) ?:
21828e2306c83b Kent Overstreet 2025-05-28  309  			-BCH_ERR_transaction_restart_commit;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  310  		goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  311  	}
d4c9fc000bd1bc Kent Overstreet 2024-12-04  312  fsck_err:
d4c9fc000bd1bc Kent Overstreet 2024-12-04  313  	goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  314  duplicate_entries:
6ea607ca61475f Kent Overstreet 2024-12-08  315  	ret = hash_pick_winner(trans, *desc, hash_info, hash_k, k);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  316  	if (ret < 0)
d4c9fc000bd1bc Kent Overstreet 2024-12-04  317  		goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  318  
d4c9fc000bd1bc Kent Overstreet 2024-12-04  319  	if (!fsck_err(trans, hash_table_key_duplicate,
d4c9fc000bd1bc Kent Overstreet 2024-12-04  320  		      "duplicate hash table keys%s:\n%s",
d4c9fc000bd1bc Kent Overstreet 2024-12-04  321  		      ret != 2 ? "" : ", both point to valid inodes",
d4c9fc000bd1bc Kent Overstreet 2024-12-04  322  		      (printbuf_reset(&buf),
d4c9fc000bd1bc Kent Overstreet 2024-12-04  323  		       bch2_bkey_val_to_text(&buf, c, hash_k),
d4c9fc000bd1bc Kent Overstreet 2024-12-04  324  		       prt_newline(&buf),
d4c9fc000bd1bc Kent Overstreet 2024-12-04  325  		       bch2_bkey_val_to_text(&buf, c, k),
d4c9fc000bd1bc Kent Overstreet 2024-12-04  326  		       buf.buf)))
d4c9fc000bd1bc Kent Overstreet 2024-12-04  327  		goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  328  
d4c9fc000bd1bc Kent Overstreet 2024-12-04  329  	switch (ret) {
d4c9fc000bd1bc Kent Overstreet 2024-12-04  330  	case 0:
6ea607ca61475f Kent Overstreet 2024-12-08  331  		ret = bch2_hash_delete_at(trans, *desc, hash_info, k_iter, 0);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  332  		break;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  333  	case 1:
6ea607ca61475f Kent Overstreet 2024-12-08  334  		ret = bch2_hash_delete_at(trans, *desc, hash_info, &iter, 0);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  335  		break;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  336  	case 2:
6ea607ca61475f Kent Overstreet 2024-12-08  337  		ret = fsck_rename_dirent(trans, s, *desc, hash_info, bkey_s_c_to_dirent(hash_k)) ?:
6ea607ca61475f Kent Overstreet 2024-12-08  338  			bch2_hash_delete_at(trans, *desc, hash_info, k_iter, 0);
d4c9fc000bd1bc Kent Overstreet 2024-12-04  339  		goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  340  	}
d4c9fc000bd1bc Kent Overstreet 2024-12-04  341  
d4c9fc000bd1bc Kent Overstreet 2024-12-04  342  	ret = bch2_trans_commit(trans, NULL, NULL, 0) ?:
21828e2306c83b Kent Overstreet 2025-05-28  343  		-BCH_ERR_transaction_restart_commit;
d4c9fc000bd1bc Kent Overstreet 2024-12-04  344  	goto out;
d4c9fc000bd1bc Kent Overstreet 2024-12-04 @345  }

:::::: The code at line 345 was first introduced by commit
:::::: d4c9fc000bd1bc03cfa0b7650e59060f623cf46d bcachefs: factor out str_hash.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
