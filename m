Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A72168C4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683540574; x=1715076574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jr48r3Rg1gBF9nU5gu4Efj5T+5s3X2Wu++aNSu2CO0=;
  b=OJSI33sK70ILZxwAO8GCu1RtT7vQl49J6VBNW+OaQbL9HQ8mX0bD1V4Z
   BAOfXq+MwRvJCHt8vyGD54Sp/vaSMwijQrPVtu7bgu7hiORxtFnmuImMJ
   AKVhBRBhkEn/oMgghCNnQKt3P+8zud0lbPLIIxQruO8nW306yaI3/+OY9
   2+B5iF12ontUH3Yxa3Y+qHNCz/H9BcQUsZwChuGDGROjA42ejr7cf37Ct
   hW1OzFUuo9oQ+hA4REwuXNEyBwKuPDbh7orqUVQlju22RT/nfEdB3npiu
   YFcgOeCYQxlFfoJw9m4iU9m8pr0fQWaeUsbRQOyfvTC52LE2nfgdj1WES
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329966083"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="329966083"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 03:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="872745963"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="872745963"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 May 2023 03:09:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvxo9-0001BR-2q;
	Mon, 08 May 2023 10:09:29 +0000
Date: Mon, 8 May 2023 18:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Daniel Santos <daniel.santos@pobox.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:queue/5.4 4610/23318]
 include/linux/compiler.h:350:45: error: call to '__compiletime_assert_255'
 declared with attribute error: FIELD_GET: mask is not constant
Message-ID: <202305081823.YByGrcJ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vegard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   0852c87349d4b76efbaf87cff41fb692bf77814c
commit: 3910babeac1ab031f4e178042cbd1af9a9a0ec51 [4610/23318] compiler.h: fix error in BUILD_BUG_ON() reporting
config: ia64-randconfig-r014-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081823.YByGrcJ3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=3910babeac1ab031f4e178042cbd1af9a9a0ec51
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 3910babeac1ab031f4e178042cbd1af9a9a0ec51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7615/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081823.YByGrcJ3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/wireless/mediatek/mt76/mt7615/mac.c:10:
   drivers/net/wireless/mediatek/mt76/mt7615/mac.c: In function 'to_rssi':
>> include/linux/compiler.h:350:45: error: call to '__compiletime_assert_255' declared with attribute error: FIELD_GET: mask is not constant
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler.h:331:25: note: in definition of macro '__compiletime_assert'
     331 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:46:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      46 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:95:17: note: in expansion of macro '__BF_FIELD_CHECK'
      95 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7615/mac.c:18:17: note: in expansion of macro 'FIELD_GET'
      18 |         return (FIELD_GET(field, rxv) - 220) / 2;
         |                 ^~~~~~~~~
   include/linux/compiler.h:350:45: error: call to '__compiletime_assert_259' declared with attribute error: BUILD_BUG_ON failed: (((field) + (1ULL << (__builtin_ffsll(field) - 1))) & (((field) + (1ULL << (__builtin_ffsll(field) - 1))) - 1)) != 0
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler.h:331:25: note: in definition of macro '__compiletime_assert'
     331 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:54:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      54 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:95:17: note: in expansion of macro '__BF_FIELD_CHECK'
      95 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7615/mac.c:18:17: note: in expansion of macro 'FIELD_GET'
      18 |         return (FIELD_GET(field, rxv) - 220) / 2;
         |                 ^~~~~~~~~


vim +/__compiletime_assert_255 +350 include/linux/compiler.h

   336	
   337	#define _compiletime_assert(condition, msg, prefix, suffix) \
   338		__compiletime_assert(condition, msg, prefix, suffix)
   339	
   340	/**
   341	 * compiletime_assert - break build and emit msg if condition is false
   342	 * @condition: a compile-time constant condition to check
   343	 * @msg:       a message to emit if condition is false
   344	 *
   345	 * In tradition of POSIX assert, this macro will break the build if the
   346	 * supplied condition is *false*, emitting the supplied error message if the
   347	 * compiler has support to do so.
   348	 */
   349	#define compiletime_assert(condition, msg) \
 > 350		_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
