Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B65C8EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710402027; cv=none; b=GVGSOk8wfKNHNqAV+x4gvRIaMvSBdhnd9belQxSJDJ/CVCfvvOE0scjLi9XN7gj+mQqA/SiSGlkiNcXsmfA4S5tiszTS7m6bggbkBHxXauux5FHa6M4oYDIVG6yaSaBeYcSiRD+0ZlMRakXBD0cIL6s05O6emLMt8Po7wlKyDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710402027; c=relaxed/simple;
	bh=zLKL0DDG9XDfRZrPho7jKJxBO9fRRVrWa0pULmofDoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dew1H2Kp1V4gJMCxEOWMw1Mt/mTZE9uUDcQl1uzDJsFfQw+avBFhocv17ry1ZVl7mQNsJ9A309/J2CuH+PcuJr1R/ZdQf47KBgvbL0wYbFMlOhFopt2yVdtmRl5Tke9OUNZrO42zhc9ZEHvcPVSxBXPiFxovqC+kKtTy0Vbgx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RErn4YiD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RErn4YiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710402026; x=1741938026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLKL0DDG9XDfRZrPho7jKJxBO9fRRVrWa0pULmofDoc=;
  b=RErn4YiDNdL4ZRyYeRefx630DvgQNy3TgLKOG1HQPa2yN5hRTTD7CUap
   TccqiGffIT16d/98Y/aFVR56jDMcma7wHFR8gsoMziMDnDNMyG7QDdURC
   Ji5sXN1P4cVZDPJrkyDehkr0l2bsyfcCqweyBYxiW78a+HXYlACyUnwKn
   enb5fmwHirXaTN3pb2eY0yNiDPoMBJGL5CiBmevjYMaH84rR3jEIG9r7L
   fX81G1na8un1TbaM/FUGnP6kxnfJ5gbCnEtH3ZA/RtdP+qkNQrezd6vCi
   UjqLagj8ManicflodmCX2Im0bUdmlblO0CQZyQemSjQpJDEGJ8ejrl2BP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30644629"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="30644629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 00:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16798286"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2024 00:40:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkfhK-000DDf-2T;
	Thu, 14 Mar 2024 07:40:18 +0000
Date: Thu, 14 Mar 2024 15:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [pcmoore-lsm:stable-6.9 1/1] include/linux/syscalls.h:248:25: error:
 conflicting types for 'sys_lsm_set_self_attr'; have 'long int(unsigned int,
  struct lsm_ctx *, u32,  u32)' {aka 'long int(unsigned int,  struct lsm_ctx
 *, unsigned int,  unsigned int)'}
Message-ID: <202403141537.LylpnqQH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git stable-6.9
head:   00721b98d0619a04f73532cc6af092c549868d92
commit: 00721b98d0619a04f73532cc6af092c549868d92 [1/1] lsm: use 32 bit compatible data types in LSM syscalls
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240314/202403141537.LylpnqQH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141537.LylpnqQH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141537.LylpnqQH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/lsm_syscalls.c:15:
>> include/linux/syscalls.h:248:25: error: conflicting types for 'sys_lsm_set_self_attr'; have 'long int(unsigned int,  struct lsm_ctx *, u32,  u32)' {aka 'long int(unsigned int,  struct lsm_ctx *, unsigned int,  unsigned int)'}
     248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:234:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     226 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:55:1: note: in expansion of macro 'SYSCALL_DEFINE4'
      55 | SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:964:17: note: previous declaration of 'sys_lsm_set_self_attr' with type 'long int(unsigned int,  struct lsm_ctx *, size_t,  __u32)' {aka 'long int(unsigned int,  struct lsm_ctx *, long unsigned int,  unsigned int)'}
     964 | asmlinkage long sys_lsm_set_self_attr(unsigned int attr, struct lsm_ctx *ctx,
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/syscalls.h:248:25: error: conflicting types for 'sys_lsm_get_self_attr'; have 'long int(unsigned int,  struct lsm_ctx *, u32 *, u32)' {aka 'long int(unsigned int,  struct lsm_ctx *, unsigned int *, unsigned int)'}
     248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:234:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     226 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:77:1: note: in expansion of macro 'SYSCALL_DEFINE4'
      77 | SYSCALL_DEFINE4(lsm_get_self_attr, unsigned int, attr, struct lsm_ctx __user *,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:962:17: note: previous declaration of 'sys_lsm_get_self_attr' with type 'long int(unsigned int,  struct lsm_ctx *, size_t *, __u32)' {aka 'long int(unsigned int,  struct lsm_ctx *, long unsigned int *, unsigned int)'}
     962 | asmlinkage long sys_lsm_get_self_attr(unsigned int attr, struct lsm_ctx *ctx,
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/syscalls.h:248:25: error: conflicting types for 'sys_lsm_list_modules'; have 'long int(u64 *, u32 *, u32)' {aka 'long int(long long unsigned int *, unsigned int *, unsigned int)'}
     248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:234:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     225 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:96:1: note: in expansion of macro 'SYSCALL_DEFINE3'
      96 | SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:966:17: note: previous declaration of 'sys_lsm_list_modules' with type 'long int(u64 *, size_t *, u32)' {aka 'long int(long long unsigned int *, long unsigned int *, unsigned int)'}
     966 | asmlinkage long sys_lsm_list_modules(u64 *ids, size_t *size, u32 flags);
         |                 ^~~~~~~~~~~~~~~~~~~~


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
