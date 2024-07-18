Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4D186A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 00:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721263269; cv=none; b=bp5n/sdrg/4oMn9wge5OZ5rwMId3OIuP2jqu6i32rm2PMb7FFH9m4EiLpvlYq1CbO5tWb/l6X1SxOFNFUJ2rnO3SnHq7ICGd2vOUCNR7qeTJdB9Tz93iANw+Pb6rw0gz8Q94DYxOtMLDMLlDSje2RweRh0S5RmxE/bek8Ggexcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721263269; c=relaxed/simple;
	bh=C/hjLqCUc7b1i7AaO6B4s0oUmCX7uHPdfGfoDzLuXdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZxbzCpS9dBGzO/T+VxWfsrGrVnrmYAsT2qj4ltJdu3yFI63A58y7r+nc9WD+PIVK2tGOtIdgKojtC3z2YAifvEyTq/a0UGrCULSboHpIZGpcYj4rslOsJQ+px40W6NDywx1NaCwbNfD1c2ReONbyxPUDtoKln9e/DiXCfds+UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjAz1Q/e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjAz1Q/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721263267; x=1752799267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/hjLqCUc7b1i7AaO6B4s0oUmCX7uHPdfGfoDzLuXdI=;
  b=QjAz1Q/e2I70lEdw7rGWf4BDPqs2gDMqRh3Wzg3c3p4Ki1WY5Gw49Exn
   qfVAHxfEQLG/LzSKLTLncSFxWB19Z+sNk8K9w0WQxs/atO4twbePSajvA
   T6ENezWNNG8EJj1oXOwtuNd5G1+wJymyZgR5YJUM59p2RzGmkogQ9e40y
   NHjzxqTI2zNwXOM5k6uHxeabQsAgUJH6hqd6XpOKjJ+u+/gY5Lz1fE6PZ
   IZVsbRb/4Fb3r2XREKXDBdmpbFFxD/TwGeSD7xp31PHa6u+nfrhZcP95M
   f16/ZssF9XYpkyBeJpvVjjYmjYTz8fppKFSZkKBu7jMidxerPVtOt4qtO
   Q==;
X-CSE-ConnectionGUID: x5asssTqTNqEjRfYODGELA==
X-CSE-MsgGUID: kyORSPXYTI65AEiGX8g0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29416275"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="29416275"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 17:41:06 -0700
X-CSE-ConnectionGUID: l+lLqAiVT7uKPu/toHwYaw==
X-CSE-MsgGUID: 1K7kTFpzS3+fZ6DtOaVVPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50450085"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2024 17:41:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUFCh-000goK-2c;
	Thu, 18 Jul 2024 00:41:03 +0000
Date: Thu, 18 Jul 2024 08:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 137/139] fs/bcachefs/fs-io.c:967:13:
 warning: variable 'ret' set but not used
Message-ID: <202407180828.AzmspvTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   2fafde34d87cf01b1d403bc94515971fc719fd1e
commit: 0415bbece4236c59dae1abd0041b4cf7a5b5a46a [137/139] bcachefs: bch2_seek_hole() -> for_each_btree_key_in_subvolume_upto
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240718/202407180828.AzmspvTW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180828.AzmspvTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180828.AzmspvTW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs-io.c: In function 'bch2_seek_hole':
>> fs/bcachefs/fs-io.c:967:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     967 |         int ret;
         |             ^~~


vim +/ret +967 fs/bcachefs/fs-io.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16   960  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   961  static loff_t bch2_seek_hole(struct file *file, u64 offset)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   962  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   963  	struct bch_inode_info *inode = file_bch_inode(file);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   964  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
6fed42bb7750e21 Kent Overstreet 2021-03-16   965  	subvol_inum inum = inode_inum(inode);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   966  	u64 isize, next_hole = MAX_LFS_FILESIZE;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  @967  	int ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   968  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   969  	isize = i_size_read(&inode->v);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   970  	if (offset >= isize)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   971  		return -ENXIO;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   972  
0415bbece4236c5 Kent Overstreet 2024-07-17   973  	ret = bch2_trans_run(c,
0415bbece4236c5 Kent Overstreet 2024-07-17   974  		for_each_btree_key_in_subvolume_upto(trans, iter, BTREE_ID_extents,
0415bbece4236c5 Kent Overstreet 2024-07-17   975  				   POS(inode->v.i_ino, offset >> 9),
0415bbece4236c5 Kent Overstreet 2024-07-17   976  				   POS(inode->v.i_ino, U64_MAX),
0415bbece4236c5 Kent Overstreet 2024-07-17   977  				   inum.subvol, BTREE_ITER_slots, k, ({
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   978  			if (k.k->p.inode != inode->v.i_ino) {
543ef2ebcd90686 Kent Overstreet 2019-07-30   979  				next_hole = bch2_seek_pagecache_hole(&inode->v,
4198bf03bed27aa Kent Overstreet 2023-08-03   980  						offset, MAX_LFS_FILESIZE, 0, false);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   981  				break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   982  			} else if (!bkey_extent_is_data(k.k)) {
543ef2ebcd90686 Kent Overstreet 2019-07-30   983  				next_hole = bch2_seek_pagecache_hole(&inode->v,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   984  						max(offset, bkey_start_offset(k.k) << 9),
4198bf03bed27aa Kent Overstreet 2023-08-03   985  						k.k->p.offset << 9, 0, false);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   986  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   987  				if (next_hole < k.k->p.offset << 9)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   988  					break;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   989  			} else {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   990  				offset = max(offset, bkey_start_offset(k.k) << 9);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   991  			}
0415bbece4236c5 Kent Overstreet 2024-07-17   992  			0;
0415bbece4236c5 Kent Overstreet 2024-07-17   993  		})));
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   994  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   995  	if (next_hole > isize)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   996  		next_hole = isize;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   997  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   998  	return vfs_setpos(file, next_hole, MAX_LFS_FILESIZE);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16   999  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1000  

:::::: The code at line 967 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
