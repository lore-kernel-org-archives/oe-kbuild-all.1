Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA60733985
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jun 2026 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782042647; cv=none; b=NLRaM8kfPLnTIoxsxrTa+xqn/MKUL5LQaIeheGrcHAI7x6HiBanH5EGic6qhJjgWoA998EO0FAbSxv281RzdzpSG1c5jt3yNbUw/XRZHSIbi7NBEfkWccalt4Eo0yGAtlVJHW6Unb2jDRdpbmRYDuVpfbSTYNrCPxSoVHFCzhVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782042647; c=relaxed/simple;
	bh=yawy/BVNC7LOVht1J94dadiJzoGxWtpEjWU5JFwevx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsTn29V+qMu+oHKMXieWJvVCWtfjqdHRsyFAw/u4il1FkckTt64TbdbAD0qZ1Hv5hTq9P3gcwWVT9oIo4CRewZe8annXwEqCVGyK4CSGIBQH1s5OfucDJNYlkr9V85xDrTQ3Y1u0L/cLIDrkW0dbmD7D+dANdb9duNhm/Zu21SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAft0eUp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAft0eUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782042645; x=1813578645;
  h=date:from:to:cc:subject:message-id;
  bh=yawy/BVNC7LOVht1J94dadiJzoGxWtpEjWU5JFwevx4=;
  b=IAft0eUpDwi7DIrjQjJ6DZTdqrZmdpdUNlvEm7NFBeD1wF5zo2rbPAqU
   0KptTdDyO7x0MgF6VPiQ+wBay7/0YldU9YnfcF+1hw9+qaY42qNS2GHfg
   30sEfQZNGK7fFsRpJ3lKlgSTxDkjCRUAzddHmejIMsC2a+L3QopMh2srb
   SdsFTfepMqAo/TWdnnQypdd0zgR8CGkXDiTVIIlwgf34eGLftKneRYYBU
   m1/zm2I73EQ8hovsl8mli6YXgBs8SeuthK6xHUbG4WKjkO9hMjGVwN+et
   vi7z7e1JxYo0LYHihHlD2gqOn9nwsqKWu/K7NRrTq41RfAUSr3qga2+/8
   Q==;
X-CSE-ConnectionGUID: vj9EfRxFRH6LaQNAXsKCzg==
X-CSE-MsgGUID: ALgaWVW5RnynHZIuvaBjCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="85351373"
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="85351373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 04:50:44 -0700
X-CSE-ConnectionGUID: +hh6sVipSje8WYgXtFI+qw==
X-CSE-MsgGUID: 4ohqtiXFSuqD+eqmqXTtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,216,1774335600"; 
   d="scan'208";a="253331938"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Jun 2026 04:50:42 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbGhE-000000005s9-1XCW;
	Sun, 21 Jun 2026 11:50:40 +0000
Date: Sun, 21 Jun 2026 13:50:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 243/243]
 ./include/linux/lsm_hook_defs.h:161:18: warning: 'file_ioctl_compat_default'
 defined but not used
Message-ID: <202606211316.To5Ag8Sb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   eb5d658c1d70b40496a055ae77344de5bbcb233a
commit: d430e298549b31a8607879fdb061c211fb9bbc4a [243/243] scripts: kernel-doc: Fix syntax error due to undeclared args variable
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260621/202606211316.To5Ag8Sb-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260621/202606211316.To5Ag8Sb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606211316.To5Ag8Sb-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:176:1: note: in expansion of macro 'LSM_HOOK'
     176 | LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:175:18: warning: 'file_open_default' defined but not used [-Wunused-const-variable=]
     175 | LSM_HOOK(int, 0, file_open, struct file *file)
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:175:1: note: in expansion of macro 'LSM_HOOK'
     175 | LSM_HOOK(int, 0, file_open, struct file *file)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:174:18: warning: 'file_receive_default' defined but not used [-Wunused-const-variable=]
     174 | LSM_HOOK(int, 0, file_receive, struct file *file)
         |                  ^~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:174:1: note: in expansion of macro 'LSM_HOOK'
     174 | LSM_HOOK(int, 0, file_receive, struct file *file)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:172:18: warning: 'file_send_sigiotask_default' defined but not used [-Wunused-const-variable=]
     172 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:172:1: note: in expansion of macro 'LSM_HOOK'
     172 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:169:18: warning: 'file_fcntl_default' defined but not used [-Wunused-const-variable=]
     169 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:169:1: note: in expansion of macro 'LSM_HOOK'
     169 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:168:18: warning: 'file_lock_default' defined but not used [-Wunused-const-variable=]
     168 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:168:1: note: in expansion of macro 'LSM_HOOK'
     168 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:166:18: warning: 'file_mprotect_default' defined but not used [-Wunused-const-variable=]
     166 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         |                  ^~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:166:1: note: in expansion of macro 'LSM_HOOK'
     166 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:164:18: warning: 'mmap_file_default' defined but not used [-Wunused-const-variable=]
     164 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:164:1: note: in expansion of macro 'LSM_HOOK'
     164 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:163:18: warning: 'mmap_addr_default' defined but not used [-Wunused-const-variable=]
     163 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         |                  ^~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:163:1: note: in expansion of macro 'LSM_HOOK'
     163 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         | ^~~~~~~~
>> ./include/linux/lsm_hook_defs.h:161:18: warning: 'file_ioctl_compat_default' defined but not used [-Wunused-const-variable=]
     161 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:161:1: note: in expansion of macro 'LSM_HOOK'
     161 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:159:18: warning: 'file_ioctl_default' defined but not used [-Wunused-const-variable=]
     159 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:159:1: note: in expansion of macro 'LSM_HOOK'
     159 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:157:18: warning: 'file_alloc_security_default' defined but not used [-Wunused-const-variable=]
     157 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:157:1: note: in expansion of macro 'LSM_HOOK'
     157 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:156:18: warning: 'file_permission_default' defined but not used [-Wunused-const-variable=]
     156 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:156:1: note: in expansion of macro 'LSM_HOOK'
     156 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:154:18: warning: 'kernfs_init_security_default' defined but not used [-Wunused-const-variable=]
     154 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:154:1: note: in expansion of macro 'LSM_HOOK'
     154 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:152:18: warning: 'inode_copy_up_default' defined but not used [-Wunused-const-variable=]
     152 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         |                  ^~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:152:1: note: in expansion of macro 'LSM_HOOK'
     152 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:149:18: warning: 'inode_listsecurity_default' defined but not used [-Wunused-const-variable=]
     149 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         |                  ^~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:149:1: note: in expansion of macro 'LSM_HOOK'
     149 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:144:18: warning: 'inode_killpriv_default' defined but not used [-Wunused-const-variable=]
     144 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:689:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     689 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:144:1: note: in expansion of macro 'LSM_HOOK'
     144 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:143:18: warning: 'inode_need_killpriv_default' defined but not used [-Wunused-const-variable=]
     143 | LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:684:32: note: in definition of macro 'LSM_RET_DEFAULT'
     684 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/file_ioctl_compat_default +161 ./include/linux/lsm_hook_defs.h

98e828a0650f34 KP Singh          2020-03-29  107  
98e828a0650f34 KP Singh          2020-03-29  108  /* Needed for inode based security check */
98e828a0650f34 KP Singh          2020-03-29  109  LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
98e828a0650f34 KP Singh          2020-03-29  110  	 unsigned int obj_type)
98e828a0650f34 KP Singh          2020-03-29  111  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
98e828a0650f34 KP Singh          2020-03-29  112  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
98e828a0650f34 KP Singh          2020-03-29  113  LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
98e828a0650f34 KP Singh          2020-03-29  114  	 struct inode *dir, const struct qstr *qstr, const char **name,
98e828a0650f34 KP Singh          2020-03-29  115  	 void **value, size_t *len)
98e828a0650f34 KP Singh          2020-03-29  116  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
98e828a0650f34 KP Singh          2020-03-29  117  	 umode_t mode)
98e828a0650f34 KP Singh          2020-03-29  118  LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
98e828a0650f34 KP Singh          2020-03-29  119  	 struct dentry *new_dentry)
98e828a0650f34 KP Singh          2020-03-29  120  LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
98e828a0650f34 KP Singh          2020-03-29  121  LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
98e828a0650f34 KP Singh          2020-03-29  122  	 const char *old_name)
98e828a0650f34 KP Singh          2020-03-29  123  LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
98e828a0650f34 KP Singh          2020-03-29  124  	 umode_t mode)
98e828a0650f34 KP Singh          2020-03-29  125  LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
98e828a0650f34 KP Singh          2020-03-29  126  LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
98e828a0650f34 KP Singh          2020-03-29  127  	 umode_t mode, dev_t dev)
98e828a0650f34 KP Singh          2020-03-29  128  LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
98e828a0650f34 KP Singh          2020-03-29  129  	 struct inode *new_dir, struct dentry *new_dentry)
98e828a0650f34 KP Singh          2020-03-29  130  LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
98e828a0650f34 KP Singh          2020-03-29  131  LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
98e828a0650f34 KP Singh          2020-03-29  132  	 bool rcu)
98e828a0650f34 KP Singh          2020-03-29  133  LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
98e828a0650f34 KP Singh          2020-03-29  134  LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
98e828a0650f34 KP Singh          2020-03-29  135  LSM_HOOK(int, 0, inode_getattr, const struct path *path)
98e828a0650f34 KP Singh          2020-03-29  136  LSM_HOOK(int, 0, inode_setxattr, struct dentry *dentry, const char *name,
98e828a0650f34 KP Singh          2020-03-29  137  	 const void *value, size_t size, int flags)
98e828a0650f34 KP Singh          2020-03-29  138  LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
98e828a0650f34 KP Singh          2020-03-29  139  	 const char *name, const void *value, size_t size, int flags)
98e828a0650f34 KP Singh          2020-03-29  140  LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
98e828a0650f34 KP Singh          2020-03-29  141  LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
98e828a0650f34 KP Singh          2020-03-29  142  LSM_HOOK(int, 0, inode_removexattr, struct dentry *dentry, const char *name)
98e828a0650f34 KP Singh          2020-03-29  143  LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
98e828a0650f34 KP Singh          2020-03-29  144  LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
98e828a0650f34 KP Singh          2020-03-29  145  LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct inode *inode,
98e828a0650f34 KP Singh          2020-03-29  146  	 const char *name, void **buffer, bool alloc)
98e828a0650f34 KP Singh          2020-03-29  147  LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
98e828a0650f34 KP Singh          2020-03-29  148  	 const char *name, const void *value, size_t size, int flags)
98e828a0650f34 KP Singh          2020-03-29  149  LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
98e828a0650f34 KP Singh          2020-03-29  150  	 size_t buffer_size)
98e828a0650f34 KP Singh          2020-03-29  151  LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
98e828a0650f34 KP Singh          2020-03-29  152  LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
23e390cdbe6f85 KP Singh          2020-06-22  153  LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
98e828a0650f34 KP Singh          2020-03-29  154  LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
98e828a0650f34 KP Singh          2020-03-29  155  	 struct kernfs_node *kn)
98e828a0650f34 KP Singh          2020-03-29  156  LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
98e828a0650f34 KP Singh          2020-03-29  157  LSM_HOOK(int, 0, file_alloc_security, struct file *file)
98e828a0650f34 KP Singh          2020-03-29  158  LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
98e828a0650f34 KP Singh          2020-03-29  159  LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
98e828a0650f34 KP Singh          2020-03-29  160  	 unsigned long arg)
311dc5afad11aa Alfred Piccioni   2023-12-19 @161  LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
311dc5afad11aa Alfred Piccioni   2023-12-19  162  	 unsigned long arg)
98e828a0650f34 KP Singh          2020-03-29  163  LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
98e828a0650f34 KP Singh          2020-03-29  164  LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
98e828a0650f34 KP Singh          2020-03-29  165  	 unsigned long prot, unsigned long flags)
98e828a0650f34 KP Singh          2020-03-29  166  LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
98e828a0650f34 KP Singh          2020-03-29  167  	 unsigned long reqprot, unsigned long prot)
98e828a0650f34 KP Singh          2020-03-29  168  LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
98e828a0650f34 KP Singh          2020-03-29  169  LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
98e828a0650f34 KP Singh          2020-03-29  170  	 unsigned long arg)
98e828a0650f34 KP Singh          2020-03-29  171  LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
98e828a0650f34 KP Singh          2020-03-29  172  LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
98e828a0650f34 KP Singh          2020-03-29  173  	 struct fown_struct *fown, int sig)
98e828a0650f34 KP Singh          2020-03-29  174  LSM_HOOK(int, 0, file_receive, struct file *file)
98e828a0650f34 KP Singh          2020-03-29  175  LSM_HOOK(int, 0, file_open, struct file *file)
98e828a0650f34 KP Singh          2020-03-29  176  LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
98e828a0650f34 KP Singh          2020-03-29  177  	 unsigned long clone_flags)
98e828a0650f34 KP Singh          2020-03-29  178  LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
98e828a0650f34 KP Singh          2020-03-29  179  LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
98e828a0650f34 KP Singh          2020-03-29  180  LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
98e828a0650f34 KP Singh          2020-03-29  181  LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
98e828a0650f34 KP Singh          2020-03-29  182  	 gfp_t gfp)
98e828a0650f34 KP Singh          2020-03-29  183  LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
98e828a0650f34 KP Singh          2020-03-29  184  	 const struct cred *old)
98e828a0650f34 KP Singh          2020-03-29  185  LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
98e828a0650f34 KP Singh          2020-03-29  186  LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
98e828a0650f34 KP Singh          2020-03-29  187  LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
98e828a0650f34 KP Singh          2020-03-29  188  LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
b64fcae74b6d69 Kees Cook         2020-10-02  189  LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
b64fcae74b6d69 Kees Cook         2020-10-02  190  LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
200da27ab32d89 Nathan Chancellor 2020-10-06  191  	 enum kernel_load_data_id id, char *description)
98e828a0650f34 KP Singh          2020-03-29  192  LSM_HOOK(int, 0, kernel_read_file, struct file *file,
2039bda1fa8dad Kees Cook         2020-10-02  193  	 enum kernel_read_file_id id, bool contents)
98e828a0650f34 KP Singh          2020-03-29  194  LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
98e828a0650f34 KP Singh          2020-03-29  195  	 loff_t size, enum kernel_read_file_id id)
98e828a0650f34 KP Singh          2020-03-29  196  LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
98e828a0650f34 KP Singh          2020-03-29  197  	 int flags)
39030e1351aa1a Thomas Cedeno     2020-06-09  198  LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
39030e1351aa1a Thomas Cedeno     2020-06-09  199  	 int flags)
98e828a0650f34 KP Singh          2020-03-29  200  LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
98e828a0650f34 KP Singh          2020-03-29  201  LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
98e828a0650f34 KP Singh          2020-03-29  202  LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
98e828a0650f34 KP Singh          2020-03-29  203  LSM_HOOK(void, LSM_RET_VOID, task_getsecid, struct task_struct *p, u32 *secid)
98e828a0650f34 KP Singh          2020-03-29  204  LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
98e828a0650f34 KP Singh          2020-03-29  205  LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
98e828a0650f34 KP Singh          2020-03-29  206  LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
98e828a0650f34 KP Singh          2020-03-29  207  LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
98e828a0650f34 KP Singh          2020-03-29  208  	 const struct cred *tcred, unsigned int flags)
98e828a0650f34 KP Singh          2020-03-29  209  LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
98e828a0650f34 KP Singh          2020-03-29  210  	 struct rlimit *new_rlim)
98e828a0650f34 KP Singh          2020-03-29  211  LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
98e828a0650f34 KP Singh          2020-03-29  212  LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
98e828a0650f34 KP Singh          2020-03-29  213  LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
98e828a0650f34 KP Singh          2020-03-29  214  LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
98e828a0650f34 KP Singh          2020-03-29  215  	 int sig, const struct cred *cred)
98e828a0650f34 KP Singh          2020-03-29  216  LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
98e828a0650f34 KP Singh          2020-03-29  217  	 unsigned long arg3, unsigned long arg4, unsigned long arg5)
98e828a0650f34 KP Singh          2020-03-29  218  LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
98e828a0650f34 KP Singh          2020-03-29  219  	 struct inode *inode)
98e828a0650f34 KP Singh          2020-03-29  220  LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
98e828a0650f34 KP Singh          2020-03-29  221  LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
98e828a0650f34 KP Singh          2020-03-29  222  	 u32 *secid)
98e828a0650f34 KP Singh          2020-03-29  223  LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
98e828a0650f34 KP Singh          2020-03-29  224  LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
98e828a0650f34 KP Singh          2020-03-29  225  LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
98e828a0650f34 KP Singh          2020-03-29  226  LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
98e828a0650f34 KP Singh          2020-03-29  227  	 struct kern_ipc_perm *perm)
98e828a0650f34 KP Singh          2020-03-29  228  LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
98e828a0650f34 KP Singh          2020-03-29  229  LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
98e828a0650f34 KP Singh          2020-03-29  230  LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
98e828a0650f34 KP Singh          2020-03-29  231  	 struct msg_msg *msg, int msqflg)
98e828a0650f34 KP Singh          2020-03-29  232  LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
98e828a0650f34 KP Singh          2020-03-29  233  	 struct msg_msg *msg, struct task_struct *target, long type, int mode)
98e828a0650f34 KP Singh          2020-03-29  234  LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
98e828a0650f34 KP Singh          2020-03-29  235  LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
98e828a0650f34 KP Singh          2020-03-29  236  LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
98e828a0650f34 KP Singh          2020-03-29  237  LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
98e828a0650f34 KP Singh          2020-03-29  238  LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
98e828a0650f34 KP Singh          2020-03-29  239  	 int shmflg)
98e828a0650f34 KP Singh          2020-03-29  240  LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
98e828a0650f34 KP Singh          2020-03-29  241  LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
98e828a0650f34 KP Singh          2020-03-29  242  LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
98e828a0650f34 KP Singh          2020-03-29  243  LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
98e828a0650f34 KP Singh          2020-03-29  244  LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
98e828a0650f34 KP Singh          2020-03-29  245  	 unsigned nsops, int alter)
98e828a0650f34 KP Singh          2020-03-29  246  LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
98e828a0650f34 KP Singh          2020-03-29  247  LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
98e828a0650f34 KP Singh          2020-03-29  248  	 struct inode *inode)
98e828a0650f34 KP Singh          2020-03-29  249  LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, char *name,
98e828a0650f34 KP Singh          2020-03-29  250  	 char **value)
98e828a0650f34 KP Singh          2020-03-29  251  LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
98e828a0650f34 KP Singh          2020-03-29  252  LSM_HOOK(int, 0, ismaclabel, const char *name)
625236ba3832ae Anders Roxell     2020-05-12  253  LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
98e828a0650f34 KP Singh          2020-03-29  254  	 u32 *seclen)
98e828a0650f34 KP Singh          2020-03-29  255  LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
98e828a0650f34 KP Singh          2020-03-29  256  LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
98e828a0650f34 KP Singh          2020-03-29  257  LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
98e828a0650f34 KP Singh          2020-03-29  258  LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
98e828a0650f34 KP Singh          2020-03-29  259  LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
8e29eebe4c39cb Ondrej Mosnacek   2023-10-31  260  LSM_HOOK(int, -EOPNOTSUPP, inode_getsecctx, struct inode *inode, void **ctx,
98e828a0650f34 KP Singh          2020-03-29  261  	 u32 *ctxlen)
98e828a0650f34 KP Singh          2020-03-29  262  

:::::: The code at line 161 was first introduced by commit
:::::: 311dc5afad11aadb290c6e04cd6b7cf7116ee857 lsm: new security_file_ioctl_compat() hook

:::::: TO: Alfred Piccioni <alpic@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
