Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84307F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 02:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689906963; x=1721442963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNn2OwYVCO5D1zLu21K23hjdsdmYRpMfN7L+X8HC3j4=;
  b=fekJwf6AcyXB15Ic2VWfBud0q/e6y93slF7mUYUd8T/TQ0OTfDQ87Uxd
   CmCxn5PmXMMIoo5pIJR4FywUkLzXDKJXi66WljiKDTmA5zNG+9YfxYzi+
   rSSyo1CP1Nbh7QZbjkZQ8m0ST+mSgRd8PqQW31F5BJNsvFWZdOpO23shU
   /oPD4BDWLLCvLizbzFII0WE0k/yThrpDYkkntG4xcVa+glxxVmzaSKay9
   z91JzyD6TKPRO1MlZ2psSjaTaWKiXUZTyBcbzsKOpR9GRkWOtPyTI4qQe
   5wYWcJftPEhXtttyzsOSAeec8Hdzh4kCQaffHzsVQiUyqbzCRY+DVBxUU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="366956528"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="366956528"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 19:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="759791445"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="759791445"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Jul 2023 19:36:01 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMfyS-0006lx-0A;
	Fri, 21 Jul 2023 02:35:02 +0000
Date: Fri, 21 Jul 2023 10:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/19]
 arch/alpha/include/asm/bitops.h:315:33: error: 'nr' undeclared
Message-ID: <202307211029.TtjwANfr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   35ffa765605bc8156660ed51b97fa97f21d88aba
commit: bcf25031ae39ec676a85a99bf0cacdefde781901 [15/19] bitops: Add change_and_unlock_is_negative_byte()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230721/202307211029.TtjwANfr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211029.TtjwANfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211029.TtjwANfr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/alpha/include/asm/bitops.h: In function 'change_and_unlock_is_negative_byte':
>> arch/alpha/include/asm/bitops.h:315:33: error: 'nr' undeclared (first use in this function)
     315 |         int *m = ((int *) p) + (nr >> 5);
         |                                 ^~
   arch/alpha/include/asm/bitops.h:315:33: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/nr +315 arch/alpha/include/asm/bitops.h

   309	
   310	static inline bool change_and_unlock_is_negative_byte(int change_bit,
   311			int lock_bit, volatile unsigned long *p)
   312	{
   313		unsigned long temp, old;
   314		unsigned long mask = (1 << change_bit) | (1 << lock_bit);
 > 315		int *m = ((int *) p) + (nr >> 5);
   316	
   317		__asm__ __volatile__(
   318		"1:	ldl_l %0,%4\n"
   319		"	xor %0,%3,%0\n"
   320		"	xor %0,%3,%2\n"
   321		"	stl_c %0,%1\n"
   322		"	beq %0,2f\n"
   323		".subsection 2\n"
   324		"2:	br 1b\n"
   325		".previous"
   326		:"=&r" (temp), "=m" (*m), "=&r" (old)
   327		:"Ir" (mask), "m" (*m));
   328	
   329		return (old & BIT(7)) != 0;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
