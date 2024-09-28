Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F60186E34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727567106; cv=none; b=pzzlEhpU8LHmAz7DuE62iXUgoGtvYXGFff+LX3AJpe/mNZz7ZyrEwIq9n+nnM1dIr3Yc1BzfUQA+KpYg9zL3dDQtR15cVYQXfJ9zcrsRAyIuO43f6BnCqRJ9ZYvXsdCqizKEBmNwba8xJGCz4PUuAnmQUGEuPY5ujHyeKqAiINs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727567106; c=relaxed/simple;
	bh=OzTMThQtn+8oJadiIHNXTafqbuDEOYF0U1RRRK/kxfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRxC+wLRefnCguyYzIx5uib6T3Z/y2xIYq3icSx7Lu4JeI2sHcHYEuZp0l8tCBGSHpWgxiqQVGPEImIjD91LwC8K/oGBLY24sVyJzOI8jfyGbZSyJuKOcwHkzr06jf+3abgYKiW3XtdKMj7GmGaS9u+cWgHdQC8s6KHRrva8mnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+W6R4DR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+W6R4DR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727567105; x=1759103105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzTMThQtn+8oJadiIHNXTafqbuDEOYF0U1RRRK/kxfM=;
  b=E+W6R4DRJ7x/Rs62j5y7gy+1ubLawxPOrmwY91kSiLHrPZOB2yA/LwI1
   sUz8LOLNG0gVO+jlMOkof6uLhMUkX01nwOzcqCRgr3UUJhH2N4i0f+/3T
   cJioXvW717JoiSqCA0FymUsTbxV6uXxfMFdy74CjFTkTY8GXEMJohrQdF
   PcwBh+s2xf2Ci7JoDC5LDYKxtn1+DxgvEJok7umd57KTz2tqwuvvXxioL
   bGL5TQyywPJWrT6MgNsFki6EObpu3HhA3RxGbkDdLQfGE9pPvWxuLgSPk
   85JTWmAJMo0VfhT+f/YaPrzZcj2J/8uup5esGWM50jREUf3oWENpR/HXT
   w==;
X-CSE-ConnectionGUID: PrYw5Nj/TiWLzjReKv8EMw==
X-CSE-MsgGUID: pi1z96ikTaqAzxEOF8Hegg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30569597"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30569597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 16:45:04 -0700
X-CSE-ConnectionGUID: vgfNe5BQSfePFv7NZztnqQ==
X-CSE-MsgGUID: mooaoLwfSoi/aThxD1UVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73196472"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 16:45:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suh7U-000Nkt-1y;
	Sat, 28 Sep 2024 23:45:00 +0000
Date: Sun, 29 Sep 2024 07:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3861/16788]
 include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
Message-ID: <202409290752.ksGKHZe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 3ccc0ee10b6a5e21ce67439ee001bc2c4173928d [3861/16788] MLK-24930-1: sound: soc: fsl: imx pcm512x: iqaudio dac
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240929/202409290752.ksGKHZe9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290752.ksGKHZe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290752.ksGKHZe9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from sound/soc/fsl/imx-pcm512x.c:13:
   sound/soc/fsl/imx-pcm512x.c: In function 'imx_pcm512x_hw_params':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   sound/soc/fsl/imx-pcm512x.c:190:21: note: in expansion of macro 'do_div'
     190 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/soc/fsl/imx-pcm512x.c:190:21: note: in expansion of macro 'do_div'
     190 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   sound/soc/fsl/imx-pcm512x.c:190:21: note: in expansion of macro 'do_div'
     190 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:194:33: error: 'PCM512x_SYSCLK_MCLK1' undeclared (first use in this function); did you mean 'PCM512x_SDAC_MCK'?
     194 |                                 PCM512x_SYSCLK_MCLK1, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 PCM512x_SDAC_MCK
   sound/soc/fsl/imx-pcm512x.c:194:33: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/fsl/imx-pcm512x.c:199:33: error: 'PCM512x_SYSCLK_MCLK2' undeclared (first use in this function); did you mean 'PCM512x_SDAC_MCK'?
     199 |                                 PCM512x_SYSCLK_MCLK2, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 PCM512x_SDAC_MCK


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
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @234  	} else if (likely(((n) >> 32) == 0)) {		\
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
