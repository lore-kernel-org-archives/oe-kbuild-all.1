Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611F3248896
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 17:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343999; cv=none; b=hIKhydf2usvrIEQ9/6iRnRWILmkOtLP9HJQlOyoRaKe4MFYBdsFJOxr3kBrtZVUzpvmx7Zz9fblbcVDI+w9TgxtJSsoPNJBHlmrI9K9KPPEHoyHczYw/s5ETd3p8wChzsjbIklM9d7Lx/tVsvWT1iS6nK2y5oO3ZkDAdAjFsJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343999; c=relaxed/simple;
	bh=i4gZQDGTFYf3aftZxNQKYUfgmxBxPiESxpimE2+6UGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GUEOj2Hpk1EK4Od2OZ1BmEcc2jxRw8N+WVSyZ595elnsO50FQ9v8AUzH3pP/AoPaT7Jh4l9FErK7J41L+/wM1rBJntcjs9yVKO2XCtwBgwtNMVsqi4oK2cA6MtbbyM6VJnx7MtWLfzbTs77LgP+uPjuNjhCSH2Q7CPmnFO/WlLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOW966ng; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOW966ng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792343994; x=1823879994;
  h=date:from:to:cc:subject:message-id;
  bh=i4gZQDGTFYf3aftZxNQKYUfgmxBxPiESxpimE2+6UGo=;
  b=AOW966ngBLt0EuHcJhgSJs+LEToIweTYlClunBhBEekDULj8ahdUVpLO
   lRFOJBIPQAKsaxuINOoCr6/RAZ/f2V0upRD8pz2yk7QFW4r3bRhJQelof
   UqmjdEBlqWHDCooPgYaA4fE0ddtQPzVzr3PsVh03bdkwo6E2OsBNR2d93
   K9lfqDb895T3pXbrBztRQFhFhd7XHoFayLT6W+yqeW5NYt6/LcjwG2s3u
   u4R/7TY4WJfDql1MThH5hf9cjksGI2k3TRJaSIUYK/FVWlhHDLC5AvM82
   uX1jEjqd90gPx5PJKDQg3CUPC5juO5x2nf/VUMRlnZNFqpTAoe4dFqaFv
   w==;
X-CSE-ConnectionGUID: Iybe9pOtSCm/CEH4toR/Cw==
X-CSE-MsgGUID: hs40PXzrT521AYoLgkr/tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="946044"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="946044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 10:19:53 -0700
X-CSE-ConnectionGUID: 1jysGurqSLag5ZbSo0FjLA==
X-CSE-MsgGUID: yzI1VtEwSpWxoXuMKsCAgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2338573"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2026 10:19:52 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIUY2-000000005Bb-0WOF;
	Sun, 18 Oct 2026 17:19:50 +0000
Date: Sun, 18 Oct 2026 19:19:41 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/trace/hooks/fs.h:144:25: warning: 'struct linux_binprm' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202610181939.iQzPNL9m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3c439af8f6b93b7fb3e196f6290e19873d42072c
commit: fa573af4b2ab4a7c778dfaf0bb0a081ed59327f8 [1/1] ANDROID: vendor_hooks: add hooks for process authenticator security module
config: arm-randconfig-r2304-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181939.iQzPNL9m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181939.iQzPNL9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181939.iQzPNL9m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/events/erofs.h:8,
                    from fs/erofs/zdata.c:10:
>> include/trace/hooks/fs.h:144:25: warning: 'struct linux_binprm' declared inside parameter list will not be visible outside of this definition or declaration
     144 |         TP_PROTO(struct linux_binprm *bprm, int depth),
         |                         ^~~~~~~~~~~~
   include/linux/tracepoint.h:640:41: note: in definition of macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/trace/hooks/vendor_hooks.h:129:33: note: in expansion of macro 'PARAMS'
     129 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |                                 ^~~~~~
   include/trace/hooks/fs.h:143:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
     143 | DECLARE_RESTRICTED_HOOK(android_rvh_exec_binprm_check,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/fs.h:144:9: note: in expansion of macro 'TP_PROTO'
     144 |         TP_PROTO(struct linux_binprm *bprm, int depth),
         |         ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


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
