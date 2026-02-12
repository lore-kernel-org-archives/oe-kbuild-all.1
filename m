Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99994224D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770938379; cv=none; b=YI21HLT6UyDOFt8NxpM2lYeIVZhFPlByihOzZ0xfeBjw2VUpz+L49RQrFPC/CgZ5wsLSLE29l/sqyKuK+w1Xrys1hXqtpnVp2h8/Gm5yY6k1zEVInD3J6LUehgFNTtvlwB9rzNmUzNG9RAdjE4kt8FQ4Z65Ro4NljpPZu6Vioj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770938379; c=relaxed/simple;
	bh=Ej8GLc20662j7BjknqsYDbqdMSX10qxjiWpye9yZgDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yd7leiE9LpyE6zOVLl9Cdi8Kh8J9TvSDlHESX2Mxj07PAEuRiNozWdOpfZYeilrurVZ3w0CeyiF6qC2i/sxnEXMADka5MrBtTW2TKKQtB6zJEMMla7KnQp15H9w49ixk9CgfITH2z2vzyXWh4caUU3pYHWp6lnnKMrGs9lACLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtX48zps; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtX48zps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770938377; x=1802474377;
  h=date:from:to:cc:subject:message-id;
  bh=Ej8GLc20662j7BjknqsYDbqdMSX10qxjiWpye9yZgDw=;
  b=WtX48zpsTaT2MzGXlc6Kn0UEqqWY4udGQYTTZLBz71mwRkXraPKzw3NW
   TL9a4SLN9dTidjewVQEqlnnuBe8UidgLFt0u/ozEOPeYja6Gd+gi2ikRf
   EYAWkPoxs2yf+GJg5Nd3Sl2DEKr5xeiGQc2bPuIeb5o34E6qbmXG9/f8k
   IxGXtNd0+ngDREPX9xL5gqvgQoI7mzAWk1aml71tlw7hK5Zu8M1d8iXRT
   i6rmtordOUd7TE3t8mcuNPU0XuHygSdXkx2a2MdBM/Mh5Xz+fHti7xUuD
   zB2sn7vwo2WakKEF2T8Sr4toMEie6i2cMQkKB7Kl9A4jOa5EUwPx3uZHK
   Q==;
X-CSE-ConnectionGUID: gE0Ua02yRsOfUVjs936y8g==
X-CSE-MsgGUID: OR8c8mjdTICzrifeu1+yzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72028689"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72028689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 15:19:33 -0800
X-CSE-ConnectionGUID: ATeNVYkmQtOcFsZ3tCj6Hg==
X-CSE-MsgGUID: LyvpHklORqWMwj48E0ZwbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="243349265"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Feb 2026 15:19:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqfy5-00000000u1o-0cvg;
	Thu, 12 Feb 2026 23:19:29 +0000
Date: Fri, 13 Feb 2026 07:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202602130735.S8U2i7yg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   381e953b46044769038aaae1649b66fa6cb55011
commit: 381e953b46044769038aaae1649b66fa6cb55011 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: parisc-randconfig-r121-20260213 (https://download.01.org/0day-ci/archive/20260213/202602130735.S8U2i7yg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130735.S8U2i7yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130735.S8U2i7yg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1450:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted vm_fault_t [usertype] ret @@
   include/trace/events/f2fs.h:1450:1: sparse:     expected unsigned long flags
   include/trace/events/f2fs.h:1450:1: sparse:     got restricted vm_fault_t [usertype] ret
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
>> include/trace/events/f2fs.h:1163:1: sparse: sparse: cast to restricted blk_opf_t
>> include/trace/events/f2fs.h:1163:1: sparse: sparse: restricted blk_opf_t degrades to integer
>> include/trace/events/f2fs.h:1163:1: sparse: sparse: restricted blk_opf_t degrades to integer
>> include/trace/events/f2fs.h:1163:1: sparse: sparse: cast to restricted blk_opf_t
>> include/trace/events/f2fs.h:1163:1: sparse: sparse: restricted blk_opf_t degrades to integer
>> include/trace/events/f2fs.h:1163:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1222:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1222:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1222:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1222:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1222:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1222:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1450:1: sparse: sparse: cast to restricted vm_fault_t
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: restricted vm_fault_t degrades to integer
>> include/trace/events/f2fs.h:1450:1: sparse: sparse: restricted vm_fault_t degrades to integer
   fs/f2fs/super.c: note: in included file (through include/linux/atomic.h, arch/parisc/include/asm/bitops.h, include/linux/bitops.h, ...):
   arch/parisc/include/asm/atomic.h:118:1: sparse: sparse: context imbalance in 'f2fs_drop_inode' - unexpected unlock

vim +1450 include/trace/events/f2fs.h

2f3a9ae990a7881 Chao Yu 2023-01-09  1449  
87f3afd366f7c66 Chao Yu 2023-12-10 @1450  DECLARE_EVENT_CLASS(f2fs_mmap,
d764834378a9870 Chao Yu 2019-04-15  1451  
87f3afd366f7c66 Chao Yu 2023-12-10  1452  	TP_PROTO(struct inode *inode, pgoff_t index,
87f3afd366f7c66 Chao Yu 2023-12-10  1453  			vm_flags_t flags, vm_fault_t ret),
d764834378a9870 Chao Yu 2019-04-15  1454  
87f3afd366f7c66 Chao Yu 2023-12-10  1455  	TP_ARGS(inode, index, flags, ret),
d764834378a9870 Chao Yu 2019-04-15  1456  
d764834378a9870 Chao Yu 2019-04-15  1457  	TP_STRUCT__entry(
d764834378a9870 Chao Yu 2019-04-15  1458  		__field(dev_t,	dev)
d764834378a9870 Chao Yu 2019-04-15  1459  		__field(ino_t,	ino)
d764834378a9870 Chao Yu 2019-04-15  1460  		__field(pgoff_t, index)
87f3afd366f7c66 Chao Yu 2023-12-10  1461  		__field(vm_flags_t, flags)
87f3afd366f7c66 Chao Yu 2023-12-10  1462  		__field(vm_fault_t, ret)
d764834378a9870 Chao Yu 2019-04-15  1463  	),
d764834378a9870 Chao Yu 2019-04-15  1464  
d764834378a9870 Chao Yu 2019-04-15  1465  	TP_fast_assign(
d764834378a9870 Chao Yu 2019-04-15  1466  		__entry->dev	= inode->i_sb->s_dev;
d764834378a9870 Chao Yu 2019-04-15  1467  		__entry->ino	= inode->i_ino;
d764834378a9870 Chao Yu 2019-04-15  1468  		__entry->index	= index;
87f3afd366f7c66 Chao Yu 2023-12-10  1469  		__entry->flags	= flags;
d764834378a9870 Chao Yu 2019-04-15  1470  		__entry->ret	= ret;
d764834378a9870 Chao Yu 2019-04-15  1471  	),
d764834378a9870 Chao Yu 2019-04-15  1472  
87f3afd366f7c66 Chao Yu 2023-12-10  1473  	TP_printk("dev = (%d,%d), ino = %lu, index = %lu, flags: %s, ret: %s",
d764834378a9870 Chao Yu 2019-04-15  1474  		show_dev_ino(__entry),
d764834378a9870 Chao Yu 2019-04-15  1475  		(unsigned long)__entry->index,
87f3afd366f7c66 Chao Yu 2023-12-10  1476  		__print_flags(__entry->flags, "|", FAULT_FLAG_TRACE),
87f3afd366f7c66 Chao Yu 2023-12-10  1477  		__print_flags(__entry->ret, "|", VM_FAULT_RESULT_TRACE))
87f3afd366f7c66 Chao Yu 2023-12-10  1478  );
87f3afd366f7c66 Chao Yu 2023-12-10  1479  

:::::: The code at line 1450 was first introduced by commit
:::::: 87f3afd366f7c668be0269efda8a89741a3ea6b3 f2fs: add tracepoint for f2fs_vm_page_mkwrite()

:::::: TO: Chao Yu <chao@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
