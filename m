Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C172CA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 22:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685138570; x=1716674570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTvskO1phxhwpSxy7aULYomPUjfL3CuS0GL+NiBMb44=;
  b=jkxHJOa8tzpYF9SmurPCYS2ZObW7RdAcEgA8w7FQulwbCbB6Mbofvo4d
   YQImcP81i5wNXOn55fCa5Nz/PoVektud/9VvvJmiDYTu3VFnq3YFpdpT8
   wEGAM6aU/aFcW2x/DIdr+8NK56E+0Xuvce53KZVqcBMaIQ3g9ehs54djY
   doZGsaevdVibskHAcuUFAKD+Mm2kuzMS5UP1LGSuHxlCd9eKLWIz3sP7j
   LT5zTzpVBA+cIfJVu3ffchSoxUXV7P8mKcrakVCiBnEfXffxC7jq9x4z1
   nl28ZWixwwDr40UqH+ybpyKchYRZs8s78zp2sbPHGxhmWYooxzaY1Vjhw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351822082"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="351822082"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 15:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699542640"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="699542640"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 May 2023 15:02:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2fWH-000Jci-0R;
	Fri, 26 May 2023 22:02:45 +0000
Date: Sat, 27 May 2023 06:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Marco Elver <elver@google.com>
Subject: mm/kasan/kasan_test.c:36:6: sparse: sparse: symbol
 'kasan_ptr_result' was not declared. Should it be static?
Message-ID: <202305270548.Vm7uVozN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77af1f2b9a2464e4bce20cfd32bfb2390c67de7c
commit: f7e01ab828fd4bf6d25b1f143a3994241e8572bf kasan: move tests to mm/kasan/
date:   8 months ago
config: arm-randconfig-s051-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270548.Vm7uVozN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7e01ab828fd4bf6d25b1f143a3994241e8572bf
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f7e01ab828fd4bf6d25b1f143a3994241e8572bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270548.Vm7uVozN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test.c:36:6: sparse: sparse: symbol 'kasan_ptr_result' was not declared. Should it be static?
>> mm/kasan/kasan_test.c:37:5: sparse: sparse: symbol 'kasan_int_result' was not declared. Should it be static?

vim +/kasan_ptr_result +36 mm/kasan/kasan_test.c

adb72ae1915db2 lib/test_kasan.c Daniel Axtens    2020-06-03 @36  void *kasan_ptr_result;
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13 @37  int kasan_int_result;
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13  38  
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13  39  static struct kunit_resource resource;
ed6d74446cbfb8 lib/test_kasan.c Andrey Konovalov 2022-03-24  40  static struct kunit_kasan_status test_status;
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13  41  static bool multishot;
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13  42  

:::::: The code at line 36 was first introduced by commit
:::::: adb72ae1915db28f934e9e02c18bfcea2f3ed3b7 kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
