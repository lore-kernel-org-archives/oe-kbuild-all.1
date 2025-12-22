Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794E299A81
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430771; cv=none; b=bH97zizXOAyf+t9l6w//az9n7MjIFoPnmQJK0+Si1FAwYyALxwf/phEDxGPkJ3ormvYb88Fwq6JmvfMANQSpnXzXR+T3qPkojE7ukEy0UpXbep7eaBq8SsnYItQn0d6vM+L2+1pfWV9r1SoSL8RrnL+zB7WKzL51ha+OnbnNbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430771; c=relaxed/simple;
	bh=Cid6e3xjHzI4SpTHjhkP5DMW+ssF17iScnDK+LmNy6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c61KkagxOs3fa8N9C8uX+gjm3lM5Q7SwE8zANaxlUuVL2F0vKCpcVko+8JxkOYQ2MVgB18LmXGROnDkqtlHIdHZL9p0uhR7pqs1CJRCSeJJCWzJvlgQkDbt6JvnqrTUj4fvf1Rj0mei8PdzBJEJBurYCICeLQT9Db1op/qKDU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+2eq0S0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+2eq0S0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766430769; x=1797966769;
  h=date:from:to:cc:subject:message-id;
  bh=Cid6e3xjHzI4SpTHjhkP5DMW+ssF17iScnDK+LmNy6k=;
  b=F+2eq0S0vwRPuRL4gK0wWZSUziCkhZdzEkmAnH/Xx8fXKONTGXnramdH
   TyGSNDLa+E0tf2TEnd1IEqJscJo4rQB6Pp4/6z9rjy9+gAaJN3+lsT0zs
   Sf1mBbTQw4YAbuktcxtcVrKD1kdlB7zrzkKYPBCmT3zTBqlmMmknTzBjA
   16rqKAeEkH5dSicm6Uhztzk3UoBiBj3dGD3uwRmYHpyyiBLYzhjwbLJoM
   RXKQMPsHlmSRR3xL8I7ZE09iGMTiAFfnS0o2pyAJpuEFh9ykrd80qlmo1
   Y12QjXgOhxp/sDxleiC4cV/UULfldzZWDusMtI5APhzMdvEHO0Tfk2Kka
   A==;
X-CSE-ConnectionGUID: lWk9AqooQtW9BoYrCYu5YQ==
X-CSE-MsgGUID: eFXIerdZQ2GMryWvUFPIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68172180"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68172180"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:12:47 -0800
X-CSE-ConnectionGUID: WFIJ0YJvT7yKUtMpze06/w==
X-CSE-MsgGUID: +Mhj9GrOQBKgue8a8HwlSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199625599"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 11:12:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlKV-00000000117-1VY8;
	Mon, 22 Dec 2025 19:12:31 +0000
Date: Tue, 23 Dec 2025 03:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 468/799]
 fs/bcachefs/fs/check.c:299:1: warning: the frame size of 1640 bytes is larger
 than 1280 bytes
Message-ID: <202512230302.dd8BkYkh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 0e349fe46a443dc2f5f3d2b67a3cc42c12d2bf35 [468/799] bcachefs: move fs code to fs/
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512230302.dd8BkYkh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230302.dd8BkYkh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230302.dd8BkYkh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs/check.c: In function 'lookup_lostfound':
>> fs/bcachefs/fs/check.c:299:1: warning: the frame size of 1640 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     299 | }
         | ^
   fs/bcachefs/fs/check.c: In function 'reattach_inode':
   fs/bcachefs/fs/check.c:499:1: warning: the frame size of 1728 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     499 | }
         | ^
   fs/bcachefs/fs/check.c: In function 'check_path_loop':
   fs/bcachefs/fs/check.c:2838:1: warning: the frame size of 1632 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    2838 | }
         | ^


vim +299 fs/bcachefs/fs/check.c

b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  165  
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  166  /* Get lost+found, create if it doesn't exist: */
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  167  static int lookup_lostfound(struct btree_trans *trans, u32 snapshot,
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  168  			    struct bch_inode_unpacked *lostfound,
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  169  			    u64 reattaching_inum)
1c6fdbd8f2465d fs/bcachefs/fsck.c Kent Overstreet 2017-03-16  170  {
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  171  	struct bch_fs *c = trans->c;
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  172  	struct qstr lostfound_str = QSTR("lost+found");
7c84dc243819ab fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  173  	struct btree_iter lostfound_iter = { NULL };
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  174  	u64 inum = 0;
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  175  	unsigned d_type = 0;
1c6fdbd8f2465d fs/bcachefs/fsck.c Kent Overstreet 2017-03-16  176  	int ret;
1c6fdbd8f2465d fs/bcachefs/fsck.c Kent Overstreet 2017-03-16  177  
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  178  	struct bch_snapshot_tree st;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  179  	ret = bch2_snapshot_tree_lookup(trans,
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  180  			bch2_snapshot_tree(c, snapshot), &st);
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  181  	if (ret)
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  182  		return ret;
81ed9ce3671125 fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  183  
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  184  	u32 subvolid;
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  185  	ret = find_snapshot_tree_subvol(trans,
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  186  				bch2_snapshot_tree(c, snapshot), &subvolid);
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  187  	bch_err_msg(c, ret, "finding subvol associated with snapshot tree %u",
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  188  		    bch2_snapshot_tree(c, snapshot));
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  189  	if (ret)
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  190  		return ret;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  191  
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  192  	struct bch_subvolume subvol;
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  193  	ret = bch2_subvolume_get(trans, subvolid, false, &subvol);
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  194  	bch_err_msg(c, ret, "looking up subvol %u for snapshot %u", subvolid, snapshot);
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  195  	if (ret)
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  196  		return ret;
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  197  
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  198  	if (!subvol.inode) {
3b131c9f3cd379 fs/bcachefs/fsck.c Kent Overstreet 2025-07-31  199  		struct bkey_i_subvolume *subvol = bch2_bkey_get_mut_typed(trans,
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  200  				BTREE_ID_subvolumes, POS(0, subvolid),
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  201  				0, subvolume);
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  202  		ret = PTR_ERR_OR_ZERO(subvol);
285b181ad460bb fs/bcachefs/fsck.c Kent Overstreet 2021-10-28  203  		if (ret)
d3ff7fec9c604e fs/bcachefs/fsck.c Kent Overstreet 2021-04-07  204  			return ret;
176cf4bf59014d fs/bcachefs/fsck.c Kent Overstreet 2021-04-09  205  
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  206  		subvol->v.inode = cpu_to_le64(reattaching_inum);
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  207  	}
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  208  
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  209  	subvol_inum root_inum = {
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  210  		.subvol = subvolid,
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  211  		.inum = le64_to_cpu(subvol.inode)
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  212  	};
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  213  
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  214  	struct bch_inode_unpacked root_inode;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  215  	struct bch_hash_info root_hash_info;
77eac89c7943a4 fs/bcachefs/fsck.c Kent Overstreet 2025-05-19  216  	ret = bch2_inode_find_by_inum_snapshot(trans, root_inum.inum, snapshot, &root_inode, 0);
cc0532900bcf18 fs/bcachefs/fsck.c Kent Overstreet 2024-03-31  217  	bch_err_msg(c, ret, "looking up root inode %llu for subvol %u",
b5e4cd0871db88 fs/bcachefs/fsck.c Kent Overstreet 2024-12-20  218  		    root_inum.inum, subvolid);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  219  	if (ret)
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  220  		return ret;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  221  
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  222  	root_hash_info = bch2_hash_info_init(c, &root_inode);
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  223  
d2fda304bb739b fs/bcachefs/fsck.c Kent Overstreet 2024-01-24  224  	ret = lookup_dirent_in_snapshot(trans, root_hash_info, root_inum,
d2fda304bb739b fs/bcachefs/fsck.c Kent Overstreet 2024-01-24  225  			      &lostfound_str, &inum, &d_type, snapshot);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  226  	if (bch2_err_matches(ret, ENOENT))
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  227  		goto create_lostfound;
176cf4bf59014d fs/bcachefs/fsck.c Kent Overstreet 2021-04-09  228  
e46c181af9e230 fs/bcachefs/fsck.c Kent Overstreet 2023-09-11  229  	bch_err_fn(c, ret);
285b181ad460bb fs/bcachefs/fsck.c Kent Overstreet 2021-10-28  230  	if (ret)
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  231  		return ret;
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  232  
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  233  	if (d_type != DT_DIR) {
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  234  		bch_err(c, "error looking up lost+found: not a directory");
09b9c72bd4b77a fs/bcachefs/fsck.c Kent Overstreet 2025-05-28  235  		return bch_err_throw(c, ENOENT_not_directory);
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  236  	}
ef1669ffc69c49 fs/bcachefs/fsck.c Kent Overstreet 2021-04-20  237  
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  238  	/*
067d228bb0c405 fs/bcachefs/fsck.c Kent Overstreet 2023-07-07  239  	 * The bch2_check_dirents pass has already run, dangling dirents
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  240  	 * shouldn't exist here:
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  241  	 */
77eac89c7943a4 fs/bcachefs/fsck.c Kent Overstreet 2025-05-19  242  	ret = bch2_inode_find_by_inum_snapshot(trans, inum, snapshot, lostfound, 0);
d2fda304bb739b fs/bcachefs/fsck.c Kent Overstreet 2024-01-24  243  	bch_err_msg(c, ret, "looking up lost+found %llu:%u in (root inode %llu, snapshot root %u)",
d2fda304bb739b fs/bcachefs/fsck.c Kent Overstreet 2024-01-24  244  		    inum, snapshot, root_inum.inum, bch2_snapshot_root(c, snapshot));
d2fda304bb739b fs/bcachefs/fsck.c Kent Overstreet 2024-01-24  245  	return ret;
176cf4bf59014d fs/bcachefs/fsck.c Kent Overstreet 2021-04-09  246  
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  247  create_lostfound:
fda7b1ffdef75c fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  248  	/*
fda7b1ffdef75c fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  249  	 * we always create lost+found in the root snapshot; we don't want
fda7b1ffdef75c fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  250  	 * different branches of the snapshot tree to have different lost+found
fda7b1ffdef75c fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  251  	 */
fda7b1ffdef75c fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  252  	snapshot = le32_to_cpu(st.root_snapshot);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  253  	/*
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  254  	 * XXX: we could have a nicer log message here  if we had a nice way to
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  255  	 * walk backpointers to print a path
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  256  	 */
b324a501fe1f55 fs/bcachefs/fsck.c Kent Overstreet 2025-07-14  257  	CLASS(printbuf, path)();
f7727a6767277a fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  258  	ret = bch2_inum_to_path(trans, root_inum, &path);
f7727a6767277a fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  259  	if (ret)
f7727a6767277a fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  260  		goto err;
f7727a6767277a fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  261  
f7727a6767277a fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  262  	bch_notice(c, "creating %s/lost+found in subvol %llu snapshot %u",
f7727a6767277a fs/bcachefs/fsck.c Kent Overstreet 2024-09-28  263  		   path.buf, root_inum.subvol, snapshot);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  264  
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  265  	u64 now = bch2_current_time(c);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  266  	u64 cpu = raw_smp_processor_id();
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  267  
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19  268  	bch2_inode_init_early(c, lostfound);
4ba99dde330b2d fs/bcachefs/fsck.c Kent Overstreet 2025-05-19  269  	bch2_inode_init_late(c, lostfound, now, 0, 0, S_IFDIR|0700, 0, &root_inode);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  270  	lostfound->bi_dir = root_inode.bi_inum;
72350ee0ea22c0 fs/bcachefs/fsck.c Kent Overstreet 2024-09-30  271  	lostfound->bi_snapshot = le32_to_cpu(st.root_snapshot);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  272  
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  273  	root_inode.bi_nlink++;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  274  
d63053d3447bdd fs/bcachefs/fsck.c Kent Overstreet 2025-08-06  275  	ret = bch2_inode_create(trans, &lostfound_iter, lostfound, snapshot, cpu,
d63053d3447bdd fs/bcachefs/fsck.c Kent Overstreet 2025-08-06  276  				inode_opt_get(c, &root_inode, inodes_32bit));
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  277  	if (ret)
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  278  		goto err;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  279  
7c84dc243819ab fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  280  	bch2_btree_iter_set_snapshot(&lostfound_iter, snapshot);
7c84dc243819ab fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  281  	ret = bch2_btree_iter_traverse(&lostfound_iter);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  282  	if (ret)
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  283  		goto err;
176cf4bf59014d fs/bcachefs/fsck.c Kent Overstreet 2021-04-09  284  
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  285  	ret =   bch2_dirent_create_snapshot(trans,
56e230473d395c fs/bcachefs/fsck.c Kent Overstreet 2024-02-09  286  				0, root_inode.bi_inum, snapshot, &root_hash_info,
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  287  				mode_to_type(lostfound->bi_mode),
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  288  				&lostfound_str,
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  289  				lostfound->bi_inum,
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  290  				&lostfound->bi_dir_offset,
ecd76c5f108eec fs/bcachefs/fsck.c Kent Overstreet 2025-05-21  291  				BTREE_UPDATE_internal_snapshot_node|
5dd8c60e1e0448 fs/bcachefs/fsck.c Kent Overstreet 2024-04-07  292  				STR_HASH_must_create) ?:
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  293  		bch2_inode_write_flags(trans, &lostfound_iter, lostfound,
5dd8c60e1e0448 fs/bcachefs/fsck.c Kent Overstreet 2024-04-07  294  				       BTREE_UPDATE_internal_snapshot_node);
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  295  err:
e46c181af9e230 fs/bcachefs/fsck.c Kent Overstreet 2023-09-11  296  	bch_err_msg(c, ret, "creating lost+found");
0502c22a0ea7c2 fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  297  	bch2_trans_iter_exit(&lostfound_iter);
285b181ad460bb fs/bcachefs/fsck.c Kent Overstreet 2021-10-28  298  	return ret;
58686a259ed28f fs/bcachefs/fsck.c Kent Overstreet 2021-04-19 @299  }
176cf4bf59014d fs/bcachefs/fsck.c Kent Overstreet 2021-04-09  300  

:::::: The code at line 299 was first introduced by commit
:::::: 58686a259ed28f1ee50cc0aaa039e986aa218e0c bcachefs: Lookup/create lost+found lazily

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
