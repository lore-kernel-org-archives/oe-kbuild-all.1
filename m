Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6845395AC4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347068; cv=none; b=kTZeG/f8fwfy4n4w1puRLe4WpOI1ub5FJc7ZqkC2j9MZLHN9XCp16ga7+vTHyV0+FTkcQd7LUVt1C2BbNZXUTRVQAc3rC1qwy5OTcO2g1HktLjOGo5mk1j8RSYOJ0EZVBBUcWT7pc6yrmE+vHPwS/c1F5F3HP1foavqOYTs9aD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347068; c=relaxed/simple;
	bh=Fp+UzMHUnQGZu4XjDUZRVWOFu7ZVHJ8Rv5Rxxl4fJqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WeUHR/OSW4y4+1Dyki/TQmWv2LugGSXOegqzw9xr3Oa1R2pRfiCG/BVNXUKTUCf88xM389jOE/Q2xn6IOfkYlUWbjuYSXk1WdZ26V/2rh9Fo3hd4yuVTc0FdAshv3cZUqhMA1mSJaYrROuGZjhsgRyXojePggLsLNIbNKSvAey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUwFlGDr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUwFlGDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779347067; x=1810883067;
  h=date:from:to:cc:subject:message-id;
  bh=Fp+UzMHUnQGZu4XjDUZRVWOFu7ZVHJ8Rv5Rxxl4fJqA=;
  b=dUwFlGDrRJ+NE8oqOnlI2TVswBEdlloxsxmNBSffBPAstfU6nTn0H30V
   PSNVO7kvoa1QeFpa6GVGZ6Gb3bmVuRjsDWw4rs1zTd87Gdo6ZSGIv2lxl
   jpdEKu81AS52Lmuowfi/+K3Vjpp33zC2yCCt2V/iEk7VbrgLGEfY0acN9
   Q3RYL5V08sJ5TAn2sNqJJdseOBNGmx3njqoj1QFHs548thuHGqKkJC86l
   H7IOc92WQaKKGHM4/aIhQvNXpy4Ob1H/zoV6w7B+y/i2XEG7zqOIiUVKz
   B2rilVCxBg6IYFOnx2AFBcEMzfHi8Iaefs6VCTtozwiJlOzml7zHk6HCB
   w==;
X-CSE-ConnectionGUID: yY1qahCBS2qshqVKP3mPpw==
X-CSE-MsgGUID: IfJ7At4+TSi2RvARpfcCvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84145921"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="84145921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:04:25 -0700
X-CSE-ConnectionGUID: cpO04isvT2+rc5zumeEdiA==
X-CSE-MsgGUID: rY0Tnf8hTuGVB7wPcapm5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240684286"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2026 00:04:23 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPxS8-000000004Yj-2DaG;
	Thu, 21 May 2026 07:04:20 +0000
Date: Thu, 21 May 2026 15:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1118/1130]
 include/linux/syscalls.h:293:25: error: conflicting types for
 'sys_io_pgetevents'; have 'long int(aio_context_t,  long int,  long int, 
 struct io_event *, struct __kernel_timespec *, const struct __sigset_argpack
 *)' {aka 'long int(long unsigned int,  lon...
Message-ID: <202605211529.OhtIdysG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 99ff45e9d32d24613a22717f607e7c09f3602e35 [1118/1130] cheri: fs: aio: Fix compat64 handling
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211529.OhtIdysG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211529.OhtIdysG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211529.OhtIdysG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/aio.c:20:
>> include/linux/syscalls.h:293:25: error: conflicting types for 'sys_io_pgetevents'; have 'long int(aio_context_t,  long int,  long int,  struct io_event *, struct __kernel_timespec *, const struct __sigset_argpack *)' {aka 'long int(long unsigned int,  long int,  long int,  struct io_event *, struct __kernel_timespec *, const struct __sigset_argpack *)'}
     293 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:279:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     279 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:273:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     273 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, SYSCALL_PREP(name), __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/aio.c:2388:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    2388 | SYSCALL_DEFINE6(io_pgetevents,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:365:17: note: previous declaration of 'sys_io_pgetevents' with type 'long int(aio_context_t,  long int,  long int,  struct io_event *, struct __kernel_timespec *, const struct __aio_sigset *)' {aka 'long int(long unsigned int,  long int,  long int,  struct io_event *, struct __kernel_timespec *, const struct __aio_sigset *)'}
     365 | asmlinkage long sys_io_pgetevents(aio_context_t ctx_id,
         |                 ^~~~~~~~~~~~~~~~~


vim +293 include/linux/syscalls.h

1bd21c6c21e8489 Dominik Brodowski   2018-04-05  282  
e145242ea0df6b7 Dominik Brodowski   2018-04-09  283  /*
e145242ea0df6b7 Dominik Brodowski   2018-04-09  284   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b7 Dominik Brodowski   2018-04-09  285   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b7 Dominik Brodowski   2018-04-09  286   * done within __do_sys_*().
e145242ea0df6b7 Dominik Brodowski   2018-04-09  287   */
1bd21c6c21e8489 Dominik Brodowski   2018-04-05  288  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc87 Frederic Weisbecker 2009-03-13  289  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3d Arnd Bergmann       2018-06-19  290  	__diag_push();							\
bee20031772af3d Arnd Bergmann       2018-06-19  291  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3d Arnd Bergmann       2018-06-19  292  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac141 Andi Kleen          2013-11-12 @293  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  294  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79c Howard McLauchlan   2018-03-21  295  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  296  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  297  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  298  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e463 Heiko Carstens      2009-01-14  299  	{								\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  300  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6f Al Viro             2013-01-21  301  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b6 Al Viro             2013-01-21  302  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b6 Al Viro             2013-01-21  303  		return ret;						\
1a94bc34768e463 Heiko Carstens      2009-01-14  304  	}								\
bee20031772af3d Arnd Bergmann       2018-06-19  305  	__diag_pop();							\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  306  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e8489 Dominik Brodowski   2018-04-05  307  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e463 Heiko Carstens      2009-01-14  308  

:::::: The code at line 293 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias instead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
