Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1112B82
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686232620; x=1717768620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFWsWflssLCuWwg/KB2Yviln5Rp6cf8v7tKuGadqoG4=;
  b=M63lylMV0KXGIPWr9bYYSb/OkrIXcj86wsT74NkVJz1Gp052g1HPPRui
   1iHvg9n69EHzSQ1im7b44FQDXw8/fqRPxxtvqqOkm57tioE4j+SDHS5rh
   O3wWmXs1G9+0NJMwMLe6ZEn0aG9f5AUqPrrCODeNMBb6Xkf+ZZkqON2qV
   JCP1vDaXcaymZ3zSb7EEOJQN1QMC6eOmn+WIp/AWDy00nCZusqf/aR0z+
   KfuqPdzc0PsFY7BYW1uZsCR0h3c16eNogFx3+BtH4Dxda9A8g7vxcAwNO
   I92omyHrbGfqW+iPfBtVKV2H9LkV6uRsM1QxT9N3XC+zP30QRCVuPEluq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="423171726"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="423171726"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 06:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="956703639"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="956703639"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 06:25:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7FdX-0007p2-1s;
	Thu, 08 Jun 2023 13:25:11 +0000
Date: Thu, 8 Jun 2023 21:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230607-dev-cache 1/11]
 include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy' output
 truncated copying 31 bytes from a string of length 43
Message-ID: <202306082107.vq3X5V6E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230607-dev-cache
head:   32d68d566848788d1299eddf2eec0322788deb7a
commit: 32d555fe536d3a751e5813915cf3bdcfe863cc9a [1/11] fs: unexport buffer_check_dirty_writeback
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306082107.vq3X5V6E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=32d555fe536d3a751e5813915cf3bdcfe863cc9a
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-20230607-dev-cache
        git checkout 32d555fe536d3a751e5813915cf3bdcfe863cc9a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/pensando/ionic/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306082107.vq3X5V6E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/paravirt.h:17,
                    from arch/x86/include/asm/cpuid.h:62,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/net/ethernet/pensando/ionic/ionic_main.c:6:
   In function 'strncpy',
       inlined from 'ionic_identify' at drivers/net/ethernet/pensando/ionic/ionic_main.c:557:2:
>> include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy' output truncated copying 31 bytes from a string of length 43 [-Wstringop-truncation]
      68 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:151:16: note: in expansion of macro '__underlying_strncpy'
     151 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~


vim +/__builtin_strncpy +68 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24  63  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25  65  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25 @68  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
a28a6e860c6cf2 Francis Laniel      2021-02-25  70  

:::::: The code at line 68 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
