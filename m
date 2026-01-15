Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5AD238D22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457995; cv=none; b=aKhE23MOkjG/RuEZMj7tMa5Gq7JH/FgQo4hnQEz4GlKOg+B+YjT9ENrUSNJmsEzQl9K6VXQeZF9ktqHDGbk0HDKz83HEfdNLpiIX/HwIfgZ/U1h4o1AEVW/o1+JuDr3AcZk0cHU1dbGzBXul3QFbgbWssG1YPAMULuLRCo6a2dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457995; c=relaxed/simple;
	bh=p+kPyBXtlWNBNrKBcFNYjJwO9CKVx9vTA6LXkydfQO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bqabMFSAys9d4uzrIkcs8//Stksdu7Xy10I18Zn1ONzkydKkRH7WN20FeaE2kqTcFKEe1v2+Ns3TpwiSeTFpIWFpRGLUaGcXjJ7+Of7NsQY4ixJagC14DkW0kFzLzfzKpj7Jcd5OhplQjPFezt34P3H/uY8EGJc5wQ5RAXd+Wh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4qOLDGN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4qOLDGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768457993; x=1799993993;
  h=date:from:to:cc:subject:message-id;
  bh=p+kPyBXtlWNBNrKBcFNYjJwO9CKVx9vTA6LXkydfQO8=;
  b=X4qOLDGNuzM1DHqMSeE3zRhUcVMjnvR3tw5duBQZyMPUptqY3OX1gPBl
   zc/VgOzj8fZarZwcHKsQoRgCWeOLbb4RPfTDGbTblqUFEAG8ZFjl0N5rN
   L6MUrAPiN4xv7TBT4A8oN1O+a2XWvyrrnVmDk01f0X5LGMdzRi/MbCXHa
   WtSZKu48yyU+D3PoCE3DowFW2G19EmgP+9gur3BSSGGHnnRWJrkG0FM8f
   JZAzAdRCFjhE3E5vEaug4BGfx4yezzlwoyVpfNFpSoSjTZPfrkMiq9uBB
   4h4s9+N0rN8mc265EiC3489M69k65CjaHdLp+JEiPYgcS62T3bDxZdBjH
   w==;
X-CSE-ConnectionGUID: uIdJLvrbR/ieXdFZ45X+Vg==
X-CSE-MsgGUID: Gl3QDZrzR9+CF4FK9Uto+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69811870"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69811870"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:19:51 -0800
X-CSE-ConnectionGUID: Kr2xmtukT/+XeNRho+vInw==
X-CSE-MsgGUID: e/b9Pn2BRmOaWXCA3TZSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204497407"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 22:19:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgGhv-00000000Hek-3Iap;
	Thu, 15 Jan 2026 06:19:47 +0000
Date: Thu, 15 Jan 2026 14:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.8 8/16]
 arch/sh/include/asm/cmpxchg.h:72:31: error: initialization of 'int' from
 'struct bpf_struct_ops_link *' makes integer from pointer without a cast
Message-ID: <202601151431.6IemE1Nk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.8
head:   c6a38263f1642e732f3326cd03987c57df957212
commit: 3409da316c6ee953d3ea3229ae33e3b320eb1e57 [8/16] mm: introduce BPF OOM struct ops
config: sh-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151431.6IemE1Nk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151431.6IemE1Nk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151431.6IemE1Nk-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:770:28: note: in expansion of macro 'rcu_dereference_check'
     770 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:27: note: in expansion of macro 'rcu_dereference'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                           ^~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:65: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                                                                 ^
   include/linux/compiler_types.h:580:27: note: in definition of macro '__unqual_scalar_typeof'
     580 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:770:28: note: in expansion of macro 'rcu_dereference_check'
     770 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:27: note: in expansion of macro 'rcu_dereference'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                           ^~~~~~~~~~~~~~~
   In file included from ./arch/sh/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380,
                    from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8:
   mm/bpf_oom.c:46:65: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                                                                 ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:532:50: note: in expansion of macro 'READ_ONCE'
     532 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:770:28: note: in expansion of macro 'rcu_dereference_check'
     770 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:27: note: in expansion of macro 'rcu_dereference'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                           ^~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:65: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                                                                 ^
   include/linux/rcupdate.h:535:19: note: in definition of macro '__rcu_dereference_check'
     535 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   include/linux/rcupdate.h:770:28: note: in expansion of macro 'rcu_dereference_check'
     770 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:46:27: note: in expansion of macro 'rcu_dereference'
      46 |                 st_link = rcu_dereference(memcg->css.cgroup->bpf.bpf_oom_link);
         |                           ^~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9:
   mm/bpf_oom.c: In function 'bpf_oom_ops_reg':
   mm/bpf_oom.c:108:31: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4785:16: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   mm/bpf_oom.c:108:31: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4785:33: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4787:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7:
>> arch/sh/include/asm/cmpxchg.h:71:17: error: invalid type argument of unary '*' (have 'int')
      71 |      __typeof__(*(ptr)) _o_ = (o);                                       \
         |                 ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/sh/include/asm/cmpxchg.h:71:31: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      71 |      __typeof__(*(ptr)) _o_ = (o);                                       \
         |                               ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:72:17: error: invalid type argument of unary '*' (have 'int')
      72 |      __typeof__(*(ptr)) _n_ = (n);                                       \
         |                 ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/sh/include/asm/cmpxchg.h:72:31: error: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      72 |      __typeof__(*(ptr)) _n_ = (n);                                       \
         |                               ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:73:18: error: invalid type argument of unary '*' (have 'int')
      73 |      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,           \
         |                  ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:74:64: error: invalid type argument of unary '*' (have 'int')
      74 |                                     (unsigned long)_n_, sizeof(*(ptr))); \
         |                                                                ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
>> arch/sh/include/asm/cmpxchg.h:73:37: error: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
      73 |      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,           \
         |                                     ^~~~~
         |                                     |
         |                                     int
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:108:13: note: in expansion of macro 'cmpxchg'
     108 |         if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         |             ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:56:55: note: expected 'volatile void *' but argument is of type 'int'
      56 | static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
         |                                       ~~~~~~~~~~~~~~~~^~~
   In file included from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:126:35: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                                   ^
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   mm/bpf_oom.c:126:35: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                                   ^
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
>> include/linux/atomic/atomic-instrumented.h:4787:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
>> arch/sh/include/asm/cmpxchg.h:71:17: error: invalid type argument of unary '*' (have 'int')
      71 |      __typeof__(*(ptr)) _o_ = (o);                                       \
         |                 ^~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:71:31: error: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
      71 |      __typeof__(*(ptr)) _o_ = (o);                                       \
         |                               ^
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:71:31: note: (near initialization for '__ret_warn_on')
      71 |      __typeof__(*(ptr)) _o_ = (o);                                       \
         |                               ^
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:72:17: error: invalid type argument of unary '*' (have 'int')
      72 |      __typeof__(*(ptr)) _n_ = (n);                                       \
         |                 ^~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:72:31: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      72 |      __typeof__(*(ptr)) _n_ = (n);                                       \
         |                               ^
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:72:31: note: (near initialization for '__ret_warn_on')
      72 |      __typeof__(*(ptr)) _n_ = (n);                                       \
         |                               ^
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:73:18: error: invalid type argument of unary '*' (have 'int')
      73 |      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,           \
         |                  ^~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:74:64: error: invalid type argument of unary '*' (have 'int')
      74 |                                     (unsigned long)_n_, sizeof(*(ptr))); \
         |                                                                ^~~~~~
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
>> arch/sh/include/asm/cmpxchg.h:73:37: error: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
      73 |      (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,           \
         |                                     ^~~~~
         |                                     |
         |                                     int
   arch/sh/include/asm/bug.h:69:32: note: in definition of macro 'WARN_ON'
      69 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/bpf_oom.c:126:17: note: in expansion of macro 'cmpxchg'
     126 |         WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
         |                 ^~~~~~~
   arch/sh/include/asm/cmpxchg.h:56:55: note: expected 'volatile void *' but argument is of type 'int'
      56 | static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
         |                                       ~~~~~~~~~~~~~~~~^~~
   mm/bpf_oom.c: In function 'bpf_oom_struct_ops_init':
   include/linux/bpf.h:2136:50: warning: statement with no effect [-Wunused-value]
    2136 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_oom.c:183:16: note: in expansion of macro 'register_bpf_struct_ops'
     183 |         return register_bpf_struct_ops(&bpf_oom_bpf_ops, bpf_oom_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +72 arch/sh/include/asm/cmpxchg.h

e839ca528718e6 David Howells 2012-03-28  68  
8c6417551309fe Mark Rutland  2021-05-25  69  #define arch_cmpxchg(ptr,o,n)						 \
e839ca528718e6 David Howells 2012-03-28  70    ({									 \
e839ca528718e6 David Howells 2012-03-28 @71       __typeof__(*(ptr)) _o_ = (o);					 \
e839ca528718e6 David Howells 2012-03-28 @72       __typeof__(*(ptr)) _n_ = (n);					 \
e839ca528718e6 David Howells 2012-03-28 @73       (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
e839ca528718e6 David Howells 2012-03-28  74  				    (unsigned long)_n_, sizeof(*(ptr))); \
e839ca528718e6 David Howells 2012-03-28  75    })
e839ca528718e6 David Howells 2012-03-28  76  

:::::: The code at line 72 was first introduced by commit
:::::: e839ca528718e68cad32a307dc9aabf01ef3eb05 Disintegrate asm/system.h for SH

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
