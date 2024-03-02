Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C9D1C16
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709386074; cv=none; b=p8kDItmqtXvXwxnmCfuRTqRfnquq60+QA1DtkmgUpk+zwLzj3u6WdWHcHLB9xt2gYZ6UROrGu8t2zRErIUqlZp5ltEVUrROTpgHr031WGEIcU9uwCS7+Ih0EHvTimtg5fxZi8jP9OowyMdcpHtMOHX7RrD1KYMU8nVkabO6cYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709386074; c=relaxed/simple;
	bh=leFVYK67Bkb/qy8zlddc8odTktk+676f6Ta8NISHrqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwBF0JoEhtKxfLpA1qZmqN6snzS+4P1BKJR0vMOiIuFoveCsBhENjYM3D6ePzBt4x/2sX1UzNojTOXKzUY43FSYgFoT71tbmHIa+0vKcmc44JXmmSPvR5UDnh9M+MdDLgUIT6jIE+IudmftInrE5j1MhIvL5GDX+IOnLbvLIuEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwzQJDa8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwzQJDa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709386073; x=1740922073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=leFVYK67Bkb/qy8zlddc8odTktk+676f6Ta8NISHrqo=;
  b=EwzQJDa8P4d3nYeGp5c5l4HJUYQ76G6WZq6auZ1/QFWzAilbAVAubqLM
   Ln7mpMraj4NrtdgK74qgamU7npPfJZ3elsr62Ux5lFgIaun5++usYwEYD
   P0C6MU9L6SEJXvaOhEKHGxr20qV2qjRrJHeBP8WBUTTMK7L0MrT+xh2kV
   zMffDThT/Z1cJhIs4ViTkjMY5Raalx+suntQoXtjjq6I4LJIWiCudFCbb
   vcaujjLvpIBE7FypHnikylPYYSWWILfQV0Vf6NZ1q2zflRu9H83X2khUg
   u0gWW5E2+uHsmsSuFTncRxUULJ4bJpi3kKAhwV+2kV8B9opnlGd7gDWt0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7738803"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="7738803"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 05:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8864489"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Mar 2024 05:27:50 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgPP1-00001k-1M;
	Sat, 02 Mar 2024 13:27:47 +0000
Date: Sat, 2 Mar 2024 21:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:feature/fs_param 1/1] fs/f2fs/super.c:231:19: sparse: sparse:
 symbol 'f2fs_mount_opts' was not declared. Should it be static?
Message-ID: <202403022141.0P5rChKd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/fs_param
head:   d4eac172f8f9f4594056366859b67e589e6124c3
commit: d4eac172f8f9f4594056366859b67e589e6124c3 [1/1] [WIP] f2fs: use new fs_context interface
config: x86_64-randconfig-121-20240302 (https://download.01.org/0day-ci/archive/20240302/202403022141.0P5rChKd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403022141.0P5rChKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403022141.0P5rChKd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted vm_fault_t [usertype] ret @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long flags
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t [usertype] ret
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1121:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1121:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1409:1: sparse: sparse: cast to restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: restricted vm_fault_t degrades to integer
   include/trace/events/f2fs.h:1409:1: sparse: sparse: restricted vm_fault_t degrades to integer
>> fs/f2fs/super.c:231:19: sparse: sparse: symbol 'f2fs_mount_opts' was not declared. Should it be static?
   fs/f2fs/super.c:1107:35: sparse: sparse: context imbalance in 'f2fs_drop_inode' - unexpected unlock
   fs/f2fs/super.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/f2fs_mount_opts +231 fs/f2fs/super.c

   230	
 > 231	struct mount_opts f2fs_mount_opts[] = {
   232		{Opt_gc_background,		0,				MO_ENUM},
   233		{Opt_disable_roll_forward,	F2FS_MOUNT_DISABLE_ROLL_FORWARD,
   234										MO_CLEAR},
   235		{Opt_norecovery,		F2FS_MOUNT_NORECOVERY,		MO_SET},
   236		{Opt_discard,			F2FS_MOUNT_DISCARD,		MO_SET},
   237		{Opt_nodiscard,			F2FS_MOUNT_DISCARD,		MO_CLEAR},
   238		{Opt_noheap, 			F2FS_MOUNT_NOHEAP,		MO_DEPRECATED},
   239		{Opt_heap, 			F2FS_MOUNT_NOHEAP,		MO_DEPRECATED},
   240		{Opt_acl, 			F2FS_MOUNT_POSIX_ACL,		MO_SET | MO_ACL},
   241		{Opt_noacl, 			F2FS_MOUNT_POSIX_ACL,		MO_CLEAR | MO_ACL},
   242		{Opt_user_xattr,		F2FS_MOUNT_XATTR_USER,		MO_SET | MO_XATTR},
   243		{Opt_nouser_xattr,		F2FS_MOUNT_XATTR_USER,		MO_CLEAR | MO_XATTR},
   244		{Opt_inline_xattr,		F2FS_MOUNT_INLINE_XATTR,	MO_SET | MO_XATTR},
   245		{Opt_noinline_xattr,		F2FS_MOUNT_INLINE_XATTR,	MO_CLEAR | MO_XATTR},
   246		{Opt_inline_xattr_size, 	0,				MO_SET | MO_XATTR},
   247		{Opt_active_logs, 		0,				MO_ALONE},
   248		{Opt_disable_ext_identify, 	F2FS_MOUNT_DISABLE_EXT_IDENTIFY,
   249										MO_SET},
   250		{Opt_inline_data,		F2FS_MOUNT_INLINE_DATA,		MO_SET},
   251		{Opt_noinline_data,		F2FS_MOUNT_INLINE_DATA,		MO_CLEAR},
   252		{Opt_inline_dentry,		F2FS_MOUNT_INLINE_DENTRY,	MO_SET},
   253		{Opt_noinline_dentry,		F2FS_MOUNT_INLINE_DENTRY,	MO_CLEAR},
   254		{Opt_flush_merge,		F2FS_MOUNT_FLUSH_MERGE,		MO_SET},
   255		{Opt_noflush_merge,		F2FS_MOUNT_FLUSH_MERGE,		MO_CLEAR},
   256		{Opt_barrier,			F2FS_MOUNT_NOBARRIER,		MO_CLEAR},
   257		{Opt_nobarrier,			F2FS_MOUNT_NOBARRIER,		MO_SET},
   258		{Opt_fastboot,			F2FS_MOUNT_FASTBOOT,		MO_SET},
   259		{Opt_extent_cache,		F2FS_MOUNT_READ_EXTENT_CACHE,	MO_SET},
   260		{Opt_noextent_cache,		F2FS_MOUNT_READ_EXTENT_CACHE,	MO_CLEAR},
   261		{Opt_data_flush,		F2FS_MOUNT_DATA_FLUSH,		MO_SET},
   262		{Opt_reserve_root,		F2FS_MOUNT_RESERVE_ROOT,	MO_SET},
   263		{Opt_resgid,			0,				MO_ALONE},
   264		{Opt_resuid,			0,				MO_ALONE},
   265		{Opt_mode,			0,				MO_ENUM},
   266		{Opt_io_size_bits,		0, 				MO_DEPRECATED},
   267		{Opt_fault_injection,		0,				MO_ALONE | MO_FAULT},
   268		{Opt_fault_type,		0,				MO_ALONE | MO_FAULT},
   269		{Opt_lazytime,			0,				MO_ALONE},
   270		{Opt_nolazytime,		0,				MO_ALONE},
   271		{Opt_quota,			F2FS_MOUNT_USRQUOTA,		MO_SET | MO_QUOTA},
   272		{Opt_usrquota,			F2FS_MOUNT_USRQUOTA,		MO_SET | MO_QUOTA},
   273		{Opt_grpquota,			F2FS_MOUNT_GRPQUOTA,		MO_SET | MO_QUOTA},
   274		{Opt_prjquota,			F2FS_MOUNT_PRJQUOTA,		MO_SET | MO_QUOTA},
   275		{Opt_usrjquota,			F2FS_MOUNT_QUOTA,		MO_ALONE | MO_QUOTA},
   276		{Opt_grpjquota,			F2FS_MOUNT_QUOTA,		MO_ALONE | MO_QUOTA},
   277		{Opt_prjjquota,			F2FS_MOUNT_QUOTA,		MO_ALONE | MO_QUOTA},
   278		{Opt_offusrjquota,		F2FS_MOUNT_QUOTA,		MO_ALONE | MO_QUOTA},
   279		{Opt_offgrpjquota,		F2FS_MOUNT_QUOTA,		MO_ALONE | MO_QUOTA},
   280		{Opt_offprjjquota,		F2FS_MOUNT_QUOTA,		MO_ALONE | MO_QUOTA},
   281		{Opt_noquota,			F2FS_MOUNT_QUOTA | F2FS_MOUNT_USRQUOTA |
   282						F2FS_MOUNT_GRPQUOTA | F2FS_MOUNT_PRJQUOTA,
   283										MO_CLEAR | MO_QUOTA},
   284		{Opt_alloc,			0,				MO_ALONE},
   285		{Opt_fsync,			0,				MO_ALONE},
   286		{Opt_test_dummy_encryption,	0,				MO_ALONE},
   287		{Opt_inlinecrypt,		0,				MO_ALONE | MO_INLINECRYPT},
   288		{Opt_checkpoint_disable,	F2FS_MOUNT_DISABLE_CHECKPOINT,	MO_SET},
   289		{Opt_checkpoint_enable,		F2FS_MOUNT_DISABLE_CHECKPOINT,	MO_CLEAR},
   290		{Opt_checkpoint_merge,		F2FS_MOUNT_MERGE_CHECKPOINT,	MO_SET},
   291		{Opt_nocheckpoint_merge,	F2FS_MOUNT_MERGE_CHECKPOINT,	MO_CLEAR},
   292		{Opt_compress_algorithm,	0,				MO_ALONE | MO_COMPR},
   293		{Opt_compress_log_size,		0,				MO_ALONE | MO_COMPR},
   294		{Opt_compress_extension,	0,				MO_ALONE | MO_COMPR},
   295		{Opt_nocompress_extension,	0,				MO_ALONE | MO_COMPR},
   296		{Opt_compress_chksum,		0,				MO_ALONE | MO_COMPR},
   297		{Opt_compress_mode,		0,				MO_ENUM | MO_COMPR},
   298		{Opt_compress_cache,		F2FS_MOUNT_COMPRESS_CACHE,	MO_SET | MO_COMPR},
   299		{Opt_atgc,			F2FS_MOUNT_ATGC,		MO_SET},
   300		{Opt_gc_merge,			F2FS_MOUNT_GC_MERGE,		MO_SET},
   301		{Opt_nogc_merge,		F2FS_MOUNT_GC_MERGE,		MO_CLEAR},
   302		{Opt_discard_unit,		0,				MO_ENUM},
   303		{Opt_memory_mode,		0,				MO_ENUM},
   304		{Opt_age_extent_cache,		F2FS_MOUNT_AGE_EXTENT_CACHE,	MO_SET},
   305		{Opt_errors,			0,				MO_ENUM},
   306		{Opt_err,			0,				0}
   307	};
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
