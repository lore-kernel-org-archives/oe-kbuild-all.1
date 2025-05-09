Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0972749D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786123; cv=none; b=cBAn8bnZ+DIBFm+foYvjeOs7FfHqdFkJcEZRckKdpb9jPfGD+EMmgZXds6QHwvpheY7hLoAuN7Pq+Wt61Q8Jvu7A8FAO1bFhyemZOk5xwQljGnwgKUZ7mNMNEnDCbHM08tEEI3l4z+BoTU3/3XS0APr2wVcZdJpGpSTebno9Tgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786123; c=relaxed/simple;
	bh=RQEUA6kgNlpmBS/vosDF1TaHTx6M70cki15q9bKO2zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tS7bzzErpBJhyNXqn4lRD/+vyqKJ6r0cqV+YugCgzjk2/ZqY4HpwER3YZZ9L5T4A/ZaaT6VEo1mKuqhkAMPHYXLO5O+A3Pxp8uJjU4gKeZ4DQGoW9EoW8k/RGW5X2PDzNry+x12/T0463VM1bOiCWxPZFvMbuI3daUyXtad9rjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVa7qzV3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVa7qzV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746786118; x=1778322118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQEUA6kgNlpmBS/vosDF1TaHTx6M70cki15q9bKO2zo=;
  b=kVa7qzV3wIbOaIEumKj4c7+lX/J4538giZ539fRuRDpnVwcAjk+WQTAd
   mHz0hi6izQlQiUDAFsRWJm2lN/MXHaaEs8ykf9u33QDkMTTA2OcGDfcI3
   hsBqZ/DK6+hDYiqgNL00CzZcWUaClGCXvXQdGExhbOIjbJvqoRQRaobWq
   W1GliEsX5MdVwagBTI09sbGv3ayusw6qk0BcP7H0VQv3sbIfxzwyi00Sr
   mlNxoamPwOA6L1dQ1qgrjtNxN39pFbMr7DmKyh2sunj4RuxS07egR/vIi
   RamI7+uaJz1lN7OJSq8W0UvidIXGZgh3HOGQxFvQGT1GkhnjubEhVu1vA
   w==;
X-CSE-ConnectionGUID: Nqye0jIZQZ+dGkxaRHJnGA==
X-CSE-MsgGUID: vMY5EYzqQoO14L4auIIrAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48725835"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48725835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 03:21:58 -0700
X-CSE-ConnectionGUID: sDYLl4KgRh2sHsYHUWj69Q==
X-CSE-MsgGUID: ChhwpsODRzSschq6+tCQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="140631461"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 May 2025 03:21:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKra-000Bvr-2g;
	Fri, 09 May 2025 10:21:54 +0000
Date: Fri, 9 May 2025 18:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 4/4] include/asm-generic/div64.h:222:35:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202505091859.RgCrvBsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zouxiaoh,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   a9d3931257c927df409a753fabaad47d34915467
commit: ab102e852e0ceccbb73cb592162734206651897a [4/4] media: i2c: update lt6911uxe for upstream and bug fix
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505091859.RgCrvBsC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091859.RgCrvBsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091859.RgCrvBsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/media/i2c/lt6911uxe.c:4:
   drivers/media/i2c/lt6911uxe.c: In function 'get_pixel_rate':
>> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/media/i2c/lt6911uxe.c:117:9: note: in expansion of macro 'do_div'
     117 |         do_div(pixel_rate, lt6911uxe->cur_mode.lanes);
         |         ^~~~~~
   drivers/media/i2c/lt6911uxe.c: In function 'lt6911uxe_init_state':
   drivers/media/i2c/lt6911uxe.c:392:27: warning: unused variable 'lt6911uxe' [-Wunused-variable]
     392 |         struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
         |                           ^~~~~~~~~


vim +222 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
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
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

:::::: The code at line 222 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
