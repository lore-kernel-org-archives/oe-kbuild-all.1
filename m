Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5E32ABC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472641; cv=none; b=mXemM5SyAWIdr+ZgLdEj1Wa2smLa48AUrwBtPAaLyQ9IlIijHJmdjgyUKjA88FRUdBt/OgEcX42AlVNb9qMjvad8bQ6BUSJDVMAQzUNZZhQlHgdBeObIOlc2XmHEUrykG9Dmbqzx6HK8UZUNMXJFtgXrq15zIyV7g0vizwG6xNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472641; c=relaxed/simple;
	bh=sb4fFPm2MS8bnCCUZZt0KcJiy7J5rWMkPHw+8ZR0sIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kp0WmJq7pnv2z6Ul22WujmFJAly6RUM/HQx5NlH8ypt8U9psspQRAN7pUyHwM6oZucKlNo1hdZWtSkXSutWRD6fXbFVZe35b3dVrJiSfstI5UBVRg/oMAG6QGbZ3LljRzXrGGr/7cJHhcBLXplfBcJ+VUWgBKmL4SSZGMLVdS1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KewENj1A; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KewENj1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768472640; x=1800008640;
  h=date:from:to:cc:subject:message-id;
  bh=sb4fFPm2MS8bnCCUZZt0KcJiy7J5rWMkPHw+8ZR0sIw=;
  b=KewENj1A86okOHAL14PxZtrhve5UDHGenpaA0Og0/yYg43qn9hOt7+JL
   rtnfICFNog2YE0mGrhg8SZ/VeAQqmTjWPgC1InHNbZj1VuESOoKNcoZL7
   EI6d9B6tlc+YS8WcKx/IZSZjkfOx9O6Nj8p956eJRQpFPuVbfXxfy9L4H
   UY4rajP3OgvwGqN5bgV15PYRP+yw+Dq11zvWtJzSxv/480Mj6IHcC2RgJ
   U8IGlfE0g9zLKPNCTfXyV5KgAhgWtgN0UZ8XJPrVsij/vD3/+xVgzPX9T
   YPBeI8vm9xTuWm9Ic4sUx8Jn/st9/i7CtbZ7CWeZHg0MJMypyz5+3rM+v
   A==;
X-CSE-ConnectionGUID: BZ29uQWMSHOkh3wTMvzoWg==
X-CSE-MsgGUID: MOddJbV9R4+NXKda04166w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69511882"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69511882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:23:59 -0800
X-CSE-ConnectionGUID: jvOwdcQVQBSHClppMM5QCg==
X-CSE-MsgGUID: 6qm/yWE7T2SnZ6UpswszTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="242466923"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 02:23:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKWB-00000000HqK-1AJq;
	Thu, 15 Jan 2026 10:23:55 +0000
Date: Thu, 15 Jan 2026 18:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16] mm/bpf_oom.c:107:6: error:
 variable has incomplete type 'typeof (({
Message-ID: <202601151834.Z2uHv1rq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   9d2b723568aae6a6f7e41fc66f65f8b009690b6e
commit: 36dfd96fa3fbd7d4057fe22dfa657b62a9b6865b [8/16] mm: introduce BPF OOM struct ops
config: arm-randconfig-003-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151834.Z2uHv1rq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151834.Z2uHv1rq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151834.Z2uHv1rq-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                       ^~~~~~~~~
   mm/bpf_oom.c:46:58: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/rcupdate.h:680:27: note: expanded from macro 'rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:532:53: note: expanded from macro '__rcu_dereference_check'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:631:22: note: expanded from macro 'compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:619:23: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:611:9: note: expanded from macro '__compiletime_assert'
     611 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   mm/bpf_oom.c:46:58: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/rcupdate.h:680:27: note: expanded from macro 'rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:532:53: note: expanded from macro '__rcu_dereference_check'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:581:13: note: expanded from macro '__unqual_scalar_typeof'
     581 |                 _Generic((x),                                           \
         |                           ^
   mm/bpf_oom.c:46:58: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/rcupdate.h:680:27: note: expanded from macro 'rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:532:53: note: expanded from macro '__rcu_dereference_check'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:588:15: note: expanded from macro '__unqual_scalar_typeof'
     588 |                          default: (x)))
         |                                    ^
   mm/bpf_oom.c:46:58: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/rcupdate.h:680:27: note: expanded from macro 'rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:532:53: note: expanded from macro '__rcu_dereference_check'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/bpf_oom.c:46:58: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/rcupdate.h:680:27: note: expanded from macro 'rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:535:12: note: expanded from macro '__rcu_dereference_check'
     535 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   mm/bpf_oom.c:46:11: error: assigning to 'struct bpf_struct_ops_link *' from incompatible type 'void'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      47 |                                                 rcu_read_lock_trace_held());
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:107:25: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                      ~~~~~~~~~ ^
   include/linux/atomic/atomic-instrumented.h:4785:9: note: expanded from macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   mm/bpf_oom.c:107:25: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                      ~~~~~~~~~ ^
   include/linux/atomic/atomic-instrumented.h:4785:26: note: expanded from macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
>> mm/bpf_oom.c:107:6: error: variable has incomplete type 'typeof (({
   }))' (aka 'void')
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:58:2: note: expanded from macro 'raw_cmpxchg'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^
   include/linux/atomic.h:73:29: note: expanded from macro '__atomic_op_fence'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                                    ^
   mm/bpf_oom.c:125:29: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                          ~~~~~~~~~ ^
   include/linux/atomic/atomic-instrumented.h:4785:9: note: expanded from macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   include/asm-generic/bug.h:155:25: note: expanded from macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:125:29: error: no member named 'bpf_oom_link' in 'struct cgroup_bpf'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                          ~~~~~~~~~ ^
   include/linux/atomic/atomic-instrumented.h:4785:26: note: expanded from macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/asm-generic/bug.h:155:25: note: expanded from macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:125:10: error: variable has incomplete type 'typeof (({
   }))' (aka 'void')
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^
   include/linux/atomic/atomic-instrumented.h:4788:2: note: expanded from macro 'cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:58:2: note: expanded from macro 'raw_cmpxchg'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^
   include/linux/atomic.h:73:29: note: expanded from macro '__atomic_op_fence'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                                    ^
   18 errors generated.


vim +107 mm/bpf_oom.c

    93	
    94	static int bpf_oom_ops_reg(void *kdata, struct bpf_link *link)
    95	{
    96		struct bpf_struct_ops_link *st_link = (struct bpf_struct_ops_link *)link;
    97		struct cgroup *cgrp;
    98	
    99		/* The link is not yet fully initialized, but cgroup should be set */
   100		if (!link)
   101			return -EOPNOTSUPP;
   102	
   103		cgrp = st_link->cgroup;
   104		if (!cgrp)
   105			return -EINVAL;
   106	
 > 107		if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
   108			return -EEXIST;
   109	
   110		return 0;
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
