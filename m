Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6855FDC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842948; cv=none; b=Fwo5KP5IEGb3XWIUlXr1sav6axc7Fb0HdBavM4bwR0hA2/LVUgPKkzFDWLBEXJ/YnU2sgSPDhcyvaTCXWv7nD45ckR/ct+h0nDuA+HrDuR5i77Gjou6fLKQnO4rLcNkZexCo6y3ZwfX8JCMRYLeht1SRKeqe7/HkZ56X3eb9hYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842948; c=relaxed/simple;
	bh=XEX+XU0FKdyPHq8kUMsW9G9BcTN+9QcDBhMNDBRboUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t+xzzoQMhh9WkGp8nrxhZ9Pf3cPdrokzgyTp2t7DsD16kJ2h8/GGi1l0xGMSdmnCu1v/2cBXzXuGjOYScWX8kPwP2MtXGCaI5vIbtwIcLpp7iRov0pj5j/vNiIo4bJtitHbWyIBeLObUoRf1QK54Of6UfAkDuxEnIp6k3srGnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fih1FfYM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fih1FfYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707842947; x=1739378947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XEX+XU0FKdyPHq8kUMsW9G9BcTN+9QcDBhMNDBRboUA=;
  b=Fih1FfYMS4jv9vzUByL3TxdH27fEp2xqGHWo/gVe+Lh2UqnUo1jwyOuj
   khd1uZF9gCLi+QfTRcZUhgWd2xAR2YtLQ5Icuk2ojsA18HA9h2zdQK+Nf
   s0eXUjkKiiAOOogbmjneZ+myh/d+y1CBLPBeQ9OiN69Zj+5hDWblmpbWp
   bw1eVmrennijEKy3oghQ3xzapd0xzdkYUy6mZYs9ChZOXjw4UbeADdtLC
   nPzedhvBadhj4gVbloy5DVDBAR+S6/h5OOV7ylPOi19PBwZLxDCwg4TTu
   w/zXz1eh04dgT0HaJJVIvDFFbK1R16gT1sFOntSJMd4b+3PW0/ASzqDkX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12492088"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12492088"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 08:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3233257"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2024 08:49:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZvxt-0007uO-25;
	Tue, 13 Feb 2024 16:49:01 +0000
Date: Wed, 14 Feb 2024 00:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 12/12] fs/namei.c:4103: warning: Function
 parameter or struct member 'delegated_inode' not described in 'vfs_mkdir'
Message-ID: <202402140044.JisAKFFn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   bc750b374b938c02896586cd7fa7d3b8f66b89d2
commit: bc750b374b938c02896586cd7fa7d3b8f66b89d2 [12/12] vfs: allow mkdir to wait for delegation break on parent
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240214/202402140044.JisAKFFn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140044.JisAKFFn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140044.JisAKFFn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namei.c:4103: warning: Function parameter or struct member 'delegated_inode' not described in 'vfs_mkdir'


vim +4103 fs/namei.c

5590ff0d5528b6 Ulrich Drepper        2006-01-18  4085  
6521f891708292 Christian Brauner     2021-01-21  4086  /**
6521f891708292 Christian Brauner     2021-01-21  4087   * vfs_mkdir - create directory
abf08576afe315 Christian Brauner     2023-01-13  4088   * @idmap:	idmap of the mount the inode was found from
6521f891708292 Christian Brauner     2021-01-21  4089   * @dir:	inode of @dentry
6521f891708292 Christian Brauner     2021-01-21  4090   * @dentry:	pointer to dentry of the base directory
6521f891708292 Christian Brauner     2021-01-21  4091   * @mode:	mode of the new directory
6521f891708292 Christian Brauner     2021-01-21  4092   *
6521f891708292 Christian Brauner     2021-01-21  4093   * Create a directory.
6521f891708292 Christian Brauner     2021-01-21  4094   *
abf08576afe315 Christian Brauner     2023-01-13  4095   * If the inode has been found through an idmapped mount the idmap of
abf08576afe315 Christian Brauner     2023-01-13  4096   * the vfsmount must be passed through @idmap. This function will then take
abf08576afe315 Christian Brauner     2023-01-13  4097   * care to map the inode according to @idmap before checking permissions.
6521f891708292 Christian Brauner     2021-01-21  4098   * On non-idmapped mounts or if permission checking is to be performed on the
376870aa234439 Alexander Mikhalitsyn 2023-12-15  4099   * raw inode simply pass @nop_mnt_idmap.
6521f891708292 Christian Brauner     2021-01-21  4100   */
abf08576afe315 Christian Brauner     2023-01-13  4101  int vfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
bc750b374b938c Jeff Layton           2024-02-12  4102  	      struct dentry *dentry, umode_t mode, struct inode **delegated_inode)
^1da177e4c3f41 Linus Torvalds        2005-04-16 @4103  {
abf08576afe315 Christian Brauner     2023-01-13  4104  	int error;
8de52778798fe3 Al Viro               2012-02-06  4105  	unsigned max_links = dir->i_sb->s_max_links;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4106  
4609e1f18e19c3 Christian Brauner     2023-01-13  4107  	error = may_create(idmap, dir, dentry);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4108  	if (error)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4109  		return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4110  
acfa4380efe77e Al Viro               2008-12-04  4111  	if (!dir->i_op->mkdir)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4112  		return -EPERM;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4113  
9452e93e6dae86 Christian Brauner     2023-01-13  4114  	mode = vfs_prepare_mode(idmap, dir, mode, S_IRWXUGO | S_ISVTX, 0);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4115  	error = security_inode_mkdir(dir, dentry, mode);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4116  	if (error)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4117  		return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4118  
8de52778798fe3 Al Viro               2012-02-06  4119  	if (max_links && dir->i_nlink >= max_links)
8de52778798fe3 Al Viro               2012-02-06  4120  		return -EMLINK;
8de52778798fe3 Al Viro               2012-02-06  4121  
c54bd91e9eaba4 Christian Brauner     2023-01-13  4122  	error = dir->i_op->mkdir(idmap, dir, dentry, mode);
a74574aafea3a6 Stephen Smalley       2005-09-09  4123  	if (!error)
f38aa94224c551 Amy Griffis           2005-11-03  4124  		fsnotify_mkdir(dir, dentry);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4125  	return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4126  }
4d359507346a15 Al Viro               2014-03-14  4127  EXPORT_SYMBOL(vfs_mkdir);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4128  

:::::: The code at line 4103 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
