Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793D3385B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509102; cv=none; b=sOT4Y3e/XqKOUpe4YGHwCY5+nQcjNORQtTJjxA5XP76rXmxDq6Hq3VmNOvBJzpwOZ4iF2FmkJvH5rwy3Ohgbaz0K9oZsCI8tjLNyaXjTNxP/UafpsakAwYGXNAs7WIujyiL9iINjSdCIYA2SNhmIVk/vDgetBkknJ8qkr8Cwe94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509102; c=relaxed/simple;
	bh=zUEA3nYzm1bp9tTLZrcSPhADEnJx1W4v9UucolxzNFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHrq1PFwaSmzZn/O062XQHnw9W8bxTtoxR/QiMKiqNu4WBnBujAX0oDb5BQc27Kv1eU/hpeDEfAHWTnqOy/rC1T1db/9gBqSY5WpK1IBxmtnV45mBHwK4CBxW7ksagpbtG0DxxGGwTXMAHFDrvbkTiHKcQxlskv5dBo4hWnXEAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig06aMvc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig06aMvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769509100; x=1801045100;
  h=date:from:to:cc:subject:message-id;
  bh=zUEA3nYzm1bp9tTLZrcSPhADEnJx1W4v9UucolxzNFc=;
  b=Ig06aMvcHmBEjHbXHm6WQAxAbBk6UpHqrIIduF4S4yGalmXn6BeprSP8
   XYU40+cCm9Xn2jtNUcM4aGi8La/nVrd5212pgmKekdchLvrvZu2vSHnQQ
   uvQviaTOVB4qDfMTmMwMstp3QkW3YRlKBQ10EPGKM6DDTTUpJUIdbf2GZ
   JMs1Of+tBBTHG/VKXYGeGXE7hB1lOZ11hUW59Ys7CoAu6mLT54x8Lcz+P
   qrNJrhgRGSvaht3rlmgV5gwM0r/FW/6kyAxq87wRxNPqj6lJNUSIyWgP6
   UsqyI97vaQS2SoP/BtactOPw/l9PEx2l1CRpKno914Hh1PJLxs7o/VlHH
   Q==;
X-CSE-ConnectionGUID: JZMN2lRxSguIW64KGvv8RA==
X-CSE-MsgGUID: J9fJ2fSnQEqgHoKZ/Jookw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93358886"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93358886"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:18:19 -0800
X-CSE-ConnectionGUID: 2HuKHihnRbK3mTF6PksJew==
X-CSE-MsgGUID: a73/WLj/THW7c7TC22u0yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212798708"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 02:18:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkg9G-00000000YIv-3aIn;
	Tue, 27 Jan 2026 10:18:14 +0000
Date: Tue, 27 Jan 2026 18:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3 8/18]
 arch/xtensa/include/asm/cmpxchg.h:87:30: warning: initialization of 'int'
 from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast
Message-ID: <202601271851.FG99nPGp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3
head:   4f455e283257caaedc8070f2806557e6b3d31cae
commit: ce0600c8f5c7ec3ecccdc82513de16ed10686391 [8/18] mm: introduce BPF OOM struct ops
config: xtensa-randconfig-r053-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271851.FG99nPGp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271851.FG99nPGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271851.FG99nPGp-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                                        ^
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:50:13: note: in expansion of macro 'rcu_dereference_check'
      50 |   st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/workqueue.h:17,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c:50:57: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      50 |   st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                         ^
   include/linux/rcupdate.h:535:12: note: in definition of macro '__rcu_dereference_check'
     535 |  ((typeof(*p) __force __kernel *)(local)); \
         |            ^
   mm/bpf_oom.c:50:13: note: in expansion of macro 'rcu_dereference_check'
      50 |   st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/xtensa/include/asm/bitops.h:215,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:115:24: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                        ^
   include/linux/atomic/atomic-instrumented.h:4785:9: note: in definition of macro 'cmpxchg'
    4785 |  typeof(ptr) __ai_ptr = (ptr); \
         |         ^~~
   mm/bpf_oom.c:115:24: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                        ^
   include/linux/atomic/atomic-instrumented.h:4785:26: note: in definition of macro 'cmpxchg'
    4785 |  typeof(ptr) __ai_ptr = (ptr); \
         |                          ^~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                ^~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                               ^~~~~~~~
         |                               |
         |                               int
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/xtensa/include/asm/bitops.h:208,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/xtensa/include/asm/bitops.h:215,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/xtensa/include/asm/cmpxchg.h:86:16: error: invalid type argument of unary '*' (have 'int')
      86 |  ({ __typeof__(*(ptr)) _o_ = (o);          \
         |                ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
>> arch/xtensa/include/asm/cmpxchg.h:86:30: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      86 |  ({ __typeof__(*(ptr)) _o_ = (o);          \
         |                              ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:87:16: error: invalid type argument of unary '*' (have 'int')
      87 |     __typeof__(*(ptr)) _n_ = (n);          \
         |                ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
>> arch/xtensa/include/asm/cmpxchg.h:87:30: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      87 |     __typeof__(*(ptr)) _n_ = (n);          \
         |                              ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:17: error: invalid type argument of unary '*' (have 'int')
      88 |     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
         |                 ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:89:44: error: invalid type argument of unary '*' (have 'int')
      89 |                (unsigned long)_n_, sizeof (*(ptr))); \
         |                                            ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
>> arch/xtensa/include/asm/cmpxchg.h:88:36: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
      88 |     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
         |                                    ^~~~~
         |                                    |
         |                                    int
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:115:6: note: in expansion of macro 'cmpxchg'
     115 |  if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |      ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:75:26: note: expected 'volatile void *' but argument is of type 'int'
      75 | __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
         |           ~~~~~~~~~~~~~~~^~~
   In file included from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:133:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                            ^
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   mm/bpf_oom.c:133:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                            ^
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                ^~~~~~~~~
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |  instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                               ^~~~~~~~
         |                               |
         |                               int
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/xtensa/include/asm/bitops.h:208,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/xtensa/include/asm/cmpxchg.h:86:16: error: invalid type argument of unary '*' (have 'int')
      86 |  ({ __typeof__(*(ptr)) _o_ = (o);          \
         |                ^~~~~~
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:86:30: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      86 |  ({ __typeof__(*(ptr)) _o_ = (o);          \
         |                              ^
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
--
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:86:30: note: (near initialization for '__ret_warn_on')
      86 |  ({ __typeof__(*(ptr)) _o_ = (o);          \
         |                              ^
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:87:16: error: invalid type argument of unary '*' (have 'int')
      87 |     __typeof__(*(ptr)) _n_ = (n);          \
         |                ^~~~~~
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:87:30: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      87 |     __typeof__(*(ptr)) _n_ = (n);          \
         |                              ^
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:87:30: note: (near initialization for '__ret_warn_on')
      87 |     __typeof__(*(ptr)) _n_ = (n);          \
         |                              ^
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:17: error: invalid type argument of unary '*' (have 'int')
      88 |     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
         |                 ^~~~~~
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:89:44: error: invalid type argument of unary '*' (have 'int')
      89 |                (unsigned long)_n_, sizeof (*(ptr))); \
         |                                            ^~~~~~
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
>> arch/xtensa/include/asm/cmpxchg.h:88:36: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
      88 |     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
         |                                    ^~~~~
         |                                    |
         |                                    int
   include/asm-generic/bug.h:155:25: note: in definition of macro 'WARN_ON'
     155 |  int __ret_warn_on = !!(condition);    \
         |                         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:2: note: in expansion of macro 'raw_cmpxchg'
    4788 |  raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |  ^~~~~~~~~~~
   mm/bpf_oom.c:133:10: note: in expansion of macro 'cmpxchg'
     133 |  WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |          ^~~~~~~
   In file included from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/xtensa/include/asm/bitops.h:215,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/xtensa/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/xtensa/include/asm/cmpxchg.h:75:26: note: expected 'volatile void *' but argument is of type 'int'
      75 | __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
         |           ~~~~~~~~~~~~~~~^~~
   In file included from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
   include/linux/bpf.h:2147:50: warning: statement with no effect [-Wunused-value]
    2147 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:190:9: note: in expansion of macro 'register_bpf_struct_ops'
     190 |  return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +87 arch/xtensa/include/asm/cmpxchg.h

f9aa7e1882f3ce David Howells 2012-03-28  84  
b9b12978a8e9a4 Mark Rutland  2021-05-25  85  #define arch_cmpxchg(ptr,o,n)						      \
f9aa7e1882f3ce David Howells 2012-03-28 @86  	({ __typeof__(*(ptr)) _o_ = (o);				      \
f9aa7e1882f3ce David Howells 2012-03-28 @87  	   __typeof__(*(ptr)) _n_ = (n);				      \
f9aa7e1882f3ce David Howells 2012-03-28 @88  	   (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,	      \
f9aa7e1882f3ce David Howells 2012-03-28  89  	   			        (unsigned long)_n_, sizeof (*(ptr))); \
f9aa7e1882f3ce David Howells 2012-03-28  90  	})
f9aa7e1882f3ce David Howells 2012-03-28  91  

:::::: The code at line 87 was first introduced by commit
:::::: f9aa7e1882f3ceec919b30f64a2ce6e66a2571b1 Disintegrate asm/system.h for Xtensa

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
