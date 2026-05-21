Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239936A350
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364578; cv=none; b=MlK0QjwwKfECgEBg4J8u5v8FwZlqHPpBSB7cClfFZWHjBbiqpcuQD5allEiUT5YEKqylj6D0Dvl1nCxfnNmQWOqkPMvrpfJwjQtByK0iPS9jWpj6Au/dkNiXy7w+R8rwLnH4YV2dZUaGcrWJVL87E1dfllSmMc4hxtGG2wUqyF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364578; c=relaxed/simple;
	bh=Wrn4qPwZ7uQ8XKIziVTVryOw/sniToDHlefW634FYng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HXDoOkxcYWrdlEhFE8VnmDITh+qLXbbNaXJpQZPmz/9fsddWMItkK4q7Q6qFz7bTNBEwEPadnL4ifOpNDFljZScnQjzIeVPDN1/Scn5Ne/iyUtLHYP8L7dZy9c2ejOSEa3pA20uMLyUNxeJQ6AgdbF1LROZusCIbELSvhJRds40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqaZf7+M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqaZf7+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779364577; x=1810900577;
  h=date:from:to:cc:subject:message-id;
  bh=Wrn4qPwZ7uQ8XKIziVTVryOw/sniToDHlefW634FYng=;
  b=JqaZf7+MZb6XoR74DAcP0z/DJOZE0DtowIVIkQrShamJuxQXPVlLDCNg
   KhK2cBb+jtCcXTtfCLGbI52yBWoIeNqAuzhgs+6l5ao3xO0N5iEgbrW9B
   p/DGfBiNOgw271AP9x0b8YlGkfEmp17jgFeCx80xtkkp2QVkDUBl7UZF6
   T3KaRYWSj21g+cnuP2jTelANWZRIS4AEShcWEsVxr4IwiDjGVarZES9Gm
   Zg3HCQrsMLE3qOSAI7UnKO6tqtuQtV3vbtc6ZWXC3YD/n7dRWn9wNGYTT
   lrK0P5Y1n6MSq4URy7FXpQkfK6gxaLH5aaEbdUvgD9Yv7xkYjBmAScGSv
   g==;
X-CSE-ConnectionGUID: d4oCodpQQSuqZ28umQv3lw==
X-CSE-MsgGUID: nN1pluUHTs2gGyIu8uVlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90855027"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90855027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:56:17 -0700
X-CSE-ConnectionGUID: nSeZhWThS+myqeBGSkD/mw==
X-CSE-MsgGUID: 6v8dJtTbQsWifwgCWSRKlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="234170964"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 04:56:15 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ20a-000000000EL-3EHR;
	Thu, 21 May 2026 11:56:12 +0000
Date: Thu, 21 May 2026 19:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1118/1130]
 include/linux/syscalls.h:293:18: error: conflicting types for
 'sys_io_pgetevents'
Message-ID: <202605211914.izjA7DEC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 99ff45e9d32d24613a22717f607e7c09f3602e35 [1118/1130] cheri: fs: aio: Fix compat64 handling
config: sparc-randconfig-002-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211914.izjA7DEC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211914.izjA7DEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211914.izjA7DEC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpfptr.h:6,
                    from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from fs/aio.c:20:
   include/linux/compat.h:1106: warning: "is_compat32_task" redefined
    #define is_compat32_task() is_compat_task()
    
   In file included from include/linux/compat.h:22,
                    from include/linux/bpfptr.h:6,
                    from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from fs/aio.c:20:
   arch/sparc/include/asm/compat.h:151: note: this is the location of the previous definition
    #define is_compat32_task is_compat_task
    
   In file included from fs/aio.c:20:
>> include/linux/syscalls.h:293:18: error: conflicting types for 'sys_io_pgetevents'
     asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
                     ^~~
   include/linux/syscalls.h:279:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:273:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, SYSCALL_PREP(name), __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/aio.c:2388:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    SYSCALL_DEFINE6(io_pgetevents,
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:365:17: note: previous declaration of 'sys_io_pgetevents' was here
    asmlinkage long sys_io_pgetevents(aio_context_t ctx_id,
                    ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:293:18: error: conflicting types for 'sys_io_getevents_time32'
     asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
                     ^~~
   include/linux/syscalls.h:279:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:272:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, SYSCALL_PREP(name), __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/aio.c:2461:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(io_getevents_time32, aio_context_t, ctx_id,
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:360:17: note: previous declaration of 'sys_io_getevents_time32' was here
    asmlinkage long sys_io_getevents_time32(__u32 ctx_id,
                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sys_io_pgetevents +293 include/linux/syscalls.h

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
