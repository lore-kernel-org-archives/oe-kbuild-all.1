Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1D719CD0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499707; cv=none; b=ibp/W14g6D46IGpDjA3Q4J0q9WnaTHO8YpwGki168W2siW/sMVHXQN4FY75qqUmTrdPvMIkHPPAxdKPvXcAyy0bf1/mT6J47k06dJjSEqOsNxUOXomXTNoJbHzrWP9USfaovobtbhMCmMKzUvShFmSwTG7zgmj+Sx950MRKn6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499707; c=relaxed/simple;
	bh=tuhxXPJEOllv7HOLlzeooeeGBX9SNip7d+VTvzqVBvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R0cYnZ8gE42RZlLDKDgxjy1OLRUDrGzSDxeadalgB7GINw/eAeVJ3HWPPR1tATgl2vCuLMpr8qHCvgoDaok0EoGchk4EWl928CbJNJ5s3vPi+wb9uHV4KySMuP22IwVCDOvT4zwXeMVfBuIltI7aHO7CATABCrcbJAS6mXxy+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4v6h24I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4v6h24I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774499706; x=1806035706;
  h=date:from:to:cc:subject:message-id;
  bh=tuhxXPJEOllv7HOLlzeooeeGBX9SNip7d+VTvzqVBvc=;
  b=C4v6h24IoZEiW0pyBh4+80X7YE0pPqtl1Uw9bAyMxGX510qlkJVRHNHB
   eGA+1eiU0JOfE7X9PrABrguVveiAZPgGItnh4gn5o16XSquowAxpo1dC1
   sqP8ezuyt+cFDL36UVSxr2ktXkAWHUdKsNz1Nn1dfHANcChARHJkVlc71
   kfN9eH4EXHrbQ9zYI42q87BtZKLPBfHDefzNpADGVmj/uodfpA0TzzlzU
   1AnJtqMS9Gi0pTEalnmbzxdJs/KFxQgBv0ArNqVUNnviesfInKuBTc9fi
   B9A2BSNZRYzoY6OPecuHtW0xXbvM2/hYPHtLbmsD+ZhzOcYXcLrfJGLfD
   A==;
X-CSE-ConnectionGUID: RmW9NHHsSm+Nq1v53/1Cdg==
X-CSE-MsgGUID: v0z3hmgtQAaPwz886Tlzww==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86628143"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="86628143"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:35:05 -0700
X-CSE-ConnectionGUID: luZlTJMfTU2vnfHOOkiIUg==
X-CSE-MsgGUID: fqgoBEMxRDugpY+ytvMBUw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Mar 2026 21:35:04 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5cQv-000000008A5-2GNh;
	Thu, 26 Mar 2026 04:35:01 +0000
Date: Thu, 26 Mar 2026 12:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 4/26] fs/namei.c:4173:31: error:
 'LEASE_BREAK_DIR_CREATE' undeclared; did you mean 'FL_IGN_DIR_CREATE'?
Message-ID: <202603261204.fsjndHIu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   996759a25534ab4a7e986fe0153659e93c1611ec
commit: e7730a146d19c905b78c9c16be3d172b194ab963 [4/26] filelock: add support for ignoring deleg breaks for dir change events
config: arc-randconfig-002-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261204.fsjndHIu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261204.fsjndHIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261204.fsjndHIu-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function 'vfs_create':
>> fs/namei.c:4173:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c:4173:31: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:4472:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                         ^~~~~~~~~~~~~~~~~~~~~~
                                         FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_mknod':
   fs/namei.c:5088:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_mkdir':
   fs/namei.c:5229:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_rmdir':
>> fs/namei.c:5334:31: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_DELETE
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:5464:33: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
       error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
                                    ^~~~~~~~~~~~~~~~~~~~~~
                                    FL_IGN_DIR_DELETE
   fs/namei.c: In function 'vfs_symlink':
   fs/namei.c:5611:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:5742:32: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                   ^~~~~~~~~~~~~~~~~~~~~~
                                   FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:6009:26: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function); did you mean 'FL_IGN_DIR_RENAME'?
        old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
                             ^~~~~~~~~~~~~~~~~~~~~~
                             FL_IGN_DIR_RENAME
   fs/namei.c:6010:12: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
               LEASE_BREAK_DIR_DELETE,
               ^~~~~~~~~~~~~~~~~~~~~~
               FL_IGN_DIR_DELETE
   fs/namei.c:6015:36: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                       ^~~~~~~~~~~~~~~~~~~~~~
                                       FL_IGN_DIR_CREATE


vim +4173 fs/namei.c

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
