Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7558F58
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752424982; cv=none; b=H6zaeZh1NidQdj6mYT/QbRhhQOO4//EcIzN8yswYfCdybCbmAvfJpAw52QaB7bOe+FG7bDeAcdzl08IzgUWnRLLHrFC+0UxTmLS2mCNbjCps6OeKBnEOxgNC0nhJG9Pxo67gDcxVpOQT+8ss3d0idTCCSask2szv++MALd9+GmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752424982; c=relaxed/simple;
	bh=F7jNY+rZir8HB3uhSql5342dLtsQjPOtEK5QLzGjYjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ljJVbU3lXpe5PRS6mi6GaRX8ZDVGIzMlp2HskcM5ffmQ/4yk7MAl6gHOf/WJwZ+3rqjMhjpRtsdWlTTi5AJ8uON4akyArJlL/dPWakju9bbUia4EA4QMPt7p84BjCg4twZHz9GMjg309KtCjdM8pl37hjVv5rvSR0qGZFuqUcGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKElU5dT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKElU5dT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752424980; x=1783960980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7jNY+rZir8HB3uhSql5342dLtsQjPOtEK5QLzGjYjc=;
  b=JKElU5dT/JaAPLIDZRF06Y3OHlyj9++ANW+SOhXb+lp6mkjGZ1SZtv5z
   vv3o0XMhbm+QtRzqwy2syWaSo5iXE6RmkSioRtW6YjYGd+GyhOQCpSKfQ
   LJ3MxPhRRNiYOT8DKyDI3WCqvubiOMS2b0IkAdXQYNVF1HY41Io4zPpPM
   DdyYgY1OlFlJ7LtiluIxaF/z7IQSZjgbMRMsEn0hKNsBFHnIIIpd3BsEf
   7SbO+OCR4MVkMb4NxwENZ0d3GebqpnnkT39F+MwHj1wP5BctAmnh8ER7x
   LrYkAMHOCTs9JxeoYTiP9LFnUVVyaxmtnjEdCdkCiUdoGU2GjYlbQ+4gs
   A==;
X-CSE-ConnectionGUID: zXSiYpwRRkmv/jwAekCJqw==
X-CSE-MsgGUID: MkX1B2rrS1GkH8kGjz68Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58295092"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="58295092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:42:59 -0700
X-CSE-ConnectionGUID: dB03yrNhQ8GkXHm8tKi6lw==
X-CSE-MsgGUID: 3kzdAX9jRiaiwdIJI+orkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="156380292"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2025 09:42:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uazmy-0008Bz-1B;
	Sun, 13 Jul 2025 16:42:56 +0000
Date: Mon, 14 Jul 2025 00:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] include/trace/hooks/fs.h:60:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202507140012.cyAH8gR6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   21ed84930c160ed721c131a67e5ae6181ac40e1e
commit: 28b35bdaea49d8d7737889bd9068908c2a241108 [0/2] ANDROID: writeback: add vendor hooks to do a hierarchical writeback control
config: i386-randconfig-062-20250713 (https://download.01.org/0day-ci/archive/20250714/202507140012.cyAH8gR6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140012.cyAH8gR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507140012.cyAH8gR6-lkp@intel.com/

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
