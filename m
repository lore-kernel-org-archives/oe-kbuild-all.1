Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322054315C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748401263; cv=none; b=Wk8i8fkz7uOQU0YPNt0nVY35kHl3/IMc/29x1BXqhfBYl6+lO1t8KzelF2jGsnP3cszgOhChUSDcSNmOgKkHxcpfd7Kh1gcaJJUIR+AlWgsPB9pR9WKTzT6SZGJrWeiAg4lKRN1q+mVvP6gtQOjYZFw/LsgCQWqvFxcyP+8fCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748401263; c=relaxed/simple;
	bh=T17WktEaq+MX4HYNebIFof8toxLBYynVv5OCMyfegWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gmF9GWdXgOJ+P5B64fcfh++bfO4mMYyyIlmRChY7wO/ap7GhRyhG831MExu+lGYwa812OTX4HEtPeE7DEASk50wjrppvyvmZYP2RZyYL27c0mj/O1ojbyxypEe4KpG6K2udwdUnRK8OMl+ThDvr9fWIpvlQ8qa8GIjDfjN276U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6/fMXPX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6/fMXPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748401262; x=1779937262;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T17WktEaq+MX4HYNebIFof8toxLBYynVv5OCMyfegWc=;
  b=h6/fMXPXKVdyQxlK+pye3HCzE1NkYtBivJoHsh1TjlPgAd+v1GUZNuEI
   jERJ66Ac9wLlb6ALBbvKxHCSoblFMUTfU9ZlY6WxZlXTv4eqiLhp4oP09
   CZQx7BqHt4KKHUrZegmCZL+yZqNDaABgMdODXa0yZMUHz69S+6piKoUSv
   sNrc/+Bve4gCJU9bR9wf2FdRJlTX8NtPUPuDRtGcbYGb+YdL0222ZOZAD
   ex/f8XOu2KFP8nL3dQS9jOUmIxsnN5EQ63dD0Ct6i6y+QrDN7VJeArWHt
   CMOtH+9/IU1wj5H1SAuFehsKmJyCBVnq1Og6Kim417EWbJ8A+0yIM9cJb
   A==;
X-CSE-ConnectionGUID: hsSoN6ntTQGp3hha+TkQzg==
X-CSE-MsgGUID: cLNsGDwdTziIV24Isr55fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61815905"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61815905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 20:01:01 -0700
X-CSE-ConnectionGUID: 3VfUWwNwTf+o1WyCRNrc+A==
X-CSE-MsgGUID: 22J9mhZfRMykj+nuDrjq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143057458"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 May 2025 20:00:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK72H-000VDG-0v;
	Wed, 28 May 2025 03:00:57 +0000
Date: Wed, 28 May 2025 11:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 13/15]
 tools/include/nolibc/arch.h:37:2: error: #error Unsupported Architecture
Message-ID: <202505281026.rlrSUQpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   a41104c63a35e4a175c7340a939ff5d6b513bcee
commit: 0ea2779d37918ce136170f5d1250a70e95f1bf73 [13/15] kunit: uapi: Add example for UAPI tests
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250528/202505281026.rlrSUQpM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281026.rlrSUQpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281026.rlrSUQpM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from tools/include/nolibc/nolibc.h:96,
                    from <command-line>:
>> tools/include/nolibc/arch.h:37:2: error: #error Unsupported Architecture
      37 | #error Unsupported Architecture
         |  ^~~~~
   In file included from tools/include/nolibc/nolibc.h:98:
   tools/include/nolibc/sys.h: In function 'sys_brk':
>> tools/include/nolibc/sys.h:90:24: error: implicit declaration of function 'my_syscall1'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
      90 |         return (void *)my_syscall1(__NR_brk, addr);
         |                        ^~~~~~~~~~~
         |                        si_syscall
   tools/include/nolibc/sys.h: In function 'sys_chmod':
>> tools/include/nolibc/sys.h:144:16: error: implicit declaration of function 'my_syscall4'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     144 |         return my_syscall4(__NR_fchmodat, AT_FDCWD, path, mode, 0);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_chown':
>> tools/include/nolibc/sys.h:167:16: error: implicit declaration of function 'my_syscall5'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     167 |         return my_syscall5(__NR_fchownat, AT_FDCWD, path, owner, group, 0);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_dup2':
>> tools/include/nolibc/sys.h:241:16: error: implicit declaration of function 'my_syscall3'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     241 |         return my_syscall3(__NR_dup3, old, new, 0);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_geteuid':
>> tools/include/nolibc/sys.h:381:16: error: implicit declaration of function 'my_syscall0'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     381 |         return my_syscall0(__NR_geteuid32);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_gettimeofday':
>> tools/include/nolibc/sys.h:499:16: error: implicit declaration of function 'my_syscall2'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     499 |         return my_syscall2(__NR_gettimeofday, tv, tz);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_mmap':
>> tools/include/nolibc/sys.h:714:24: error: implicit declaration of function 'my_syscall6'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     714 |         return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
         |                        ^~~~~~~~~~~
         |                        si_syscall
   In file included from tools/include/nolibc/stdio.h:16,
                    from tools/include/nolibc/nolibc.h:102:
   tools/include/nolibc/stdlib.h: In function 'getenv':
>> tools/include/nolibc/stdlib.h:94:13: error: 'environ' undeclared (first use in this function)
      94 |         if (environ) {
         |             ^~~~~~~
   tools/include/nolibc/stdlib.h:94:13: note: each undeclared identifier is reported only once for each function it appears in
   tools/include/nolibc/stdlib.h: In function 'getauxval':
>> tools/include/nolibc/stdlib.h:108:37: error: '_auxv' undeclared (first use in this function); did you mean 'auxv'?
     108 |         const unsigned long *auxv = _auxv;
         |                                     ^~~~~
         |                                     auxv
   In file included from tools/include/nolibc/nolibc.h:106:
   tools/include/nolibc/stackprotector.h: At top level:
>> tools/include/nolibc/stackprotector.h:50:13: warning: '__stack_chk_init' defined but not used [-Wunused-function]
      50 | static void __stack_chk_init(void) {}
         |             ^~~~~~~~~~~~~~~~


vim +37 tools/include/nolibc/arch.h

271661c1cde5ff Willy Tarreau    2022-02-07  17  
271661c1cde5ff Willy Tarreau    2022-02-07  18  #if defined(__x86_64__)
271661c1cde5ff Willy Tarreau    2022-02-07  19  #include "arch-x86_64.h"
271661c1cde5ff Willy Tarreau    2022-02-07  20  #elif defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
271661c1cde5ff Willy Tarreau    2022-02-07  21  #include "arch-i386.h"
271661c1cde5ff Willy Tarreau    2022-02-07  22  #elif defined(__ARM_EABI__)
271661c1cde5ff Willy Tarreau    2022-02-07  23  #include "arch-arm.h"
271661c1cde5ff Willy Tarreau    2022-02-07  24  #elif defined(__aarch64__)
271661c1cde5ff Willy Tarreau    2022-02-07  25  #include "arch-aarch64.h"
aa68a5a83a0acc Thomas Weiﬂschuh 2023-10-20  26  #elif defined(__mips__)
271661c1cde5ff Willy Tarreau    2022-02-07  27  #include "arch-mips.h"
0cb0675ec37e16 Zhangjin Wu      2023-08-06  28  #elif defined(__powerpc__)
0cb0675ec37e16 Zhangjin Wu      2023-08-06  29  #include "arch-powerpc.h"
271661c1cde5ff Willy Tarreau    2022-02-07  30  #elif defined(__riscv)
271661c1cde5ff Willy Tarreau    2022-02-07  31  #include "arch-riscv.h"
9c812b01f13d37 Thomas Weiﬂschuh 2025-02-06  32  #elif defined(__s390x__) || defined(__s390__)
18a5a09d90a75f Sven Schnelle    2023-01-09  33  #include "arch-s390.h"
73f12c6da77a7c Feiyang Chen     2023-03-04  34  #elif defined(__loongarch__)
73f12c6da77a7c Feiyang Chen     2023-03-04  35  #include "arch-loongarch.h"
48946c5aa7a848 Thomas Weiﬂschuh 2023-11-05  36  #else
48946c5aa7a848 Thomas Weiﬂschuh 2023-11-05 @37  #error Unsupported Architecture
271661c1cde5ff Willy Tarreau    2022-02-07  38  #endif
271661c1cde5ff Willy Tarreau    2022-02-07  39  

:::::: The code at line 37 was first introduced by commit
:::::: 48946c5aa7a848c7dfc2151267af92956f492f58 tools/nolibc: error out on unsupported architecture

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Thomas Weiﬂschuh <linux@weissschuh.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
