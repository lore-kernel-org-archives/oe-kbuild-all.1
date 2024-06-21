Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046E2904
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935936; cv=none; b=bz0uitF4oE5pf7fEIuX9t1c4voBuTERX41OBwXF59I1c0bK8na1fpJrpz+OXMT7I12n0EmSC8kyouWs+D2xLr2bu0YlnuNtb8+1tSSCaW2yekMhyzE4jflQKByeyeVsqF4TCXMo8VyviA11vGqxOIOmTqbZafLBfnBKAMWynom0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935936; c=relaxed/simple;
	bh=ZXXBcqkHoavxBHdXZiQ/XE6Tz/H4/GQBp/tJkTz1o2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvRL11rQbmm8POZJaRMc0439oiEdMPQ54+7HGdo625iabeOWYduzO+8Agt1hkCQnMjKwKzX0nACmSsQ/62xQlpZ7MREmJseBLSd836AT6VyFH8xYros+I3NAtjdBrD5REkEAVLqMOeTSPPCdog27gRKz7KzCHnt5v2LT7h0B2xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ry/axJ5L; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry/axJ5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935934; x=1750471934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXXBcqkHoavxBHdXZiQ/XE6Tz/H4/GQBp/tJkTz1o2Q=;
  b=Ry/axJ5LFUvQz4WULeA6KeJQIm/mtb5+YLdmK3iB1ccXGrJcZuC+NtxP
   +fQDkMOZTNFbCesK0efBEVCatf0wUVoRBG48K2UI5Ujq6HqcwYqfajXse
   B4LbiPUsCuVqEJb1r8NeFqtIBfS4Ts8mx5x072nMQo1K4vciWkEwhtp9b
   77sPegwehPa4J5TiUmWDOSmIJOuKNBOq6CErG5uuJmG9+bSdP0m+oHkWf
   ALBwaliavSuWh8A1KDKqQmQOYPtLkrgoVA+a36OJmqZ8nIUMF0zicZ1UG
   ZVjYRsATSvMd6iuTShRd48h2v2Axxe1GAMikyze8QTXw0Lhw1sNdf4dAR
   w==;
X-CSE-ConnectionGUID: awHx+6XfSgeIGdbtDDF3CQ==
X-CSE-MsgGUID: NJ3U+NYzTlKQTNSBPZNX9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16096303"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16096303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:12:14 -0700
X-CSE-ConnectionGUID: YxdqFURnSGyBmkhKhoBIXg==
X-CSE-MsgGUID: /2azd4LTQ9KyvhzTOPH67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="65690567"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jun 2024 19:12:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTl4-000878-2B;
	Fri, 21 Jun 2024 02:12:10 +0000
Date: Fri, 21 Jun 2024 10:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 7/15] include/linux/syscalls.h:248:25:
 error: conflicting types for 'sys_fanotify_mark'; have 'long int(int,
  unsigned int,  u32,  u32,  int,  const char *)' {aka 'long int(int,
  unsigned int,  unsigned int,  unsigned int,  int,  const char *)'}
Message-ID: <202406210932.bczdjtP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   c2dd777003347c510f9fecc965fb3e65d7c79a43
commit: f3a5dbf0888e0217bcb41522ffc7489af08fee14 [7/15] parisc: use generic sys_fanotify_mark implementation
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20240621/202406210932.bczdjtP3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210932.bczdjtP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210932.bczdjtP3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/fanotify/fanotify_user.c:14:
>> include/linux/syscalls.h:248:25: error: conflicting types for 'sys_fanotify_mark'; have 'long int(int,  unsigned int,  u32,  u32,  int,  const char *)' {aka 'long int(int,  unsigned int,  unsigned int,  unsigned int,  int,  const char *)'}
     248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:234:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     228 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:287:27: note: in expansion of macro 'SYSCALL_DEFINE6'
     287 | #define SYSCALL32_DEFINE6 SYSCALL_DEFINE6
         |                           ^~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1924:1: note: in expansion of macro 'SYSCALL32_DEFINE6'
    1924 | SYSCALL32_DEFINE6(fanotify_mark,
         | ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:862:17: note: previous declaration of 'sys_fanotify_mark' with type 'long int(int,  unsigned int,  u64,  int,  const char *)' {aka 'long int(int,  unsigned int,  long long unsigned int,  int,  const char *)'}
     862 | asmlinkage long sys_fanotify_mark(int fanotify_fd, unsigned int flags,
         |                 ^~~~~~~~~~~~~~~~~


vim +248 include/linux/syscalls.h

1bd21c6c21e848 Dominik Brodowski   2018-04-05  237  
e145242ea0df6b Dominik Brodowski   2018-04-09  238  /*
e145242ea0df6b Dominik Brodowski   2018-04-09  239   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b Dominik Brodowski   2018-04-09  240   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b Dominik Brodowski   2018-04-09  241   * done within __do_sys_*().
e145242ea0df6b Dominik Brodowski   2018-04-09  242   */
1bd21c6c21e848 Dominik Brodowski   2018-04-05  243  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc8 Frederic Weisbecker 2009-03-13  244  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3 Arnd Bergmann       2018-06-19  245  	__diag_push();							\
bee20031772af3 Arnd Bergmann       2018-06-19  246  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3 Arnd Bergmann       2018-06-19  247  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac14 Andi Kleen          2013-11-12 @248  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b Dominik Brodowski   2018-04-09  249  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79 Howard McLauchlan   2018-03-21  250  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b Dominik Brodowski   2018-04-09  251  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b Dominik Brodowski   2018-04-09  252  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b Dominik Brodowski   2018-04-09  253  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e46 Heiko Carstens      2009-01-14  254  	{								\
e145242ea0df6b Dominik Brodowski   2018-04-09  255  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6 Al Viro             2013-01-21  256  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b Al Viro             2013-01-21  257  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b Al Viro             2013-01-21  258  		return ret;						\
1a94bc34768e46 Heiko Carstens      2009-01-14  259  	}								\
bee20031772af3 Arnd Bergmann       2018-06-19  260  	__diag_pop();							\
e145242ea0df6b Dominik Brodowski   2018-04-09  261  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e848 Dominik Brodowski   2018-04-05  262  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e46 Heiko Carstens      2009-01-14  263  

:::::: The code at line 248 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias instead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
