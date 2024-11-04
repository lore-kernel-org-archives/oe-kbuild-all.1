Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188461FD8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 01:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730682726; cv=none; b=Gu5gZCDvGJc5suIViAMa1XuzhDMdiRDG7u3YXo8QXSDccjqRUPQp3FgKJfVFFDYYOEsJGxThE97Cu0WWcm7A7DJRpfibOxV1G3bwWvXEj0jDHDm0e5/ULlNAd0qSKQgB4hgF+qIOpSo/+hss0MVQE2KufvDLN018ifRu6+fW4h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730682726; c=relaxed/simple;
	bh=hI4576UuckPdRDsPejH7Zvu8SW/ogL/1G80MyGmE3pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1CQuhQhRtVEK3qEGkng+CtrOzx4HRhoS1zr1CDkNgfuo7AN2coE6VlTQt85aAGK6+DYfoBPR/fjrLNXrqxvNQSvVmm32j55aIJUhtYKUk+PDjEot/Cx/TUpjoRqYxUiYnGaV+O0LGKZdJXWhXsqUndemXh1ZAmMeD+JZHqUBMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHk9r5Xg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHk9r5Xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730682725; x=1762218725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hI4576UuckPdRDsPejH7Zvu8SW/ogL/1G80MyGmE3pY=;
  b=jHk9r5XgW++6sk66a/d18dxPn5OMCJMteXbl5RTSMffy4MfxF5JCaR9R
   IFy/3VhaRRELjnwQqAfm4TBR6D6UOMhbYBwL6mgG4cvj1FzKkK7JFlQ27
   /VyveHefjqe3faHmyALNZW7nnMf3Cg2g9XMIGPyCCocaxxctt9UILl7It
   0I9MAKmQsR2uflkSnIpbMaTGXdnvwaOzpOJFvEUHBacndWGdDeS1uexic
   MerD2sERSu2ZRPawqg1eWdkjmro/jxjXQzaZB/QShK1IQO6GbLwEfgw1a
   VPcRpIYcQrTTd2hZSB6iYg6zQs/ZQGtih/vrZDl7V9eYzsoTjm/NpWykC
   w==;
X-CSE-ConnectionGUID: bPjR1WUaTc2+A48uzp2wiA==
X-CSE-MsgGUID: 0N/MDpXoT3Khk2vR4OwAnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30218261"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30218261"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 17:12:05 -0800
X-CSE-ConnectionGUID: o7rR/hkkSAak9sB816nMMA==
X-CSE-MsgGUID: jCcb7zUgRdeik0/9Yv1CkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114308875"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2024 17:12:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7ldR-000kL7-0t;
	Mon, 04 Nov 2024 01:12:01 +0000
Date: Mon, 4 Nov 2024 09:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/42] fs/namei.c:3279:38: error:
 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202411040935.BTYbOkNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   7c5f52902153bdf6d59451262c63a5dc54c66f01
commit: 9a34820ca26623411877c1af5a4d81f5c00c0ed5 [32/42] fs: add a "reason" parameter to try_break_deleg
config: x86_64-buildonly-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411040935.BTYbOkNI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040935.BTYbOkNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040935.BTYbOkNI-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function '__vfs_create':
>> fs/namei.c:3279:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    3279 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:3279:38: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:3599:52: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    3599 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'open_last_lookups':
   fs/namei.c:3666:16: error: variable 'delegated_inode' has initializer but incomplete type
    3666 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:3666:32: error: storage size of 'delegated_inode' isn't known
    3666 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:3666:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_mknod':
   fs/namei.c:4144:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4144 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_mknodat':
   fs/namei.c:4202:16: error: variable 'delegated_inode' has initializer but incomplete type
    4202 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4202:32: error: storage size of 'delegated_inode' isn't known
    4202 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4202:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_mkdir':
   fs/namei.c:4287:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4287 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_mkdirat':
   fs/namei.c:4325:16: error: variable 'delegated_inode' has initializer but incomplete type
    4325 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4325:32: error: storage size of 'delegated_inode' isn't known
    4325 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4325:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_rmdir':
>> fs/namei.c:4386:38: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4386 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_rmdir':
   fs/namei.c:4436:16: error: variable 'delegated_inode' has initializer but incomplete type
    4436 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4436:32: error: storage size of 'delegated_inode' isn't known
    4436 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4436:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:4543:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4543 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_unlinkat':
   fs/namei.c:4585:16: error: variable 'delegated_inode' has initializer but incomplete type
    4585 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4585:32: error: storage size of 'delegated_inode' isn't known
    4585 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4585:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:4817:46: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4817 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_linkat':
   fs/namei.c:4851:16: error: variable 'delegated_inode' has initializer but incomplete type
    4851 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4851:32: error: storage size of 'delegated_inode' isn't known
    4851 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4851:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:5086:54: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function)
    5086 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5087:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5087 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5092:50: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5092 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_renameat2':
   fs/namei.c:5154:16: error: variable 'delegated_inode' has initializer but incomplete type
    5154 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:5154:32: error: storage size of 'delegated_inode' isn't known
    5154 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:5154:32: warning: unused variable 'delegated_inode' [-Wunused-variable]


vim +/LEASE_BREAK_DIR_CREATE +3279 fs/namei.c

  3261	
  3262	static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
  3263				struct dentry *dentry, umode_t mode, bool want_excl,
  3264				struct delegated_inode *delegated_inode)
  3265	{
  3266		int error;
  3267	
  3268		error = may_create(idmap, dir, dentry);
  3269		if (error)
  3270			return error;
  3271	
  3272		if (!dir->i_op->create)
  3273			return -EACCES;	/* shouldn't it be ENOSYS? */
  3274	
  3275		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  3276		error = security_inode_create(dir, dentry, mode);
  3277		if (error)
  3278			return error;
> 3279		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
  3280		if (error)
  3281			return error;
  3282		error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
  3283		if (!error)
  3284			fsnotify_create(dir, dentry);
  3285		return error;
  3286	}
  3287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
