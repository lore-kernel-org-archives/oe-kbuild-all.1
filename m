Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394E21D6195
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457523; cv=none; b=gYg/KZb4oiRoEpofMalFuVDc6Yw/MlQ8Oe2/k2hTUmI48hrFtPT9yo3Z94JPVarnrAzo4omL/t+W7ZRHK65EjrLL5TvfmQbpIBp5lGaQNIt+9w+Yw6t+WuA4xphC1FoHf5xnyz9aJHAL0lYiQmuFsBEvaBpw6wRSThDJ7QE8UMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457523; c=relaxed/simple;
	bh=LOur/B0rye/HD+DYpnc7cWIYT5m+/vwV1rYyEROCrNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+NggPR+cC7TiJQw5LiAv92CcEj1XhzAaDnNZhZ6riSgciLTOoyNKM3DzSRmOZWHbAd+OLdmAiQofg7zSLp96MkGjC7rwEl29w8aFwJMUfW1TM6BM65wI1bA3E1rcMJbJcrkGZmpZHFXFe0UKuv7WpmrDS78u4x/e2XAAOnwCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2XjFV1F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2XjFV1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748457521; x=1779993521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LOur/B0rye/HD+DYpnc7cWIYT5m+/vwV1rYyEROCrNk=;
  b=Y2XjFV1F6QELJP4hJdHfbbxCm1nxumeLW4O4UiU7FXpHDwKBd05L3yot
   cA0Qe0kSPjS6DSL5PQVzqIxHC7D45KuvdZh79uK35SnbwSpHhiGh5SYDu
   3mDsDe/yLBSNpntpufLqmG8H5O1cEvTLYCyXH1kk8vJoHR2uUk7V6FU33
   6mFfT/car6aE2/aoBwhAtMJ4NOA71AuZtTc15yMKos28MNXWZEUQVP2g5
   Rjlx+ratLZwjlEdLjD3RBv0WzEKFkXY4We14TxI4Jv73Z0Q5HEQkV8LcJ
   rSFZsy/7rgIzIy9V7f6f+qKF2uaCCSZOV7ZsLj/1n7uX3xpmycCg3ZUzB
   Q==;
X-CSE-ConnectionGUID: SdNFDtFjTRW0k1Ntx53pdg==
X-CSE-MsgGUID: WypdkwFfTSS7VxB7wlSasg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="38124531"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="38124531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 11:38:39 -0700
X-CSE-ConnectionGUID: DVKITQXfRBmrMSn6+2KMgQ==
X-CSE-MsgGUID: ZW1o64HlQn+7XFrvz8YS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143317326"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 11:38:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKLfg-000VyY-1R;
	Wed, 28 May 2025 18:38:36 +0000
Date: Thu, 29 May 2025 02:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 13/15]
 tools/include/nolibc/sys.h:90:16: warning: cast to pointer from integer of
 different size
Message-ID: <202505290208.TED4T6lh-lkp@intel.com>
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
head:   4ab0ba980793138ca8d22ec673026def7b1e0178
commit: 0ea2779d37918ce136170f5d1250a70e95f1bf73 [13/15] kunit: uapi: Add example for UAPI tests
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20250529/202505290208.TED4T6lh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290208.TED4T6lh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290208.TED4T6lh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/include/nolibc/nolibc.h:96,
                    from <command-line>:
   tools/include/nolibc/arch.h:37:2: error: #error Unsupported Architecture
      37 | #error Unsupported Architecture
         |  ^~~~~
   In file included from tools/include/nolibc/nolibc.h:98:
   tools/include/nolibc/sys.h: In function 'sys_brk':
   tools/include/nolibc/sys.h:90:24: error: implicit declaration of function 'my_syscall1'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
      90 |         return (void *)my_syscall1(__NR_brk, addr);
         |                        ^~~~~~~~~~~
         |                        si_syscall
>> tools/include/nolibc/sys.h:90:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      90 |         return (void *)my_syscall1(__NR_brk, addr);
         |                ^
   tools/include/nolibc/sys.h: In function 'sys_chmod':
   tools/include/nolibc/sys.h:144:16: error: implicit declaration of function 'my_syscall4'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     144 |         return my_syscall4(__NR_fchmodat, AT_FDCWD, path, mode, 0);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_chown':
   tools/include/nolibc/sys.h:167:16: error: implicit declaration of function 'my_syscall5'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     167 |         return my_syscall5(__NR_fchownat, AT_FDCWD, path, owner, group, 0);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_dup2':
   tools/include/nolibc/sys.h:241:16: error: implicit declaration of function 'my_syscall3'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     241 |         return my_syscall3(__NR_dup3, old, new, 0);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_geteuid':
   tools/include/nolibc/sys.h:383:16: error: implicit declaration of function 'my_syscall0'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     383 |         return my_syscall0(__NR_geteuid);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_gettimeofday':
   tools/include/nolibc/sys.h:499:16: error: implicit declaration of function 'my_syscall2'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     499 |         return my_syscall2(__NR_gettimeofday, tv, tz);
         |                ^~~~~~~~~~~
         |                si_syscall
   tools/include/nolibc/sys.h: In function 'sys_mmap':
   tools/include/nolibc/sys.h:714:24: error: implicit declaration of function 'my_syscall6'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     714 |         return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
         |                        ^~~~~~~~~~~
         |                        si_syscall
   tools/include/nolibc/sys.h:714:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     714 |         return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
         |                ^
   In file included from tools/include/nolibc/stdio.h:16,
                    from tools/include/nolibc/nolibc.h:102:
   tools/include/nolibc/stdlib.h: In function 'getenv':
   tools/include/nolibc/stdlib.h:94:13: error: 'environ' undeclared (first use in this function)
      94 |         if (environ) {
         |             ^~~~~~~
   tools/include/nolibc/stdlib.h:94:13: note: each undeclared identifier is reported only once for each function it appears in
   tools/include/nolibc/stdlib.h: In function 'getauxval':
   tools/include/nolibc/stdlib.h:108:37: error: '_auxv' undeclared (first use in this function); did you mean 'auxv'?
     108 |         const unsigned long *auxv = _auxv;
         |                                     ^~~~~
         |                                     auxv
   In file included from tools/include/nolibc/nolibc.h:106:
   tools/include/nolibc/stackprotector.h: At top level:
   tools/include/nolibc/stackprotector.h:50:13: warning: '__stack_chk_init' defined but not used [-Wunused-function]
      50 | static void __stack_chk_init(void) {}
         |             ^~~~~~~~~~~~~~~~


vim +90 tools/include/nolibc/sys.h

535b70c143dcca Thomas Weiﬂschuh 2023-09-17  57  
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  58  
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  59  /* Functions in this file only describe syscalls. They're declared static so
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  60   * that the compiler usually decides to inline them while still being allowed
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  61   * to pass a pointer to one of their instances. Each syscall exists in two
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  62   * versions:
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  63   *   - the "internal" ones, which matches the raw syscall interface at the
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  64   *     kernel level, which may sometimes slightly differ from the documented
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  65   *     libc-level ones. For example most of them return either a valid value
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  66   *     or -errno. All of these are prefixed with "sys_". They may be called
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  67   *     by non-portable applications if desired.
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  68   *
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  69   *   - the "exported" ones, whose interface must closely match the one
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  70   *     documented in man(2), that applications are supposed to expect. These
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  71   *     ones rely on the internal ones, and set errno.
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  72   *
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  73   * Each syscall will be defined with the two functions, sorted in alphabetical
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  74   * order applied to the exported names.
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  75   *
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  76   * In case of doubt about the relevance of a function here, only those which
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  77   * set errno should be defined here. Wrappers like those appearing in man(3)
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  78   * should not be placed here.
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  79   */
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  80  
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  81  
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  82  /*
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  83   * int brk(void *addr);
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  84   * void *sbrk(intptr_t inc)
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  85   */
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  86  
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  87  static __attribute__((unused))
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  88  void *sys_brk(void *addr)
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  89  {
bd8c8fbb866fe5 Willy Tarreau    2022-02-07 @90  	return (void *)my_syscall1(__NR_brk, addr);
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  91  }
bd8c8fbb866fe5 Willy Tarreau    2022-02-07  92  

:::::: The code at line 90 was first introduced by commit
:::::: bd8c8fbb866fe524b769a853f2b3525c227165fa tools/nolibc/sys: split the syscall definitions into their own file

:::::: TO: Willy Tarreau <w@1wt.eu>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
