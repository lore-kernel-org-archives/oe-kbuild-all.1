Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184585C98
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685778028; x=1717314028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KRPBZy1Qoa4mEupKKW9O7lkV5NElxmXUXeNj2XU1hxM=;
  b=KVfOwaxDT0b6d3iZlVmjCDFOpTLmy3cMNTI73WXVu5pjAk0sDL0QxDuQ
   hKgEJrZbNbMfNoMHbuz+lsPpvKaO2N4tEli5p3eOsu8mQYaUWJiyfp1lu
   sQxUv325OOfNTieAXwUTnWSdjdS9QgptRDSlDop+PkGQ9ug9ekwj/rmrz
   Al7AGYRfsoFKdwhMZuhu7IrGr/Xj+Tre52SWPTbRLAA6tZ046GKEtBAdz
   Zvx56G1mR43HFY1VWnjj67O0hd8i9BGNGKK61mEZ1zvY9mVaqmWJ9Ud1d
   ROsLK+P2vFW4ZFaFr3YEZz0xSL9TAWiDkIPW+rUKpRJiyY+cWGzztSsbA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335665204"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="335665204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 00:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737798079"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="737798079"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2023 00:40:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5Ls8-0001QZ-23;
	Sat, 03 Jun 2023 07:40:24 +0000
Date: Sat, 3 Jun 2023 15:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Marcin Szycik <marcin.szycik@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH iwl-next 2/6] ip_tunnel: convert __be16 tunnel flags
 to bitmaps
Message-ID: <202306031527.aPyVUuH3-lkp@intel.com>
References: <20230601131929.294667-3-marcin.szycik@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601131929.294667-3-marcin.szycik@linux.intel.com>

Hi Marcin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcin-Szycik/ip_tunnel-use-a-separate-struct-to-store-tunnel-params-in-the-kernel/20230601-225359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230601131929.294667-3-marcin.szycik%40linux.intel.com
patch subject: [RFC PATCH iwl-next 2/6] ip_tunnel: convert __be16 tunnel flags to bitmaps
config: arm64-randconfig-c023-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031527.aPyVUuH3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fbf2c438305222ccd4e32435647669f879be8a72
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marcin-Szycik/ip_tunnel-use-a-separate-struct-to-store-tunnel-params-in-the-kernel/20230601-225359
        git checkout fbf2c438305222ccd4e32435647669f879be8a72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/netronome/nfp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306031527.aPyVUuH3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/net/ethernet/netronome/nfp/flower/action.c: In function 'nfp_fl_set_tun.isra':
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_949' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(__res)
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
   drivers/net/ethernet/netronome/nfp/flower/action.c:405:9: note: in expansion of macro 'BUILD_BUG_ON'
     405 |         BUILD_BUG_ON(!__builtin_constant_p(__res));     \
         |         ^~~~~~~~~~~~
   drivers/net/ethernet/netronome/nfp/flower/action.c:431:9: note: in expansion of macro 'NFP_FL_CHECK'
     431 |         NFP_FL_CHECK(CSUM);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_949 +397 include/linux/compiler_types.h

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
