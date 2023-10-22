Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A553ED3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDSYhXhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697963512; x=1729499512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=41aME/Uiez65RuSvfdia3QPKDdRMBdHTa2ykIvGAyAI=;
  b=LDSYhXhlghSrgstwy73XSNXnxrg7vBUH7I2msPu2uEaSfvnjqcw1N6Lq
   KP7NuKGUPK9a1XKihU/pGj7LUt/QffPpZeY9C92hdyLaDIDvTaoz1BVRx
   ey9PyfeNi/8BBFdkn+Quu4rD8KXo+fpeRF5g7oKzw7hqJpVR3Os2i9/Ox
   IuUMHXjWsIkPVlP2LV/Ru9sbAJc42nn0zSpUyjgktnTTQN+qMJkRLsnQO
   vTHfoa9sM0Oj2deVz90AMkLz5xMmxvo0mNdQI1TWQ9CVdZ0XKNeOe1Ply
   s2GrN2AB/Y5KhxSS7PkhyPPb7b3ncLuAJqvID7kuD8CGr+bc/kNGXnT6t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383890148"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383890148"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734369410"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734369410"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 01:31:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quTs8-0005k4-34;
	Sun, 22 Oct 2023 08:31:44 +0000
Date: Sun, 22 Oct 2023 16:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] dmaengine: apple-sio: Add Apple SIO driver
Message-ID: <202310221605.tFEqJTSo-lkp@intel.com>
References: <20231013164936.60718-3-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013164936.60718-3-povik+lin@cutebit.org>

Hi Martin,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on robh/for-next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Povi-er/dt-bindings-dma-apple-sio-Add-schema/20231017-123351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20231013164936.60718-3-povik%2Blin%40cutebit.org
patch subject: [PATCH v3 2/2] dmaengine: apple-sio: Add Apple SIO driver
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231022/202310221605.tFEqJTSo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221605.tFEqJTSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221605.tFEqJTSo-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                     ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:765:48: note: in expansion of macro 'SIOMSG_DATA'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:765:37: note: in expansion of macro 'FIELD_PREP'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:765:48: note: in expansion of macro 'SIOMSG_DATA'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:765:37: note: in expansion of macro 'FIELD_PREP'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:765:48: note: in expansion of macro 'SIOMSG_DATA'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:115:63: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:765:48: note: in expansion of macro 'SIOMSG_DATA'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:115:63: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:765:48: note: in expansion of macro 'SIOMSG_DATA'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   drivers/dma/apple-sio.c: In function 'sio_recv_msg':
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_251' declared with attribute error: FIELD_GET: mask is not constant
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:516:17: note: in expansion of macro 'FIELD_GET'
     516 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   In function 'sio_fill_in_locked',
       inlined from 'sio_update_current_tx_locked' at drivers/dma/apple-sio.c:386:3:
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_236' declared with attribute error: FIELD_PREP: mask is not constant
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:371:38: note: in expansion of macro 'FIELD_PREP'
     371 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   In function 'sio_send_dt_params',
       inlined from 'sio_probe' at drivers/dma/apple-sio.c:859:8:
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_336' declared with attribute error: FIELD_PREP: mask is not constant
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:765:37: note: in expansion of macro 'FIELD_PREP'
     765 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   In function 'sio_alloc_shmem',
       inlined from 'sio_probe' at drivers/dma/apple-sio.c:863:8:
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_301' declared with attribute error: FIELD_PREP: mask is not constant
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:721:29: note: in expansion of macro 'FIELD_PREP'
     721 |                             FIELD_PREP(SIOMSG_DATA, iova >> 12));
         |                             ^~~~~~~~~~


vim +/__compiletime_assert_236 +425 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  411  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  414  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  415  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  419   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
