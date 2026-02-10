Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953121E08D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711514; cv=none; b=iyH2e6UmsNwXcHEB1JXJVFoR1XDM6JV8Zq/RqOysMArzmvtbQ8Y4p78X1jnthKvExrFQ3xE0iBlOazVLIdix4iQGKPOAO8+3aEFaVb/NhwkIOQQ76w5ovc13y4dSewpRz2Uy/FGjp/w7ellziVBz+QxZEbzG0kqX1PSmMI/tBxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711514; c=relaxed/simple;
	bh=9jpMTO2xit7nwCRx/fQHgJ5njh0Pbi8PsrSURe1HSac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ck2I3ZJJ5Zxg4eLxfAWnU2wweLIkl1sZoOBWMtmAlBSr87OHi/OrAockRSl0jV3KWnNfwTTX4/QsMJi35uFAcTMQ1wq+SHygmwfYOuU9APnehHLk5f3ddhMl2Nm00wLS8AFTpuT+FBU2pIJeXHSsU3gs7YzdXipCXLVugjPZF/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYa4HJhe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYa4HJhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770711513; x=1802247513;
  h=date:from:to:cc:subject:message-id;
  bh=9jpMTO2xit7nwCRx/fQHgJ5njh0Pbi8PsrSURe1HSac=;
  b=NYa4HJhe0SLnx9jibH4caVTCIAh50iYzK42nT2/u2Dmv8Dz+oOMfgA5m
   kOYSR80Ilz99u4+bJH/qSBvjcayre/E/qrJ3uTwv3Q5x5GnMDut4SbcA0
   AWeMOodnzcZyUkk5JyyUoR6t8ywNfrTCeWvWW4cRrotGSwTpqJAN4DzRq
   h809s4eB6uS4bEPL4DoAP2SbCAz1kLgwCqn7/HhJlboJWPFZMoB5vR1XN
   ImzILTcxcF75BHwWUT7/DM86UjF1Yn5jY6RsBKRxyi7xVc2pWlk0Aik8C
   v14iX6vgAdyMfmi/jJn1ljK4U7BvVTPP9u5CbQ1v7+YOr2DtXOe8wZfvK
   Q==;
X-CSE-ConnectionGUID: 9EtCvjsKRpqd9NeXhwy3pA==
X-CSE-MsgGUID: QHeZENpaQC2T5U0YCvKBPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="97294208"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97294208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:18:32 -0800
X-CSE-ConnectionGUID: VIv+SceqQJqBswAkwcYM6A==
X-CSE-MsgGUID: V4AO3UzxRhKz3xj2Jns6Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211924932"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2026 00:18:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpix2-00000000ooG-0p4d;
	Tue, 10 Feb 2026 08:18:28 +0000
Date: Tue, 10 Feb 2026 16:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 include/trace/hooks/fs.h:60:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202602101651.kwTYRkvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3b54985e12634723f50be663b001e0f03e8643e1
commit: 28b35bdaea49d8d7737889bd9068908c2a241108 [2/2] ANDROID: writeback: add vendor hooks to do a hierarchical writeback control
config: x86_64-randconfig-123-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101651.kwTYRkvn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101651.kwTYRkvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101651.kwTYRkvn-lkp@intel.com/

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
