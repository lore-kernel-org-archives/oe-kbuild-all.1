Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74631822F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718602859; cv=none; b=GRIVYcQ+YLXKWFqnwxKlUYmZbrIeLndLhr5BdVtG31z1TLwlf3zUueCCHOcmMVQRFWgRg126nqS/ARFEnw+JKQDM+Vzjt4WTOYcqTsEtHTJIBlVGDimDJrjnhsfGkJOPX1C+l3tWftCcnFLJ8hp3KTNwQ5i7igFlLvGBMkylzxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718602859; c=relaxed/simple;
	bh=7ShUf6ReW7j8n4EEb3imM2rCWna9XICjfi1iAqztvhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=leMy0SOpqIJ4rZ9BQa0RMrLNS/uByd7aS0cQFF9sf9CmF7YFndBDQbdIxV23/RAl71afBnosEWtywO1pt45mfKpEgA5nw5UQ1ldkkYQm5tRzD9HKGAGC+QDxL5o8i3frYltkLK/39r9lDvLW/ufrf0AUlouWOPusC7bOYbyP8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKwuovUo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKwuovUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718602858; x=1750138858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ShUf6ReW7j8n4EEb3imM2rCWna9XICjfi1iAqztvhE=;
  b=JKwuovUoOVDIkhxGrI0ybaJ1yhfeJ1PgM3vSlHMSiONTERBlQf+CMZQH
   SoQwbA41cUZmRMed80AgwbXri3kx1EVTyGjs7vgZDLVZtuLBN5FzKorB2
   CChk9DkOFnoRhChMfAbOXEHB4k6AuhjCnZRD/vIEx+dYD131HjP78ZZ3d
   XL03EMWBP+45K9xI+CknwPqiL38OthPUoCQJn91gFVZDcAQ2MpxHKbM7M
   sMtDKVIUw0ua/rW8Dsaogo0x5eh9IGMQeK7HM9bi7IGHz/4ZXbwlXzBYE
   0J7nAcgRAtj5p4GK10rOJMD6WGOCU75STqAT7BBUHOyZaTb2rfuRfEzpa
   A==;
X-CSE-ConnectionGUID: vKiZpZLjS76RhZen5LoMiQ==
X-CSE-MsgGUID: YcYvASUbQWCi4adZT+6K4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="19272373"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="19272373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 22:40:57 -0700
X-CSE-ConnectionGUID: 2LX6ol75TGOf3DyQyXCksg==
X-CSE-MsgGUID: KnnGTjaxQbusLra/jXOuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41191613"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2024 22:40:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ56s-0003rC-0b;
	Mon, 17 Jun 2024 05:40:54 +0000
Date: Mon, 17 Jun 2024 13:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 4/10] arch/x86/include/asm/cmpxchg.h:128:17: error:
 call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument
 size for cmpxchg
Message-ID: <202406171345.MvBPkwUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   0418364991ef20583c19f070a31c0bfd69e6ff2d
commit: 11d2d363e0caf8bdb9191c0c1c5aa6f37207ccbd [4/10] fs: add infrastructure for multigrain timestamps
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240617/202406171345.MvBPkwUn-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171345.MvBPkwUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171345.MvBPkwUn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/inode.c:7:
   fs/inode.c: In function 'inode_set_ctime_current':
>> arch/x86/include/asm/cmpxchg.h:128:17: error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument size for cmpxchg
     128 |                 __cmpxchg_wrong_size();                                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/inode.c:2623:23: note: in expansion of macro 'cmpxchg'
    2623 |                 old = cmpxchg(&ctime_floor, floor, now);
         |                       ^~~~~~~
>> arch/x86/include/asm/cmpxchg.h:128:17: error: call to '__cmpxchg_wrong_size' declared with attribute error: Bad argument size for cmpxchg
     128 |                 __cmpxchg_wrong_size();                                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:134:9: note: in expansion of macro '__raw_cmpxchg'
     134 |         __raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
         |         ^~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:149:9: note: in expansion of macro '__cmpxchg'
     149 |         __cmpxchg(ptr, old, new, sizeof(*(ptr)))
         |         ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   fs/inode.c:2635:15: note: in expansion of macro 'cmpxchg'
    2635 |         now = cmpxchg(&inode->__i_ctime, ctime, sav);
         |               ^~~~~~~


vim +/__cmpxchg_wrong_size +128 arch/x86/include/asm/cmpxchg.h

e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   79  
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   80  /*
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   81   * Atomic compare and exchange.  Compare OLD with MEM, if identical,
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   82   * store NEW in MEM.  Return the initial value in MEM.  Success is
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   83   * indicated by comparing RETURN with OLD.
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   84   */
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   85  #define __raw_cmpxchg(ptr, old, new, size, lock)			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   86  ({									\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   87  	__typeof__(*(ptr)) __ret;					\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   88  	__typeof__(*(ptr)) __old = (old);				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   89  	__typeof__(*(ptr)) __new = (new);				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   90  	switch (size) {							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   91  	case __X86_CASE_B:						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   92  	{								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   93  		volatile u8 *__ptr = (volatile u8 *)(ptr);		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   94  		asm volatile(lock "cmpxchgb %2,%1"			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   95  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   96  			     : "q" (__new), "0" (__old)			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   97  			     : "memory");				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   98  		break;							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18   99  	}								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  100  	case __X86_CASE_W:						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  101  	{								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  102  		volatile u16 *__ptr = (volatile u16 *)(ptr);		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  103  		asm volatile(lock "cmpxchgw %2,%1"			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  104  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  105  			     : "r" (__new), "0" (__old)			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  106  			     : "memory");				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  107  		break;							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  108  	}								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  109  	case __X86_CASE_L:						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  110  	{								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  111  		volatile u32 *__ptr = (volatile u32 *)(ptr);		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  112  		asm volatile(lock "cmpxchgl %2,%1"			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  113  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  114  			     : "r" (__new), "0" (__old)			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  115  			     : "memory");				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  116  		break;							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  117  	}								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  118  	case __X86_CASE_Q:						\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  119  	{								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  120  		volatile u64 *__ptr = (volatile u64 *)(ptr);		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  121  		asm volatile(lock "cmpxchgq %2,%1"			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  122  			     : "=a" (__ret), "+m" (*__ptr)		\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  123  			     : "r" (__new), "0" (__old)			\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  124  			     : "memory");				\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  125  		break;							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  126  	}								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  127  	default:							\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18 @128  		__cmpxchg_wrong_size();					\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  129  	}								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  130  	__ret;								\
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  131  })
e9826380d83d1b Jeremy Fitzhardinge 2011-08-18  132  

:::::: The code at line 128 was first introduced by commit
:::::: e9826380d83d1bda3ee5663bf3fa4667a6fbe60a x86, cmpxchg: Unify cmpxchg into cmpxchg.h

:::::: TO: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
