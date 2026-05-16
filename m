Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FD405C4F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 04:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778906960; cv=none; b=kuXBrp8loHds2z0OPoMe1s0+MzTxoQEgtcWqYpnKY1KiZBjeOQ00TyLLJ2sDppqX17c4pk+aetl/xFYMLcVbQJB1JMUnLtgkTYnE6VlFsXO8XeJF8FNueFIo0rrCMR9EIFZP+tQgLY+5Aa3Dm/pQblVW+NobYBG+5zWTPRlJXOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778906960; c=relaxed/simple;
	bh=3Te49s6D8s2wWdpO5JBeDEEcRXmqEtoiJ6pKKm37x38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IZw2HeI3rat8sWGhoe1O7AoGf/mhEeahuDOFLSbEY1o1dOGb+naVajDqAdnLz8yoiQniv1G4iIQz3cdmruDDhILJeh2VJpmnVVTSsdsxQc331hC+QsX9XI0VgUK2HqPe0s8ojOn60OPY02CpPeyhS9pGLfBdZEHShrLYgixEtRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A89luTJb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A89luTJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778906959; x=1810442959;
  h=date:from:to:cc:subject:message-id;
  bh=3Te49s6D8s2wWdpO5JBeDEEcRXmqEtoiJ6pKKm37x38=;
  b=A89luTJbmGcRRxlEUfU8WtTa2f4qVvABQ/w8OCPTTtczyepsMCF9gXen
   AAskygeyLVWnaVAENXnlHLqI58zB9rf1OpTqEa4G+O7y0y+RSxtjfZo+d
   yPk+xUGyW5288QCG61Xs+1KgJqxlqBZHFrtvKEyuP++ql9noDQfmY9hpu
   AUoe8gnNwY0Q3P4CjJFCzeKJ9AEui6iBsiXLBK8r7HTQFWyMm7Wyumza9
   cW35vqQltP/eGIagyjiAcrp8Fqcth135V78rG7r0QkdUxeZDf23b0Bej2
   ymASJFhS15uZ3eECjyzYg0l/gsLbVBZ8JV9tgaDVz+WjtBDYTtMAcTsvy
   w==;
X-CSE-ConnectionGUID: jib6eSDOQHWaWv2f7OxFww==
X-CSE-MsgGUID: VX92DxlmTKybZ8InUZTF1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90554785"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90554785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 21:49:18 -0700
X-CSE-ConnectionGUID: SrF63CKmTVmb0lF5X2nvbQ==
X-CSE-MsgGUID: 7USTRMwcQOqCnX4vD/8KQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="232502720"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2026 21:49:17 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO6xe-000000000VV-2Cr2;
	Sat, 16 May 2026 04:49:14 +0000
Date: Sat, 16 May 2026 12:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-github:vfs-7.2.directory.delegations 2/8]
 fs/namei.c:4201:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202605161232.1lY6pZoM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.2.directory.delegations
head:   1e325f7debec9bb22c71bc7336135bf8f87b730a
commit: 24cbf43337f46329ddda5983bc3c585174a020ee [2/8] filelock: add support for ignoring deleg breaks for dir change events
config: x86_64-buildonly-randconfig-004-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161232.1lY6pZoM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161232.1lY6pZoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161232.1lY6pZoM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function 'vfs_create':
>> fs/namei.c:4201:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4201 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4201:38: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:4500:52: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4500 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_mknod':
   fs/namei.c:5116:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5116 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_mkdir':
   fs/namei.c:5257:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5257 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_rmdir':
>> fs/namei.c:5362:38: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5362 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:5492:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    5492 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_symlink':
   fs/namei.c:5639:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5639 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:5770:46: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    5770 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:6037:54: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function)
    6037 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:6038:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    6038 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:6043:50: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    6043 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/LEASE_BREAK_DIR_CREATE +4201 fs/namei.c

  4168	
  4169	/**
  4170	 * vfs_create - create new file
  4171	 * @idmap:	idmap of the mount the inode was found from
  4172	 * @dentry:	dentry of the child file
  4173	 * @mode:	mode of the child file
  4174	 * @di:		returns parent inode, if the inode is delegated.
  4175	 *
  4176	 * Create a new file.
  4177	 *
  4178	 * If the inode has been found through an idmapped mount the idmap of
  4179	 * the vfsmount must be passed through @idmap. This function will then take
  4180	 * care to map the inode according to @idmap before checking permissions.
  4181	 * On non-idmapped mounts or if permission checking is to be performed on the
  4182	 * raw inode simply pass @nop_mnt_idmap.
  4183	 */
  4184	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4185		       struct delegated_inode *di)
  4186	{
  4187		struct inode *dir = d_inode(dentry->d_parent);
  4188		int error;
  4189	
  4190		error = may_create_dentry(idmap, dir, dentry);
  4191		if (error)
  4192			return error;
  4193	
  4194		if (!dir->i_op->create)
  4195			return -EACCES;	/* shouldn't it be ENOSYS? */
  4196	
  4197		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4198		error = security_inode_create(dir, dentry, mode);
  4199		if (error)
  4200			return error;
> 4201		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4202		if (error)
  4203			return error;
  4204		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4205		if (!error)
  4206			fsnotify_create(dir, dentry);
  4207		return error;
  4208	}
  4209	EXPORT_SYMBOL(vfs_create);
  4210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
