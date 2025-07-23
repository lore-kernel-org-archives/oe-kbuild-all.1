Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A5282E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753239500; cv=none; b=ucNm5oQDQUJT4DaBXAvZd0PNR7y4dRmypSvPQ3423mjAYkR3mcm+sUCRECbalipmAYPX5e8dyyyuxCCUva19BrUAE+GWfhzYp1imSno9K+egty+YXR1p+H8cd/OnJ8biIK2c+40qr0pwApwn4eDz3Y2+ce+7xAjHk/R+DtI+DZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753239500; c=relaxed/simple;
	bh=+hXvsOFtbM7m+4g+q6nNqxfK9OuvaTi0DkNzkCSuC58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTGxSXFA8X3WWZp2JaoInVhqrXB/a8siJxaZ9rWryVMyAWEUwyTIFikRFoKBWDFF5szLayXWTV1p8WgbawMz59Hmb4iyTbQBHod9/38iux5cxgN6ks9aKjYS72TcoC3XqMZ4j9DtQ40LxViAQgwfL3j2R910v20WNITIsCR/01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OO0odkgP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OO0odkgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753239498; x=1784775498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hXvsOFtbM7m+4g+q6nNqxfK9OuvaTi0DkNzkCSuC58=;
  b=OO0odkgPk25VyEsvcND+oRDnOfjGr6G93bmDCUqVq7+ViTyMQjsUlBn1
   nmnWLZMyBncUPxRM9ph8tUCpNR/djqwT/GT6RNeCCkwtE/Q2PcHYhuVW2
   9YqOYNthJ7EL+Ivzdgnxw15quprsp0ZcDu575YWehHsM9YtKMlrMbasS+
   CsK/opVEo3PKldZe7ZOZPpSC/1ruTxjkiuEOzgKI/ndaqQW4gQAthZZOA
   BS49cg4V0OiT2BkVE8WQEUVOYx1U6/CK4vUyXnVSMKjeXAskY2iW5Y/sI
   3E0nogff2uLDzq0ezEwqAGZaeOyQJ+HGtOb3pb0XriMWrGyDL9xvcgsDP
   A==;
X-CSE-ConnectionGUID: LBwg83X7R8W5NZnq/VFl7A==
X-CSE-MsgGUID: 5tW5B6khQUiNMoZJlBbMdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55603929"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55603929"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 19:58:17 -0700
X-CSE-ConnectionGUID: sGIOmaT3S/6rC5RwoKnXfg==
X-CSE-MsgGUID: OlZ6IxVQRxujA6jD3xbh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163542670"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2025 19:58:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uePgM-000Iu3-0j;
	Wed, 23 Jul 2025 02:58:14 +0000
Date: Wed, 23 Jul 2025 10:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 14/14]
 include/linux/page-flags-layout.h:106:2: error: "Not enough bits in page
 flags"
Message-ID: <202507231019.Q4rgFyfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   be350eab93035f0a83e107ce73e1687e39a04206
commit: c1ff6dcf209e4abc23584d2cd117f725421bccac [14/14] FROMLIST: BACKPORT: THP zones: the use cases of policy zones
config: arm-randconfig-004-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231019.Q4rgFyfj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231019.Q4rgFyfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231019.Q4rgFyfj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
>> include/linux/page-flags-layout.h:106:2: error: "Not enough bits in page flags"
     106 | #error "Not enough bits in page flags"
         |  ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1098:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:


vim +106 include/linux/page-flags-layout.h

bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  103  
ec1c86b25f4bdd Yu Zhao        2022-09-18  104  #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
ec1c86b25f4bdd Yu Zhao        2022-09-18  105  	KASAN_TAG_WIDTH + LAST_CPUPID_WIDTH > BITS_PER_LONG - NR_PAGEFLAGS
1587db62d8c0db Yu Zhao        2021-04-29 @106  #error "Not enough bits in page flags"
75980e97daccfc Peter Zijlstra 2013-02-22  107  #endif
75980e97daccfc Peter Zijlstra 2013-02-22  108  

:::::: The code at line 106 was first introduced by commit
:::::: 1587db62d8c0dbd943752f657b452213e1c4d8d4 include/linux/page-flags-layout.h: cleanups

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
