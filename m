Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE42566
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677942358; x=1709478358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6t5sOErDifnzoT65zhWSyDEGWHH+OH72jC1FRyZgJY=;
  b=KPapNBLMllyk/qrs0GiFIt+HnaB6216FZVdNnyj5Db6rDN2U9+kLX/iX
   PClxJYk9GabjbEVV7v+CLGKecOJtmL+yGF8am5hmJYbjT6YyLG9LhCrma
   boZKQ1xG6OmcDJpxLc2S2DJNocEqYewRd/Rvl6sRu/mxQcpbM0xV9HH2d
   UXBBHp2oxEw9S1nb13MxaFDcSDW0wQ7mOFgO4WgrZNkq6d4jviXvkk2Gr
   GqgATVtebdxAKDLqKZL1FCAxPpmyy4JsUxlkG8qoVWy3z4MEktnPXl6ar
   KBHTH3neJndXEnRSizFPDvj8DL3k0e/CHG0PvV28rJPV+HTrcY/mSyEBg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315662508"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="315662508"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 07:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="675677380"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675677380"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 07:05:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYTSN-0002EG-1P;
	Sat, 04 Mar 2023 15:05:55 +0000
Date: Sat, 4 Mar 2023 23:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 248/651] include/linux/build_bug.h:78:41:
 error: static assertion failed: "SKB_WITH_OVERHEAD(TEST_XDP_FRAME_SIZE -
 XDP_PACKET_HEADROOM) == TEST_MAX_PKT_SIZE"
Message-ID: <202303042238.u4iQY7fz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   c9c6a91d7037f7ae6226c138d25471d1feb39e9c
commit: 128c26dda7023a74d45e168e8c120fdecd37c535 [248/651] bpf, test_run: fix &xdp_frame misplacement for LIVE_FRAMES
config: x86_64-randconfig-a006 (https://download.01.org/0day-ci/archive/20230304/202303042238.u4iQY7fz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=128c26dda7023a74d45e168e8c120fdecd37c535
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout 128c26dda7023a74d45e168e8c120fdecd37c535
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042238.u4iQY7fz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from net/bpf/test_run.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "SKB_WITH_OVERHEAD(TEST_XDP_FRAME_SIZE - XDP_PACKET_HEADROOM) == TEST_MAX_PKT_SIZE"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   net/bpf/test_run.c:132:1: note: in expansion of macro 'static_assert'
     132 | static_assert(SKB_WITH_OVERHEAD(TEST_XDP_FRAME_SIZE - XDP_PACKET_HEADROOM) ==
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
