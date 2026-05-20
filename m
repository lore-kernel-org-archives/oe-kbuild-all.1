Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A823FB072
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301550; cv=none; b=gQpmcr2/I4J6GjOUkP+ODeUW1VDpoZMoUNRBD+ks8rXvzR6l1c5VIdDwPCx5U0qHXt+aCMJwqLMhq+YY0FQD2z6HtOgquphYkiMDEm00QNu5tVvV+RLp1O1z8ShBMaBJO6Hin1nnBW+ejokh5ACjeA0oJ0HMFcwuJoiHHVi03s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301550; c=relaxed/simple;
	bh=2m3sJIu8be8sipn+d6rIRo7WNcv+dRNFghe0Vi29oRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HE8FpN37NpLR093H5QNutMm76UEWYNjPs8peSrFv12kMd2sYeJh+IeZ+DsH2uLtu2XPLQZEvJgeNPQDvWYtLXaITxIcj6EOKqTaZtHV4EhIGsiY0uxd0GIXDAKL5Yo7pw1MFNHIGmEqdNHOnCllNBIE6ANYPLWWzAkvDH1P974I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huTwrshj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huTwrshj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779301549; x=1810837549;
  h=date:from:to:cc:subject:message-id;
  bh=2m3sJIu8be8sipn+d6rIRo7WNcv+dRNFghe0Vi29oRs=;
  b=huTwrshjwsZQdIn3oHpwxyreXjP9UyFfYCJLodB28ml5yAKRxLk18qlR
   s7BqWb0N07M3ahF41uxA70R2+/1BksdVej+lIKv0qQxKtudgZ0a9VmwRS
   qyaCY+plsgK5533C+Q9WrZyyu77l4wqmj9T4j/nFWhlkCyIzJf1kAVzsd
   XWKVaJTsY7SQ0UVILXHa4TOve69FZCRk7neWEN2L0KAD0UPWmKFM7Dapj
   r/JgVHWbDsOzlSSwA9u0TiSEE76UTc3rUbCgpt7lx9AAyDFzUNCzGlyy8
   R3iAB/yvHaCtghOU+yy3vMO6af5moZHYS/ZxbXibUcwDz0AYj2bYdV5cQ
   A==;
X-CSE-ConnectionGUID: /FozLvJhSjqWwxb5JAMASQ==
X-CSE-MsgGUID: LV5rp78XQ4a1OHk7BXSKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102888620"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102888620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 11:25:48 -0700
X-CSE-ConnectionGUID: GW8LMWBERDGzl543HsBkpw==
X-CSE-MsgGUID: YAfqmyfETNOqME5IH4dRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="236016254"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2026 11:25:47 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPlbj-000000003hB-05i7;
	Wed, 20 May 2026 18:25:36 +0000
Date: Thu, 21 May 2026 02:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tvs 1/1] include/asm-generic/div64.h:199:36: error:
 passing argument 1 of '__div64_32' from incompatible pointer type
Message-ID: <202605210209.3WNhTBHR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tvs
head:   19e86059f1efbb9ff920c102348a64a042145a2a
commit: 19e86059f1efbb9ff920c102348a64a042145a2a [1/1] hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605210209.3WNhTBHR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210209.3WNhTBHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210209.3WNhTBHR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/linux/sched.h:14,
                    from include/linux/freezer.h:8,
                    from drivers/hwmon/tvs-mpfs.c:7:
   drivers/hwmon/tvs-mpfs.c: In function 'mpfs_tvs_interval_write':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/hwmon/tvs-mpfs.c:132:9: note: in expansion of macro 'do_div'
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~
   In file included from include/linux/err.h:5,
                    from drivers/hwmon/tvs-mpfs.c:6:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/hwmon/tvs-mpfs.c:132:9: note: in expansion of macro 'do_div'
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long int *
   drivers/hwmon/tvs-mpfs.c:132:9: note: in expansion of macro 'do_div'
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
--
   In file included from arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from include/linux/sched.h:14,
                    from include/linux/freezer.h:8,
                    from tvs-mpfs.c:7:
   tvs-mpfs.c: In function 'mpfs_tvs_interval_write':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   tvs-mpfs.c:132:9: note: in expansion of macro 'do_div'
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~
   In file included from include/linux/err.h:5,
                    from tvs-mpfs.c:6:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   tvs-mpfs.c:132:9: note: in expansion of macro 'do_div'
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long int *
   tvs-mpfs.c:132:9: note: in expansion of macro 'do_div'
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~


vim +/__div64_32 +199 include/asm-generic/div64.h

^1da177e4c3f4152 Linus Torvalds     2005-04-16  176  
^1da177e4c3f4152 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f4152 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f4152 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f4152 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f868 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f868 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f868 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f868 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
c747ce4706190ef4 Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93f5 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93f5 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93f5 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93f5 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93f5 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93f5 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f868 Nicolas Pitre      2015-11-02 @195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190ef4 Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f4152 Linus Torvalds     2005-04-16 @199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190ef4 Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f4152 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f4152 Linus Torvalds     2005-04-16  203  

:::::: The code at line 199 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
