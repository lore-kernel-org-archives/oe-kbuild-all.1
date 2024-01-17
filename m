Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381E20305
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705499050; cv=none; b=PWZb4Uu0uyUsDYr/hWarp2JZmWyh7rMvyCsN+YEmpRIfrfhOAZDkLA6bXlexzJVzxQmdZscw4bIaYPwCg/nv4RxuxPIlCSaGmWVofUmFudPfJzhtDpdeXtPDfMFG0F9hx1aWTlVYg5XbQC0NJAcEgkt4oHEtL8vR4I7Cbq5fozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705499050; c=relaxed/simple;
	bh=34onJ52Q9w48mQ5X+eLbvIFaWkTgbwEwZsz/UH3+Ats=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=pIyiGUX/MlL5h1/N7i4GAPLFIjhjyCWApaCRaLnDzgCRm78l/lnUX+Ak8RMrBxQHvzUqGqtooVXcgq+i7tdd3TUIv4Mb+6f6+/L33QomoQ3RoLh1/vFKaBrOC8essZNSspie8hZiC4LTmn8zrl6sfl7j7Q++G+sDeHdXGDcyY1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xtowitsi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xtowitsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705499048; x=1737035048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34onJ52Q9w48mQ5X+eLbvIFaWkTgbwEwZsz/UH3+Ats=;
  b=XtowitsiFYivfdr4xsmvpADonQbXsZzJv2okJWcQ7RtLlN49NUOjZEqP
   ckv3pE7GWvNvCmU9VeZKYKdgY+behl6an5RHbTQZO7RXtDaoRJ9XEzAFv
   Fn2XwLnOt6DEdJbZRvC7VwS6k3HZiI0UCHpqN0n5a5KynzEYoT0e+qETy
   bWEyra8pO/HtRAgNAsooS8aqW7R+pEq2XKnB0kLPgGWq2bCRvSL+jDFI1
   d7xAvxttLiPfASYqFIvscZ8ggc56yy7qWWjEicLzRa9bPvszELQ+HdGLq
   DjzJ+a8Lj7yaqGXW/tt6HO9oE+VijuCcNZScSMdnL1UIXkC0LNUT/Xrrk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="59178"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="59178"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 05:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818519204"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="818519204"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jan 2024 05:44:05 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ6D5-00022s-02;
	Wed, 17 Jan 2024 13:44:03 +0000
Date: Wed, 17 Jan 2024 21:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango-lro 8153/8200]
 include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
Message-ID: <202401172143.ERwMkceY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango-lro
head:   797c8f292de00b02d88325e6b299fd36bf5d0a1f
commit: 6603ccb18f15b9c1ec3c60f546d654d4c4de0f33 [8153/8200] mtd: ubi: provide NVMEM layer over UBI volumes
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240117/202401172143.ERwMkceY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172143.ERwMkceY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172143.ERwMkceY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from drivers/mtd/ubi/ubi.h:14,
                    from drivers/mtd/ubi/nvmem.c:7:
   drivers/mtd/ubi/nvmem.c: In function 'ubi_nvmem_reg_read':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from drivers/mtd/ubi/ubi.h:13:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    int *
   drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
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
