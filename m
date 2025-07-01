Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2CF1487E9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377058; cv=none; b=n7YzE5hWleTgc6I/6BXBvUeOnKTxl5kyFHgnUlD79NeH1O34mAMoFy/kHT82yNGaMUbx3QVoBibMq2YyYq5wQBaAmz5at4P5A14wKTQ+plcsqqfy31nTSAJjUIiA+6IZNZE7TEp7WGEzu4ZrMrQC/wRN9oZ1Cputt05QRymvMK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377058; c=relaxed/simple;
	bh=rMmCGKW2OXgX7tg5Gvq/b5j0hejyJwt30w+qi7Ws068=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWw+CLO9rUVcbscW6SMizU95vFufWbd315Ly0WNulR1FaniCHmMyiHHUBw7R26+WIuxy8tMKjM7TtJU2FwlnefeRTARrvRdXuz/vbr3Rw2u55gXM1oE3j6W7CC2TY9hgaALO4mjCz4/pyaGRRYZSc1WAPvtDJ935QKuEr89fhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMrMM00l; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMrMM00l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751377057; x=1782913057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMmCGKW2OXgX7tg5Gvq/b5j0hejyJwt30w+qi7Ws068=;
  b=iMrMM00laDHYnXKzCo3EEXTFkE9/FibseNjA8sqyfGk8nufJ11TyYJLb
   DqwGJ3SEkxRGL+OZZb8YvIUvSAF2bN5cwHTV1SThFzeVFslhsGTmgV31K
   HlR21rjlbsGabWAssuTjAuBmMPT66vejiQsRpWI0Z5ztUSQipcjbh3OIr
   ZQ5j1vIuTQKinPyiiAwSUQ9MEA4jAu3RtOtDHpzjonIXGnk1DSbJoP5Rd
   7Q3gPxVu61TmbLDp2uWqC1HbFneb28el868vTMPp7z1BknbK1zTCIDZZU
   MYarKqbGZ6sSIa+Zz0NrlumZr/W8sRevvEtXtfFW22XzhBEq+AA4EyS/W
   g==;
X-CSE-ConnectionGUID: Kro++t6vSUmQz6Dvi8QUqw==
X-CSE-MsgGUID: ro9zLs5hRx6WxgeVQ9U0AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="41275826"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="41275826"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:37:35 -0700
X-CSE-ConnectionGUID: WEcNqoExSkOHW74f2KyVsQ==
X-CSE-MsgGUID: s28VRGhzRAmH4i4tD251Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158337510"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2025 06:37:33 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWbAw-00005T-3D;
	Tue, 01 Jul 2025 13:37:31 +0000
Date: Tue, 1 Jul 2025 15:37:07 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] fs/btrfs/inode.c:6717:6:
 warning: variable 'drop_on_err' set but not used
Message-ID: <202507011545.DJDFFl5d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   890108d01fde2c3b6dde4d169b695ce64362f135
commit: 32955c5422a8a5460bbefe2a6fc51eadcafff4c9 [1605/1605] btrfs: switch to discard_new_inode()
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250701/202507011545.DJDFFl5d-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011545.DJDFFl5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011545.DJDFFl5d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/inode.c:2776:16: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
    2776 |         struct inode *inode;
         |                       ^
   fs/btrfs/inode.c:6474:7: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    6474 |                 int err;
         |                     ^
   fs/btrfs/inode.c:6481:7: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    6481 |                 int err;
         |                     ^
>> fs/btrfs/inode.c:6717:6: warning: variable 'drop_on_err' set but not used [-Wunused-but-set-variable]
    6717 |         int drop_on_err = 0;
         |             ^
   4 warnings generated.


vim +/drop_on_err +6717 fs/btrfs/inode.c

39279cc3d2704c Chris Mason     2007-06-12  6709  
18bb1db3e7607e Al Viro         2011-07-26  6710  static int btrfs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
39279cc3d2704c Chris Mason     2007-06-12  6711  {
2ff7e61e0d30ff Jeff Mahoney    2016-06-22  6712  	struct btrfs_fs_info *fs_info = btrfs_sb(dir->i_sb);
b9d86667c94e5f Chris Mason     2008-05-02  6713  	struct inode *inode = NULL;
39279cc3d2704c Chris Mason     2007-06-12  6714  	struct btrfs_trans_handle *trans;
39279cc3d2704c Chris Mason     2007-06-12  6715  	struct btrfs_root *root = BTRFS_I(dir)->root;
39279cc3d2704c Chris Mason     2007-06-12  6716  	int err = 0;
39279cc3d2704c Chris Mason     2007-06-12 @6717  	int drop_on_err = 0;
b9d86667c94e5f Chris Mason     2008-05-02  6718  	u64 objectid = 0;
00e4e6b33a0f78 Chris Mason     2008-08-05  6719  	u64 index = 0;
39279cc3d2704c Chris Mason     2007-06-12  6720  
9ed74f2dba6ebf Josef Bacik     2009-09-11  6721  	/*
9ed74f2dba6ebf Josef Bacik     2009-09-11  6722  	 * 2 items for inode and ref
9ed74f2dba6ebf Josef Bacik     2009-09-11  6723  	 * 2 items for dir items
9ed74f2dba6ebf Josef Bacik     2009-09-11  6724  	 * 1 for xattr if selinux is on
9ed74f2dba6ebf Josef Bacik     2009-09-11  6725  	 */
a22285a6a32390 Yan, Zheng      2010-05-16  6726  	trans = btrfs_start_transaction(root, 5);
a22285a6a32390 Yan, Zheng      2010-05-16  6727  	if (IS_ERR(trans))
a22285a6a32390 Yan, Zheng      2010-05-16  6728  		return PTR_ERR(trans);
39279cc3d2704c Chris Mason     2007-06-12  6729  
581bb050941b4f Li Zefan        2011-04-20  6730  	err = btrfs_find_free_ino(root, &objectid);
581bb050941b4f Li Zefan        2011-04-20  6731  	if (err)
581bb050941b4f Li Zefan        2011-04-20  6732  		goto out_fail;
581bb050941b4f Li Zefan        2011-04-20  6733  
aec7477b3b0e8e Josef Bacik     2008-07-24  6734  	inode = btrfs_new_inode(trans, root, dir, dentry->d_name.name,
4a0cc7ca6c40b6 Nikolay Borisov 2017-01-10  6735  			dentry->d_name.len, btrfs_ino(BTRFS_I(dir)), objectid,
d82a6f1d7e8b61 Josef Bacik     2011-05-11  6736  			S_IFDIR | mode, &index);
39279cc3d2704c Chris Mason     2007-06-12  6737  	if (IS_ERR(inode)) {
39279cc3d2704c Chris Mason     2007-06-12  6738  		err = PTR_ERR(inode);
32955c5422a8a5 Al Viro         2018-05-16  6739  		inode = NULL;
39279cc3d2704c Chris Mason     2007-06-12  6740  		goto out_fail;
39279cc3d2704c Chris Mason     2007-06-12  6741  	}
5f39d397dfbe14 Chris Mason     2007-10-15  6742  
39279cc3d2704c Chris Mason     2007-06-12  6743  	drop_on_err = 1;
b0d5d10f41a0f1 Chris Mason     2014-09-08  6744  	/* these must be set before we unlock the inode */
b0d5d10f41a0f1 Chris Mason     2014-09-08  6745  	inode->i_op = &btrfs_dir_inode_operations;
b0d5d10f41a0f1 Chris Mason     2014-09-08  6746  	inode->i_fop = &btrfs_dir_file_operations;
33268eaf0b3db5 Josef Bacik     2008-07-24  6747  
2a7dba391e5628 Eric Paris      2011-02-01  6748  	err = btrfs_init_inode_security(trans, inode, dir, &dentry->d_name);
33268eaf0b3db5 Josef Bacik     2008-07-24  6749  	if (err)
32955c5422a8a5 Al Viro         2018-05-16  6750  		goto out_fail;
39279cc3d2704c Chris Mason     2007-06-12  6751  
6ef06d27903d9c Nikolay Borisov 2017-02-20  6752  	btrfs_i_size_write(BTRFS_I(inode), 0);
39279cc3d2704c Chris Mason     2007-06-12  6753  	err = btrfs_update_inode(trans, root, inode);
39279cc3d2704c Chris Mason     2007-06-12  6754  	if (err)
32955c5422a8a5 Al Viro         2018-05-16  6755  		goto out_fail;
5f39d397dfbe14 Chris Mason     2007-10-15  6756  
db0a669fb00241 Nikolay Borisov 2017-02-20  6757  	err = btrfs_add_link(trans, BTRFS_I(dir), BTRFS_I(inode),
db0a669fb00241 Nikolay Borisov 2017-02-20  6758  			dentry->d_name.name,
e02119d5a7b439 Chris Mason     2008-09-05  6759  			dentry->d_name.len, 0, index);
39279cc3d2704c Chris Mason     2007-06-12  6760  	if (err)
32955c5422a8a5 Al Viro         2018-05-16  6761  		goto out_fail;
5f39d397dfbe14 Chris Mason     2007-10-15  6762  
1e2e547a93a00e Al Viro         2018-05-04  6763  	d_instantiate_new(dentry, inode);
39279cc3d2704c Chris Mason     2007-06-12  6764  	drop_on_err = 0;
39279cc3d2704c Chris Mason     2007-06-12  6765  
39279cc3d2704c Chris Mason     2007-06-12  6766  out_fail:
3a45bb207ee2c5 Jeff Mahoney    2016-09-09  6767  	btrfs_end_transaction(trans);
32955c5422a8a5 Al Viro         2018-05-16  6768  	if (err && inode) {
c7cfb8a5405a34 Wang Shilong    2014-12-24  6769  		inode_dec_link_count(inode);
32955c5422a8a5 Al Viro         2018-05-16  6770  		discard_new_inode(inode);
c7cfb8a5405a34 Wang Shilong    2014-12-24  6771  	}
2ff7e61e0d30ff Jeff Mahoney    2016-06-22  6772  	btrfs_btree_balance_dirty(fs_info);
39279cc3d2704c Chris Mason     2007-06-12  6773  	return err;
39279cc3d2704c Chris Mason     2007-06-12  6774  }
39279cc3d2704c Chris Mason     2007-06-12  6775  

:::::: The code at line 6717 was first introduced by commit
:::::: 39279cc3d2704cfbf9c35dcb5bdd392159ae4625 Btrfs: split up super.c

:::::: TO: Chris Mason <chris.mason@oracle.com>
:::::: CC: David Woodhouse <dwmw2@hera.kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
