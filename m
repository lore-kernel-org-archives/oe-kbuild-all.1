Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894B1A0706
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889578; cv=none; b=a6hTAO5LbiaIRWf6LP6+90yZLPi264rRNL0+9BQ4G7IHeqAza+PF936G6jlpD1cSgOds4cC8s1G8zqmd7B97Jq5gBIVsSoPvipo4LjDsZUD1J0R7oj2WP5O4J9Z7X73HS+TPp9JUUPyy3/hA11+lHFogZOW23+9pr2NBrxn511E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889578; c=relaxed/simple;
	bh=+CzTUG3WkAbXCQdk967hLkDW+oox7WCH/w3D8kh/r/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnF3WgegvoS6BAkduRvDjufUFWrPonFUWTiZP+XamqqAz4SCkgEJcc615BbTSOlaGVgV+vVCkbwqXW9zuiFjQ9gtBtkTEbR/CUjuWsrgVC9ea/1pqLukjJ+oZ/7dUgwEPsQ98G3XvDfUc6hm2kra90ZHeDN4TYfh+VTj1Jc7jwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn4MaA5+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn4MaA5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889576; x=1777425576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CzTUG3WkAbXCQdk967hLkDW+oox7WCH/w3D8kh/r/U=;
  b=Jn4MaA5+EzTyHbG3lvD4k89iGDz3Ofi6yNKwuosm69nQOi+kcZF/3wm4
   RNvFtxr6Fr3NhpnzV3mjCnMoEzfn+KxbIcgj4IQE8DGFyQ1VlaBklSR9k
   /wc0ww2prd3pl27u7/qFWs8gF3aTV3ZdQl8mEhP2qjCrT9SiZr2B19SCK
   8QRVfGi0RgvF8MOgsIhDziQegwdBN3hk9V7ILBO080E7r/ThIgOpXoL+X
   ZMmdMd1Y1EZ5E7NeK0tY74+ynntKplk+aXIvuZewCdPmfQpoHZ/pyTWAO
   ts0Tg0OYmsGMvmrOArBs+cVilVaXG1fBl2cPQwr+brY7mNx1cu/S6jRf8
   A==;
X-CSE-ConnectionGUID: rHmECmyNR0O2q47to0v9dg==
X-CSE-MsgGUID: mL2gt/pNS+iCMEeUf9eUpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72874014"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="72874014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:31 -0700
X-CSE-ConnectionGUID: I9lIpq3NQFWqV/hGdrhtng==
X-CSE-MsgGUID: dWm1QqgeTHqsVpMkG4y3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133581461"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Apr 2025 18:19:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd9-00004m-1M;
	Tue, 29 Apr 2025 01:19:27 +0000
Date: Tue, 29 Apr 2025 05:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 include/linux/lsm_hook_defs.h:161:18: warning: 'file_ioctl_compat_default'
 defined but not used
Message-ID: <202504290542.xpZypfND-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   bbe79bedd1c4dc94668c8e0ae0ce4da6a20733b5
commit: 311dc5afad11aadb290c6e04cd6b7cf7116ee857 [0/1] lsm: new security_file_ioctl_compat() hook
config: i386-buildonly-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290542.xpZypfND-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290542.xpZypfND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290542.xpZypfND-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:176:1: note: in expansion of macro 'LSM_HOOK'
     176 | LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:175:18: warning: 'file_open_default' defined but not used [-Wunused-const-variable=]
     175 | LSM_HOOK(int, 0, file_open, struct file *file)
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:175:1: note: in expansion of macro 'LSM_HOOK'
     175 | LSM_HOOK(int, 0, file_open, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:174:18: warning: 'file_receive_default' defined but not used [-Wunused-const-variable=]
     174 | LSM_HOOK(int, 0, file_receive, struct file *file)
         |                  ^~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:174:1: note: in expansion of macro 'LSM_HOOK'
     174 | LSM_HOOK(int, 0, file_receive, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:172:18: warning: 'file_send_sigiotask_default' defined but not used [-Wunused-const-variable=]
     172 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:172:1: note: in expansion of macro 'LSM_HOOK'
     172 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:169:18: warning: 'file_fcntl_default' defined but not used [-Wunused-const-variable=]
     169 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:169:1: note: in expansion of macro 'LSM_HOOK'
     169 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:168:18: warning: 'file_lock_default' defined but not used [-Wunused-const-variable=]
     168 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:168:1: note: in expansion of macro 'LSM_HOOK'
     168 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:166:18: warning: 'file_mprotect_default' defined but not used [-Wunused-const-variable=]
     166 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         |                  ^~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:166:1: note: in expansion of macro 'LSM_HOOK'
     166 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:164:18: warning: 'mmap_file_default' defined but not used [-Wunused-const-variable=]
     164 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:164:1: note: in expansion of macro 'LSM_HOOK'
     164 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:163:18: warning: 'mmap_addr_default' defined but not used [-Wunused-const-variable=]
     163 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:163:1: note: in expansion of macro 'LSM_HOOK'
     163 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         | ^~~~~~~~
>> include/linux/lsm_hook_defs.h:161:18: warning: 'file_ioctl_compat_default' defined but not used [-Wunused-const-variable=]
     161 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:161:1: note: in expansion of macro 'LSM_HOOK'
     161 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:159:18: warning: 'file_ioctl_default' defined but not used [-Wunused-const-variable=]
     159 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:159:1: note: in expansion of macro 'LSM_HOOK'
     159 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:157:18: warning: 'file_alloc_security_default' defined but not used [-Wunused-const-variable=]
     157 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:157:1: note: in expansion of macro 'LSM_HOOK'
     157 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:156:18: warning: 'file_permission_default' defined but not used [-Wunused-const-variable=]
     156 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:156:1: note: in expansion of macro 'LSM_HOOK'
     156 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:154:18: warning: 'kernfs_init_security_default' defined but not used [-Wunused-const-variable=]
     154 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:154:1: note: in expansion of macro 'LSM_HOOK'
     154 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:152:18: warning: 'inode_copy_up_default' defined but not used [-Wunused-const-variable=]
     152 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         |                  ^~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:152:1: note: in expansion of macro 'LSM_HOOK'
     152 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:149:18: warning: 'inode_listsecurity_default' defined but not used [-Wunused-const-variable=]
     149 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         |                  ^~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:149:1: note: in expansion of macro 'LSM_HOOK'
     149 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:144:18: warning: 'inode_killpriv_default' defined but not used [-Wunused-const-variable=]
     144 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:144:1: note: in expansion of macro 'LSM_HOOK'
     144 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:143:18: warning: 'inode_need_killpriv_default' defined but not used [-Wunused-const-variable=]
     143 | LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/file_ioctl_compat_default +161 include/linux/lsm_hook_defs.h

   107	
   108	/* Needed for inode based security check */
   109	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   110		 unsigned int obj_type)
   111	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   112	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
   113	LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
   114		 struct inode *dir, const struct qstr *qstr, const char **name,
   115		 void **value, size_t *len)
   116	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   117		 umode_t mode)
   118	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   119		 struct dentry *new_dentry)
   120	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   121	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   122		 const char *old_name)
   123	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   124		 umode_t mode)
   125	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   126	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   127		 umode_t mode, dev_t dev)
   128	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   129		 struct inode *new_dir, struct dentry *new_dentry)
   130	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   131	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   132		 bool rcu)
   133	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   134	LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
   135	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   136	LSM_HOOK(int, 0, inode_setxattr, struct dentry *dentry, const char *name,
   137		 const void *value, size_t size, int flags)
   138	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   139		 const char *name, const void *value, size_t size, int flags)
   140	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   141	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   142	LSM_HOOK(int, 0, inode_removexattr, struct dentry *dentry, const char *name)
   143	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   144	LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
   145	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct inode *inode,
   146		 const char *name, void **buffer, bool alloc)
   147	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   148		 const char *name, const void *value, size_t size, int flags)
   149	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   150		 size_t buffer_size)
   151	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   152	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   153	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
   154	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   155		 struct kernfs_node *kn)
   156	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   157	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   158	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   159	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
   160		 unsigned long arg)
 > 161	LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
   162		 unsigned long arg)
   163	LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
   164	LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
   165		 unsigned long prot, unsigned long flags)
   166	LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
   167		 unsigned long reqprot, unsigned long prot)
   168	LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
   169	LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
   170		 unsigned long arg)
   171	LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
   172	LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
   173		 struct fown_struct *fown, int sig)
   174	LSM_HOOK(int, 0, file_receive, struct file *file)
   175	LSM_HOOK(int, 0, file_open, struct file *file)
   176	LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
   177		 unsigned long clone_flags)
   178	LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
   179	LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
   180	LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
   181	LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
   182		 gfp_t gfp)
   183	LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
   184		 const struct cred *old)
   185	LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
   186	LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
   187	LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
   188	LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
   189	LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
   190	LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
   191		 enum kernel_load_data_id id, char *description)
   192	LSM_HOOK(int, 0, kernel_read_file, struct file *file,
   193		 enum kernel_read_file_id id, bool contents)
   194	LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
   195		 loff_t size, enum kernel_read_file_id id)
   196	LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
   197		 int flags)
   198	LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
   199		 int flags)
   200	LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
   201	LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
   202	LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
   203	LSM_HOOK(void, LSM_RET_VOID, task_getsecid, struct task_struct *p, u32 *secid)
   204	LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
   205	LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
   206	LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
   207	LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
   208		 const struct cred *tcred, unsigned int flags)
   209	LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
   210		 struct rlimit *new_rlim)
   211	LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
   212	LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
   213	LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
   214	LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
   215		 int sig, const struct cred *cred)
   216	LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
   217		 unsigned long arg3, unsigned long arg4, unsigned long arg5)
   218	LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
   219		 struct inode *inode)
   220	LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
   221	LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
   222		 u32 *secid)
   223	LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
   224	LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
   225	LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
   226	LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
   227		 struct kern_ipc_perm *perm)
   228	LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
   229	LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
   230	LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
   231		 struct msg_msg *msg, int msqflg)
   232	LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
   233		 struct msg_msg *msg, struct task_struct *target, long type, int mode)
   234	LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
   235	LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
   236	LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
   237	LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
   238	LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
   239		 int shmflg)
   240	LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
   241	LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
   242	LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
   243	LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
   244	LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
   245		 unsigned nsops, int alter)
   246	LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
   247	LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
   248		 struct inode *inode)
   249	LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, char *name,
   250		 char **value)
   251	LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
   252	LSM_HOOK(int, 0, ismaclabel, const char *name)
   253	LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
   254		 u32 *seclen)
   255	LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
   256	LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
   257	LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
   258	LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
   259	LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
   260	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecctx, struct inode *inode, void **ctx,
   261		 u32 *ctxlen)
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
