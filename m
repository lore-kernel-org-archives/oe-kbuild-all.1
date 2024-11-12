Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804B620E013
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404235; cv=none; b=Aqh+JjX4lpeOgm/THQ3hvfH46AHo+R81e/oFYAWhSAB1x2VSwyXeUUWSWN9LYGwYl4Szu8pf+6DhcYKr2npnt+u9c9i817Kn/yeUVVqjV4/y399S1l4V+M9zN9mYWIjmr3iD/e0s0dailvOo43j8SP6RJDzGdDsh+di0YkiZvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404235; c=relaxed/simple;
	bh=sa9o6tJLuPEt4doSHckjMjO+65m1SV01OWp1P2w3aW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVz9fAWki3EgQR8JO00tfnWuPMUt+MFQ1aD1f5y/AdK3ZhDz5/PUrXrE1Bs2pT9UmJyzMGdGTRx7gAiloWse42iaVtpBF3OapONQCAlfhlE2Dt0/wuHH6Eml+kjRgt4xmFA8G2lUs0kWs/s146hf9RxSH5ldFZLWWz5T7tHMB/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFKqPlg5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFKqPlg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731404233; x=1762940233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sa9o6tJLuPEt4doSHckjMjO+65m1SV01OWp1P2w3aW4=;
  b=cFKqPlg5hQen9rDZnqrYPA/kkRWEQz5XNki1GgzypBnK8w8sMQDD9qcu
   gCQmHA8+k6sTQou6ahAjTsXZGfduE2jlUo43I5SLXeWimFwzsac2V7DWH
   Qdza7XGQzlRuZ/jSsDQvJaQ54oELHW1c8tJIRlBo6FzF4i/g3kn0thnl1
   56vfnH54v1J3MKR+JIw/y/gbdHCw1/a17lUNymkXCTHkDjbRRVmbKgeKi
   MS2/AbT6Oxx5s4WKC9qbDh97scqIxrqWJuuwqFvtUAz2ZPYhIfT5TOdD5
   3rPUVUs85l23RCMCWlYNDWtxWDbDxmx2YZSVJz7pAfqLocebbPqAX8Wj2
   A==;
X-CSE-ConnectionGUID: XTr22w7ARXumkJ9Pp/YlHw==
X-CSE-MsgGUID: tZaf4uEjS2CPwNWYA9uzUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31324310"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31324310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:37:11 -0800
X-CSE-ConnectionGUID: T4p8b4V4QAKl0jAGQaorIg==
X-CSE-MsgGUID: q7Kel42VRcGmmOcxnFcM1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87726525"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 01:37:11 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnKd-0000fn-2G;
	Tue, 12 Nov 2024 09:37:07 +0000
Date: Tue, 12 Nov 2024 17:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: John Ousterhout <ouster@cs.stanford.edu>, netdev@vger.kernel.org,
	linux-api@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, John Ousterhout <ouster@cs.stanford.edu>
Subject: Re: [PATCH net-next v2 12/12] net: homa: create Makefile and Kconfig
Message-ID: <202411121722.Oxq727h0-lkp@intel.com>
References: <20241111234006.5942-13-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111234006.5942-13-ouster@cs.stanford.edu>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20241112-074535
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241111234006.5942-13-ouster%40cs.stanford.edu
patch subject: [PATCH net-next v2 12/12] net: homa: create Makefile and Kconfig
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411121722.Oxq727h0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121722.Oxq727h0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121722.Oxq727h0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/div64.h:89,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/audit.h:12,
                    from net/homa/homa_impl.h:12,
                    from net/homa/homa_outgoing.c:7:
   net/homa/homa_outgoing.c: In function 'homa_new_data_packet':
>> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   net/homa/homa_outgoing.c:108:9: note: in expansion of macro 'do_div'
     108 |         do_div(segs, max_seg_data);
         |         ^~~~~~
   In file included from arch/mips/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from net/homa/homa_impl.h:10:
>> include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   net/homa/homa_outgoing.c:108:9: note: in expansion of macro 'do_div'
     108 |         do_div(segs, max_seg_data);
         |         ^~~~~~
   net/homa/homa_outgoing.c: In function 'homa_message_out_fill':
>> include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   net/homa/homa_outgoing.c:233:9: note: in expansion of macro 'do_div'
     233 |         do_div(segs_per_gso, max_seg_data);
         |         ^~~~~~
>> include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   net/homa/homa_outgoing.c:233:9: note: in expansion of macro 'do_div'
     233 |         do_div(segs_per_gso, max_seg_data);
         |         ^~~~~~


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
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
