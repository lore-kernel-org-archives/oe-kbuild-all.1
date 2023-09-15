Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592061805C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694810611; x=1726346611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18dz03K1cAItjEKem7F0jRTTAN1G5rxKaRlf9jhGURc=;
  b=ZLVZarRkHGxE0aYyEIJpPvV0wsI1fyL/atl8Ofrjtmkq2MPAJuyqnwgy
   QnggiaTI0NCzLo3QhoBG9c4jj092Q+BxH2KVGb/keZSLw7Bny/7vh+1ju
   6yEbGOBrwr8/M7FwnZxyZiPB0O/5JFjysNtLlD9Q8Zu3PzVTivYcQ7OJE
   FLifbBMvO7QT7sg7AxDx4KRETNjekk+2aVUWZ8wmcLzoO2GgEMuz0fWIn
   QrEgeEbjU0r5exUhSAtkCToEDXx8xtOpfCFf/uS5QjmGV4oPGE6qClaVN
   6ZZu6zdKUcHupKecUU33t3aprYiYE8962FIy56HiZ9zEbx0ikfro1JEP4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359587488"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="359587488"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 13:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="991992077"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="991992077"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2023 13:43:28 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhFer-0003Ps-1p;
	Fri, 15 Sep 2023 20:43:25 +0000
Date: Sat, 16 Sep 2023 04:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: include/linux/kasan-checks.h:38:27: warning: 'space_args' may be
 used uninitialized
Message-ID: <202309160440.jECtzdr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9fdfb15a3dbf818e06be514f4abbfc071004cbe7
commit: 5aa4ac64e6add3e40d5049e31275b2822daf885d LoongArch: Add KASAN (Kernel Address Sanitizer) support
date:   9 days ago
config: loongarch-randconfig-002-20230916 (https://download.01.org/0day-ci/archive/20230916/202309160440.jECtzdr6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160440.jECtzdr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160440.jECtzdr6-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:26,
                    from ./arch/loongarch/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from fs/btrfs/ioctl.c:6:
   In function 'instrument_copy_from_user_before',
       inlined from '_copy_from_user' at include/linux/uaccess.h:148:3,
       inlined from 'copy_from_user' at include/linux/uaccess.h:183:7,
       inlined from 'btrfs_ioctl_space_info' at fs/btrfs/ioctl.c:2993:6:
>> include/linux/kasan-checks.h:38:27: warning: 'space_args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
   include/linux/instrumented.h:129:9: note: in expansion of macro 'kasan_check_write'
     129 |         kasan_check_write(to, n);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_space_info':
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2975:39: note: 'space_args' declared here
    2975 |         struct btrfs_ioctl_space_args space_args;
         |                                       ^~~~~~~~~~


vim +/space_args +38 include/linux/kasan-checks.h

7d8ad890dad00f Marco Elver     2019-07-11  31  
7d8ad890dad00f Marco Elver     2019-07-11  32  /*
7d8ad890dad00f Marco Elver     2019-07-11  33   * kasan_check_*: Only available when the particular compilation unit has KASAN
7d8ad890dad00f Marco Elver     2019-07-11  34   * instrumentation enabled. May be used in header files.
7d8ad890dad00f Marco Elver     2019-07-11  35   */
7d8ad890dad00f Marco Elver     2019-07-11  36  #ifdef __SANITIZE_ADDRESS__
7d8ad890dad00f Marco Elver     2019-07-11  37  #define kasan_check_read __kasan_check_read
7d8ad890dad00f Marco Elver     2019-07-11 @38  #define kasan_check_write __kasan_check_write
64f8ebaf115bcd Andrey Ryabinin 2016-05-20  39  #else
b5f6e0fc7d60e0 Marco Elver     2019-07-11  40  static inline bool kasan_check_read(const volatile void *p, unsigned int size)
b5f6e0fc7d60e0 Marco Elver     2019-07-11  41  {
b5f6e0fc7d60e0 Marco Elver     2019-07-11  42  	return true;
b5f6e0fc7d60e0 Marco Elver     2019-07-11  43  }
b5f6e0fc7d60e0 Marco Elver     2019-07-11  44  static inline bool kasan_check_write(const volatile void *p, unsigned int size)
b5f6e0fc7d60e0 Marco Elver     2019-07-11  45  {
b5f6e0fc7d60e0 Marco Elver     2019-07-11  46  	return true;
b5f6e0fc7d60e0 Marco Elver     2019-07-11  47  }
64f8ebaf115bcd Andrey Ryabinin 2016-05-20  48  #endif
64f8ebaf115bcd Andrey Ryabinin 2016-05-20  49  

:::::: The code at line 38 was first introduced by commit
:::::: 7d8ad890dad00f6cd64bfb44d9be4fceb10cf819 mm/kasan: introduce __kasan_check_{read,write}

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
