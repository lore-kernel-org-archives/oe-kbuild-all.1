Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E371B808
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 02:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760148299; cv=none; b=iHu0WTFz0bjXUJK9CvzbG0Jki9EasV9T3J/WqJ1g37IiXwao4DOhpkMArQNetP3nQmHxREkX29I3D1bS3L6olt39nR15KPWakGvQSaWh7TbSeKw8GYoi++2IDYUkte/W1/C8tDhlHvinjJ/VWwRvtr0ZW7eGN32WmdAZFBfPLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760148299; c=relaxed/simple;
	bh=Uly2S/S71C25dTa4F/LS8UUYnmLXIw0mGw/4yqKasIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHVe51DI3QWS+QobjXsD95GOjPxBYEb+v2JN5WijEeCEaKoCADMYQ2Gnl5AvTt5dPTUosuD8orRDY1DKpE2Di7Hc/h4ykjIRtqGEPEnKE6MV5UeiLJ27hSzJqeG8WXkmJvY0RHmQyqPRkUipCd4I6wzM5gAvRV5WlW4EBVBG3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpmmX4V/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpmmX4V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760148297; x=1791684297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uly2S/S71C25dTa4F/LS8UUYnmLXIw0mGw/4yqKasIg=;
  b=MpmmX4V/NZ1S/81aAaUTHKZ/hvCeA/ym2Gw9ymqg4Q/W+LRFCF576jZk
   t/w8nrhnhgUBDLltLw/Jaga9o0+3JBhUcLRdUaYmmCE/J55iEuqIXsViH
   pyOahZBZXJR7gCpztsvl46OHGnKU1FG0oOLLVsetP1XvWNwpwNLPdMvsO
   v6Zs2cmezvb0fQtYqUmy1dvs+uIPOvIvYVJrvgqZPttvNxf/5qwVjuldI
   xJjv69j2iROwRMs9k69t/yuEQ5/+DEOVrOMZxhTQM68akSyR4UYFYjXTO
   /ZDiBPbOpOWKoxCXgIJEk0hikkajavFfyUjVfrzwGVanR6jIL/2zJ/JcN
   w==;
X-CSE-ConnectionGUID: 8/eMKifDQfiBWFaZHMMPcA==
X-CSE-MsgGUID: qtCpLWjqReSB7y0QG9it7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61400757"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="61400757"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 19:04:56 -0700
X-CSE-ConnectionGUID: IDNdjauQQpuFMF+AdmiyIQ==
X-CSE-MsgGUID: vNxccc3PQ/a1QRcJ6XiwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181066823"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 19:04:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Oyb-0003Pj-1e;
	Sat, 11 Oct 2025 02:04:53 +0000
Date: Sat, 11 Oct 2025 10:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 467/534] fs/bcachefs/fs/check.c:299:1:
 warning: the frame size of 1640 bytes is larger than 1280 bytes
Message-ID: <202510111016.0Ioc3oF9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs master
head:   9a59939e496692bfa0e4cd6e7b8f79d416c49f72
commit: 792090a65e92ca1ffaac6c8a6995c86c80b069ee [467/534] bcachefs: move fs code to fs/
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510111016.0Ioc3oF9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111016.0Ioc3oF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111016.0Ioc3oF9-lkp@intel.com/

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
f68e453b6c94c5 fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  173  	struct btree_iter lostfound_iter = { NULL };
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
d92a9bceaca897 fs/bcachefs/fsck.c Kent Overstreet 2025-07-31  199  		struct bkey_i_subvolume *subvol = bch2_bkey_get_mut_typed(trans,
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
bc84c596ce969f fs/bcachefs/fsck.c Kent Overstreet 2025-07-14  257  	CLASS(printbuf, path)();
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
fd747e9ddf1c81 fs/bcachefs/fsck.c Kent Overstreet 2025-08-06  275  	ret = bch2_inode_create(trans, &lostfound_iter, lostfound, snapshot, cpu,
fd747e9ddf1c81 fs/bcachefs/fsck.c Kent Overstreet 2025-08-06  276  				inode_opt_get(c, &root_inode, inodes_32bit));
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  277  	if (ret)
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  278  		goto err;
d296e7b18521d6 fs/bcachefs/fsck.c Kent Overstreet 2023-12-15  279  
f68e453b6c94c5 fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  280  	bch2_btree_iter_set_snapshot(&lostfound_iter, snapshot);
f68e453b6c94c5 fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  281  	ret = bch2_btree_iter_traverse(&lostfound_iter);
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
363832bfd5fd98 fs/bcachefs/fsck.c Kent Overstreet 2025-07-30  297  	bch2_trans_iter_exit(&lostfound_iter);
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
