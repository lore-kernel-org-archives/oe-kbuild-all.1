Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786C3783C9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534624; cv=none; b=We4rk6+Axql31DezV3XegQLXW/lqOLUqRzr1UIztYsDk1sjkzlBFamiwaXZcW1qky2JAPUStukhOzapyjrmTKYq5bkRZl286J1/JFTj4Bq5uRqKwlCr3pZWDz3uVzi8aOjw8n1S5sWNIOTI2Qggcs/DwyhSFZGeU8rC4ULhbueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534624; c=relaxed/simple;
	bh=WWGOaDRm/tAiykwpEEzAR5kuLFGTEQwwcUz9vlSE9FI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fxPsaStvUg9qXaqOj6phqV5PLlUKIBJV4lCjhhd/PodTeUGZIH9mg6BCkcN5c/fhfu0HASgHRkiBJUoUaBKVGRkx++RqLZCHazeiyEZbyIwSACMZIwlq9OtupgkgdAyR5C2kJ851E+KLvhdoPevzyf3RpRfPJkf9btPKNbqEflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLOhQU/P; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLOhQU/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534623; x=1807070623;
  h=date:from:to:cc:subject:message-id;
  bh=WWGOaDRm/tAiykwpEEzAR5kuLFGTEQwwcUz9vlSE9FI=;
  b=eLOhQU/PcOf1ARShboZWtj8sWmGVpkWN8Ij1N6SynUxDbz0ETrkBltnB
   NBzRBibOEnw1X+E9rCw+NEgxzD8KUPSxdvJ8kF+H/MPB7op4Rr9BSn+22
   tugv7AUzqzD2Mnhb0Q09Amhw9ynUMVZCApOQwu6pwYoKV0GLdbYnbVsWQ
   DAZlAJ+KcE0eaySFw+WlwbPgd/3rIWmzUsidEv7FKJwatIr7gN0/I4cZp
   NTLF0NflJhDTdZ21G+/050/NONcFjFzbGTP440Hbu3Kp921rP9rK9LazS
   4iNlfHNeZ4XLYp1uk01CmGB7hjElfvEyki6Mec6oAJsX0A4hAU7qrPlA/
   Q==;
X-CSE-ConnectionGUID: 1NynV3Y8SuKnk0M/4Tuv9g==
X-CSE-MsgGUID: rGWuLQlYQ8u9e7gJ8Ie72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114719"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114719"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:38 -0700
X-CSE-ConnectionGUID: i6c6yWDKRwqlLB90Vdvtwg==
X-CSE-MsgGUID: jy8jDROFQS2WA0iMYwK4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261244"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008n-0Ijj;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 4/27] fs/namei.c:4173:38: error:
 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202604071004.twcZfiIB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   4c7561ebe642f97bf42406cdbbda294c0b7b4a63
commit: 6c5b0d9e45361e997bfb76a078bc1013a04ac0b3 [4/27] filelock: add support for ignoring deleg breaks for dir change events
config: openrisc-randconfig-r071-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071004.twcZfiIB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071004.twcZfiIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071004.twcZfiIB-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function 'vfs_create':
>> fs/namei.c:4173:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4173 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4173:38: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:4472:52: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4472 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_mknod':
   fs/namei.c:5088:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5088 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_mkdir':
   fs/namei.c:5229:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5229 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_rmdir':
>> fs/namei.c:5334:38: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5334 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:5464:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5464 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_symlink':
   fs/namei.c:5611:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5611 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:5742:46: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5742 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:6009:54: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function)
    6009 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:6010:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    6010 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:6015:50: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    6015 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/LEASE_BREAK_DIR_CREATE +4173 fs/namei.c

  4140	
  4141	/**
  4142	 * vfs_create - create new file
  4143	 * @idmap:	idmap of the mount the inode was found from
  4144	 * @dentry:	dentry of the child file
  4145	 * @mode:	mode of the child file
  4146	 * @di:		returns parent inode, if the inode is delegated.
  4147	 *
  4148	 * Create a new file.
  4149	 *
  4150	 * If the inode has been found through an idmapped mount the idmap of
  4151	 * the vfsmount must be passed through @idmap. This function will then take
  4152	 * care to map the inode according to @idmap before checking permissions.
  4153	 * On non-idmapped mounts or if permission checking is to be performed on the
  4154	 * raw inode simply pass @nop_mnt_idmap.
  4155	 */
  4156	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4157		       struct delegated_inode *di)
  4158	{
  4159		struct inode *dir = d_inode(dentry->d_parent);
  4160		int error;
  4161	
  4162		error = may_create_dentry(idmap, dir, dentry);
  4163		if (error)
  4164			return error;
  4165	
  4166		if (!dir->i_op->create)
  4167			return -EACCES;	/* shouldn't it be ENOSYS? */
  4168	
  4169		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4170		error = security_inode_create(dir, dentry, mode);
  4171		if (error)
  4172			return error;
> 4173		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4174		if (error)
  4175			return error;
  4176		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4177		if (!error)
  4178			fsnotify_create(dir, dentry);
  4179		return error;
  4180	}
  4181	EXPORT_SYMBOL(vfs_create);
  4182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
