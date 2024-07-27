Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B416F902
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722089252; cv=none; b=oR+D2ozA69wsnH8os+vww98NJVs0HWBJuUNIqAXnEUq+RNqggXgCvWIt2eEBksyabqDtZOygajSeQCKlf4rvwJRHx4jOFjISZMc08HlIYxDA8X58S3FehKn9chmVyn+ebm8eQ9gPO45avGW03Rpw0MSmvSK30j91yjq4K6pcQ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722089252; c=relaxed/simple;
	bh=mysg1I+YNFznRxOjtG+FqrJItM4XEE4AGZIiWPUfGHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwH/kLoQVg6T/VBDUkvMdoYro29AbQeHtN3vVUKRl5U55u9kS6NjvILQ/JuhRs/22L6AJxfCoA/t8ddFkQrkVN/4ofOxeJX6KxV9uW/JA77O3VkijJJc8NpSvA5tbi4xbT8/ThfS46do0VUq4R+BXmLRoWcKGG/bSzj8HvbUAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DD597cQ7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DD597cQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722089249; x=1753625249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mysg1I+YNFznRxOjtG+FqrJItM4XEE4AGZIiWPUfGHU=;
  b=DD597cQ7TjKxYqQOTME9MTtS+dJwpQg2iGVjQ603fsW46ppnAgDwXnvI
   YxFi+qzuPshB4j9woQFtx0hDbLuJcYysMlcmG7Yo9PTljnKxj0PLi/85M
   VBUDGb0SPDFczD0zQVJHetORNpdwJDwUV5ACoJRcavbBr37F8dLC0hDa/
   t+gM0yLaOfNMWRa9dA93czlQB2OGKicSEJbFgXK34a6DupPWgq+M05Hhu
   apNP/hbY0d7gCxqXa5Jls/hViTdqq6za0uJ5Hd3uhZ54f07+lU5nE0plH
   EZrdDSmi4tub5NnapiUPix9QaaIJ02/LuP1C44AGko/RCOb4ytmb/VCO9
   Q==;
X-CSE-ConnectionGUID: ZR5jEPSOStej5y6kcJOygw==
X-CSE-MsgGUID: StW+HoavTueKq2eEKCVTcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="23630006"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="23630006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 07:07:28 -0700
X-CSE-ConnectionGUID: hI4NqzAuTYe9uNhCVo8iEg==
X-CSE-MsgGUID: y5SSKDvrRmqM2wx9yh4qxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="53528836"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jul 2024 07:07:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXi4z-000pya-1Q;
	Sat, 27 Jul 2024 14:07:25 +0000
Date: Sat, 27 Jul 2024 22:06:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 23/25]
 drivers/iommu/generic_pt/fmt/../pt_defs.h:137:31: error: expected parameter
 declarator
Message-ID: <202407272150.vxNqJopn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   ea5c6d0c8914861c8e337228c4880001bf40f7c4
commit: 37a088a45cd2447e52b2ee9a0950557f394049ff [23/25] iommupt: Add the 64 bit ARMv8 page table format
config: x86_64-randconfig-r053-20240727 (https://download.01.org/0day-ci/archive/20240727/202407272150.vxNqJopn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272150.vxNqJopn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407272150.vxNqJopn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:11:
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:137:31: error: expected parameter declarator
     137 | static inline bool PT_WARN_ON({bool condition)
         |                               ^
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:137:31: error: expected ')'
   drivers/iommu/generic_pt/fmt/../pt_defs.h:137:30: note: to match this '('
     137 | static inline bool PT_WARN_ON({bool condition)
         |                              ^
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:137:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     137 | static inline bool PT_WARN_ON({bool condition)
         |                              ^               
         |                                              void
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
>> drivers/iommu/generic_pt/fmt/armv8.h:277:35: warning: too many arguments in call to 'PT_WARN_ON'
     277 |         PT_WARN_ON(log2_mod(pa, pgsz_lg2));
         |         ~~~~~~~~~~                       ^
>> drivers/iommu/generic_pt/fmt/armv8.h:277:12: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     277 |         PT_WARN_ON(log2_mod(pa, pgsz_lg2));
         |                   ^
   drivers/iommu/generic_pt/fmt/armv8.h:297:56: warning: too many arguments in call to 'PT_WARN_ON'
     297 |                 PT_WARN_ON(pts->index % armv8pt_contig_count_lg2(pts));
         |                 ~~~~~~~~~~                                           ^
   drivers/iommu/generic_pt/fmt/armv8.h:297:13: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     297 |                 PT_WARN_ON(pts->index % armv8pt_contig_count_lg2(pts));
         |                           ^
   drivers/iommu/generic_pt/fmt/armv8.h:298:65: warning: too many arguments in call to 'PT_WARN_ON'
     298 |                 PT_WARN_ON(pgsz_lg2 != isz_lg2 + armv8pt_contig_count_lg2(pts));
         |                 ~~~~~~~~~~                                                    ^
   drivers/iommu/generic_pt/fmt/armv8.h:298:13: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     298 |                 PT_WARN_ON(pgsz_lg2 != isz_lg2 + armv8pt_contig_count_lg2(pts));
         |                           ^
   drivers/iommu/generic_pt/fmt/armv8.h:353:49: warning: too many arguments in call to 'PT_WARN_ON'
     353 |         PT_WARN_ON(log2_mod(pts->index, num_contig_lg2));
         |         ~~~~~~~~~~                                     ^
   drivers/iommu/generic_pt/fmt/armv8.h:353:12: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     353 |         PT_WARN_ON(log2_mod(pts->index, num_contig_lg2));
         |                   ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
--
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:27: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:13:
>> drivers/iommu/generic_pt/fmt/../pt_common.h:281:34: warning: too many arguments in call to 'PT_WARN_ON'
     281 |         if (PT_WARN_ON(!pts->table_lower))
         |             ~~~~~~~~~~                  ^
>> drivers/iommu/generic_pt/fmt/../pt_common.h:281:16: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     281 |         if (PT_WARN_ON(!pts->table_lower))
         |                       ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:338:47: warning: too many arguments in call to 'PT_WARN_ON'
     338 |         if (PT_WARN_ON(!pt_can_have_table(parent_pts)) ||
         |             ~~~~~~~~~~                               ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:338:16: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     338 |         if (PT_WARN_ON(!pt_can_have_table(parent_pts)) ||
         |                       ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:339:55: warning: too many arguments in call to 'PT_WARN_ON'
     339 |             PT_WARN_ON(last_va < va || pt_check_range(&range)) ||
         |             ~~~~~~~~~~                                       ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:339:16: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     339 |             PT_WARN_ON(last_va < va || pt_check_range(&range)) ||
         |                       ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:340:41: warning: too many arguments in call to 'PT_WARN_ON'
     340 |             PT_WARN_ON(!parent_pts->table_lower))
         |             ~~~~~~~~~~                         ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:340:16: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     340 |             PT_WARN_ON(!parent_pts->table_lower))
         |                       ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:15:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:163:16: warning: too many arguments in call to 'PT_WARN_ON'
     163 |         PT_WARN_ON(ret);
         |         ~~~~~~~~~~    ^
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:163:12: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     163 |         PT_WARN_ON(ret);
         |                   ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:267:45: warning: too many arguments in call to 'PT_WARN_ON'
     267 |                         if (PT_WARN_ON(pts.type != PT_ENTRY_EMPTY))
         |                             ~~~~~~~~~~                           ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:267:18: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     267 |                         if (PT_WARN_ON(pts.type != PT_ENTRY_EMPTY))
         |                                       ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:283:51: warning: too many arguments in call to 'PT_WARN_ON'
     283 |                 } else if (PT_WARN_ON(pts.type != PT_ENTRY_TABLE)) {
         |                            ~~~~~~~~~~                           ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:283:24: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     283 |                 } else if (PT_WARN_ON(pts.type != PT_ENTRY_TABLE)) {
         |                                      ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:400:41: warning: too many arguments in call to 'PT_WARN_ON'
     400 |                 if (PT_WARN_ON(pts.type != PT_ENTRY_OA) ||
         |                     ~~~~~~~~~~                        ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:400:17: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     400 |                 if (PT_WARN_ON(pts.type != PT_ENTRY_OA) ||
         |                               ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:401:29: warning: too many arguments in call to 'PT_WARN_ON'
     401 |                     PT_WARN_ON(!pgsize_lg2))
         |                     ~~~~~~~~~~            ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:401:17: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     401 |                     PT_WARN_ON(!pgsize_lg2))
         |                               ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:520:20: warning: too many arguments in call to 'PT_WARN_ON'
     520 |         if (PT_WARN_ON(ret))
         |             ~~~~~~~~~~    ^
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:520:16: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     520 |         if (PT_WARN_ON(ret))
         |                       ^
   63 warnings and 17 errors generated.
--
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:11:
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:137:31: error: expected parameter declarator
     137 | static inline bool PT_WARN_ON({bool condition)
         |                               ^
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:137:31: error: expected ')'
   drivers/iommu/generic_pt/fmt/../pt_defs.h:137:30: note: to match this '('
     137 | static inline bool PT_WARN_ON({bool condition)
         |                              ^
>> drivers/iommu/generic_pt/fmt/../pt_defs.h:137:30: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     137 | static inline bool PT_WARN_ON({bool condition)
         |                              ^               
         |                                              void
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
>> drivers/iommu/generic_pt/fmt/armv8.h:277:35: warning: too many arguments in call to 'PT_WARN_ON'
     277 |         PT_WARN_ON(log2_mod(pa, pgsz_lg2));
         |         ~~~~~~~~~~                       ^
>> drivers/iommu/generic_pt/fmt/armv8.h:277:12: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     277 |         PT_WARN_ON(log2_mod(pa, pgsz_lg2));
         |                   ^
   drivers/iommu/generic_pt/fmt/armv8.h:297:56: warning: too many arguments in call to 'PT_WARN_ON'
     297 |                 PT_WARN_ON(pts->index % armv8pt_contig_count_lg2(pts));
         |                 ~~~~~~~~~~                                           ^
   drivers/iommu/generic_pt/fmt/armv8.h:297:13: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     297 |                 PT_WARN_ON(pts->index % armv8pt_contig_count_lg2(pts));
         |                           ^
   drivers/iommu/generic_pt/fmt/armv8.h:298:65: warning: too many arguments in call to 'PT_WARN_ON'
     298 |                 PT_WARN_ON(pgsz_lg2 != isz_lg2 + armv8pt_contig_count_lg2(pts));
         |                 ~~~~~~~~~~                                                    ^
   drivers/iommu/generic_pt/fmt/armv8.h:298:13: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     298 |                 PT_WARN_ON(pgsz_lg2 != isz_lg2 + armv8pt_contig_count_lg2(pts));
         |                           ^
   drivers/iommu/generic_pt/fmt/armv8.h:353:49: warning: too many arguments in call to 'PT_WARN_ON'
     353 |         PT_WARN_ON(log2_mod(pts->index, num_contig_lg2));
         |         ~~~~~~~~~~                                     ^
   drivers/iommu/generic_pt/fmt/armv8.h:353:12: error: passing arguments to 'PT_WARN_ON' without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     353 |         PT_WARN_ON(log2_mod(pts->index, num_contig_lg2));
         |                   ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
   In file included from drivers/iommu/generic_pt/fmt/armv8.h:436:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
..


vim +137 drivers/iommu/generic_pt/fmt/../pt_defs.h

238517582c3f63 Jason Gunthorpe 2024-06-28  129  
238517582c3f63 Jason Gunthorpe 2024-06-28  130  /*
238517582c3f63 Jason Gunthorpe 2024-06-28  131   * PT_WARN_ON is used for invariants that the kunit should be checking can't
238517582c3f63 Jason Gunthorpe 2024-06-28  132   * happen.
238517582c3f63 Jason Gunthorpe 2024-06-28  133   */
238517582c3f63 Jason Gunthorpe 2024-06-28  134  #if IS_ENABLED(CONFIG_DEBUG_GENERIC_PT)
238517582c3f63 Jason Gunthorpe 2024-06-28  135  #define PT_WARN_ON WARN_ON
238517582c3f63 Jason Gunthorpe 2024-06-28  136  #else
238517582c3f63 Jason Gunthorpe 2024-06-28 @137  static inline bool PT_WARN_ON({bool condition)
238517582c3f63 Jason Gunthorpe 2024-06-28  138  {
238517582c3f63 Jason Gunthorpe 2024-06-28  139  	return false;
238517582c3f63 Jason Gunthorpe 2024-06-28  140  }
238517582c3f63 Jason Gunthorpe 2024-06-28  141  #endif
238517582c3f63 Jason Gunthorpe 2024-06-28  142  

:::::: The code at line 137 was first introduced by commit
:::::: 238517582c3f6345ebaf2eecc116501f67de8d7c genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
