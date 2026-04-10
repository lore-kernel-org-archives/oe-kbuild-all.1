Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DBFA59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775863404; cv=none; b=jGNv8oRf9bvgySm9Q1z3lop+ckqfPLnk9KB6DU6G1Mf5VK3uBG3RyLjgu/CqGPQmVyjc4rOQlHFTz2NL2yAsfvSMLNOas3XRmII0wl8L6DYYX/fp2mtu9aWcz1pXMHtu4B9JU9VZyTcprAJQ/rf3MRUi4AgBn4FfEGpg5ilr4LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775863404; c=relaxed/simple;
	bh=W3ZAedOBHQUzDpITntADzS5bb93KAoxvIpLRYPlTHS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZN+Ocv7HWeXGwkb8ED5wcD1xwcIlrLLCLfi+GE2wIY5E/Q7nr/dRzKaLO14Pp1Iwkw+mAbFxWxjQTtpDP/Q1mGHq+wos8Y3Kzvlq9cJBVWwQvRplDK8dAEJorCZF944iz1gtM7si/7rlNTs35nzUeisq826UFy8pI7B4rFJONJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XARl384i; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XARl384i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775863404; x=1807399404;
  h=date:from:to:cc:subject:message-id;
  bh=W3ZAedOBHQUzDpITntADzS5bb93KAoxvIpLRYPlTHS0=;
  b=XARl384iNNmDtjsPi/Q884dad5xRwqbWuaR1FlbLID2jao85Bf5HcN1n
   OSkFvfq1m6E264PURs7MmbM7r1T8dHj94Ykbcrs6B0ixnVsG4mg54i0Vm
   EB4m7xd6jU2WAtt63oTEG52+c41pQmKAlA1v4DtebKzQ4wGuv67ybLKvi
   ByB4RQoB5gcvToyMX+ckvf4qB9g1FjJ8kGGvPyH1UFUSPeTe1KrYOj1EX
   OCeYXwlk61ywnh+OaHbMyM916HZd2lNByXFIn5eg1G46ELvISNXXudspQ
   hb1dlWYlcRmwZqaYxDaZ3d3jjiC6m9/rXryaoPLXhhWez3p75x7s1g7mn
   A==;
X-CSE-ConnectionGUID: kFStJBWDQvuMGEixJCID+A==
X-CSE-MsgGUID: S1QcgyEMQJ66d7NbVG9CSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94464253"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="94464253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:23:23 -0700
X-CSE-ConnectionGUID: vbMqZo9ETdOCKEaSCpiWPA==
X-CSE-MsgGUID: DS5O5Hs9S0K8H0keko/OJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222742776"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 16:23:21 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLC3-000000000MP-09PE;
	Fri, 10 Apr 2026 23:23:19 +0000
Date: Sat, 11 Apr 2026 07:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [jlayton:dir-deleg 4/27] fs/namei.c:4179:31: error:
 'LEASE_BREAK_DIR_CREATE' undeclared; did you mean 'FL_IGN_DIR_CREATE'?
Message-ID: <202604110734.nR1PSrWs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   340042c418d5b1b9287c2cdd19cae0f1c012da40
commit: 9c7ece0d6dc6e427217c4086f7d90e1932a9acad [4/27] filelock: add support for ignoring deleg breaks for dir change events
config: s390-randconfig-001-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110734.nR1PSrWs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110734.nR1PSrWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110734.nR1PSrWs-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function 'vfs_create':
>> fs/namei.c:4179:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c:4179:31: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:4478:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                         ^~~~~~~~~~~~~~~~~~~~~~
                                         FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_mknod':
   fs/namei.c:5094:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_mkdir':
   fs/namei.c:5235:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_rmdir':
>> fs/namei.c:5340:31: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_DELETE
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:5470:33: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
       error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
                                    ^~~~~~~~~~~~~~~~~~~~~~
                                    FL_IGN_DIR_DELETE
   fs/namei.c: In function 'vfs_symlink':
   fs/namei.c:5617:31: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
     error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                  ^~~~~~~~~~~~~~~~~~~~~~
                                  FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:5748:32: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                   ^~~~~~~~~~~~~~~~~~~~~~
                                   FL_IGN_DIR_CREATE
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:6015:26: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function); did you mean 'FL_IGN_DIR_RENAME'?
        old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
                             ^~~~~~~~~~~~~~~~~~~~~~
                             FL_IGN_DIR_RENAME
   fs/namei.c:6016:12: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_DELETE'?
               LEASE_BREAK_DIR_DELETE,
               ^~~~~~~~~~~~~~~~~~~~~~
               FL_IGN_DIR_DELETE
   fs/namei.c:6021:36: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function); did you mean 'FL_IGN_DIR_CREATE'?
      error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
                                       ^~~~~~~~~~~~~~~~~~~~~~
                                       FL_IGN_DIR_CREATE

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +4179 fs/namei.c

  4146	
  4147	/**
  4148	 * vfs_create - create new file
  4149	 * @idmap:	idmap of the mount the inode was found from
  4150	 * @dentry:	dentry of the child file
  4151	 * @mode:	mode of the child file
  4152	 * @di:		returns parent inode, if the inode is delegated.
  4153	 *
  4154	 * Create a new file.
  4155	 *
  4156	 * If the inode has been found through an idmapped mount the idmap of
  4157	 * the vfsmount must be passed through @idmap. This function will then take
  4158	 * care to map the inode according to @idmap before checking permissions.
  4159	 * On non-idmapped mounts or if permission checking is to be performed on the
  4160	 * raw inode simply pass @nop_mnt_idmap.
  4161	 */
  4162	int vfs_create(struct mnt_idmap *idmap, struct dentry *dentry, umode_t mode,
  4163		       struct delegated_inode *di)
  4164	{
  4165		struct inode *dir = d_inode(dentry->d_parent);
  4166		int error;
  4167	
  4168		error = may_create_dentry(idmap, dir, dentry);
  4169		if (error)
  4170			return error;
  4171	
  4172		if (!dir->i_op->create)
  4173			return -EACCES;	/* shouldn't it be ENOSYS? */
  4174	
  4175		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  4176		error = security_inode_create(dir, dentry, mode);
  4177		if (error)
  4178			return error;
> 4179		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
  4180		if (error)
  4181			return error;
  4182		error = dir->i_op->create(idmap, dir, dentry, mode, true);
  4183		if (!error)
  4184			fsnotify_create(dir, dentry);
  4185		return error;
  4186	}
  4187	EXPORT_SYMBOL(vfs_create);
  4188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
