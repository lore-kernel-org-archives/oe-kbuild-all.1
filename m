Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C3F1CAA78
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689437; cv=none; b=UzjSUaZzPTPsAyS1IZTJ6hjdVkS9gfotAqB268IcPqHrBWDixrtUibkpKuncv5P3wUhE+D5O35/sSD7ll/iJSbKw/xXbM8SStxCEoRGPksmxL7uQb720ZXpqN0jS/k5c/WXU0naGOkE7bwOMyFMpHlZwyoevFcZ57IlGfHXWo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689437; c=relaxed/simple;
	bh=dH2vngxjdzyl9SxsC31erM+BaW2vBhp2bYHDrVOjcvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I832D6LFEfiW3m2H6sda0/3P4VYmUFDsklYaiywNJhuUlcVPFOmwMzrMStmOieccnEyTpwbvwaRWC9ZxzXDcARZZJkDtAR1/SGwTbDrrRzjFDVhKzA1X7pgZcajNN8kieNCEgDQT+FyWFcX5NOFUi5FUsnZ0geDgEmgmYymCtf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiEmCM1V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiEmCM1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772689436; x=1804225436;
  h=date:from:to:cc:subject:message-id;
  bh=dH2vngxjdzyl9SxsC31erM+BaW2vBhp2bYHDrVOjcvE=;
  b=IiEmCM1VUlpMgon5sE873bVTq1y78sTz+9xdxfoferEdWJxO5QHR3xwC
   yy3u2VmmT4deafi/JKkD3geyxJoKgjjxwM/blFxy8MlMQ/wWq788OKInk
   UmLidU/eU7W2CMn2Q/a4vrJZTX79Y+nD0OURC5gx9/mQ+FJnlXizAcvJ3
   4Rd6P3UiOxkbrUyaAPwYxw1k9frpi/1b6dGCf6FCxCvuka3emRmu+SIB8
   T1WEn3t9xVuJWXboG299V8IcqFWeSoqb7cfrKGOCQX9aPzOJDAR21quoL
   t3SYrosK85krTRlzUI78l/Vw4a+9Lqh2q/0ae5XvedtlS+yxT/eortJDV
   w==;
X-CSE-ConnectionGUID: S6JQm1RyRru+5BrpspAgHA==
X-CSE-MsgGUID: llYzwlJpQg+OKuTyCnS8xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85113511"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="85113511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 21:43:56 -0800
X-CSE-ConnectionGUID: HjvtiPRoT9am9SbvNRf7aQ==
X-CSE-MsgGUID: ppglwCiIScK6cJqHv97Zyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218571323"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2026 21:43:53 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy1TR-0000000009I-29lN;
	Thu, 05 Mar 2026 05:42:42 +0000
Date: Thu, 05 Mar 2026 13:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 955/955]
 fs/bcachefs/fs.c:869:1: warning: the frame size of 1336 bytes is larger than
 1280 bytes
Message-ID: <202603051345.F0zGhJw8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sasha,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: 4645855df01eda7c421c182515215682e0451b9b [955/955] bcachefs: Hook up RENAME_WHITEOUT in rename.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260305/202603051345.F0zGhJw8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051345.F0zGhJw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051345.F0zGhJw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs.c: In function 'bch2_rename2':
>> fs/bcachefs/fs.c:869:1: warning: the frame size of 1336 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     869 | }
         | ^


vim +869 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet   2017-03-16  727  
1c6fdbd8f2465d Kent Overstreet   2017-03-16  728  static int bch2_rename2(struct mnt_idmap *idmap,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  729  			struct inode *src_vdir, struct dentry *src_dentry,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  730  			struct inode *dst_vdir, struct dentry *dst_dentry,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  731  			unsigned flags)
1c6fdbd8f2465d Kent Overstreet   2017-03-16  732  {
1c6fdbd8f2465d Kent Overstreet   2017-03-16  733  	struct bch_fs *c = src_vdir->i_sb->s_fs_info;
9638574229e3ae Kent Overstreet   2019-10-02  734  	struct bch_inode_info *src_dir = to_bch_ei(src_vdir);
9638574229e3ae Kent Overstreet   2019-10-02  735  	struct bch_inode_info *dst_dir = to_bch_ei(dst_vdir);
9638574229e3ae Kent Overstreet   2019-10-02  736  	struct bch_inode_info *src_inode = to_bch_ei(src_dentry->d_inode);
9638574229e3ae Kent Overstreet   2019-10-02  737  	struct bch_inode_info *dst_inode = to_bch_ei(dst_dentry->d_inode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  738  	struct bch_inode_unpacked dst_dir_u, src_dir_u;
4645855df01eda Sasha Finkelstein 2024-08-18  739  	struct bch_inode_unpacked src_inode_u, dst_inode_u, *whiteout_inode_u;
6bd68ec266ad71 Kent Overstreet   2023-09-12  740  	struct btree_trans *trans;
9638574229e3ae Kent Overstreet   2019-10-02  741  	enum bch_rename_mode mode = flags & RENAME_EXCHANGE
9638574229e3ae Kent Overstreet   2019-10-02  742  		? BCH_RENAME_EXCHANGE
9638574229e3ae Kent Overstreet   2019-10-02  743  		: dst_dentry->d_inode
9638574229e3ae Kent Overstreet   2019-10-02  744  		? BCH_RENAME_OVERWRITE : BCH_RENAME;
4645855df01eda Sasha Finkelstein 2024-08-18  745  	bool whiteout = !!(flags & RENAME_WHITEOUT);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  746  	int ret;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  747  
4645855df01eda Sasha Finkelstein 2024-08-18  748  	if (flags & ~(RENAME_NOREPLACE|RENAME_EXCHANGE|RENAME_WHITEOUT))
1c6fdbd8f2465d Kent Overstreet   2017-03-16  749  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  750  
9638574229e3ae Kent Overstreet   2019-10-02  751  	if (mode == BCH_RENAME_OVERWRITE) {
9638574229e3ae Kent Overstreet   2019-10-02  752  		ret = filemap_write_and_wait_range(src_inode->v.i_mapping,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  753  						   0, LLONG_MAX);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  754  		if (ret)
1c6fdbd8f2465d Kent Overstreet   2017-03-16  755  			return ret;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  756  	}
1c6fdbd8f2465d Kent Overstreet   2017-03-16  757  
168f4c5fb37513 Kent Overstreet   2019-06-24  758  	bch2_lock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae Kent Overstreet   2019-10-02  759  			 src_dir,
9638574229e3ae Kent Overstreet   2019-10-02  760  			 dst_dir,
9638574229e3ae Kent Overstreet   2019-10-02  761  			 src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  762  			 dst_inode);
9638574229e3ae Kent Overstreet   2019-10-02  763  
f369de82679f4f Kent Overstreet   2024-07-04  764  	trans = bch2_trans_get(c);
f369de82679f4f Kent Overstreet   2024-07-04  765  
112d21fd1a122f Kent Overstreet   2024-06-08  766  	ret   = bch2_subvol_is_ro_trans(trans, src_dir->ei_inum.subvol) ?:
112d21fd1a122f Kent Overstreet   2024-06-08  767  		bch2_subvol_is_ro_trans(trans, dst_dir->ei_inum.subvol);
0d72ab35a925d6 Kent Overstreet   2023-12-29  768  	if (ret)
0d72ab35a925d6 Kent Overstreet   2023-12-29  769  		goto err;
0d72ab35a925d6 Kent Overstreet   2023-12-29  770  
9638574229e3ae Kent Overstreet   2019-10-02  771  	if (inode_attr_changing(dst_dir, src_inode, Inode_opt_project)) {
9638574229e3ae Kent Overstreet   2019-10-02  772  		ret = bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  773  					     dst_dir->ei_qid,
96012e143e699d Kent Overstreet   2018-12-17  774  					     1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  775  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699d Kent Overstreet   2018-12-17  776  		if (ret)
96012e143e699d Kent Overstreet   2018-12-17  777  			goto err;
96012e143e699d Kent Overstreet   2018-12-17  778  	}
96012e143e699d Kent Overstreet   2018-12-17  779  
9638574229e3ae Kent Overstreet   2019-10-02  780  	if (mode == BCH_RENAME_EXCHANGE &&
9638574229e3ae Kent Overstreet   2019-10-02  781  	    inode_attr_changing(src_dir, dst_inode, Inode_opt_project)) {
9638574229e3ae Kent Overstreet   2019-10-02  782  		ret = bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae Kent Overstreet   2019-10-02  783  					     src_dir->ei_qid,
96012e143e699d Kent Overstreet   2018-12-17  784  					     1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  785  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699d Kent Overstreet   2018-12-17  786  		if (ret)
96012e143e699d Kent Overstreet   2018-12-17  787  			goto err;
96012e143e699d Kent Overstreet   2018-12-17  788  	}
4645855df01eda Sasha Finkelstein 2024-08-18  789  retry:
4645855df01eda Sasha Finkelstein 2024-08-18  790  	bch2_trans_begin(trans);
96012e143e699d Kent Overstreet   2018-12-17  791  
4645855df01eda Sasha Finkelstein 2024-08-18  792  	ret = bch2_rename_trans(trans,
6fed42bb7750e2 Kent Overstreet   2021-03-16  793  				inode_inum(src_dir), &src_dir_u,
6fed42bb7750e2 Kent Overstreet   2021-03-16  794  				inode_inum(dst_dir), &dst_dir_u,
9638574229e3ae Kent Overstreet   2019-10-02  795  				&src_inode_u,
9638574229e3ae Kent Overstreet   2019-10-02  796  				&dst_inode_u,
9638574229e3ae Kent Overstreet   2019-10-02  797  				&src_dentry->d_name,
9638574229e3ae Kent Overstreet   2019-10-02  798  				&dst_dentry->d_name,
4645855df01eda Sasha Finkelstein 2024-08-18  799  				mode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  800  	if (unlikely(ret))
4645855df01eda Sasha Finkelstein 2024-08-18  801  		goto err_tx_restart;
4645855df01eda Sasha Finkelstein 2024-08-18  802  
4645855df01eda Sasha Finkelstein 2024-08-18  803  	if (whiteout) {
4645855df01eda Sasha Finkelstein 2024-08-18  804  		whiteout_inode_u = bch2_trans_kmalloc_nomemzero(trans, sizeof(*whiteout_inode_u));
4645855df01eda Sasha Finkelstein 2024-08-18  805  		ret = PTR_ERR_OR_ZERO(whiteout_inode_u);
4645855df01eda Sasha Finkelstein 2024-08-18  806  		if (unlikely(ret))
4645855df01eda Sasha Finkelstein 2024-08-18  807  			goto err_tx_restart;
4645855df01eda Sasha Finkelstein 2024-08-18  808  		bch2_inode_init_early(c, whiteout_inode_u);
4645855df01eda Sasha Finkelstein 2024-08-18  809  
4645855df01eda Sasha Finkelstein 2024-08-18  810  		ret = bch2_create_trans(trans,
4645855df01eda Sasha Finkelstein 2024-08-18  811  					inode_inum(src_dir), &src_dir_u,
4645855df01eda Sasha Finkelstein 2024-08-18  812  					whiteout_inode_u,
4645855df01eda Sasha Finkelstein 2024-08-18  813  					&src_dentry->d_name,
4645855df01eda Sasha Finkelstein 2024-08-18  814  					from_kuid(i_user_ns(&src_dir->v), current_fsuid()),
4645855df01eda Sasha Finkelstein 2024-08-18  815  					from_kgid(i_user_ns(&src_dir->v), current_fsgid()),
4645855df01eda Sasha Finkelstein 2024-08-18  816  					S_IFCHR|WHITEOUT_MODE, 0,
4645855df01eda Sasha Finkelstein 2024-08-18  817  					NULL, NULL, (subvol_inum) { 0 }, 0) ?:
4645855df01eda Sasha Finkelstein 2024-08-18  818  		      bch2_quota_acct(c, bch_qid(whiteout_inode_u), Q_INO, 1,
4645855df01eda Sasha Finkelstein 2024-08-18  819  				      KEY_TYPE_QUOTA_PREALLOC);
4645855df01eda Sasha Finkelstein 2024-08-18  820  		if (unlikely(ret))
4645855df01eda Sasha Finkelstein 2024-08-18  821  			goto err_tx_restart;
4645855df01eda Sasha Finkelstein 2024-08-18  822  	}
4645855df01eda Sasha Finkelstein 2024-08-18  823  
4645855df01eda Sasha Finkelstein 2024-08-18  824  	ret = bch2_trans_commit(trans, NULL, NULL, 0);
4645855df01eda Sasha Finkelstein 2024-08-18  825  	if (unlikely(ret)) {
4645855df01eda Sasha Finkelstein 2024-08-18  826  err_tx_restart:
4645855df01eda Sasha Finkelstein 2024-08-18  827  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
4645855df01eda Sasha Finkelstein 2024-08-18  828  			goto retry;
1c6fdbd8f2465d Kent Overstreet   2017-03-16  829  		goto err;
4645855df01eda Sasha Finkelstein 2024-08-18  830  	}
1c6fdbd8f2465d Kent Overstreet   2017-03-16  831  
9638574229e3ae Kent Overstreet   2019-10-02  832  	BUG_ON(src_inode->v.i_ino != src_inode_u.bi_inum);
9638574229e3ae Kent Overstreet   2019-10-02  833  	BUG_ON(dst_inode &&
9638574229e3ae Kent Overstreet   2019-10-02  834  	       dst_inode->v.i_ino != dst_inode_u.bi_inum);
9638574229e3ae Kent Overstreet   2019-10-02  835  
6bd68ec266ad71 Kent Overstreet   2023-09-12  836  	bch2_inode_update_after_write(trans, src_dir, &src_dir_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  837  				      ATTR_MTIME|ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  838  
68a2054d88f7cd Kent Overstreet   2021-11-05  839  	if (src_dir != dst_dir)
6bd68ec266ad71 Kent Overstreet   2023-09-12  840  		bch2_inode_update_after_write(trans, dst_dir, &dst_dir_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  841  					      ATTR_MTIME|ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  842  
6bd68ec266ad71 Kent Overstreet   2023-09-12  843  	bch2_inode_update_after_write(trans, src_inode, &src_inode_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  844  				      ATTR_CTIME);
9638574229e3ae Kent Overstreet   2019-10-02  845  
68a2054d88f7cd Kent Overstreet   2021-11-05  846  	if (dst_inode)
6bd68ec266ad71 Kent Overstreet   2023-09-12  847  		bch2_inode_update_after_write(trans, dst_inode, &dst_inode_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16  848  					      ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  849  err:
6bd68ec266ad71 Kent Overstreet   2023-09-12  850  	bch2_trans_put(trans);
96012e143e699d Kent Overstreet   2018-12-17  851  
9638574229e3ae Kent Overstreet   2019-10-02  852  	bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  853  			       bch_qid(&src_inode->ei_inode),
96012e143e699d Kent Overstreet   2018-12-17  854  			       1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  855  			       KEY_TYPE_QUOTA_NOCHECK);
9638574229e3ae Kent Overstreet   2019-10-02  856  	if (dst_inode)
9638574229e3ae Kent Overstreet   2019-10-02  857  		bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae Kent Overstreet   2019-10-02  858  				       bch_qid(&dst_inode->ei_inode),
96012e143e699d Kent Overstreet   2018-12-17  859  				       1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17  860  				       KEY_TYPE_QUOTA_NOCHECK);
96012e143e699d Kent Overstreet   2018-12-17  861  
168f4c5fb37513 Kent Overstreet   2019-06-24  862  	bch2_unlock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae Kent Overstreet   2019-10-02  863  			   src_dir,
9638574229e3ae Kent Overstreet   2019-10-02  864  			   dst_dir,
9638574229e3ae Kent Overstreet   2019-10-02  865  			   src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  866  			   dst_inode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  867  
1a1c93e7f81417 Kent Overstreet   2024-02-09  868  	return bch2_err_class(ret);
1c6fdbd8f2465d Kent Overstreet   2017-03-16 @869  }
1c6fdbd8f2465d Kent Overstreet   2017-03-16  870  

:::::: The code at line 869 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
