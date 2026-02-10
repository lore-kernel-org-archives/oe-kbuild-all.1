Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF3336EE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770710193; cv=none; b=M9RHg269x9fQftUf8zZr2L4jdEIFLJZ/hD6FzuRFkGJW4c/xzw+im4mUGDG76LBtmoJZ+Bkr2Y0OaEhUJWiPqbMnxEE8jTDQhd2X7LpwkqM6E10PFiQ4SrtY+HHL/sfMPPjqb7hHARomg1Pdp96s+8g9fkje/matz+brI2DvY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770710193; c=relaxed/simple;
	bh=tNahap5le5rXp9IyadkOw6pt0qLGoJlbi4mFVKkuPco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N6gRrwp6vMl1jv/a6TO+T3D327ZQ/fRRs+BLBNoNa87PBwZ5xLVX3G8C0EtiJqqLJ9bYzEsCzJf071ZybbXpxFunJzjPNpUDovTK28mwWKbqg8Hesk2TnjM47sQ1rFWtS28A2jiXw8CozsSeobRwd06nHI/06fyjqD9csbY/zsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlWcfUT8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlWcfUT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770710191; x=1802246191;
  h=date:from:to:cc:subject:message-id;
  bh=tNahap5le5rXp9IyadkOw6pt0qLGoJlbi4mFVKkuPco=;
  b=LlWcfUT8fXYzC6Ekdead7t719Z3HuSKuNoVWGaiWJv9jbxKpa3xZEOrV
   zKjY6OQMceGragpm2i2TrbTgrtvVQMK02ONVjMfP5aa41A4eOKy96GkH1
   0Z23IwCtQqOaXk0zDryns0i/w2Yzud91GOEzqLbI29No2pKOut/4Eg6Yz
   DQBoIhLmmADHoID2EcCAKK33B6WsuZrfcmKgpKd3+1KJ+DeSe+gi4oae4
   JAoKrOqiZuQNe9Y00gq4DqMbBp4YG13GIm2yABccBCnCiteAhXVU5ETxu
   HyJt+XA2rUiiL2OyQMj5yzGxqcVlZoj6PbfMfQFLLxHlZ3P8PIn8gXE90
   w==;
X-CSE-ConnectionGUID: MVnXCGlxQMqIMIWZNboCJA==
X-CSE-MsgGUID: YqFDsFPpSN+aRN0akjPm6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82469649"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82469649"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:56:31 -0800
X-CSE-ConnectionGUID: 7rTG5IhKTNuHJlvZBYo9Bw==
X-CSE-MsgGUID: teG3xkSEQ7u1z4qAtiy4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216351510"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2026 23:56:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpibj-00000000onL-2X6d;
	Tue, 10 Feb 2026 07:56:27 +0000
Date: Tue, 10 Feb 2026 15:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 500/799]
 fs/bcachefs/btree/read.c:310:5-8: Unneeded variable: "ret". Return "0" on
 line 446
Message-ID: <202602101500.ZHz4x9OB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: f1208e565ec32ffcb03ea18b50645cd6cfba69b2 [500/799] bcachefs: btree/io.c -> btree/read.c
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101500.ZHz4x9OB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101500.ZHz4x9OB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/read.c:310:5-8: Unneeded variable: "ret". Return "0" on line 446

vim +310 fs/bcachefs/btree/read.c

aae15aafcd43ec fs/bcachefs/btree_io.c Kent Overstreet 2021-04-24  300  
169e1827b6e8b9 fs/bcachefs/btree/io.c Kent Overstreet 2025-10-07  301  int bch2_validate_bset(struct bch_fs *c, struct bch_dev *ca,
91f6ad6f947c96 fs/bcachefs/btree_io.c Kent Overstreet 2021-02-02  302  		       struct btree *b, struct bset *i,
d89a34b14df5c2 fs/bcachefs/btree_io.c Alan Huang      2025-06-14  303  		       unsigned offset, int write,
cd3cdb1ef706a1 fs/bcachefs/btree_io.c Kent Overstreet 2025-04-22  304  		       struct bch_io_failures *failed,
cd3cdb1ef706a1 fs/bcachefs/btree_io.c Kent Overstreet 2025-04-22  305  		       struct printbuf *err_msg)
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  306  {
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  307  	unsigned version = le16_to_cpu(i->version);
4b908b8fe9b5b7 fs/bcachefs/btree_io.c Kent Overstreet 2025-07-14  308  	CLASS(printbuf, buf1)();
4b908b8fe9b5b7 fs/bcachefs/btree_io.c Kent Overstreet 2025-07-14  309  	CLASS(printbuf, buf2)();
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16 @310  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  311  
a02a0121b3de81 fs/bcachefs/btree_io.c Kent Overstreet 2023-06-28  312  	btree_err_on(!bch2_version_compatible(version),
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  313  		     -BCH_ERR_btree_node_read_err_incompatible,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  314  		     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  315  		     btree_node_unsupported_version,
ba8eeae8eee0aa fs/bcachefs/btree_io.c Kent Overstreet 2023-06-27  316  		     "unsupported bset version %u.%u",
ba8eeae8eee0aa fs/bcachefs/btree_io.c Kent Overstreet 2023-06-27  317  		     BCH_VERSION_MAJOR(version),
ba8eeae8eee0aa fs/bcachefs/btree_io.c Kent Overstreet 2023-06-27  318  		     BCH_VERSION_MINOR(version));
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  319  
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  320  	if (c->recovery.curr_pass != BCH_RECOVERY_PASS_scan_for_btree_nodes &&
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  321  	    btree_err_on(version < c->sb.version_min,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  322  			 -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  323  			 c, NULL, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  324  			 btree_node_bset_older_than_sb_min,
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  325  			 "bset version %u older than superblock version_min %u",
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  326  			 version, c->sb.version_min)) {
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  327  		if (bch2_version_compatible(version)) {
4b908b8fe9b5b7 fs/bcachefs/btree_io.c Kent Overstreet 2025-07-14  328  			guard(mutex)(&c->sb_lock);
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  329  			c->disk_sb.sb->version_min = cpu_to_le16(version);
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  330  			bch2_write_super(c);
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  331  		} else {
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  332  			/* We have no idea what's going on: */
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  333  			i->version = cpu_to_le16(c->sb.version);
625c494db95624 fs/bcachefs/btree_io.c Kent Overstreet 2025-06-11  334  		}
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  335  	}
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  336  
ba8eeae8eee0aa fs/bcachefs/btree_io.c Kent Overstreet 2023-06-27  337  	if (btree_err_on(BCH_VERSION_MAJOR(version) >
ba8eeae8eee0aa fs/bcachefs/btree_io.c Kent Overstreet 2023-06-27  338  			 BCH_VERSION_MAJOR(c->sb.version),
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  339  			 -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  340  			 c, NULL, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  341  			 btree_node_bset_newer_than_sb,
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  342  			 "bset version %u newer than superblock version %u",
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  343  			 version, c->sb.version)) {
4b908b8fe9b5b7 fs/bcachefs/btree_io.c Kent Overstreet 2025-07-14  344  		guard(mutex)(&c->sb_lock);
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  345  		c->disk_sb.sb->version = cpu_to_le16(version);
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  346  		bch2_write_super(c);
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  347  	}
84cc758d6b19ae fs/bcachefs/btree_io.c Kent Overstreet 2021-03-21  348  
5f65d74d791d9b fs/bcachefs/btree_io.c Kent Overstreet 2021-03-29  349  	btree_err_on(BSET_SEPARATE_WHITEOUTS(i),
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  350  		     -BCH_ERR_btree_node_read_err_incompatible,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  351  		     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  352  		     btree_node_unsupported_version,
5f65d74d791d9b fs/bcachefs/btree_io.c Kent Overstreet 2021-03-29  353  		     "BSET_SEPARATE_WHITEOUTS no longer supported");
5f65d74d791d9b fs/bcachefs/btree_io.c Kent Overstreet 2021-03-29  354  
e719fc34f00004 fs/bcachefs/btree_io.c Kent Overstreet 2021-07-16  355  	btree_err_on(offset && !i->u64s,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  356  		     -BCH_ERR_btree_node_read_err_fixable,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  357  		     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  358  		     bset_empty,
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  359  		     "empty bset");
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  360  
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  361  	btree_err_on(BSET_OFFSET(i) && BSET_OFFSET(i) != offset,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  362  		     -BCH_ERR_btree_node_read_err_want_retry,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  363  		     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  364  		     bset_wrong_sector_offset,
e719fc34f00004 fs/bcachefs/btree_io.c Kent Overstreet 2021-07-16  365  		     "bset at wrong sector offset");
e719fc34f00004 fs/bcachefs/btree_io.c Kent Overstreet 2021-07-16  366  
e719fc34f00004 fs/bcachefs/btree_io.c Kent Overstreet 2021-07-16  367  	if (!offset) {
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  368  		struct btree_node *bn =
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  369  			container_of(i, struct btree_node, keys);
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  370  		/* These indicate that we read the wrong btree node: */
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  371  
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  372  		if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  373  			struct bch_btree_ptr_v2 *bp =
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  374  				&bkey_i_to_btree_ptr_v2(&b->key)->v;
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  375  
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  376  			/* XXX endianness */
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  377  			btree_err_on(bp->seq != bn->keys.seq,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  378  				     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  379  				     c, ca, b, NULL, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  380  				     bset_bad_seq,
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  381  				     "incorrect sequence number (wrong btree node)");
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  382  		}
f36dff2885ee70 fs/bcachefs/btree_io.c Kent Overstreet 2020-05-12  383  
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  384  		btree_err_on(BTREE_NODE_ID(bn) != b->c.btree_id,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  385  			     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  386  			     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  387  			     btree_node_bad_btree,
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  388  			     "incorrect btree id");
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  389  
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  390  		btree_err_on(BTREE_NODE_LEVEL(bn) != b->c.level,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  391  			     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  392  			     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  393  			     btree_node_bad_level,
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  394  			     "incorrect level");
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  395  
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  396  		if (!write)
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  397  			compat_btree_node(b->c.level, b->c.btree_id, version,
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  398  					  BSET_BIG_ENDIAN(i), write, bn);
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  399  
548b3d209fa5c6 fs/bcachefs/btree_io.c Kent Overstreet 2020-02-07  400  		if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
548b3d209fa5c6 fs/bcachefs/btree_io.c Kent Overstreet 2020-02-07  401  			struct bch_btree_ptr_v2 *bp =
548b3d209fa5c6 fs/bcachefs/btree_io.c Kent Overstreet 2020-02-07  402  				&bkey_i_to_btree_ptr_v2(&b->key)->v;
548b3d209fa5c6 fs/bcachefs/btree_io.c Kent Overstreet 2020-02-07  403  
51d2dfb82d0553 fs/bcachefs/btree_io.c Kent Overstreet 2021-01-26  404  			if (BTREE_PTR_RANGE_UPDATED(bp)) {
51d2dfb82d0553 fs/bcachefs/btree_io.c Kent Overstreet 2021-01-26  405  				b->data->min_key = bp->min_key;
51d2dfb82d0553 fs/bcachefs/btree_io.c Kent Overstreet 2021-01-26  406  				b->data->max_key = b->key.k.p;
51d2dfb82d0553 fs/bcachefs/btree_io.c Kent Overstreet 2021-01-26  407  			}
51d2dfb82d0553 fs/bcachefs/btree_io.c Kent Overstreet 2021-01-26  408  
e88a75ebe86c1d fs/bcachefs/btree_io.c Kent Overstreet 2022-11-24  409  			btree_err_on(!bpos_eq(b->data->min_key, bp->min_key),
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  410  				     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  411  				     c, ca, b, NULL, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  412  				     btree_node_bad_min_key,
f020bfcdb058e4 fs/bcachefs/btree_io.c Kent Overstreet 2021-03-04  413  				     "incorrect min_key: got %s should be %s",
fa8e94faeece12 fs/bcachefs/btree_io.c Kent Overstreet 2022-02-25  414  				     (printbuf_reset(&buf1),
fa8e94faeece12 fs/bcachefs/btree_io.c Kent Overstreet 2022-02-25  415  				      bch2_bpos_to_text(&buf1, bn->min_key), buf1.buf),
fa8e94faeece12 fs/bcachefs/btree_io.c Kent Overstreet 2022-02-25  416  				     (printbuf_reset(&buf2),
fa8e94faeece12 fs/bcachefs/btree_io.c Kent Overstreet 2022-02-25  417  				      bch2_bpos_to_text(&buf2, bp->min_key), buf2.buf));
548b3d209fa5c6 fs/bcachefs/btree_io.c Kent Overstreet 2020-02-07  418  		}
548b3d209fa5c6 fs/bcachefs/btree_io.c Kent Overstreet 2020-02-07  419  
e88a75ebe86c1d fs/bcachefs/btree_io.c Kent Overstreet 2022-11-24  420  		btree_err_on(!bpos_eq(bn->max_key, b->key.k.p),
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  421  			     -BCH_ERR_btree_node_read_err_must_retry,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  422  			     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  423  			     btree_node_bad_max_key,
f020bfcdb058e4 fs/bcachefs/btree_io.c Kent Overstreet 2021-03-04  424  			     "incorrect max key %s",
fa8e94faeece12 fs/bcachefs/btree_io.c Kent Overstreet 2022-02-25  425  			     (printbuf_reset(&buf1),
fa8e94faeece12 fs/bcachefs/btree_io.c Kent Overstreet 2022-02-25  426  			      bch2_bpos_to_text(&buf1, bn->max_key), buf1.buf));
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  427  
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  428  		if (write)
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  429  			compat_btree_node(b->c.level, b->c.btree_id, version,
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  430  					  BSET_BIG_ENDIAN(i), write, bn);
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  431  
e08e63e44e6576 fs/bcachefs/btree_io.c Kent Overstreet 2023-08-06  432  		btree_err_on(bch2_bkey_format_invalid(c, &bn->format, write, &buf1),
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  433  			     -BCH_ERR_btree_node_read_err_bad_node,
1292bc2ebf63e7 fs/bcachefs/btree_io.c Kent Overstreet 2024-05-24  434  			     c, ca, b, i, NULL,
b65db750e2bb92 fs/bcachefs/btree_io.c Kent Overstreet 2023-10-24  435  			     btree_node_bad_format,
6c6439650ec913 fs/bcachefs/btree_io.c Kent Overstreet 2023-08-03  436  			     "invalid bkey format: %s\n%s", buf1.buf,
6c6439650ec913 fs/bcachefs/btree_io.c Kent Overstreet 2023-08-03  437  			     (printbuf_reset(&buf2),
6c6439650ec913 fs/bcachefs/btree_io.c Kent Overstreet 2023-08-03  438  			      bch2_bkey_format_to_text(&buf2, &bn->format), buf2.buf));
6c6439650ec913 fs/bcachefs/btree_io.c Kent Overstreet 2023-08-03  439  		printbuf_reset(&buf1);
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  440  
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  441  		compat_bformat(b->c.level, b->c.btree_id, version,
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  442  			       BSET_BIG_ENDIAN(i), write,
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  443  			       &bn->format);
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  444  	}
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07  445  fsck_err:
39fb2983c58629 fs/bcachefs/btree_io.c Kent Overstreet 2020-01-07 @446  	return ret;
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  447  }
1c6fdbd8f2465d fs/bcachefs/btree_io.c Kent Overstreet 2017-03-16  448  

:::::: The code at line 310 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
