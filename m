Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005349BD84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792274828; cv=none; b=eBXX3a8XLahqSssjUOOtWg7DEtjJQDUjhL6NNhDeiyD9CAaucZ1gcbnB+3xF6U31qkpqucoNyREonvppeMEazoQ5jAk+phICGFTcxtvg6Fw6O+2K/b2W5kAjmMcpqyHc2QNyb5LWbP6W3LfcgGH3EhH0OiVJCrXRZX8/TMtEwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792274828; c=relaxed/simple;
	bh=5wubf1T8yWLfzhTzVEc548pBGhrf6nbBIxqa0Ie2AK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d7klyXSkQJkPB1GNVsCzSrQMnhED0azuR9JIEsitkEukJzMzdP/hUkWfMJcu6dAsFUI5NgV/9iVwlNGuoUKTNPXI4IyM7HD9048Nm0dF18cmIPi4SYPP8xlthfpCMP9sP1fI8ImzxgDMoz9N9OBYpmA6u3Ia1yhjMj41juQPsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLoWx+Ql; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLoWx+Ql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792274825; x=1823810825;
  h=date:from:to:cc:subject:message-id;
  bh=5wubf1T8yWLfzhTzVEc548pBGhrf6nbBIxqa0Ie2AK4=;
  b=cLoWx+QlGmruOIU1zZ67QEfHLs+EyyQl2JmlpPZFQe+tlnppnIiaRcko
   aVG0h0YLRnZWfQqcKZp7Q/lA/NWQxSzOMF98HBV05buFYWvRQeCBTgnMN
   vzJu90ZxKp2B30X1gMUM08tBMOTUjQ56HZxk+SIy1V8BCpqIrwRof0zZh
   bJ2N+EmeuU7lOpeDux6SSMoAYvfcwQtw/Zkx55hE5FpN5AywmcTicNRC0
   8Wdy8HfAvFvhGQGC191iFtutQoIvSJiRljnCl5BlpRz69OLGJdel89wnx
   fNUnVHIyItnbQKeBgvxgqBZ1t4ls73iMow+uUViEtooUTU4h0mBvQuVIM
   Q==;
X-CSE-ConnectionGUID: MU58c80qQq+GVHFptz3kSg==
X-CSE-MsgGUID: GN/nIx/1Sku4YCCOVDtKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="905040"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="905040"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 15:07:04 -0700
X-CSE-ConnectionGUID: Cc8wrK1AQ46UyXE7S7KBdw==
X-CSE-MsgGUID: 4KRV0PVkSN2Rq9U/lylmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3965967"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Oct 2026 15:07:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xICYO-00000000Jog-0Kwn;
	Sat, 17 Oct 2026 22:07:00 +0000
Date: Sun, 18 Oct 2026 06:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/trace/hooks/fs.h:144:18: warning: declaration of 'struct
 linux_binprm' will not be visible outside of this function
Message-ID: <202610180642.sTdZMplQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   70a231d0d37bc782fef784fc8a367822ed2098a1
commit: fa573af4b2ab4a7c778dfaf0bb0a081ed59327f8 [1/1] ANDROID: vendor_hooks: add hooks for process authenticator security module
config: arm-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180642.sTdZMplQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180642.sTdZMplQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180642.sTdZMplQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/inode.c:16:
   fs/f2fs/f2fs.h:2457:42: error: no member named 'read_waiters' in 'struct f2fs_rwsem'
    2457 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                            ~~~  ^
   In file included from fs/f2fs/inode.c:22:
>> include/trace/hooks/fs.h:144:18: warning: declaration of 'struct linux_binprm' will not be visible outside of this function [-Wvisibility]
     144 |         TP_PROTO(struct linux_binprm *bprm, int depth),
         |                         ^
   1 warning and 1 error generated.


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
