Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C41168C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689890646; x=1721426646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A7D3Cg0tVT+1WgbjuVH9eDSxZTdjk78mHz8xPBBLGiY=;
  b=K5+BWMZdrj7+SJX+i3rl6EXMx4vvPFHJJHq9LEBTPnV3EM2RvQERrzsi
   52a9BqNqZluI50DzR9Ii64k3EGBk1hlYyN0/3hIwsHHd2aDRCFJ6O6Zma
   YWvpI2r2LoZyzGYr0q3eKfBHP0HqAQm7fRfJAVk7xsejhSuELDHVsV8JB
   8yPY7LfjP4jDaIBKQG3QmIZe3y8q4lY3R0ERcgqsu/pDYEsAHwBT1k0yk
   W6m5RUPq1gdyxR+Fo3yjsWsKtsC7XeaoImKcOJReU38AuVm63rcsbQQBU
   tqiBY03YEgnVWYr4bXE+6WDhqYmSyTeJVBsegVAOgRf4j5KBSTlXt4EOi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433097070"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="433097070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 15:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718591229"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="718591229"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Jul 2023 15:04:05 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMbkh-0006Yn-30;
	Thu, 20 Jul 2023 22:04:03 +0000
Date: Fri, 21 Jul 2023 06:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/19]
 include/asm-generic/bitops/instrumented-lock.h:97:16: error: implicit
 declaration of function 'arch_change_and_unlock_is_negative_byte'; did you
 mean 'change_and_unlock_is_negative_byte'?
Message-ID: <202307210549.MarHNDOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   98061915c6df5892ff3efa2f04a27857ea36ca51
commit: 6bb72a8aa141cc8d24e20fe5cdaf3170f1c9284a [15/19] bitops: Add change_and_unlock_is_negative_byte()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230721/202307210549.MarHNDOX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210549.MarHNDOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210549.MarHNDOX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/bitops.h:219,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   include/asm-generic/bitops/instrumented-lock.h: In function 'change_and_unlock_is_negative_byte':
>> include/asm-generic/bitops/instrumented-lock.h:97:16: error: implicit declaration of function 'arch_change_and_unlock_is_negative_byte'; did you mean 'change_and_unlock_is_negative_byte'? [-Werror=implicit-function-declaration]
      97 |         return arch_change_and_unlock_is_negative_byte(change_bit, lock_bit,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                change_and_unlock_is_negative_byte
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +97 include/asm-generic/bitops/instrumented-lock.h

    79	
    80	/**
    81	 * change_and_unlock_is_negative_byte - Change two bits in memory and test if
    82	 * bottom byte is negative, for unlock.
    83	 * @change_bit: The bit to change.
    84	 * @lock_bit: The bit to unlock.
    85	 * @addr: The address to start counting from.
    86	 *
    87	 * Used to optimise some folio operations which are commonly paired
    88	 * with an unlock or end of writeback.
    89	 *
    90	 * Return: Whether the PG_waiters flag is set.
    91	 */
    92	static inline bool change_and_unlock_is_negative_byte(unsigned int change_bit,
    93			unsigned int lock_bit, volatile unsigned long *addr)
    94	{
    95		kcsan_release();
    96		instrument_atomic_write(addr + BIT_WORD(change_bit), sizeof(long));
  > 97		return arch_change_and_unlock_is_negative_byte(change_bit, lock_bit,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
