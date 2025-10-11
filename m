Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAEA4594A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760197692; cv=none; b=dZY0tmsBttkfc1aN/+EaF2UYoQ4K/wgSIns6EgdfCpFZdh3aHMCVKwNlq7QNmvJaraqggrlBuD7RPCrSm5Qas3FGXKr6GXSUeoRQJbo33YtT2xQ3XpuHdN5EAT8OuShSHeCzph044FCvChSAio7v0he+T3hRhetQaNwEDpZ6740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760197692; c=relaxed/simple;
	bh=BraN50pxP1PkqNLK5NK21UMzfxwlnCpPOnKfwFG/S4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfRUw3Garbi1sRbDltgMS/egmJiwFrRZAJjjaWshwl7zKfGXHNpq0eD0xZtiYgEe2iFdoqM8qpkpejaHK5DzEznYiBdxdjRCNzKPWmcg0QP8ebP5qmj7n4VongdLpshm5kA6xZGwLJM5ircYm/ynodo//3YG3H9Tx4cQJKGQJ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FM8e0GfG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FM8e0GfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760197690; x=1791733690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BraN50pxP1PkqNLK5NK21UMzfxwlnCpPOnKfwFG/S4M=;
  b=FM8e0GfG0n7/JqY5+JZxMzWYiJC6yuFdaTNg0NgmW42j749PQWbd0k5b
   /VB2sHsnDtZ4RA/TrlWWKyxtMS+KoGkYsEMrUUVEIcSho4g4hdyPwB2si
   JCcrTo5ps0gepYfeRVEIEmUJ9hrGnBynoxNGoyl6hydzyQcA6duVePBsb
   nFtNm0U2Q+ClKxmGHBZAUulViyI6Modn4sCypNcLQDeVkKi7Ibi1Yiqdo
   pR9nAuwmH2GTOI1dXgBVJ7Njdy8hF7AVy2nbe14kMgPS0qoDfeqeG0Iqc
   uLlmo9iEXTAP6uWkzu5mnvQ67HMgp3Ly8cxME3tk1HxiTyOSn+f7YA54M
   g==;
X-CSE-ConnectionGUID: zuaWxFNcSZuVsbhbxLjyQA==
X-CSE-MsgGUID: l9ECQgfZRNy5w9xTUs7SgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="66247382"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="66247382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 08:48:09 -0700
X-CSE-ConnectionGUID: AUMSXk8YTNu6oHWXS3rGqg==
X-CSE-MsgGUID: q19hWg9aQIO8lnBKABDFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="185586623"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Oct 2025 08:48:08 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7bpG-0003q1-07;
	Sat, 11 Oct 2025 15:48:06 +0000
Date: Sat, 11 Oct 2025 23:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-stripe-delete-from-trigger 490/536]
 fs/bcachefs/fs/str_hash.c:325:1: warning: the frame size of 1304 bytes is
 larger than 1280 bytes
Message-ID: <202510112359.pEVIK2fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-stripe-delete-from-trigger
head:   9d5f419e4198e8c6a75bffc754d730ea33438d7d
commit: 5a5d439f733e9437f0f0c9b9536ba46111a4e4b6 [490/536] bcachefs: DEFINE_CLASS(btree_iter_copy)
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510112359.pEVIK2fl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112359.pEVIK2fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112359.pEVIK2fl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs/str_hash.c: In function 'bch2_str_hash_repair_key':
>> fs/bcachefs/fs/str_hash.c:325:1: warning: the frame size of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     325 | }
         | ^


vim +325 fs/bcachefs/fs/str_hash.c

6ea607ca61475f fs/bcachefs/str_hash.c Kent Overstreet 2024-12-08  224  
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  225  /* Put a str_hash key in its proper location, checking for duplicates */
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  226  int bch2_str_hash_repair_key(struct btree_trans *trans,
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  227  			     struct snapshots_seen *s,
6ea607ca61475f fs/bcachefs/str_hash.c Kent Overstreet 2024-12-08  228  			     const struct bch_hash_desc *desc,
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  229  			     struct bch_hash_info *hash_info,
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  230  			     struct btree_iter *k_iter, struct bkey_s_c k,
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  231  			     struct btree_iter *dup_iter, struct bkey_s_c dup_k,
c72def523799a0 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  232  			     bool *updated_before_k_pos)
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  233  {
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  234  	struct bch_fs *c = trans->c;
25ce5aa344849e fs/bcachefs/str_hash.c Kent Overstreet 2025-07-14  235  	CLASS(printbuf, buf)();
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  236  	bool free_snapshots_seen = false;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  237  	int ret = 0;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  238  
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  239  	if (!s) {
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  240  		s = bch2_trans_kmalloc(trans, sizeof(*s));
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  241  		ret = PTR_ERR_OR_ZERO(s);
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  242  		if (ret)
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  243  			goto out;
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  244  
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  245  		s->pos = k_iter->pos;
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  246  		darray_init(&s->ids);
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  247  
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  248  		ret = bch2_get_snapshot_overwrites(trans, desc->btree_id, k_iter->pos, &s->ids);
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  249  		if (ret)
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  250  			goto out;
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  251  
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  252  		free_snapshots_seen = true;
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  253  	}
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  254  
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  255  	if (!dup_k.k) {
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  256  		struct bkey_i *new = bch2_bkey_make_mut_noupdate(trans, k);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  257  		ret = PTR_ERR_OR_ZERO(new);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  258  		if (ret)
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  259  			goto out;
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  260  
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  261  		dup_k = bch2_hash_set_or_get_in_snapshot(trans, dup_iter, *desc, hash_info,
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  262  				       (subvol_inum) { 0, new->k.p.inode },
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  263  				       new->k.p.snapshot, new,
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  264  				       STR_HASH_must_create|
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  265  				       BTREE_ITER_with_updates|
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  266  				       BTREE_UPDATE_internal_snapshot_node);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  267  		ret = bkey_err(dup_k);
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  268  		if (ret)
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  269  			goto out;
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  270  		if (dup_k.k)
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  271  			goto duplicate_entries;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  272  
c72def523799a0 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  273  		if (bpos_lt(new->k.p, k.k->p))
c72def523799a0 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  274  			*updated_before_k_pos = true;
c72def523799a0 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  275  
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  276  		ret =   bch2_insert_snapshot_whiteouts(trans, desc->btree_id,
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  277  						       k_iter->pos, new->k.p) ?:
a5922682602788 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  278  			bch2_hash_delete_at(trans, *desc, hash_info, k_iter,
d21262d4e35d44 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-28  279  					    BTREE_ITER_with_updates|
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  280  					    BTREE_UPDATE_internal_snapshot_node) ?:
6ea607ca61475f fs/bcachefs/str_hash.c Kent Overstreet 2024-12-08  281  			bch2_fsck_update_backpointers(trans, s, *desc, hash_info, new) ?:
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  282  			bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc) ?:
4667d9653c3473 fs/bcachefs/str_hash.c Kent Overstreet 2025-06-26  283  			bch_err_throw(c, transaction_restart_commit);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  284  	} else {
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  285  duplicate_entries:
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  286  		ret = hash_pick_winner(trans, *desc, hash_info, k, dup_k);
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  287  		if (ret < 0)
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  288  			goto out;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  289  
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  290  		if (!fsck_err(trans, hash_table_key_duplicate,
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  291  			      "duplicate hash table keys%s:\n%s",
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  292  			      ret != 2 ? "" : ", both point to valid inodes",
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  293  			      (printbuf_reset(&buf),
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  294  			       bch2_bkey_val_to_text(&buf, c, k),
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  295  			       prt_newline(&buf),
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  296  			       bch2_bkey_val_to_text(&buf, c, dup_k),
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  297  			       buf.buf)))
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  298  			goto out;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  299  
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  300  		switch (ret) {
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  301  		case 0:
6ea607ca61475f fs/bcachefs/str_hash.c Kent Overstreet 2024-12-08  302  			ret = bch2_hash_delete_at(trans, *desc, hash_info, k_iter, 0);
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  303  			break;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  304  		case 1:
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  305  			ret = bch2_hash_delete_at(trans, *desc, hash_info, dup_iter, 0);
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  306  			break;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  307  		case 2:
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  308  			ret = bch2_fsck_rename_dirent(trans, s, *desc, hash_info,
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  309  						      bkey_s_c_to_dirent(k),
c72def523799a0 fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  310  						      updated_before_k_pos) ?:
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  311  				bch2_hash_delete_at(trans, *desc, hash_info, k_iter,
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  312  						    BTREE_ITER_with_updates);
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  313  			goto out;
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  314  		}
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  315  
d4c9fc000bd1bc fs/bcachefs/str_hash.c Kent Overstreet 2024-12-04  316  		ret = bch2_trans_commit(trans, NULL, NULL, 0) ?:
4667d9653c3473 fs/bcachefs/str_hash.c Kent Overstreet 2025-06-26  317  			bch_err_throw(c, transaction_restart_commit);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  318  	}
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  319  out:
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  320  fsck_err:
363832bfd5fd98 fs/bcachefs/str_hash.c Kent Overstreet 2025-07-30  321  	bch2_trans_iter_exit(dup_iter);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  322  	if (free_snapshots_seen)
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  323  		darray_exit(&s->ids);
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  324  	return ret;
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31 @325  }
2bf380c005adcc fs/bcachefs/str_hash.c Kent Overstreet 2025-05-31  326  

:::::: The code at line 325 was first introduced by commit
:::::: 2bf380c005adcc653464215a5170afa3367c0b22 bcachefs: Fix dirent_casefold_mismatch repair

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
