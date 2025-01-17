Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78541F8ADA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116861; cv=none; b=ZFsOSK2NID/o5ffkvvajfmRQAF1ianaR7Efa4PllKQWZSQlGalSN3i6Hq3I6JJF/dvrEJywYIRMOMel+eGfi/age6EqjfKwyzHUhx45NSQBGvKDxLtnsubk8qrNA3xqK5r2KsmwV67bOXU+KYIvPvhHHzY8j0lq9tgIGt3PvNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116861; c=relaxed/simple;
	bh=x0UltjWmBmJfKn0IS4AiO0TYuMWvpLLbIeHQ40U0wIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKycJANIDovilk6RahzNKc9vsPMdpxqBEcfruKy2PvgxjqiBwiYszokHMQCFLGlXshauGR8/ThSNWe3hFnxRVxUb3qjzcdBqoeimHTsZ5p9trBNCeEROL3MMOzjLrBw0HLmYl5LiM89wDbaCCMUfTuZ2dAihHx7lkwXZ+T6LUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8GbzNZ5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8GbzNZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737116859; x=1768652859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0UltjWmBmJfKn0IS4AiO0TYuMWvpLLbIeHQ40U0wIQ=;
  b=c8GbzNZ5fdyfNwBb8Ni2Vag4Ihb4zMmSmEM6f8suCAchwzbHZiDge3Y6
   fy1qcPdQpkW85+LDddXlcCSP/bHjBEBCIq2StfPw8kLJ4sPOoA7Adydk0
   UICobvY+pKbJ5EPVvSPgmhnP+S/NKAnhSyrDFzpZy7wGQimnzMxcQBecU
   Xz/hp2P0QeeKSPujF+oN1F2plV+ssp2os1F5fDF7tLG8n6Rplh5nTw8VL
   nojPDis2utw+64i33C2SWLLbDx5Ch0tKTEwnNnPttLBSUGRTzL9ZJcpVp
   XCTyc1S48PYJdDD93GZEjiYa9vO3ZcExLfVm6bdrnnc2QiZ4QnMl9D25C
   Q==;
X-CSE-ConnectionGUID: 8a0mHx+BQkS4kgkxCaoydA==
X-CSE-MsgGUID: 5QXYy4C8RGSLt0EwgmQAMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="62919505"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="62919505"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 04:27:38 -0800
X-CSE-ConnectionGUID: IHy5c6qNRJuIivBJqclhXw==
X-CSE-MsgGUID: 3DeXe5RYT6WkEPfxt/UJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105584037"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2025 04:27:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYlRm-000TBl-17;
	Fri, 17 Jan 2025 12:27:34 +0000
Date: Fri, 17 Jan 2025 20:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2707/2707] include/linux/lsm_hook_defs.h:162:18:
 warning: 'file_ioctl_compat_default' defined but not used
Message-ID: <202501172051.HxlkrA5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   08e54ea5e4a4948874ca30d91be3e5cca4ecbeec
commit: 294c837d37ed484f656397130bb059ee741a4ca4 [2707/2707] lsm: new security_file_ioctl_compat() hook
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250117/202501172051.HxlkrA5w-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172051.HxlkrA5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172051.HxlkrA5w-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:177:1: note: in expansion of macro 'LSM_HOOK'
     177 | LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:176:18: warning: 'file_open_default' defined but not used [-Wunused-const-variable=]
     176 | LSM_HOOK(int, 0, file_open, struct file *file)
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:176:1: note: in expansion of macro 'LSM_HOOK'
     176 | LSM_HOOK(int, 0, file_open, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:175:18: warning: 'file_receive_default' defined but not used [-Wunused-const-variable=]
     175 | LSM_HOOK(int, 0, file_receive, struct file *file)
         |                  ^~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:175:1: note: in expansion of macro 'LSM_HOOK'
     175 | LSM_HOOK(int, 0, file_receive, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:173:18: warning: 'file_send_sigiotask_default' defined but not used [-Wunused-const-variable=]
     173 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:173:1: note: in expansion of macro 'LSM_HOOK'
     173 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:170:18: warning: 'file_fcntl_default' defined but not used [-Wunused-const-variable=]
     170 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:170:1: note: in expansion of macro 'LSM_HOOK'
     170 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:169:18: warning: 'file_lock_default' defined but not used [-Wunused-const-variable=]
     169 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:169:1: note: in expansion of macro 'LSM_HOOK'
     169 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:167:18: warning: 'file_mprotect_default' defined but not used [-Wunused-const-variable=]
     167 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         |                  ^~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:167:1: note: in expansion of macro 'LSM_HOOK'
     167 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:165:18: warning: 'mmap_file_default' defined but not used [-Wunused-const-variable=]
     165 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:165:1: note: in expansion of macro 'LSM_HOOK'
     165 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:164:18: warning: 'mmap_addr_default' defined but not used [-Wunused-const-variable=]
     164 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:164:1: note: in expansion of macro 'LSM_HOOK'
     164 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         | ^~~~~~~~
>> include/linux/lsm_hook_defs.h:162:18: warning: 'file_ioctl_compat_default' defined but not used [-Wunused-const-variable=]
     162 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:162:1: note: in expansion of macro 'LSM_HOOK'
     162 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:160:18: warning: 'file_ioctl_default' defined but not used [-Wunused-const-variable=]
     160 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:160:1: note: in expansion of macro 'LSM_HOOK'
     160 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:158:18: warning: 'file_alloc_security_default' defined but not used [-Wunused-const-variable=]
     158 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:158:1: note: in expansion of macro 'LSM_HOOK'
     158 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:157:18: warning: 'file_permission_default' defined but not used [-Wunused-const-variable=]
     157 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:157:1: note: in expansion of macro 'LSM_HOOK'
     157 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:155:18: warning: 'kernfs_init_security_default' defined but not used [-Wunused-const-variable=]
     155 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:155:1: note: in expansion of macro 'LSM_HOOK'
     155 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:153:18: warning: 'inode_copy_up_default' defined but not used [-Wunused-const-variable=]
     153 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         |                  ^~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:153:1: note: in expansion of macro 'LSM_HOOK'
     153 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:150:18: warning: 'inode_listsecurity_default' defined but not used [-Wunused-const-variable=]
     150 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         |                  ^~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:150:1: note: in expansion of macro 'LSM_HOOK'
     150 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:145:18: warning: 'inode_killpriv_default' defined but not used [-Wunused-const-variable=]
     145 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:145:1: note: in expansion of macro 'LSM_HOOK'
     145 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:144:18: warning: 'inode_need_killpriv_default' defined but not used [-Wunused-const-variable=]
     144 | LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/file_ioctl_compat_default +162 include/linux/lsm_hook_defs.h

   108	
   109	/* Needed for inode based security check */
   110	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   111		 unsigned int obj_type)
   112	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   113	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
   114	LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
   115		 struct inode *dir, const struct qstr *qstr, const char **name,
   116		 void **value, size_t *len)
   117	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   118		 umode_t mode)
   119	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   120		 struct dentry *new_dentry)
   121	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   122	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   123		 const char *old_name)
   124	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   125		 umode_t mode)
   126	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   127	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   128		 umode_t mode, dev_t dev)
   129	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   130		 struct inode *new_dir, struct dentry *new_dentry)
   131	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   132	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   133		 bool rcu)
   134	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   135	LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
   136	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   137	LSM_HOOK(int, 0, inode_setxattr, struct dentry *dentry, const char *name,
   138		 const void *value, size_t size, int flags)
   139	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   140		 const char *name, const void *value, size_t size, int flags)
   141	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   142	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   143	LSM_HOOK(int, 0, inode_removexattr, struct dentry *dentry, const char *name)
   144	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   145	LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
   146	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct inode *inode,
   147		 const char *name, void **buffer, bool alloc)
   148	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   149		 const char *name, const void *value, size_t size, int flags)
   150	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   151		 size_t buffer_size)
   152	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   153	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   154	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
   155	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   156		 struct kernfs_node *kn)
   157	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   158	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   159	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   160	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
   161		 unsigned long arg)
 > 162	LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
   163		 unsigned long arg)
   164	LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
   165	LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
   166		 unsigned long prot, unsigned long flags)
   167	LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
   168		 unsigned long reqprot, unsigned long prot)
   169	LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
   170	LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
   171		 unsigned long arg)
   172	LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
   173	LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
   174		 struct fown_struct *fown, int sig)
   175	LSM_HOOK(int, 0, file_receive, struct file *file)
   176	LSM_HOOK(int, 0, file_open, struct file *file)
   177	LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
   178		 unsigned long clone_flags)
   179	LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
   180	LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
   181	LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
   182	LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
   183		 gfp_t gfp)
   184	LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
   185		 const struct cred *old)
   186	LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
   187	LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
   188	LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
   189	LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
   190	LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
   191	LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
   192		 enum kernel_load_data_id id, char *description)
   193	LSM_HOOK(int, 0, kernel_read_file, struct file *file,
   194		 enum kernel_read_file_id id, bool contents)
   195	LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
   196		 loff_t size, enum kernel_read_file_id id)
   197	LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
   198		 int flags)
   199	LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
   200		 int flags)
   201	LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
   202	LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
   203	LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
   204	LSM_HOOK(void, LSM_RET_VOID, task_getsecid, struct task_struct *p, u32 *secid)
   205	LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
   206	LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
   207	LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
   208	LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
   209		 const struct cred *tcred, unsigned int flags)
   210	LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
   211		 struct rlimit *new_rlim)
   212	LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
   213	LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
   214	LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
   215	LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
   216		 int sig, const struct cred *cred)
   217	LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
   218		 unsigned long arg3, unsigned long arg4, unsigned long arg5)
   219	LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
   220		 struct inode *inode)
   221	LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
   222	LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
   223		 u32 *secid)
   224	LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
   225	LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
   226	LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
   227	LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
   228		 struct kern_ipc_perm *perm)
   229	LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
   230	LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
   231	LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
   232		 struct msg_msg *msg, int msqflg)
   233	LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
   234		 struct msg_msg *msg, struct task_struct *target, long type, int mode)
   235	LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
   236	LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
   237	LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
   238	LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
   239	LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
   240		 int shmflg)
   241	LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
   242	LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
   243	LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
   244	LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
   245	LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
   246		 unsigned nsops, int alter)
   247	LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
   248	LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
   249		 struct inode *inode)
   250	LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, char *name,
   251		 char **value)
   252	LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
   253	LSM_HOOK(int, 0, ismaclabel, const char *name)
   254	LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
   255		 u32 *seclen)
   256	LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
   257	LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
   258	LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
   259	LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
   260	LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
   261	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecctx, struct inode *inode, void **ctx,
   262		 u32 *ctxlen)
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
