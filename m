Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4F1640A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694513246; x=1726049246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMpCDM1jdJh+ypEQ1Cu+QLjO+UcI92zTY1t0knrtMqw=;
  b=Xza68PNH5CiPQ633ABodq+SUGDK0cJxk2fiwVxfrVFudkeTZOlAuX3mK
   VlrGH/9n4WIezMY9jB72eOrkGMz9xbEidqIJwG/8bI3ZigQQs7JE8tV/g
   eYTz8bBiQoTxbeCQ+8GtHvM98Sud3OxMlIKo75+g9Zgjmnz2dsHI2nnjf
   7MCotm8dLnFiQZtjXbguRlPKre8HiNFzI3evcaigxC9B/DXi6xcaocDH2
   aWW7ExXVrBGt0O9Gl2YFaFd6C3LAvdvUeDUJBmZ/q+Vvs1NrB2qQEnJEM
   iVoh9IwL850yKBbTL/Mq2cF/s6pRRIVdp3XwDQJQl2PMPfbj4i0GACTpl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368589918"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="368589918"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 03:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778738460"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778738460"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 03:07:19 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg0Ic-0000Es-2s;
	Tue, 12 Sep 2023 10:07:15 +0000
Date: Tue, 12 Sep 2023 18:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4494/4552] fs/bcachefs/fs.c:639:1: warning: the
 frame size of 1036 bytes is larger than 1024 bytes
Message-ID: <202309121839.T2z5xux0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: cddeaa069804abc16bc7b1c4e26886e260d89b9f [4494/4552] bcachefs: convert to dynamically allocated shrinkers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230912/202309121839.T2z5xux0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121839.T2z5xux0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121839.T2z5xux0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:872:14: warning: 'INODEv2_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     872 | LE64_BITMASK(INODEv2_STR_HASH,  struct bch_inode_v2, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:872:1: note: in expansion of macro 'LE64_BITMASK'
     872 | LE64_BITMASK(INODEv2_STR_HASH,  struct bch_inode_v2, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:870:14: warning: 'INODE_NEW_VARINT_MAX' defined but not used [-Wunused-const-variable=]
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:870:14: warning: 'INODE_NEW_VARINT_BITS' defined but not used [-Wunused-const-variable=]
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:870:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/fs.c: In function 'bch2_rename2':
>> fs/bcachefs/fs.c:639:1: warning: the frame size of 1036 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     639 | }
         | ^


vim +639 fs/bcachefs/fs.c

5ec30115c06692 Kent Overstreet 2017-03-16  533  
5ec30115c06692 Kent Overstreet 2017-03-16  534  static int bch2_rename2(struct mnt_idmap *idmap,
5ec30115c06692 Kent Overstreet 2017-03-16  535  			struct inode *src_vdir, struct dentry *src_dentry,
5ec30115c06692 Kent Overstreet 2017-03-16  536  			struct inode *dst_vdir, struct dentry *dst_dentry,
5ec30115c06692 Kent Overstreet 2017-03-16  537  			unsigned flags)
5ec30115c06692 Kent Overstreet 2017-03-16  538  {
5ec30115c06692 Kent Overstreet 2017-03-16  539  	struct bch_fs *c = src_vdir->i_sb->s_fs_info;
4c6d7dc235d545 Kent Overstreet 2019-10-02  540  	struct bch_inode_info *src_dir = to_bch_ei(src_vdir);
4c6d7dc235d545 Kent Overstreet 2019-10-02  541  	struct bch_inode_info *dst_dir = to_bch_ei(dst_vdir);
4c6d7dc235d545 Kent Overstreet 2019-10-02  542  	struct bch_inode_info *src_inode = to_bch_ei(src_dentry->d_inode);
4c6d7dc235d545 Kent Overstreet 2019-10-02  543  	struct bch_inode_info *dst_inode = to_bch_ei(dst_dentry->d_inode);
5ec30115c06692 Kent Overstreet 2017-03-16  544  	struct bch_inode_unpacked dst_dir_u, src_dir_u;
5ec30115c06692 Kent Overstreet 2017-03-16  545  	struct bch_inode_unpacked src_inode_u, dst_inode_u;
4c6d7dc235d545 Kent Overstreet 2019-10-02  546  	struct btree_trans trans;
4c6d7dc235d545 Kent Overstreet 2019-10-02  547  	enum bch_rename_mode mode = flags & RENAME_EXCHANGE
4c6d7dc235d545 Kent Overstreet 2019-10-02  548  		? BCH_RENAME_EXCHANGE
4c6d7dc235d545 Kent Overstreet 2019-10-02  549  		: dst_dentry->d_inode
4c6d7dc235d545 Kent Overstreet 2019-10-02  550  		? BCH_RENAME_OVERWRITE : BCH_RENAME;
5ec30115c06692 Kent Overstreet 2017-03-16  551  	int ret;
5ec30115c06692 Kent Overstreet 2017-03-16  552  
5ec30115c06692 Kent Overstreet 2017-03-16  553  	if (flags & ~(RENAME_NOREPLACE|RENAME_EXCHANGE))
5ec30115c06692 Kent Overstreet 2017-03-16  554  		return -EINVAL;
5ec30115c06692 Kent Overstreet 2017-03-16  555  
4c6d7dc235d545 Kent Overstreet 2019-10-02  556  	if (mode == BCH_RENAME_OVERWRITE) {
4c6d7dc235d545 Kent Overstreet 2019-10-02  557  		ret = filemap_write_and_wait_range(src_inode->v.i_mapping,
5ec30115c06692 Kent Overstreet 2017-03-16  558  						   0, LLONG_MAX);
5ec30115c06692 Kent Overstreet 2017-03-16  559  		if (ret)
5ec30115c06692 Kent Overstreet 2017-03-16  560  			return ret;
5ec30115c06692 Kent Overstreet 2017-03-16  561  	}
5ec30115c06692 Kent Overstreet 2017-03-16  562  
7c331522a3657f Kent Overstreet 2019-05-15  563  	bch2_trans_init(&trans, c, 8, 2048);
7c331522a3657f Kent Overstreet 2019-05-15  564  
e806ff3ba76e5a Kent Overstreet 2019-06-24  565  	bch2_lock_inodes(INODE_UPDATE_LOCK,
4c6d7dc235d545 Kent Overstreet 2019-10-02  566  			 src_dir,
4c6d7dc235d545 Kent Overstreet 2019-10-02  567  			 dst_dir,
4c6d7dc235d545 Kent Overstreet 2019-10-02  568  			 src_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  569  			 dst_inode);
4c6d7dc235d545 Kent Overstreet 2019-10-02  570  
4c6d7dc235d545 Kent Overstreet 2019-10-02  571  	if (inode_attr_changing(dst_dir, src_inode, Inode_opt_project)) {
4c6d7dc235d545 Kent Overstreet 2019-10-02  572  		ret = bch2_fs_quota_transfer(c, src_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  573  					     dst_dir->ei_qid,
304824f9c15a30 Kent Overstreet 2018-12-17  574  					     1 << QTYP_PRJ,
304824f9c15a30 Kent Overstreet 2018-12-17  575  					     KEY_TYPE_QUOTA_PREALLOC);
304824f9c15a30 Kent Overstreet 2018-12-17  576  		if (ret)
304824f9c15a30 Kent Overstreet 2018-12-17  577  			goto err;
304824f9c15a30 Kent Overstreet 2018-12-17  578  	}
304824f9c15a30 Kent Overstreet 2018-12-17  579  
4c6d7dc235d545 Kent Overstreet 2019-10-02  580  	if (mode == BCH_RENAME_EXCHANGE &&
4c6d7dc235d545 Kent Overstreet 2019-10-02  581  	    inode_attr_changing(src_dir, dst_inode, Inode_opt_project)) {
4c6d7dc235d545 Kent Overstreet 2019-10-02  582  		ret = bch2_fs_quota_transfer(c, dst_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  583  					     src_dir->ei_qid,
304824f9c15a30 Kent Overstreet 2018-12-17  584  					     1 << QTYP_PRJ,
304824f9c15a30 Kent Overstreet 2018-12-17  585  					     KEY_TYPE_QUOTA_PREALLOC);
304824f9c15a30 Kent Overstreet 2018-12-17  586  		if (ret)
304824f9c15a30 Kent Overstreet 2018-12-17  587  			goto err;
304824f9c15a30 Kent Overstreet 2018-12-17  588  	}
304824f9c15a30 Kent Overstreet 2018-12-17  589  
02f9d363081081 Kent Overstreet 2022-07-13  590  	ret = commit_do(&trans, NULL, NULL, 0,
3180fc5f1dc78e Kent Overstreet 2021-03-12  591  			bch2_rename_trans(&trans,
fc87aa061e4a67 Kent Overstreet 2021-03-16  592  					  inode_inum(src_dir), &src_dir_u,
fc87aa061e4a67 Kent Overstreet 2021-03-16  593  					  inode_inum(dst_dir), &dst_dir_u,
4c6d7dc235d545 Kent Overstreet 2019-10-02  594  					  &src_inode_u,
4c6d7dc235d545 Kent Overstreet 2019-10-02  595  					  &dst_inode_u,
4c6d7dc235d545 Kent Overstreet 2019-10-02  596  					  &src_dentry->d_name,
4c6d7dc235d545 Kent Overstreet 2019-10-02  597  					  &dst_dentry->d_name,
3180fc5f1dc78e Kent Overstreet 2021-03-12  598  					  mode));
5ec30115c06692 Kent Overstreet 2017-03-16  599  	if (unlikely(ret))
5ec30115c06692 Kent Overstreet 2017-03-16  600  		goto err;
5ec30115c06692 Kent Overstreet 2017-03-16  601  
4c6d7dc235d545 Kent Overstreet 2019-10-02  602  	BUG_ON(src_inode->v.i_ino != src_inode_u.bi_inum);
4c6d7dc235d545 Kent Overstreet 2019-10-02  603  	BUG_ON(dst_inode &&
4c6d7dc235d545 Kent Overstreet 2019-10-02  604  	       dst_inode->v.i_ino != dst_inode_u.bi_inum);
4c6d7dc235d545 Kent Overstreet 2019-10-02  605  
1064949169aecb Kent Overstreet 2021-11-06  606  	bch2_inode_update_after_write(&trans, src_dir, &src_dir_u,
5ec30115c06692 Kent Overstreet 2017-03-16  607  				      ATTR_MTIME|ATTR_CTIME);
5ec30115c06692 Kent Overstreet 2017-03-16  608  
715dae29d88e75 Kent Overstreet 2021-11-05  609  	if (src_dir != dst_dir)
1064949169aecb Kent Overstreet 2021-11-06  610  		bch2_inode_update_after_write(&trans, dst_dir, &dst_dir_u,
5ec30115c06692 Kent Overstreet 2017-03-16  611  					      ATTR_MTIME|ATTR_CTIME);
5ec30115c06692 Kent Overstreet 2017-03-16  612  
1064949169aecb Kent Overstreet 2021-11-06  613  	bch2_inode_update_after_write(&trans, src_inode, &src_inode_u,
5ec30115c06692 Kent Overstreet 2017-03-16  614  				      ATTR_CTIME);
4c6d7dc235d545 Kent Overstreet 2019-10-02  615  
715dae29d88e75 Kent Overstreet 2021-11-05  616  	if (dst_inode)
1064949169aecb Kent Overstreet 2021-11-06  617  		bch2_inode_update_after_write(&trans, dst_inode, &dst_inode_u,
5ec30115c06692 Kent Overstreet 2017-03-16  618  					      ATTR_CTIME);
5ec30115c06692 Kent Overstreet 2017-03-16  619  err:
5ec30115c06692 Kent Overstreet 2017-03-16  620  	bch2_trans_exit(&trans);
304824f9c15a30 Kent Overstreet 2018-12-17  621  
4c6d7dc235d545 Kent Overstreet 2019-10-02  622  	bch2_fs_quota_transfer(c, src_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  623  			       bch_qid(&src_inode->ei_inode),
304824f9c15a30 Kent Overstreet 2018-12-17  624  			       1 << QTYP_PRJ,
304824f9c15a30 Kent Overstreet 2018-12-17  625  			       KEY_TYPE_QUOTA_NOCHECK);
4c6d7dc235d545 Kent Overstreet 2019-10-02  626  	if (dst_inode)
4c6d7dc235d545 Kent Overstreet 2019-10-02  627  		bch2_fs_quota_transfer(c, dst_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  628  				       bch_qid(&dst_inode->ei_inode),
304824f9c15a30 Kent Overstreet 2018-12-17  629  				       1 << QTYP_PRJ,
304824f9c15a30 Kent Overstreet 2018-12-17  630  				       KEY_TYPE_QUOTA_NOCHECK);
304824f9c15a30 Kent Overstreet 2018-12-17  631  
e806ff3ba76e5a Kent Overstreet 2019-06-24  632  	bch2_unlock_inodes(INODE_UPDATE_LOCK,
4c6d7dc235d545 Kent Overstreet 2019-10-02  633  			   src_dir,
4c6d7dc235d545 Kent Overstreet 2019-10-02  634  			   dst_dir,
4c6d7dc235d545 Kent Overstreet 2019-10-02  635  			   src_inode,
4c6d7dc235d545 Kent Overstreet 2019-10-02  636  			   dst_inode);
5ec30115c06692 Kent Overstreet 2017-03-16  637  
5ec30115c06692 Kent Overstreet 2017-03-16  638  	return ret;
5ec30115c06692 Kent Overstreet 2017-03-16 @639  }
5ec30115c06692 Kent Overstreet 2017-03-16  640  

:::::: The code at line 639 was first introduced by commit
:::::: 5ec30115c06692f17b20e4f4c7bdcd62cf96e30d bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
