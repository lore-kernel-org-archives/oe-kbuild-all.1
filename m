Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6757736B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 04:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674363556; x=1705899556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hX1/RupBQ8tKw19lqmGF4xjyLVLiXH20hy125mIjvuA=;
  b=Nc92kzqf7fRztTwwzS5uZh/7yBDdK4L5PJ4qjEpCfxQ1fq0Umzri20G4
   kpuHDTrDNTR0HXKKNPLA/1sSQUU1eG9JPiLh95rIn4qf9R0UqAHwQSnRF
   eaUYPcZvQuLchzg946GJ3ydaVxoL3QTlKvpi2fcP6FPUvb7zGPPjCsZRS
   jIh2vuafj9jZYKJdo2n/PiVPveXwUMdwdlgeohTXLBF3yq4x3ixXRkWoh
   dOBdB48A2jLmWUGoAaNwU2PYjzl1d0XVpl2xgLNdYvPUBoysrdeIH8a3K
   JTSG5MpQJTcB/EekJv9VlcX95mMW02Awcm4mX6eOeq28opOkDrdHMqMmG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327134673"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="327134673"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 20:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="989832039"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="989832039"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2023 20:59:14 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJSRl-0004lQ-23;
	Sun, 22 Jan 2023 04:59:13 +0000
Date: Sun, 22 Jan 2023 12:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1173/2635]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_441' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(*payload) != sizeof(prep->payload.data)
Message-ID: <202301221234.H6iuQGOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephan,

FYI, the error/warning still remains.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   c3d6a9e05fe1bb42a4e0b4498cb1b5d50381de8d
commit: c1ebba4a034d624cda447cc2e7316a1b87e7d58b [1173/2635] CHROMIUM: LSM: chromiumos security module
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230122/202301221234.H6iuQGOF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout c1ebba4a034d624cda447cc2e7316a1b87e7d58b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   security/keys/big_key.c: In function 'big_key_preparse':
>> include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_441' declared with attribute error: BUILD_BUG_ON failed: sizeof(*payload) != sizeof(prep->payload.data)
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:338:25: note: in definition of macro '__compiletime_assert'
     338 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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


vim +/__compiletime_assert_441 +357 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  343  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  354   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  356  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @357  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  358  

:::::: The code at line 357 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
