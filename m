Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500E3FF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 04:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691985704; x=1723521704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zo0iXl00WSGKJRHnqvjClbocOt2QaQO2Iij0HDWLOyk=;
  b=KN8d5Hk03jtNdv3vnAIr+j+I6gqz3NfZ2zvPP01UlFiHbb6r+kjRVY/p
   9WnsL0rhDXXuMS1zc5b23z7RC++7rjNoW/zYpVDD+tYhHb+77luenkgBa
   NrHAgS9/V22ptDW+Xm0IM0X0+bFGVSq9gZ3LgcE4edyGfWP6jWlG95np5
   O88ux8kCjD6lDXXP6ajcD28xxcRP78O9NIllFnWdgOPbflqIpUkRevq5Z
   +DjFMLuKIG4diQWsvZ/4g5JDZtLX+zgpiW99fBp8RNQ37LAn14qNmjVeQ
   zh/gasm3+dDxMsatgN1L7IVnq3sGPC2coRk/DC9O9kmPAAsruj//jlGFw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="362106178"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="362106178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 21:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="798679276"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="798679276"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Aug 2023 21:01:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVOlw-0009MG-2U;
	Mon, 14 Aug 2023 04:01:40 +0000
Date: Mon, 14 Aug 2023 12:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:warnings-2 6/9]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing
 between 129 and 4294967295 bytes at offsets 840 and 712 overlaps between 1
 and 4294967167 bytes at offset 840
Message-ID: <202308141108.0VSzo3mv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git warnings-2
head:   5ddc13aed5c9ee03dd6bad7254a5918e6f36f1fa
commit: 153bbd84c28c14469574dda4ba02556f940b08ba [6/9] extrawarn: move -Wrestrict into W=1 warnings
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230814/202308141108.0VSzo3mv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141108.0VSzo3mv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308141108.0VSzo3mv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from drivers/crypto/bcm/cipher.c:7:
   drivers/crypto/bcm/cipher.c: In function 'ahash_hmac_setkey':
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing between 129 and 4294967295 bytes at offsets 840 and 712 overlaps between 1 and 4294967167 bytes at offset 840 [-Wrestrict]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/bcm/cipher.c:2400:17: note: in expansion of macro 'memcpy'
    2400 |                 memcpy(ctx->opad, ctx->ipad, blocksize);
         |                 ^~~~~~
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing between 129 and 4294967295 bytes at offsets 840 and 712 overlaps between 1 and 4294967167 bytes at offset 840 [-Wrestrict]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/bcm/cipher.c:2400:17: note: in expansion of macro 'memcpy'
    2400 |                 memcpy(ctx->opad, ctx->ipad, blocksize);
         |                 ^~~~~~


vim +/__builtin_memcpy +57 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
