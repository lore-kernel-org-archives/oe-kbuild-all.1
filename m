Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F472CA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 23:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682552639; x=1714088639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EriFj3Ci0Gi6fXd6F26jEGezpVwQeNf+29sg/ZD+6bc=;
  b=oEI/oiJ07mMu58NbsnyNahXkzIX7VdaHzP+0cLta/3a9gU9jjnWBE9Yw
   R87Ei3IDGl52nNORrCbMKJfPCDcZHtFkVKFzL1q7p0Yec46rdvJMa+UF4
   sphWrRgusADGA+pX8109YpoQH5oucWuRPo8AKSROV0ulnDxqHlFKlj0UJ
   tXUKt459UAblVGc96Fdp2AWGItEwI1dypenlnrLy5wFpo2zHRXYks2GuU
   otjn9fpe4LEsD4xGuIEeXXvpTHfpnRcvLr95ztn2QddXfiE8JMAqr+FCW
   3E80UC4o+eZ7hhW2yuIgeNup0jDw8kCZ0Ndiwtd/sxFAjBoY4NmW7YBwA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="349217301"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="349217301"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 16:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763549478"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="763549478"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2023 16:43:56 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pronk-0000ao-0M;
	Wed, 26 Apr 2023 23:43:56 +0000
Date: Thu, 27 Apr 2023 07:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Subject: include/linux/kasan-checks.h:38:27: warning: 'transid' may be used
 uninitialized
Message-ID: <202304270743.t9Wk3Dsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josef,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36006b1d5c04692924f011aa949e8788f1c604de
commit: 1ec49744ba83f0429c5c706708610f7821a7b6f4 btrfs: turn on -Wmaybe-uninitialized
date:   2 months ago
config: arm-randconfig-r046-20230427 (https://download.01.org/0day-ci/archive/20230427/202304270743.t9Wk3Dsu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ec49744ba83f0429c5c706708610f7821a7b6f4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1ec49744ba83f0429c5c706708610f7821a7b6f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270743.t9Wk3Dsu-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/kernel.h:20,
                    from fs/btrfs/ioctl.c:6:
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_wait_sync':
>> include/linux/kasan-checks.h:38:27: warning: 'transid' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:3134:13: note: 'transid' declared here
    3134 |         u64 transid;
         |             ^~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_space_info':
>> include/linux/kasan-checks.h:38:27: warning: 'space_args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:2973:39: note: 'space_args' declared here
    2973 |         struct btrfs_ioctl_space_args space_args;
         |                                       ^~~~~~~~~~


vim +/transid +38 include/linux/kasan-checks.h

b5f6e0fc7d60e0 Marco Elver      2019-07-11   6  
611806b4bf8dd9 Andrey Konovalov 2021-02-24   7  /*
611806b4bf8dd9 Andrey Konovalov 2021-02-24   8   * The annotations present in this file are only relevant for the software
611806b4bf8dd9 Andrey Konovalov 2021-02-24   9   * KASAN modes that rely on compiler instrumentation, and will be optimized
611806b4bf8dd9 Andrey Konovalov 2021-02-24  10   * away for the hardware tag-based KASAN mode. Use kasan_check_byte() instead.
611806b4bf8dd9 Andrey Konovalov 2021-02-24  11   */
611806b4bf8dd9 Andrey Konovalov 2021-02-24  12  
7d8ad890dad00f Marco Elver      2019-07-11  13  /*
7d8ad890dad00f Marco Elver      2019-07-11  14   * __kasan_check_*: Always available when KASAN is enabled. This may be used
7d8ad890dad00f Marco Elver      2019-07-11  15   * even in compilation units that selectively disable KASAN, but must use KASAN
7d8ad890dad00f Marco Elver      2019-07-11  16   * to validate access to an address.   Never use these in header files!
7d8ad890dad00f Marco Elver      2019-07-11  17   */
0fea6e9af889f1 Andrey Konovalov 2020-12-22  18  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
b5f6e0fc7d60e0 Marco Elver      2019-07-11  19  bool __kasan_check_read(const volatile void *p, unsigned int size);
b5f6e0fc7d60e0 Marco Elver      2019-07-11 @20  bool __kasan_check_write(const volatile void *p, unsigned int size);
7d8ad890dad00f Marco Elver      2019-07-11  21  #else
b5f6e0fc7d60e0 Marco Elver      2019-07-11  22  static inline bool __kasan_check_read(const volatile void *p, unsigned int size)
b5f6e0fc7d60e0 Marco Elver      2019-07-11  23  {
b5f6e0fc7d60e0 Marco Elver      2019-07-11  24  	return true;
b5f6e0fc7d60e0 Marco Elver      2019-07-11  25  }
b5f6e0fc7d60e0 Marco Elver      2019-07-11  26  static inline bool __kasan_check_write(const volatile void *p, unsigned int size)
b5f6e0fc7d60e0 Marco Elver      2019-07-11  27  {
b5f6e0fc7d60e0 Marco Elver      2019-07-11  28  	return true;
b5f6e0fc7d60e0 Marco Elver      2019-07-11  29  }
7d8ad890dad00f Marco Elver      2019-07-11  30  #endif
7d8ad890dad00f Marco Elver      2019-07-11  31  
7d8ad890dad00f Marco Elver      2019-07-11  32  /*
7d8ad890dad00f Marco Elver      2019-07-11  33   * kasan_check_*: Only available when the particular compilation unit has KASAN
7d8ad890dad00f Marco Elver      2019-07-11  34   * instrumentation enabled. May be used in header files.
7d8ad890dad00f Marco Elver      2019-07-11  35   */
7d8ad890dad00f Marco Elver      2019-07-11  36  #ifdef __SANITIZE_ADDRESS__
7d8ad890dad00f Marco Elver      2019-07-11  37  #define kasan_check_read __kasan_check_read
7d8ad890dad00f Marco Elver      2019-07-11 @38  #define kasan_check_write __kasan_check_write
64f8ebaf115bcd Andrey Ryabinin  2016-05-20  39  #else
b5f6e0fc7d60e0 Marco Elver      2019-07-11  40  static inline bool kasan_check_read(const volatile void *p, unsigned int size)
b5f6e0fc7d60e0 Marco Elver      2019-07-11  41  {
b5f6e0fc7d60e0 Marco Elver      2019-07-11  42  	return true;
b5f6e0fc7d60e0 Marco Elver      2019-07-11  43  }
b5f6e0fc7d60e0 Marco Elver      2019-07-11  44  static inline bool kasan_check_write(const volatile void *p, unsigned int size)
b5f6e0fc7d60e0 Marco Elver      2019-07-11  45  {
b5f6e0fc7d60e0 Marco Elver      2019-07-11  46  	return true;
b5f6e0fc7d60e0 Marco Elver      2019-07-11  47  }
64f8ebaf115bcd Andrey Ryabinin  2016-05-20  48  #endif
64f8ebaf115bcd Andrey Ryabinin  2016-05-20  49  

:::::: The code at line 38 was first introduced by commit
:::::: 7d8ad890dad00f6cd64bfb44d9be4fceb10cf819 mm/kasan: introduce __kasan_check_{read,write}

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
