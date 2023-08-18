Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84D65E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692333722; x=1723869722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0vWuCTjKpwRk3y36MuovfGuZdRusiQLiEHu0CMweIGg=;
  b=MUM/eRMDXENEIXo+kz+cTZagRD+jW8ddyToywHjy/8uPLpG02nuUddcJ
   y0qeQaCVHmWiMVqTKAHAvJCq45M9DyI9xx22tiy0aYUr0PLqbwTRiyXE1
   S4X6xEWlNhoQcfokw3Hq6vSr471LOv6IohJYpyYfFL0+y9Gl8BIXX38AQ
   0jwvlNTIcM5Je2Mw3yYn1kwMVikdleplGVtlJZnk2tktvXBsqDo2u3t5K
   YxTBCGvjoKiVjgOly4bslSG8H6ajMn4N4TfhcsW41CNuIoX4lX7JjSX9Q
   9XnXfoSd5bDUFPeah7sZrKO709mbYse84nwTBo26YHhxjZQZj26Gy8Xc+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363171550"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="363171550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 21:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800324892"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="800324892"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 21:42:00 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWrJ9-00026Y-2D;
	Fri, 18 Aug 2023 04:41:59 +0000
Date: Fri, 18 Aug 2023 12:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-6.1.y 7106/8698] fs/smb/server/vfs.c:74: warning:
 Function parameter or member 'user_ns' not described in
 'ksmbd_vfs_lock_parent'
Message-ID: <202308181248.FHuQqGoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [7106/8698] smb: move client and server files to common directory fs/smb
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230818/202308181248.FHuQqGoM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181248.FHuQqGoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181248.FHuQqGoM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/vfs.c:74: warning: Function parameter or member 'user_ns' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:74: warning: Function parameter or member 'parent' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:74: warning: Function parameter or member 'child' not described in 'ksmbd_vfs_lock_parent'
   fs/smb/server/vfs.c:366: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_read'
   fs/smb/server/vfs.c:366: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_read'
   fs/smb/server/vfs.c:482: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:482: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_write'
   fs/smb/server/vfs.c:545: warning: Function parameter or member 'path' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Function parameter or member 'stat' not described in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'work' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:545: warning: Excess function parameter 'attrs' description in 'ksmbd_vfs_getattr'
   fs/smb/server/vfs.c:562: warning: Function parameter or member 'p_id' not described in 'ksmbd_vfs_fsync'
   fs/smb/server/vfs.c:585: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_remove_file'
   fs/smb/server/vfs.c:645: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_link'
   fs/smb/server/vfs.c:846: warning: Function parameter or member 'fp' not described in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:846: warning: Excess function parameter 'fid' description in 'ksmbd_vfs_truncate'
   fs/smb/server/vfs.c:887: warning: Excess function parameter 'size' description in 'ksmbd_vfs_listxattr'
>> fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_name' not described in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_value' not described in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Function parameter or member 'attr_size' not described in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Excess function parameter 'name' description in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Excess function parameter 'value' description in 'ksmbd_vfs_setxattr'
>> fs/smb/server/vfs.c:964: warning: Excess function parameter 'size' description in 'ksmbd_vfs_setxattr'
   fs/smb/server/vfs.c:984: warning: Function parameter or member 'option' not described in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:984: warning: Excess function parameter 'options' description in 'ksmbd_vfs_set_fadvise'
   fs/smb/server/vfs.c:1180: warning: Function parameter or member 'um' not described in 'ksmbd_vfs_lookup_in_dir'
>> fs/smb/server/vfs.c:1214: warning: Function parameter or member 'work' not described in 'ksmbd_vfs_kern_path'


vim +74 fs/smb/server/vfs.c

f44158485826c0 fs/cifsd/vfs.c Namjae Jeon       2021-03-16  62  
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  63  /**
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  64   * ksmbd_vfs_lock_parent() - lock parent dentry if it is stable
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  65   *
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  66   * the parent dentry got by dget_parent or @parent could be
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  67   * unstable, we try to lock a parent inode and lookup the
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  68   * child dentry again.
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  69   *
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  70   * the reference count of @parent isn't incremented.
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  71   */
da1e7ada5b6285 fs/ksmbd/vfs.c Christian Brauner 2021-08-23  72  int ksmbd_vfs_lock_parent(struct user_namespace *user_ns, struct dentry *parent,
da1e7ada5b6285 fs/ksmbd/vfs.c Christian Brauner 2021-08-23  73  			  struct dentry *child)
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23 @74  {
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  75  	struct dentry *dentry;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  76  	int ret = 0;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  77  
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  78  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
da1e7ada5b6285 fs/ksmbd/vfs.c Christian Brauner 2021-08-23  79  	dentry = lookup_one(user_ns, child->d_name.name, parent,
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  80  			    child->d_name.len);
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  81  	if (IS_ERR(dentry)) {
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  82  		ret = PTR_ERR(dentry);
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  83  		goto out_err;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  84  	}
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  85  
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  86  	if (dentry != child) {
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  87  		ret = -ESTALE;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  88  		dput(dentry);
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  89  		goto out_err;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  90  	}
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  91  
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  92  	dput(dentry);
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  93  	return 0;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  94  out_err:
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  95  	inode_unlock(d_inode(parent));
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  96  	return ret;
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  97  }
333111a6dc32a2 fs/ksmbd/vfs.c Hyunchul Lee      2021-06-23  98  

:::::: The code at line 74 was first introduced by commit
:::::: 333111a6dc32a2768f581876bdb5ef4231f5084e ksmbd: factor out a ksmbd_vfs_lock_parent helper

:::::: TO: Hyunchul Lee <hyc.lee@gmail.com>
:::::: CC: Namjae Jeon <namjae.jeon@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
