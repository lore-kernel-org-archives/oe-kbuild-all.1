Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC585213E9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553925; cv=none; b=N68qEyHrPsyjd8PN2uCqHl2ydJzozFyMRM/WKaJ7XAmrQR1kR7WCvOgRIurCw+f6OYSs7eBDAQSSYvmSYENSOyWJfY1AqvOXhT8drDALV3RcunHIuEXqpF78zof+jEyuzpdwH88dNA1MgJcTgvnRB/dcX0HS7gALz4qjaaq7HSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553925; c=relaxed/simple;
	bh=5B0XroXRRwT3NYeGn8+w6hMP874gcwx3m3lGTlfE61w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNd0pDTG4ZHFhzFGUGsRKjBLZY0Xn7K6bv0DXUccO6SIYbgy8FeGXWOryu6VYEm7UoToOEy2KZLSQPFsIkuV6czoauYv5xG5SOKCzX/WwXfYz5YcWokA2hEjwlbmOlh5nFsDB8WEKJZdT1Wi8DVhB6MxQzLUAfVi8umhGoyvdyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3xvxGPY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3xvxGPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737553923; x=1769089923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5B0XroXRRwT3NYeGn8+w6hMP874gcwx3m3lGTlfE61w=;
  b=d3xvxGPYzJYB/PQ1VKO7mibXKuFSUHYaM2EeC2aKJvfC+x/IRiUANho1
   Oy7Gj5GFyedjLtIqB4Mn6E6a+pDIBpljvCoYK3QamkAasnh6cS7vVPChj
   V/Llro8gKM4SBbcM5Mr0x+9f73XT7KRmV552VLY56DOTNpU2FZwS2AjPu
   PCKAPKBE15+rHL5AH4R0QiYLUCyTDreoA/6qBM4Z8GWXfndnPNjh/xW1f
   3YU2vw+v3U2+dogG0fTTXiIauRmGbJAULLkEGx/AeawdHwMkpDaO6UNDq
   IFAadcMeovgqbaBbI0hQsVcpiE9wfbQhIMmR+4853+W4wIlq7kDiAaD2C
   w==;
X-CSE-ConnectionGUID: 6X1lI2TLRUKheJUR/8aZ9w==
X-CSE-MsgGUID: xHjJC7IcTnSkg+p6bNIrCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37894168"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37894168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 05:52:03 -0800
X-CSE-ConnectionGUID: +cnrdMwOSaaRBfC1yxIbow==
X-CSE-MsgGUID: iiOpoP+bTzCu0cvQ530elg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107672525"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jan 2025 05:52:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tab9D-000Zv1-0X;
	Wed, 22 Jan 2025 13:51:59 +0000
Date: Wed, 22 Jan 2025 21:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 kernel/sched/core.c:1660:14: error: 'struct sched_entity' has no member
 named 'avg'
Message-ID: <202501222146.1ElFnvTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: e0515f89730a8597730e11f244a80d37c7970d4a [1/1] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: arm-randconfig-003-20250122 (https://download.01.org/0day-ci/archive/20250122/202501222146.1ElFnvTn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501222146.1ElFnvTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501222146.1ElFnvTn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:1660:14: error: 'struct sched_entity' has no member named 'avg'
    1660 |         p->se.avg.util_guest = attr->sched_util_min;
         |              ^
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2629:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2629 |         struct rq *rq;
         |                    ^~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:4917:35: warning: no previous prototype for 'schedule_user' [-Wmissing-prototypes]
    4917 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^~~~~~~~~~~~~
--
   kernel/sched/fair.c:4594:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4594 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:5577:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5577 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:274:27: note: in definition of macro '__unqual_scalar_typeof'
     274 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from arch/arm/include/uapi/asm/swab.h:19,
                    from arch/arm/include/asm/swab.h:19,
                    from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/arm/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:11510:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11510 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11512:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11512 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11517:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11517 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11519:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11519 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1660 kernel/sched/core.c

  1656	
  1657		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1658			return;
  1659	
> 1660		p->se.avg.util_guest = attr->sched_util_min;
  1661	}
  1662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
