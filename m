Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6823ED5B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786198244; cv=none; b=b4pTyircfJpgT5vegYSHu9yy94fu6Z4O2bMAFs/h9JVP+QFURrMSKQ2EpwgQWCGn5bEkKwWwcFtiNrzUcZWcjkWsPhbIIqZSwTD/Dl4lthRb/RLoWW6MyPEKV0WYVom7hRzF0sKqcLYQ0Ed+Jb6ujeeIZPHWPNNx53fQYms+MtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786198244; c=relaxed/simple;
	bh=dGiIuWtdUOxKmzbRVCYePKsu3OL4H1Wx9WrZpSIzU7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jb0SS6R19P0b011RynPPV+V5JvcnhH/Jm0iXWMQNvu0GS5Ro0NsoI9Mx87dEDSmJHQ8s+9pRHTbSH9KhF4TwoLFeP7QbdpUFPleYp5ecBwf8LTYIlOeC5gJNodB/Nxk1LmKaAzu+2Rm1P8BlQSyVlORRzKi9EJhufTII9MOy/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzGNtlok; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzGNtlok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786198241; x=1817734241;
  h=date:from:to:cc:subject:message-id;
  bh=dGiIuWtdUOxKmzbRVCYePKsu3OL4H1Wx9WrZpSIzU7o=;
  b=YzGNtlok1VWbiP0mzUcf+96Tdiqmvsa28y7hpKo+zk/JM0CuHPz2s+op
   HwabYfuyIlly1SIAawuzHSAwijUeyXYFpEgbRfcyW8Bfv285iD2IrC+6q
   c/OgQzx9CEw1jOs5QHr5jDG52CNiBau6Q1qtZGyIrdtuBCXvQi2vyTc5F
   ZNks4lEm3nykIwsuswAgvLArTIaV2hnyIZDb5iEEeVcb+hQsi/or4xfYo
   NzZzqt2fJGQbsLODQoQX+2H4FLLEZF8FttqbZK/mqLwqKfCzuNMUSldZy
   G3qausIVrohTqKBFgIBiUJPcLgvHLFTGCZBGAorks7nypHnt+kIDAW7kc
   w==;
X-CSE-ConnectionGUID: MvHAEsB8QA2mdPJk18xYPA==
X-CSE-MsgGUID: 43Syo2WRSteZYdVFwVyLzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="74320793"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="74320793"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 07:10:41 -0700
X-CSE-ConnectionGUID: H2/okeQNQlmDqI2E0T5ywg==
X-CSE-MsgGUID: 8SYI0tU/QhCqPiE5fGAFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="260895551"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2026 07:10:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wshkz-00000000KF7-1G8W;
	Sat, 08 Aug 2026 14:10:37 +0000
Date: Sat, 08 Aug 2026 22:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 36/49] include/linux/find.h:588:72: warning:
 left-hand operand of comma expression has no effect
Message-ID: <202608082323.ha7PyZyG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   bafe3c105f696e656e6f216bd7c2a76c373f2086
commit: 4878c61929d676359794533c9e16d420c5f24b26 [36/49] sched/alt: Auto-detect heterogeneous CPU topology
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260808/202608082323.ha7PyZyG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608082323.ha7PyZyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608082323.ha7PyZyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'finish_task_switch':
   kernel/sched/alt_core.c:3714:9: error: too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
    3714 |         blk_plug_invalidate_ts();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:28:
   include/linux/blkdev.h:1220:20: note: declared here
    1220 | static inline void blk_plug_invalidate_ts(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/alt_core.c:15:
   kernel/sched/alt_core.c: In function 'sched_assign_llc_id':
   kernel/sched/alt_core.c:6376:32: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:410:31: note: in expansion of macro 'cpumask_bits'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6376:9: note: in expansion of macro 'for_each_cpu_and'
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:410:31: note: in expansion of macro 'cpumask_bits'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6376:9: note: in expansion of macro 'for_each_cpu_and'
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
>> include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:410:9: note: in expansion of macro 'for_each_and_bit'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6376:9: note: in expansion of macro 'for_each_cpu_and'
    6376 |         for_each_cpu_and(peer, cpu_coregroup_mask(cpu), active_mask) {
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_build_topology_cpumask':
   kernel/sched/alt_core.c:6429:21: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6429 |                     cpu_coregroup_mask(cpu));
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     int
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15:
   kernel/sched/alt_core.c:6442:50: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6442 |                                                  cpu_coregroup_mask(cpu)));
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6441:17: note: in expansion of macro 'max_t'
    6441 |                 max_t(int, 1, cpumask_weight_and(active_mask,
         |                 ^~~~~
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_add_cpu':
   kernel/sched/alt_core.c:6460:41: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6460 |         if (cpumask_test_cpu(added_cpu, cpu_coregroup_mask(cpu)))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/linux/cpumask.h:647:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     647 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_update_llc_size':
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:588:41: note: in definition of macro 'for_each_and_bit'
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                         ^~~~~
   include/linux/cpumask.h:410:31: note: in expansion of macro 'cpumask_bits'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6483:9: note: in expansion of macro 'for_each_cpu_and'
    6483 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
>> include/linux/find.h:588:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     588 |              (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
         |                                                                        ^
   include/linux/cpumask.h:410:9: note: in expansion of macro 'for_each_and_bit'
     410 |         for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6483:9: note: in expansion of macro 'for_each_cpu_and'
    6483 |         for_each_cpu_and(cpu, cpu_coregroup_mask(changed_cpu), active_mask)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6486:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6486 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6485:25: note: in expansion of macro 'max_t'
    6485 |                         max_t(int, 1, cpumask_weight_and(active_mask,
         |                         ^~~~~
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
         |                                                              ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c: In function 'sched_topology_activate_update':
   kernel/sched/alt_core.c:6526:48: error: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
    6526 |                 if (cpumask_test_cpu(incoming, cpu_coregroup_mask(cpu)))
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                int
   include/linux/cpumask.h:647:54: note: expected 'const struct cpumask *' but argument is of type 'int'
     647 | bool cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/sched/alt_core.c:6530:58: error: passing argument 2 of 'cpumask_weight_and' makes pointer from integer without a cast [-Wint-conversion]
    6530 |                                                          cpu_coregroup_mask(cpu)));
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          int
   include/linux/minmax.h:86:38: note: in definition of macro '__cmp_once_unique'
      86 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                                      ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__cmp_once'
     169 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   kernel/sched/alt_core.c:6528:33: note: in expansion of macro 'max_t'
    6528 |                                 max_t(int, 1,
         |                                 ^~~~~
   include/linux/cpumask.h:881:84: note: expected 'const struct cpumask *' but argument is of type 'int'
     881 | unsigned int cpumask_weight_and(const struct cpumask *srcp1, const struct cpumask *srcp2)
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
