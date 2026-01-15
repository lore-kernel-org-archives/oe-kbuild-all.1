Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3B31691A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468683; cv=none; b=eI0q9F+1u/wLNju+ZjjoxBVb6uIodJ9Drwj49o7LZXbx4zDudOnepcdRKlnyYeaWUkZLPeUuy1ZjkaouRoUucvjM0p42OGmG9/fktTmPv0CQmZWhBYNLkbt2xWm+wMj7OAnEujr/DJT5nqJO2W/t8Pvvc/n35Nw0p8qqzsTkcFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468683; c=relaxed/simple;
	bh=F0Efm0BkesfVQpuiB+sGuepb1UAE0ROec3NZsRmL+2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iq0IrV595OTziEglBWgUBa8owKUg0t5XmMaA8wY1QYMUpr/uzQlIgR1obz2hhYi6SBG6ferFdVoPL772fHrTs78J7YOsrutInh2SxYIuqjNqONvz5oRxeV1/LJyM3RItMyftjC+eNrugosZpxw0e1h5+us1KNwJvImxOCkwT5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U42zNF0y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U42zNF0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768468681; x=1800004681;
  h=date:from:to:cc:subject:message-id;
  bh=F0Efm0BkesfVQpuiB+sGuepb1UAE0ROec3NZsRmL+2M=;
  b=U42zNF0ylN8AW68lyod30867IEF9rTcUwra16o1w3hL76fgr/TzwhF64
   9QfOVGCnN2LZ2PRLkX2XV1nhN45R1D17ekMFcZNnPW4EdN0u/Z/8/F5Ek
   M9EQC9rXyCD7qa2NKBm8EDdqA6X5cf+cjyhQkwMk8KlFNfFE6XYZAekmG
   JlfgW7ebHvhvEiGgdnib53HkjpuiE3E5Nn0mf3xaoRJDlKlaQ0Nq20UrG
   xRon9yV5JwzF8GA2EmTmyvMI2fTAsT63L8hU4oonmZFuv0SpWLLhim/5Q
   eUgmMFbluoUwjSqmQQa5afK8SD87Bw1TiOZm3AyuISFM5KQj0pvWu/vQS
   w==;
X-CSE-ConnectionGUID: SLQWe69vQYeHprnEqJwDJA==
X-CSE-MsgGUID: w6DvY71pSmGrk1UXYS542A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69687334"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69687334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:18:00 -0800
X-CSE-ConnectionGUID: oTb5L/8bST2KPFA7J+97hw==
X-CSE-MsgGUID: FJuq1HzXRPmHY2DHbczxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204115286"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jan 2026 01:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgJUH-00000000Hn8-172E;
	Thu, 15 Jan 2026 09:17:53 +0000
Date: Thu, 15 Jan 2026 17:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16]
 arch/powerpc/include/asm/cmpxchg.h:702:31: warning: initialization of 'int'
 from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast
Message-ID: <202601151759.NY3zvN4X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   9d2b723568aae6a6f7e41fc66f65f8b009690b6e
commit: 36dfd96fa3fbd7d4057fe22dfa657b62a9b6865b [8/16] mm: introduce BPF OOM struct ops
config: powerpc-randconfig-001-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151759.NY3zvN4X-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151759.NY3zvN4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151759.NY3zvN4X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

                ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:57: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                                                            ^
   include/linux/compiler_types.h:611:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                              ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:13: note: in expansion of macro 'rcu_dereference_check'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:57: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                                                            ^
   include/linux/compiler_types.h:581:13: note: in definition of macro '__unqual_scalar_typeof'
      _Generic((x),      \
                ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
     __READ_ONCE(x);       \
     ^~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                              ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:13: note: in expansion of macro 'rcu_dereference_check'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                ^~~~~~~~~~~~~~~~~~~~~
   In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380,
                    from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c:46:57: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                                                            ^
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
    #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                              ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:13: note: in expansion of macro 'rcu_dereference_check'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/workqueue.h:17,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c:46:57: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                                                            ^
   include/linux/rcupdate.h:535:12: note: in definition of macro '__rcu_dereference_check'
     ((typeof(*p) __force __kernel *)(local)); \
               ^
   mm/bpf_oom.c:46:13: note: in expansion of macro 'rcu_dereference_check'
      st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
                ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:107:24: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
                           ^
   include/linux/atomic/atomic-instrumented.h:4785:9: note: in definition of macro 'cmpxchg'
     typeof(ptr) __ai_ptr = (ptr); \
            ^~~
   mm/bpf_oom.c:107:24: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
                           ^
   include/linux/atomic/atomic-instrumented.h:4785:26: note: in definition of macro 'cmpxchg'
     typeof(ptr) __ai_ptr = (ptr); \
                             ^~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                                   ^~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                  ^~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/powerpc/include/asm/bitops.h:321,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from arch/powerpc/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
    static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
                                                             ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
>> arch/powerpc/include/asm/cmpxchg.h:701:17: error: invalid type argument of unary '*' (have 'int')
         __typeof__(*(ptr)) _o_ = (o);      \
                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
>> arch/powerpc/include/asm/cmpxchg.h:701:31: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
         __typeof__(*(ptr)) _o_ = (o);      \
                                  ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:702:17: error: invalid type argument of unary '*' (have 'int')
         __typeof__(*(ptr)) _n_ = (n);      \
                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
>> arch/powerpc/include/asm/cmpxchg.h:702:31: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
         __typeof__(*(ptr)) _n_ = (n);      \
                                  ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:703:18: error: invalid type argument of unary '*' (have 'int')
         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,   \
                     ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:704:36: error: invalid type argument of unary '*' (have 'int')
            (unsigned long)_n_, sizeof(*(ptr))); \
                                       ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
>> arch/powerpc/include/asm/cmpxchg.h:703:37: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,   \
                                        ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:621:26: note: expected 'volatile void *' but argument is of type 'int'
    __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
              ~~~~~~~~~~~~~~~^~~
   In file included from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:125:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
                               ^
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   mm/bpf_oom.c:125:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
                               ^
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                                   ^~~~~~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                  ^~~~~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/powerpc/include/asm/bitops.h:321,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from arch/powerpc/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
    static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
                                                             ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
>> arch/powerpc/include/asm/cmpxchg.h:701:17: error: invalid type argument of unary '*' (have 'int')
         __typeof__(*(ptr)) _o_ = (o);      \
                    ^~~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:701:31: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
         __typeof__(*(ptr)) _o_ = (o);      \
                                  ^
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:701:31: note: (near initialization for '__ret_warn_on')
         __typeof__(*(ptr)) _o_ = (o);      \
                                  ^
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:702:17: error: invalid type argument of unary '*' (have 'int')
         __typeof__(*(ptr)) _n_ = (n);      \
                    ^~~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:702:31: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
         __typeof__(*(ptr)) _n_ = (n);      \
                                  ^
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:702:31: note: (near initialization for '__ret_warn_on')
         __typeof__(*(ptr)) _n_ = (n);      \
                                  ^
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:703:18: error: invalid type argument of unary '*' (have 'int')
         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,   \
                     ^~~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:704:36: error: invalid type argument of unary '*' (have 'int')
            (unsigned long)_n_, sizeof(*(ptr))); \
                                       ^~~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
>> arch/powerpc/include/asm/cmpxchg.h:703:37: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,   \
                                        ^~~~~
   include/asm-generic/bug.h:110:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
    #define raw_cmpxchg arch_cmpxchg
                        ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
     raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
     ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   In file included from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/powerpc/include/asm/cmpxchg.h:621:26: note: expected 'volatile void *' but argument is of type 'int'
    __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
              ~~~~~~~~~~~~~~~^~~


vim +702 arch/powerpc/include/asm/cmpxchg.h

56c08e6d226c86 Boqun Feng    2015-12-15  679  
56c08e6d226c86 Boqun Feng    2015-12-15  680  static __always_inline unsigned long
56c08e6d226c86 Boqun Feng    2015-12-15  681  __cmpxchg_acquire(void *ptr, unsigned long old, unsigned long new,
56c08e6d226c86 Boqun Feng    2015-12-15  682  		  unsigned int size)
56c08e6d226c86 Boqun Feng    2015-12-15  683  {
56c08e6d226c86 Boqun Feng    2015-12-15  684  	switch (size) {
d0563a1297e234 Pan Xinhui    2016-04-27  685  	case 1:
d0563a1297e234 Pan Xinhui    2016-04-27  686  		return __cmpxchg_u8_acquire(ptr, old, new);
d0563a1297e234 Pan Xinhui    2016-04-27  687  	case 2:
d0563a1297e234 Pan Xinhui    2016-04-27  688  		return __cmpxchg_u16_acquire(ptr, old, new);
56c08e6d226c86 Boqun Feng    2015-12-15  689  	case 4:
56c08e6d226c86 Boqun Feng    2015-12-15  690  		return __cmpxchg_u32_acquire(ptr, old, new);
56c08e6d226c86 Boqun Feng    2015-12-15  691  #ifdef CONFIG_PPC64
56c08e6d226c86 Boqun Feng    2015-12-15  692  	case 8:
56c08e6d226c86 Boqun Feng    2015-12-15  693  		return __cmpxchg_u64_acquire(ptr, old, new);
56c08e6d226c86 Boqun Feng    2015-12-15  694  #endif
56c08e6d226c86 Boqun Feng    2015-12-15  695  	}
10d8b1480e6966 pan xinhui    2016-02-23  696  	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg_acquire");
56c08e6d226c86 Boqun Feng    2015-12-15  697  	return old;
56c08e6d226c86 Boqun Feng    2015-12-15  698  }
9eaa82935dccb7 Mark Rutland  2021-05-25  699  #define arch_cmpxchg(ptr, o, n)						 \
ae3a197e3d0bfe David Howells 2012-03-28  700    ({									 \
ae3a197e3d0bfe David Howells 2012-03-28 @701       __typeof__(*(ptr)) _o_ = (o);					 \
ae3a197e3d0bfe David Howells 2012-03-28 @702       __typeof__(*(ptr)) _n_ = (n);					 \
ae3a197e3d0bfe David Howells 2012-03-28 @703       (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
ae3a197e3d0bfe David Howells 2012-03-28  704  				    (unsigned long)_n_, sizeof(*(ptr))); \
ae3a197e3d0bfe David Howells 2012-03-28  705    })
ae3a197e3d0bfe David Howells 2012-03-28  706  
ae3a197e3d0bfe David Howells 2012-03-28  707  

:::::: The code at line 702 was first introduced by commit
:::::: ae3a197e3d0bfe3f4bf1693723e82dc018c096f3 Disintegrate asm/system.h for PowerPC

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
