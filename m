Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE6299AB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882169; cv=none; b=pi/A6UMsKnpT+3PEi9Yvpb0Hkgq+Md2kWP06vRh7TJ6uekqu34U+gVfzahhGPFZulGKHfcEc8ejjLvAypWB/5fBcQugplfY1T4wtT8r0HL5xdBadoXb4GVm58UVDd5VlZBaeqMQRhmmvTQT5xvxnLhV8xjfxw57Mkgw46oSBcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882169; c=relaxed/simple;
	bh=B7mEzi4modlLaUCvFG0gKOgKYJPXpq07Lf2xMlom6lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlAnZd+o0I5JRccbQuTQr5pKr06X7PTNsHQp+atKZUhIQq+qPFQfbYy23ZneTSz3LJ5QhCtNVOV+YSNOU3ciJltiiZXr2ZEgx56hflSWMA6N69wcC2Vdj+ELV6OYmcGjf1wS42PDZKbuljTfDzQQgi5ErD1WBcQUH6oEM0KPe5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYZIJ/X6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYZIJ/X6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753882167; x=1785418167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B7mEzi4modlLaUCvFG0gKOgKYJPXpq07Lf2xMlom6lA=;
  b=cYZIJ/X6mbBvavdUovIvPP19RPXamp9050TAuhZEt0+Dku6JMgu8N8Tp
   X+2x9mnzwSt8ODYmHLLrtauY6C88/ZjjIABTzQVrY404aKOnDl036uMrz
   M2iij8uMIDS9+i3tfSs5HRtFzk6Mb7y5cgLM4apM73w3BKqtB2zEtQQhE
   31/2rinQCpuse13oVcA4YIu0+ig5VqJaKC49MMxqi0AgHICMq6sUSqcb/
   WbqCfRJixjDrNcNs4/pHBcTSFRMqT1y4x7wpZxJ7TzjXS7fwRIbT9z01W
   CrYggFGEQwrWX283YvO5JAS/tVNBX7CZprkgfKxTaFiJ9GatbDdc25DcW
   A==;
X-CSE-ConnectionGUID: sbPXlJZkSoGI8ptvgbfC+g==
X-CSE-MsgGUID: OqBbSzKSSHKW5M5KEkWpyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="78731475"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="78731475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 06:29:26 -0700
X-CSE-ConnectionGUID: 0yjrxfAaRy227hkOpz3Ktg==
X-CSE-MsgGUID: hkgZ30utTNmrAqmyPFQ6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162864425"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2025 06:29:25 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh6ry-0002mg-1V;
	Wed, 30 Jul 2025 13:29:22 +0000
Date: Wed, 30 Jul 2025 21:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/umh-h 6/6]
 arch/sh/include/asm/cmpxchg.h:29:37: warning: initialization of 'volatile
 void *' from 'int' makes pointer from integer without a cast
Message-ID: <202507302136.KufZpZCB-lkp@intel.com>
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
config: sh-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507302136.KufZpZCB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507302136.KufZpZCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302136.KufZpZCB-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
                    from arch/sh/include/asm/bitops.h:63,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
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
   include/linux/atomic/atomic-instrumented.h:4757:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
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
   In file included from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7:
   arch/sh/include/asm/cmpxchg.h:50:22: error: invalid type argument of unary '*' (have 'int')
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                      ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
>> arch/sh/include/asm/cmpxchg.h:29:37: warning: initialization of 'volatile void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      29 |         volatile void *__xchg_ptr = (ptr);              \
         |                                     ^
   arch/sh/include/asm/cmpxchg.h:50:30: note: in expansion of macro '__arch_xchg'
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                              ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   arch/sh/include/asm/cmpxchg.h:29:37: note: (near initialization for 'comp')
      29 |         volatile void *__xchg_ptr = (ptr);              \
         |                                     ^
   arch/sh/include/asm/cmpxchg.h:50:30: note: in expansion of macro '__arch_xchg'
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                              ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   arch/sh/include/asm/cmpxchg.h:50:75: error: invalid type argument of unary '*' (have 'int')
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                                                                           ^~~~~~
   arch/sh/include/asm/cmpxchg.h:30:17: note: in definition of macro '__arch_xchg'
      30 |         switch (size) {                                 \
         |                 ^~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:48:35: note: in expansion of macro 'xchg'
      48 |         struct completion *comp = xchg(&sub_info->complete, NULL);
         |                                   ^~~~
   kernel/umh.c:57:46: error: passing argument 1 of 'call_usermodehelper_freeinfo' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   kernel/umh.c:119:30: error: passing argument 1 of 'umh_complete' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   kernel/umh.c:140:22: error: passing argument 1 of 'umh_complete' from incompatible pointer type [-Werror=incompatible-pointer-types]
     140 |         umh_complete(sub_info);
         |                      ^~~~~~~~
--
     371 |         sub_info->path = path;
         |                 ^~
   kernel/umh.c:373:17: error: invalid use of undefined type 'struct subprocess_info'
     373 |         sub_info->argv = argv;
         |                 ^~
   kernel/umh.c:374:17: error: invalid use of undefined type 'struct subprocess_info'
     374 |         sub_info->envp = envp;
         |                 ^~
   kernel/umh.c:376:17: error: invalid use of undefined type 'struct subprocess_info'
     376 |         sub_info->cleanup = cleanup;
         |                 ^~
   kernel/umh.c:377:17: error: invalid use of undefined type 'struct subprocess_info'
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
   kernel/umh.c:408:46: error: passing argument 1 of 'call_usermodehelper_freeinfo' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   include/linux/atomic/atomic-instrumented.h:4757:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
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
   arch/sh/include/asm/cmpxchg.h:50:22: error: invalid type argument of unary '*' (have 'int')
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                      ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
>> arch/sh/include/asm/cmpxchg.h:29:37: warning: initialization of 'volatile void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      29 |         volatile void *__xchg_ptr = (ptr);              \
         |                                     ^
   arch/sh/include/asm/cmpxchg.h:50:30: note: in expansion of macro '__arch_xchg'
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                              ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
   arch/sh/include/asm/cmpxchg.h:50:75: error: invalid type argument of unary '*' (have 'int')
      50 |         ((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
         |                                                                           ^~~~~~
   arch/sh/include/asm/cmpxchg.h:30:17: note: in definition of macro '__arch_xchg'
      30 |         switch (size) {                                 \
         |                 ^~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/umh.c:446:21: note: in expansion of macro 'xchg'
     446 |                 if (xchg(&sub_info->complete, NULL))
         |                     ^~~~
   kernel/umh.c:460:26: error: invalid use of undefined type 'struct subprocess_info'
     460 |         retval = sub_info->retval;
         |                          ^~
   kernel/umh.c:462:38: error: passing argument 1 of 'call_usermodehelper_freeinfo' from incompatible pointer type [-Werror=incompatible-pointer-types]
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


vim +29 arch/sh/include/asm/cmpxchg.h

e839ca528718e6 David Howells      2012-03-28  25  
068550631fbe0b Andrzej Hajda      2023-01-18  26  #define __arch_xchg(ptr, x, size)				\
e839ca528718e6 David Howells      2012-03-28  27  ({							\
e839ca528718e6 David Howells      2012-03-28  28  	unsigned long __xchg__res;			\
e839ca528718e6 David Howells      2012-03-28 @29  	volatile void *__xchg_ptr = (ptr);		\
e839ca528718e6 David Howells      2012-03-28  30  	switch (size) {					\
e839ca528718e6 David Howells      2012-03-28  31  	case 4:						\
e839ca528718e6 David Howells      2012-03-28  32  		__xchg__res = xchg_u32(__xchg_ptr, x);	\
e839ca528718e6 David Howells      2012-03-28  33  		break;					\
3226aad81aa670 Michael S. Tsirkin 2016-01-07  34  	case 2:						\
3226aad81aa670 Michael S. Tsirkin 2016-01-07  35  		__xchg__res = xchg_u16(__xchg_ptr, x);	\
3226aad81aa670 Michael S. Tsirkin 2016-01-07  36  		break;					\
e839ca528718e6 David Howells      2012-03-28  37  	case 1:						\
e839ca528718e6 David Howells      2012-03-28  38  		__xchg__res = xchg_u8(__xchg_ptr, x);	\
e839ca528718e6 David Howells      2012-03-28  39  		break;					\
e839ca528718e6 David Howells      2012-03-28  40  	default:					\
e839ca528718e6 David Howells      2012-03-28  41  		__xchg_called_with_bad_pointer();	\
e839ca528718e6 David Howells      2012-03-28  42  		__xchg__res = x;			\
e839ca528718e6 David Howells      2012-03-28  43  		break;					\
e839ca528718e6 David Howells      2012-03-28  44  	}						\
e839ca528718e6 David Howells      2012-03-28  45  							\
e839ca528718e6 David Howells      2012-03-28  46  	__xchg__res;					\
e839ca528718e6 David Howells      2012-03-28  47  })
e839ca528718e6 David Howells      2012-03-28  48  

:::::: The code at line 29 was first introduced by commit
:::::: e839ca528718e68cad32a307dc9aabf01ef3eb05 Disintegrate asm/system.h for SH

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
