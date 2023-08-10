Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438EA1DDFE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691658487; x=1723194487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3I4fF4+m8KNhvZPiICpol2xoJPapTFE0w6+CVV0Ap4=;
  b=f9wkR/iuCw8EtaADPm89ayGMd4YR0CsoUI9CS1klhxPdGiBOR+KL92SS
   ErYNYsvFFLi4/Jr3WbYZAZkB52cnl98e9J9CnoZGGZ2GISAeehXLU1WLA
   /O52uJ3d3EAWF6Jxe+vsfc11MWZT4+q8LxGs2BnHAkOJtIiIU6LrEMNNv
   3CRsNMzbtbUMNRq+kD/fgoaeHH22hYsLmhpg40CZdRYLJztd2vsStJhm+
   4R6UY/FGZ8Q2D6ekaNRUbhRbA79IqbgiTOb91p8CMsIIzHeDanpPU6X30
   yLnkQUGuUgg+dA+ThbSczFgTClWqlpn5AbyJgQnhmyKmpk1FxGo+Dp6PQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375062528"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="375062528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 02:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905975131"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="905975131"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Aug 2023 02:08:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU1eG-0006sq-1H;
	Thu, 10 Aug 2023 09:08:04 +0000
Date: Thu, 10 Aug 2023 17:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2]
 include/linux/kfence.h:58:54: error: invalid operands to binary - (have
 'char *' and 'void *')
Message-ID: <202308101738.P7GDtKOH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   709c5a98b878015dc4f8838fca1c0194b42dee86
commit: 709c5a98b878015dc4f8838fca1c0194b42dee86 [2/2] kfence: Use a void * for page pool
config: arm-randconfig-r046-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101738.P7GDtKOH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101738.P7GDtKOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101738.P7GDtKOH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from init/main.c:17:
   include/linux/kfence.h: In function 'is_kfence_address':
>> include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/linux/kfence.h:58:16: note: in expansion of macro 'unlikely'
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                ^~~~~~~~
>> include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/linux/kfence.h:58:16: note: in expansion of macro 'unlikely'
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                ^~~~~~~~
--
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from mm/kfence/kfence_test.c:14:
   include/linux/kfence.h: In function 'is_kfence_address':
>> include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/linux/kfence.h:58:16: note: in expansion of macro 'unlikely'
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                ^~~~~~~~
>> include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/linux/kfence.h:58:16: note: in expansion of macro 'unlikely'
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                ^~~~~~~~
   mm/kfence/kfence_test.c: In function 'test_invalid_access':
>> mm/kfence/kfence_test.c:644:39: warning: dereferencing 'void *' pointer
     644 |                 .addr = &__kfence_pool[10],
         |                                       ^
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246:
   mm/kfence/kfence_test.c:648:32: warning: dereferencing 'void *' pointer
     648 |         READ_ONCE(__kfence_pool[10]);
         |                                ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/kfence/kfence_test.c:648:9: note: in expansion of macro 'READ_ONCE'
     648 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~
>> include/asm-generic/rwonce.h:44:26: warning: dereferencing 'void *' pointer
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/kfence/kfence_test.c:648:9: note: in expansion of macro 'READ_ONCE'
     648 |         READ_ONCE(__kfence_pool[10]);
         |         ^~~~~~~~~
--
   In file included from arch/arm/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from mm/kfence/core.c:10:
   include/linux/kfence.h: In function 'is_kfence_address':
>> include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/linux/kfence.h:58:16: note: in expansion of macro 'unlikely'
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                ^~~~~~~~
>> include/linux/kfence.h:58:54: error: invalid operands to binary - (have 'char *' and 'void *')
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                                         ~~~~~~~~~~~~ ^
         |                                         |
         |                                         char *
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/linux/kfence.h:58:16: note: in expansion of macro 'unlikely'
      58 |         return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
         |                ^~~~~~~~
   mm/kfence/core.c: In function 'metadata_to_pageaddr':
   mm/kfence/core.c:245:63: warning: dereferencing 'void *' pointer
     245 |         unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
         |                                                               ^


vim +58 include/linux/kfence.h

0ce20dd840897b Alexander Potapenko 2021-02-25  32  
0ce20dd840897b Alexander Potapenko 2021-02-25  33  /**
0ce20dd840897b Alexander Potapenko 2021-02-25  34   * is_kfence_address() - check if an address belongs to KFENCE pool
0ce20dd840897b Alexander Potapenko 2021-02-25  35   * @addr: address to check
0ce20dd840897b Alexander Potapenko 2021-02-25  36   *
0ce20dd840897b Alexander Potapenko 2021-02-25  37   * Return: true or false depending on whether the address is within the KFENCE
0ce20dd840897b Alexander Potapenko 2021-02-25  38   * object range.
0ce20dd840897b Alexander Potapenko 2021-02-25  39   *
0ce20dd840897b Alexander Potapenko 2021-02-25  40   * KFENCE objects live in a separate page range and are not to be intermixed
0ce20dd840897b Alexander Potapenko 2021-02-25  41   * with regular heap objects (e.g. KFENCE objects must never be added to the
0ce20dd840897b Alexander Potapenko 2021-02-25  42   * allocator freelists). Failing to do so may and will result in heap
0ce20dd840897b Alexander Potapenko 2021-02-25  43   * corruptions, therefore is_kfence_address() must be used to check whether
0ce20dd840897b Alexander Potapenko 2021-02-25  44   * an object requires specific handling.
0ce20dd840897b Alexander Potapenko 2021-02-25  45   *
0ce20dd840897b Alexander Potapenko 2021-02-25  46   * Note: This function may be used in fast-paths, and is performance critical.
0ce20dd840897b Alexander Potapenko 2021-02-25  47   * Future changes should take this into account; for instance, we want to avoid
0ce20dd840897b Alexander Potapenko 2021-02-25  48   * introducing another load and therefore need to keep KFENCE_POOL_SIZE a
0ce20dd840897b Alexander Potapenko 2021-02-25  49   * constant (until immediate patching support is added to the kernel).
0ce20dd840897b Alexander Potapenko 2021-02-25  50   */
0ce20dd840897b Alexander Potapenko 2021-02-25  51  static __always_inline bool is_kfence_address(const void *addr)
0ce20dd840897b Alexander Potapenko 2021-02-25  52  {
0ce20dd840897b Alexander Potapenko 2021-02-25  53  	/*
a7cb5d23eaea14 Marco Elver         2021-08-19  54  	 * The __kfence_pool != NULL check is required to deal with the case
a7cb5d23eaea14 Marco Elver         2021-08-19  55  	 * where __kfence_pool == NULL && addr < KFENCE_POOL_SIZE. Keep it in
a7cb5d23eaea14 Marco Elver         2021-08-19  56  	 * the slow-path after the range-check!
0ce20dd840897b Alexander Potapenko 2021-02-25  57  	 */
a7cb5d23eaea14 Marco Elver         2021-08-19 @58  	return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
0ce20dd840897b Alexander Potapenko 2021-02-25  59  }
0ce20dd840897b Alexander Potapenko 2021-02-25  60  

:::::: The code at line 58 was first introduced by commit
:::::: a7cb5d23eaea148f8582229846f8dfff192f05c3 kfence: fix is_kfence_address() for addresses below KFENCE_POOL_SIZE

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
