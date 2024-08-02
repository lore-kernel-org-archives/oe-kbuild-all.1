Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1F7F6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Aug 2024 01:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722560519; cv=none; b=TWLn1giUojMd8HAH5W3QJ+8acbWkHCIHfE0hqUVKWP2XlMo6KoHEnhGBVac9/WyodEAzDuTnSuUr4LMGajyYIX7Rt16lGChZT12aktzChRhIr35VfNqBCqL82dfP73LxYxScqTg/UoUcRr9LWLBTYeAVu7/3fhzSRhrbySCHivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722560519; c=relaxed/simple;
	bh=E0vNuHxR6puMm6Bcu/5zY2j+vWTkfwjPinlrZcpBSWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uSMrrKmgMTR9DbPbDQZCRiN0iE+G7e+t6bHg85K1PfgreRKYmFIlE5TCQs8eBCj3hVmhhp5puOHwjsUQbpg6L7O70tH4U0qvCfOLZTY92347pHnAXB83ML7n4S7Yuz9duKdK08hqErNfmyCiSAOQonPYJHMY8TSR/hVirBjxe30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kzi7Px0p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kzi7Px0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722560518; x=1754096518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0vNuHxR6puMm6Bcu/5zY2j+vWTkfwjPinlrZcpBSWI=;
  b=Kzi7Px0paIA9BhmiEv+xzp39hx37HxhJqGG2XEI5fKX0FL6cYDJf5HvQ
   h8px7V6EqvSppAj7H0uxlhL6Mws6EV/MwUawC1M2tbf2G8R0heFR9RIs0
   es44+zxPyWPqWw7wh0W8BRcFE6Jc0g4F6me9TEhdsw8iQwFcbmecPjgRD
   2n+OMhmIM7ON2CKQdHJYgPrTFYgekfpUeZJoJkokhv34STwGkBQGOcafy
   6RM15pIWkg4z7e+VI/tMoeda5Q/0xQQtqZbMe7Q0Ua1Ps9M/AWZxZQNrl
   GB4ujZF0rUD5WVw28Wbj842WiiFsX0w5Js61Hiz7INZe+qioWw7BaNrdL
   Q==;
X-CSE-ConnectionGUID: nf0tSkVzS5W9pWvXPdwQCA==
X-CSE-MsgGUID: kWSFQbUqTamO+zpzwc5rgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20445090"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20445090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 18:01:57 -0700
X-CSE-ConnectionGUID: iYBhsm+ORFWsZ1g/+/iYvw==
X-CSE-MsgGUID: arwb6gXeQlSn9ia5w0P8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="60254363"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 18:01:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZgg5-000wBY-1B;
	Fri, 02 Aug 2024 01:01:53 +0000
Date: Fri, 2 Aug 2024 09:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 28/30] fs/namei.c:3192:38: error:
 'LEASE_BREAK_DIR_CREATE' undeclared
Message-ID: <202408020839.h0nWMhyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   4326b3d364cb1a5f0c4578c9fa19b1ab03de8b0d
commit: 7eb2e245e7a52abba7110b4a8e8a9dc6492338f6 [28/30] fs: add a "reason" parameter to try_break_deleg
config: i386-buildonly-randconfig-004-20240802 (https://download.01.org/0day-ci/archive/20240802/202408020839.h0nWMhyU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020839.h0nWMhyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020839.h0nWMhyU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namei.c: In function '__vfs_create':
>> fs/namei.c:3192:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    3192 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:3192:38: note: each undeclared identifier is reported only once for each function it appears in
   fs/namei.c: In function 'lookup_open':
   fs/namei.c:3509:52: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    3509 |                 error = try_break_deleg(dir_inode, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'open_last_lookups':
   fs/namei.c:3540:16: error: variable 'delegated_inode' has initializer but incomplete type
    3540 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:3540:32: error: storage size of 'delegated_inode' isn't known
    3540 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:3540:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_mknod':
   fs/namei.c:4024:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4024 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_mknodat':
   fs/namei.c:4082:16: error: variable 'delegated_inode' has initializer but incomplete type
    4082 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4082:32: error: storage size of 'delegated_inode' isn't known
    4082 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4082:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_mkdir':
   fs/namei.c:4167:38: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4167 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_mkdirat':
   fs/namei.c:4205:16: error: variable 'delegated_inode' has initializer but incomplete type
    4205 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4205:32: error: storage size of 'delegated_inode' isn't known
    4205 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4205:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function '__vfs_rmdir':
>> fs/namei.c:4266:38: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4266 |         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_rmdir':
   fs/namei.c:4315:16: error: variable 'delegated_inode' has initializer but incomplete type
    4315 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4315:32: error: storage size of 'delegated_inode' isn't known
    4315 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4315:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_unlink':
   fs/namei.c:4422:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4422 |                         error = try_break_deleg(dir, LEASE_BREAK_DIR_DELETE, delegated_inode);
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_unlinkat':
   fs/namei.c:4464:16: error: variable 'delegated_inode' has initializer but incomplete type
    4464 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4464:32: error: storage size of 'delegated_inode' isn't known
    4464 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4464:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_link':
   fs/namei.c:4696:46: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4696 |                 error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_linkat':
   fs/namei.c:4730:16: error: variable 'delegated_inode' has initializer but incomplete type
    4730 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:4730:32: error: storage size of 'delegated_inode' isn't known
    4730 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:4730:32: warning: unused variable 'delegated_inode' [-Wunused-variable]
   fs/namei.c: In function 'vfs_rename':
>> fs/namei.c:4965:54: error: 'LEASE_BREAK_DIR_RENAME' undeclared (first use in this function)
    4965 |                                 old_dir == new_dir ? LEASE_BREAK_DIR_RENAME :
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4966:54: error: 'LEASE_BREAK_DIR_DELETE' undeclared (first use in this function)
    4966 |                                                      LEASE_BREAK_DIR_DELETE,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:4971:50: error: 'LEASE_BREAK_DIR_CREATE' undeclared (first use in this function)
    4971 |                 error = try_break_deleg(new_dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c: In function 'do_renameat2':
   fs/namei.c:5033:16: error: variable 'delegated_inode' has initializer but incomplete type
    5033 |         struct delegated_inode delegated_inode = { };
         |                ^~~~~~~~~~~~~~~
   fs/namei.c:5033:32: error: storage size of 'delegated_inode' isn't known
    5033 |         struct delegated_inode delegated_inode = { };
         |                                ^~~~~~~~~~~~~~~
   fs/namei.c:5033:32: warning: unused variable 'delegated_inode' [-Wunused-variable]


vim +/LEASE_BREAK_DIR_CREATE +3192 fs/namei.c

  3174	
  3175	static int __vfs_create(struct mnt_idmap *idmap, struct inode *dir,
  3176				struct dentry *dentry, umode_t mode, bool want_excl,
  3177				struct delegated_inode *delegated_inode)
  3178	{
  3179		int error;
  3180	
  3181		error = may_create(idmap, dir, dentry);
  3182		if (error)
  3183			return error;
  3184	
  3185		if (!dir->i_op->create)
  3186			return -EACCES;	/* shouldn't it be ENOSYS? */
  3187	
  3188		mode = vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  3189		error = security_inode_create(dir, dentry, mode);
  3190		if (error)
  3191			return error;
> 3192		error = try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, delegated_inode);
  3193		if (error)
  3194			return error;
  3195		error = dir->i_op->create(idmap, dir, dentry, mode, want_excl);
  3196		if (!error)
  3197			fsnotify_create(dir, dentry);
  3198		return error;
  3199	}
  3200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
