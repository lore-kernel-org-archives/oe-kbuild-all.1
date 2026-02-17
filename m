Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4E280325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313010; cv=none; b=LSk9dS86mKMLPUWeUwxg6dIOTTkFSCqeWY4hfklLC53AblnnsV7sA7ri0xLVR1RvdpKmvdPLhfL0H5ZIvKThJWPIuym9QRhsjUOvCtO/DF4PctllZCIEkuItCH856dxICpFQbhswb7jI3jIvTiYwu3t1m/P2v7XJD9F1yJtj6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313010; c=relaxed/simple;
	bh=pG/zCjLp5A/lP5/0rYzKuF9Dd7sJfebHQP3K21QUZVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CerPlcaiWB8wYfZhKJ+oXWCfT7YxRG/w2XItKzFQUyDo/oUW+tkf86LWmP31loH8NbCy+VeTIDz840XWetTAgm9APnYQ4KUPLk73/LdyTFOYBC9P9DD8gNIeOs/KV1Awl5oY09mjHwrd3N/eq5xbILB+HOykmsH5H+w6fto/rcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJzuW8a5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJzuW8a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771313009; x=1802849009;
  h=date:from:to:cc:subject:message-id;
  bh=pG/zCjLp5A/lP5/0rYzKuF9Dd7sJfebHQP3K21QUZVk=;
  b=DJzuW8a5bbl+HKjoDNAz06m/mswmL8GbSxoEPBb5xdCD+2/8Vi00P3nd
   L1JrfrkpIhWJ282fWnLPrY+qVjZL+qGRLHa1NjSyXUS0I+WNFAE1YQp5C
   jZUkQZmFMNZrFT/0oiaDsEu/ggS5FAv32M3RUaH7nHEshsNbbUUZdpUAu
   u2juLpfk3U71/8CLwM30otqUwjSSICC9aLoZVbDyTbszpIhJMsAeEFHd3
   RTihP5O4q3kLiBkjEUASDQIkFU05/Fh9aALhsq+LccEdfS10eL+buPwfJ
   ysAWUz10m1D7lzd8LhKXFvFguWu3bQRSDQl9O3qMbT338cxDmb44hrrQQ
   A==;
X-CSE-ConnectionGUID: xyztQi+VQt+052m2DHK8eQ==
X-CSE-MsgGUID: K+idjtGTRg288TJ6mCA1mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71575295"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="71575295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:23:28 -0800
X-CSE-ConnectionGUID: lExhM0wRQtuwvjII0+bOFg==
X-CSE-MsgGUID: +ai7LOcoRXyjNiqwDAB+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213637022"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Feb 2026 23:23:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsFQa-000000010io-1ErK;
	Tue, 17 Feb 2026 07:23:24 +0000
Date: Tue, 17 Feb 2026 15:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 7/17]
 include/linux/syscalls.h:251:18: error: conflicting types for
 'sys_container_create'
Message-ID: <202602171502.jzQEkm2D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   de0a7cb340f6d2f9486a65f9d8e1e45d8f296c1c
commit: 11f6e954430e0e9041917daf57d29b53e68bdfc5 [7/17] containers: Implement container_create()
config: powerpc64-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171502.jzQEkm2D-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171502.jzQEkm2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171502.jzQEkm2D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/container.c:16:
>> include/linux/syscalls.h:251:18: error: conflicting types for 'sys_container_create'
     asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
                     ^~~
   include/linux/syscalls.h:237:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:230:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/container.c:386:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(container_create,
    ^~~~~~~~~~~~~~~
   In file included from kernel/container.c:16:
   include/linux/syscalls.h:1002:17: note: previous declaration of 'sys_container_create' was here
    asmlinkage long sys_container_create(const char __user *name, unsigned int flags,
                    ^~~~~~~~~~~~~~~~~~~~


vim +/sys_container_create +251 include/linux/syscalls.h

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
