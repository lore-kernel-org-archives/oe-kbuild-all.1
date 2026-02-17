Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2DD38D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771309223; cv=none; b=Q0MKmuh3vGdcy0eFADbYqKQW50rC/E/DcVBgUluchZ1uVXpm/0CvEZkrLud8C+i08aS/lDrmY2MxRXb6W4AiroD6WJyAjyu+gR/O18Tw3Ao/Q02Ci+rDQJpCa8Xg4D/VD0IFxBQxFdHsf8+pKzq4+KEcZQ1k/Bk5tzuhtcxheRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771309223; c=relaxed/simple;
	bh=gITEYS7jlygbp07l/LYc+tg+sLAr1ha2Y4aIMBSv6uU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f2+UU3Hkv6tyIvY4VMQZh0xrZHD2xOjwlKi59f8APu23jfSpMxVYUSIQ3A4btcYN9XMPspvLn7wKjo7Bz1d41HkQUVN5JKCcTi/pIGfXESsT82nUpi8popLYf3IPbRxlSuxS/iAu7oCPi65rOELQxfEqg+9XeJajueI93Tkjc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSE1lblI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSE1lblI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771309222; x=1802845222;
  h=date:from:to:cc:subject:message-id;
  bh=gITEYS7jlygbp07l/LYc+tg+sLAr1ha2Y4aIMBSv6uU=;
  b=NSE1lblIk6yNYTjNp8hO9M7Q6rtRTSMXuOiMJSsd+89Bm005JFlWtP1s
   UK8TqsyJt+u0NX3lrWyy80yQY6+QXkWOkYaeIWwDDfNlF+wf5JO8soMsN
   7CeqePIJ+e7gqEW1fMAXZryNVs92Nn+8SCL/6YUT2rWuUjwFWwLjr8+3+
   /Ds37j1B6CpYQ/t9XGdgGhWk35NlSFDLhQ/tLS5tvtRYCNSK69vmHLSHd
   1rV/9LaIdMTsWeHX6X5CdBxf1Ti2uMAAX3nlTBgcCJ1Jv0fDKRFuWh8NB
   /k11HjrBGCParZ3C9U2bf3Pjvl/nFOhKAvfjA5YEHgptRWNIcQsY8PWrJ
   g==;
X-CSE-ConnectionGUID: lL4d0EW+TOC7bNMyZsq2xg==
X-CSE-MsgGUID: S99BDJqESjG6p+bpeBsyfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72264381"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72264381"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:20:22 -0800
X-CSE-ConnectionGUID: nl4cHp7iS42dQLSFvyiVmA==
X-CSE-MsgGUID: xEZkfj15RDSF1ABZw8xV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218327789"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2026 22:20:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsERW-000000010gm-16pU;
	Tue, 17 Feb 2026 06:20:18 +0000
Date: Tue, 17 Feb 2026 14:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 7/17]
 include/linux/syscalls.h:251:25: error: conflicting types for
 'sys_container_create'; have 'long int(const char *, unsigned int,  unsigned
 int,  long unsigned int,  long unsigned int)'
Message-ID: <202602171434.3ORP7rg5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   de0a7cb340f6d2f9486a65f9d8e1e45d8f296c1c
commit: 11f6e954430e0e9041917daf57d29b53e68bdfc5 [7/17] containers: Implement container_create()
config: parisc-randconfig-002-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171434.3ORP7rg5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171434.3ORP7rg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171434.3ORP7rg5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/container.c:16:
>> include/linux/syscalls.h:251:25: error: conflicting types for 'sys_container_create'; have 'long int(const char *, unsigned int,  unsigned int,  long unsigned int,  long unsigned int)'
     251 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:237:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     237 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:230:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     230 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/container.c:386:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     386 | SYSCALL_DEFINE5(container_create,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1002:17: note: previous declaration of 'sys_container_create' with type 'long int(const char *, unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'
    1002 | asmlinkage long sys_container_create(const char __user *name, unsigned int flags,
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +251 include/linux/syscalls.h

1bd21c6c21e848 Dominik Brodowski   2018-04-05  240  
e145242ea0df6b Dominik Brodowski   2018-04-09  241  /*
e145242ea0df6b Dominik Brodowski   2018-04-09  242   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b Dominik Brodowski   2018-04-09  243   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b Dominik Brodowski   2018-04-09  244   * done within __do_sys_*().
e145242ea0df6b Dominik Brodowski   2018-04-09  245   */
1bd21c6c21e848 Dominik Brodowski   2018-04-05  246  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc8 Frederic Weisbecker 2009-03-13  247  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3 Arnd Bergmann       2018-06-19  248  	__diag_push();							\
bee20031772af3 Arnd Bergmann       2018-06-19  249  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3 Arnd Bergmann       2018-06-19  250  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac14 Andi Kleen          2013-11-12 @251  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b Dominik Brodowski   2018-04-09  252  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79 Howard McLauchlan   2018-03-21  253  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b Dominik Brodowski   2018-04-09  254  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b Dominik Brodowski   2018-04-09  255  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b Dominik Brodowski   2018-04-09  256  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e46 Heiko Carstens      2009-01-14  257  	{								\
e145242ea0df6b Dominik Brodowski   2018-04-09  258  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6 Al Viro             2013-01-21  259  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b Al Viro             2013-01-21  260  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b Al Viro             2013-01-21  261  		return ret;						\
1a94bc34768e46 Heiko Carstens      2009-01-14  262  	}								\
bee20031772af3 Arnd Bergmann       2018-06-19  263  	__diag_pop();							\
e145242ea0df6b Dominik Brodowski   2018-04-09  264  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e848 Dominik Brodowski   2018-04-05  265  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e46 Heiko Carstens      2009-01-14  266  

:::::: The code at line 251 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias instead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
