Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB94275B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 19:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689794784; x=1721330784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a50VmRKxklp9yNBiv8qkZyF4up2ckkzuSBCfQilWnKM=;
  b=ezr0MLtkP9l9XqNY47xo+v5YVQ7YVbU+jwpat6JzqyJRLDRE3qXURD67
   +NhqAJxarLc4rd63zbSBEE6Q/t0eRfIsRuWDhPmkyB6jUms6gvjoF+9Br
   ke0WYFq+9gbfq54U6JQYlgcHBaMhNT6xPRVp8BjI80gLpL1Q2DN7C7dP6
   0xJh58ewUGEf/otLUPc1zPNkJ+uwNcS9fwQPxJ496DY22FS/VT3eR2VCN
   Lk8HKY/bnNeD1GctK/qv+9baZonmniAld5jbANWLzZUdHOKdFNWkutsaU
   yw8Y0Buj+RrNqr2tcz7YxBcsJHA0+OGLCbwqgL9fpQDdiPg938rUTj4rO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351418728"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="351418728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 12:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="898022425"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="898022425"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 12:26:22 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMCoT-0005PB-2E;
	Wed, 19 Jul 2023 19:26:18 +0000
Date: Thu, 20 Jul 2023 03:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 10/14]
 include/asm-generic/bitops/instrumented-lock.h:95:9: error: call to
 undeclared function 'arch_set_and_unlock_is_negative_byte'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202307200348.XrYujTsC-lkp@intel.com>
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
commit: 218ea20c953834fa15bdbfa59cb58fb3396c5656 [10/14] bitops: Add set_and_unlock_negative_byte()
config: s390-randconfig-r044-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200348.XrYujTsC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200348.XrYujTsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200348.XrYujTsC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
   In file included from arch/s390/include/asm/bitops.h:206:
   include/asm-generic/bitops/instrumented-lock.h:77:9: error: call to undeclared function 'arch_clear_bit_unlock_is_negative_byte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         return arch_clear_bit_unlock_is_negative_byte(nr, addr);
         |                ^
   include/asm-generic/bitops/instrumented-lock.h:77:9: note: did you mean 'clear_bit_unlock_is_negative_byte'?
   include/asm-generic/bitops/instrumented-lock.h:73:1: note: 'clear_bit_unlock_is_negative_byte' declared here
      73 | clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
         | ^
      74 | {
      75 |         kcsan_release();
      76 |         instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
      77 |         return arch_clear_bit_unlock_is_negative_byte(nr, addr);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                clear_bit_unlock_is_negative_byte
>> include/asm-generic/bitops/instrumented-lock.h:95:9: error: call to undeclared function 'arch_set_and_unlock_is_negative_byte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         return arch_set_and_unlock_is_negative_byte(set_bit, lock_bit, addr);
         |                ^
   include/asm-generic/bitops/instrumented-lock.h:95:9: note: did you mean 'set_and_unlock_is_negative_byte'?
   include/asm-generic/bitops/instrumented-lock.h:90:20: note: 'set_and_unlock_is_negative_byte' declared here
      90 | static inline bool set_and_unlock_is_negative_byte(unsigned int set_bit,
         |                    ^
      91 |                 unsigned int lock_bit, volatile unsigned long *addr)
      92 | {
      93 |         kcsan_release();
      94 |         instrument_atomic_write(addr + BIT_WORD(set_bit), sizeof(long));
      95 |         return arch_set_and_unlock_is_negative_byte(set_bit, lock_bit, addr);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                set_and_unlock_is_negative_byte
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1 shuffle=2261090504
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2261090504
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2261090504
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2261090504
   make: Target 'prepare' not remade because of errors.


vim +/arch_set_and_unlock_is_negative_byte +95 include/asm-generic/bitops/instrumented-lock.h

    60	
    61	/**
    62	 * clear_bit_unlock_is_negative_byte - Clear a bit in memory and test if bottom
    63	 *                                     byte is negative, for unlock.
    64	 * @nr: the bit to clear
    65	 * @addr: the address to start counting from
    66	 *
    67	 * This operation is atomic and provides release barrier semantics.
    68	 *
    69	 * This is a bit of a one-trick-pony for the filemap code, which clears
    70	 * PG_locked and tests PG_waiters,
    71	 */
    72	static inline bool
  > 73	clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
    74	{
    75		kcsan_release();
    76		instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
    77		return arch_clear_bit_unlock_is_negative_byte(nr, addr);
    78	}
    79	
    80	/**
    81	 * set_and_unlock_is_negative_byte - Set a bit in memory and test if bottom
    82	 * byte is negative, for unlock.
    83	 * @set_bit: The bit to set.
    84	 * @lock_bit: The bit which contains the lock.
    85	 * @addr: The address to start counting from.
    86	 *
    87	 * Used to optimise some folio operations which are commonly paired
    88	 * with an unlock or end of writeback.
    89	 */
    90	static inline bool set_and_unlock_is_negative_byte(unsigned int set_bit,
    91			unsigned int lock_bit, volatile unsigned long *addr)
    92	{
    93		kcsan_release();
    94		instrument_atomic_write(addr + BIT_WORD(set_bit), sizeof(long));
  > 95		return arch_set_and_unlock_is_negative_byte(set_bit, lock_bit, addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
