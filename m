Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A99817F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674990006; x=1706526006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qdQzrQ09WBXOQWZmzWKzTzvTZDl0nopJwO2+AGf5DDs=;
  b=aeS0E2/uBXb3aT3m+d/TzqvTkeFxVjh0YWW5+o3kWvvMryC0+XjelMm+
   rKDvSxfZA6lTRSP13S1MP/7BHDxPqdcbzcgrMJAWEQEX3m+BSiiJmbPKM
   4FBcT7P5AD76vM92erY6NDF1L3YrqsBs/IFEm2q8SePkCFP2HAhpjgOe+
   w4NEYmf9jh6M/YnrEZn180GhsnTXCDzaAoV3DMZg/xwHf/t+c/tujgw8m
   0yfPG75Acu4tNLK/JhsbfxHRITDgwT2/vb0sNmO5TmTysyf+h8b8BBbdF
   dwF0wUt9V30Omn0F7+kRBAjmHcO2svZypycoxI9KfjIpbExb9onqC0ep7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="326056691"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="326056691"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 03:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="665755473"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="665755473"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2023 03:00:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM5Pn-0002jR-1Y;
	Sun, 29 Jan 2023 11:00:03 +0000
Date: Sun, 29 Jan 2023 18:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 44/235]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing
 between 129 and 4294967295 bytes at offsets 992 and 864 overlaps between 1
 and 4294967167 bytes at offset 992
Message-ID: <202301291813.fW1bPrjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.3-next
head:   e1ff6e29c348f48dfcdb7f879d52a823c859a65d
commit: 15964c18d4b03d88e5ade84ca8ee502b30466a1e [44/235] Kbuild: rework warnings
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291813.fW1bPrjt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=15964c18d4b03d88e5ade84ca8ee502b30466a1e
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.3-next
        git checkout 15964c18d4b03d88e5ade84ca8ee502b30466a1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/crypto/bcm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing between 129 and 4294967295 bytes at offsets 992 and 864 overlaps between 1 and 4294967167 bytes at offset 992 [-Wrestrict]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:585:9: note: in expansion of macro '__underlying_memcpy'
     585 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:630:26: note: in expansion of macro '__fortify_memcpy_chk'
     630 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/bcm/cipher.c:2400:17: note: in expansion of macro 'memcpy'
    2400 |                 memcpy(ctx->opad, ctx->ipad, blocksize);
         |                 ^~~~~~
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing between 129 and 4294967295 bytes at offsets 992 and 864 overlaps between 1 and 4294967167 bytes at offset 992 [-Wrestrict]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:585:9: note: in expansion of macro '__underlying_memcpy'
     585 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:630:26: note: in expansion of macro '__fortify_memcpy_chk'
     630 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
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
https://github.com/intel/lkp-tests
