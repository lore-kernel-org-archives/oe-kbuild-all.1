Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EEA161
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714438065; cv=none; b=kDnwP39MuoCH7LcWXknWIRSfQhtzqavs/YLvuSeI2J19fwm2gks1ByL7+nTO0pB8kXz1TO5qkZ3zXBPVCSk6kAaDxxyB0ybFgtai2SHujRUADNBDtnTlAyRi82TtTs5fFdRLUq2i85zNUgA10zr9AltVabPeqid1MaGfx0giQ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714438065; c=relaxed/simple;
	bh=rtdL7i2ju3xezwwgj21favRvGFeJ/iH6YqwpqVsjBD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7dP2esMwKrw0ZXETBfZBAk4RHQPOMI2m6GOsu8Bpa1iCPjHMySyT7hTH/jrcwxxMp/C1UpmBpkkHbvwdsJQemHNUwb+6WCC4oBa8MoPEB0aR7TI6v5f3Ajo9G5DJELEnX1i9S5w3abORsLclrH7E2nXUabVoiZpTMTm7eKHp6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRf3w96T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRf3w96T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714438064; x=1745974064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtdL7i2ju3xezwwgj21favRvGFeJ/iH6YqwpqVsjBD4=;
  b=HRf3w96TgTpnmhDy2eg5OA9XHhEg9Gs+V9dqJGAaUvoz6MQ1qpyIZk+G
   rT5p/NRCzYQgxJy29CVJfX75tVVePqMZravzAFP3oaktqdeS1bo/UU8q/
   f0xG0dsiXj/MO3hUSdB4QzAzaRB32s/1v7VsDjXJhJProSDXrNM7XiQOq
   25QMYta8nFvHYaD5KgJQEtlge92PrySclZZCwDlk/iQ9QHuknC8kl2P/9
   ZdNHoMLAMnu1vnwrq8cKNYBmio9z6gcQIRy9f/Q47y1Amkupg66k3ImXa
   /311uW63FXOgPbY31M12ja/6m6NvpqJQb7hj9C4SOTZ9Nj7ymxPAgqT/b
   w==;
X-CSE-ConnectionGUID: MNEWiugMRruFJ9+Gbb4EQg==
X-CSE-MsgGUID: /Wi+hHEuSH29r+RCPyrLZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10658730"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10658730"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:47:43 -0700
X-CSE-ConnectionGUID: kLzMV2TJRYyon8olprNw3A==
X-CSE-MsgGUID: PeBmCvakQOGnoxIUZ63k9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31080261"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 17:47:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1bel-0007Yw-1V;
	Tue, 30 Apr 2024 00:47:39 +0000
Date: Tue, 30 Apr 2024 08:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 5/7] include/linux/page_counter.h:20:1:
 error: unknown type name 'define'
Message-ID: <202404300847.ldO30ZB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   74f3bba65f60c295d6ea14d848aaefed4a70c397
commit: 527af2b8159ca031e267813637bebe68bc14875a [5/7] mm: memcg: merge multiple page_counters into a single structure
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240430/202404300847.ldO30ZB8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300847.ldO30ZB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300847.ldO30ZB8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:20:1: error: unknown type name 'define'
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         | ^
>> include/linux/page_counter.h:20:27: error: expected ')'
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                           ^
   arch/riscv/include/asm/pgtable-64.h:110:27: note: expanded from macro 'HUGE_MAX_HSTATE'
     110 | #define HUGE_MAX_HSTATE         (2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
         |                                  ^
   include/linux/page_counter.h:20:27: note: to match this '('
   arch/riscv/include/asm/pgtable-64.h:110:26: note: expanded from macro 'HUGE_MAX_HSTATE'
     110 | #define HUGE_MAX_HSTATE         (2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
         |                                 ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:20:27: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                           ^
         |                           int
   arch/riscv/include/asm/pgtable-64.h:110:27: note: expanded from macro 'HUGE_MAX_HSTATE'
     110 | #define HUGE_MAX_HSTATE         (2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
         |                                  ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:43: error: expected ')'
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                                           ^
   include/linux/page_counter.h:20:26: note: to match this '('
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^
>> include/linux/page_counter.h:20:51: error: expected ';' after top level declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                                                   ^
         |                                                   ;
   1 warning and 5 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/define +20 include/linux/page_counter.h

     9	
    10	/*
    11	 * Page counters are used by memory and hugetlb cgroups.
    12	 * Memory cgroups are using up to 4 separate counters:
    13	 * memory, swap (memory + swap on cgroup v1), kmem and tcpmem.
    14	 * Hugetlb cgroups are using 2 * HUGE_MAX_HSTATE separate
    15	 * counters: for tracking the usage and reservations of each
    16	 * supported hugepage size.
    17	 */
    18	
    19	#ifdef CONFIG_CGROUP_HUGETLB
  > 20	define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
    21	#endif /* CONFIG_CGROUP_HUGETLB */
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
