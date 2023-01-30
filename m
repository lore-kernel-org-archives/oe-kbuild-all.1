Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A471378
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675064817; x=1706600817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqF2v/O1Xhh6jSF6H8vG6UnKyo/HgZTkNQsC58mA7ZQ=;
  b=ljBEPPylPNOi08i8k9ZBqf2fFs6auuFr6GJCJ1f9p1QV5q4OE8oMvKWX
   K6pgkbYQaWqxmw6EUVQ+KMre4ZfZYHTyw5apHRtDsndz1jvIfWL87eTad
   eZXfZf/kL4DJUelS2upuiglsG4BZLRWxEx6kl379h1DDfIj04mJO9ZXRj
   6VJ6Nt5SuVNAER6H4p7OcZPGyM1dlYUjkTePhJ+ZPKV28/yNvd7Z3Sp1s
   V94TO7vF96H/KUSFzZ4HvAEc3Gt/NuoNmcMIcqQSQxWuiFUlVFrz1RRxj
   bImi2E5c49crRCeSzx6oiJS7dlhsrvdk6r4v54Hhm9QXF18WEaxNdODCW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="311116501"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="311116501"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 23:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="992804155"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="992804155"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jan 2023 23:46:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMOsQ-0003UE-0k;
	Mon, 30 Jan 2023 07:46:54 +0000
Date: Mon, 30 Jan 2023 15:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:sc8280xp-next-20230127 7/70]
 include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
Message-ID: <202301301545.JOqXYoVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux sc8280xp-next-20230127
head:   f2025fa35c5b0b3ced14ce6890abe904b7e798e1
commit: b4fe61ecf0a9c5c45d8767589f30d49995af93d3 [7/70] power: supply: Introduce Qualcomm PMIC GLINK power supply
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301301545.JOqXYoVX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/b4fe61ecf0a9c5c45d8767589f30d49995af93d3
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev sc8280xp-next-20230127
        git checkout b4fe61ecf0a9c5c45d8767589f30d49995af93d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/auxiliary_bus.h:11,
                    from drivers/power/supply/qcom_battmgr.c:6:
   drivers/power/supply/qcom_battmgr.c: In function 'qcom_battmgr_sm8350_callback':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/power/supply/qcom_battmgr.c:1130:25: note: in expansion of macro 'do_div'
    1130 |                         do_div(battmgr->status.percent, 100);
         |                         ^~~~~~
   In file included from include/linux/dev_printk.h:14:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/power/supply/qcom_battmgr.c:1130:25: note: in expansion of macro 'do_div'
    1130 |                         do_div(battmgr->status.percent, 100);
         |                         ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   drivers/power/supply/qcom_battmgr.c:1130:25: note: in expansion of macro 'do_div'
    1130 |                         do_div(battmgr->status.percent, 100);
         |                         ^~~~~~
   arch/arm/include/asm/div64.h:24:45: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
      24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
         |                                   ~~~~~~~~~~^
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
https://github.com/intel/lkp-tests
