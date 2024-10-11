Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DC804
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728617453; cv=none; b=eYt7kmjRC7uUO/yS7vsJmRziXZYz/JREPLxMaQypCjzInWUjkLaztutQxpudKm6YQNy0oXU5q85I/QowgP3zaKMP4DbtwP7wWu4/XN5C5venRkunP5I7ZALN3GqweIl69eAEpUtbU7x9eJk4cMbrsgVzHP7ad4lPMjqs/MMF3W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728617453; c=relaxed/simple;
	bh=ZAgCO/fDkJlTedW+CGcJSVKizhbUyJ4RSWJReVu0esY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIfL6qMVA8N5xUKthgYEB37L/Z+q4BKSPsDhYHiZQj/lht8lmhwqp6quUMnLdB1zTWz6PatDoBaKxU74po4VU0ztBYM/nlIlu71sKFV/2E+frhwQI+S/OPOgBdjl5jYvCITI1wcUnwvyY6ad5by20ODxLPsghjETKoXPiFhy4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtwKVMk9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtwKVMk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728617451; x=1760153451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAgCO/fDkJlTedW+CGcJSVKizhbUyJ4RSWJReVu0esY=;
  b=EtwKVMk90/JaRaN8AYsZikV9oazxpmrq23IneMEize7G+I8ElX7bZSfy
   oXFAPNRasFuuwf9LZVq07ia/XkopCMIaHoNsLMD3S8fDI9SiO+0jtOrxC
   Zxy2Bl6VuJQCPh1ECUkFaefMrhBseCAxR7Z7pcpWT/gGgZnHIn3Pj18FD
   ac/GE6Ed/FKly/d2fgh68MZyttxWIasKwWozlIsmtB77+4r6zCGnAqGrR
   t87ipAj5YxhFHIlOZeZqK1NX9+0VRNQ72Ul7VGEABm/J8d1sYSEAFE5SM
   tqGyaWLXOk/aD0VAAmGLtSG4aZQfE2txKgdvtoLTMPXsmVT0jZXO4aBRQ
   w==;
X-CSE-ConnectionGUID: EXbdQlfGRLyPttlB+ZBFVQ==
X-CSE-MsgGUID: UryvZ8i9R52f7b6iCVq+sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27457882"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="27457882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 20:30:50 -0700
X-CSE-ConnectionGUID: 1igpZMVoR62Ghstzw15Nxw==
X-CSE-MsgGUID: 3D1Gz38bTpmpNucLZtMbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="77270255"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2024 20:30:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz6MZ-000BgT-0t;
	Fri, 11 Oct 2024 03:30:47 +0000
Date: Fri, 11 Oct 2024 11:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/35] fs/namei.c:3279:38: error:
 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202410111100.2HXQi3Aj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   b91bc932b468b4c460faef8759fbae5a75b2ab5c
commit: 65bf014be263dadeb74c9d0f75333ae09b373f8b [32/35] fs: add a "reason" parameter to try_break_deleg
config: i386-buildonly-randconfig-003-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111100.2HXQi3Aj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111100.2HXQi3Aj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111100.2HXQi3Aj-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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
