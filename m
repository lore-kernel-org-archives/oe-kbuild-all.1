Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50016BE17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741937578; cv=none; b=kyL6HyYRztjr0gKQ9s/TctouAdmkAbudR8ZBvPSt46yDdWWN2eIKBE1vaBkKUR5PTQ7VduesD6nEtnDrPoOC94bkB64dL89Cs+ZxanpEvfuN5zkSong0sXG5/TVO5swVVfrXmwqfkxEbWnaOrhJvH3m9Bm/27CNkbwBSV3cWnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741937578; c=relaxed/simple;
	bh=uUgAbrmwquUfkwFRH/7kYb//cioja4GMRnW1+8rTXYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSO7R+SnnVFHiLGRUxRWrc/ll2tZ4hzAYHexK3Mwwe2Lk2Sr9aX9Q0lAxw8NqFSsUxN58zDZrYW+wHLC50toPORDHyCe6IEkHh5aEq5aMz855H6xaukjEUkbNYGZI2BNxk3kWQdPai/uXyi6Qg1ZMbWF7HSqd0mLR84ZMj2CzPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X85ierfY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X85ierfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741937576; x=1773473576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uUgAbrmwquUfkwFRH/7kYb//cioja4GMRnW1+8rTXYQ=;
  b=X85ierfYrvDJbiv4RzH+Lvsz5HqC4ZSw3xn+BMnB89bcf5pV94oK6C0o
   1jb4OIJu01l8xOJYx46yIT3l2/TwbuKmHqg9kbzv+iEfyuAmYO9tmK0C4
   AQL0Ec7aZFAwd/z9OTllduBFz8EIsZHgaJ7I8EKv3EGsbVRZuDuxWI34q
   MyTFxREkMq/iZB3yPCZQ3mQp4uzvW8WQrBN20ppEfJ197LNfq/RBSXei3
   08cDR5KgfNW3GQGaCSa4Ta6bfYh5Rf/SDAXzr+xmVXuenUk//hB08p9FC
   +U1APeXF0NPqJ0jSAw1X0x1ehHel09kJTfY29N9IbTdvugLj704AJr3ea
   Q==;
X-CSE-ConnectionGUID: OuOF8xVhQXqWIYRdbNkGrA==
X-CSE-MsgGUID: vQHMRrnTTay6BTZy9ttj6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54077739"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54077739"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 00:32:55 -0700
X-CSE-ConnectionGUID: fStKbg2GQle5cMvfTR0+Vg==
X-CSE-MsgGUID: mTKKlJ59RM+45nLh+aU8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="120911441"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Mar 2025 00:32:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tszXH-000ACR-32;
	Fri, 14 Mar 2025 07:32:51 +0000
Date: Fri, 14 Mar 2025 15:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 11/11] nvmet: Add nvmet-mdev-pci driver
Message-ID: <202503141558.D4bsoGmE-lkp@intel.com>
References: <20250313052222.178524-12-michael.christie@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313052222.178524-12-michael.christie@oracle.com>

Hi Mike,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.14-rc6]
[also build test ERROR on linus/master next-20250313]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Christie/nvmet-Remove-duplicate-uuid_copy/20250313-132742
base:   v6.14-rc6
patch link:    https://lore.kernel.org/r/20250313052222.178524-12-michael.christie%40oracle.com
patch subject: [PATCH RFC 11/11] nvmet: Add nvmet-mdev-pci driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250314/202503141558.D4bsoGmE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141558.D4bsoGmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141558.D4bsoGmE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2186,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/nvme/target/mdev-pci/target.c:7:
   drivers/nvme/target/mdev-pci/target.c: In function 'nvmet_mdev_adm_get_features':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/nvme/target/mdev-pci/target.c:186:17: note: in expansion of macro 'do_div'
     186 |                 do_div(irqc->time, 100);
         |                 ^~~~~~
   In file included from include/linux/dev_printk.h:14:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/nvme/target/mdev-pci/target.c:186:17: note: in expansion of macro 'do_div'
     186 |                 do_div(irqc->time, 100);
         |                 ^~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u8 * {aka unsigned char *}
   drivers/nvme/target/mdev-pci/target.c:186:17: note: in expansion of macro 'do_div'
     186 |                 do_div(irqc->time, 100);
         |                 ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u8 *' {aka 'unsigned char *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
--
   In file included from arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2186,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from target.c:7:
   target.c: In function 'nvmet_mdev_adm_get_features':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   target.c:186:17: note: in expansion of macro 'do_div'
     186 |                 do_div(irqc->time, 100);
         |                 ^~~~~~
   In file included from include/linux/dev_printk.h:14:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   target.c:186:17: note: in expansion of macro 'do_div'
     186 |                 do_div(irqc->time, 100);
         |                 ^~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u8 * {aka unsigned char *}
   target.c:186:17: note: in expansion of macro 'do_div'
     186 |                 do_div(irqc->time, 100);
         |                 ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u8 *' {aka 'unsigned char *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~


vim +/__div64_32 +199 include/asm-generic/div64.h

^1da177e4c3f415 Linus Torvalds     2005-04-16  176  
^1da177e4c3f415 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f415 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f415 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f415 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f415 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f415 Linus Torvalds     2005-04-16  183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
c747ce4706190ef Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93f Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93f Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93f Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93f Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93f Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93f Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f86 Nicolas Pitre      2015-11-02 @195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f415 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f415 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190ef Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f415 Linus Torvalds     2005-04-16 @199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190ef Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f415 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f415 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f415 Linus Torvalds     2005-04-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
