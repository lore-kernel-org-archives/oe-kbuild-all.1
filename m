Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7459367F4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377036; cv=none; b=YIjkJxUBDvBYo815kLPdyMBxGp9wuCKdWw9yLJ2QLcq9XTQ9nwU8BZ6pHnmAgKOL/6xkMXFNLOQmzhJXTHzdzB8ulCQPTUmtjM0mjSvSmavFw5zXmi/ZL50D9ZkNs3vgo2UKR+Gm+erHIDzmNZg8fhgtpypqCvded/GKe+czzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377036; c=relaxed/simple;
	bh=jpQtkB6+zH0f05bVsmd7P5fxavzeN+EwBUQ7zfj+maQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GViEkWs2i1N+Nr1BSV4/OjAW87LE96DYGkdmHflmDkT9ci+u/2oZ5UXjy3mFHKKcoTtjxzXwQH6sNn5c4+RHWVEzJgh5DmGctZJWGHfwT2J9p9l8ZTQfg7s19MmHKoK6ODEvhssUF0NqQ7fjdGSxocVAlvJm21Q4KhMDntPWR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI7lE07r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI7lE07r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779377034; x=1810913034;
  h=date:from:to:cc:subject:message-id;
  bh=jpQtkB6+zH0f05bVsmd7P5fxavzeN+EwBUQ7zfj+maQ=;
  b=LI7lE07rHsBt4ER3e5/ERpOYp9hPOwdT61i0lpeGX1ys7Sfbd4pyj9un
   Nn8eksOfKSIsLtsmj/Afu0/dEclJUQy+36mEMGQiatjARb6BOj3K2TBi3
   AlU+XNpNUjt8X8AuG0CAFmAcUX90iQw2XIHtetUw25briDZTEP/34YvEI
   LUP5POEbPZnFl3HrXh67HjBdljPFHP8CRPyj8+8UZkK00bqfi7uj+wAQp
   vv72yRO0j9n0PjeZi1/YbSsP0/X5NHvnkQzrQf/2P5EYXcPUT8nPT7Dd+
   1X2AhR/pag3tZtTjJ4d35+sYJygG1iZadtiZ1ehpnitaF1mIc+MI2u93s
   Q==;
X-CSE-ConnectionGUID: hXKGRLddTL+Ax5+zsXPTKA==
X-CSE-MsgGUID: gu6Y22kbSlai6SBxAp6l9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79447954"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="79447954"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:23:51 -0700
X-CSE-ConnectionGUID: LrVpWxi9StyWVZSeqQqEYg==
X-CSE-MsgGUID: 7xIU3K6vTvmlN3Z31HnPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="264076618"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2026 08:23:50 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ5FT-000000000hF-2rDn;
	Thu, 21 May 2026 15:23:47 +0000
Date: Thu, 21 May 2026 23:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 423/1130]
 include/linux/syscalls.h:293:25: error: conflicting types for
 'sys_io_getevents_time32'; have 'long int(aio_context_t,  __s32,  __s32, 
 struct io_event *, struct old_timespec32 *)' {aka 'long int(long unsigned
 int,  int,  int,  struct io_event *, struct o...
Message-ID: <202605212349.joMooW5T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 7843b89341e2ef350c85f26da6cc575799b103bd [423/1130] [CHERRY-PICK] aio: Change aio_context_t to a user pointer
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605212349.joMooW5T-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212349.joMooW5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212349.joMooW5T-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/aio.c: In function 'aio_ring_mremap':
   fs/aio.c:469:46: error: assignment to 'aio_context_t' {aka 'long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     469 |                                 ctx->user_id = uaddr_to_user_ptr_safe(ctx->mmap_base);
         |                                              ^
   fs/aio.c: In function 'aio_setup_ring':
   fs/aio.c:665:22: error: assignment to 'aio_context_t' {aka 'long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     665 |         ctx->user_id = uaddr_to_user_ptr_safe(ctx->mmap_base);
         |                      ^
   fs/aio.c: In function 'get_compat_iocb':
   fs/aio.c:2115:26: error: implicit declaration of function '__c_fakeu' [-Wimplicit-function-declaration]
    2115 |         iocb->aio_data = __c_fakeu(compat_iocb.aio_data);
         |                          ^~~~~~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from fs/aio.c:14:
   fs/aio.c: In function '__do_sys_io_cancel':
   include/linux/compat.h:200:25: error: implicit declaration of function 'in_compat64_syscall'; did you mean 'in_compat_syscall'? [-Wimplicit-function-declaration]
     200 |         __c64c_get_user(in_compat64_syscall(), type, x, p, field)
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/compat.h:191:13: note: in expansion of macro 'unlikely'
     191 |         if (unlikely(iscompat)) {                                       \
         |             ^~~~~~~~
   include/linux/compat.h:200:9: note: in expansion of macro '__c64c_get_user'
     200 |         __c64c_get_user(in_compat64_syscall(), type, x, p, field)
         |         ^~~~~~~~~~~~~~~
   fs/aio.c:2300:22: note: in expansion of macro '__c64_get_user'
    2300 |         if (unlikely(__c64_get_user(iocb, key, iocb, aio_key)))
         |                      ^~~~~~~~~~~~~~
   fs/aio.c:2328:1: warning: label 'out' defined but not used [-Wunused-label]
    2328 | out:
         | ^~~
   In file included from fs/aio.c:20:
   fs/aio.c: At top level:
>> include/linux/syscalls.h:293:25: error: conflicting types for 'sys_io_getevents_time32'; have 'long int(aio_context_t,  __s32,  __s32,  struct io_event *, struct old_timespec32 *)' {aka 'long int(long unsigned int,  int,  int,  struct io_event *, struct old_timespec32 *)'}
     293 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:279:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     279 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:272:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     272 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, SYSCALL_PREP(name), __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/aio.c:2465:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    2465 | SYSCALL_DEFINE5(io_getevents_time32, aio_context_t, ctx_id,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:360:17: note: previous declaration of 'sys_io_getevents_time32' with type 'long int(__u32,  __s32,  __s32,  struct io_event *, struct old_timespec32 *)' {aka 'long int(unsigned int,  int,  int,  struct io_event *, struct old_timespec32 *)'}
     360 | asmlinkage long sys_io_getevents_time32(__u32 ctx_id,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +293 include/linux/syscalls.h

1bd21c6c21e848 Dominik Brodowski   2018-04-05  282  
e145242ea0df6b Dominik Brodowski   2018-04-09  283  /*
e145242ea0df6b Dominik Brodowski   2018-04-09  284   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b Dominik Brodowski   2018-04-09  285   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b Dominik Brodowski   2018-04-09  286   * done within __do_sys_*().
e145242ea0df6b Dominik Brodowski   2018-04-09  287   */
1bd21c6c21e848 Dominik Brodowski   2018-04-05  288  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc8 Frederic Weisbecker 2009-03-13  289  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3 Arnd Bergmann       2018-06-19  290  	__diag_push();							\
bee20031772af3 Arnd Bergmann       2018-06-19  291  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3 Arnd Bergmann       2018-06-19  292  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac14 Andi Kleen          2013-11-12 @293  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b Dominik Brodowski   2018-04-09  294  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79 Howard McLauchlan   2018-03-21  295  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b Dominik Brodowski   2018-04-09  296  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b Dominik Brodowski   2018-04-09  297  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b Dominik Brodowski   2018-04-09  298  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e46 Heiko Carstens      2009-01-14  299  	{								\
e145242ea0df6b Dominik Brodowski   2018-04-09  300  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6 Al Viro             2013-01-21  301  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b Al Viro             2013-01-21  302  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b Al Viro             2013-01-21  303  		return ret;						\
1a94bc34768e46 Heiko Carstens      2009-01-14  304  	}								\
bee20031772af3 Arnd Bergmann       2018-06-19  305  	__diag_pop();							\
e145242ea0df6b Dominik Brodowski   2018-04-09  306  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e848 Dominik Brodowski   2018-04-05  307  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e46 Heiko Carstens      2009-01-14  308  

:::::: The code at line 293 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias instead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
