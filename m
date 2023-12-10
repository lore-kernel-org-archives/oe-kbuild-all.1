Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D5636
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDcmaj6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702235465; x=1733771465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZSVYp2YqSIA2Rt4vXtP0fy2XUC8HLJn1ZFQ4QxNJgPU=;
  b=KDcmaj6SxRsctYwtnQlWIDGyieq5vh1txHGbSCeUkOVD3nn3J6p2TZLs
   TuillPx39vaUKV77YtrA0jBpgqdmmN2IVyrToXX+y7QjIbponpuOZfpfs
   z5Sr9qCEXnHJxlHdc70w56biDeWI0voFUPEYF3YBYHak1aaGEtSehz6mW
   SSo+CHtB+VGlwr/4Zxw+aFFT70FjXI4o/Vywmh4Q4pfIR04vAv4K72a7h
   osx4MMvghXwioHI/ryKjTFqS/j6vO9jM2lZjeZoGHM2jclr9Ar3AEFbGS
   vWBGIk3rezc08WFV/2NTmflh+kPiPB4U+QyTyK4kabvyLvpsC7OqukqW+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1381701"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1381701"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 11:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722494741"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="722494741"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Dec 2023 11:11:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCPCe-000HCM-2X;
	Sun, 10 Dec 2023 19:11:00 +0000
Date: Mon, 11 Dec 2023 03:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/6] f2fs: add tracepoint for f2fs_vm_page_mkwrite()
Message-ID: <202312110238.4bSkMypC-lkp@intel.com>
References: <20231210092040.3374741-6-chao@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210092040.3374741-6-chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.7-rc4 next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-delete-obsolete-FI_DROP_CACHE/20231210-173004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20231210092040.3374741-6-chao%40kernel.org
patch subject: [PATCH 6/6] f2fs: add tracepoint for f2fs_vm_page_mkwrite()
config: x86_64-randconfig-122-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110238.4bSkMypC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110238.4bSkMypC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110238.4bSkMypC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted vm_fault_t [usertype] ret @@
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
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: cast to restricted vm_fault_t
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: restricted vm_fault_t degrades to integer
>> include/trace/events/f2fs.h:1409:1: sparse: sparse: restricted vm_fault_t degrades to integer
   fs/f2fs/super.c:1499:35: sparse: sparse: context imbalance in 'f2fs_drop_inode' - unexpected unlock

vim +1409 include/trace/events/f2fs.h

  1408	
> 1409	DECLARE_EVENT_CLASS(f2fs_mmap,
  1410	
  1411		TP_PROTO(struct inode *inode, pgoff_t index,
  1412				vm_flags_t flags, vm_fault_t ret),
  1413	
  1414		TP_ARGS(inode, index, flags, ret),
  1415	
  1416		TP_STRUCT__entry(
  1417			__field(dev_t,	dev)
  1418			__field(ino_t,	ino)
  1419			__field(pgoff_t, index)
  1420			__field(vm_flags_t, flags)
  1421			__field(vm_fault_t, ret)
  1422		),
  1423	
  1424		TP_fast_assign(
  1425			__entry->dev	= inode->i_sb->s_dev;
  1426			__entry->ino	= inode->i_ino;
  1427			__entry->index	= index;
  1428			__entry->flags	= flags;
  1429			__entry->ret	= ret;
  1430		),
  1431	
  1432		TP_printk("dev = (%d,%d), ino = %lu, index = %lu, flags: %s, ret: %s",
  1433			show_dev_ino(__entry),
  1434			(unsigned long)__entry->index,
  1435			__print_flags(__entry->flags, "|", FAULT_FLAG_TRACE),
  1436			__print_flags(__entry->ret, "|", VM_FAULT_RESULT_TRACE))
  1437	);
  1438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
