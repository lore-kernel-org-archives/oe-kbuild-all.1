Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6723BD17
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833088; cv=none; b=MzH/zZCaj20Bpy057PBwpynDQXFKXObYJk3mtmFI2hsS5guJhbGYvR1Cn45fgTyQjGHNFcjC/ehyq99647XmCxqK5L0xyM3jtOtbZGX51uM2BsjQwGKUXtL0BlncRt8yl88+gBGX+XNgvnu4+0ZsV4b+vKWAoOg/z8U+uhzQRfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833088; c=relaxed/simple;
	bh=9+Yq11lyhYoaAUDo3IHRvTOPRBNV2Qa+q8ldzjI4S9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QjK81I6AWNBhumEtZiztnwXUzK0U2t9jvSaAFVW0y/06PLcjKYAI5a+TPcuEZja/xDzh/Ah9KSTn1RhiOw3uNhVCMM7nV2mM15ktUgVBJXdfuWqtpipv8+rbVyBoX74YaOVrHjhdXvE1oPQyMUS10YWukE9+3FQwo2xUKw9vXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9d0DMEw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9d0DMEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788833087; x=1820369087;
  h=date:from:to:cc:subject:message-id;
  bh=9+Yq11lyhYoaAUDo3IHRvTOPRBNV2Qa+q8ldzjI4S9g=;
  b=K9d0DMEwqspYGYZ45/BCo44o9F/pnXC7KnM5qIs91I6VkX2aufMU4JyO
   5cwRVaPooEHCoFi65NlypwyvBx1h/wFUA3btvIVPprZBxIq+P//quDLSj
   2IL/Dc8Xix+URR5a5wh77RDnowAHvP5JqEgBOQb78J97anplsNwkK9ZRS
   RM0UH/QtSOudXqKVKnSPmsWwhIrKlEOHd3oqqtPCIvPRxxyripd98/bXj
   +w+6ThX63usOgnML8K5luq3oTK48gIs0l2kH2rcym3d+bVUbybXC7XqfC
   HGlLMlt3sqzjobbGYc59kAHVBarTPiPbxIgX0DxvjMPhnRdYpVqkoD0/d
   w==;
X-CSE-ConnectionGUID: MrSjvFI2Txu38ErHI/NrJQ==
X-CSE-MsgGUID: gfzq5xQQRcOfbrOhgFfHtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76787016"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76787016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 19:04:46 -0700
X-CSE-ConnectionGUID: 9k78XpmESTWUcm7jBgsEZQ==
X-CSE-MsgGUID: n82cuN+kRGqrK7xxVg5tlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="300729013"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2026 19:04:45 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3lCU-000000001Xt-32ko;
	Tue, 08 Sep 2026 02:04:42 +0000
Date: Tue, 08 Sep 2026 10:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 57/113] include/linux/find.h:588:72: warning:
 left-hand operand of comma expression has no effect
Message-ID: <202609080919.QIgANJtb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   79439d34dea5108741f00eb4031e777150cc4606
commit: 46ef77681e026cafee56306f59871ab4760809af [57/113] sched/alt: Auto-detect heterogeneous CPU topology
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609080919.QIgANJtb-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080919.QIgANJtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080919.QIgANJtb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_assign_llc_id':
   kernel/sched/alt_core.c:6402:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:412:31: note: in expansion of macro 'cpumask_bits'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6402:9: note: in expansion of macro 'for_each_cpu_and'
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:412:31: note: in expansion of macro 'cpumask_bits'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6402:9: note: in expansion of macro 'for_each_cpu_and'
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
>> include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:412:9: note: in expansion of macro 'for_each_and_bit'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6402:9: note: in expansion of macro 'for_each_cpu_and'
    6402 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_build_topology_cpumask':
   kernel/sched/alt_core.c:6455:21: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6455 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   include/linux/cpumask.h:716:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     716 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15:
   kernel/sched/alt_core.c:6468:50: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6468 |                                                  cpu_coregroup_mask(cpu)));
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6467:17: note: in expansion of macro 'max_t'
    6467 |                 max_t(int, 1, cpumask_weight_and(active_mask,
         |                 ^~~~~
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
   kernel/sched/alt_core.c:6486:41: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6486 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/linux/cpumask.h:649:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     649 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_update_llc_size':
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:412:31: note: in expansion of macro 'cpumask_bits'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6509:9: note: in expansion of macro 'for_each_cpu_and'
    6509 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
>> include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:412:9: note: in expansion of macro 'for_each_and_bit'
     412 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6509:9: note: in expansion of macro 'for_each_cpu_and'
    6509 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6512:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6512 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6511:25: note: in expansion of macro 'max_t'
    6511 |                         max_t(int, 1, cpumask_weight_and(active_mask,
         |                         ^~~~~
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6552:48: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6552 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   include/linux/cpumask.h:649:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     649 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c:6556:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6556 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6554:33: note: in expansion of macro 'max_t'
    6554 |                                 max_t(int, 1,
         |                                 ^~~~~
   include/linux/cpumask.h:883:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     883 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +588 include/linux/find.h

6b8ecb84f8f6401 include/asm-generic/bitops/find.h Yury Norov 2021-08-14  582  
bc9d6635c293a2a include/linux/find.h              Yury Norov 2021-08-14  583  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70e include/linux/find.h              Yury Norov 2022-09-19  584  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2a include/linux/find.h              Yury Norov 2021-08-14  585  
33e67710beda78a include/linux/find.h              Yury Norov 2022-09-19  586  #define for_each_and_bit(bit, addr1, addr2, size) \
fdae96a3fc7f70e include/linux/find.h              Yury Norov 2022-09-19  587  	for ((bit) = 0;									\
fdae96a3fc7f70e include/linux/find.h              Yury Norov 2022-09-19 @588  	     (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
fdae96a3fc7f70e include/linux/find.h              Yury Norov 2022-09-19  589  	     (bit)++)
33e67710beda78a include/linux/find.h              Yury Norov 2022-09-19  590  

:::::: The code at line 588 was first introduced by commit
:::::: fdae96a3fc7f70eb8ff9619550d7fa604719626a lib/find: optimize for_each() macros

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
