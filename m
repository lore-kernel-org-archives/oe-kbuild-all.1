Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093A310774
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768041471; cv=none; b=S1zDWcEyOOhGQ9LWlon57mzOPRl+SGH6jPKgj6xVOcGf/oONAmLsnE0ddxOb+xqR8QVpMe5lTNBUpNglUY5HxM38tpWXBsrJ7pEM9tcA0xOGHymoPDX5Z2EdL9rumOK+0Y4clleMzUM7U0CgMaClm6IqvoT883ALBY7lu86xH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768041471; c=relaxed/simple;
	bh=Y5vURNrogoxIW1HyEGou1KwOqY9USpyyGWmN7UfK0GA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSEc0btlX3wcReBuxHg7E9lBvU9tVjYJeXGN4AtwKmKIpPWMU/lxaXiei3XHEMBL/KuD0lgXKZ/dXyoRFEqzc3v1t4q8lxH/eHJLzNk9raIlK8gto5/m4jw5tHKA+IT3uHKeyvUvvc0RuupcWGh1mt0yq05c74OQDs5ZcBvy69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEc7Njko; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEc7Njko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768041469; x=1799577469;
  h=date:from:to:cc:subject:message-id;
  bh=Y5vURNrogoxIW1HyEGou1KwOqY9USpyyGWmN7UfK0GA=;
  b=UEc7Njko2l8TrZljiZAr1qWtHXP6ylSScSrtWrMN/6hKFXjyFcDU66hw
   0O1KC9LlML+9jZsHgTJ6V4W8Xu1NXds1v+1KiH/yvuQrgVtMfyg6tdrSH
   x2yVuDgChIndyOpVb4FdUGej7lf6SP0Sjrc22WgwuX9SAj9qoT6SojmXA
   SbowA/rsu0cB/BFHD73lXPXDLYTnHzv4LI31dNOa/6EP2bmxBrXdXNrdj
   6QRiPvywjX7nBnapoQNBUGKelEJLiYBfHDIQzxQklQ0Att6Oa3NfgcUL1
   rpOABq6z2u+JJMmPK25BDLXv9H97Exzx7fQrnSV+5Sy5gbxiZ1Md9Za1l
   g==;
X-CSE-ConnectionGUID: f7i0aWeUTnayUGAnOeIpuA==
X-CSE-MsgGUID: AT7w3GtPSjWGv8lnC1c/mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80040046"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80040046"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 02:37:49 -0800
X-CSE-ConnectionGUID: J571kbg1S9uY6XHogjYBOA==
X-CSE-MsgGUID: jn62yfQuS86DO2GqzTK6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208202990"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2026 02:37:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWLo-000000008Xm-3fhJ;
	Sat, 10 Jan 2026 10:37:44 +0000
Date: Sat, 10 Jan 2026 18:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 489/799]
 fs/bcachefs/fs/namei.c:469:1: warning: the frame size of 1384 bytes is larger
 than 1280 bytes
Message-ID: <202601101809.GM3pVJcH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: b0d675b2a2498b67a10f17a11fff3490b7708376 [489/799] bcachefs: DEFINE_CLASS(btree_iter_uninit)
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260110/202601101809.GM3pVJcH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101809.GM3pVJcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101809.GM3pVJcH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs/namei.c: In function 'bch2_rename_trans':
>> fs/bcachefs/fs/namei.c:469:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     469 | }
         | ^


vim +469 fs/bcachefs/fs/namei.c

b8628a2529e7d6 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-08  319  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  320  int bch2_rename_trans(struct btree_trans *trans,
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  321  		      subvol_inum src_dir, struct bch_inode_unpacked *src_dir_u,
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  322  		      subvol_inum dst_dir, struct bch_inode_unpacked *dst_dir_u,
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  323  		      struct bch_inode_unpacked *src_inode_u,
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  324  		      struct bch_inode_unpacked *dst_inode_u,
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  325  		      const struct qstr *src_name,
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  326  		      const struct qstr *dst_name,
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  327  		      enum bch_rename_mode mode)
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  328  {
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  329  	struct bch_fs *c = trans->c;
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  330  	CLASS(btree_iter_uninit, src_dir_iter)(trans);
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  331  	CLASS(btree_iter_uninit, dst_dir_iter)(trans);
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  332  	CLASS(btree_iter_uninit, src_inode_iter)(trans);
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  333  	CLASS(btree_iter_uninit, dst_inode_iter)(trans);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  334  	struct bch_hash_info src_hash, dst_hash;
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  335  	subvol_inum src_inum, dst_inum;
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  336  	u64 src_offset, dst_offset;
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  337  	u64 now = bch2_current_time(c);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  338  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  339  	try(bch2_inode_peek(trans, &src_dir_iter, src_dir_u, src_dir, BTREE_ITER_intent));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  340  
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  341  	src_hash = bch2_hash_info_init(c, src_dir_u);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  342  
011d644b769609 fs/bcachefs/namei.c     Kent Overstreet 2025-05-19  343  	if (!subvol_inum_eq(dst_dir, src_dir)) {
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  344  		try(bch2_inode_peek(trans, &dst_dir_iter, dst_dir_u, dst_dir, BTREE_ITER_intent));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  345  
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  346  		dst_hash = bch2_hash_info_init(c, dst_dir_u);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  347  	} else {
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  348  		dst_dir_u = src_dir_u;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  349  		dst_hash = src_hash;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  350  	}
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  351  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  352  	try(bch2_dirent_rename(trans,
95fafc0f3407a6 fs/bcachefs/namei.c     Kent Overstreet 2025-05-31  353  			       src_dir, &src_hash,
95fafc0f3407a6 fs/bcachefs/namei.c     Kent Overstreet 2025-05-31  354  			       dst_dir, &dst_hash,
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  355  			       src_name, &src_inum, &src_offset,
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  356  			       dst_name, &dst_inum, &dst_offset,
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  357  			       mode));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  358  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  359  	try(bch2_inode_peek(trans, &src_inode_iter, src_inode_u, src_inum, BTREE_ITER_intent));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  360  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  361  	if (dst_inum.inum)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  362  		try(bch2_inode_peek(trans, &dst_inode_iter, dst_inode_u, dst_inum, BTREE_ITER_intent));
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  363  
b8628a2529e7d6 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-08  364  	if (src_inode_u->bi_subvol &&
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  365  	    dst_dir.subvol != src_inode_u->bi_parent_subvol)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  366  		try(subvol_update_parent(trans, src_inode_u->bi_subvol, dst_dir.subvol));
b8628a2529e7d6 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-08  367  
b8628a2529e7d6 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-08  368  	if (mode == BCH_RENAME_EXCHANGE &&
b8628a2529e7d6 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-08  369  	    dst_inode_u->bi_subvol &&
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  370  	    src_dir.subvol != dst_inode_u->bi_parent_subvol)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  371  		try(subvol_update_parent(trans, dst_inode_u->bi_subvol, src_dir.subvol));
b8628a2529e7d6 fs/bcachefs/fs-common.c Kent Overstreet 2024-02-08  372  
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  373  	/* Can't move across subvolumes, unless it's a subvolume root: */
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  374  	if (src_dir.subvol != dst_dir.subvol &&
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  375  	    (!src_inode_u->bi_subvol ||
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  376  	     (dst_inum.inum && !dst_inode_u->bi_subvol)))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  377  		return -EXDEV;
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  378  
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  379  	if (src_inode_u->bi_parent_subvol)
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  380  		src_inode_u->bi_parent_subvol = dst_dir.subvol;
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  381  
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  382  	if ((mode == BCH_RENAME_EXCHANGE) &&
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  383  	    dst_inode_u->bi_parent_subvol)
7f76b08acac4b4 fs/bcachefs/fs-common.c Kent Overstreet 2024-01-21  384  		dst_inode_u->bi_parent_subvol = src_dir.subvol;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  385  
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  386  	src_inode_u->bi_dir		= dst_dir_u->bi_inum;
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  387  	src_inode_u->bi_dir_offset	= dst_offset;
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  388  
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  389  	if (mode == BCH_RENAME_EXCHANGE) {
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  390  		dst_inode_u->bi_dir		= src_dir_u->bi_inum;
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  391  		dst_inode_u->bi_dir_offset	= src_offset;
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  392  	}
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  393  
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  394  	if (mode == BCH_RENAME_OVERWRITE &&
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  395  	    dst_inode_u->bi_dir		== dst_dir_u->bi_inum &&
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  396  	    dst_inode_u->bi_dir_offset	== src_offset) {
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  397  		dst_inode_u->bi_dir		= 0;
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  398  		dst_inode_u->bi_dir_offset	= 0;
16ac8c9523a274 fs/bcachefs/fs-common.c Kent Overstreet 2021-05-20  399  	}
ab2a29ccffd0e9 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-02  400  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  401  	if (mode == BCH_RENAME_OVERWRITE) {
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  402  		if (S_ISDIR(src_inode_u->bi_mode) !=
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  403  		    S_ISDIR(dst_inode_u->bi_mode))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  404  			return -ENOTDIR;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  405  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  406  		if (S_ISDIR(dst_inode_u->bi_mode))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  407  			try(bch2_empty_dir_trans(trans, dst_inum));
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  408  	}
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  409  
7c4f22af251ae3 fs/bcachefs/namei.c     Kent Overstreet 2025-05-19  410  	if (!subvol_inum_eq(dst_dir, src_dir)) {
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  411  		if (bch2_reinherit_attrs(src_inode_u, dst_dir_u) &&
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  412  		    S_ISDIR(src_inode_u->bi_mode))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  413  			return -EXDEV;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  414  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  415  		if (mode == BCH_RENAME_EXCHANGE &&
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  416  		    bch2_reinherit_attrs(dst_inode_u, src_dir_u) &&
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  417  		    S_ISDIR(dst_inode_u->bi_mode))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  418  			return -EXDEV;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  419  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  420  		try(bch2_maybe_propagate_has_case_insensitive(trans, src_inum, src_inode_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  421  		if (mode == BCH_RENAME_EXCHANGE)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  422  			try(bch2_maybe_propagate_has_case_insensitive(trans, dst_inum, dst_inode_u));
4ba99dde330b2d fs/bcachefs/namei.c     Kent Overstreet 2025-05-19  423  
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  424  		if (is_subdir_for_nlink(src_inode_u)) {
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  425  			src_dir_u->bi_nlink--;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  426  			dst_dir_u->bi_nlink++;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  427  		}
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  428  
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  429  		if (S_ISDIR(src_inode_u->bi_mode) &&
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  430  		    !src_inode_u->bi_subvol)
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  431  			src_inode_u->bi_depth = dst_dir_u->bi_depth + 1;
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  432  
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  433  		if (mode == BCH_RENAME_EXCHANGE &&
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  434  		    S_ISDIR(dst_inode_u->bi_mode) &&
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  435  		    !dst_inode_u->bi_subvol)
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  436  			dst_inode_u->bi_depth = src_dir_u->bi_depth + 1;
7c4f22af251ae3 fs/bcachefs/namei.c     Kent Overstreet 2025-05-19  437  	}
59c50511f7a8ec fs/bcachefs/fs-common.c Kent Overstreet 2023-08-02  438  
42d237320e9817 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  439  	if (dst_inum.inum && is_subdir_for_nlink(dst_inode_u)) {
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  440  		dst_dir_u->bi_nlink--;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  441  		src_dir_u->bi_nlink += mode == BCH_RENAME_EXCHANGE;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  442  	}
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  443  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  444  	if (mode == BCH_RENAME_OVERWRITE)
962ad1a7666944 fs/bcachefs/fs-common.c Kent Overstreet 2022-06-23  445  		bch2_inode_nlink_dec(trans, dst_inode_u);
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  446  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  447  	src_dir_u->bi_mtime		= now;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  448  	src_dir_u->bi_ctime		= now;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  449  
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  450  	if (src_dir.inum != dst_dir.inum) {
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  451  		dst_dir_u->bi_mtime	= now;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  452  		dst_dir_u->bi_ctime	= now;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  453  	}
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  454  
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  455  	src_inode_u->bi_ctime		= now;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  456  
6fed42bb7750e2 fs/bcachefs/fs-common.c Kent Overstreet 2021-03-16  457  	if (dst_inum.inum)
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  458  		dst_inode_u->bi_ctime	= now;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02  459  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  460  	try(bch2_inode_write(trans, &src_dir_iter, src_dir_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  461  	if (!subvol_inum_eq(dst_dir, src_dir))
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  462  		try(bch2_inode_write(trans, &dst_dir_iter, dst_dir_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  463  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  464  	try(bch2_inode_write(trans, &src_inode_iter, src_inode_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  465  	if (dst_inum.inum)
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  466  		try(bch2_inode_write(trans, &dst_inode_iter, dst_inode_u));
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  467  
b0d675b2a2498b fs/bcachefs/fs/namei.c  Kent Overstreet 2025-08-08  468  	return 0;
9638574229e3ae fs/bcachefs/fs-common.c Kent Overstreet 2019-10-02 @469  }
f7727a6767277a fs/bcachefs/fs-common.c Kent Overstreet 2024-09-28  470  

:::::: The code at line 469 was first introduced by commit
:::::: 9638574229e3ae0175a46a63431149746c777b3a bcachefs: Factor out fs-common.c

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
