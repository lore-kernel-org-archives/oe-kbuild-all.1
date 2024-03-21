Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74657329
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711022210; cv=none; b=RFO1teGBH2cYkRnki/SQjpm0QxWQAY4CffSObqcJyUtFnPIHqPya4xhbmuTC5R8C0iGUYLdZvEhiWJqgktssqdhCbWsojc4+IVyylriWynLHfbqUNFLvvFNjLqkXBzHD8xZhriAe8KfV3ubD2hsS+34LLRTKYZiz0Q4ITAAhUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711022210; c=relaxed/simple;
	bh=F4caeA4eOy7XGs5qQcj8ZWa2xuWvY4EIf/VkJY0Jwig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYyZV+3Hx++4uPsTX7UEMjxrCK/9Hru4Ts6PW/GwgzK8QcLSK++uH8VFIqLSAOb6S8yVzC2FQ5/uRkc4BxvQ0Ehx7ZoWuxvLGG7Zd2BqrDe44IE2ARyQMGKUQvnKOxEY+j5VPs3IApzIEoEPkZ9npcCJPpukCS9Lq/Gsmko3Xvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jxkt/mKn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jxkt/mKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711022208; x=1742558208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4caeA4eOy7XGs5qQcj8ZWa2xuWvY4EIf/VkJY0Jwig=;
  b=Jxkt/mKnXxcfkjZM5or16TTSe3zwqm10kqMCtvR0QTj9tePgWrYvCjlr
   nD82iXVFfgQl1RpCxVpSl0MzUstYYCYvWsW2BR98nG4bVWaG5gXCdbTkz
   kk96p8byBlNRjMF0cVz7oh9RGFhikmfv/46vTSVB+8glZZ5wHtIVwgXbE
   RE1RRsyhPGCynjizwUd/ylhc3qo87oAfDcWLN7RQRpam39rDMaIPXNZz1
   EqTBnn3SS8oVLZRlq63FvQzXl4SEbCq7pfp8k+Un6fz0pZ0SIrm9HQmHp
   MJ/uXpwhURV27Vdrfp7NWQ4m8o+k7CD6PmKsT+sEgfoOhklDB6NvW4b/h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16644698"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="16644698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14483940"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2024 04:56:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnH2I-000JOT-2D;
	Thu, 21 Mar 2024 11:56:42 +0000
Date: Thu, 21 Mar 2024 19:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 10/25] fs/namei.c:3186: warning: Function
 parameter or struct member 'delegated_inode' not described in '__vfs_create'
Message-ID: <202403211918.0qZK3cDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   e0c71c86a9144cb35fc55a869a5f79dbbce1e04c
commit: 843fc69a26e1aa01e6e669512919306fcc9ae1e7 [10/25] vfs: make vfs_create break delegations on parent directory
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240321/202403211918.0qZK3cDs-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211918.0qZK3cDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211918.0qZK3cDs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namei.c:3186: warning: Function parameter or struct member 'delegated_inode' not described in '__vfs_create'
>> fs/namei.c:3186: warning: expecting prototype for vfs_create(). Prototype was for __vfs_create() instead


vim +3186 fs/namei.c

1639a49ccdce58 Yang Xu               2022-07-14  3166  
6521f891708292 Christian Brauner     2021-01-21  3167  /**
6521f891708292 Christian Brauner     2021-01-21  3168   * vfs_create - create new file
abf08576afe315 Christian Brauner     2023-01-13  3169   * @idmap:	idmap of the mount the inode was found from
6521f891708292 Christian Brauner     2021-01-21  3170   * @dir:	inode of @dentry
6521f891708292 Christian Brauner     2021-01-21  3171   * @dentry:	pointer to dentry of the base directory
6521f891708292 Christian Brauner     2021-01-21  3172   * @mode:	mode of the new file
6521f891708292 Christian Brauner     2021-01-21  3173   * @want_excl:	whether the file must not yet exist
6521f891708292 Christian Brauner     2021-01-21  3174   *
6521f891708292 Christian Brauner     2021-01-21  3175   * Create a new file.
6521f891708292 Christian Brauner     2021-01-21  3176   *
abf08576afe315 Christian Brauner     2023-01-13  3177   * If the inode has been found through an idmapped mount the idmap of
abf08576afe315 Christian Brauner     2023-01-13  3178   * the vfsmount must be passed through @idmap. This function will then take
abf08576afe315 Christian Brauner     2023-01-13  3179   * care to map the inode according to @idmap before checking permissions.
6521f891708292 Christian Brauner     2021-01-21  3180   * On non-idmapped mounts or if permission checking is to be performed on the
376870aa234439 Alexander Mikhalitsyn 2023-12-15  3181   * raw inode simply pass @nop_mnt_idmap.
6521f891708292 Christian Brauner     2021-01-21  3182   */
843fc69a26e1aa Jeff Layton           2024-02-13  3183  static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
843fc69a26e1aa Jeff Layton           2024-02-13  3184  			struct dentry *dentry, umode_t mode, bool want_excl,
843fc69a26e1aa Jeff Layton           2024-02-13  3185  			struct inode **delegated_inode)
^1da177e4c3f41 Linus Torvalds        2005-04-16 @3186  {
abf08576afe315 Christian Brauner     2023-01-13  3187  	int error;
abf08576afe315 Christian Brauner     2023-01-13  3188  
4609e1f18e19c3 Christian Brauner     2023-01-13  3189  	error = may_create(idmap, dir, dentry);
^1da177e4c3f41 Linus Torvalds        2005-04-16  3190  	if (error)
^1da177e4c3f41 Linus Torvalds        2005-04-16  3191  		return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  3192  
acfa4380efe77e Al Viro               2008-12-04  3193  	if (!dir->i_op->create)
^1da177e4c3f41 Linus Torvalds        2005-04-16  3194  		return -EACCES;	/* shouldn't it be ENOSYS? */
1639a49ccdce58 Yang Xu               2022-07-14  3195  
9452e93e6dae86 Christian Brauner     2023-01-13  3196  	mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
^1da177e4c3f41 Linus Torvalds        2005-04-16  3197  	error = security_inode_create(dir, dentry, mode);
843fc69a26e1aa Jeff Layton           2024-02-13  3198  	if (error)
843fc69a26e1aa Jeff Layton           2024-02-13  3199  		return error;
843fc69a26e1aa Jeff Layton           2024-02-13  3200  	error = try_break_deleg(dir, delegated_inode);
^1da177e4c3f41 Linus Torvalds        2005-04-16  3201  	if (error)
^1da177e4c3f41 Linus Torvalds        2005-04-16  3202  		return error;
6c960e68aaed33 Christian Brauner     2023-01-13  3203  	error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
a74574aafea3a6 Stephen Smalley       2005-09-09  3204  	if (!error)
f38aa94224c551 Amy Griffis           2005-11-03  3205  		fsnotify_create(dir, dentry);
^1da177e4c3f41 Linus Torvalds        2005-04-16  3206  	return error;
^1da177e4c3f41 Linus Torvalds        2005-04-16  3207  }
843fc69a26e1aa Jeff Layton           2024-02-13  3208  

:::::: The code at line 3186 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
