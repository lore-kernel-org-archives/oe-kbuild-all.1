Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99911AA88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693521013; x=1725057013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pd88E9RqGV6bu0t8l4KeRc9set1i1bzzm85nmzKzz70=;
  b=K6OoWaCLRaWibVkZYMFBt/SzqirC0g70w5LVnd+qcKIbswSYUSRATx7v
   mlCRn9Sz/jQv/pzyP/uLAx5FcZtMgfBhDdvKZc4SPqVxWM7Xrcq3QT+wh
   EW34kfKTPF+RCsaiwmWOCvq066qziRm0MdZSq4KB0YL7P9GbFuWGfwCVx
   CrltVwB2hWlfVNjl7SBTTxYNDqRkBygereGHTylYnWJsPn8c7PAmPM7YH
   LrcJBUziioUjzA5RpJcpPyacW0Te2yGboL6Uk6gwV7SCHzqr2CH7o112F
   1Ou/wwaNDKKRIR+sbzs0RQhEQ8zSRvyu80diEXts+9o+ge8fVp+QYhg+l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378814418"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="378814418"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 15:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854458183"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="854458183"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2023 15:30:10 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbqAy-0000bh-2I;
	Thu, 31 Aug 2023 22:30:08 +0000
Date: Fri, 1 Sep 2023 06:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dmaengine: apple-sio: Add Apple SIO driver
Message-ID: <202309010621.4piKUtnS-lkp@intel.com>
References: <20230828170013.75820-3-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828170013.75820-3-povik+lin@cutebit.org>

Hi Martin,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on robh/for-next]
[cannot apply to linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Povi-er/dt-bindings-dma-apple-sio-Add-schema/20230829-010321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230828170013.75820-3-povik%2Blin%40cutebit.org
patch subject: [PATCH v2 2/2] dmaengine: apple-sio: Add Apple SIO driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309010621.4piKUtnS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010621.4piKUtnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010621.4piKUtnS-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                     ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:726:48: note: in expansion of macro 'SIOMSG_DATA'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:726:37: note: in expansion of macro 'FIELD_PREP'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:726:48: note: in expansion of macro 'SIOMSG_DATA'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:726:37: note: in expansion of macro 'FIELD_PREP'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:28:25: note: in expansion of macro 'GENMASK'
      28 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:726:48: note: in expansion of macro 'SIOMSG_DATA'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
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
   drivers/dma/apple-sio.c:726:48: note: in expansion of macro 'SIOMSG_DATA'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
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
   drivers/dma/apple-sio.c:726:48: note: in expansion of macro 'SIOMSG_DATA'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                                ^~~~~~~~~~~
   drivers/dma/apple-sio.c: In function 'sio_recv_msg':
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_270' declared with attribute error: FIELD_GET: mask is not constant
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
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:513:17: note: in expansion of macro 'FIELD_GET'
     513 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   In function 'sio_send_dt_params',
       inlined from 'sio_probe' at drivers/dma/apple-sio.c:820:8:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_355' declared with attribute error: FIELD_PREP: mask is not constant
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
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:726:37: note: in expansion of macro 'FIELD_PREP'
     726 |                                     FIELD_PREP(SIOMSG_DATA, val));
         |                                     ^~~~~~~~~~
   In function 'sio_alloc_shmem',
       inlined from 'sio_probe' at drivers/dma/apple-sio.c:824:8:
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_320' declared with attribute error: FIELD_PREP: mask is not constant
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
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:682:29: note: in expansion of macro 'FIELD_PREP'
     682 |                             FIELD_PREP(SIOMSG_DATA, iova >> 12));
         |                             ^~~~~~~~~~
   In function 'sio_fill_in_locked',
       inlined from 'sio_update_current_tx_locked' at drivers/dma/apple-sio.c:383:3:
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_255' declared with attribute error: FIELD_PREP: mask is not constant
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
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:368:38: note: in expansion of macro 'FIELD_PREP'
     368 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~


vim +/__compiletime_assert_355 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
