Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9B83A1D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712063751; cv=none; b=EQbM6dz9CjOt6eP/eyPY9Myj9eF2E7sjUvLPlFTpr5lomwMvYoLktku1E44uiCgLtegw0cgMkHexpwqgEhEy+3sIlgw6NsRWqkfl4dINbR7LLjFfImCiUtGvq+Ixg7gYm5uye2MLn4wkmPdyWncR8k8noVHqf7g0zv1fBgNCeB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712063751; c=relaxed/simple;
	bh=kt3p98lsL93vSzqtqYHdo03/45fovZP9+6WrxafvVp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUyy9NKw1wvB6YQv/yMqn1BTfLsHTasfFHkZQk63nYC+GnHsKWY/bom2CWFEB0mhpDUwFNXxkB34Baio2MExsfG9CsHSjQvINzWr9JdTq971OD1jqw1QX6/XG/2zKm43RMEpd49zQcnSorXBuBOVVflQN3N5Z34cqBHSH6Rlb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChtK9bGH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChtK9bGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712063750; x=1743599750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kt3p98lsL93vSzqtqYHdo03/45fovZP9+6WrxafvVp8=;
  b=ChtK9bGH0Ok/DJLrZx9uUNBVwF8rtaki0Ksl70hXqMQpGCm/Ijs7xmNf
   ypPtu3UqYaBYsnI6bFeJXoDWXeo+JYw0WyZvW/a0CfnSeogZC9FhLIX7H
   RkCU16vrig7z/U5lji2/r86CjJLEQ0ypAl1NpwxVvCoNDJyPsK/vU7HRn
   SkUW/+95HILnKoJabJtYA6t2HSXf95ASrX82yNTimzNIA/nOXdY5c6875
   d6XUN7KrYmwDByiSE/udNBvpq0vO8kjOpPeneI1U52jrAw4tIg253PUNu
   PJLvOfOY3CESSmNAzBQma12izhYU9OprM3lhVvz9h7y6BeAYRiQ9XNkng
   w==;
X-CSE-ConnectionGUID: +NjuGt4GTqSRR7cMnNofsw==
X-CSE-MsgGUID: d2y1U9WiQUmoNZnV5/zf2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24687899"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="24687899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 06:15:50 -0700
X-CSE-ConnectionGUID: XMBRVS4tRXaDgh+D0JEQoA==
X-CSE-MsgGUID: +c33UjftTAa5iRQFAz8rZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22537593"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2024 06:15:48 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrdzN-0001D3-3B;
	Tue, 02 Apr 2024 13:15:45 +0000
Date: Tue, 2 Apr 2024 21:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2555/3220]
 arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of
 function 'cmpxchg_emu_u8'
Message-ID: <202404022106.mYwpypit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
commit: ea7f9bb7268e89fff8590ab5a360f5b27a0fc19a [2555/3220] csky: Emulate one-byte and two-byte cmpxchg
config: csky-randconfig-r012-20230202 (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404022106.mYwpypit-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/atomic.h:9,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
>> arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
     138 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
         |                         ^~~~~~~~~~~~~~
   arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
     165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
         |          ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
>> arch/csky/include/asm/cmpxchg.h:141:25: error: implicit declaration of function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
     141 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
         |                         ^~~~~~~~~~~~~~~
   arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
     165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
         |          ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cmpxchg_emu_u8 +138 arch/csky/include/asm/cmpxchg.h

   125	
   126	#define arch_cmpxchg_acquire(ptr, o, n) \
   127		(__cmpxchg_acquire((ptr), (o), (n), sizeof(*(ptr))))
   128	
   129	#define __cmpxchg(ptr, old, new, size)				\
   130	({								\
   131		__typeof__(ptr) __ptr = (ptr);				\
   132		__typeof__(new) __new = (new);				\
   133		__typeof__(new) __tmp;					\
   134		__typeof__(old) __old = (old);				\
   135		__typeof__(*(ptr)) __ret;				\
   136		switch (size) {						\
   137		case 1:							\
 > 138			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
   139			break;						\
   140		case 2:							\
 > 141			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
   142			break;						\
   143		case 4:							\
   144			asm volatile (					\
   145			RELEASE_FENCE					\
   146			"1:	ldex.w		%0, (%3) \n"		\
   147			"	cmpne		%0, %4   \n"		\
   148			"	bt		2f       \n"		\
   149			"	mov		%1, %2   \n"		\
   150			"	stex.w		%1, (%3) \n"		\
   151			"	bez		%1, 1b   \n"		\
   152			FULL_FENCE					\
   153			"2:				 \n"		\
   154				: "=&r" (__ret), "=&r" (__tmp)		\
   155				: "r" (__new), "r"(__ptr), "r"(__old)	\
   156				:);					\
   157			break;						\
   158		default:						\
   159			BUILD_BUG();					\
   160		}							\
   161		__ret;							\
   162	})
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
