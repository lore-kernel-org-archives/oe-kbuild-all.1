Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE21C11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676210746; x=1707746746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdBldGaOas/1xqvy/V5n8n0qkwCL6vI3HzKcpI0lYuE=;
  b=eg84rWqv/Z2ibTnnA4CC4CR4KD5APWj8FLaxNPA3SKgVQgBzngN46QaM
   3aLJWx3ymR45+KBx+jTAVlAtVPQsNQUBJXQ6vGTkaV+pkVeKnnOxI9x6m
   /CRw2dMtr92hNhBUkOEi149ltvC9eJ1bjM5cbZ/KolYmT1CW3SdyxeI2J
   XKgCddH05eoJEtGZl95RvH5EZgN2leWm0PTEYwI2Hm4s+axqqGN34wOoU
   Vciv+5UEcBqg9WDSxYXlxZJHhH3kXKns8BtzO9STqPDC12bxBDUPmdfGv
   31Kb8z0wo7+pTF4UK4g/cjDQW9PfbxWS394T8dnnzJdZSstjT/Pv/wtyX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="311078728"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311078728"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 06:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811323644"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="811323644"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2023 06:05:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRCzA-0007Ej-1d;
	Sun, 12 Feb 2023 14:05:44 +0000
Date: Sun, 12 Feb 2023 22:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 1/2] include/linux/compiler_types.h:334:45:
 error: call to '__compiletime_assert_814' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(*payload) != sizeof(prep->payload.data)
Message-ID: <202302122216.l4300ZjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   abd7d8e9a3be86fadf24b543e7bb6662399add0f
commit: 98c91ee9e6cbcd3e502ec11d983461379831d479 [1/2] BACKPORT: big_keys: Use struct for internal payload
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230212/202302122216.l4300ZjF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 98c91ee9e6cbcd3e502ec11d983461379831d479
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302122216.l4300ZjF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   security/keys/big_key.c: In function 'big_key_preparse':
>> include/linux/compiler_types.h:334:45: error: call to '__compiletime_assert_814' declared with attribute error: BUILD_BUG_ON failed: sizeof(*payload) != sizeof(prep->payload.data)
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:315:25: note: in definition of macro '__compiletime_assert'
     315 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   security/keys/big_key.c:67:9: note: in expansion of macro 'BUILD_BUG_ON'
      67 |         BUILD_BUG_ON(sizeof(*payload) != sizeof(prep->payload.data));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_814 +334 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  320  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  321  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  322  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  323  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  324  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  325   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  326   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  327   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  328   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  329   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  330   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  331   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  332   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  333  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @334  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  335  

:::::: The code at line 334 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
