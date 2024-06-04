Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0B6FBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 01:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717464570; cv=none; b=ioYGXa521ER8hg7AjS7kYym0QdzNkN8i3XpZ8l8tAnedJOGoYFIKZjc/wZSSXRn9LT0BXKZoecYzQSEHipGabJwgN/5msa+hs4KbLRCEAgw65culAawPTiF5U/ZwJdKkoHgwJCX3a79hwov102v3y3WUhHuvxD6DTdY67zxeWVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717464570; c=relaxed/simple;
	bh=4LAOLs85bj4GEmmVMe15jfAKUTQ77ycIczlSjv+xT3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k4K0CbhtsuNgKunEaHSQFGGO1C9b8t3JKbeTUFm87xpKuRw5zZjjk8EQDjXiOraIuUuWRecmbxhC3L3iYUmQs5U6nPx2Tsb6yIUSfXlna4esVyrw8x+cC8kTlA9In6eHsb/BVrK+H8SJ3w46SmTV5yL7kNmKA6ZwH/o3kFDmURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSRMAXce; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSRMAXce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717464568; x=1749000568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LAOLs85bj4GEmmVMe15jfAKUTQ77ycIczlSjv+xT3E=;
  b=PSRMAXcedg4xk/KvJ9OoKcg6vbMHDZQnxQtRFpCIBM8T6Ljvdq6md0iW
   ReOmpD1HuGF51rwtH0betD32QnMm3U2Lp8WalZDeqOJDcbv4Agx7PgHYH
   FvFvzzWq78l761eUl33AcROGK/3dQb33RWnS+DDTIbaI2bFvkBp5a07cz
   0uJsg0cBVlXFoYroTK1n2yc/dLb0A4HFglrSo6DQAGKGCTOKncsoEMhyK
   LEXDbyxQXA4GGqg2g3vhdUUxjSjxwbL+i+jxokfc7aboayRWFZDm66hjl
   RbH1lOrC+NOaDMtF/A2fFQtK+Z/8F+VRbLaTPl8bHtDTsrIRnwfLcBG/W
   A==;
X-CSE-ConnectionGUID: f8qNLpE/Tf2lsvFcnad9WA==
X-CSE-MsgGUID: WKsjPKdKRPa513rn3+g3Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24609265"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="24609265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:29:28 -0700
X-CSE-ConnectionGUID: G+92GDmrSjG6r1a1pbpneg==
X-CSE-MsgGUID: KrjPuJ2vTdm+zpILoQqdVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37692909"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jun 2024 18:29:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEIzM-000MP7-0B;
	Tue, 04 Jun 2024 01:29:24 +0000
Date: Tue, 4 Jun 2024 09:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-6.10 5/5] include/asm-generic/div64.h:238:36:
 error: passing argument 1 of '__div64_32' from incompatible pointer type
Message-ID: <202406040925.iEKiI0UL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.10
head:   104fdbcf07a71a2435c3737c57b2927d0af260af
commit: 104fdbcf07a71a2435c3737c57b2927d0af260af [5/5] io_uring/napi: fix timeout calculation
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240604/202406040925.iEKiI0UL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040925.iEKiI0UL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040925.iEKiI0UL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from io_uring/io_uring.h:5,
                    from io_uring/napi.c:3:
   io_uring/napi.c: In function '__io_napi_adjust_timeout':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   io_uring/napi.c:284:25: note: in expansion of macro 'do_div'
     284 |                         do_div(poll_to, 1000);
         |                         ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   io_uring/napi.c:284:25: note: in expansion of macro 'do_div'
     284 |                         do_div(poll_to, 1000);
         |                         ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   io_uring/napi.c:284:25: note: in expansion of macro 'do_div'
     284 |                         do_div(poll_to, 1000);
         |                         ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

:::::: The code at line 238 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
