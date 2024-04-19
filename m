Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9113BC20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713550374; cv=none; b=sH0SNDC/58t7BIZ0WQrvI/4g3SxVsINN7rBr6wrU/SEnEbZeahk+KX7Lxek8YNId0oORMZaB3/cD38REAYDontPjSgKfpbO+yRpDC/9wYOmN87+wVvJN+mXN4lx2DI12ynNWFCfinh6AR90xr6VHNqU/7EFYKP0M3e9JOdIDSww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713550374; c=relaxed/simple;
	bh=CULFY2vYqo/U+wmxw/yDnXIc+0mT4HKqdMrK3ArNPw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBr4VZnfSxG/j46EifKhYQs1EZWfxZkn4CwjS1WosMS6QwHzidR2oKxfASF2Q4SGPSIAbvGbJNn7TBcatHsDZ1HZ0p1dN3X60Fto1bdkTLUmR9AkzT1alxnZhe7EOlSLT626NrFe+cd2i5UXt96uIJhCcY8Do/Wne0oeSrgcLOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9ZC76zv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9ZC76zv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713550373; x=1745086373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CULFY2vYqo/U+wmxw/yDnXIc+0mT4HKqdMrK3ArNPw4=;
  b=l9ZC76zvM/6UVIp5C+nPmvVduCLt9FszA72nycT/iGF4Qq1llTVAOhWl
   7qVf2KZCbxQJ51tM50ov5O2+Rzdrx+o08t/VuwA8hkmc1GupjKYaQXPNK
   N7vmP7v2YELQMzWROkQbF7UZMS+cOrRcu0hjtI9VLHwXp/8W6Dti73Xmh
   0OjbvxXBSQUBw7T+1Ln+XrTVGxW1ciaBtMGg7UTcZxyZCN1UeWSvg56AI
   Hp3uJjfhJ1ExqqYEzcgD/FKYknAsOMwCu1w83TMaz18wdtZ4RBy5kdKqe
   ZsOp/60yGpU3PLFR1tLU5/liU5URCerqVV1VhgS9oqU5IJoBh2D9S/1Ba
   A==;
X-CSE-ConnectionGUID: fK6h7xAOQK++jNNv8jsRQw==
X-CSE-MsgGUID: wYnrSY3VT2urh2AhDogQlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9088748"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9088748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 11:12:53 -0700
X-CSE-ConnectionGUID: n+k3c3r3S+629qoCdux9Yg==
X-CSE-MsgGUID: tbHWjNqVR1OuYy/XohFPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23847915"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Apr 2024 11:12:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxsj3-000ANc-02;
	Fri, 19 Apr 2024 18:12:44 +0000
Date: Sat, 20 Apr 2024 02:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vivek-drm-tip:border_prop_3 4/4]
 include/asm-generic/div64.h:234:32: error: right shift count >= width of
 type
Message-ID: <202404200225.7QC0CdcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git border_prop_3
head:   4af3e80cd900fae4374a21cdaa368884ed90dd65
commit: 4af3e80cd900fae4374a21cdaa368884ed90dd65 [4/4] drm/i915: Ensure that the pixel rate is adjusted when border is enabled
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240420/202404200225.7QC0CdcL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200225.7QC0CdcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200225.7QC0CdcL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/microblaze/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_connector.c:26:
   drivers/gpu/drm/i915/display/intel_connector.c: In function 'intel_connector_apply_border':
   include/asm-generic/div64.h:222:35: error: comparison of distinct pointer types lacks a cast [-Werror]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpu/drm/i915/display/intel_connector.c:247:9: note: in expansion of macro 'do_div'
     247 |         do_div(sx, width);
         |         ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12:
>> include/asm-generic/div64.h:234:32: error: right shift count >= width of type [-Werror=shift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/gpu/drm/i915/display/intel_connector.c:247:9: note: in expansion of macro 'do_div'
     247 |         do_div(sx, width);
         |         ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    int *
   drivers/gpu/drm/i915/display/intel_connector.c:247:9: note: in expansion of macro 'do_div'
     247 |         do_div(sx, width);
         |         ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:222:35: error: comparison of distinct pointer types lacks a cast [-Werror]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpu/drm/i915/display/intel_connector.c:248:9: note: in expansion of macro 'do_div'
     248 |         do_div(sy, height);
         |         ^~~~~~
>> include/asm-generic/div64.h:234:32: error: right shift count >= width of type [-Werror=shift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/gpu/drm/i915/display/intel_connector.c:248:9: note: in expansion of macro 'do_div'
     248 |         do_div(sy, height);
         |         ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    int *
   drivers/gpu/drm/i915/display/intel_connector.c:248:9: note: in expansion of macro 'do_div'
     248 |         do_div(sy, height);
         |         ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: all warnings being treated as errors


vim +234 include/asm-generic/div64.h

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
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

:::::: The code at line 234 was first introduced by commit
:::::: 911918aa7ef6f868c135505b0015e42072c54682 div64.h: optimize do_div() for power-of-two constant divisors

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nicolas.pitre@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
