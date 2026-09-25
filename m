Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C93477981
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330866; cv=none; b=tgJIrkAg7KSVkj7Cx5dAaMk+efT4+yhwzB5QMPMTZo8RMtJDxY0rnHx/k56UllO8KjQEimS0w1y/YojuVFPXaWc3iCQGComvNfdxdwZSMVq87pY753j3hoO6Tm6qgEnum7qQvWQ+HSAYBc8gG+aZpLy64fQBw4oSz8DM4BB3Ryg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330866; c=relaxed/simple;
	bh=uRiSOSBUz3eAFSpX2wh1/s2MRRtpmEGhAso2B9joDKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V2oEXiROVnKOqWx0mZFRsrFqmb92/+672GlxIiowcoYH8Je1FrJa6udFiduySpMqUKBCUSh5XMPntFQJxJLctir6J29eQ86ZHnQNP/xyW2rvV1GuJiBaiwEeVBpHcUZ7NzfgXyzp71mn1u/2E6y7jXGQ9FYeZ4Kh+RvNtGAyvRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkVxL8ED; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkVxL8ED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790330864; x=1821866864;
  h=date:from:to:cc:subject:message-id;
  bh=uRiSOSBUz3eAFSpX2wh1/s2MRRtpmEGhAso2B9joDKs=;
  b=MkVxL8ED7O1S/ftJHBljyVnC4rZ41kGL+MIKrwpOq5kBtxs0pIexv9Z1
   k3dw1mk4oxyPMoWnpsKSgETkCh0MyKbvF0eappX4700cW4CLVxGe1Pq67
   nj2ezj6r7hD/+O6V3eddPeic+mTAoW48WV5S1EgevHbKmWphcMQUmw37d
   kdj6NXGZVwgabo+F+7xEUf6Fg7SRa5iQc7lMIu5OnjlUNSkL+bshwMfjU
   izvDBjPVhyqFmehcS2tpAYfMdE0Fyr8PKZhaGKJAN4DY2KOmaQq/Qd41j
   cwCk0rgjlomEkd8SnQPkWKAuDT40xgPpNMOONoSxz/vO4CfgmyWCmzqrP
   g==;
X-CSE-ConnectionGUID: v8+KNQ7ySVGKPwrBbud1Vw==
X-CSE-MsgGUID: 9oskEat5QPqNMg7IRaqDFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101641080"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101641080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:07:41 -0700
X-CSE-ConnectionGUID: qnGsC4gtQBa6g9djoz0ASA==
X-CSE-MsgGUID: SMabCklgTBSjtJ9MN79F5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="270771421"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2026 03:07:39 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA2q9-000000000g8-1nHB;
	Fri, 25 Sep 2026 10:07:37 +0000
Date: Fri, 25 Sep 2026 12:07:09 +0200
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6102/7200]
 include/linux/mmzone.h:1160:29: error: use of undeclared identifier
 'PUD_SHIFT'
Message-ID: <202609251257.WwH2kzxF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 83c71ba4895fcfd11ec4746d0ef1585c70deb325 [6102/7200] mm/sparse-vmemmap: factor out shared vmemmap tail page allocation
config: riscv-randconfig-r2106-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251257.WwH2kzxF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251257.WwH2kzxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251257.WwH2kzxF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:8:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1160:29: error: use of undeclared identifier 'PUD_SHIFT'
    1160 |         struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
         |                                    ^
   include/linux/mmzone.h:119:4: note: expanded from macro 'VMEMMAP_OPTIMIZATION_NR_ORDERS'
     119 |         ((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 &&       \
         |           ^
   include/linux/mmzone.h:117:3: note: expanded from macro '__VMEMMAP_OPTIMIZATION_NR_ORDERS'
     117 |         (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
         |          ^
   include/linux/mmzone.h:94:27: note: expanded from macro 'MAX_FOLIO_ORDER'
      94 | #define MAX_FOLIO_ORDER         (PUD_SHIFT - PAGE_SHIFT)
         |                                  ^
>> include/linux/mmzone.h:1160:29: error: use of undeclared identifier 'PUD_SHIFT'
   include/linux/mmzone.h:120:57: note: expanded from macro 'VMEMMAP_OPTIMIZATION_NR_ORDERS'
     120 |           IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION)) ? __VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
         |                                                                ^
   include/linux/mmzone.h:117:3: note: expanded from macro '__VMEMMAP_OPTIMIZATION_NR_ORDERS'
     117 |         (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
         |          ^
   include/linux/mmzone.h:94:27: note: expanded from macro 'MAX_FOLIO_ORDER'
      94 | #define MAX_FOLIO_ORDER         (PUD_SHIFT - PAGE_SHIFT)
         |                                  ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:9:


vim +/PUD_SHIFT +1160 include/linux/mmzone.h

3484b2de9499df Mel Gorman             2014-08-06  1152  
7cf91a98e607c2 Joonsoo Kim            2016-03-15  1153  	bool			contiguous;
7cf91a98e607c2 Joonsoo Kim            2016-03-15  1154  
e6ad640bc404eb Shakeel Butt           2022-08-26  1155  	CACHELINE_PADDING(_pad3_);
3484b2de9499df Mel Gorman             2014-08-06  1156  	/* Zone statistics */
3484b2de9499df Mel Gorman             2014-08-06  1157  	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
f19298b9516c1a Mel Gorman             2021-06-28  1158  	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
83c71ba4895fcf Muchun Song            2026-09-11  1159  #ifdef CONFIG_SPARSEMEM_VMEMMAP
e1b6218149da3f Muchun Song            2026-09-10 @1160  	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
622026e87c4019 Kiryl Shutsemau        2026-02-27  1161  #endif
22fc6eccbf4ce4 Ravikiran G Thirumalai 2006-01-08  1162  } ____cacheline_internodealigned_in_smp;
^1da177e4c3f41 Linus Torvalds         2005-04-16  1163  

:::::: The code at line 1160 was first introduced by commit
:::::: e1b6218149da3f0eef54e9466e3b31ec47d3c991 mm/sparse-vmemmap: rename HVO order macros

:::::: TO: Muchun Song <songmuchun@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
