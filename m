Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321FA947
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691245475; x=1722781475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iHQsF7/yl/Wi9RUFawWz7L3giqmX+2QiiQ5EDC0R4k=;
  b=RLP/Mc3Ksa3/oGzGRxykHgp6PNPd4H6N6ma3UM2AbtEYPYoFd5UKOOa5
   Ff7pvcKAxOaQ9ob018ZJAIWU12kKKEoGZB9uXbkqMUQtqm+r2GyHqV7cj
   HZOT3+52J8yJIqYp96iQKelM7EHLhpG7ASrtMfMPizBf4rHBHt6M3uFbd
   x6EFaBi4N+C7oQM2+971m6jHxNQUIQuaBL4GLwXCcjErMxwKuKK/xEZ6c
   bKAY2m+6tqUSOzdoKICIIUbMR9dGNIvt66p3hCJ3F2ZakwrpKquhSbrzx
   zliZPFL0zq1QR7/lff0GZjl2mF6lFhi55r8+Y2Pu2j9xzbKxE+pcY4wtW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="350626254"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="350626254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 07:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="733598862"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="733598862"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Aug 2023 07:24:33 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSICm-0003Yn-2z;
	Sat, 05 Aug 2023 14:24:32 +0000
Date: Sat, 5 Aug 2023 22:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v4 28/70]
 arch/riscv/include/asm/cmpxchg.h:415:41: warning: passing argument 1 of
 '__cmpxchg_small' discards 'volatile' qualifier from pointer target type
Message-ID: <202308052248.Y7YIY3IT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v4
head:   ee021e57ffe3195b6a3ac5fcb2d4353375d1f261
commit: 1ff8b01f77a24e9bf21d6189f8913393494a2bd8 [28/70] RISC-V: paravirt: pvqspinlock: Add xchg8 & cmpxchg_small support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230805/202308052248.Y7YIY3IT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308052248.Y7YIY3IT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308052248.Y7YIY3IT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from drivers/gpu/drm/drm_lock.c:37:
   drivers/gpu/drm/drm_lock.c: In function 'drm_lock_take':
>> arch/riscv/include/asm/cmpxchg.h:415:41: warning: passing argument 1 of '__cmpxchg_small' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:452:30: note: in expansion of macro '__cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:9: note: in expansion of macro 'raw_cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_lock.c:75:24: note: in expansion of macro 'cmpxchg'
      75 |                 prev = cmpxchg(lock, old, new);
         |                        ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: expected 'void *' but argument is of type 'volatile unsigned int *'
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                     ~~~~~~^~~
   drivers/gpu/drm/drm_lock.c: In function 'drm_lock_transfer':
>> arch/riscv/include/asm/cmpxchg.h:415:41: warning: passing argument 1 of '__cmpxchg_small' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:452:30: note: in expansion of macro '__cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:9: note: in expansion of macro 'raw_cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_lock.c:118:24: note: in expansion of macro 'cmpxchg'
     118 |                 prev = cmpxchg(lock, old, new);
         |                        ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: expected 'void *' but argument is of type 'volatile unsigned int *'
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                     ~~~~~~^~~
   drivers/gpu/drm/drm_lock.c: In function 'drm_legacy_lock_free':
>> arch/riscv/include/asm/cmpxchg.h:415:41: warning: passing argument 1 of '__cmpxchg_small' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:452:30: note: in expansion of macro '__cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:9: note: in expansion of macro 'raw_cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_lock.c:141:24: note: in expansion of macro 'cmpxchg'
     141 |                 prev = cmpxchg(lock, old, new);
         |                        ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: expected 'void *' but argument is of type 'volatile unsigned int *'
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                     ~~~~~~^~~
   drivers/gpu/drm/drm_lock.c: In function 'drm_legacy_idlelock_release':
>> arch/riscv/include/asm/cmpxchg.h:415:41: warning: passing argument 1 of '__cmpxchg_small' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     415 |                         __cmpxchg_small(__ptr, (ulong)__old,            \
         |                                         ^~~~~
   arch/riscv/include/asm/cmpxchg.h:452:30: note: in expansion of macro '__cmpxchg'
     452 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
         |                              ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4746:9: note: in expansion of macro 'raw_cmpxchg'
    4746 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   drivers/gpu/drm/drm_lock.c:319:40: note: in expansion of macro 'cmpxchg'
     319 |                                 prev = cmpxchg(lock, old, DRM_KERNEL_CONTEXT);
         |                                        ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:360:43: note: expected 'void *' but argument is of type 'volatile unsigned int *'
     360 | static inline ulong __cmpxchg_small(void *ptr, ulong old,
         |                                     ~~~~~~^~~


vim +415 arch/riscv/include/asm/cmpxchg.h

   359	
   360	static inline ulong __cmpxchg_small(void *ptr, ulong old,
   361					    ulong new, ulong size)
   362	{
   363		ulong shift;
   364		ulong ret, mask, temp;
   365		volatile ulong *ptr32;
   366	
   367		/* Mask inputs to the correct size. */
   368		mask = GENMASK((size * BITS_PER_BYTE) - 1, 0);
   369		old &= mask;
   370		new &= mask;
   371	
   372		/*
   373		 * Calculate a shift & mask that correspond to the value we wish to
   374		 * compare & exchange within the naturally aligned 4 byte integer
   375		 * that includes it.
   376		 */
   377		shift = (ulong)ptr & 0x3;
   378		shift *= BITS_PER_BYTE;
   379		old <<= shift;
   380		new <<= shift;
   381		mask <<= shift;
   382	
   383		/*
   384		 * Calculate a pointer to the naturally aligned 4 byte integer that
   385		 * includes our byte of interest, and load its value.
   386		 */
   387		ptr32 = (volatile ulong *)((ulong)ptr & ~0x3);
   388	
   389		__asm__ __volatile__ (
   390			"0:	lr.w %0, %2\n"
   391			"	and  %1, %0, %z3\n"
   392			"	bne  %1, %z5, 1f\n"
   393			"	and  %1, %0, %z4\n"
   394			"	or   %1, %1, %z6\n"
   395			"	sc.w.rl %1, %1, %2\n"
   396			"	bnez %1, 0b\n"
   397			"	fence w, rw\n"
   398			"1:\n"
   399			: "=&r" (ret), "=&r" (temp), "+A" (*ptr32)
   400			: "rJ" (mask), "rJ" (~mask), "rJ" (old), "rJ" (new)
   401			: "memory");
   402	
   403		return (ret & mask) >> shift;
   404	}
   405	#define __cmpxchg(ptr, old, new, size)					\
   406	({									\
   407		__typeof__(ptr) __ptr = (ptr);					\
   408		__typeof__(*(ptr)) __old = (old);				\
   409		__typeof__(*(ptr)) __new = (new);				\
   410		__typeof__(*(ptr)) __ret;					\
   411		register unsigned int __rc;					\
   412		switch (size) {							\
   413		case 1:								\
   414			__ret = (__typeof__(*(ptr)))				\
 > 415				__cmpxchg_small(__ptr, (ulong)__old,		\
   416						(ulong)__new, (ulong)size);	\
   417			break;							\
   418		case 4:								\
   419			__asm__ __volatile__ (					\
   420				"0:	lr.w %0, %2\n"				\
   421				"	bne  %0, %z3, 1f\n"			\
   422				"	sc.w.rl %1, %z4, %2\n"			\
   423				"	bnez %1, 0b\n"				\
   424				"	fence rw, rw\n"				\
   425				"1:\n"						\
   426				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
   427				: "rJ" ((long)__old), "rJ" (__new)		\
   428				: "memory");					\
   429			break;							\
   430		case 8:								\
   431			__asm__ __volatile__ (					\
   432				"0:	lr.d %0, %2\n"				\
   433				"	bne %0, %z3, 1f\n"			\
   434				"	sc.d.rl %1, %z4, %2\n"			\
   435				"	bnez %1, 0b\n"				\
   436				"	fence rw, rw\n"				\
   437				"1:\n"						\
   438				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
   439				: "rJ" (__old), "rJ" (__new)			\
   440				: "memory");					\
   441			break;							\
   442		default:							\
   443			BUILD_BUG();						\
   444		}								\
   445		__ret;								\
   446	})
   447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
