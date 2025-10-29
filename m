Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22244312836
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761772447; cv=none; b=d3+Gwf0Z+wT7dGnFUHhU52YHLsMr6idbUZAuVwNTu37Fed9l8FtEI0luoNqwDT66kNwUE4fTNLrb0CNP8fbN0Cfzsdqa+BLVyY6HhOORDRNv+eP56psuQ58QLlhJWLHjPxNNzj1/yq3oom8BnPsaLBSff8bufUWNwPAr0ZC34cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761772447; c=relaxed/simple;
	bh=Wh1C46ex1d8l8Kut3GcBahmXzOausUWKOibrwKZYuwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Txc5QoiRDG9sKmixFz/uu9y7E3gbofyestvO6no7JsKhZ2iq8+VVjidMULJb8S8eNHLXJVZCrhlh58DsP+HWTcDdYb3B2uv0kvAbnmv4yc8/9pLgojp5FCTr6z6i9JuHh6lYJfi4W+0gBUAL0KqOIuCezWL1rZ55wWcD6fL5yWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZK2Xwuc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZK2Xwuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761772445; x=1793308445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wh1C46ex1d8l8Kut3GcBahmXzOausUWKOibrwKZYuwA=;
  b=jZK2XwucJkiUIw9Ay7EX2xdSbt30ltId6qrboIFupvksWfjlTWoEp4F/
   HVaYufi4gFJPp1g2GTX+U6yCRfNguif/61pHR9Ufof/So8pYZ0or6ZApr
   tRcNhNDy6WKIAJTa/xiqE0erNJFj/nE7F54rh8BWfLG7B8J24sNiPj9Yh
   22GXlJywBm//BGb8IH69CC+t/g4cucSXA4l7/LqVWxpsAv4TL8izZbAsO
   kfOFFrly39jVbjroO3VK98FGw6r7AXkk+W4G6A/ZbgYGvR3Ss0XONJRc/
   q5sKebIj0Wu4PApzsAn9RpBU6bqyvIfYq6DK57sGKxHLH17EPKulTkGE0
   w==;
X-CSE-ConnectionGUID: uDCDXS47RaO8lPmGB0yZVA==
X-CSE-MsgGUID: JLZkTypeS+SPDVR2VC1pdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63941419"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63941419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:14:04 -0700
X-CSE-ConnectionGUID: zbh1ftXUTfySScqrD+NIDA==
X-CSE-MsgGUID: DyLZyb9ZQeSiEU+7hjHjgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185651404"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2025 14:14:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDTF-000LAO-0F;
	Wed, 29 Oct 2025 21:12:56 +0000
Date: Thu, 30 Oct 2025 05:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.19.misc 5/5]
 arch/arm64/include/asm/barrier.h:170:26: error: passing argument 1 of
 'kasan_check_read' makes pointer from integer without a cast
Message-ID: <202510300552.8xMq9OAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.19.misc
head:   ade24f8214fe3fdfe20233584bca932ab00b752d
commit: ade24f8214fe3fdfe20233584bca932ab00b752d [5/5] fs/pipe: stop duplicating union pipe_index declaration
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510300552.8xMq9OAD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300552.8xMq9OAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300552.8xMq9OAD-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:9: note: in expansion of macro 'compiletime_assert'
     600 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:28: note: in expansion of macro '__native_word'
     600 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   fs/pipe.c:294:59: error: 'struct pipe_inode_info' has no member named 'head'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                           ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:9: note: in expansion of macro 'compiletime_assert'
     600 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:28: note: in expansion of macro '__native_word'
     600 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   fs/pipe.c:294:59: error: 'struct pipe_inode_info' has no member named 'head'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                           ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:9: note: in expansion of macro 'compiletime_assert'
     600 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:28: note: in expansion of macro '__native_word'
     600 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   fs/pipe.c:294:59: error: 'struct pipe_inode_info' has no member named 'head'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                           ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:9: note: in expansion of macro 'compiletime_assert'
     600 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:600:28: note: in expansion of macro '__native_word'
     600 |         compiletime_assert(__native_word(t),                            \
         |                            ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:169:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     169 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   fs/pipe.c:294:59: error: 'struct pipe_inode_info' has no member named 'head'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                           ^~
   arch/arm64/include/asm/barrier.h:170:39: note: in definition of macro '__smp_load_acquire'
     170 |         kasan_check_read(__p, sizeof(*p));                              \
         |                                       ^
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/barrier.h:170:26: error: passing argument 1 of 'kasan_check_read' makes pointer from integer without a cast [-Wint-conversion]
     170 |         kasan_check_read(__p, sizeof(*p));                              \
         |                          ^~~
         |                          |
         |                          int
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   In file included from include/asm-generic/rwonce.h:26:
   include/linux/kasan-checks.h:40:58: note: expected 'const volatile void *' but argument is of type 'int'
      40 | static inline bool kasan_check_read(const volatile void *p, unsigned int size)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^
   fs/pipe.c:294:59: error: 'struct pipe_inode_info' has no member named 'head'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                           ^~
   arch/arm64/include/asm/barrier.h:171:25: note: in definition of macro '__smp_load_acquire'
     171 |         switch (sizeof(*p)) {                                           \
         |                         ^
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:175:32: error: invalid type argument of unary '*' (have 'int')
     175 |                         : "Q" (*__p) : "memory");                       \
         |                                ^~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:180:32: error: invalid type argument of unary '*' (have 'int')
     180 |                         : "Q" (*__p) : "memory");                       \
         |                                ^~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:185:32: error: invalid type argument of unary '*' (have 'int')
     185 |                         : "Q" (*__p) : "memory");                       \
         |                                ^~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:190:32: error: invalid type argument of unary '*' (have 'int')
     190 |                         : "Q" (*__p) : "memory");                       \
         |                                ^~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   fs/pipe.c:294:59: error: 'struct pipe_inode_info' has no member named 'head'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                                           ^~
   arch/arm64/include/asm/barrier.h:193:18: note: in definition of macro '__smp_load_acquire'
     193 |         (typeof(*p))__u.__val;                                          \
         |                  ^
   fs/pipe.c:294:37: note: in expansion of macro 'smp_load_acquire'
     294 |                 unsigned int head = smp_load_acquire(&pipe->head);
         |                                     ^~~~~~~~~~~~~~~~
   fs/pipe.c:295:41: error: 'struct pipe_inode_info' has no member named 'tail'
     295 |                 unsigned int tail = pipe->tail;
         |                                         ^~
   fs/pipe.c: In function 'pipe_writable':
   fs/pipe.c:423:61: error: 'const struct pipe_inode_info' has no member named 'head_tail'
     423 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                             ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/pipe.c:423:47: note: in expansion of macro 'READ_ONCE'
     423 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                               ^~~~~~~~~
   fs/pipe.c:423:61: error: 'const struct pipe_inode_info' has no member named 'head_tail'
     423 |         union pipe_index idx = { .head_tail = READ_ONCE(pipe->head_tail) };
         |                                                             ^~
   include/linux/compiler_types.h:577:23: note: in definition of macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'


vim +/kasan_check_read +170 arch/arm64/include/asm/barrier.h

47933ad41a86a4 Peter Zijlstra     2013-11-06  164  
fd072df850e536 Michael S. Tsirkin 2015-12-27  165  #define __smp_load_acquire(p)						\
47933ad41a86a4 Peter Zijlstra     2013-11-06  166  ({									\
10223c5286f738 Will Deacon        2019-12-19  167  	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u;	\
131e135f7fd14b Mark Rutland       2019-04-09  168  	typeof(p) __p = (p);						\
47933ad41a86a4 Peter Zijlstra     2013-11-06  169  	compiletime_assert_atomic_type(*p);				\
131e135f7fd14b Mark Rutland       2019-04-09 @170  	kasan_check_read(__p, sizeof(*p));				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  171  	switch (sizeof(*p)) {						\
878a84d5a8a18a Andre Przywara     2015-04-20  172  	case 1:								\
878a84d5a8a18a Andre Przywara     2015-04-20  173  		asm volatile ("ldarb %w0, %1"				\
c139aa60c10074 Will Deacon        2015-11-18  174  			: "=r" (*(__u8 *)__u.__c)			\
131e135f7fd14b Mark Rutland       2019-04-09  175  			: "Q" (*__p) : "memory");			\
878a84d5a8a18a Andre Przywara     2015-04-20  176  		break;							\
878a84d5a8a18a Andre Przywara     2015-04-20  177  	case 2:								\
878a84d5a8a18a Andre Przywara     2015-04-20  178  		asm volatile ("ldarh %w0, %1"				\
c139aa60c10074 Will Deacon        2015-11-18  179  			: "=r" (*(__u16 *)__u.__c)			\
131e135f7fd14b Mark Rutland       2019-04-09  180  			: "Q" (*__p) : "memory");			\
878a84d5a8a18a Andre Przywara     2015-04-20  181  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  182  	case 4:								\
47933ad41a86a4 Peter Zijlstra     2013-11-06  183  		asm volatile ("ldar %w0, %1"				\
c139aa60c10074 Will Deacon        2015-11-18  184  			: "=r" (*(__u32 *)__u.__c)			\
131e135f7fd14b Mark Rutland       2019-04-09  185  			: "Q" (*__p) : "memory");			\
47933ad41a86a4 Peter Zijlstra     2013-11-06  186  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  187  	case 8:								\
47933ad41a86a4 Peter Zijlstra     2013-11-06  188  		asm volatile ("ldar %0, %1"				\
c139aa60c10074 Will Deacon        2015-11-18  189  			: "=r" (*(__u64 *)__u.__c)			\
131e135f7fd14b Mark Rutland       2019-04-09  190  			: "Q" (*__p) : "memory");			\
47933ad41a86a4 Peter Zijlstra     2013-11-06  191  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  192  	}								\
10223c5286f738 Will Deacon        2019-12-19  193  	(typeof(*p))__u.__val;						\
47933ad41a86a4 Peter Zijlstra     2013-11-06  194  })
47933ad41a86a4 Peter Zijlstra     2013-11-06  195  

:::::: The code at line 170 was first introduced by commit
:::::: 131e135f7fd14b1de7a5eb26631076705c18073f arm64: instrument smp_{load_acquire,store_release}

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
