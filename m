Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A713774D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740245450; cv=none; b=my29kDGVdXBZ2mUgq90poA9jYjh/BIQT1wDukXdkiPsojfhF6uGtmoZyzXALpv5NbvLmOMYc07LAimm7FgIeDsBMTb/KCfHzZ+JJT8410GOFFKgBhbj6TTLxG9nXD5m6ogeK6URf6Ro2S4oxagE2CCJLVeVHzv0sYBNvb7RJE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740245450; c=relaxed/simple;
	bh=JUO8ByLOty48W96s3MPIWVz+i65yKXvzfISMRn6aLVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWrchO0Ma7gCLV3GBrGErGukAAgBdVNv/6/THfr+4j+JI3R9XmUY+KnkBzMihh9ezSFHqy+ujiuiEOQwp7AMEPLSzntusAEldda9w9WhNLJ7N26MAav1RqSFZfgd5PX5i6ybw9xnYLW39sh+vNyk4soho9DXpUH5VSw95MESFlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CN16RsIn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN16RsIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740245447; x=1771781447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUO8ByLOty48W96s3MPIWVz+i65yKXvzfISMRn6aLVs=;
  b=CN16RsIn+8rq1IrfCckTF56MFaNnRwyVh46O/3cJSzG+RaTbYbADXpph
   lccIq3v2Sl9wA5mjhrD0ylcANCr9L6nB2hsNLNwptIReprzwTOEYtmLn+
   +LpRLjPe6AvUemXJY6oGYV5wkZ4sfeKylFvkfSkZ7kaDw16VkEDReS8NH
   UFgBdf2F7pAjs6Wp+7dYNAVU0cjjJbecBXvTBNoW4V/ASDZ7d8/DmV3RD
   JddVMiNNkcEjZtuQDfMwS9EVj+8QiJeFqYOf+U1luRnSds/TxZFRt5tRS
   dzTzWT7z/ye4uW27/avGiezd3fcpQKML7NEs3gpvnlZJ/MoJrxOhXdxFh
   A==;
X-CSE-ConnectionGUID: n7GSTe1ZRsOJrrGiFXteyA==
X-CSE-MsgGUID: Wbg5gdnYTjGW4+OqR9rGSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="63519488"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="63519488"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:30:47 -0800
X-CSE-ConnectionGUID: vmL0ddnMS1SbNomlU+s79A==
X-CSE-MsgGUID: Nkuc7UIQRHS+gKKKv/gAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115460232"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2025 09:30:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tltKt-0006lv-2w;
	Sat, 22 Feb 2025 17:30:43 +0000
Date: Sun, 23 Feb 2025 01:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/dovetail-xenomai 5/5]
 include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer
 types lacks a cast
Message-ID: <202502230138.3rlAX4XL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   96c9aceb59d0ff2f4ac73415eeee24969ba6fa8f
commit: ab102e852e0ceccbb73cb592162734206651897a [5/5] media: i2c: update lt6911uxe for upstream and bug fix
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250223/202502230138.3rlAX4XL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230138.3rlAX4XL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230138.3rlAX4XL-lkp@intel.com/

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
