Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790041448D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755959263; cv=none; b=jvVVwvm8xtPowJzpdnxkkvkGmr229p1veskUcMmUo4UXiw8HR2xirZsNOeeF/jgqVplZ/FAshlQrufsBP7J2f1NFH3i+gt8txSAXlPrR85y4gD9gpDjzB8AEt4Q9P0du+cDqZNzVpVF1TQHuguwhVZlRmPBTYuSK78TgMkk6gLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755959263; c=relaxed/simple;
	bh=X4mKBahsAaEG5WBl41212rTQ996I/ClxtSvoMqj8Zyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnz+vxopv3TJJ5SD9dPNbCkIlESmwnC0baI3hw7dLTgwcKjf12DUslrgjsEnZq7oRV5ce7cabWVViJtzJK+ZolPFnkQUc4LFUM5mbwC4JZGh9d7kkz5AtVfytW7mU+73x9j/UnBKkwSSu5K4DHBgd0O7dIVu9rfJo7hhF6B0n7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqjmcKz4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqjmcKz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755959262; x=1787495262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4mKBahsAaEG5WBl41212rTQ996I/ClxtSvoMqj8Zyo=;
  b=BqjmcKz4z5D+WbvzoonBp1H6HOPQ9yAXvYuwJCf4CPuXgIrLyMqGHlKk
   czZEeq8PwtFTEGL9l4HCIYfp7uhHJ4Siofi1zlXDsyAvUEtAfvX7iIloG
   GJTLQGaUXhlZlt4CByyuGyqD1lJZ2fPgrHgy40gf4/6KgwK/rMjAnyqf2
   ibeqN16fKHLNdnqREGu2WDN7E6hjwPbSghQMMHgyDjxRCOwJ5IOQUNjtY
   hls7w+TseXrNXtGHeAz3R88z/yGHhpk/H3/UrZPaMW9LOgXeJkeRHzJDX
   dfWk3HgQOgz2G3rdohiesxyGqh6BcUa4bLWMOsxRcEEvLixh2B15poIV7
   w==;
X-CSE-ConnectionGUID: ZxsfppTbSImYjVnD6FQBow==
X-CSE-MsgGUID: OhYdw3wNSpySo/p/XfuP9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="45812574"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45812574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 07:27:41 -0700
X-CSE-ConnectionGUID: cBzmSWO1RlyH4irNK2XWvw==
X-CSE-MsgGUID: OvSgPPPWTsC61D5IJHL6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168826945"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2025 07:27:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uppCg-000MLB-1v;
	Sat, 23 Aug 2025 14:27:00 +0000
Date: Sat, 23 Aug 2025 22:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance 335/336]
 fs/bcachefs/io_misc.c:479:75: warning: implicit conversion from 'enum
 <anonymous>' to 'enum set_needs_rebalance_ctx'
Message-ID: <202508232251.myA1GTWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance
head:   20ae3d99d2755617d23d984971def2fb3fba21e5
commit: 5fb2bccc7dfb8c26189d3cfe338c8ce435e228d6 [335/336] more rebalance work
config: x86_64-buildonly-randconfig-006-20250823 (https://download.01.org/0day-ci/archive/20250823/202508232251.myA1GTWZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508232251.myA1GTWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508232251.myA1GTWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/io_misc.c: In function '__bch2_resume_logged_op_finsert':
>> fs/bcachefs/io_misc.c:479:75: warning: implicit conversion from 'enum <anonymous>' to 'enum set_needs_rebalance_ctx' [-Wenum-conversion]
     479 |                 ret =   bch2_bkey_set_needs_rebalance(trans, &opts, copy, false, false) ?:
         |                                                                           ^~~~~


vim +479 fs/bcachefs/io_misc.c

5902cc283c060f Kent Overstreet  2023-09-04  367  
f3e374efbf1e32 Kent Overstreet  2023-09-10  368  static int __bch2_resume_logged_op_finsert(struct btree_trans *trans,
f3e374efbf1e32 Kent Overstreet  2023-09-10  369  					   struct bkey_i *op_k,
f3e374efbf1e32 Kent Overstreet  2023-09-10  370  					   u64 *i_sectors_delta)
5902cc283c060f Kent Overstreet  2023-09-04  371  {
f3e374efbf1e32 Kent Overstreet  2023-09-10  372  	struct bch_fs *c = trans->c;
f3e374efbf1e32 Kent Overstreet  2023-09-10  373  	struct btree_iter iter;
f3e374efbf1e32 Kent Overstreet  2023-09-10  374  	struct bkey_i_logged_op_finsert *op = bkey_i_to_logged_op_finsert(op_k);
f3e374efbf1e32 Kent Overstreet  2023-09-10  375  	subvol_inum inum = { le32_to_cpu(op->v.subvol), le64_to_cpu(op->v.inum) };
fb3f57bb1177ae Kent Overstreet  2023-10-20  376  	struct bch_io_opts opts;
f3e374efbf1e32 Kent Overstreet  2023-09-10  377  	u64 dst_offset = le64_to_cpu(op->v.dst_offset);
f3e374efbf1e32 Kent Overstreet  2023-09-10  378  	u64 src_offset = le64_to_cpu(op->v.src_offset);
f3e374efbf1e32 Kent Overstreet  2023-09-10  379  	s64 shift = dst_offset - src_offset;
f3e374efbf1e32 Kent Overstreet  2023-09-10  380  	u64 len = abs(shift);
f3e374efbf1e32 Kent Overstreet  2023-09-10  381  	u64 pos = le64_to_cpu(op->v.pos);
f3e374efbf1e32 Kent Overstreet  2023-09-10  382  	bool insert = shift > 0;
0f25eb4b60771f Kent Overstreet  2024-09-23  383  	u32 snapshot;
0f25eb4b60771f Kent Overstreet  2024-09-23  384  	bool warn_errors = i_sectors_delta != NULL;
5902cc283c060f Kent Overstreet  2023-09-04  385  	int ret = 0;
5902cc283c060f Kent Overstreet  2023-09-04  386  
fb3f57bb1177ae Kent Overstreet  2023-10-20  387  	ret = bch2_inum_opts_get(trans, inum, &opts);
fb3f57bb1177ae Kent Overstreet  2023-10-20  388  	if (ret)
fb3f57bb1177ae Kent Overstreet  2023-10-20  389  		return ret;
fb3f57bb1177ae Kent Overstreet  2023-10-20  390  
0f25eb4b60771f Kent Overstreet  2024-09-23  391  	/*
0f25eb4b60771f Kent Overstreet  2024-09-23  392  	 * check for missing subvolume before fpunch, as in resume we don't want
0f25eb4b60771f Kent Overstreet  2024-09-23  393  	 * it to be a fatal error
0f25eb4b60771f Kent Overstreet  2024-09-23  394  	 */
29fd10a36a6326 Kent Overstreet  2024-10-16  395  	ret = lockrestart_do(trans, __bch2_subvolume_get_snapshot(trans, inum.subvol, &snapshot, warn_errors));
0f25eb4b60771f Kent Overstreet  2024-09-23  396  	if (ret)
0f25eb4b60771f Kent Overstreet  2024-09-23  397  		return ret;
0f25eb4b60771f Kent Overstreet  2024-09-23  398  
f3e374efbf1e32 Kent Overstreet  2023-09-10  399  	bch2_trans_iter_init(trans, &iter, BTREE_ID_extents,
f3e374efbf1e32 Kent Overstreet  2023-09-10  400  			     POS(inum.inum, 0),
5dd8c60e1e0448 Kent Overstreet  2024-04-07  401  			     BTREE_ITER_intent);
f3e374efbf1e32 Kent Overstreet  2023-09-10  402  
f3e374efbf1e32 Kent Overstreet  2023-09-10  403  	switch (op->v.state) {
f3e374efbf1e32 Kent Overstreet  2023-09-10  404  case LOGGED_OP_FINSERT_start:
f3e374efbf1e32 Kent Overstreet  2023-09-10  405  	op->v.state = LOGGED_OP_FINSERT_shift_extents;
5902cc283c060f Kent Overstreet  2023-09-04  406  
5902cc283c060f Kent Overstreet  2023-09-04  407  	if (insert) {
cb52d23e77a6e5 Kent Overstreet  2023-11-11  408  		ret = commit_do(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
0f25eb4b60771f Kent Overstreet  2024-09-23  409  				adjust_i_size(trans, inum, src_offset, len, warn_errors) ?:
f3e374efbf1e32 Kent Overstreet  2023-09-10  410  				bch2_logged_op_update(trans, &op->k_i));
5902cc283c060f Kent Overstreet  2023-09-04  411  		if (ret)
5902cc283c060f Kent Overstreet  2023-09-04  412  			goto err;
5902cc283c060f Kent Overstreet  2023-09-04  413  	} else {
25201eae7abed7 Kent Overstreet  2025-07-30  414  		bch2_btree_iter_set_pos(&iter, POS(inum.inum, src_offset));
5902cc283c060f Kent Overstreet  2023-09-04  415  
f3e374efbf1e32 Kent Overstreet  2023-09-10  416  		ret = bch2_fpunch_at(trans, &iter, inum, src_offset + len, i_sectors_delta);
5902cc283c060f Kent Overstreet  2023-09-04  417  		if (ret && !bch2_err_matches(ret, BCH_ERR_transaction_restart))
5902cc283c060f Kent Overstreet  2023-09-04  418  			goto err;
5902cc283c060f Kent Overstreet  2023-09-04  419  
cb52d23e77a6e5 Kent Overstreet  2023-11-11  420  		ret = commit_do(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
f3e374efbf1e32 Kent Overstreet  2023-09-10  421  				bch2_logged_op_update(trans, &op->k_i));
5902cc283c060f Kent Overstreet  2023-09-04  422  	}
5902cc283c060f Kent Overstreet  2023-09-04  423  
f3e374efbf1e32 Kent Overstreet  2023-09-10  424  	fallthrough;
f3e374efbf1e32 Kent Overstreet  2023-09-10  425  case LOGGED_OP_FINSERT_shift_extents:
f3e374efbf1e32 Kent Overstreet  2023-09-10  426  	while (1) {
5902cc283c060f Kent Overstreet  2023-09-04  427  		struct disk_reservation disk_res =
5902cc283c060f Kent Overstreet  2023-09-04  428  			bch2_disk_reservation_init(c, 0);
f3e374efbf1e32 Kent Overstreet  2023-09-10  429  		struct bkey_i delete, *copy;
5902cc283c060f Kent Overstreet  2023-09-04  430  		struct bkey_s_c k;
f3e374efbf1e32 Kent Overstreet  2023-09-10  431  		struct bpos src_pos = POS(inum.inum, src_offset);
5902cc283c060f Kent Overstreet  2023-09-04  432  
f3e374efbf1e32 Kent Overstreet  2023-09-10  433  		bch2_trans_begin(trans);
5902cc283c060f Kent Overstreet  2023-09-04  434  
0f25eb4b60771f Kent Overstreet  2024-09-23  435  		ret = __bch2_subvolume_get_snapshot(trans, inum.subvol, &snapshot,
0f25eb4b60771f Kent Overstreet  2024-09-23  436  						    warn_errors);
5902cc283c060f Kent Overstreet  2023-09-04  437  		if (ret)
f3e374efbf1e32 Kent Overstreet  2023-09-10  438  			goto btree_err;
5902cc283c060f Kent Overstreet  2023-09-04  439  
25201eae7abed7 Kent Overstreet  2025-07-30  440  		bch2_btree_iter_set_snapshot(&iter, snapshot);
25201eae7abed7 Kent Overstreet  2025-07-30  441  		bch2_btree_iter_set_pos(&iter, SPOS(inum.inum, pos, snapshot));
5902cc283c060f Kent Overstreet  2023-09-04  442  
5902cc283c060f Kent Overstreet  2023-09-04  443  		k = insert
25201eae7abed7 Kent Overstreet  2025-07-30  444  			? bch2_btree_iter_peek_prev_min(&iter, POS(inum.inum, 0))
25201eae7abed7 Kent Overstreet  2025-07-30  445  			: bch2_btree_iter_peek_max(&iter, POS(inum.inum, U64_MAX));
5902cc283c060f Kent Overstreet  2023-09-04  446  		if ((ret = bkey_err(k)))
f3e374efbf1e32 Kent Overstreet  2023-09-10  447  			goto btree_err;
5902cc283c060f Kent Overstreet  2023-09-04  448  
f3e374efbf1e32 Kent Overstreet  2023-09-10  449  		if (!k.k ||
f3e374efbf1e32 Kent Overstreet  2023-09-10  450  		    k.k->p.inode != inum.inum ||
f3e374efbf1e32 Kent Overstreet  2023-09-10  451  		    bkey_le(k.k->p, POS(inum.inum, src_offset)))
5902cc283c060f Kent Overstreet  2023-09-04  452  			break;
5902cc283c060f Kent Overstreet  2023-09-04  453  
f3e374efbf1e32 Kent Overstreet  2023-09-10  454  		copy = bch2_bkey_make_mut_noupdate(trans, k);
f3e374efbf1e32 Kent Overstreet  2023-09-10  455  		if ((ret = PTR_ERR_OR_ZERO(copy)))
f3e374efbf1e32 Kent Overstreet  2023-09-10  456  			goto btree_err;
5902cc283c060f Kent Overstreet  2023-09-04  457  
5902cc283c060f Kent Overstreet  2023-09-04  458  		if (insert &&
f3e374efbf1e32 Kent Overstreet  2023-09-10  459  		    bkey_lt(bkey_start_pos(k.k), src_pos)) {
f3e374efbf1e32 Kent Overstreet  2023-09-10  460  			bch2_cut_front(src_pos, copy);
5902cc283c060f Kent Overstreet  2023-09-04  461  
f3e374efbf1e32 Kent Overstreet  2023-09-10  462  			/* Splitting compressed extent? */
f3e374efbf1e32 Kent Overstreet  2023-09-10  463  			bch2_disk_reservation_add(c, &disk_res,
f3e374efbf1e32 Kent Overstreet  2023-09-10  464  					copy->k.size *
f3e374efbf1e32 Kent Overstreet  2023-09-10  465  					bch2_bkey_nr_ptrs_allocated(bkey_i_to_s_c(copy)),
f3e374efbf1e32 Kent Overstreet  2023-09-10  466  					BCH_DISK_RESERVATION_NOFAIL);
5902cc283c060f Kent Overstreet  2023-09-04  467  		}
5902cc283c060f Kent Overstreet  2023-09-04  468  
5902cc283c060f Kent Overstreet  2023-09-04  469  		bkey_init(&delete.k);
f3e374efbf1e32 Kent Overstreet  2023-09-10  470  		delete.k.p = copy->k.p;
f3e374efbf1e32 Kent Overstreet  2023-09-10  471  		delete.k.p.snapshot = snapshot;
f3e374efbf1e32 Kent Overstreet  2023-09-10  472  		delete.k.size = copy->k.size;
5902cc283c060f Kent Overstreet  2023-09-04  473  
f3e374efbf1e32 Kent Overstreet  2023-09-10  474  		copy->k.p.offset += shift;
f3e374efbf1e32 Kent Overstreet  2023-09-10  475  		copy->k.p.snapshot = snapshot;
5902cc283c060f Kent Overstreet  2023-09-04  476  
f3e374efbf1e32 Kent Overstreet  2023-09-10  477  		op->v.pos = cpu_to_le64(insert ? bkey_start_offset(&delete.k) : delete.k.p.offset);
5902cc283c060f Kent Overstreet  2023-09-04  478  
e525fb25001600 Kent Overstreet  2025-08-20 @479  		ret =   bch2_bkey_set_needs_rebalance(trans, &opts, copy, false, false) ?:
fb3f57bb1177ae Kent Overstreet  2023-10-20  480  			bch2_btree_insert_trans(trans, BTREE_ID_extents, &delete, 0) ?:
f3e374efbf1e32 Kent Overstreet  2023-09-10  481  			bch2_btree_insert_trans(trans, BTREE_ID_extents, copy, 0) ?:
f3e374efbf1e32 Kent Overstreet  2023-09-10  482  			bch2_logged_op_update(trans, &op->k_i) ?:
cb52d23e77a6e5 Kent Overstreet  2023-11-11  483  			bch2_trans_commit(trans, &disk_res, NULL, BCH_TRANS_COMMIT_no_enospc);
f3e374efbf1e32 Kent Overstreet  2023-09-10  484  btree_err:
5902cc283c060f Kent Overstreet  2023-09-04  485  		bch2_disk_reservation_put(c, &disk_res);
5902cc283c060f Kent Overstreet  2023-09-04  486  
f3e374efbf1e32 Kent Overstreet  2023-09-10  487  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
f3e374efbf1e32 Kent Overstreet  2023-09-10  488  			continue;
f3e374efbf1e32 Kent Overstreet  2023-09-10  489  		if (ret)
f3e374efbf1e32 Kent Overstreet  2023-09-10  490  			goto err;
f3e374efbf1e32 Kent Overstreet  2023-09-10  491  
f3e374efbf1e32 Kent Overstreet  2023-09-10  492  		pos = le64_to_cpu(op->v.pos);
5902cc283c060f Kent Overstreet  2023-09-04  493  	}
5902cc283c060f Kent Overstreet  2023-09-04  494  
f3e374efbf1e32 Kent Overstreet  2023-09-10  495  	op->v.state = LOGGED_OP_FINSERT_finish;
5902cc283c060f Kent Overstreet  2023-09-04  496  
5902cc283c060f Kent Overstreet  2023-09-04  497  	if (!insert) {
cb52d23e77a6e5 Kent Overstreet  2023-11-11  498  		ret = commit_do(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
0f25eb4b60771f Kent Overstreet  2024-09-23  499  				adjust_i_size(trans, inum, src_offset, shift, warn_errors) ?:
f3e374efbf1e32 Kent Overstreet  2023-09-10  500  				bch2_logged_op_update(trans, &op->k_i));
5902cc283c060f Kent Overstreet  2023-09-04  501  	} else {
5902cc283c060f Kent Overstreet  2023-09-04  502  		/* We need an inode update to update bi_journal_seq for fsync: */
cb52d23e77a6e5 Kent Overstreet  2023-11-11  503  		ret = commit_do(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
0f25eb4b60771f Kent Overstreet  2024-09-23  504  				adjust_i_size(trans, inum, 0, 0, warn_errors) ?:
f3e374efbf1e32 Kent Overstreet  2023-09-10  505  				bch2_logged_op_update(trans, &op->k_i));
f3e374efbf1e32 Kent Overstreet  2023-09-10  506  	}
f3e374efbf1e32 Kent Overstreet  2023-09-10  507  
265cc423155d56 Nick Desaulniers 2023-09-19  508  	break;
f3e374efbf1e32 Kent Overstreet  2023-09-10  509  case LOGGED_OP_FINSERT_finish:
265cc423155d56 Nick Desaulniers 2023-09-19  510  	break;
5902cc283c060f Kent Overstreet  2023-09-04  511  	}
5902cc283c060f Kent Overstreet  2023-09-04  512  err:
951d23507b08c2 Kent Overstreet  2025-07-30  513  	bch2_trans_iter_exit(&iter);
0f25eb4b60771f Kent Overstreet  2024-09-23  514  	if (warn_errors)
0f25eb4b60771f Kent Overstreet  2024-09-23  515  		bch_err_fn(c, ret);
5902cc283c060f Kent Overstreet  2023-09-04  516  	return ret;
5902cc283c060f Kent Overstreet  2023-09-04  517  }
f3e374efbf1e32 Kent Overstreet  2023-09-10  518  

:::::: The code at line 479 was first introduced by commit
:::::: e525fb250016003c7d1aef9e0a1074261973b5df more rebalance work

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
