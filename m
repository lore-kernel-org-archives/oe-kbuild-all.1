Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3191714AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139678; cv=none; b=N7SE9PwH7DH577CJ9stAG05OajJdnsqLr1gIc/65KcIAO+Ee6bmsPgQMY1FPi1tTEFm/CH8jiN17T0J43uwpal0kmEv63J4WD0kcFRmKB3w1uXVNldfK4r9sLbE0VDy9UeNyDs/OJXsBdCaPa5oW0rtZ/Tlb8/HyiYD1fLa/57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139678; c=relaxed/simple;
	bh=jUKCVTQfqGjy0jw6zvhQsR0+wlO/2yrctb7hQfJfBfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iWbecMW4PtXZu6kSQ2YxkhrzHrZJ73rKxfem14ohMJj4KR6SiKhXFVDG3MycGk7Dk5mQpHLpXzoICfAxzADDj8FvjoP2D+dUxGrpql5BlAnTNoqBIIVtrIN0z2j/WmeV3ylbajxlAR4hPZVrX7m8O0+elOZowZC7t6t5L18zpEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODDuF+/e; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODDuF+/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792139676; x=1823675676;
  h=date:from:to:cc:subject:message-id;
  bh=jUKCVTQfqGjy0jw6zvhQsR0+wlO/2yrctb7hQfJfBfg=;
  b=ODDuF+/eDVkJsYudUvmeexppTeydIPyir71qVQQyl8rCnMQ/YNGwgbtF
   vvHm/igH+cwTpFyD9HyJK8MpqCsOJqWxPzHoB0ro2lhM2vRShAePhIlZD
   gpuxJhSgBG5tlMWC0YWh1MWOCLj3MXeuc3c3D2Oh5C6MQgMtt+NeA573l
   m6OPLE39rYn4yUFUnGZS/JIDO68eOtCA/dCrTddcGlC997aqRKE0GaOrX
   grYLZdbIJXPQKMA2JbqFfpcUJEXj8SuQh0YlS8XLcjgvvWMbuCedLzHuN
   AMLwA+TI+/JtouQIZUBcJ5QWUIdpog2DzxDkxTZUICdv6wI9gcb1TeqK8
   g==;
X-CSE-ConnectionGUID: BdqYvP+OSbS/B1dbNcVknw==
X-CSE-MsgGUID: SxB4muQ9TFKRXNoz4xypBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="825677"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="825677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 01:34:35 -0700
X-CSE-ConnectionGUID: B20eV+4qTKqhf2wzxDjNOQ==
X-CSE-MsgGUID: K9UPsYtCRXyCA1UoQ2vGRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2314859"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2026 01:34:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHdOZ-00000000C8p-3Vhd;
	Fri, 16 Oct 2026 08:34:31 +0000
Date: Fri, 16 Oct 2026 10:34:24 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/trace/hooks/fs.h:144:18: warning: declaration of 'struct
 linux_binprm' will not be visible outside of this function
Message-ID: <202610161047.lMsDTSQM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   70a231d0d37bc782fef784fc8a367822ed2098a1
commit: fa573af4b2ab4a7c778dfaf0bb0a081ed59327f8 [1/1] ANDROID: vendor_hooks: add hooks for process authenticator security module
config: arm-randconfig-r2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161047.lMsDTSQM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161047.lMsDTSQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161047.lMsDTSQM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/erofs/zdata.c:11:
>> include/trace/hooks/fs.h:144:18: warning: declaration of 'struct linux_binprm' will not be visible outside of this function [-Wvisibility]
     144 |         TP_PROTO(struct linux_binprm *bprm, int depth),
         |                         ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +144 include/trace/hooks/fs.h

    16	
    17	DECLARE_HOOK(android_vh_ep_create_wakeup_source,
    18		TP_PROTO(char *name, int len),
    19		TP_ARGS(name, len));
    20	
    21	DECLARE_HOOK(android_vh_timerfd_create,
    22		TP_PROTO(char *name, int len),
    23		TP_ARGS(name, len));
    24	
    25	DECLARE_HOOK(android_vh_f2fs_printk,
    26		TP_PROTO(unsigned long s_flag, struct va_format *vaf, int level, bool limit_rate),
    27		TP_ARGS(s_flag, vaf, level, limit_rate));
    28	
    29	DECLARE_HOOK(android_vh_f2fs_create,
    30		TP_PROTO(struct inode *inode, struct dentry *dentry),
    31		TP_ARGS(inode, dentry));
    32	
    33	DECLARE_HOOK(android_vh_f2fs_set_bio_flag,
    34		TP_PROTO(struct folio *folio, struct bio *bio),
    35		TP_ARGS(folio, bio));
    36	
    37	DECLARE_HOOK(android_vh_put_super,
    38		TP_PROTO(struct super_block *sb),
    39		TP_ARGS(sb));
    40	
    41	DECLARE_HOOK(android_vh_wb_dirty_limits,
    42		TP_PROTO(unsigned long *thresh, struct bdi_writeback *wb),
    43		TP_ARGS(thresh, wb));
    44	
    45	DECLARE_HOOK(android_vh_evict,
    46		TP_PROTO(struct inode *inode),
    47		TP_ARGS(inode));
    48	
    49	DECLARE_HOOK(android_vh_inode_io_list_del,
    50		TP_PROTO(struct inode *inode, struct bdi_writeback *wb),
    51		TP_ARGS(inode, wb));
    52	
    53	DECLARE_HOOK(android_vh_redirty_tail_locked,
    54		TP_PROTO(struct list_head **target_list, struct inode *inode,
    55			 struct bdi_writeback *wb),
    56		TP_ARGS(target_list, inode, wb));
    57	
    58	DECLARE_HOOK(android_vh_queue_io,
    59		TP_PROTO(struct bdi_writeback *wb, unsigned int for_kupdate,
    60			 unsigned long dirtied_before, int *moved),
    61		TP_ARGS(wb, for_kupdate, dirtied_before, moved));
    62	
    63	DECLARE_HOOK(android_vh_mark_inode_dirty,
    64		TP_PROTO(struct inode *inode, struct bdi_writeback *wb, struct list_head **dirty_list),
    65		TP_ARGS(inode, wb, dirty_list));
    66	
    67	DECLARE_HOOK(android_vh_vfs_fsync_range,
    68		TP_PROTO(struct inode *inode, unsigned long *cut_off),
    69		TP_ARGS(inode, cut_off));
    70	
    71	DECLARE_RESTRICTED_HOOK(android_rvh_do_fcntl,
    72		TP_PROTO(struct file *filp, unsigned int cmd, unsigned long arg, long *err),
    73		TP_ARGS(filp, cmd, arg, err), 1);
    74	
    75	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_buffer_write,
    76		TP_PROTO(struct kiocb *iocb, struct iov_iter *from,
    77			 ssize_t *ret, bool *write_done),
    78		TP_ARGS(iocb, from, ret, write_done), 1);
    79	
    80	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_move_data_block_bypass,
    81		TP_PROTO(struct inode *inode, unsigned int bidx, int gc_type,
    82			 unsigned int segno, int off, int *err, bool *bypass),
    83		TP_ARGS(inode, bidx, gc_type, segno, off, err, bypass), 1);
    84	
    85	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_ra_data_block_bypass,
    86		TP_PROTO(struct inode *inode, pgoff_t index, int *err, bool *bypass),
    87		TP_ARGS(inode, index, err, bypass), 1);
    88	
    89	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_write_cache_pages,
    90		TP_PROTO(struct address_space *mapping, struct writeback_control *wbc,
    91			 int *ret, bool *wb_done),
    92		TP_ARGS(mapping, wbc, ret, wb_done), 1);
    93	
    94	DECLARE_HOOK(android_vh_f2fs_customized_ioctl,
    95		TP_PROTO(struct file *filp, unsigned int cmd, unsigned long arg,
    96			 long *ret, bool *ioctl_done),
    97		TP_ARGS(filp, cmd, arg, ret, ioctl_done));
    98	
    99	DECLARE_HOOK(android_vh_f2fs_dnode_set_blkaddr,
   100		TP_PROTO(struct inode *inode, u32 blkaddr),
   101		TP_ARGS(inode, blkaddr));
   102	
   103	DECLARE_HOOK(android_vh_f2fs_inode_may_compress,
   104		TP_PROTO(struct inode *inode, int *err),
   105		TP_ARGS(inode, err));
   106	
   107	DECLARE_HOOK(android_vh_f2fs_improve_priority,
   108		TP_PROTO(struct task_struct *p, int *saved_prio, bool *skip),
   109		TP_ARGS(p, saved_prio, skip));
   110	
   111	DECLARE_HOOK(android_vh_f2fs_restore_priority,
   112		TP_PROTO(struct task_struct *p, int saved_prio),
   113		TP_ARGS(p, saved_prio));
   114	
   115	DECLARE_RESTRICTED_HOOK(android_rvh_f2fs_down_read,
   116		TP_PROTO(wait_queue_head_t *read_waiters, struct rw_semaphore *rwsem, bool *skip),
   117		TP_ARGS(read_waiters, rwsem, skip), 1);
   118	
   119	DECLARE_HOOK(android_vh_f2fs_file_open,
   120		TP_PROTO(struct inode *inode, struct file *filp),
   121		TP_ARGS(inode, filp));
   122	
   123	DECLARE_HOOK(android_vh_erofs_iostat_submit,
   124		TP_PROTO(struct super_block *sb, struct bio *bio),
   125		TP_ARGS(sb, bio));
   126	
   127	DECLARE_HOOK(android_vh_erofs_iostat_update,
   128		TP_PROTO(struct super_block *sb, struct bio *bio),
   129		TP_ARGS(sb, bio));
   130	
   131	DECLARE_HOOK(android_vh_f2fs_iostat_submit,
   132		TP_PROTO(struct super_block *sb, int type, struct bio *bio),
   133		TP_ARGS(sb, type, bio));
   134	
   135	DECLARE_HOOK(android_vh_f2fs_iostat_update,
   136		TP_PROTO(struct super_block *sb, struct bio *bio, bool *skip),
   137		TP_ARGS(sb, bio, skip));
   138	
   139	DECLARE_RESTRICTED_HOOK(android_rvh_post_setattr,
   140		TP_PROTO(struct dentry *dentry),
   141		TP_ARGS(dentry), 1);
   142	
   143	DECLARE_RESTRICTED_HOOK(android_rvh_exec_binprm_check,
 > 144		TP_PROTO(struct linux_binprm *bprm, int depth),
   145		TP_ARGS(bprm, depth), 1);
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
