Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0313A265
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726042062; cv=none; b=GOEuqbQE+n9Y4L0hNGXVBwNAVxr0d7jkSN9EYlNeBiuZmi/pHeLMChMRZ8ZFOfLW36wdFTvFEymICMj1a3P/tAsh98C8aL4AFEW5t6q7vkA3LV/KXgpkEPqgJMb5ipWNEc9pVLgzwgcTv1qRC5RJ3OHToQuMTDdadTtYrBr1dSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726042062; c=relaxed/simple;
	bh=aPDNkQnVKnVAcrK/Eh4hsgXU1Qt/q6JaxHba5BFYsaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qn3K4XqwTroiqNeGZHMY5oj8R1+VzyCiaH+qEWoNh1nwHCot0yTPPPPvBD/eJlwuPQQ0rN4Efh4Xd7at1EPwe4M/qgTDEPzSyaAdZQwRxSlD3bc+shIvqwiFLoAlP9c5sCt/mwlELBtoP2O307abLH52PZTeEWlGVmr+31BrjSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUrj70BC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUrj70BC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726042060; x=1757578060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPDNkQnVKnVAcrK/Eh4hsgXU1Qt/q6JaxHba5BFYsaY=;
  b=nUrj70BCGweoIok4vDWn/PaWVKzEIvU2OxGgxFVODiHt+I2YxATdscrC
   aCR9w+VKUDDctaM2gSqJVgi2D0uEvqkxm6rfefxXAExt0J4/TjSNduL5/
   vczMwPmZv8yAY46af46HocmYjHfjD4ygqAuteLhQlUC3AF92oTr80O0Sh
   vJbGwRY2ZbwISob0RNpUnTLqc05qhy2NSSZyNlfYuojG7lefRXsSTtqql
   PVSJVSF04SuEIDyQn9oRot2smq00M532bOaDeYkDgFsXUDE3z3Xvaauuf
   EDovwPw3p495kokTqzU2zDYl0nDKs0Le1JWajau2Kp/6ZF0RB5+VzwCRP
   w==;
X-CSE-ConnectionGUID: GKwWKedPQ2K6KrQxAkxMBA==
X-CSE-MsgGUID: SO8+ZTHNTqCfeYsgKONzDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36180871"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="36180871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:07:40 -0700
X-CSE-ConnectionGUID: wwODo/yNQeuOfYtbxkA9Og==
X-CSE-MsgGUID: KDC37iJcTYO8c5/ypvmTNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72063082"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 01:07:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soIO0-0003DS-0N;
	Wed, 11 Sep 2024 08:07:36 +0000
Date: Wed, 11 Sep 2024 16:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/4] include/trace/events/cros_file.h:17:
 undefined reference to `__tracepoint_cros_filp_close_exit'
Message-ID: <202409111651.zHcZo8s9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   97238f972d8c84cf4396b8748731e912f46a0445
commit: dc731cd8bbfc0e772144f2c2dded2593a030fdd6 [1/4] CHROMIUM: add cros file tracepoints for bpf
config: x86_64-buildonly-randconfig-004-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111651.zHcZo8s9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111651.zHcZo8s9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111651.zHcZo8s9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/open.o: in function `trace_cros_filp_close_exit':
>> include/trace/events/cros_file.h:17: undefined reference to `__tracepoint_cros_filp_close_exit'
>> ld: include/trace/events/cros_file.h:17: undefined reference to `__tracepoint_cros_filp_close_exit'
>> ld: include/trace/events/cros_file.h:17: undefined reference to `__SCT__tp_func_cros_filp_close_exit'
   ld: fs/open.o: in function `trace_cros_chmod_common_exit':
>> include/trace/events/cros_file.h:232: undefined reference to `__tracepoint_cros_chmod_common_exit'
>> ld: include/trace/events/cros_file.h:232: undefined reference to `__tracepoint_cros_chmod_common_exit'
>> ld: include/trace/events/cros_file.h:232: undefined reference to `__SCT__tp_func_cros_chmod_common_exit'
   ld: fs/open.o: in function `chmod_common':
>> include/trace/events/cros_file.h:191: undefined reference to `__tracepoint_cros_chmod_common_enter'
>> ld: include/trace/events/cros_file.h:191: undefined reference to `__tracepoint_cros_chmod_common_enter'
>> ld: include/trace/events/cros_file.h:191: undefined reference to `__SCT__tp_func_cros_chmod_common_enter'
   ld: fs/open.o: in function `chown_common':
>> include/trace/events/cros_file.h:271: undefined reference to `__tracepoint_cros_chown_common_enter'
>> ld: include/trace/events/cros_file.h:271: undefined reference to `__tracepoint_cros_chown_common_enter'
>> ld: include/trace/events/cros_file.h:271: undefined reference to `__SCT__tp_func_cros_chown_common_enter'
>> ld: include/trace/events/cros_file.h:313: undefined reference to `__tracepoint_cros_chown_common_exit'
>> ld: include/trace/events/cros_file.h:313: undefined reference to `__tracepoint_cros_chown_common_exit'
>> ld: include/trace/events/cros_file.h:313: undefined reference to `__SCT__tp_func_cros_chown_common_exit'
   ld: fs/open.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_filp_close_exit'
   ld: fs/open.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_chmod_common_exit'
   ld: fs/open.o:(__jump_table+0x28): undefined reference to `__tracepoint_cros_chmod_common_enter'
   ld: fs/open.o:(__jump_table+0x38): undefined reference to `__tracepoint_cros_chown_common_enter'
   ld: fs/open.o:(__jump_table+0x48): undefined reference to `__tracepoint_cros_chown_common_exit'
   ld: fs/open.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_filp_close_exit'
   ld: fs/open.o:(.static_call_sites+0x14): undefined reference to `__SCK__tp_func_cros_chmod_common_exit'
   ld: fs/open.o:(.static_call_sites+0x54): undefined reference to `__SCK__tp_func_cros_chmod_common_enter'
   ld: fs/open.o:(.static_call_sites+0x64): undefined reference to `__SCK__tp_func_cros_chown_common_enter'
   ld: fs/open.o:(.static_call_sites+0x74): undefined reference to `__SCK__tp_func_cros_chown_common_exit'
   ld: fs/namespace.o: in function `trace_cros_path_mount_exit':
   namespace.c:(.text+0x2168): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x2174): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: namespace.c:(.text+0x21a4): undefined reference to `__SCT__tp_func_cros_path_mount_exit'
   ld: fs/namespace.o: in function `path_umount':
   namespace.c:(.text+0x690a): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x6916): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: namespace.c:(.text+0x6935): undefined reference to `__SCT__tp_func_cros_path_umount_exit'
   ld: namespace.c:(.text+0x69ac): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x69b8): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: namespace.c:(.text+0x69d6): undefined reference to `__SCT__tp_func_cros_path_umount_entry'
   ld: fs/namespace.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_path_mount_exit'
   ld: fs/namespace.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_path_umount_entry'
   ld: fs/namespace.o:(__jump_table+0x28): undefined reference to `__tracepoint_cros_path_umount_exit'
   ld: fs/namespace.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_path_mount_exit'
   ld: fs/namespace.o:(.static_call_sites+0x7c): undefined reference to `__SCK__tp_func_cros_path_umount_exit'
   ld: fs/namespace.o:(.static_call_sites+0x8c): undefined reference to `__SCK__tp_func_cros_path_umount_entry'
   ld: fs/utimes.o: in function `trace_cros_vfs_utimes_exit':
>> include/trace/events/cros_file.h:403: undefined reference to `__tracepoint_cros_vfs_utimes_exit'
>> ld: include/trace/events/cros_file.h:403: undefined reference to `__tracepoint_cros_vfs_utimes_exit'
>> ld: include/trace/events/cros_file.h:403: undefined reference to `__SCT__tp_func_cros_vfs_utimes_exit'
   ld: fs/utimes.o: in function `vfs_utimes':
>> include/trace/events/cros_file.h:355: undefined reference to `__tracepoint_cros_vfs_utimes_enter'
>> ld: include/trace/events/cros_file.h:355: undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: include/trace/events/cros_file.h:355: undefined reference to `__SCT__tp_func_cros_vfs_utimes_enter'
   ld: fs/utimes.o:(__jump_table+0x8): undefined reference to `__tracepoint_cros_vfs_utimes_exit'
   ld: fs/utimes.o:(__jump_table+0x18): undefined reference to `__tracepoint_cros_vfs_utimes_enter'
   ld: fs/utimes.o:(.static_call_sites+0x4): undefined reference to `__SCK__tp_func_cros_vfs_utimes_exit'
   ld: fs/utimes.o:(.static_call_sites+0x14): undefined reference to `__SCK__tp_func_cros_vfs_utimes_enter'


vim +17 include/trace/events/cros_file.h

     8	
     9	#include <linux/dcache.h>
    10	#include <linux/tracepoint.h>
    11	#include <linux/minmax.h>
    12	/* In kernels<6.6 fentry, fexit and LSM hooks for eBPF do not work for ARM platforms.
    13	 * As a workaround the following tracepoints have been added to provide hooks for
    14	 * XDR file event eBPF hooks for ARM platforms.
    15	 *
    16	 */
  > 17	TRACE_EVENT_CONDITION(cros_filp_close_exit,
    18		TP_PROTO(struct file *filp, fl_owner_t id, int ret),
    19		TP_ARGS(filp, id, ret),
    20		TP_CONDITION(filp && filp->f_path.dentry),
    21		TP_STRUCT__entry(
    22			__array(char, name, 128)
    23		),
    24		TP_fast_assign(
    25			unsigned int name_len = 0;
    26			struct qstr *dname = &(filp->f_path.dentry->d_name);
    27			static const unsigned int max_name_size = sizeof(__entry->name) - 1;
    28	
    29			name_len = min(max_name_size, dname->len);
    30			memmove(__entry->name, dname->name, name_len);
    31			__entry->name[name_len] = '\0';
    32		),
    33		TP_printk("do_not_depend:%s", __entry->name)
    34		);
    35	
    36	TRACE_EVENT_CONDITION(cros_security_inode_rename_exit,
    37		TP_PROTO(struct inode *old_dir, struct dentry *old_dentry,
    38			struct inode *new_dir, struct dentry *new_dentry,
    39			unsigned int flags, int ret),
    40		TP_ARGS(old_dir, old_dentry, new_dir, new_dentry, flags, ret),
    41		TP_CONDITION(old_dentry && new_dentry),
    42		TP_STRUCT__entry(
    43			__array(char, old_name, 128)
    44			__array(char, new_name, 128)
    45		),
    46		TP_fast_assign(
    47			unsigned int name_len = 0;
    48			struct qstr *old_dname = &(old_dentry->d_name);
    49			struct qstr *new_dname = &(new_dentry->d_name);
    50			/*  Max size without null terminator. */
    51			static const unsigned int max_old_name_size = sizeof(__entry->old_name)-1;
    52			static const unsigned int max_new_name_size = sizeof(__entry->new_name)-1;
    53	
    54			__entry->old_name[0] = '\0';
    55			__entry->new_name[0] = '\0';
    56	
    57			name_len = min(old_dname->len, max_old_name_size);
    58			memmove(__entry->old_name, old_dname->name, name_len);
    59			__entry->old_name[name_len] = '\0';
    60	
    61			name_len = min(new_dname->len, max_new_name_size);
    62			memmove(__entry->new_name, new_dname->name, name_len);
    63			__entry->new_name[name_len] = '\0';
    64		),
    65		TP_printk("do_not_depend: from:%s to:%s", __entry->old_name, __entry->new_name)
    66		);
    67	
    68	
    69	TRACE_EVENT_CONDITION(cros_security_inode_link_exit,
    70		TP_PROTO(struct dentry *old_dentry, struct inode *dir,
    71			struct dentry *new_dentry, int ret),
    72		TP_ARGS(old_dentry, dir, new_dentry, ret),
    73		TP_CONDITION(old_dentry && new_dentry),
    74		TP_STRUCT__entry(
    75			__array(char, old_name, 128)
    76			__array(char, new_name, 128)
    77		),
    78		TP_fast_assign(
    79			unsigned int name_len = 0;
    80			struct qstr *old_dname = &(old_dentry->d_name);
    81			struct qstr *new_dname = &(new_dentry->d_name);
    82			/*  Max size without null terminator. */
    83			static const unsigned int max_old_name_size = sizeof(__entry->old_name)-1;
    84			static const unsigned int max_new_name_size = sizeof(__entry->new_name)-1;
    85	
    86			__entry->old_name[0] = '\0';
    87			__entry->new_name[0] = '\0';
    88	
    89			name_len = min(old_dname->len, max_old_name_size);
    90			memmove(__entry->old_name, old_dname->name, name_len);
    91			__entry->old_name[name_len] = '\0';
    92	
    93			name_len = min(new_dname->len, max_new_name_size);
    94			memmove(__entry->new_name, new_dname->name, name_len);
    95			__entry->new_name[name_len] = '\0';
    96		),
    97		TP_printk("do_not_depend: from:%s to:%s", __entry->old_name, __entry->new_name)
    98		);
    99	
   100	TRACE_EVENT_CONDITION(cros_security_inode_unlink_exit,
   101		TP_PROTO(struct inode *dir,
   102			struct dentry *old_dentry, int ret),
   103		TP_ARGS(dir, old_dentry, ret),
   104		TP_CONDITION(old_dentry && dir),
   105		TP_STRUCT__entry(
   106			__array(char, old_dentry, 128)
   107		),
   108		TP_fast_assign(
   109			unsigned int name_len = 0;
   110			struct qstr *old_dname = &(old_dentry->d_name);
   111			/* Max size of string without null terminator. */
   112			static const unsigned int max_old_dname_size = sizeof(__entry->old_dentry)-1;
   113	
   114			__entry->old_dentry[0] = '\0';
   115			name_len = min(max_old_dname_size, old_dname->len);
   116			memmove(__entry->old_dentry, old_dname->name, name_len);
   117			__entry->old_dentry[name_len] = '\0';
   118		),
   119		TP_printk("do_not_depend: unlinked %s", __entry->old_dentry)
   120		);
   121	
   122	TRACE_EVENT_CONDITION(cros_path_mount_exit,
   123		TP_PROTO(const char *dev_name, const struct path *path,
   124			const char *type_page, unsigned long flags, void *data_page, int ret),
   125		TP_ARGS(dev_name, path, type_page, flags, data_page, ret),
   126		TP_CONDITION(dev_name && path && path->dentry && type_page),
   127		TP_STRUCT__entry(
   128			__array(char, dev_name, 128)
   129			__array(char, target_name, 128)
   130		),
   131		TP_fast_assign(
   132			unsigned int name_len = 0;
   133			struct qstr *target_dname = &(path->dentry->d_name);
   134			// string length without null terminator.
   135			static const unsigned int max_dev_name_size = sizeof(__entry->dev_name) - 1;
   136			static const unsigned int max_target_name_size = sizeof(__entry->target_name)-1;
   137	
   138			__entry->dev_name[0] = 0;
   139			__entry->target_name[0] = '\0';
   140			strncpy(__entry->dev_name, dev_name, max_dev_name_size);
   141			__entry->dev_name[max_dev_name_size] = 0;
   142			name_len = min(target_dname->len, max_target_name_size);
   143			memmove(__entry->target_name, target_dname->name, name_len);
   144			__entry->target_name[name_len] = '\0';
   145		),
   146		TP_printk("do_not_depend: dev_name:%s target:%s", __entry->dev_name, __entry->target_name)
   147		);
   148	
   149	TRACE_EVENT_CONDITION(cros_path_umount_entry,
   150		TP_PROTO(struct path *path, int flags),
   151		TP_ARGS(path, flags),
   152		TP_CONDITION(path && path->dentry),
   153		TP_STRUCT__entry(
   154			__array(char, target_name, 128)
   155		),
   156		TP_fast_assign(
   157			unsigned int name_len = 0;
   158			struct qstr *target_dname = &(path->dentry->d_name);
   159			/* Max size of string without null terminator. */
   160			static const unsigned int max_target_name_size = sizeof(__entry->target_name)-1;
   161	
   162			__entry->target_name[0] = '\0';
   163			name_len = min(target_dname->len, max_target_name_size);
   164			memmove(__entry->target_name, target_dname->name, name_len);
   165			__entry->target_name[name_len] = '\0';
   166		),
   167		TP_printk("do_not_depend: unmounted:%s ", __entry->target_name)
   168		);
   169	
   170	TRACE_EVENT_CONDITION(cros_path_umount_exit,
   171		TP_PROTO(struct path *path, int flags, int ret),
   172		TP_ARGS(path, flags, ret),
   173		TP_CONDITION(path && path->dentry),
   174		TP_STRUCT__entry(
   175			__array(char, target_name, 128)
   176		),
   177		TP_fast_assign(
   178			unsigned int name_len = 0;
   179			struct qstr *target_dname = &(path->dentry->d_name);
   180			/* Max size of string without null terminator. */
   181			static const unsigned int max_target_name_size = sizeof(__entry->target_name)-1;
   182	
   183			__entry->target_name[0] = '\0';
   184			name_len = min(target_dname->len, max_target_name_size);
   185			memmove(__entry->target_name, target_dname->name, name_len);
   186			__entry->target_name[name_len] = '\0';
   187		),
   188		TP_printk("do_not_depend: unmounted:%s ", __entry->target_name)
   189		);
   190	
 > 191	TRACE_EVENT_CONDITION(cros_chmod_common_enter,
   192		TP_PROTO(const struct path *path, umode_t mode),
   193		TP_ARGS(path, mode),
   194		TP_CONDITION(path && path->dentry && path->dentry->d_inode),
   195		TP_STRUCT__entry(
   196			__array(char, name, 128)
   197			__array(char, root, 128)
   198			__array(char, id, 32)
   199			__field(umode_t, mode)
   200		),
   201		TP_fast_assign(
   202			unsigned int name_len = 0;
   203			struct qstr *dname = &(path->dentry->d_name);
   204			static const unsigned int max_name_size = sizeof(__entry->name) - 1;
   205			static const unsigned int max_root_size = sizeof(__entry->root) - 1;
   206			static const unsigned int max_id_size = sizeof(__entry->id) - 1;
   207	
   208			__entry->name[0] = '\0';
   209			__entry->root[0] = '\0';
   210			__entry->id[0] = '\0';
   211			__entry->mode = mode;
   212	
   213			name_len = min(max_name_size, dname->len);
   214			memmove(__entry->name, dname->name, name_len);
   215			__entry->name[name_len] = '\0';
   216	
   217			if (path->dentry->d_sb && path->dentry->d_sb->s_root) {
   218				struct qstr *root_name = &(path->dentry->d_sb->s_root->d_name);
   219	
   220				name_len = min(dname->len, max_root_size);
   221				memmove(__entry->root, root_name->name, name_len);
   222				__entry->root[name_len] = '\0';
   223				name_len = min(max_id_size, sizeof(path->dentry->d_sb->s_id));
   224				memmove(__entry->id, path->dentry->d_sb->s_id, name_len);
   225				__entry->id[name_len] = '\0';
   226			}
   227		),
   228		TP_printk("do_not_depend:%s root:%s id:%s mode:0%o", __entry->name,
   229			  __entry->root, __entry->id, __entry->mode)
   230		);
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
