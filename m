Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DD2579
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675594639; x=1707130639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vcw4aEmHF0DzsJsAa+MwmMmOfn9Z6Xk3t0SoYct0Cic=;
  b=Vk5r4Zd8mdAygez7MLPcwh2bQoW8NIQXlfNKtrJlmxv9o/ZkfnNG/VWy
   GyhvckCPXlXounPr3ValxreEzIFKDnB+ijyIgxiRjxy5a0ELXzsjzsPtz
   6+O7MrjjCmd5zZ2lzhizi9BKuOEIfy2OwZgy23pNC5YfY13priMV1GCd9
   Ra2ZdJEy78fLyL34K+qfA6hfDGDdKa9xj21LXr59QubVVTH+O7S8VjhGi
   NWteCPrdvINMhCj2a+3aOdqxKjxtFo6noH3PpJ5ccZf1mnbxe58D4WPP/
   b2VvPX9Tirim+gIh2pDuFjLY3WtibogeNvF/x6fKnQenb1k+sX+98uhK4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317040795"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317040795"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 02:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668141936"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="668141936"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2023 02:57:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOchw-0001xE-33;
	Sun, 05 Feb 2023 10:57:17 +0000
Date: Sun, 5 Feb 2023 18:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 06/13] rtnetlink: bridge: mcast: Move MDB
 handlers out of bridge driver
Message-ID: <202302051811.4NoDvQbo-lkp@intel.com>
References: <20230204170801.3897900-7-idosch@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204170801.3897900-7-idosch@nvidia.com>

Hi Ido,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ido-Schimmel/bridge-mcast-Use-correct-define-in-MDB-dump/20230205-011545
patch link:    https://lore.kernel.org/r/20230204170801.3897900-7-idosch%40nvidia.com
patch subject: [RFC PATCH net-next 06/13] rtnetlink: bridge: mcast: Move MDB handlers out of bridge driver
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230205/202302051811.4NoDvQbo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/dd1f784995f3efdbf26e2b2694a0cd1ca181d35e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ido-Schimmel/bridge-mcast-Use-correct-define-in-MDB-dump/20230205-011545
        git checkout dd1f784995f3efdbf26e2b2694a0cd1ca181d35e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   net/core/rtnetlink.c: In function 'rtnl_mdb_dump':
>> include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_660' declared with attribute error: BUILD_BUG_ON failed: sizeof(*ctx) != sizeof(cb->ctx)
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:6105:9: note: in expansion of macro 'BUILD_BUG_ON'
    6105 |         BUILD_BUG_ON(sizeof(*ctx) != sizeof(cb->ctx));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_660 +358 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  354   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  356   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  357  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @358  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
