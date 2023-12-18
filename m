Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12BA1EB48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tl9vdV+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702924359; x=1734460359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0hSh3V5WSjOE5dk4za8eMxZ0q8NBpBNN7LxLWXsHeWc=;
  b=Tl9vdV+Tz4zycHjwmG3xrVn1JhbT8tQARZke+tMHXL4xPQ57FtOvt85Z
   22h3fdxbs0PueRhGis2NzoPPinJuOi7XfI3f2TeOD8D90JggmfF/OUywU
   5HWKYPtPHVho0UaBG5etm4Jn1xLBa3n9To1JcUor903dRdAm9p5TBVX14
   Gtgt3gcaCVAbyOOb5c6s563LxNb6FDdwMHeuiUEPrD6N1YS44CtalbH20
   2uGHs8s8ajR9xY6OJfKxPKNpHMq6m0mXZcZRkitW+Rpx58KbLrPoyxqLK
   211yd8MqtT0d1MMOHQLPKXCO3wBVyHJmHQ/wLjrw0VeTJjROj6l5EZMXg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="8997099"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="8997099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 10:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="846045987"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="846045987"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2023 10:32:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFIPq-0004Qf-1l;
	Mon, 18 Dec 2023 18:32:34 +0000
Date: Tue, 19 Dec 2023 02:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 49/49]
 arch/m68k/include/asm/processor.h:91:9: error: implicit declaration of
 function 'WARN_ON_ONCE'
Message-ID: <202312190235.cEOB3yXc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 0e034194a81f95ba6377786660a88f5403fcbf19 [49/49] Kill sched.h dependency on rcupdate.h
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231219/202312190235.cEOB3yXc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190235.cEOB3yXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190235.cEOB3yXc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:13,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/processor.h: In function 'set_fc':
>> arch/m68k/include/asm/processor.h:91:9: error: implicit declaration of function 'WARN_ON_ONCE' [-Werror=implicit-function-declaration]
      91 |         WARN_ON_ONCE(in_interrupt());
         |         ^~~~~~~~~~~~
>> arch/m68k/include/asm/processor.h:91:22: error: implicit declaration of function 'in_interrupt' [-Werror=implicit-function-declaration]
      91 |         WARN_ON_ONCE(in_interrupt());
         |                      ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/m68k/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/WARN_ON_ONCE +91 arch/m68k/include/asm/processor.h

9fde0348640252 Christoph Hellwig 2021-09-16   83  
9fde0348640252 Christoph Hellwig 2021-09-16   84  #ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
9fde0348640252 Christoph Hellwig 2021-09-16   85  /*
9fde0348640252 Christoph Hellwig 2021-09-16   86   * Set the SFC/DFC registers for special MM operations.  For most normal
9fde0348640252 Christoph Hellwig 2021-09-16   87   * operation these remain set to USER_DATA for the uaccess routines.
9fde0348640252 Christoph Hellwig 2021-09-16   88   */
9fde0348640252 Christoph Hellwig 2021-09-16   89  static inline void set_fc(unsigned long val)
9fde0348640252 Christoph Hellwig 2021-09-16   90  {
9fde0348640252 Christoph Hellwig 2021-09-16  @91  	WARN_ON_ONCE(in_interrupt());
9fde0348640252 Christoph Hellwig 2021-09-16   92  
9fde0348640252 Christoph Hellwig 2021-09-16   93  	__asm__ __volatile__ ("movec %0,%/sfc\n\t"
9fde0348640252 Christoph Hellwig 2021-09-16   94  			      "movec %0,%/dfc\n\t"
9fde0348640252 Christoph Hellwig 2021-09-16   95  			      : /* no outputs */ : "r" (val) : "memory");
9fde0348640252 Christoph Hellwig 2021-09-16   96  }
9fde0348640252 Christoph Hellwig 2021-09-16   97  #else
9fde0348640252 Christoph Hellwig 2021-09-16   98  static inline void set_fc(unsigned long val)
9fde0348640252 Christoph Hellwig 2021-09-16   99  {
9fde0348640252 Christoph Hellwig 2021-09-16  100  }
9fde0348640252 Christoph Hellwig 2021-09-16  101  #endif /* CONFIG_CPU_HAS_ADDRESS_SPACES */
9fde0348640252 Christoph Hellwig 2021-09-16  102  

:::::: The code at line 91 was first introduced by commit
:::::: 9fde0348640252c79d462c4d29a09a14e8741f5c m68k: Remove set_fs()

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
