Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11707A94E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675976314; x=1707512314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Otx4HiwKBVoZPbSG9QD/lqnY2Eg8vZZdHYs0mnle3dI=;
  b=GJPR+FX/At3Ja3pqClklT7fLnPao6sO8AeRbf3kgFl9XrWCd0UAEG80V
   BQuQaXiY+KX78P5qV2H8omJU+3WmGelHKgT7mVfEQudubpH0OdxyFI1co
   MLm1+mmrx0A1Ti50StulwqLKPGPeXIl14Faw8h6LteTJH0R3mvLPXERH9
   tXqaokd16zaFw1RL1A9GufHt0YpFtUD+lgKcAiQ1RTaYYeWg2SylCYXBg
   PaZktfudA669Y2pSyl+twoSDcIsdrpvBijJ4Kld9FtKuNTTMWLKBBmdcy
   OT1ukpDbBLdBw6R5u7Nqs9SM/6RSfb+qmCwakAaXnt5S+chf/ciL0P+z/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318256878"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="318256878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 12:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="791737342"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="791737342"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Feb 2023 12:58:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQDzb-0005Iw-1E;
	Thu, 09 Feb 2023 20:58:07 +0000
Date: Fri, 10 Feb 2023 04:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] dma-fence: Track explicit waiters
Message-ID: <202302100447.J7ab5Wrw-lkp@intel.com>
References: <20230209154315.468682-2-tvrtko.ursulin@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209154315.468682-2-tvrtko.ursulin@linux.intel.com>

Hi Tvrtko,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/dma-fence-Track-explicit-waiters/20230209-234523
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230209154315.468682-2-tvrtko.ursulin%40linux.intel.com
patch subject: [RFC 1/3] dma-fence: Track explicit waiters
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230210/202302100447.J7ab5Wrw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/871de6ff345b69a34f0cfe807395b6074b5a29ea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tvrtko-Ursulin/dma-fence-Track-explicit-waiters/20230209-234523
        git checkout 871de6ff345b69a34f0cfe807395b6074b5a29ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100447.J7ab5Wrw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'switch_to_kernel_context',
       inlined from '__engine_park' at drivers/gpu/drm/i915/gt/intel_engine_pm.c:262:7:
>> include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_547' declared with attribute error: BUILD_BUG_ON failed: sizeof(rq->duration) > sizeof(rq->submitq)
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
   drivers/gpu/drm/i915/gt/intel_engine_pm.c:221:17: note: in expansion of macro 'BUILD_BUG_ON'
     221 |                 BUILD_BUG_ON(sizeof(rq->duration) > sizeof(rq->submitq));
         |                 ^~~~~~~~~~~~


vim +/__compiletime_assert_547 +358 include/linux/compiler_types.h

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
