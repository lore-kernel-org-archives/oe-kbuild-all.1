Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115D81A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 00:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBaNg/54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698368334; x=1729904334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5OVZqveSJolz1DbF60vHnDPcy1wZQjWMGBTdXEDreU=;
  b=iBaNg/54vObKJ4yC2GgPkwLLs7xLUZ4Zvn8o2cpDfp3vVu+el25A8ZZM
   oRXKDazxKEmwpyLYWF75tZuJjBmh+P/uiLCl1zDLVBc5gTPzB44ACKmb3
   E30UtX0tgVGEfULPhYauCmwVzX9Y8ZbEZ2US52DjCR5MqXoMVj0fDcJit
   ryg+aZGk9MAdkEsHk4OAZODmsPSkwPln2BaGJyEH/AQvthxjLIP29gHmY
   d565WESEtv+aspIJPcT2z/ur+bHFuifcMRJLhYs47pXa970M49IRPC8CS
   BMvf7+fk6d0KryuANQ0pYYhOZfT78i2Wmu15azy3XqDjfxpo2+a+12vus
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384890129"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="384890129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 17:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="678514"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2023 17:58:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwBBZ-000AHP-32;
	Fri, 27 Oct 2023 00:58:49 +0000
Date: Fri, 27 Oct 2023 08:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 2/7] include/linux/lsm_hook_defs.h:181:18:
 warning: 'file_truncate_default' defined but not used
Message-ID: <202310270812.gWplaWoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   6b7ef2361ea539cfbd527bba80dd58cf502ed7a1
commit: 360934fbfc6d366bd0f35e5858b5fb1a983d586b [2/7] UPSTREAM: security: Create file_truncate hook from path_truncate hook
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270812.gWplaWoN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270812.gWplaWoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270812.gWplaWoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:198:1: note: in expansion of macro 'LSM_HOOK'
     198 | LSM_HOOK(int, 0, kernel_read_file, struct file *file,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:196:18: warning: 'kernel_post_load_data_default' defined but not used [-Wunused-const-variable=]
     196 | LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
         |                  ^~~~~~~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:196:1: note: in expansion of macro 'LSM_HOOK'
     196 | LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:195:18: warning: 'kernel_load_data_default' defined but not used [-Wunused-const-variable=]
     195 | LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:195:1: note: in expansion of macro 'LSM_HOOK'
     195 | LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:194:18: warning: 'kernel_module_request_default' defined but not used [-Wunused-const-variable=]
     194 | LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
         |                  ^~~~~~~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:194:1: note: in expansion of macro 'LSM_HOOK'
     194 | LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:193:18: warning: 'kernel_create_files_as_default' defined but not used [-Wunused-const-variable=]
     193 | LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:193:1: note: in expansion of macro 'LSM_HOOK'
     193 | LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:192:18: warning: 'kernel_act_as_default' defined but not used [-Wunused-const-variable=]
     192 | LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
         |                  ^~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:192:1: note: in expansion of macro 'LSM_HOOK'
     192 | LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:187:18: warning: 'cred_prepare_default' defined but not used [-Wunused-const-variable=]
     187 | LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
         |                  ^~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:187:1: note: in expansion of macro 'LSM_HOOK'
     187 | LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:185:18: warning: 'cred_alloc_blank_default' defined but not used [-Wunused-const-variable=]
     185 | LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:185:1: note: in expansion of macro 'LSM_HOOK'
     185 | LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:182:18: warning: 'task_alloc_default' defined but not used [-Wunused-const-variable=]
     182 | LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
         |                  ^~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:182:1: note: in expansion of macro 'LSM_HOOK'
     182 | LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
         | ^~~~~~~~
>> include/linux/lsm_hook_defs.h:181:18: warning: 'file_truncate_default' defined but not used [-Wunused-const-variable=]
     181 | LSM_HOOK(int, 0, file_truncate, struct file *file)
         |                  ^~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:181:1: note: in expansion of macro 'LSM_HOOK'
     181 | LSM_HOOK(int, 0, file_truncate, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:180:18: warning: 'file_open_default' defined but not used [-Wunused-const-variable=]
     180 | LSM_HOOK(int, 0, file_open, struct file *file)
         |                  ^~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:180:1: note: in expansion of macro 'LSM_HOOK'
     180 | LSM_HOOK(int, 0, file_open, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:179:18: warning: 'file_receive_default' defined but not used [-Wunused-const-variable=]
     179 | LSM_HOOK(int, 0, file_receive, struct file *file)
         |                  ^~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:179:1: note: in expansion of macro 'LSM_HOOK'
     179 | LSM_HOOK(int, 0, file_receive, struct file *file)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:177:18: warning: 'file_send_sigiotask_default' defined but not used [-Wunused-const-variable=]
     177 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:177:1: note: in expansion of macro 'LSM_HOOK'
     177 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:174:18: warning: 'file_fcntl_default' defined but not used [-Wunused-const-variable=]
     174 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:174:1: note: in expansion of macro 'LSM_HOOK'
     174 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:173:18: warning: 'file_lock_default' defined but not used [-Wunused-const-variable=]
     173 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         |                  ^~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:173:1: note: in expansion of macro 'LSM_HOOK'
     173 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:171:18: warning: 'file_mprotect_default' defined but not used [-Wunused-const-variable=]
     171 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         |                  ^~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:171:1: note: in expansion of macro 'LSM_HOOK'
     171 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:169:18: warning: 'mmap_file_default' defined but not used [-Wunused-const-variable=]
     169 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         |                  ^~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:169:1: note: in expansion of macro 'LSM_HOOK'
     169 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:168:18: warning: 'mmap_addr_default' defined but not used [-Wunused-const-variable=]
     168 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         |                  ^~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/file_truncate_default +181 include/linux/lsm_hook_defs.h

   109	
   110	/* Needed for inode based security check */
   111	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   112		 unsigned int obj_type)
   113	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   114	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
   115	LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
   116		 struct inode *dir, const struct qstr *qstr, const char **name,
   117		 void **value, size_t *len)
   118	LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
   119		 const struct qstr *name, const struct inode *context_inode)
   120	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   121		 umode_t mode)
   122	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   123		 struct dentry *new_dentry)
   124	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   125	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   126		 const char *old_name)
   127	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   128		 umode_t mode)
   129	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   130	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   131		 umode_t mode, dev_t dev)
   132	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   133		 struct inode *new_dir, struct dentry *new_dentry)
   134	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   135	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   136		 bool rcu)
   137	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   138	LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
   139	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   140	LSM_HOOK(int, 0, inode_setxattr, struct user_namespace *mnt_userns,
   141		 struct dentry *dentry, const char *name, const void *value,
   142		 size_t size, int flags)
   143	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   144		 const char *name, const void *value, size_t size, int flags)
   145	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   146	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   147	LSM_HOOK(int, 0, inode_removexattr, struct user_namespace *mnt_userns,
   148		 struct dentry *dentry, const char *name)
   149	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   150	LSM_HOOK(int, 0, inode_killpriv, struct user_namespace *mnt_userns,
   151		 struct dentry *dentry)
   152	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct user_namespace *mnt_userns,
   153		 struct inode *inode, const char *name, void **buffer, bool alloc)
   154	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   155		 const char *name, const void *value, size_t size, int flags)
   156	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   157		 size_t buffer_size)
   158	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   159	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   160	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
   161	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   162		 struct kernfs_node *kn)
   163	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   164	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   165	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   166	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
   167		 unsigned long arg)
   168	LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
   169	LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
   170		 unsigned long prot, unsigned long flags)
   171	LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
   172		 unsigned long reqprot, unsigned long prot)
   173	LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
   174	LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
   175		 unsigned long arg)
   176	LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
   177	LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
   178		 struct fown_struct *fown, int sig)
   179	LSM_HOOK(int, 0, file_receive, struct file *file)
   180	LSM_HOOK(int, 0, file_open, struct file *file)
 > 181	LSM_HOOK(int, 0, file_truncate, struct file *file)
 > 182	LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
   183		 unsigned long clone_flags)
   184	LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
   185	LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
   186	LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
   187	LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
   188		 gfp_t gfp)
   189	LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
   190		 const struct cred *old)
   191	LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
   192	LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
   193	LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
   194	LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
   195	LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
   196	LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
   197		 enum kernel_load_data_id id, char *description)
   198	LSM_HOOK(int, 0, kernel_read_file, struct file *file,
   199		 enum kernel_read_file_id id, bool contents)
   200	LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
   201		 loff_t size, enum kernel_read_file_id id)
   202	LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
   203		 int flags)
   204	LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
   205		 int flags)
   206	LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
   207	LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
   208	LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
   209	LSM_HOOK(void, LSM_RET_VOID, task_getsecid_subj,
   210		 struct task_struct *p, u32 *secid)
   211	LSM_HOOK(void, LSM_RET_VOID, task_getsecid_obj,
   212		 struct task_struct *p, u32 *secid)
   213	LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
   214	LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
   215	LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
   216	LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
   217		 const struct cred *tcred, unsigned int flags)
   218	LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
   219		 struct rlimit *new_rlim)
   220	LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
   221	LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
   222	LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
   223	LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
   224		 int sig, const struct cred *cred)
   225	LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
   226		 unsigned long arg3, unsigned long arg4, unsigned long arg5)
   227	LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
   228		 struct inode *inode)
   229	LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
   230	LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
   231		 u32 *secid)
   232	LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
   233	LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
   234	LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
   235	LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
   236		 struct kern_ipc_perm *perm)
   237	LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
   238	LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
   239	LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
   240		 struct msg_msg *msg, int msqflg)
   241	LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
   242		 struct msg_msg *msg, struct task_struct *target, long type, int mode)
   243	LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
   244	LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
   245	LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
   246	LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
   247	LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
   248		 int shmflg)
   249	LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
   250	LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
   251	LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
   252	LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
   253	LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
   254		 unsigned nsops, int alter)
   255	LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
   256	LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
   257		 struct inode *inode)
   258	LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, char *name,
   259		 char **value)
   260	LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
   261	LSM_HOOK(int, 0, ismaclabel, const char *name)
   262	LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
   263		 u32 *seclen)
   264	LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
   265	LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
   266	LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
   267	LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
   268	LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
   269	LSM_HOOK(int, 0, inode_getsecctx, struct inode *inode, void **ctx,
   270		 u32 *ctxlen)
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
