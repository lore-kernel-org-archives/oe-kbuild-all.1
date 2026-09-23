Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0441BA82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 05:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140371; cv=none; b=ULWxT+wRhrSmDAXkbp02yVuUls5wzJPZUnt0LK5k617uaPhbqmFXa84oAjBCizO9drAoWa/D0a43MlzjKsfvvIrLFNMM5aEtCdKiIa1TRDaLgyUrA4zaGD49KNbgtHMqXuZajS+bgyMOB43n4UfDJeKFfSbQt0eRwXUnIwK00eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140371; c=relaxed/simple;
	bh=JrIV63cN0NTJ9MU1CdA6sMw7ripyDg5MYLTC7byWXOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lZIGkCL0KDDJIVD+bXb63FVq092DcsByK8YMwrBZN+hieaKEwnMVzsEH9SkLk9Ro+uAi2IYG++zauKPh1m1gZmO/SdCWQVeuLDSIN5+rJk4znyPQ+Dq66s9bR3GV6YqJ+aeghlLXR/baZNM1SZOMc4RMrDqDtbeG7T9mLA45CSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSoAFoQQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSoAFoQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790140368; x=1821676368;
  h=date:from:to:cc:subject:message-id;
  bh=JrIV63cN0NTJ9MU1CdA6sMw7ripyDg5MYLTC7byWXOk=;
  b=PSoAFoQQlcrLesPdkk1FYVNd7KOHW3ipi2f1bPGIIGNYXpQ/ZgQ89Bth
   R/zgZVk1OWToZa8docCmjdMwVIRvQiWXj62yj1OPe+i5FKX6upESg/30T
   vboyIsUtU11Hwu7yGyzdGJFU7uXeTsku4Pf3ABRB5eIuumfSdIJ26Sd0W
   D5QPUh2Td/tLmJ04gaaG9X0/zgnRIqojAN+CikmCh/Sn1SGiw07AFSf86
   E5s3sWgK2CJhSg5shQsP/py/0g9TH3xeM9eZGJ9QQ+nbHZGXNiw7nDyQn
   LZDQ0TY4ORKxOszAh8jV1bc3rX5qb4rjLcMckxgO0mwh45akLbCo884H/
   w==;
X-CSE-ConnectionGUID: HT3mqvihTNqyuNFAy+Irxw==
X-CSE-MsgGUID: JKmjyW1eQ8GCBc3FUv9Clg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90820161"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90820161"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:12:28 -0700
X-CSE-ConnectionGUID: pd2T1ncxQxCNJaP81/ic0g==
X-CSE-MsgGUID: rm+ebD8tR8qT1WBEa2Q2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4518025"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 22 Sep 2026 22:12:27 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9FHM-000000000Wv-0JkO;
	Wed, 23 Sep 2026 05:12:24 +0000
Date: Wed, 23 Sep 2026 07:12:20 +0200
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:cmpxchg2.2026.09.22a 28/28]
 arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch in
 conditional expression
Message-ID: <202609230743.rxxNILn7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
commit: 54c282c15475ebfae4712fe3ab637c9d19c723d6 [28/28] xtensa: Emulate two-byte cmpxchg
config: xtensa-randconfig-r2102-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230743.rxxNILn7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230743.rxxNILn7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230743.rxxNILn7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from fs/crypto/hooks.c:8:
   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                          ^
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                   ^~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                            ^~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                          ^
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                   ^~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                            ^~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
>> arch/xtensa/include/asm/cmpxchg.h:88:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                          ^
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:51: note: first expression has type 'char *'
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                   ^~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/xtensa/include/asm/cmpxchg.h:88:60: note: second expression has type 'unsigned char *'
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                            ^~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/crypto/hooks.c:419:9: note: in expansion of macro 'if'
     419 |         if (!has_key ||
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~


vim +88 arch/xtensa/include/asm/cmpxchg.h

    85	
    86	#define arch_cmpxchg(ptr,o,n)						      \
    87		({ unsigned long _old_ = (unsigned long)(0 ? *(ptr) : (o));	      \
  > 88		unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));	      \
    89		(__typeof__(*(ptr))) __cmpxchg((ptr), _old_,		      \
    90					_new_, sizeof (*(ptr))); \
    91		})
    92	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
