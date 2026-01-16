Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D429E0F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 06:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544326; cv=none; b=W5x5m3XB448O1cyBYTkQBQv7Y9UgWpmuWENfZ6vgAmveJum4MIlSo8xAFH1G2M+UVNfM68wu+R+kh007+OVXtKUBvgBT7TvWYKkA5klTO+z6gsY48OhnK8zJvYjMziD/1wPW2/vHklHt8MCJhATo8w+2QhUHiy0hOcYk8aht8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544326; c=relaxed/simple;
	bh=u4RZ7mAm+/SkKETwK8wVsN8GaNk/f5toAlkqjlnpLI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VUXk9WH0qd6YNFHVgCPoaWdW1Ko1ENVipSA46HKLFNteIRnkVSMG5NvFndrAQPJVisQcgOBZ/oQMHMPppiT51Y+PNbMFS7r/yoG5XiIdmhZtJyEhAdLjhybMhnxj47TOTaN34EuVLITB3DDsXf6mXSdTQnTIdee3RlmpBWYaP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9iZxTPh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9iZxTPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544325; x=1800080325;
  h=date:from:to:cc:subject:message-id;
  bh=u4RZ7mAm+/SkKETwK8wVsN8GaNk/f5toAlkqjlnpLI8=;
  b=G9iZxTPhONLzMPp4MDLNUFs/EKutVVsKACnUo79BSjythT82rPh3ByAs
   wqDeuDy0O81TCS+ZrTU0jWqJkL2EXXVUL/M9Bywvn1Bq4V+U+1YzMXniF
   k6yEwbNpu1TxyGAbR/HBQoN0J83cPTnvttyi4eNu35Wl3s5g5ZUEthcQN
   t4PTyediicWNE800qc5hsUgAUsF9RKSR1r3Grswx53sh+wuQC4snOIgdE
   nSjRHOjolNkZV7LE9K37DakhPOOQXXcA980Tdd/nlG6ihHnG0RSaMyk6i
   HQvAWbt19yznNugdt9XFuz7Hr77I7e8W0k7Wpf6wImliQzaxgnLVPI8/z
   w==;
X-CSE-ConnectionGUID: xQ6ueW9KRQC9VBsKMDnikw==
X-CSE-MsgGUID: HaWoBh/yQFivkgz3PPalMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87275612"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="87275612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:18:44 -0800
X-CSE-ConnectionGUID: QTWTFGsPR+KQSn0NjfMGpA==
X-CSE-MsgGUID: KvsQoMSWTfWX0xpzHFzRxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204953867"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jan 2026 22:18:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdAM-00000000KT4-3pcR;
	Fri, 16 Jan 2026 06:18:38 +0000
Date: Fri, 16 Jan 2026 14:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16]
 arch/sparc/include/asm/cmpxchg_64.h:174:31: warning: initialization of 'int'
 from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast
Message-ID: <202601161426.RXLXU6GO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   efc992015947c3d8e572409425e26d7074570523
commit: 03531b96979ce96d1033c854254ac4d16618ad7c [8/16] mm: introduce BPF OOM struct ops
config: sparc64-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161426.RXLXU6GO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161426.RXLXU6GO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161426.RXLXU6GO-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
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
   include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                  ^~~~~~~~
   mm/bpf_oom.c:107:6: note: in expansion of macro 'cmpxchg'
     if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
         ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
    static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
                                                             ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/sparc/include/asm/cmpxchg.h:5,
                    from arch/sparc/include/asm/atomic_64.h:12,
                    from arch/sparc/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/sparc/include/asm/cmpxchg_64.h:173:17: error: invalid type argument of unary '*' (have 'int')
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
>> arch/sparc/include/asm/cmpxchg_64.h:173:31: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/sparc/include/asm/cmpxchg_64.h:174:17: error: invalid type argument of unary '*' (have 'int')
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
>> arch/sparc/include/asm/cmpxchg_64.h:174:31: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/sparc/include/asm/cmpxchg_64.h:175:18: error: invalid type argument of unary '*' (have 'int')
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
   arch/sparc/include/asm/cmpxchg_64.h:176:36: error: invalid type argument of unary '*' (have 'int')
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
>> arch/sparc/include/asm/cmpxchg_64.h:175:37: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
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
   arch/sparc/include/asm/cmpxchg_64.h:157:26: note: expected 'volatile void *' but argument is of type 'int'
    __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
              ~~~~~~~~~~~~~~~^~~
   In file included from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
   mm/bpf_oom.c:125:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
                               ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   mm/bpf_oom.c:125:28: error: 'struct cgroup_bpf' has no member named 'bpf_oom_link'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
                               ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:48: error: invalid type argument of unary '*' (have 'int')
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                                   ^~~~~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:31: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
     instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
                                  ^~~~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   mm/bpf_oom.c:125:10: note: in expansion of macro 'cmpxchg'
     WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
             ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
    static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
                                                             ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/sparc/include/asm/cmpxchg_64.h:173:17: error: invalid type argument of unary '*' (have 'int')
         __typeof__(*(ptr)) _o_ = (o);      \
                    ^~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:173:31: warning: initialization of 'int' from 'struct bpf_struct_ops_link *' makes integer from pointer without a cast [-Wint-conversion]
         __typeof__(*(ptr)) _o_ = (o);      \
                                  ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:173:31: note: (near initialization for '__ret_warn_on')
         __typeof__(*(ptr)) _o_ = (o);      \
                                  ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:174:17: error: invalid type argument of unary '*' (have 'int')
         __typeof__(*(ptr)) _n_ = (n);      \
                    ^~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:174:31: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
         __typeof__(*(ptr)) _n_ = (n);      \
                                  ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:174:31: note: (near initialization for '__ret_warn_on')
         __typeof__(*(ptr)) _n_ = (n);      \
                                  ^
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:175:18: error: invalid type argument of unary '*' (have 'int')
         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,   \
                     ^~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   arch/sparc/include/asm/cmpxchg_64.h:176:36: error: invalid type argument of unary '*' (have 'int')
            (unsigned long)_n_, sizeof(*(ptr))); \
                                       ^~~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
>> arch/sparc/include/asm/cmpxchg_64.h:175:37: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
         (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,   \
                                        ^~~~~
   include/asm-generic/bug.h:205:25: note: in definition of macro 'WARN_ON'
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
   In file included from arch/sparc/include/asm/cmpxchg.h:5,
                    from arch/sparc/include/asm/atomic_64.h:12,
                    from arch/sparc/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   arch/sparc/include/asm/cmpxchg_64.h:157:26: note: expected 'volatile void *' but argument is of type 'int'
    __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
              ~~~~~~~~~~~~~~~^~~


vim +174 arch/sparc/include/asm/cmpxchg_64.h

d550bbd40c0e10 David Howells 2012-03-28  170  
ff5b4f1ed580c5 Mark Rutland  2021-05-25  171  #define arch_cmpxchg(ptr,o,n)						 \
d550bbd40c0e10 David Howells 2012-03-28  172    ({									 \
d550bbd40c0e10 David Howells 2012-03-28 @173       __typeof__(*(ptr)) _o_ = (o);					 \
d550bbd40c0e10 David Howells 2012-03-28 @174       __typeof__(*(ptr)) _n_ = (n);					 \
d550bbd40c0e10 David Howells 2012-03-28 @175       (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
d550bbd40c0e10 David Howells 2012-03-28  176  				    (unsigned long)_n_, sizeof(*(ptr))); \
d550bbd40c0e10 David Howells 2012-03-28  177    })
d550bbd40c0e10 David Howells 2012-03-28  178  

:::::: The code at line 174 was first introduced by commit
:::::: d550bbd40c0e10aefa05103dadbe0ae42e683707 Disintegrate asm/system.h for Sparc

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
