Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 01:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680571194; x=1712107194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYfHwpabs/xCsxDXmJ9TPb9haAfcSLMo5zs7MtvWs0E=;
  b=XUhwN1LoIZGvibPlPBWfI5MyLELH0MhPuJ9tl76QeXehvqOk+ZhrMHga
   v/VvXvW3QsRt4+pS9qdJI6OLQCX93JYpDXUHNWm3oy71fQp1/3g11o0kl
   OaL7ZjZEWk4Je/qDVxEnOtHjD13cW++XitSjOsoBMkjXN8jLnGjZf1xNd
   6w1Kd5ehp6SeVyhB71WBBz+K3/sYAzqfd1cYn6eanmXuQ4D5ejSy493Id
   rNCsXX1CYSampSfc6Y25eiIpNq5lkphvTfObaz5qAaHydEH5QwP4klZme
   YwsRPCpfPNfIY2PnewYaPvJ1H59OXJIfnZVy/PZGkOs0C04VHkrv9pmdQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340791547"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="340791547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 18:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="775442802"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="775442802"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2023 18:19:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjVKw-000Ozq-1P;
	Tue, 04 Apr 2023 01:19:50 +0000
Date: Tue, 4 Apr 2023 09:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Daniel Santos <daniel.santos@pobox.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.4.y 4610/22976]
 include/linux/compiler.h:350:45: error: call to '__compiletime_assert_253'
 declared with attribute error: FIELD_GET: mask is not constant
Message-ID: <202304040908.quRhblEI-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   73330daa339307fbff4ff7f1775da1dead794691
commit: 3910babeac1ab031f4e178042cbd1af9a9a0ec51 [4610/22976] compiler.h: fix error in BUILD_BUG_ON() reporting
config: i386-randconfig-r015-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040908.quRhblEI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=3910babeac1ab031f4e178042cbd1af9a9a0ec51
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.4.y
        git checkout 3910babeac1ab031f4e178042cbd1af9a9a0ec51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7615/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040908.quRhblEI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/wireless/mediatek/mt76/mt7615/mac.c:10:
   drivers/net/wireless/mediatek/mt76/mt7615/mac.c: In function 'to_rssi':
>> include/linux/compiler.h:350:45: error: call to '__compiletime_assert_253' declared with attribute error: FIELD_GET: mask is not constant
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
   include/linux/compiler.h:350:45: error: call to '__compiletime_assert_257' declared with attribute error: BUILD_BUG_ON failed: (((field) + (1ULL << (__builtin_ffsll(field) - 1))) & (((field) + (1ULL << (__builtin_ffsll(field) - 1))) - 1)) != 0
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


vim +/__compiletime_assert_253 +350 include/linux/compiler.h

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
