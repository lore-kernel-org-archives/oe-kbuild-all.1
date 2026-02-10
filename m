Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3221D3F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770762785; cv=none; b=JiFAClZ0tOIXryl8cef59eeyKGft0cgetSsmfJcEM7qoBwz3N1WAsyNz8DhNVfBRZNdxzkXcFuA7PdiV3fMXWcgDZ4t3M73ETQSFMLjXMEggFC5obquI6mfTMmG1sBHjTPmCNXU2I5rRWmnApxMTwTIp1RK5LEcM60/rnkGv8ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770762785; c=relaxed/simple;
	bh=MdLRqgoEhIe646CKI034eoYj7i/OslZ0uju0lPZxqus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H2P1rTVwnrjSp9p5KFbNZEhivUciXA1TkJ9GqUd4hz4Uu9rmjrrngMJOynnIzR8AlYUVpfHTQISeIg2uTD4A2JMbGCw3MmSIruejb1wBy4dV7exmKFmLj3isgnJlGhtbpui8M0qnLf4uLsCfomAK+RESa6/i7vwZ9JiQO3tUOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xnfok2JA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xnfok2JA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770762784; x=1802298784;
  h=date:from:to:cc:subject:message-id;
  bh=MdLRqgoEhIe646CKI034eoYj7i/OslZ0uju0lPZxqus=;
  b=Xnfok2JAmp1Izx8s/yNWN95BhmPuPKFzpoP8DI++AJ+GY17FW41pUvTt
   Hm3D9+Hx700TRW6vrEFmhT5AotASIjLk0+caS+jkgz2zoxTKlpFz4PPxm
   bksE2sKkrzljLWnRX9Wv8hTAIr/MsplEBSf+vxFIe0xLkGQ44i8SK3LC/
   X4/ImQI5xVGEPbmylYPJx/lKOHv12bJ053UCbS9J6SufP3tOoSl4LxLmG
   /0OUtG2UnahtGseaVryqxHlSZYoSOKk+oOQEaTqyf8g+LdCq2j/2fqqI8
   Q3MI6xH28obuqnKLz8D3wqegwYhkYa2gKkJVPt7z3IAzwYaUyHsoCfcaM
   Q==;
X-CSE-ConnectionGUID: v3x9UF0mQQ6Wip4FvRQ2Vg==
X-CSE-MsgGUID: EUXunv3eQ3uK1zbzIcZLcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72092774"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72092774"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 14:33:04 -0800
X-CSE-ConnectionGUID: iXE2eP4uR/aZzBR/Cy4vTg==
X-CSE-MsgGUID: UWn/uDoPSV6CE6kqUkjkYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211500824"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 14:33:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpwI0-00000000pTU-0NoV;
	Tue, 10 Feb 2026 22:33:00 +0000
Date: Wed, 11 Feb 2026 06:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 2/24] fs/namei.c:4138:38: error:
 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202602110617.VHMDXCJR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   ab82ce180a346bc50223092e6d94b2aa7c863322
commit: 123469bc16f8ab7cebb5b7424e43fece577784b5 [2/24] filelock: add support for ignoring deleg breaks for dir change events
config: sparc-randconfig-002-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110617.VHMDXCJR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110617.VHMDXCJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110617.VHMDXCJR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function 'vfs_create':
>> fs/namei.c:4138:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4138 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4138:38: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:4438:52: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4438 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_mknod':
   fs/namei.c:4993:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4993 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_mkdir':
   fs/namei.c:5135:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5135 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_rmdir':
>> fs/namei.c:5241:38: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5241 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:5372:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5372 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_symlink':
   fs/namei.c:5519:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5519 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:5651:46: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5651 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:5921:54: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function)
    5921 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5922:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5922 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:5927:50: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5927 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/LEASE_BREAK_DIR_CREATE +4138 fs/namei.c

  4105	
  4106	/**
  4107	 * vfs_create - create new file
  4108	 * @idmap:	idmap of the mount the inode was found from
  4109	 * @dentry:	dentry of the child file
  4110	 * @mode:	mode of the child file
  4111	 * @di:		returns parent inode, if the inode is delegated.
  4112	 *
  4113	 * Create a new file.
  4114	 *
  4115	 * If the inode has been found through an idmapped mount the idmap of
  4116	 * the vfsmount must be passed through @idmap. This function will then take
  4117	 * care to map the inode according to @idmap before checking permissions.
  4118	 * On non-idmapped mounts or if permission checking is to be performed on the
  4119	 * raw inode simply pass @nop_mnt_idmap.
  4120	 */
  4121	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4122		       struct delegated_inode *di)
  4123	{
  4124		struct inode *dir = d_inode(dentry->d_parent);
  4125		int error;
  4126	
  4127		error = may_create(idmap, dir, dentry);
  4128		if (error)
  4129			return error;
  4130	
  4131		if (!dir->i_op->create)
  4132			return -EACCES;	/* shouldn't it be ENOSYS? */
  4133	
  4134		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4135		error = security_inode_create(dir, dentry, mode);
  4136		if (error)
  4137			return error;
> 4138		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4139		if (error)
  4140			return error;
  4141		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4142		if (!error)
  4143			fsnotify_create(dir, dentry);
  4144		return error;
  4145	}
  4146	EXPORT_SYMBOL(vfs_create);
  4147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
