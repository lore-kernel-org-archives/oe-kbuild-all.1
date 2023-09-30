Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E542C9E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696088469; x=1727624469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5detMizJG9oXLHG41LVxs7Vbdu5XWqendm5x3jTez24=;
  b=gjRjB2LdiUfmETJQNPzuCFb+bEPJ4FQz8jbzqcHXKVXT0mdhhhuipH02
   +QnnxlxwvAUjRE3o22mJS7l+wjljIwpWFSIqzILFQ+45XguP2pLjyHXwt
   hOj1EVaydM2U4QsI3OBWlMbh024s2ZR7prclmxGfyTgyCOVTMNVb+2wKU
   qZoN0bXE5mJhglqdJofg0TwFmXMrSIeuPaeXrjyjB11hLHlN6C0/wmgDS
   Y0E6DfEgPnCZBUAe8ISzoWaKUA5eKnbhRs/HP+6RiEJ4UWqNm6D79pfoj
   58AW2hfZzndqaEfpv627b3IebbLF/GThZXJRoVeCncZ+xS5wLj021iddG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="362715417"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="362715417"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 08:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="873958715"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="873958715"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Sep 2023 08:41:05 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmc5X-0004FB-0v;
	Sat, 30 Sep 2023 15:41:03 +0000
Date: Sat, 30 Sep 2023 23:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>
Subject: include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_381' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(mstat) > sizeof(skb->cb)
Message-ID: <202309302343.io5LPNu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shayne,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f3ebbef746f89f860a90ced99a359202ea86fde
commit: 021af945997ffaeaa37c9673d71afad7cde6bdef wifi: mt76: mt7996: add eht rx rate support
date:   6 months ago
config: arm-buildonly-randconfig-r003-20220914 (https://download.01.org/0day-ci/archive/20230930/202309302343.io5LPNu6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309302343.io5LPNu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309302343.io5LPNu6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/net/wireless/mediatek/mt76/mac80211.c: In function 'mt76_rx_convert':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_381' declared with attribute error: BUILD_BUG_ON failed: sizeof(mstat) > sizeof(skb->cb)
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mac80211.c:1094:9: note: in expansion of macro 'BUILD_BUG_ON'
    1094 |         BUILD_BUG_ON(sizeof(mstat) > sizeof(skb->cb));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_381 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  398  

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
