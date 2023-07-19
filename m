Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BBA275DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 19:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689796053; x=1721332053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2c0d0jHIvSZTY8CHSfbCMPoLCpU3jrQ4kLu+VZVss4=;
  b=Y61qWWGyPQcXlE+4UP/Qpz167s8sWd+iUZT5bSXO9PkhYrhcO7xJxsMf
   muwYhid7UBMi6ODs1FZn92R4D2o9FyfA1eyTAtc1ggWg0twA3PlhzxWUX
   6G4BNlv3K/B2wksfjNpTt+zgjBAISY7hWvDtKLQ1s6vNjYKO1D433x7ce
   Vmzq4Cnx5EMmU4QOFO0tLEHEUr7aZRU4nMa/JCYpAYSL0ZrHWMBMNhSKB
   GlfPPmhbFBsZQXyZ5q+y2kBAl6kX+eBFFCVtLusoMTo3v7qtsXw7PUuwU
   QSvoSbIiBMePPbgWHXTEJIW6tmQA31PzRt5mgX2Vs03zesqhwETnKHJ9b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356517628"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356517628"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 12:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="701376354"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="701376354"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2023 12:47:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMD8R-0005QL-2D;
	Wed, 19 Jul 2023 19:47:04 +0000
Date: Thu, 20 Jul 2023 03:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 2/14]
 include/asm-generic/bitops/instrumented-lock.h:77:16: error: implicit
 declaration of function 'arch_clear_bit_unlock_is_negative_byte'; did you
 mean 'clear_bit_unlock_is_negative_byte'?
Message-ID: <202307200304.cEaVEm0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   006eb1a68e63a55bcc2cba90f713909316f4eaf1
commit: 6a98655feda6945aa21746113cee72ae49bac9ab [2/14] mm: Delete unused definition of clear_bit_unlock_is_negative_byte()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200304.cEaVEm0s-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200304.cEaVEm0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200304.cEaVEm0s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/bitops.h:333,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   include/asm-generic/bitops/instrumented-lock.h: In function 'clear_bit_unlock_is_negative_byte':
>> include/asm-generic/bitops/instrumented-lock.h:77:16: error: implicit declaration of function 'arch_clear_bit_unlock_is_negative_byte'; did you mean 'clear_bit_unlock_is_negative_byte'? [-Werror=implicit-function-declaration]
      77 |         return arch_clear_bit_unlock_is_negative_byte(nr, addr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                clear_bit_unlock_is_negative_byte
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +77 include/asm-generic/bitops/instrumented-lock.h

81d2c6f81996e0 Daniel Axtens 2019-08-20  60  
81d2c6f81996e0 Daniel Axtens 2019-08-20  61  /**
81d2c6f81996e0 Daniel Axtens 2019-08-20  62   * clear_bit_unlock_is_negative_byte - Clear a bit in memory and test if bottom
81d2c6f81996e0 Daniel Axtens 2019-08-20  63   *                                     byte is negative, for unlock.
81d2c6f81996e0 Daniel Axtens 2019-08-20  64   * @nr: the bit to clear
81d2c6f81996e0 Daniel Axtens 2019-08-20  65   * @addr: the address to start counting from
81d2c6f81996e0 Daniel Axtens 2019-08-20  66   *
81d2c6f81996e0 Daniel Axtens 2019-08-20  67   * This operation is atomic and provides release barrier semantics.
81d2c6f81996e0 Daniel Axtens 2019-08-20  68   *
81d2c6f81996e0 Daniel Axtens 2019-08-20  69   * This is a bit of a one-trick-pony for the filemap code, which clears
81d2c6f81996e0 Daniel Axtens 2019-08-20  70   * PG_locked and tests PG_waiters,
81d2c6f81996e0 Daniel Axtens 2019-08-20  71   */
81d2c6f81996e0 Daniel Axtens 2019-08-20  72  static inline bool
81d2c6f81996e0 Daniel Axtens 2019-08-20  73  clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
81d2c6f81996e0 Daniel Axtens 2019-08-20  74  {
04def1b9b4a3d2 Marco Elver   2021-11-30  75  	kcsan_release();
27f937cc810aef Marco Elver   2020-01-21  76  	instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
81d2c6f81996e0 Daniel Axtens 2019-08-20 @77  	return arch_clear_bit_unlock_is_negative_byte(nr, addr);

:::::: The code at line 77 was first introduced by commit
:::::: 81d2c6f81996e01fbcd2b5aeefbb519e21c806e9 kasan: support instrumented bitops combined with generic bitops

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
