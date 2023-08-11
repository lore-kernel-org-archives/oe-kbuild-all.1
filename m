Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E721172E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691775472; x=1723311472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3FACl0W0oyN1VTvZstO+JylFARee/EehrmffTEUf/I=;
  b=n5ADTDsNAADDTYHalvennv+t93MtG4rbzBnJB8VoDWbtaKUQYwB4oHM8
   w0t7t2OrxqtKfitIHtjehv9o2rwjRf1mRyIWv/bN1Vc8wpLQUZYpLBK27
   wo36OfO2zuSVNjgkLAexTM8GksqRUzUJFYaHkxxkziUWPRjsrtLPmIXO/
   DUEZplCb1XwzLeHB3WSUM6qA8hctxWg8NaArrKBcKmPPGB5398bWHLmxl
   r/sgP6na3uQunuLEU4r3ny9S5b7AN0ZJYg7B9HiDpab+OyFvvXdTwc8b8
   rFwn5UcnPqzPCNm2buhKJCKiMZyG1DxXAvSubUXvIA1paKVJMAv7A3Fg+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="458098729"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="458098729"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 10:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726328255"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="726328255"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 10:37:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUW54-0007ui-0P;
	Fri, 11 Aug 2023 17:37:46 +0000
Date: Sat, 12 Aug 2023 01:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:warnings-2 6/9]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing
 129 or more bytes at offsets 328 and 200 overlaps 1 or more bytes at offset
 328
Message-ID: <202308120136.v1r8VXwX-lkp@intel.com>
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
config: um-randconfig-r031-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120136.v1r8VXwX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120136.v1r8VXwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120136.v1r8VXwX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/crypto/atmel-sha.c:15:
   drivers/crypto/atmel-sha.c: In function 'atmel_sha_hmac_compute_ipad_hash':
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing 129 or more bytes at offsets 328 and 200 overlaps 1 or more bytes at offset 328 [-Wrestrict]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1773:9: note: in expansion of macro 'memcpy'
    1773 |         memcpy(hmac->opad, hmac->ipad, bs);
         |         ^~~~~~
>> include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing 129 or more bytes at offsets 328 and 200 overlaps 1 or more bytes at offset 328 [-Wrestrict]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/atmel-sha.c:1773:9: note: in expansion of macro 'memcpy'
    1773 |         memcpy(hmac->opad, hmac->ipad, bs);
         |         ^~~~~~


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
