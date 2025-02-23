Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2723B0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 01:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740273372; cv=none; b=stf535GWetwpGMrTNcMlqlYIoYR+8R7cDys84dowTEJiwwEeulWq2eIue3ab2Qv3mu57JeRW8hmVRu7HS6T6WpsQPeFXRJK+0U4IDyfjx09j38wHMpui0ycV1vXrFfochmDQHedjFcpHI/TpCLOwvO4m7+FD4Jb7hG0n+9caoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740273372; c=relaxed/simple;
	bh=nf/v+2J1wCwb/LAC2Rybib0HMAK4pUKNd0rY8i8D3b4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+Wqn/iNmT1l4CmcMVfj9DlYV5ZCYbzfIBibcwHvlCd6SYcOKct9YNGEJHyE8ff8X4VIONKXGePBHozekh7EqjvPSK06UuY+lKLaAquunBJS2JQA1IgKEfuKh2REpnt5xHwtQBJR2tEYvQfNyrD4Kq59Z/tYV3jxWJSu9hUURJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEo5q/OF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEo5q/OF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740273369; x=1771809369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nf/v+2J1wCwb/LAC2Rybib0HMAK4pUKNd0rY8i8D3b4=;
  b=AEo5q/OFpjpb2p7M5RaRdjibshnAraIg4dc9l5U1dTbPbi2AnTl+opp1
   cjUgYeqV5M4yqq2EhLVyWoF4j32/x00SfIDHgIcB+pt4Ppw7SUzSlwXu6
   gIZ9jlIO1MLh0qT7qictSLF0TSsovnF5nmsbWsRDV1hJkRhin3O+MMbQl
   847h5nJEo3j9BlPRNKM/oz3cbyb0yePwLhHtuaCpDiEZEWbKQiWCXPsjM
   4Py8K87ojui1EEa2sR7aGs0z73x79ABkPG3aKHOWLf7rHWSUir58jKEbO
   vF93hXN1vgFb39NoM70KEqTCBxYa2UXDb8i7BoNDbVYNjG4OoAYyNvPmS
   A==;
X-CSE-ConnectionGUID: ur3xQA/JS7KIDJsNHJOUvg==
X-CSE-MsgGUID: OPm5YrDlRZOL24gvZPPtsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="44967871"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="44967871"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 17:16:08 -0800
X-CSE-ConnectionGUID: qN+E3J3DQlipDTTmPP972w==
X-CSE-MsgGUID: k3Q0QRahRwC5EI3kO/Rd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115906874"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2025 17:16:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm0bE-00071r-0t;
	Sun, 23 Feb 2025 01:16:04 +0000
Date: Sun, 23 Feb 2025 09:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 include/linux/lsm_hook_defs.h:116:18: warning:
 'inode_init_security_anon_default' defined but not used
Message-ID: <202502230912.2KIztkTz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   1524a5cab607721555e137fa65dd8afa14a3c0e6
commit: 4e8b67477e1948d1c06a2ec6692495813b6a24cb [0/1] UPSTREAM: security: add inode_init_security_anon() LSM hook
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250223/202502230912.2KIztkTz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230912.2KIztkTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230912.2KIztkTz-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:132:1: note: in expansion of macro 'LSM_HOOK'
     132 | LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:130:18: warning: 'inode_rename_default' defined but not used [-Wunused-const-variable=]
     130 | LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
         |                  ^~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:130:1: note: in expansion of macro 'LSM_HOOK'
     130 | LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:128:18: warning: 'inode_mknod_default' defined but not used [-Wunused-const-variable=]
     128 | LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
         |                  ^~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:128:1: note: in expansion of macro 'LSM_HOOK'
     128 | LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:127:18: warning: 'inode_rmdir_default' defined but not used [-Wunused-const-variable=]
     127 | LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
         |                  ^~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:127:1: note: in expansion of macro 'LSM_HOOK'
     127 | LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:125:18: warning: 'inode_mkdir_default' defined but not used [-Wunused-const-variable=]
     125 | LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
         |                  ^~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:125:1: note: in expansion of macro 'LSM_HOOK'
     125 | LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:123:18: warning: 'inode_symlink_default' defined but not used [-Wunused-const-variable=]
     123 | LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
         |                  ^~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:123:1: note: in expansion of macro 'LSM_HOOK'
     123 | LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:122:18: warning: 'inode_unlink_default' defined but not used [-Wunused-const-variable=]
     122 | LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
         |                  ^~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:122:1: note: in expansion of macro 'LSM_HOOK'
     122 | LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:120:18: warning: 'inode_link_default' defined but not used [-Wunused-const-variable=]
     120 | LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
         |                  ^~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:120:1: note: in expansion of macro 'LSM_HOOK'
     120 | LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:118:18: warning: 'inode_create_default' defined but not used [-Wunused-const-variable=]
     118 | LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
         |                  ^~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:118:1: note: in expansion of macro 'LSM_HOOK'
     118 | LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
         | ^~~~~~~~
>> include/linux/lsm_hook_defs.h:116:18: warning: 'inode_init_security_anon_default' defined but not used [-Wunused-const-variable=]
     116 | LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:116:1: note: in expansion of macro 'LSM_HOOK'
     116 | LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:113:18: warning: 'inode_init_security_default' defined but not used [-Wunused-const-variable=]
     113 | LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:113:1: note: in expansion of macro 'LSM_HOOK'
     113 | LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:111:18: warning: 'inode_alloc_security_default' defined but not used [-Wunused-const-variable=]
     111 | LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:111:1: note: in expansion of macro 'LSM_HOOK'
     111 | LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:109:18: warning: 'path_notify_default' defined but not used [-Wunused-const-variable=]
     109 | LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
         |                  ^~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:109:1: note: in expansion of macro 'LSM_HOOK'
     109 | LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:85:18: warning: 'dentry_create_files_as_default' defined but not used [-Wunused-const-variable=]
      85 | LSM_HOOK(int, 0, dentry_create_files_as, struct dentry *dentry, int mode,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:85:1: note: in expansion of macro 'LSM_HOOK'
      85 | LSM_HOOK(int, 0, dentry_create_files_as, struct dentry *dentry, int mode,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:83:18: warning: 'dentry_init_security_default' defined but not used [-Wunused-const-variable=]
      83 | LSM_HOOK(int, 0, dentry_init_security, struct dentry *dentry,
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:83:1: note: in expansion of macro 'LSM_HOOK'
      83 | LSM_HOOK(int, 0, dentry_init_security, struct dentry *dentry,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:81:18: warning: 'move_mount_default' defined but not used [-Wunused-const-variable=]
      81 | LSM_HOOK(int, 0, move_mount, const struct path *from_path,
         |                  ^~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:81:1: note: in expansion of macro 'LSM_HOOK'
      81 | LSM_HOOK(int, 0, move_mount, const struct path *from_path,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:79:18: warning: 'sb_add_mnt_opt_default' defined but not used [-Wunused-const-variable=]
      79 | LSM_HOOK(int, 0, sb_add_mnt_opt, const char *option, const char *val,
         |                  ^~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:653:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     653 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:79:1: note: in expansion of macro 'LSM_HOOK'
      79 | LSM_HOOK(int, 0, sb_add_mnt_opt, const char *option, const char *val,
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:76:18: warning: 'sb_clone_mnt_opts_default' defined but not used [-Wunused-const-variable=]
      76 | LSM_HOOK(int, 0, sb_clone_mnt_opts, const struct super_block *oldsb,
         |                  ^~~~~~~~~~~~~~~~~
   security/security.c:648:32: note: in definition of macro 'LSM_RET_DEFAULT'
     648 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/inode_init_security_anon_default +116 include/linux/lsm_hook_defs.h

   107	
   108	/* Needed for inode based security check */
   109	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   110		 unsigned int obj_type)
   111	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   112	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
   113	LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
   114		 struct inode *dir, const struct qstr *qstr, const char **name,
   115		 void **value, size_t *len)
 > 116	LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
   117		 const struct qstr *name, const struct inode *context_inode)
   118	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   119		 umode_t mode)
   120	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   121		 struct dentry *new_dentry)
   122	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   123	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   124		 const char *old_name)
   125	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   126		 umode_t mode)
   127	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   128	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   129		 umode_t mode, dev_t dev)
   130	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   131		 struct inode *new_dir, struct dentry *new_dentry)
   132	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   133	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   134		 bool rcu)
   135	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   136	LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
   137	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   138	LSM_HOOK(int, 0, inode_setxattr, struct dentry *dentry, const char *name,
   139		 const void *value, size_t size, int flags)
   140	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   141		 const char *name, const void *value, size_t size, int flags)
   142	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   143	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   144	LSM_HOOK(int, 0, inode_removexattr, struct dentry *dentry, const char *name)
   145	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   146	LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
   147	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct inode *inode,
   148		 const char *name, void **buffer, bool alloc)
   149	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   150		 const char *name, const void *value, size_t size, int flags)
   151	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   152		 size_t buffer_size)
   153	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   154	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   155	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
   156	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   157		 struct kernfs_node *kn)
   158	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   159	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   160	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   161	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
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
   260	LSM_HOOK(int, 0, inode_getsecctx, struct inode *inode, void **ctx,
   261		 u32 *ctxlen)
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
