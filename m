Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78622FF664
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509102; cv=none; b=kjquMD8GGapxulLHzlVynhD6mKcwxTojacEOL2QN4Sb9h1JjVo4LTfR+llWNBs4WEW+x/o8RTfnOd0DyE8gyOxQ9e696cW7egQEhkgT1SisNUrrvmCiaOJKxmXySZCUpASRGBv4CmIa1Yswazqz2zOqk4IbnTr4ouDzZ2rtZnoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509102; c=relaxed/simple;
	bh=IMeJa2kNb2CY6foCsoexYAJYhf+84OdbPBB+odIqAuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cwzpRhluV4dGCRyTgZCBSOxHwLdBiXxfYGCQY+0Xp4y4XT1eQFf6xF4tU+jC94g5xoi28ieKYuEIrlKSEi7etuhyp0u5VC25r5RwHp71EA4KqkEqSZM8e2Wo/SRIsKEZDVUalHQ/GooxOv0PDqvm43YM4pQKf8EKN4xkwRBdWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr1atasM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr1atasM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769509100; x=1801045100;
  h=date:from:to:cc:subject:message-id;
  bh=IMeJa2kNb2CY6foCsoexYAJYhf+84OdbPBB+odIqAuI=;
  b=Zr1atasM7FoZbwvv3oFZkMCxzad0D1XO5I+ndLujene9FxdHkXsjNTQn
   bHewxdFdJHNUqpYY9KXVBjAH72643b2A75Rb2NTjyLEZz0bEjpkNGlPtJ
   vWsNy6JXdN+2X6iuhreFm+35iJRxnUREyCiz77cPtc8ZrLhNbIG5B+lsD
   1v8jyqCUQIipkHkb6iiut9f9/aTq72y0DAq/RMeWt35K3FccKOAq3Yh7W
   0PD8vdhws+DKPfiti9l2D9MbJeo6TBg5Bq6ICNo6rf7WWC6TQ+oIe2oh9
   G/A1iE7nQ8iwceTtQEJDrDRIs+WP+ckRTm9Eev29w/CqlkizR5YqiIpmH
   w==;
X-CSE-ConnectionGUID: 4xmvzTUrRZW5T6hcLzZLyA==
X-CSE-MsgGUID: bCAQnxvmR4+oVqaI9qgjEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82129968"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82129968"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:18:19 -0800
X-CSE-ConnectionGUID: 10j9JRzjQqOKet9cEsXdXQ==
X-CSE-MsgGUID: F028+XX1TQSF4m1bbuyMvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207836956"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2026 02:18:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkg9G-00000000YIs-3Tal;
	Tue, 27 Jan 2026 10:18:14 +0000
Date: Tue, 27 Jan 2026 18:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3 8/18]
 arch/arc/include/asm/cmpxchg.h:46:34: warning: initialization of 'int' from
 'struct bpf_struct_ops_link *' makes integer from pointer without a cast
Message-ID: <202601271844.yqt4wBSr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3
head:   4f455e283257caaedc8070f2806557e6b3d31cae
commit: ce0600c8f5c7ec3ecccdc82513de16ed10686391 [8/18] mm: introduce BPF OOM struct ops
config: arc-randconfig-002-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271844.yqt4wBSr-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271844.yqt4wBSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271844.yqt4wBSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:50:27: note: in expansion of macro 'rcu_dereference_check'
      50 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/workqueue.h:17,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c:50:71: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      50 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                                                                       ^
   include/linux/rcupdate.h:535:19: note: in definition of macro '__rcu_dereference_check'
     535 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   mm/bpf_oom.c:50:27: note: in expansion of macro 'rcu_dereference_check'
      50 |                 st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:115:31: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4785:16: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   mm/bpf_oom.c:115:31: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4785:33: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/arc/include/asm/cmpxchg.h:45:20: error: invalid type argument of unary '*' (have 'int')
      45 |         __typeof__(*(ptr)) _o_ = (old);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/arc/include/asm/cmpxchg.h:45:34: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      45 |         __typeof__(*(ptr)) _o_ = (old);                                 \
         |                                  ^
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:20: error: invalid type argument of unary '*' (have 'int')
      46 |         __typeof__(*(ptr)) _n_ = (new);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/arc/include/asm/cmpxchg.h:46:34: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      46 |         __typeof__(*(ptr)) _n_ = (new);                                 \
         |                                  ^
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:47:20: error: invalid type argument of unary '*' (have 'int')
      47 |         __typeof__(*(ptr)) _prev_;                                      \
         |                    ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:51:38: error: invalid type argument of unary '*' (have 'int')
      51 |                 _prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_); \
         |                                      ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:24:20: error: invalid type argument of unary '*' (have 'int')
      24 |         __typeof__(*(ptr)) _prev;                                       \
         |                    ^~~~~~
   arch/arc/include/asm/cmpxchg.h:54:26: note: in expansion of macro '__cmpxchg'
      54 |                 _prev_ = __cmpxchg(_p_, _o_, _n_);                      \
         |                          ^~~~~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_cmpxchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:45:20: error: invalid type argument of unary '*' (have 'int')
      45 |         __typeof__(*(ptr)) _o_ = (old);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/arc/include/asm/cmpxchg.h:45:34: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      45 |         __typeof__(*(ptr)) _o_ = (old);                                 \
         |                                  ^
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:20: error: invalid type argument of unary '*' (have 'int')
      46 |         __typeof__(*(ptr)) _n_ = (new);                                 \
         |                    ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/arc/include/asm/cmpxchg.h:46:34: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      46 |         __typeof__(*(ptr)) _n_ = (new);                                 \
         |                                  ^
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:47:20: error: invalid type argument of unary '*' (have 'int')
      47 |         __typeof__(*(ptr)) _prev_;                                      \
         |                    ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:51:38: error: invalid type argument of unary '*' (have 'int')
      51 |                 _prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_); \
         |                                      ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/arc/include/asm/cmpxchg.h:24:20: error: invalid type argument of unary '*' (have 'int')
      24 |         __typeof__(*(ptr)) _prev;                                       \
         |                    ^~~~~~
   arch/arc/include/asm/cmpxchg.h:54:26: note: in expansion of macro '__cmpxchg'
      54 |                 _prev_ = __cmpxchg(_p_, _o_, _n_);                      \
         |                          ^~~~~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_cmpxchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:58:9: note: in expansion of macro '__atomic_op_fence'
      58 |         __atomic_op_fence(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:115:13: note: in expansion of macro 'cmpxchg'
     115 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:133:35: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     133 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                                   ^
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:133:17: note: in expansion of macro 'cmpxchg'
     133 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   mm/bpf_oom.c:133:35: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     133 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                                   ^
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:133:17: note: in expansion of macro 'cmpxchg'
     133 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   mm/bpf_oom.c:133:17: note: in expansion of macro 'cmpxchg'
     133 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |


vim +46 arch/arc/include/asm/cmpxchg.h

14e968bad788de Vineet Gupta     2013-01-18  41  
ddc348c44d82d0 Vineet Gupta     2020-05-09  42  #define arch_cmpxchg_relaxed(ptr, old, new)				\
e188f3330a13df Vineet Gupta     2020-05-06  43  ({									\
e188f3330a13df Vineet Gupta     2020-05-06  44  	__typeof__(ptr) _p_ = (ptr);					\
e188f3330a13df Vineet Gupta     2020-05-06 @45  	__typeof__(*(ptr)) _o_ = (old);					\
e188f3330a13df Vineet Gupta     2020-05-06 @46  	__typeof__(*(ptr)) _n_ = (new);					\
e188f3330a13df Vineet Gupta     2020-05-06  47  	__typeof__(*(ptr)) _prev_;					\
e188f3330a13df Vineet Gupta     2020-05-06  48  									\
e188f3330a13df Vineet Gupta     2020-05-06  49  	switch(sizeof((_p_))) {						\
f2519d4d4fc4d3 Paul E. McKenney 2024-03-18  50  	case 1:								\
1e8af9f04346ec Paul E. McKenney 2024-10-09  51  		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
f2519d4d4fc4d3 Paul E. McKenney 2024-03-18  52  		break;							\
e188f3330a13df Vineet Gupta     2020-05-06  53  	case 4:								\
e188f3330a13df Vineet Gupta     2020-05-06  54  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
e188f3330a13df Vineet Gupta     2020-05-06  55  		break;							\
e188f3330a13df Vineet Gupta     2020-05-06  56  	default:							\
e188f3330a13df Vineet Gupta     2020-05-06  57  		BUILD_BUG();						\
e188f3330a13df Vineet Gupta     2020-05-06  58  	}								\
e188f3330a13df Vineet Gupta     2020-05-06  59  	_prev_;								\
e188f3330a13df Vineet Gupta     2020-05-06  60  })
14e968bad788de Vineet Gupta     2013-01-18  61  

:::::: The code at line 46 was first introduced by commit
:::::: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe

:::::: TO: Vineet Gupta <vgupta@kernel.org>
:::::: CC: Vineet Gupta <vgupta@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
