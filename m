Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9527842A82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753877719; cv=none; b=jpCeN4bWWlblrsaC5yqgwBfDpuwuTXS6Z4Lp90Rr1g5zzwBMwgNPaeTBHh+eOQ6B3oxCxcdBA5ZVMIYVYBOycq0qHqqRanmektCjM/0fSqcjDMNlXybxMprYxnf/V0auW5XWl2nqFKMfbxWD/GnMWgZRCXfs7/hLyql+Wz9Ei0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753877719; c=relaxed/simple;
	bh=9rJRR1h6YHomyk8+zSKwAkU+7rPzgBoh5p4c6Y8Djws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGMQrvOtVJjTiElAb67Jfk1cPjeqGy0/hUisNGpBpuj6OT4lxr0TdBfq/hZnsd0hnMMz6ZtnxPgkjcPPv3SB/+eoWg44STWI0dGcEHzCCGBUU1f942jNozpC43j/0AhY0pjGmDvL3FKfac6HcbeD35oF5nsIHEM91j0g4idzIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1hmljZM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1hmljZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753877717; x=1785413717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rJRR1h6YHomyk8+zSKwAkU+7rPzgBoh5p4c6Y8Djws=;
  b=A1hmljZMVb2AAaK/ZaJvsGv0rI04BNFfN0VFIBpKyKVqPPxemLxmGt/7
   I95oLEu0zQuelwA6VysIiYTj2H3IaCMbb4rsqK46M4HXla4qopnp5kGC5
   Lud8DY57EtmXNiBtjgxCEyk1g+Rov4Hq89dBFxgRqUsXrxYbpvX9Vlvou
   54TkjOhzA9hHD6Vm97SJ8GuSnxK/z2yuuBUMDXM7iE4sLDhOjD3d81efv
   TXbzmgC3Sax4QNmMyiucaRJyhvy23kiaNZNfSDJ32XjBEGGOJY5ijZlXc
   blbTZRi4ohslhxQDVe7+CtUKPNqarAh29L9zz4iDBRkwvUC6hZ66cMVHn
   w==;
X-CSE-ConnectionGUID: M6ybm5rBTlatQf0B9VAcKw==
X-CSE-MsgGUID: HrZk/l7ERxeXYgQAveZqHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="78724781"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="78724781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 05:15:16 -0700
X-CSE-ConnectionGUID: IRyaOFcPQhC2i8zBgXPXEw==
X-CSE-MsgGUID: kFkpvVtbQvGOitqd3ECUeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162853025"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2025 05:15:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh5iC-0002i0-2L;
	Wed, 30 Jul 2025 12:15:12 +0000
Date: Wed, 30 Jul 2025 20:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/umh-h 6/6]
 arch/openrisc/include/asm/cmpxchg.h:166:50: error: passing argument 1 of
 '__arch_xchg' makes pointer from integer without a cast
Message-ID: <202507302044.Nz8iNJq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/umh-h
head:   15d07db86bdfa4c328a18630d82990d592395d4d
commit: 15d07db86bdfa4c328a18630d82990d592395d4d [6/6] modules/kmod: remove transitive of umh.h
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250730/202507302044.Nz8iNJq1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507302044.Nz8iNJq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302044.Nz8iNJq1-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/umh.c:39:49: warning: 'struct subprocess_info' declared inside parameter list will not be visible outside of this definition or declaration
      39 | static void call_usermodehelper_freeinfo(struct subprocess_info *info)
         |                                                 ^~~~~~~~~~~~~~~
   kernel/umh.c: In function 'call_usermodehelper_freeinfo':
   kernel/umh.c:41:17: error: invalid use of undefined type 'struct subprocess_info'
      41 |         if (info->cleanup)
         |                 ^~
   kernel/umh.c:42:23: error: invalid use of undefined type 'struct subprocess_info'
      42 |                 (*info->cleanup)(info);
         |                       ^~
   kernel/umh.c: At top level:
   kernel/umh.c:46:33: warning: 'struct subprocess_info' declared inside parameter list will not be visible outside of this definition or declaration
      46 | static void umh_complete(struct subprocess_info *sub_info)
         |                                 ^~~~~~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from kernel/umh.c:5:
   kernel/umh.c: In function 'umh_complete':
   kernel/umh.c:48:49: error: invalid use of undefined type 'struct subprocess_info'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                                 ^~
   include/linux/atomic/atomic-instrumented.h:4755:16: note: in definition of macro 'xchg'
    4755 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   kernel/umh.c:48:49: error: invalid use of undefined type 'struct subprocess_info'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                                 ^~
   include/linux/atomic/atomic-instrumented.h:4755:33: note: in definition of macro 'xchg'
    4755 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4757:55: error: invalid type argument of unary '*' (have 'int')
    4757 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   include/linux/atomic/atomic-instrumented.h:4757:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4757 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/openrisc/include/asm/atomic.h:131,
                    from include/linux/atomic.h:7:
   arch/openrisc/include/asm/cmpxchg.h:166:29: error: invalid type argument of unary '*' (have 'int')
     166 |                 (__typeof__(*(ptr))) __arch_xchg((ptr),                 \
         |                             ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   arch/openrisc/include/asm/cmpxchg.h:168:57: error: invalid type argument of unary '*' (have 'int')
     168 |                                                  sizeof(*(ptr)));       \
         |                                                         ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
>> arch/openrisc/include/asm/cmpxchg.h:166:50: error: passing argument 1 of '__arch_xchg' makes pointer from integer without a cast [-Wint-conversion]
     166 |                 (__typeof__(*(ptr))) __arch_xchg((ptr),                 \
         |                                                  ^~~~~
         |                                                  |
         |                                                  int
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   arch/openrisc/include/asm/cmpxchg.h:151:28: note: expected 'volatile void *' but argument is of type 'int'
     151 | __arch_xchg(volatile void *ptr, unsigned long with, int size)
         |             ~~~~~~~~~~~~~~~^~~
   kernel/umh.c:57:46: error: passing argument 1 of 'call_usermodehelper_freeinfo' from incompatible pointer type [-Wincompatible-pointer-types]
      57 |                 call_usermodehelper_freeinfo(sub_info);
         |                                              ^~~~~~~~
         |                                              |
         |                                              struct subprocess_info *
   kernel/umh.c:39:66: note: expected 'struct subprocess_info *' but argument is of type 'struct subprocess_info *'
      39 | static void call_usermodehelper_freeinfo(struct subprocess_info *info)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/umh.c: In function 'call_usermodehelper_exec_async':
   kernel/umh.c:98:21: error: invalid use of undefined type 'struct subprocess_info'
      98 |         if (sub_info->init) {
         |                     ^~
   kernel/umh.c:99:34: error: invalid use of undefined type 'struct subprocess_info'
      99 |                 retval = sub_info->init(sub_info, new);
         |                                  ^~
   kernel/umh.c:109:40: error: invalid use of undefined type 'struct subprocess_info'
     109 |         retval = kernel_execve(sub_info->path,
         |                                        ^~
   kernel/umh.c:110:61: error: invalid use of undefined type 'struct subprocess_info'
     110 |                                (const char *const *)sub_info->argv,
         |                                                             ^~
   kernel/umh.c:111:61: error: invalid use of undefined type 'struct subprocess_info'
     111 |                                (const char *const *)sub_info->envp);
         |                                                             ^~
   kernel/umh.c:113:17: error: invalid use of undefined type 'struct subprocess_info'
     113 |         sub_info->retval = retval;
         |                 ^~
   kernel/umh.c:118:23: error: invalid use of undefined type 'struct subprocess_info'
     118 |         if (!(sub_info->wait & UMH_WAIT_PROC))
         |                       ^~
   kernel/umh.c:118:32: error: 'UMH_WAIT_PROC' undeclared (first use in this function)
     118 |         if (!(sub_info->wait & UMH_WAIT_PROC))
         |                                ^~~~~~~~~~~~~
   kernel/umh.c:118:32: note: each undeclared identifier is reported only once for each function it appears in
   kernel/umh.c:119:30: error: passing argument 1 of 'umh_complete' from incompatible pointer type [-Wincompatible-pointer-types]
     119 |                 umh_complete(sub_info);
         |                              ^~~~~~~~
         |                              |
         |                              struct subprocess_info *
   kernel/umh.c:46:50: note: expected 'struct subprocess_info *' but argument is of type 'struct subprocess_info *'
      46 | static void umh_complete(struct subprocess_info *sub_info)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   kernel/umh.c: At top level:
   kernel/umh.c:126:50: warning: 'struct subprocess_info' declared inside parameter list will not be visible outside of this definition or declaration
     126 | static void call_usermodehelper_exec_sync(struct subprocess_info *sub_info)
         |                                                  ^~~~~~~~~~~~~~~
   kernel/umh.c: In function 'call_usermodehelper_exec_sync':
   kernel/umh.c:134:25: error: invalid use of undefined type 'struct subprocess_info'
     134 |                 sub_info->retval = pid;
         |                         ^~
   kernel/umh.c:136:43: error: invalid use of undefined type 'struct subprocess_info'
     136 |                 kernel_wait(pid, &sub_info->retval);
         |                                           ^~
   kernel/umh.c:140:22: error: passing argument 1 of 'umh_complete' from incompatible pointer type [-Wincompatible-pointer-types]
     140 |         umh_complete(sub_info);
         |                      ^~~~~~~~
         |                      |
         |                      struct subprocess_info *
   kernel/umh.c:46:50: note: expected 'struct subprocess_info *' but argument is of type 'struct subprocess_info *'
      46 | static void umh_complete(struct subprocess_info *sub_info)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   kernel/umh.c: In function 'call_usermodehelper_exec_work':
   include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct subprocess_info'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   kernel/umh.c:160:17: note: in expansion of macro 'container_of'
     160 |                 container_of(work, struct subprocess_info, work);
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:507:27: error: expression in static assertion is not an integer
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
--
     377 |         sub_info->init = init;
         |                 ^~
   kernel/umh.c:378:17: error: invalid use of undefined type 'struct subprocess_info'
     378 |         sub_info->data = data;
         |                 ^~
   kernel/umh.c: At top level:
   kernel/umh.c:401:5: warning: no previous prototype for 'call_usermodehelper_exec' [-Wmissing-prototypes]
     401 | int call_usermodehelper_exec(struct subprocess_info *sub_info, int wait)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/umh.c: In function 'call_usermodehelper_exec':
   kernel/umh.c:407:22: error: invalid use of undefined type 'struct subprocess_info'
     407 |         if (!sub_info->path) {
         |                      ^~
   kernel/umh.c:408:46: error: passing argument 1 of 'call_usermodehelper_freeinfo' from incompatible pointer type [-Wincompatible-pointer-types]
     408 |                 call_usermodehelper_freeinfo(sub_info);
         |                                              ^~~~~~~~
         |                                              |
         |                                              struct subprocess_info *
   kernel/umh.c:39:66: note: expected 'struct subprocess_info *' but argument is of type 'struct subprocess_info *'
      39 | static void call_usermodehelper_freeinfo(struct subprocess_info *info)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/umh.c:412:13: error: 'usermodehelper_disabled' has an incomplete type 'enum umh_disable_depth'
     412 |         if (usermodehelper_disabled) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/umh.c:422:28: error: invalid use of undefined type 'struct subprocess_info'
     422 |         if (strlen(sub_info->path) == 0)
         |                            ^~
   kernel/umh.c:430:17: error: invalid use of undefined type 'struct subprocess_info'
     430 |         sub_info->complete = (wait == UMH_NO_WAIT) ? NULL : &done;
         |                 ^~
   kernel/umh.c:430:39: error: 'UMH_NO_WAIT' undeclared (first use in this function)
     430 |         sub_info->complete = (wait == UMH_NO_WAIT) ? NULL : &done;
         |                                       ^~~~~~~~~~~
   kernel/umh.c:431:17: error: invalid use of undefined type 'struct subprocess_info'
     431 |         sub_info->wait = wait;
         |                 ^~
   kernel/umh.c:433:48: error: invalid use of undefined type 'struct subprocess_info'
     433 |         queue_work(system_unbound_wq, &sub_info->work);
         |                                                ^~
   kernel/umh.c:437:20: error: 'UMH_FREEZABLE' undeclared (first use in this function); did you mean 'KTW_FREEZABLE'?
     437 |         if (wait & UMH_FREEZABLE)
         |                    ^~~~~~~~~~~~~
         |                    KTW_FREEZABLE
   kernel/umh.c:440:20: error: 'UMH_KILLABLE' undeclared (first use in this function); did you mean 'TASK_KILLABLE'?
     440 |         if (wait & UMH_KILLABLE) {
         |                    ^~~~~~~~~~~~
         |                    TASK_KILLABLE
   kernel/umh.c:446:35: error: invalid use of undefined type 'struct subprocess_info'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                                   ^~
   include/linux/atomic/atomic-instrumented.h:4755:16: note: in definition of macro 'xchg'
    4755 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   kernel/umh.c:446:35: error: invalid use of undefined type 'struct subprocess_info'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                                   ^~
   include/linux/atomic/atomic-instrumented.h:4755:33: note: in definition of macro 'xchg'
    4755 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
   include/linux/atomic/atomic-instrumented.h:4757:55: error: invalid type argument of unary '*' (have 'int')
    4757 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
   include/linux/atomic/atomic-instrumented.h:4757:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4757 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   arch/openrisc/include/asm/cmpxchg.h:166:29: error: invalid type argument of unary '*' (have 'int')
     166 |                 (__typeof__(*(ptr))) __arch_xchg((ptr),                 \
         |                             ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
   arch/openrisc/include/asm/cmpxchg.h:168:57: error: invalid type argument of unary '*' (have 'int')
     168 |                                                  sizeof(*(ptr)));       \
         |                                                         ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
>> arch/openrisc/include/asm/cmpxchg.h:166:50: error: passing argument 1 of '__arch_xchg' makes pointer from integer without a cast [-Wint-conversion]
     166 |                 (__typeof__(*(ptr))) __arch_xchg((ptr),                 \
         |                                                  ^~~~~
         |                                                  |
         |                                                  int
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
   arch/openrisc/include/asm/cmpxchg.h:151:28: note: expected 'volatile void *' but argument is of type 'int'
     151 | __arch_xchg(volatile void *ptr, unsigned long with, int size)
         |             ~~~~~~~~~~~~~~~^~~
   kernel/umh.c:460:26: error: invalid use of undefined type 'struct subprocess_info'
     460 |         retval = sub_info->retval;
         |                          ^~
   kernel/umh.c:462:38: error: passing argument 1 of 'call_usermodehelper_freeinfo' from incompatible pointer type [-Wincompatible-pointer-types]
     462 |         call_usermodehelper_freeinfo(sub_info);
         |                                      ^~~~~~~~
         |                                      |
         |                                      struct subprocess_info *
   kernel/umh.c:39:66: note: expected 'struct subprocess_info *' but argument is of type 'struct subprocess_info *'
      39 | static void call_usermodehelper_freeinfo(struct subprocess_info *info)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/umh.c: At top level:
   kernel/umh.c:482:5: warning: no previous prototype for 'call_usermodehelper' [-Wmissing-prototypes]
     482 | int call_usermodehelper(const char *path, char **argv, char **envp, int wait)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/umh.c: In function 'call_usermodehelper':
   kernel/umh.c:485:35: error: 'UMH_NO_WAIT' undeclared (first use in this function)
     485 |         gfp_t gfp_mask = (wait == UMH_NO_WAIT) ? GFP_ATOMIC : GFP_KERNEL;
         |                                   ^~~~~~~~~~~
   kernel/umh.c: At top level:
   kernel/umh.c:186:31: error: storage size of 'usermodehelper_disabled' isn't known
     186 | static enum umh_disable_depth usermodehelper_disabled = UMH_DISABLED;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__arch_xchg +166 arch/openrisc/include/asm/cmpxchg.h

11595172537788 Stefan Kristiansson 2014-05-13  163  
3f1e931d158124 Mark Rutland        2021-05-25  164  #define arch_xchg(ptr, with) 						\
8af42949d16813 Stafford Horne      2017-03-13  165  	({								\
068550631fbe0b Andrzej Hajda       2023-01-18 @166  		(__typeof__(*(ptr))) __arch_xchg((ptr),			\
489e0f802db708 Stafford Horne      2017-03-23  167  						 (unsigned long)(with),	\
8af42949d16813 Stafford Horne      2017-03-13  168  						 sizeof(*(ptr)));	\
8af42949d16813 Stafford Horne      2017-03-13  169  	})
11595172537788 Stefan Kristiansson 2014-05-13  170  

:::::: The code at line 166 was first introduced by commit
:::::: 068550631fbe0b7fb41625cea6fb204fdc8cb224 locking/arch: Rename all internal __xchg() names to __arch_xchg()

:::::: TO: Andrzej Hajda <andrzej.hajda@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
