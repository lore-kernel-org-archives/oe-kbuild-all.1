Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC902A944
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682460964; x=1713996964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2mIKsN6ta0oZfJB8DeHtp4xPsVIjy3wrSRkFP09CEI=;
  b=AbEsp+kvRgNa608b6rXk0rgZqyED58utsYorZFT7LGu34MeJkUuQq0Oc
   7/lxtfXPeNrLcq2NEN8yg7qhPP0GuYAHVCUcIw6QOA0l3I4Hpkr/4u1Bv
   xMRdIVAyr8ANjuHyDnL3jnMimx7WTGXNTgpamNDpg348mIL+cP2c07wE5
   xqsU5kr+izF7m3Z3bT+A6zGl3TghMnzo1zQvDbBARMydkKaxWtlQj2EhI
   MnybsTdYdU07Dd0LPxPzWDqhaGJdBKRF1WmIc4B6wsbO2AirVZ/+kUVdj
   Dk4qCNd8FFXU6HnqPxa1sIJO5g4shgPaqnlq5aAKH3mpu1yJ47CUd3NLn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="409881657"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="409881657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 15:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="671104484"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="671104484"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Apr 2023 15:16:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prQx7-000joe-39;
	Tue, 25 Apr 2023 22:16:01 +0000
Date: Wed, 26 Apr 2023 06:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 175/344]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing
 129 or more bytes at offsets 984 and 856 overlaps 1 or more bytes at offset
 984
Message-ID: <202304260650.NkTcV8JQ-lkp@intel.com>
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
commit: c12cef17707511b04ff15821075ddafe0b7d870b [175/344] fixup! experimental: make armv6 build together with armv5
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230426/202304260650.NkTcV8JQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=c12cef17707511b04ff15821075ddafe0b7d870b
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.3-next
        git checkout c12cef17707511b04ff15821075ddafe0b7d870b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/crypto/bcm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260650.NkTcV8JQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/crypto/bcm/cipher.c:7:
   drivers/crypto/bcm/cipher.c: In function 'ahash_hmac_setkey':
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing 129 or more bytes at offsets 984 and 856 overlaps 1 or more bytes at offset 984 [-Wrestrict]
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
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing 129 or more bytes at offsets 984 and 856 overlaps 1 or more bytes at offset 984 [-Wrestrict]
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

78a498c3a227f2a Alexander Potapenko 2022-10-24  46  
78a498c3a227f2a Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2a Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2a Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2a Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2a Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2a Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2a Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2a Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2a Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2a Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf23 Francis Laniel      2021-02-25 @57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf23 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf23 Francis Laniel      2021-02-25  59  #define __underlying_memset	__builtin_memset
78a498c3a227f2a Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2a Alexander Potapenko 2022-10-24  61  

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
