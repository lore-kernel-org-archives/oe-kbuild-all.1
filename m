Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2736FBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 00:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722904738; cv=none; b=MRLfrNvSJIga63NGKBCkAJplmfCHMYYNUvAXVneTjrbo9MAxYBBSvjkzIAwjanVKkEgZxq0knfOYzpB56TAWyEuhtjD5kXlz62yEZqwojpHE9Kv/xoN1+PTEJZNnMecD3eqRKkTLjLDvsodHRmxlc7ztZJIaan4vnVnLiWemsa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722904738; c=relaxed/simple;
	bh=G3amhSmAsMWXaIp/WGGQdx7Zv72ORJ03Ey1LnD08z1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcOuC1C12Ez16H1dZvHwsCclb8+rFO81Zx4dYwKQUSMA0gWeKbts61erlHOUZYf6fLrDX+vHVsniK7dFGwlZ7DGSouUYYrL8ZK84Ly2iYGtF7lVm/SXXLXRT7vFLfc/wV4sA3Sqo84bK7AQ5+f6VNn7FozGUfWs2X5TW11OGP+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlaQ5FEq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlaQ5FEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722904737; x=1754440737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3amhSmAsMWXaIp/WGGQdx7Zv72ORJ03Ey1LnD08z1o=;
  b=GlaQ5FEql3vmOnKUYa3JvadWIMOwovbLa2y0l6XuH0TmDcg4cSDpsFuJ
   Tvj97rQF6BgVWmOsNCQgVcIyZ5STXCsy8brc7HP0yqefA3iD3FS5ZoOp3
   tsJncXmnqeSzxP3aYrOo8Nzmhw/yeqVtE3y7TCdCYyuYNbaPb21mRuRWN
   bEn2YtUQJ86tUQbhEzcL34vypBf96WkJHPz1mq7Uyzs9KnDENsHhDqL8I
   ASr8HKFzwKmpepCJveGWz6WEfh6/OpztXI1XqLar5gJcT+JoJRxDGYSlw
   HyhsAVcX2ztVjIaksac9+iXuET4lw/YNuZI62YItGFQ9Pqb+Jez5nWfxa
   A==;
X-CSE-ConnectionGUID: sZOwSaQ9T96Nhqbz/yPrCg==
X-CSE-MsgGUID: dzdts8QfTemuT1cFs2o32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20711887"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20711887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 17:38:56 -0700
X-CSE-ConnectionGUID: Ly1DAo1lS7SLNTxXzwsuUA==
X-CSE-MsgGUID: wtMQ99WsRUSdLWW3XziL3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="60961370"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2024 17:38:54 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb8Dv-0003zM-00;
	Tue, 06 Aug 2024 00:38:49 +0000
Date: Tue, 6 Aug 2024 08:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 29/30] fs/namei.c:3265:38: error:
 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202408060841.BdwTriU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   3ef3065a07c0fc797ef9b034216f09d8b324e0b1
commit: 121ae7108b842f3ca7dc5dfd771ae94fe41fcecb [29/30] fs: add a "reason" parameter to try_break_deleg
config: m68k-m5407c3_defconfig (https://download.01.org/0day-ci/archive/20240806/202408060841.BdwTriU7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060841.BdwTriU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060841.BdwTriU7-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function '__vfs_create':
>> fs/namei.c:3265:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    3265 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:3265:38: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:3582:52: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    3582 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'open_last_lookups':
   fs/namei.c:3613:16: error: variable 'delegated_inode' has initializer but incomplete type
    3613 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:3613:32: error: storage size of 'delegated_inode' isn't known
    3613 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:3613:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_mknod':
   fs/namei.c:4097:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4097 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_mknodat':
   fs/namei.c:4155:16: error: variable 'delegated_inode' has initializer but incomplete type
    4155 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4155:32: error: storage size of 'delegated_inode' isn't known
    4155 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4155:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_mkdir':
   fs/namei.c:4240:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4240 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_mkdirat':
   fs/namei.c:4278:16: error: variable 'delegated_inode' has initializer but incomplete type
    4278 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4278:32: error: storage size of 'delegated_inode' isn't known
    4278 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4278:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_rmdir':
>> fs/namei.c:4339:38: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4339 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_rmdir':
   fs/namei.c:4389:16: error: variable 'delegated_inode' has initializer but incomplete type
    4389 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4389:32: error: storage size of 'delegated_inode' isn't known
    4389 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4389:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:4496:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4496 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_unlinkat':
   fs/namei.c:4538:16: error: variable 'delegated_inode' has initializer but incomplete type
    4538 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4538:32: error: storage size of 'delegated_inode' isn't known
    4538 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4538:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:4770:46: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4770 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_linkat':
   fs/namei.c:4804:16: error: variable 'delegated_inode' has initializer but incomplete type
    4804 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4804:32: error: storage size of 'delegated_inode' isn't known
    4804 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4804:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:5039:54: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function)
    5039 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5040:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5040 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5045:50: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5045 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_renameat2':
   fs/namei.c:5107:16: error: variable 'delegated_inode' has initializer but incomplete type
    5107 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:5107:32: error: storage size of 'delegated_inode' isn't known
    5107 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:5107:32: warning: unused variable 'delegated_inode' [-Wunused-variable]


vim +/LEASE_BREAK_DIR_CREATE +3265 fs/namei.c

  3247	
  3248	static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
  3249				struct dentry *dentry, umode_t mode, bool want_excl,
  3250				struct delegated_inode *delegated_inode)
  3251	{
  3252		int error;
  3253	
  3254		error = may_create(idmap, dir, dentry);
  3255		if (error)
  3256			return error;
  3257	
  3258		if (!dir->i_op->create)
  3259			return -EACCES;	/* shouldn't it be ENOSYS? */
  3260	
  3261		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  3262		error = security_inode_create(dir, dentry, mode);
  3263		if (error)
  3264			return error;
> 3265		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
  3266		if (error)
  3267			return error;
  3268		error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
  3269		if (!error)
  3270			fsnotify_create(dir, dentry);
  3271		return error;
  3272	}
  3273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
