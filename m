Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96254A94E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 22:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682461624; x=1713997624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPt9DihHp51FR114nNjWYM0i4Z2tteBVqUF8c+40828=;
  b=GjpNJmoFjn7QgjAsnnTtijR7su/++w4o53cdQZ7cqPnLXRC4R3qS8VXg
   gFqVFKy4Xug5LRCxS0qBGYqbTHLgiV/N2e0aYXabUCCFpYWf++7RGZ6nU
   hXhS51ocKuWRt8uW0iK8tP+UVO82aWVbsQWtKRzKoRD01kq6PNHwLBClj
   SR/IOGrDcRTTyDB+J4a/TMnBnXyM9M9ZS1mwkEPtpN3Xi2c2tsyrkDH1B
   TSDhG/F5YCtuLi0O2PW+2+GeWZAo5SV9NC5xXxjhXaWREiLb52KfulVfC
   7XQJ3Cf/4AuAQHqLhUMTVRrDy7VaIBHfgScFTKuXQ+Ehb6URkSFWVkYgI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344377661"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="344377661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 15:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758336854"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="758336854"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 15:27:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prR7m-000jou-0X;
	Tue, 25 Apr 2023 22:27:02 +0000
Date: Wed, 26 Apr 2023 06:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 30/344]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing
 between 129 and 4294967295 bytes at offsets 992 and 864 overlaps between 1
 and 4294967167 bytes at offset 992
Message-ID: <202304260658.tZtJWHni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.3-next
head:   ce323d567a17c02081821dde7ef52ff1a966156d
commit: 669fecdfb45e3cc8e9819fe5bce15f963032b49f [30/344] Kbuild: rework warnings
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230426/202304260658.tZtJWHni-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=669fecdfb45e3cc8e9819fe5bce15f963032b49f
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.3-next
        git checkout 669fecdfb45e3cc8e9819fe5bce15f963032b49f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/crypto/bcm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260658.tZtJWHni-lkp@intel.com/

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
