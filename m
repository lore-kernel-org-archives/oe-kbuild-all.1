Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBE35EDCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470603; cv=none; b=CjtO3rOKFlbN8L1W6zsa1N+6rfTLKlIu+2FW0HY4OZeUXyFlbyf8jMPUulRXf3qAaqSBhVO7aLsbGNa7L7EdNaw1/SsM4jAsr6Ackp1HTddXSboADhqeiYzrhxwbtVUrApXRFxoKST6/ZNgTFAUV8aJ+Y6L4sgR+AVKQmKL+2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470603; c=relaxed/simple;
	bh=xtSClpwupgxx7ndP0BJWP9TmMdV3GC1dMAsJnnte1e8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3Zjbx98mgt8l8cae9LBg0rUWkq4aZCcqfRH42t8SqK+MeZ5rf8dijhqh0iNtxKzF+iiDQiirzTJ3qVmHyVuDtwlQQxtq1ONaI3VEm2nRktT0NOeHMTcTAwXhX2t8D9I9nukCTIGWEEwL/xU/atct2Us1dDvp2kqfg61nt8sOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+4LTjK/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+4LTjK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768470600; x=1800006600;
  h=date:from:to:cc:subject:message-id;
  bh=xtSClpwupgxx7ndP0BJWP9TmMdV3GC1dMAsJnnte1e8=;
  b=U+4LTjK/kXJgEQNvQLy0oE6W4e4myAqUL9nd5o/E2o6KnfIsUsbS0lue
   e7SECX6adit6kSPxvh3/xmWZ2EfORwfBcJv3VWhuI67wTm/GTbZjmiDsy
   iFgY9NqEa7VvZEvVMgYLK/hzZsJb9cFYaJp8deG8rfmCgXPd/rGNBBtee
   VPe9kaTJuPMqdyW2DyS4rfwZZkntPaT7tENs9QmbfXcV0ubVgfpvpehK9
   tV+01+LezF3QNGoqlWj4NGDrtQRV0qI1zw9NcaD+ZK/s8KedfYRji8Lv6
   D7cTjP7+WhY7HjC1R5UG8B9YTmyk3bdlVa1q7/UM1n30IotosNbm3jvP2
   g==;
X-CSE-ConnectionGUID: lIEffBhaReWGst3cBr5pwA==
X-CSE-MsgGUID: Hhh9zQvbQHiHPT6FmT5Inw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72358900"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="72358900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:49:58 -0800
X-CSE-ConnectionGUID: QZ4akVhFR7Gc9sG4ZJ8u+A==
X-CSE-MsgGUID: MB6Ij4epTTSYTM1SDQR6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204536952"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jan 2026 01:49:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgJzG-00000000Hoa-0jJ5;
	Thu, 15 Jan 2026 09:49:54 +0000
Date: Thu, 15 Jan 2026 17:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16]
 arch/x86/include/asm/cmpxchg.h:89:36: error: initialization of 'int' from
 'struct bpf_struct_ops_link *' makes integer from pointer without a cast
Message-ID: <202601151722.y6JYFy86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   9d2b723568aae6a6f7e41fc66f65f8b009690b6e
commit: 36dfd96fa3fbd7d4057fe22dfa657b62a9b6865b [8/16] mm: introduce BPF OOM struct ops
config: i386-buildonly-randconfig-003-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151722.y6JYFy86-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151722.y6JYFy86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151722.y6JYFy86-lkp@intel.com/

All errors (new ones prefixed by >>):

                    from include/linux/compiler.h:380,
                    from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8:
   mm/bpf_oom.c:46:71: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                                       ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:27: note: in expansion of macro 'rcu_dereference_check'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:71: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                                       ^
   include/linux/rcupdate.h:535:19: note: in definition of macro '__rcu_dereference_check'
     535 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   mm/bpf_oom.c:46:27: note: in expansion of macro 'rcu_dereference_check'
      46 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/alloc_tag.h:13,
                    from include/linux/workqueue.h:9:
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:107:31: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4785:16: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   mm/bpf_oom.c:107:31: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4785:33: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7:
   arch/x86/include/asm/cmpxchg.h:87:20: error: invalid type argument of unary '*' (have 'int')
      87 |         __typeof__(*(ptr)) __ret;                                       \
         |                    ^~~~~~
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/x86/include/asm/cmpxchg.h:88:20: error: invalid type argument of unary '*' (have 'int')
      88 |         __typeof__(*(ptr)) __old = (old);                               \
         |                    ^~~~~~
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/x86/include/asm/cmpxchg.h:88:36: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      88 |         __typeof__(*(ptr)) __old = (old);                               \
         |                                    ^
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/x86/include/asm/cmpxchg.h:89:20: error: invalid type argument of unary '*' (have 'int')
      89 |         __typeof__(*(ptr)) __new = (new);                               \
         |                    ^~~~~~
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/x86/include/asm/cmpxchg.h:89:36: error: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      89 |         __typeof__(*(ptr)) __new = (new);                               \
         |                                    ^
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:41: error: invalid type argument of unary '*' (have 'int')
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |                                         ^~~~~~
   arch/x86/include/asm/cmpxchg.h:90:17: note: in definition of macro '__raw_cmpxchg'
      90 |         switch (size) {                                                 \
         |                 ^~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:107:13: note: in expansion of macro 'cmpxchg'
     107 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   In file included from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:125:35: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                                   ^
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:125:17: note: in expansion of macro 'cmpxchg'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   mm/bpf_oom.c:125:35: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                                   ^
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:125:17: note: in expansion of macro 'cmpxchg'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:125:17: note: in expansion of macro 'cmpxchg'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:125:17: note: in expansion of macro 'cmpxchg'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   arch/x86/include/asm/cmpxchg.h:87:20: error: invalid type argument of unary '*' (have 'int')
      87 |         __typeof__(*(ptr)) __ret;                                       \
         |                    ^~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:125:17: note: in expansion of macro 'cmpxchg'
     125 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);


vim +89 arch/x86/include/asm/cmpxchg.h

e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   79  
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   80  /*
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   81   * Atomic compare and exchange.  Compare OLD with MEM, if identical,
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   82   * store NEW in MEM.  Return the initial value in MEM.  Success is
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   83   * indicated by comparing RETURN with OLD.
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   84   */
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   85  #define __raw_cmpxchg(ptr, old, new, size, lock)			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   86  ({									\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   87  	__typeof__(*(ptr)) __ret;					\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  @88  	__typeof__(*(ptr)) __old = (old);				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  @89  	__typeof__(*(ptr)) __new = (new);				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   90  	switch (size) {							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   91  	case __X86_CASE_B:						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   92  	{								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   93  		volatile u8 *__ptr = (volatile u8 *)(ptr);		\
faa6f77b0dfae95 Uros Bizjak         2025-03-09   94  		asm_inline volatile(lock "cmpxchgb %2, %1"		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   95  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   96  			     : "q" (__new), "0" (__old)			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   97  			     : "memory");				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   98  		break;							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18   99  	}								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  100  	case __X86_CASE_W:						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  101  	{								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  102  		volatile u16 *__ptr = (volatile u16 *)(ptr);		\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  103  		asm_inline volatile(lock "cmpxchgw %2, %1"		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  104  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  105  			     : "r" (__new), "0" (__old)			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  106  			     : "memory");				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  107  		break;							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  108  	}								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  109  	case __X86_CASE_L:						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  110  	{								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  111  		volatile u32 *__ptr = (volatile u32 *)(ptr);		\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  112  		asm_inline volatile(lock "cmpxchgl %2, %1"		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  113  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  114  			     : "r" (__new), "0" (__old)			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  115  			     : "memory");				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  116  		break;							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  117  	}								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  118  	case __X86_CASE_Q:						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  119  	{								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  120  		volatile u64 *__ptr = (volatile u64 *)(ptr);		\
faa6f77b0dfae95 Uros Bizjak         2025-03-09  121  		asm_inline volatile(lock "cmpxchgq %2, %1"		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  122  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  123  			     : "r" (__new), "0" (__old)			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  124  			     : "memory");				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  125  		break;							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  126  	}								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  127  	default:							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  128  		__cmpxchg_wrong_size();					\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  129  	}								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  130  	__ret;								\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  131  })
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  132  

:::::: The code at line 89 was first introduced by commit
:::::: e9826380d83d1bda3ee5663bf3fa4667a6fbe60a x86, cmpxchg: Unify cmpxchg into cmpxchg.h

:::::: TO: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
