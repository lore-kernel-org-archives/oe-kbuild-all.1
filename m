Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4917993
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 05:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764739461; cv=none; b=UvmtV9rbgoDgbMpijwzLCeK/bMO51C6oHYkb3s3U6LKWUDk0jF8jmSQDFngbS6JTOd6ZU9MIV+o6Vgqo5mggIdb+89Tjtr9Uldkx6DSh66SN9bVTCNBNVyF5/0uhNAhrCvuiA372aacxk4DZeAXA9UKtuk6hE1DMFKQsIFqrWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764739461; c=relaxed/simple;
	bh=cHMp+md3Cv1I903TP6dHVLMHgrEMPg24z79QuVmQVqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=On8PBuJ21XzNJ9j9EpF4wfD8Iz/1y5gv0UXJNLwffjcMxr2MqKaU8KAeGQeyuRtHn+91+UgTTyBOJK6eCrqwnfpFUM/+dXbiKSRmjXaR0UESf2k1q6AM0KmR2A9bZG++q94AJuBULqH6vgIzSeI1siXKvrJyDG8WvQrcXO2EFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naaXO6Ms; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naaXO6Ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764739460; x=1796275460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHMp+md3Cv1I903TP6dHVLMHgrEMPg24z79QuVmQVqA=;
  b=naaXO6Ms/12NHCpe4Aavu9nPH3Io+8HOV7YPWCvy9gTCW3s6xAX2hMWn
   EeDmGFqJfCwQsSv5CZIjeLluqPmkL5LUTBA7FM3Vx0VoQ9ja9obsS12oO
   AjwKbEtBCWLuI8tK1Qceo/c9RXKoGc6GJqYhhbiC8KGPK0VUpGERJqhEZ
   t5PPBNJQ9mZ2V74i8maHDjEiT2pEr7Gm635iJOrCDvyh/4V4PQ9Qk2p1d
   U1uEkbcZX5PEvaH32+po3Bk4E/a/4qx8VzV7ViiOYOWYIgWwwl+3QYa5C
   ijYc5WSh4xduddR4Y8ExHoqxoGefKeLVGBz0BjOgTRl9gCuuK3or3/7N+
   A==;
X-CSE-ConnectionGUID: uRuTnzbMTXy9mAJLL4vRDA==
X-CSE-MsgGUID: 3U+GAgBqQMClJiUtl8UGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66757869"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66757869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 21:24:19 -0800
X-CSE-ConnectionGUID: 4u8brRE3QB2ARqpJQQfwQQ==
X-CSE-MsgGUID: WcP6ruIXQ8SfHndwHP0cMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199061641"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 21:24:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQfLa-00000000Acz-36uV;
	Wed, 03 Dec 2025 05:24:14 +0000
Date: Wed, 3 Dec 2025 13:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Kai <liukai284@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3450/3450] include/linux/syscalls.h:246:25:
 error: conflicting types for 'sys_xsched_setattr'; have 'long int(pid_t,
  struct xsched_attr *)' {aka 'long int(int,  struct xsched_attr *)'}
Message-ID: <202512031328.9eAOiuGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   475ad739de0d59c667bb9fa8ab728d1d146c8e28
commit: 7d2bb3c7646cf1ebe76de965c3b31d7bc2b89845 [3450/3450] xsched: fix compile error when CONFIG_XCU_SCHEDULER is disabled
config: loongarch-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031328.9eAOiuGN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031328.9eAOiuGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031328.9eAOiuGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/xsched/vstream.c:21:
   include/linux/syscalls.h:954:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   include/linux/syscalls.h:955:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
>> include/linux/syscalls.h:246:25: error: conflicting types for 'sys_xsched_setattr'; have 'long int(pid_t,  struct xsched_attr *)' {aka 'long int(int,  struct xsched_attr *)'}
     246 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:232:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/xsched/vstream.c:660:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     660 | SYSCALL_DEFINE2(xsched_setattr, pid_t, pid, struct xsched_attr __user *, arg)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:954:17: note: previous declaration of 'sys_xsched_setattr' with type 'long int(pid_t,  struct xsched_attr *)' {aka 'long int(int,  struct xsched_attr *)'}
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/syscalls.h:246:25: error: conflicting types for 'sys_xsched_getattr'; have 'long int(pid_t,  struct xsched_attr *)' {aka 'long int(int,  struct xsched_attr *)'}
     246 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:232:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/xsched/vstream.c:665:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     665 | SYSCALL_DEFINE2(xsched_getattr, pid_t, pid, struct xsched_attr __user *, arg)
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:955:17: note: previous declaration of 'sys_xsched_getattr' with type 'long int(pid_t,  struct xsched_attr *)' {aka 'long int(int,  struct xsched_attr *)'}
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                 ^~~~~~~~~~~~~~~~~~


vim +246 include/linux/syscalls.h

1bd21c6c21e848 Dominik Brodowski   2018-04-05  235  
e145242ea0df6b Dominik Brodowski   2018-04-09  236  /*
e145242ea0df6b Dominik Brodowski   2018-04-09  237   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b Dominik Brodowski   2018-04-09  238   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b Dominik Brodowski   2018-04-09  239   * done within __do_sys_*().
e145242ea0df6b Dominik Brodowski   2018-04-09  240   */
1bd21c6c21e848 Dominik Brodowski   2018-04-05  241  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc8 Frederic Weisbecker 2009-03-13  242  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3 Arnd Bergmann       2018-06-19  243  	__diag_push();							\
bee20031772af3 Arnd Bergmann       2018-06-19  244  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3 Arnd Bergmann       2018-06-19  245  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac14 Andi Kleen          2013-11-12 @246  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b Dominik Brodowski   2018-04-09  247  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79 Howard McLauchlan   2018-03-21  248  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b Dominik Brodowski   2018-04-09  249  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b Dominik Brodowski   2018-04-09  250  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b Dominik Brodowski   2018-04-09  251  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e46 Heiko Carstens      2009-01-14  252  	{								\
e145242ea0df6b Dominik Brodowski   2018-04-09  253  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6 Al Viro             2013-01-21  254  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b Al Viro             2013-01-21  255  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b Al Viro             2013-01-21  256  		return ret;						\
1a94bc34768e46 Heiko Carstens      2009-01-14  257  	}								\
bee20031772af3 Arnd Bergmann       2018-06-19  258  	__diag_pop();							\
e145242ea0df6b Dominik Brodowski   2018-04-09  259  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e848 Dominik Brodowski   2018-04-05  260  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e46 Heiko Carstens      2009-01-14  261  

:::::: The code at line 246 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias instead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
