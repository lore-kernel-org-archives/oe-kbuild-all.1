Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED81F4285
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390096; cv=none; b=rprlZy8/feEGsaL/OvT29Mkf07puYm96dop3UyQ6t2/lSB2qexrvnVO/42fePN1grTm/UDdjnk5daTtGjq4Hjc+TUy143pCxl9acfxgKXTB6UdEn4H6lANp0OYzmIW6qFXpWH6y23zBxTDYZORPBv3A8fu1rlw6BYHt0A5FPDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390096; c=relaxed/simple;
	bh=zpMdWmp27c4WnQcur5EM38ONc9bVfQd1+krB6OCG3DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFB+xYe0BPw9aQmNuaAVKiNzb8PouW8ELNbefc2lLQO0xKTqXjdDgg2FziXZHIgDeD0UyatQ1S75PXw1D7WvOjiykJjVgac/1dUkVhJfHPgEr21OtX+yuahzZzhqeIdjd3rwJ0uBschIVi3i8wT9mImyMAmHzc14OP+q521HON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D82ZlFa2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D82ZlFa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751390095; x=1782926095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpMdWmp27c4WnQcur5EM38ONc9bVfQd1+krB6OCG3DU=;
  b=D82ZlFa25DqnBWoMQlQ3HTRIpfH8drzSpoRhmExnZsfclHABwHjY2DaS
   Bjo+t9HyBHrmiLsC3KgITfC5C6Qp+SX1EoQ2OtbNvZnTTSDK5iPxWf5Hx
   ITkt63HgKNR4KAZgVusKEbZ5SRL0ONur9kLRJ8co3AS1ngQ3jHGwx1i/q
   1WyrLOR3h5sSjX70AVSvXL72PS7iJogI58flAt9TtOmBHvglmIpPosuVG
   wL0Dze7g1vO6OXNfnNXhJ800dvPPMs0SPfTaM53VNLtfLHgvff9HNyYj/
   tjvgpoJKJeS9zzy1KIq27begddetOaOkh+f2vYMLYEyMg0F0l4cmJbkAL
   A==;
X-CSE-ConnectionGUID: uiuJgDqPQpKqVY5+xUoZWw==
X-CSE-MsgGUID: qp9FyOZKTrGcNYfplUkSBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52782450"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52782450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 10:14:54 -0700
X-CSE-ConnectionGUID: yldqlIlVS+ShxzJdKSqv1g==
X-CSE-MsgGUID: 34PEvSIjSAexy1L0EbBfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184767033"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2025 10:14:53 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWeZH-00006z-0M;
	Tue, 01 Jul 2025 17:14:51 +0000
Date: Tue, 1 Jul 2025 19:14:14 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] fs/btrfs/super.c:1643:10:
 warning: variable 'mode' set but not used
Message-ID: <202507011948.EYIcVkOC-lkp@intel.com>
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
commit: 93b9bcdf9fbcb683d4e8c44ee8cec0989053d4de [1605/1605] btrfs: remove unused parameter from btrfs_parse_subvol_options
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250701/202507011948.EYIcVkOC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011948.EYIcVkOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011948.EYIcVkOC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/super.c:1643:10: warning: variable 'mode' set but not used [-Wunused-but-set-variable]
    1643 |         fmode_t mode = FMODE_READ;
         |                 ^
   1 warning generated.


vim +/mode +1643 fs/btrfs/super.c

312c89fbca06896 Misono, Tomohiro  2017-12-14  1615  
edf24abe51493cc Christoph Hellwig 2008-06-10  1616  /*
312c89fbca06896 Misono, Tomohiro  2017-12-14  1617   * Mount function which is called by VFS layer.
edf24abe51493cc Christoph Hellwig 2008-06-10  1618   *
312c89fbca06896 Misono, Tomohiro  2017-12-14  1619   * In order to allow mounting a subvolume directly, btrfs uses mount_subtree()
312c89fbca06896 Misono, Tomohiro  2017-12-14  1620   * which needs vfsmount* of device's root (/).  This means device's root has to
312c89fbca06896 Misono, Tomohiro  2017-12-14  1621   * be mounted internally in any case.
312c89fbca06896 Misono, Tomohiro  2017-12-14  1622   *
312c89fbca06896 Misono, Tomohiro  2017-12-14  1623   * Operation flow:
312c89fbca06896 Misono, Tomohiro  2017-12-14  1624   *   1. Parse subvol id related options for later use in mount_subvol().
312c89fbca06896 Misono, Tomohiro  2017-12-14  1625   *
312c89fbca06896 Misono, Tomohiro  2017-12-14  1626   *   2. Mount device's root (/) by calling vfs_kern_mount().
312c89fbca06896 Misono, Tomohiro  2017-12-14  1627   *
312c89fbca06896 Misono, Tomohiro  2017-12-14  1628   *      NOTE: vfs_kern_mount() is used by VFS to call btrfs_mount() in the
312c89fbca06896 Misono, Tomohiro  2017-12-14  1629   *      first place. In order to avoid calling btrfs_mount() again, we use
312c89fbca06896 Misono, Tomohiro  2017-12-14  1630   *      different file_system_type which is not registered to VFS by
312c89fbca06896 Misono, Tomohiro  2017-12-14  1631   *      register_filesystem() (btrfs_root_fs_type). As a result,
312c89fbca06896 Misono, Tomohiro  2017-12-14  1632   *      btrfs_mount_root() is called. The return value will be used by
312c89fbca06896 Misono, Tomohiro  2017-12-14  1633   *      mount_subtree() in mount_subvol().
312c89fbca06896 Misono, Tomohiro  2017-12-14  1634   *
312c89fbca06896 Misono, Tomohiro  2017-12-14  1635   *   3. Call mount_subvol() to get the dentry of subvolume. Since there is
312c89fbca06896 Misono, Tomohiro  2017-12-14  1636   *      "btrfs subvolume set-default", mount_subvol() is called always.
edf24abe51493cc Christoph Hellwig 2008-06-10  1637   */
061dbc6b9010bc1 Al Viro           2010-07-26  1638  static struct dentry *btrfs_mount(struct file_system_type *fs_type, int flags,
306e16ce13c0f3d David Sterba      2011-04-19  1639  		const char *device_name, void *data)
4b82d6e4a592016 Yan               2007-08-29  1640  {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1641  	struct vfsmount *mnt_root;
312c89fbca06896 Misono, Tomohiro  2017-12-14  1642  	struct dentry *root;
97288f2c71e4696 Christoph Hellwig 2008-12-02 @1643  	fmode_t mode = FMODE_READ;
73f73415caddbc0 Josef Bacik       2009-12-04  1644  	char *subvol_name = NULL;
73f73415caddbc0 Josef Bacik       2009-12-04  1645  	u64 subvol_objectid = 0;
4b82d6e4a592016 Yan               2007-08-29  1646  	int error = 0;
4b82d6e4a592016 Yan               2007-08-29  1647  
1751e8a6cb935e5 Linus Torvalds    2017-11-27  1648  	if (!(flags & SB_RDONLY))
97288f2c71e4696 Christoph Hellwig 2008-12-02  1649  		mode |= FMODE_WRITE;
97288f2c71e4696 Christoph Hellwig 2008-12-02  1650  
93b9bcdf9fbcb68 Gu Jinxiang       2018-07-09  1651  	error = btrfs_parse_subvol_options(data, &subvol_name,
93b9bcdf9fbcb68 Gu Jinxiang       2018-07-09  1652  					&subvol_objectid);
f23c8af8ca2789e Ilya Dryomov      2011-11-08  1653  	if (error) {
f23c8af8ca2789e Ilya Dryomov      2011-11-08  1654  		kfree(subvol_name);
061dbc6b9010bc1 Al Viro           2010-07-26  1655  		return ERR_PTR(error);
f23c8af8ca2789e Ilya Dryomov      2011-11-08  1656  	}
edf24abe51493cc Christoph Hellwig 2008-06-10  1657  
312c89fbca06896 Misono, Tomohiro  2017-12-14  1658  	/* mount device's root (/) */
312c89fbca06896 Misono, Tomohiro  2017-12-14  1659  	mnt_root = vfs_kern_mount(&btrfs_root_fs_type, flags, device_name, data);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1660  	if (PTR_ERR_OR_ZERO(mnt_root) == -EBUSY) {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1661  		if (flags & SB_RDONLY) {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1662  			mnt_root = vfs_kern_mount(&btrfs_root_fs_type,
312c89fbca06896 Misono, Tomohiro  2017-12-14  1663  				flags & ~SB_RDONLY, device_name, data);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1664  		} else {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1665  			mnt_root = vfs_kern_mount(&btrfs_root_fs_type,
312c89fbca06896 Misono, Tomohiro  2017-12-14  1666  				flags | SB_RDONLY, device_name, data);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1667  			if (IS_ERR(mnt_root)) {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1668  				root = ERR_CAST(mnt_root);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1669  				goto out;
f667aef6af626d0 Qu Wenruo         2014-09-23  1670  			}
04d21a244fdf79d Ilya Dryomov      2011-11-09  1671  
312c89fbca06896 Misono, Tomohiro  2017-12-14  1672  			down_write(&mnt_root->mnt_sb->s_umount);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1673  			error = btrfs_remount(mnt_root->mnt_sb, &flags, NULL);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1674  			up_write(&mnt_root->mnt_sb->s_umount);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1675  			if (error < 0) {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1676  				root = ERR_PTR(error);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1677  				mntput(mnt_root);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1678  				goto out;
04d21a244fdf79d Ilya Dryomov      2011-11-09  1679  			}
6c41761fc6efe15 David Sterba      2011-04-13  1680  		}
830c4adbd04a79f Josef Bacik       2011-07-25  1681  	}
312c89fbca06896 Misono, Tomohiro  2017-12-14  1682  	if (IS_ERR(mnt_root)) {
312c89fbca06896 Misono, Tomohiro  2017-12-14  1683  		root = ERR_CAST(mnt_root);
312c89fbca06896 Misono, Tomohiro  2017-12-14  1684  		goto out;
f667aef6af626d0 Qu Wenruo         2014-09-23  1685  	}
4b82d6e4a592016 Yan               2007-08-29  1686  
312c89fbca06896 Misono, Tomohiro  2017-12-14  1687  	/* mount_subvol() will free subvol_name and mnt_root */
5bedc48a8f9e1d6 David Sterba      2018-01-02  1688  	root = mount_subvol(subvol_name, subvol_objectid, device_name, mnt_root);
4b82d6e4a592016 Yan               2007-08-29  1689  
312c89fbca06896 Misono, Tomohiro  2017-12-14  1690  out:
312c89fbca06896 Misono, Tomohiro  2017-12-14  1691  	return root;
4b82d6e4a592016 Yan               2007-08-29  1692  }
2e635a278354a1a Chris Mason       2007-03-21  1693  

:::::: The code at line 1643 was first introduced by commit
:::::: 97288f2c71e46965a2010baea10548fcb5f3af73 Btrfs: corret fmode_t annotations

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Chris Mason <chris.mason@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
