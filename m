Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AC184F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745042219; cv=none; b=Iv8uqdsZa7kPGjzxT3neyWbSeWhtyXwiZhermcRNHwyHzBOEnpygeBFn9o23XsNkUoT7cGVmztOvjA7gbNsDUSW977vpeHpjTngQrrCOhGDoBbY7DN6r1hqxgQoio3yRQtGu3mI55vP/pbRZnK7ZlTBGI+xroPiWSqloitayp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745042219; c=relaxed/simple;
	bh=7AZwgecb6fYAukzfPzJ9G5aAd8nnT+NQpw1YF6yobHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hb62tiM4jouDyacEWXT351RxwAw/mgijDagSLuRkBlZomXcSNuyWl44ymfgQzqkdJjmkFyuVkN7vu8JZ1D5854IoFyWD5PKTO0mp2MQE3FbTvKf04K7z8FBT229VJEeEI55gOVEyRSWcP+GTjjE4xCejy9ApJ25qpWWcxcFbptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpCUjXIU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpCUjXIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745042218; x=1776578218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7AZwgecb6fYAukzfPzJ9G5aAd8nnT+NQpw1YF6yobHo=;
  b=hpCUjXIUwMboCX8mxx6Os2Pjl8ncTx7Eh8iQeCqZuYbcOwA/1EJ5yQ58
   d+QaIgbcqfkU/DmEHaKViR1x5FfYJ3gjspuCL486jzHdGi1G5dMiXmWP5
   ukDcJg9nDQre7qwZ8Nfhtt3+LgHsumelgOAuSQYg9lgdMtCZsnA17N62X
   hcgeIGzny8JIbqleLEKQTo5nWFXmKGm+8z2pHqvFzzz1iWv9J/+rNp8ow
   9Xry/T+oFtM+luHdY9UDwxlRubE6II/F2MZPFK1oqq664nBprsaEbU9Rp
   GNdlkhLAZpTIG5tubTneqepXafaQ1UNP0xf3T14Q25Gi8Xic8FlNiFXBn
   A==;
X-CSE-ConnectionGUID: DRyHlp2MQDGz3g/S2r4U0g==
X-CSE-MsgGUID: L2oihGRmQda20yX35UcgqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="69158781"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="69158781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 22:56:57 -0700
X-CSE-ConnectionGUID: S7h395hCS0ifCMnUhcWC3g==
X-CSE-MsgGUID: hr0j9ymAQXShQtFDbmzy0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="136452247"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Apr 2025 22:56:55 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u61C8-0003dl-30;
	Sat, 19 Apr 2025 05:56:52 +0000
Date: Sat, 19 Apr 2025 13:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 4/5] include/linux/swap.h:629:1:
 warning: control reaches end of non-void function
Message-ID: <202504191314.VaTsnEfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_vmscan_cpuset
head:   ab08f1fb55da40874056e9837889a33a370c7320
commit: ab06ad7784db1176c78376949565862b951ad1c7 [4/5] memcontrol: remove cgroup indirection from cpuset_node_allowed
config: arc-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191314.VaTsnEfb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191314.VaTsnEfb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191314.VaTsnEfb-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                               ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:628:16: note: in expansion of macro 'READ_ONCE'
     628 |         return READ_ONCE(memcg->swappiness);
         |                ^~~~~~~~~
   include/linux/swap.h:628:31: error: invalid use of undefined type 'struct mem_cgroup'
     628 |         return READ_ONCE(memcg->swappiness);
         |                               ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:628:16: note: in expansion of macro 'READ_ONCE'
     628 |         return READ_ONCE(memcg->swappiness);
         |                ^~~~~~~~~
   include/linux/swap.h:628:31: error: invalid use of undefined type 'struct mem_cgroup'
     628 |         return READ_ONCE(memcg->swappiness);
         |                               ^~
   include/linux/compiler_types.h:522:23: note: in definition of macro '__compiletime_assert'
     522 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:628:16: note: in expansion of macro 'READ_ONCE'
     628 |         return READ_ONCE(memcg->swappiness);
         |                ^~~~~~~~~
   include/linux/swap.h:628:31: error: invalid use of undefined type 'struct mem_cgroup'
     628 |         return READ_ONCE(memcg->swappiness);
         |                               ^~
   include/linux/compiler_types.h:498:27: note: in definition of macro '__unqual_scalar_typeof'
     498 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/swap.h:628:16: note: in expansion of macro 'READ_ONCE'
     628 |         return READ_ONCE(memcg->swappiness);
         |                ^~~~~~~~~
   In file included from ./arch/arc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:364,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/cgroup-defs.h:12,
                    from mm/memcontrol.c:28:
   include/linux/swap.h:628:31: error: invalid use of undefined type 'struct mem_cgroup'
     628 |         return READ_ONCE(memcg->swappiness);
         |                               ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/swap.h:628:16: note: in expansion of macro 'READ_ONCE'
     628 |         return READ_ONCE(memcg->swappiness);
         |                ^~~~~~~~~
   include/linux/memcontrol.h: At top level:
   include/linux/memcontrol.h:527:20: error: conflicting types for 'mem_cgroup_is_root'; have 'bool(struct mem_cgroup *)' {aka '_Bool(struct mem_cgroup *)'}
     527 | static inline bool mem_cgroup_is_root(struct mem_cgroup *memcg)
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/swap.h:625:38: note: previous implicit declaration of 'mem_cgroup_is_root' with type 'int()'
     625 |         if (mem_cgroup_disabled() || mem_cgroup_is_root(memcg))
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:532:20: error: conflicting types for 'mem_cgroup_disabled'; have 'bool(void)' {aka '_Bool(void)'}
     532 | static inline bool mem_cgroup_disabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:625:13: note: previous implicit declaration of 'mem_cgroup_disabled' with type 'int()'
     625 |         if (mem_cgroup_disabled() || mem_cgroup_is_root(memcg))
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/swap.h: In function 'mem_cgroup_swappiness':
>> include/linux/swap.h:629:1: warning: control reaches end of non-void function [-Wreturn-type]
     629 | }
         | ^
--
   In file included from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from include/linux/memcontrol.h:14,
                    from include/linux/swap.h:9,
                    from include/asm-generic/tlb.h:15,
                    from arch/arc/include/asm/tlb.h:10,
                    from mm/maccess.c:8:
   arch/arc/include/asm/mmu_context.h: In function 'get_new_mmu_context':
   arch/arc/include/asm/mmu_context.h:82:17: error: implicit declaration of function 'local_flush_tlb_all' [-Wimplicit-function-declaration]
      82 |                 local_flush_tlb_all();
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/tlb.h:17:
   arch/arc/include/asm/tlbflush.h: At top level:
>> arch/arc/include/asm/tlbflush.h:11:6: warning: conflicting types for 'local_flush_tlb_all'; have 'void(void)'
      11 | void local_flush_tlb_all(void);
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/mmu_context.h:82:17: note: previous implicit declaration of 'local_flush_tlb_all' with type 'void(void)'
      82 |                 local_flush_tlb_all();
         |                 ^~~~~~~~~~~~~~~~~~~


vim +629 include/linux/swap.h

54f7a49c20ebb5 Barry Song       2024-05-29  616  
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  617  #ifdef CONFIG_MEMCG
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  618  static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  619  {
4550c4e157ca3d Johannes Weiner  2016-05-05  620  	/* Cgroup2 doesn't have per-cgroup swappiness */
4550c4e157ca3d Johannes Weiner  2016-05-05  621  	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
82b3aa2681ca92 Yue Zhao         2023-03-06  622  		return READ_ONCE(vm_swappiness);
4550c4e157ca3d Johannes Weiner  2016-05-05  623  
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  624  	/* root ? */
59118c42a60b99 Yang Shi         2019-03-05  625  	if (mem_cgroup_disabled() || mem_cgroup_is_root(memcg))
82b3aa2681ca92 Yue Zhao         2023-03-06  626  		return READ_ONCE(vm_swappiness);
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  627  
82b3aa2681ca92 Yue Zhao         2023-03-06  628  	return READ_ONCE(memcg->swappiness);
6f2cb2f17700a3 Vladimir Davydov 2016-01-20 @629  }
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  630  #else
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  631  static inline int mem_cgroup_swappiness(struct mem_cgroup *mem)
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  632  {
82b3aa2681ca92 Yue Zhao         2023-03-06  633  	return READ_ONCE(vm_swappiness);
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  634  }
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  635  #endif
6f2cb2f17700a3 Vladimir Davydov 2016-01-20  636  

:::::: The code at line 629 was first introduced by commit
:::::: 6f2cb2f17700a39567cf3e9a2e95041def5f3688 swap.h: move memcg related stuff to the end of the file

:::::: TO: Vladimir Davydov <vdavydov@virtuozzo.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
