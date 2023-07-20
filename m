Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814041DDE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689895592; x=1721431592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1ozMqn4wItQJOZAfWeQvn9C/SDeHhkgAW07/7MWZEk=;
  b=jdVgwBIhnOQ0PDWtWzZu3Ml7JIqsIc+x3cmch6Shng0JVIwA6hUKxzmG
   aVQuJx8KR1jJVgVLgvfFU117/dbjH2lEnc3RwD2ysf3WVcHft7nj08dBK
   Siud8NVO94rmIrQPtjpzrpp9lZcly1/T27V4YgoB8uWCdXxWjLAqYtFj1
   AxtN3IdBECm9rEY2rp0SIC9uvCMj0OLRPA/NomxvFDbuPEj6+CgeiFokJ
   5wMF72fw7hzdPvqvEQaWfbs+XQr1X0rE6s382pGJcyIQJEoIPEz8fJZPK
   ujNmWNhMDERgP3SMjpnzMlWRfGOw8/u41Nv1eDLIYnqbB9tzIsXcckwup
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346481098"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="346481098"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="794750439"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="794750439"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2023 16:26:30 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMd2O-0006cj-1R;
	Thu, 20 Jul 2023 23:26:26 +0000
Date: Fri, 21 Jul 2023 07:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/19]
 arch/powerpc/include/asm/bitops.h:267:54: error: use of undeclared
 identifier 'nr'
Message-ID: <202307210753.XoJ9mKYD-lkp@intel.com>
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
commit: 07888255bb5f2af47b30757a3aa6a818d53934dc [15/19] bitops: Add change_and_unlock_is_negative_byte()
config: powerpc-randconfig-r015-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210753.XoJ9mKYD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210753.XoJ9mKYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210753.XoJ9mKYD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:68:
>> arch/powerpc/include/asm/bitops.h:267:54: error: use of undeclared identifier 'nr'
     267 |         unsigned long *p = (unsigned long *)addr + BIT_WORD(nr);
         |                                                             ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1 shuffle=2087689166
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2087689166
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2087689166
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2087689166
   make: Target 'prepare' not remade because of errors.


vim +/nr +267 arch/powerpc/include/asm/bitops.h

   255	
   256	/*
   257	 * This is a special function for mm/filemap.c
   258	 * Bit 7 corresponds to PG_waiters.
   259	 */
   260	#define arch_clear_bit_unlock_is_negative_byte(nr, addr)		\
   261		(clear_bit_unlock_return_word(nr, addr) & BIT_MASK(7))
   262	
   263	static inline bool arch_change_and_unlock_is_negative_byte(int change_bit,
   264			int lock_bit, volatile unsigned long *addr)
   265	{
   266		unsigned long old, t;
 > 267		unsigned long *p = (unsigned long *)addr + BIT_WORD(nr);
   268		unsigned long mask = (1 << change_bit) | (1 << lock_bit);
   269	
   270		asm volatile (
   271			PPC_RELEASE_BARRIER
   272		"1:"	PPC_LLARX "%0,0,%3,0\n"
   273			"xor	%1,%0,%2\n"
   274			PPC_STLCX "%1,0,%3\n"
   275			"bne- 1b\n"
   276			: "=&r" (old), "=&r" (t)
   277			: "r" (mask), "r" (p)
   278			: "cc", "memory");
   279	
   280		return (old & BIT_MASK(7)) != 0;
   281	}
   282	#define arch_change_and_unlock_is_negative_byte \
   283		arch_change_and_unlock_is_negative_byte
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
