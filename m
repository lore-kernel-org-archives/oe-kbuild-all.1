Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16169F9CD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693601642; x=1725137642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0cRLekUmVWg+ro4nwPBrrYb3uUdo+NkSZMIGVTKr4tQ=;
  b=H5+AWs3J/5RiklZoTtN3u9KQAhIF/LLZeQtBAoNUywM26xMtMZBVOxqB
   bSUTQYjDZxufM1Daf0858ngCIWfdYFDY8nxHFqX9OpTEGqnO4km0z6X+h
   p4fSXzDIClNwc+F/27r1SoSK4Bp3RQ7OKsHYlM3eAKmkAEdcNOxi7u883
   cQVL0vVHcYtLXoc7EPNiEPhSkeOJdnKdIpewQsOkF/Ja4d8CuD+1rwiVQ
   GtW36A5RiMTi0sMvgBFET9IvzS30osBsG3mCjCpBdJdaKHwQlKV4MduPG
   wdF+jI87mXS5olNEY0uO4yn4fB3xJxjxXZJeixDZgCmPot2mAlQoEyfEG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376233563"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="376233563"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 13:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883321443"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="883321443"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 13:53:55 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcB9L-0001dD-0K;
	Fri, 01 Sep 2023 20:53:51 +0000
Date: Sat, 2 Sep 2023 04:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [masahiroy-kbuild:kbuild 39/61]
 include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' accessing
 129 or more bytes at offsets 328 and 200 overlaps 1 or more bytes at offset
 328
Message-ID: <202309020449.BhSynlbq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   a44a596c5b5b8acce9521c409cc4deb312b71ffc
commit: 26030cb984dd65e0cb2d0c2489d94941cf8897b4 [39/61] extrawarn: move -Wrestrict into W=1 warnings
config: loongarch-randconfig-r013-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020449.BhSynlbq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020449.BhSynlbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020449.BhSynlbq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/atmel-sha.c:34:
   include/crypto/scatterwalk.h: In function 'scatterwalk_pagedone':
   include/crypto/scatterwalk.h:76:30: warning: variable 'page' set but not used [-Wunused-but-set-variable]
      76 |                 struct page *page;
         |                              ^~~~
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
