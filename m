Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D647778
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 21:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmBGsyAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701897592; x=1733433592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PCPGwR1dFGtp0qqB2KRIg3xymdsyfscUi8bg6kZkws=;
  b=QmBGsyAy2onT/Q6zYAioWkAdDNORBvlW4K2/BvRwal04QSj7WFbqT7xt
   bUXx9Vem/hHmwRWx8ifDSUI/9Q+Pwg/olOFvrXfuaMyvA0lWrfpGij6VJ
   OPXIM97XKc8X+1sqg3uSkdqJn7y7lVhuyjBrZPCrXGG/SmcDK2owjADlw
   AlXPEFcsXpJo6G/QyVyB3udlXMBIelVV/dGIr6RZdLis1/tmtInM2mm5O
   yco0lNEGDXu3HKhI9ye1JOX3pOkp84qkzMZKZ6l79oChw9+HuGxAWDbk1
   ZXOr3Ei+IHc7NRrCAi0L4AHkbOZgsPgLFw2ITztgV3UjE/q4UA6Jp2ipD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1000695"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1000695"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 13:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747733388"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="747733388"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2023 13:19:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAzJ3-000BRO-0Z;
	Wed, 06 Dec 2023 21:19:45 +0000
Date: Thu, 7 Dec 2023 05:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 2/8] include/linux/pgtable.h:302:21: error:
 'pgdp_get' declared as function returning an array
Message-ID: <202312070508.3uchfcp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   f95bc0e118cb852a3419f92be510be7356688632
commit: b9f2de9b90f016ce08fdaa3cba88a806dcbfd604 [2/8] mm: Introduce pudp/p4dp/pgdp_get() functions
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312070508.3uchfcp2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070508.3uchfcp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070508.3uchfcp2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:302:21: error: 'pgdp_get' declared as function returning an array
     302 | static inline pgd_t pgdp_get(pgd_t *pgdp)
         |                     ^~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from arch/arm/kernel/asm-offsets.c:10:
   include/linux/pgtable.h: In function 'pgdp_get':
>> include/asm-generic/rwonce.h:48:2: warning: returning 'const volatile pmdval_t *' {aka 'const volatile unsigned int *'} from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
      48 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   include/linux/pgtable.h:304:16: note: in expansion of macro 'READ_ONCE'
     304 |         return READ_ONCE(*pgdp);
         |                ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pgdp_get +302 include/linux/pgtable.h

   300	
   301	#ifndef pgdp_get
 > 302	static inline pgd_t pgdp_get(pgd_t *pgdp)
   303	{
   304		return READ_ONCE(*pgdp);
   305	}
   306	#endif
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
