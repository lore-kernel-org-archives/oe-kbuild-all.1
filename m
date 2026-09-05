Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E437A834
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615057; cv=none; b=tgqhMwBbg4tX6284spDW5D+T1f1uHX7Hy3te/iDBoRHCR6u4YxuMdM9TDrlTXBQzBplUxCAXA3ssNplXF6HkWfLBz0jKT7H6xsZqOM8RodyGpE5VRYMibCzg8PkmBQ+MPP+DM8AotWQngbX5jkDhB/tJzXdtSAn1TcBVYRlZvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615057; c=relaxed/simple;
	bh=DBc6mpcndJ7cgT+VpxORtC8nReHWP39P+P9MvO8CW8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r5C3eOSQkjDUc97QU4yyBtRkdK2fpUlga5hILN4qGftYEWuBS2Mv5zjHUkW/Ed5hSH7dQ0id0Uaq+N+7plAjVQNM/jcDg4M0H9tKbrUjkdIzSKCZOLXAfadgO1G0zUvX1Amo6QzLATym3nK0e4ki4RKAiZw8J20xxoJjzUxsieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lq5yFrGk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lq5yFrGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788615046; x=1820151046;
  h=date:from:to:cc:subject:message-id;
  bh=DBc6mpcndJ7cgT+VpxORtC8nReHWP39P+P9MvO8CW8U=;
  b=lq5yFrGk+ezo3UdwlABOB8ZtW/5RjMtecreV+24n3HuWR4Qwdjpy6rrJ
   r/sDmHrAfmF5fcCxtusfLhXdxmyPhXFi90jcHM6gDqUkYxkbXkG0lwjUQ
   VTlwNK4WgoOAunr8ai63uAxueb9lJU1g/cvZn1U1mJqTrXuBQBn6fS0MK
   pLCMxRaOTrHSFW3h0MPrE3SyPc44RvcVbLkX5Qn9Jt3J0amd2MIqMEzCX
   Y6MLuFH8fERyRJvpvv6WWrkHt6GJRSyMFjHuZ30QOOSPlkVEOP2UdfpQm
   bR/YXR5yHEECaDj0tRIA6vI6XIwJyF4ZuSthrykOH2raQUHS6PjlWI64c
   w==;
X-CSE-ConnectionGUID: aV3vJpmrQ16qiCT9KrffWw==
X-CSE-MsgGUID: AJsNpshySoOCtG/YnGLD8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106460982"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="106460982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 06:30:40 -0700
X-CSE-ConnectionGUID: MeVQEqnqRF+0ccEv+hdDkw==
X-CSE-MsgGUID: V7wk66jqQv+NTN1PgSi90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="273826048"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2026 06:30:40 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2qTd-000000000XP-0cfw;
	Sat, 05 Sep 2026 13:30:37 +0000
Date: Sat, 05 Sep 2026 21:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/2]
 include/trace/hooks/fs.h:60:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202609052113.MjMP83PT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   62b6044c5913ccc80d32a8c160db7818f05f3918
commit: 28b35bdaea49d8d7737889bd9068908c2a241108 [0/2] ANDROID: writeback: add vendor hooks to do a hierarchical writeback control
config: i386-randconfig-063-20260904 (https://download.01.org/0day-ci/archive/20260905/202609052113.MjMP83PT-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609052113.MjMP83PT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609052113.MjMP83PT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fcntl.c:1067:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1067:9: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1067:9: sparse:    struct fasync_struct *
   fs/fcntl.c:1145:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1145:22: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1145:22: sparse:    struct fasync_struct *
   fs/fcntl.c:1156:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1156:33: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1156:33: sparse:    struct fasync_struct *
   fs/fcntl.c:301:9: sparse: sparse: context imbalance in 'f_getown_ex' - different lock contexts for basic block
   fs/fcntl.c: note: in included file:
>> include/trace/hooks/fs.h:60:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fs.h:60:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fs.h:60:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +60 include/trace/hooks/fs.h

    13	
    14	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_down_read,
    15		TP_PROTO(wait_queue_head_t *read_waiters, struct rw_semaphore *rwsem, bool *skip),
    16		TP_ARGS(read_waiters, rwsem, skip), 1);
    17	
    18	DECLARE_HOOK(android_vh_f2fs_improve_priority,
    19		TP_PROTO(struct task_struct *p, int *saved_prio, bool *skip),
    20		TP_ARGS(p, saved_prio, skip));
    21	
    22	DECLARE_HOOK(android_vh_f2fs_restore_priority,
    23		TP_PROTO(struct task_struct *p, int saved_prio),
    24		TP_ARGS(p, saved_prio));
    25	
    26	DECLARE_HOOK(android_vh_f2fs_printk,
    27		TP_PROTO(struct f2fs_sb_info *sbi, struct va_format *vaf, int level, bool limit_rate),
    28		TP_ARGS(sbi, vaf, level, limit_rate));
    29	
    30	DECLARE_HOOK(android_vh_wb_dirty_limits,
    31		TP_PROTO(unsigned long *thresh, struct bdi_writeback *wb),
    32		TP_ARGS(thresh, wb));
    33	
    34	DECLARE_HOOK(android_vh_evict,
    35		TP_PROTO(struct inode *inode),
    36		TP_ARGS(inode));
    37	
    38	DECLARE_HOOK(android_vh_inode_io_list_del,
    39		TP_PROTO(struct inode *inode, struct bdi_writeback *wb),
    40		TP_ARGS(inode, wb));
    41	
    42	DECLARE_HOOK(android_vh_redirty_tail_locked,
    43		TP_PROTO(struct list_head **target_list, struct inode *inode,
    44			 struct bdi_writeback *wb),
    45		TP_ARGS(target_list, inode, wb));
    46	
    47	DECLARE_HOOK(android_vh_queue_io,
    48		TP_PROTO(struct bdi_writeback *wb, unsigned int for_kupdate,
    49			 unsigned long dirtied_before, int *moved),
    50		TP_ARGS(wb, for_kupdate, dirtied_before, moved));
    51	
    52	DECLARE_HOOK(android_vh_mark_inode_dirty,
    53		TP_PROTO(struct inode *inode, struct bdi_writeback *wb, struct list_head **dirty_list),
    54		TP_ARGS(inode, wb, dirty_list));
    55	
    56	DECLARE_HOOK(android_vh_vfs_fsync_range,
    57		TP_PROTO(struct inode *inode, unsigned long *cut_off),
    58		TP_ARGS(inode, cut_off));
    59	
  > 60	DECLARE_RESTRICTED_HOOK(android_rvh_do_fcntl,
    61		TP_PROTO(struct file *filp, unsigned int cmd, unsigned long arg, long *err),
    62		TP_ARGS(filp, cmd, arg, err), 1);
    63	#endif /* _TRACE_HOOK_FS_H */
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
