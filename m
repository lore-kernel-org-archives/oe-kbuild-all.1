Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8346D305045
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552912; cv=none; b=g4Ou5Y+a36jB38RC7XUiolGjqXEgcFUC4F6Y2rwhDXo2xJtTh6fU3a97tE07blHu1nWzV5uZNAr0CXPxhCrJpqc4sCXFnhjZHZPTqWKFDgOJFdECDSN0HPciYaqQi1+Wqojg12rHOeLNyqn2PLLWTojDze/C0r9AJ8+LKskbcRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552912; c=relaxed/simple;
	bh=JvXUH+1QZOoznAj06P86YCBnVDmK1BBwRlpR2+yCuFk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aDju7BwKHPeoL3E5NkEl9TUViagGfyFd8XU/30ndkG1lyeZLvpZu0wd9BZ3oooks+IIC/J/Vpl2ncDAMY36eSJdHKydH5QuDQLS7aJdmXX1IjTzf+ew8dP2LEj+jMn3BwfJdaHqNW8yjfAsobHWX1ok51UqBcKXqSVM6C+OJyi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPvveE2+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPvveE2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768552909; x=1800088909;
  h=date:from:to:cc:subject:message-id;
  bh=JvXUH+1QZOoznAj06P86YCBnVDmK1BBwRlpR2+yCuFk=;
  b=UPvveE2+G+LTmTLNnycRribXg9TFownqNmGiIGWuh3WTXEnhYkMemoO4
   heGIk9a21cl4PQ9UZgS/XjPrZuiivvtxWXo26Unhs+Ay5tk21ypVwFUB1
   EbYeq2BKm6qQhdZbXFGMBNCkPVESULQHvvIFeWMjauok+3EVugsNo4KOk
   rzCNjFdOpI93YgwZLWTFXbHLpCEp1s/6osmz1oo4mW4hpaC+eQQaIUevM
   Ugid2c7bESkSdmqYnhqtpNgsGuGY1TV5ySth9GK3wjWpdh1Z5xDBiFs26
   9Rk3OH9R+ncpeqaRd1SFHy4BNiVUU5H+TYTzM7S6lPt7UnohnG6vnKsxO
   A==;
X-CSE-ConnectionGUID: RViwYLdWRrarPolNriKZ5g==
X-CSE-MsgGUID: 5KEhqcLCQjGgcKIviXJOEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68875466"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="68875466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 00:41:49 -0800
X-CSE-ConnectionGUID: Wnd8Ge2LT76Q6dbozCngOA==
X-CSE-MsgGUID: IQ69JtX8Rem6I1VZDwAEiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205648504"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 00:41:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgfOr-00000000Kb6-1yFK;
	Fri, 16 Jan 2026 08:41:45 +0000
Date: Fri, 16 Jan 2026 16:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16]
 arch/openrisc/include/asm/cmpxchg.h:137:34: warning: passing argument 1 of
 '__cmpxchg' makes pointer from integer without a cast
Message-ID: <202601161608.XPRQW4x5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   efc992015947c3d8e572409425e26d7074570523
commit: 67512b10905188a5848cdbd3047b12ef7072ec5e [8/16] mm: introduce BPF OOM struct ops
config: openrisc-randconfig-r061-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161608.XPRQW4x5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161608.XPRQW4x5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161608.XPRQW4x5-lkp@intel.com/

All warnings (new ones prefixed by >>):

      46 |   st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                         ^
   include/linux/rcupdate.h:535:12: note: in definition of macro '__rcu_dereference_check'
     535 |  ((typeof(*p) __force __kernel *)(local)); \
         |            ^
   mm/bpf_oom.c:46:13: note: in expansion of macro 'rcu_dereference_check'
      46 |   st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:107:24: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                        ^
   include/linux/atomic/atomic-instrumented.h:4785:9: note: in definition of macro 'cmpxchg'
    4785 |  typeof(ptr) __ai_ptr = (ptr); \
         |         ^~~
   mm/bpf_oom.c:107:24: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                        ^
   include/linux/atomic/atomic-instrumented.h:4785:26: note: in definition of macro 'cmpxchg'
    4785 |  typeof(ptr) __ai_ptr = (ptr); \
         |                          ^~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                ^~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                               ^~~~~~~~
         |                               |
         |                               int
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/openrisc/include/asm/atomic.h:131,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/openrisc/include/asm/cmpxchg.h:137:15: error: invalid type argument of unary '*' (have 'int')
     137 |   (__typeof__(*(ptr))) __cmpxchg((ptr),   \
         |               ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   arch/openrisc/include/asm/cmpxchg.h:140:20: error: invalid type argument of unary '*' (have 'int')
     140 |             sizeof(*(ptr)));  \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
>> arch/openrisc/include/asm/cmpxchg.h:137:34: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     137 |   (__typeof__(*(ptr))) __cmpxchg((ptr),   \
         |                                  ^~~~~
         |                                  |
         |                                  int
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     107 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   arch/openrisc/include/asm/cmpxchg.h:121:54: note: expected 'volatile void *' but argument is of type 'int'
     121 | static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
         |                                       ~~~~~~~~~~~~~~~^~~
   In file included from arch/openrisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:125:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                            ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   mm/bpf_oom.c:125:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                            ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                ^~~~~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                               ^~~~~~~~
         |                               |
         |                               int
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/openrisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/openrisc/include/asm/cmpxchg.h:137:15: error: invalid type argument of unary '*' (have 'int')
     137 |   (__typeof__(*(ptr))) __cmpxchg((ptr),   \
         |               ^~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/openrisc/include/asm/cmpxchg.h:140:20: error: invalid type argument of unary '*' (have 'int')
     140 |             sizeof(*(ptr)));  \
         |                    ^~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
>> arch/openrisc/include/asm/cmpxchg.h:137:34: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     137 |   (__typeof__(*(ptr))) __cmpxchg((ptr),   \
         |                                  ^~~~~
         |                                  |
         |                                  int
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     205 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     125 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   In file included from arch/openrisc/include/asm/atomic.h:131,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/openrisc/include/asm/cmpxchg.h:121:54: note: expected 'volatile void *' but argument is of type 'int'
     121 | static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
         |                                       ~~~~~~~~~~~~~~~^~~
   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
   include/linux/bpf.h:2137:50: warning: statement with no effect [-Wunused-value]
    2137 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:182:9: note: in expansion of macro 'register_bpf_struct_ops'
     182 |  return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +/__cmpxchg +137 arch/openrisc/include/asm/cmpxchg.h

489e0f802db708 Stafford Horne      2017-03-23  134  
3f1e931d158124 Mark Rutland        2021-05-25  135  #define arch_cmpxchg(ptr, o, n)						\
11595172537788 Stefan Kristiansson 2014-05-13  136  	({								\
11595172537788 Stefan Kristiansson 2014-05-13 @137  		(__typeof__(*(ptr))) __cmpxchg((ptr),			\
11595172537788 Stefan Kristiansson 2014-05-13  138  					       (unsigned long)(o),	\
11595172537788 Stefan Kristiansson 2014-05-13  139  					       (unsigned long)(n),	\
11595172537788 Stefan Kristiansson 2014-05-13  140  					       sizeof(*(ptr)));		\
11595172537788 Stefan Kristiansson 2014-05-13  141  	})
11595172537788 Stefan Kristiansson 2014-05-13  142  

:::::: The code at line 137 was first introduced by commit
:::::: 11595172537788f0007bfc16590aab18f2b9c40f openrisc: add cmpxchg and xchg implementations

:::::: TO: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
:::::: CC: Stafford Horne <shorne@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
