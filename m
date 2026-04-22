Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E3255F2D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 21:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776891684; cv=none; b=ZHIT1MH5JxlOZ16/Si/hDj1jIZca7THWI/ZSYop3ey4ATirh5ubrrnKzmpYJlN4kWoQqJpe2sG2UaW0SYTh7UyDChsGVrr/j3lECBcxn4OYifY2iRMn3w92mgpaqDBvi3YlYILwLSx4qGE8KYWmk7+BPqmJeUdcL5G8+GiIaNxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776891684; c=relaxed/simple;
	bh=DscNQAPLJ/bwJSX9qkoBCvccedRV+kmCyJQTasxQYNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rx6ggf59QlluwLiGENe8aOAA1VC6yYYgjLyDu7p4cciP+8xFImsAc33IIxJa1OrRGo8v4WYe2wjaHrfpLoo+ro51vlvmVaIPwvxSAQcc9A2lndABuSU7c7vn8PaN0mWmZSsySS20yveq0WvsYhCIFB3VARfxnPgZ2ZTsD7xogk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csHuTI1z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csHuTI1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776891683; x=1808427683;
  h=date:from:to:cc:subject:message-id;
  bh=DscNQAPLJ/bwJSX9qkoBCvccedRV+kmCyJQTasxQYNQ=;
  b=csHuTI1zZMZ9jfrMPML0nRLUVkeGURoubav0RFYZbBrG2jBaD/0YNMZg
   nxvJ4Wgr7fNjQT49Hz6MQbyqzPFWFhPby98hYWpcCw9R1WT8C8vZMAet4
   P8+fNXC9V6nvs8OatgZRPGVZL5AM24nxHRAoLonVeBvH8L40o4+qV+jIE
   3c/8en08I9nfKhMUWeuA4b+5dZJhYL6pG/JtYTGvlClKc0FdjZTFqrVgp
   alVaiRlt8tfjaiBWB5xd+QzxZmhBh2xTd2pa12bzJfHixd5VYErXxhWhR
   zl2AzPVCu8ZEZwKMbQkSx1NwbKY+xdA1LPIHCWBq9f5+rXR4WzJkcH4fH
   Q==;
X-CSE-ConnectionGUID: DVzzCxzDTc6weXda6aEwqw==
X-CSE-MsgGUID: c6C/BtKxQ5avytHveaL04w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77870900"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77870900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 14:01:22 -0700
X-CSE-ConnectionGUID: 7stEtBP5S4SaIzdb0UNQvw==
X-CSE-MsgGUID: jlKIMH7TQ0iFzgvzBN0qYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236459943"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2026 14:01:20 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFehB-0000000011d-3vmS;
	Wed, 22 Apr 2026 21:01:17 +0000
Date: Thu, 23 Apr 2026 05:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 118/332]
 fs/bcachefs/fs/namei.c:294:1: warning: the frame size of 1376 bytes is larger
 than 1280 bytes
Message-ID: <202604230432.n3tdI2ny-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 5029b788620006fc5e36ba135f7ac1b2054270a8 [118/332] bcachefs: BCH_SB_ERR_vfs_unlink_got_wrong_inum
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260423/202604230432.n3tdI2ny-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230432.n3tdI2ny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230432.n3tdI2ny-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs/namei.c: In function 'bch2_unlink_trans':
>> fs/bcachefs/fs/namei.c:294:1: warning: the frame size of 1376 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     294 | }
         | ^


vim +294 fs/bcachefs/fs/namei.c

9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  216  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  217  int bch2_unlink_trans(struct btree_trans *trans,
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  218  		      subvol_inum dir, struct bch_inode_unpacked *dir_u,
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  219  		      subvol_inum inode, struct bch_inode_unpacked *inode_u,
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  220  		      const struct qstr *name,
835cd3e147a9a8 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-09  221  		      bool deleting_subvol)
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  222  {
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  223  	struct bch_fs *c = trans->c;
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  224  	CLASS(btree_iter_uninit, dir_iter)(trans);
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  225  	CLASS(btree_iter_uninit, dirent_iter)(trans);
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  226  	CLASS(btree_iter_uninit, inode_iter)(trans);
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  227  	u64 now = bch2_current_time(c);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  228  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  229  	try(bch2_inode_peek(trans, &dir_iter, dir_u, dir, BTREE_ITER_intent));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  230  
2603021d8850a4 fs/bcachefs/fs/namei.c  Kent Overstreet 2025-11-11  231  	struct bch_hash_info dir_hash;
2603021d8850a4 fs/bcachefs/fs/namei.c  Kent Overstreet 2025-11-11  232  	try(bch2_hash_info_init(c, dir_u, &dir_hash));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  233  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  234  	subvol_inum inum;
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  235  	try(bch2_dirent_lookup_trans(trans, &dirent_iter, dir, &dir_hash,
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  236  				     name, &inum, BTREE_ITER_intent));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  237  
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  238  	if (!subvol_inum_eq(inode, inum)) {
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  239  		CLASS(bch_log_msg, msg)(c);
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  240  		prt_printf(&msg.m, "vfs did bad unlink: wanted inum %llu:%llu, got %llu:%llu\n",
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  241  			   inode.subvol, inode.inum,
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  242  			   inum.subvol, inum.inum);
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  243  		prt_printf(&msg.m, "vfs d_name %s\n", name->name);
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  244  		prt_printf(&msg.m, "path ");
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  245  		try(bch2_inum_to_path(trans, inode, &msg.m));
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  246  		bch2_fs_emergency_read_only(c, &msg.m);
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  247  
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  248  		msg.m.suppress = !bch2_count_fsck_err(c, vfs_unlink_got_wrong_inum, &msg.m);
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  249  	}
5029b788620006 fs/bcachefs/fs/namei.c  Kent Overstreet 2026-01-04  250  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  251  	try(bch2_inode_peek(trans, &inode_iter, inode_u, inum, BTREE_ITER_intent));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  252  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  253  	if (!deleting_subvol && S_ISDIR(inode_u->bi_mode))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  254  		try(bch2_empty_dir_trans(trans, inum));
d3ff7fec9c604e fs/bcachefs/fs-common.c Kent Overstreet 2021-04-07  255  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  256  	if (deleting_subvol && !inode_u->bi_subvol)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  257  		return bch_err_throw(c, ENOENT_not_subvol);
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  258  
835cd3e147a9a8 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-09  259  	/* Recursive subvolume destroy not allowed (yet?) */
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  260  	if (inode_u->bi_subvol)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  261  		try(bch2_subvol_has_children(trans, inode_u->bi_subvol));
835cd3e147a9a8 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-09  262  
835cd3e147a9a8 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-09  263  	if (deleting_subvol || inode_u->bi_subvol) {
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  264  		try(bch2_subvolume_unlink(trans, inode_u->bi_subvol));
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  265  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  266  		struct bkey_s_c k = bkey_try(bch2_btree_iter_peek_slot(&dirent_iter));
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  267  
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  268  		/*
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  269  		 * If we're deleting a subvolume, we need to really delete the
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  270  		 * dirent, not just emit a whiteout in the current snapshot:
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  271  		 */
7c84dc243819ab fs/bcachefs/namei.c     Kent Overstreet 2025-07-30  272  		bch2_btree_iter_set_snapshot(&dirent_iter, k.k->p.snapshot);
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  273  		try(bch2_btree_iter_traverse(&dirent_iter));
7bd68c73044f1b fs/bcachefs/fs-common.c Kent Overstreet 2021-09-30  274  	} else {
962ad1a7666944 fs/bcachefs/fs-common.c Kent Overstreet 2022-06-23  275  		bch2_inode_nlink_dec(trans, inode_u);
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  276  	}
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  277  
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  278  	if (inode_u->bi_dir		== dirent_iter.pos.inode &&
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  279  	    inode_u->bi_dir_offset	== dirent_iter.pos.offset) {
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  280  		inode_u->bi_dir		= 0;
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  281  		inode_u->bi_dir_offset	= 0;
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  282  	}
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  283  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  284  	dir_u->bi_mtime = dir_u->bi_ctime = inode_u->bi_ctime = now;
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  285  	dir_u->bi_nlink -= is_subdir_for_nlink(inode_u);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  286  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  287  	try(bch2_hash_delete_at(trans, bch2_dirent_hash_desc,
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  288  				&dir_hash, &dirent_iter,
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  289  				BTREE_UPDATE_internal_snapshot_node));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  290  	try(bch2_inode_write(trans, &dir_iter, dir_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  291  	try(bch2_inode_write(trans, &inode_iter, inode_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  292  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  293  	return 0;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02 @294  }
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  295  

:::::: The code at line 294 was first introduced by commit
:::::: 9638574229e3ae0175a46a63431149746c777b3a bcachefs: Factor out fs-common.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
