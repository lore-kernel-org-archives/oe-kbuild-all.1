Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83220B17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695495841; x=1727031841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAn2HSHmdcDUitjDq01mkiX0mbMW1X0gI9qrSLR11Tw=;
  b=ApWYzloDP9iUf3BWRozjw9YkNlLJdJTO9fFhDhD9U6NJdp3urs5WVLQK
   DaqsGOGF0VVZHfnC/e3gIMQt93IlYa34zhxuNoYOXdWo6MSbjZ1xc+I9u
   S6NEGnnOXJofnLh02+ij09bh3vSRFw9Q4kiwv4sm1bvKxIXZyHrHkyddo
   nZs/tFe/8Ft5MDGL+PbijYEh7Iyeuqx2HsQ5vi5bYKXH8ed8OV4YcSqVp
   qi43+g6ZTN/dTWxCdRUuHScoDcI8vQzJv9Cat7irMLn0LBhIjUaCXR3l7
   6eAOps6z7HOLY+XBf6wOnhN//mnzcVpKkSI58yzjcYGG21fqNBtIyeQKD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="411980005"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="411980005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 12:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="751212204"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="751212204"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2023 12:03:58 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk7v2-0002kf-2m;
	Sat, 23 Sep 2023 19:03:56 +0000
Date: Sun, 24 Sep 2023 03:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2]
 include/linux/kfence.h:58:54: error: invalid operands to binary - (have
 'char *' and 'void *')
Message-ID: <202309240243.uZO6geuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   b086f69b6ffadeb19959f05bd67cc5d196a78558
commit: b086f69b6ffadeb19959f05bd67cc5d196a78558 [2/2] kfence: Use a void * for page pool
config: powerpc64-randconfig-001-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240243.uZO6geuW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240243.uZO6geuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240243.uZO6geuW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from mm/kmemleak.c:63:
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
   In file included from arch/powerpc/include/asm/cmpxchg.h:6,
                    from arch/powerpc/include/asm/atomic.h:11,
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
   mm/kfence/core.c:253:63: warning: dereferencing 'void *' pointer
     253 |         unsigned long pageaddr = (unsigned long)&__kfence_pool[offset];
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
