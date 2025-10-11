Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4A5C13B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760144512; cv=none; b=ksS3/X5ZElL4U8ERlRXl+6eg+rVILqvWvbrsw1twGHNeuECNAI+3W9Cg+1w9U+FArxHKYN3ZgIWiJur5iAsudFV3zPJ3LLxt5aFacBM/7R8tWzAuv9O29tfH+9wrz/MbFr5PjbIXgB5op7uPg+WXZ0GYS50yymEl4m7ayM2fsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760144512; c=relaxed/simple;
	bh=X45PYNWvTZfKbTqrcftHywr2cc73JxyM+hYoem6N2g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8gjKHAY3Zc6UgQ0OeQgE5ZSKGsoXob0W3AdqMy/Mef7cIUne/QydnPMicAZCSJULX4/ES/drRmPtRY9qJYxpoyx8jYqcBm+OQhdoQzZU/xzYQPu5Z+Eapw0V6IjO5oGFwP0vGA8glqqTJ+vUxelLdC/okls38wojmzJDr9mTsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DldtCHCK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DldtCHCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760144511; x=1791680511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X45PYNWvTZfKbTqrcftHywr2cc73JxyM+hYoem6N2g8=;
  b=DldtCHCK2F5OigYUTYOBG2PIcWA0KufOa2TGVcUOC3R5MTbefrLdaiHh
   /9gKXLD1Do7UGrn3UphMk1fmBY9NZk7wiuUloqKOAsvgUNZXCmDS42bsa
   0jg29URlsrg0OlxFVgTZaWv3C8UD2rf8DcW7p9ei0RdHywTsFgxebiYQK
   wkxogsuTeXJG6xNCBw+4v4plLq1DzA/kLJSoP+8TkSHCmd8WzPv3n1/qi
   0/1i9rkDVmWikmxhgG3gu0Kgz5E+/EtaZW1OQfbSf6PZL9csvp0c3PmgM
   ZWym9ws7oKkje4NPA9ZUHMKoIPRHrsbg9krkM9fMSTBKN6CIGOr5xUllt
   Q==;
X-CSE-ConnectionGUID: KERLI8CyThW0lEiNnLKtOw==
X-CSE-MsgGUID: 1qBwIUSsS8eArvgz0kmmLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66195378"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66195378"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 18:01:50 -0700
X-CSE-ConnectionGUID: zgRSAnNkTrKSNQGLODRX7Q==
X-CSE-MsgGUID: mdc0tqTkR5W3u6AM8isQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="186222885"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2025 18:01:49 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7NzW-0003M5-16;
	Sat, 11 Oct 2025 01:01:46 +0000
Date: Sat, 11 Oct 2025 09:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 466/534] fs/bcachefs/vfs/fs.c:1025:1:
 warning: the frame size of 1368 bytes is larger than 1280 bytes
Message-ID: <202510110850.SyeNqtuM-lkp@intel.com>
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
commit: 8ff2ecbdf502cca297f1f2f318d40f294d9edbe7 [466/534] bcachefs: move vfs-specific code to vfs/
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510110850.SyeNqtuM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110850.SyeNqtuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110850.SyeNqtuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/vfs/fs.c: In function 'bch2_rename2':
>> fs/bcachefs/vfs/fs.c:1025:1: warning: the frame size of 1368 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1025 | }
         | ^


vim +1025 fs/bcachefs/vfs/fs.c

1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   886  
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   887  static int bch2_rename2(struct mnt_idmap *idmap,
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   888  			struct inode *src_vdir, struct dentry *src_dentry,
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   889  			struct inode *dst_vdir, struct dentry *dst_dentry,
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   890  			unsigned flags)
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   891  {
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   892  	struct bch_fs *c = src_vdir->i_sb->s_fs_info;
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   893  	struct bch_inode_info *src_dir = to_bch_ei(src_vdir);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   894  	struct bch_inode_info *dst_dir = to_bch_ei(dst_vdir);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   895  	struct bch_inode_info *src_inode = to_bch_ei(src_dentry->d_inode);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   896  	struct bch_inode_info *dst_inode = to_bch_ei(dst_dentry->d_inode);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   897  	struct bch_inode_unpacked dst_dir_u, src_dir_u;
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   898  	struct bch_inode_unpacked src_inode_u, dst_inode_u, *whiteout_inode_u;
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   899  	enum bch_rename_mode mode = flags & RENAME_EXCHANGE
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   900  		? BCH_RENAME_EXCHANGE
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   901  		: dst_dentry->d_inode
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   902  		? BCH_RENAME_OVERWRITE : BCH_RENAME;
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   903  	bool whiteout = !!(flags & RENAME_WHITEOUT);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   904  	int ret;
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   905  
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   906  	if (flags & ~(RENAME_NOREPLACE|RENAME_EXCHANGE|RENAME_WHITEOUT))
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   907  		return -EINVAL;
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   908  
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   909  	if (mode == BCH_RENAME_OVERWRITE) {
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   910  		ret = filemap_write_and_wait_range(src_inode->v.i_mapping,
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   911  						   0, LLONG_MAX);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   912  		if (ret)
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   913  			return ret;
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   914  	}
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   915  
168f4c5fb375131 fs/bcachefs/fs.c Kent Overstreet   2019-06-24   916  	bch2_lock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   917  			 src_dir,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   918  			 dst_dir,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   919  			 src_inode,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   920  			 dst_inode);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   921  
999ab9fb206f604 fs/bcachefs/fs.c Kent Overstreet   2025-07-14   922  	CLASS(btree_trans, trans)(c);
f369de82679f4f7 fs/bcachefs/fs.c Kent Overstreet   2024-07-04   923  
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet   2024-06-08   924  	ret   = bch2_subvol_is_ro_trans(trans, src_dir->ei_inum.subvol) ?:
112d21fd1a122f7 fs/bcachefs/fs.c Kent Overstreet   2024-06-08   925  		bch2_subvol_is_ro_trans(trans, dst_dir->ei_inum.subvol);
0d72ab35a925d66 fs/bcachefs/fs.c Kent Overstreet   2023-12-29   926  	if (ret)
74ec2f302402c4c fs/bcachefs/fs.c Kent Overstreet   2024-10-14   927  		goto err_tx_restart;
0d72ab35a925d66 fs/bcachefs/fs.c Kent Overstreet   2023-12-29   928  
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   929  	if (inode_attr_changing(dst_dir, src_inode, Inode_opt_project)) {
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   930  		ret = bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   931  					     dst_dir->ei_qid,
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   932  					     1 << QTYP_PRJ,
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   933  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   934  		if (ret)
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   935  			goto err;
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   936  	}
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   937  
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   938  	if (mode == BCH_RENAME_EXCHANGE &&
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   939  	    inode_attr_changing(src_dir, dst_inode, Inode_opt_project)) {
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   940  		ret = bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   941  					     src_dir->ei_qid,
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   942  					     1 << QTYP_PRJ,
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   943  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   944  		if (ret)
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   945  			goto err;
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   946  	}
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   947  retry:
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   948  	bch2_trans_begin(trans);
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17   949  
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   950  	ret = bch2_rename_trans(trans,
6fed42bb7750e21 fs/bcachefs/fs.c Kent Overstreet   2021-03-16   951  				inode_inum(src_dir), &src_dir_u,
6fed42bb7750e21 fs/bcachefs/fs.c Kent Overstreet   2021-03-16   952  				inode_inum(dst_dir), &dst_dir_u,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   953  				&src_inode_u,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   954  				&dst_inode_u,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   955  				&src_dentry->d_name,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   956  				&dst_dentry->d_name,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   957  				mode);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   958  	if (unlikely(ret))
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   959  		goto err_tx_restart;
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   960  
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   961  	if (whiteout) {
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   962  		whiteout_inode_u = bch2_trans_kmalloc_nomemzero(trans, sizeof(*whiteout_inode_u));
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   963  		ret = PTR_ERR_OR_ZERO(whiteout_inode_u);
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   964  		if (unlikely(ret))
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   965  			goto err_tx_restart;
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   966  		bch2_inode_init_early(c, whiteout_inode_u);
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   967  
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   968  		ret = bch2_create_trans(trans,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   969  					inode_inum(src_dir), &src_dir_u,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   970  					whiteout_inode_u,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   971  					&src_dentry->d_name,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   972  					from_kuid(i_user_ns(&src_dir->v), current_fsuid()),
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   973  					from_kgid(i_user_ns(&src_dir->v), current_fsgid()),
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   974  					S_IFCHR|WHITEOUT_MODE, 0,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   975  					NULL, NULL, (subvol_inum) { 0 }, 0) ?:
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   976  		      bch2_quota_acct(c, bch_qid(whiteout_inode_u), Q_INO, 1,
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   977  				      KEY_TYPE_QUOTA_PREALLOC);
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   978  		if (unlikely(ret))
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   979  			goto err_tx_restart;
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   980  	}
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   981  
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   982  	ret = bch2_trans_commit(trans, NULL, NULL, 0);
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   983  	if (unlikely(ret)) {
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   984  err_tx_restart:
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   985  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   986  			goto retry;
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   987  		goto err;
4645855df01eda7 fs/bcachefs/fs.c Sasha Finkelstein 2024-08-18   988  	}
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   989  
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   990  	BUG_ON(src_inode->v.i_ino != src_inode_u.bi_inum);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   991  	BUG_ON(dst_inode &&
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   992  	       dst_inode->v.i_ino != dst_inode_u.bi_inum);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02   993  
6bd68ec266ad718 fs/bcachefs/fs.c Kent Overstreet   2023-09-12   994  	bch2_inode_update_after_write(trans, src_dir, &src_dir_u,
e614a6c52d32c9c fs/bcachefs/fs.c Hongbo Li         2025-01-07   995  				      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16   996  
68a2054d88f7cd2 fs/bcachefs/fs.c Kent Overstreet   2021-11-05   997  	if (src_dir != dst_dir)
6bd68ec266ad718 fs/bcachefs/fs.c Kent Overstreet   2023-09-12   998  		bch2_inode_update_after_write(trans, dst_dir, &dst_dir_u,
e614a6c52d32c9c fs/bcachefs/fs.c Hongbo Li         2025-01-07   999  					      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16  1000  
6bd68ec266ad718 fs/bcachefs/fs.c Kent Overstreet   2023-09-12  1001  	bch2_inode_update_after_write(trans, src_inode, &src_inode_u,
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16  1002  				      ATTR_CTIME);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1003  
68a2054d88f7cd2 fs/bcachefs/fs.c Kent Overstreet   2021-11-05  1004  	if (dst_inode)
6bd68ec266ad718 fs/bcachefs/fs.c Kent Overstreet   2023-09-12  1005  		bch2_inode_update_after_write(trans, dst_inode, &dst_inode_u,
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16  1006  					      ATTR_CTIME);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16  1007  err:
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1008  	bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1009  			       bch_qid(&src_inode->ei_inode),
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17  1010  			       1 << QTYP_PRJ,
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17  1011  			       KEY_TYPE_QUOTA_NOCHECK);
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1012  	if (dst_inode)
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1013  		bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1014  				       bch_qid(&dst_inode->ei_inode),
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17  1015  				       1 << QTYP_PRJ,
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17  1016  				       KEY_TYPE_QUOTA_NOCHECK);
96012e143e699db fs/bcachefs/fs.c Kent Overstreet   2018-12-17  1017  
168f4c5fb375131 fs/bcachefs/fs.c Kent Overstreet   2019-06-24  1018  	bch2_unlock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1019  			   src_dir,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1020  			   dst_dir,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1021  			   src_inode,
9638574229e3ae0 fs/bcachefs/fs.c Kent Overstreet   2019-10-02  1022  			   dst_inode);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16  1023  
1a1c93e7f814174 fs/bcachefs/fs.c Kent Overstreet   2024-02-09  1024  	return bch2_err_class(ret);
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16 @1025  }
1c6fdbd8f2465dd fs/bcachefs/fs.c Kent Overstreet   2017-03-16  1026  

:::::: The code at line 1025 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
