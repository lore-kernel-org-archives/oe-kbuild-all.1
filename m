Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FEF475355
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461279; cv=none; b=G5CTq3Pp9S6Bh2vt0wPyBRT85bN18vYdA7WBRHXFCK7OG/etoPjnd2gLIdQKkTKbonjIq5Kut16iwz3+M50fiKf6XVzT+SCrGqd0wrPnYERFD9R9jpqpcNC/uV8SMRsmN/bRoLSwoWAQK3q8+rLc1BAckbfI8ygGpYGQBAQTNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461279; c=relaxed/simple;
	bh=Qxd7IvnSO17EeuQd2CWXxl7GfzOzCdtPVXz5ar8oRMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f8MAFD00hn4xGhq+d64hZd7PENipWGnEhNjCEv4LVQy7IxsLVjeSKo/A2ggxeGGA25CfFkqXtSJMg4afeuC/21mkvZ+S5hMABqQEqpktSi0AEEMTZ9nIT6fYSPjUXGpueRXuUMrsPpLQ/zXdRbmo5eLPJVv0pWy3GF5iJIiYohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLgPlauP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLgPlauP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789461278; x=1820997278;
  h=date:from:to:cc:subject:message-id;
  bh=Qxd7IvnSO17EeuQd2CWXxl7GfzOzCdtPVXz5ar8oRMg=;
  b=cLgPlauPvoCRMdQlSyFtVeWHQZyrRGLbkER9Rv9F63cJVYNQHbqfkmRq
   +IEudArk1zT2LnyDOlb69cpuRgqKjJYvS5h6WWS+Unjkl4XZGWdUjI5pd
   Zng2CzUva8iiE6gCYG5MOIAFNDRl2qmgE/jVK2/0cjcswKbLTiyB6LYQO
   tgGQOtXG365uW+TQcNt+b9TpPS9dzu0NQ97HqrbfLDTbfkAKpJOZusnjl
   X2DJPzL3Lv7RXek4YCPfRzbCmUpKhou2hJOwc2lSE72SOCmdS3srcE7pO
   flfpM8mDKLPJryF1OW5l12q+mIzSvaAYgIZ8HmYpVePhHbKywonp3dzxB
   g==;
X-CSE-ConnectionGUID: h9pIF/AIR6ia/XTFShlJ+w==
X-CSE-MsgGUID: SQxoyaRTSaqzS+Mx6pdFJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101167074"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101167074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:34:37 -0700
X-CSE-ConnectionGUID: 2YWOY9UySNiiAWvGWdJIxQ==
X-CSE-MsgGUID: Z1CkFyyBT3Scs1W7neix8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="274837046"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 01:34:35 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6OcZ-000000004FZ-0DdW;
	Tue, 15 Sep 2026 08:34:31 +0000
Date: Tue, 15 Sep 2026 16:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 467/799]
 fs/bcachefs/vfs/fs.c:2040:1: warning: the frame size of 1320 bytes is larger
 than 1280 bytes
Message-ID: <202609151625.dzlkGe6b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/799] bcachefs: move vfs-specific code to vfs/
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260915/202609151625.dzlkGe6b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151625.dzlkGe6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151625.dzlkGe6b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/vfs/fs.c: In function 'bch2_get_name':
>> fs/bcachefs/vfs/fs.c:2040:1: warning: the frame size of 1320 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    2040 | }
         | ^
   fs/bcachefs/vfs/fs.c: In function 'bch2_rename2':
   fs/bcachefs/vfs/fs.c:1025:1: warning: the frame size of 1336 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1025 | }
         | ^


vim +2040 fs/bcachefs/vfs/fs.c

85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1944  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1945  static int bch2_get_name(struct dentry *parent, char *name, struct dentry *child)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1946  {
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1947  	struct bch_inode_info *inode	= to_bch_ei(child->d_inode);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1948  	struct bch_inode_info *dir	= to_bch_ei(parent->d_inode);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1949  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1950  	struct bkey_s_c k;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1951  	struct bkey_s_c_dirent d;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1952  	struct bch_inode_unpacked inode_u;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1953  	subvol_inum target;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1954  	u32 snapshot;
01a7e74fe14179 fs/bcachefs/fs.c Joshua Ashton   2023-08-12  1955  	struct qstr dirent_name;
01a7e74fe14179 fs/bcachefs/fs.c Joshua Ashton   2023-08-12  1956  	unsigned name_len = 0;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1957  	int ret;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1958  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1959  	if (!S_ISDIR(dir->v.i_mode))
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1960  		return -EINVAL;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1961  
0e869d7484badc fs/bcachefs/fs.c Kent Overstreet 2025-07-14  1962  	CLASS(btree_trans, trans)(c);
9c734c4857e939 fs/bcachefs/fs.c Kent Overstreet 2025-07-30  1963  	CLASS(btree_iter, iter1)(trans, BTREE_ID_dirents,
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1964  				 POS(dir->ei_inode.bi_inum, 0), 0);
9c734c4857e939 fs/bcachefs/fs.c Kent Overstreet 2025-07-30  1965  	CLASS(btree_iter, iter2)(trans, BTREE_ID_dirents,
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1966  				 POS(dir->ei_inode.bi_inum, 0), 0);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1967  retry:
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  1968  	bch2_trans_begin(trans);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1969  
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  1970  	ret = bch2_subvolume_get_snapshot(trans, dir->ei_inum.subvol, &snapshot);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1971  	if (ret)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1972  		goto err;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1973  
7c84dc243819ab fs/bcachefs/fs.c Kent Overstreet 2025-07-30  1974  	bch2_btree_iter_set_snapshot(&iter1, snapshot);
7c84dc243819ab fs/bcachefs/fs.c Kent Overstreet 2025-07-30  1975  	bch2_btree_iter_set_snapshot(&iter2, snapshot);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1976  
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  1977  	ret = bch2_inode_find_by_inum_trans(trans, inode_inum(inode), &inode_u);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1978  	if (ret)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1979  		goto err;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1980  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1981  	if (inode_u.bi_dir == dir->ei_inode.bi_inum) {
7c84dc243819ab fs/bcachefs/fs.c Kent Overstreet 2025-07-30  1982  		bch2_btree_iter_set_pos(&iter1, POS(inode_u.bi_dir, inode_u.bi_dir_offset));
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1983  
7c84dc243819ab fs/bcachefs/fs.c Kent Overstreet 2025-07-30  1984  		k = bch2_btree_iter_peek_slot(&iter1);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1985  		ret = bkey_err(k);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1986  		if (ret)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1987  			goto err;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1988  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1989  		if (k.k->type != KEY_TYPE_dirent) {
09b9c72bd4b77a fs/bcachefs/fs.c Kent Overstreet 2025-05-28  1990  			ret = bch_err_throw(c, ENOENT_dirent_doesnt_match_inode);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1991  			goto err;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1992  		}
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1993  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1994  		d = bkey_s_c_to_dirent(k);
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  1995  		ret = bch2_dirent_read_target(trans, inode_inum(dir), d, &target);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1996  		if (ret > 0)
09b9c72bd4b77a fs/bcachefs/fs.c Kent Overstreet 2025-05-28  1997  			ret = bch_err_throw(c, ENOENT_dirent_doesnt_match_inode);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1998  		if (ret)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  1999  			goto err;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2000  
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  2001  		if (subvol_inum_eq(target, inode->ei_inum))
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2002  			goto found;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2003  	} else {
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2004  		/*
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2005  		 * File with multiple hardlinks and our backref is to the wrong
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2006  		 * directory - linear search:
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2007  		 */
7c84dc243819ab fs/bcachefs/fs.c Kent Overstreet 2025-07-30  2008  		for_each_btree_key_continue_norestart(iter2, 0, k, ret) {
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2009  			if (k.k->p.inode > dir->ei_inode.bi_inum)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2010  				break;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2011  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2012  			if (k.k->type != KEY_TYPE_dirent)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2013  				continue;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2014  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2015  			d = bkey_s_c_to_dirent(k);
6bd68ec266ad71 fs/bcachefs/fs.c Kent Overstreet 2023-09-12  2016  			ret = bch2_dirent_read_target(trans, inode_inum(dir), d, &target);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2017  			if (ret < 0)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2018  				break;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2019  			if (ret)
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2020  				continue;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2021  
112d21fd1a122f fs/bcachefs/fs.c Kent Overstreet 2024-06-08  2022  			if (subvol_inum_eq(target, inode->ei_inum))
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2023  				goto found;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2024  		}
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2025  	}
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2026  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2027  	ret = -ENOENT;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2028  	goto err;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2029  found:
01a7e74fe14179 fs/bcachefs/fs.c Joshua Ashton   2023-08-12  2030  	dirent_name = bch2_dirent_get_name(d);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2031  
01a7e74fe14179 fs/bcachefs/fs.c Joshua Ashton   2023-08-12  2032  	name_len = min_t(unsigned, dirent_name.len, NAME_MAX);
01a7e74fe14179 fs/bcachefs/fs.c Joshua Ashton   2023-08-12  2033  	memcpy(name, dirent_name.name, name_len);
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2034  	name[name_len] = '\0';
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2035  err:
549d173c1bd9b5 fs/bcachefs/fs.c Kent Overstreet 2022-07-17  2036  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2037  		goto retry;
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2038  
85e95ca7cc48c2 fs/bcachefs/fs.c Kent Overstreet 2021-11-13  2039  	return ret;
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16 @2040  }
1c6fdbd8f2465d fs/bcachefs/fs.c Kent Overstreet 2017-03-16  2041  

:::::: The code at line 2040 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
