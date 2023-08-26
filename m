Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C122102
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693043887; x=1724579887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNzfhaCJ3WbW/KuQz01jwzxf1LzliHt6Xmuu6st4/Is=;
  b=VJvBhAP5rcsLph7m+zOUDNiFuTI4cQHlbKC7+LO0hLKxENJLsHAUerJY
   swGN2eH4zH8pjN13oKjQjNvqIUCL671CyqbcoScyN6gX3ar8F9rot4q/Z
   GyAuFTnqRVoN6YfkgaKljdiACnyJP+Hq8b8EVcbw6kpSARGyFNqLY4ZBt
   EYgaB7dptlvUErbNNztqe975vqJTYL2/925toftCi51dm9F6bGqjR8Rk/
   6SmSDHSilNL9YhIZSxjPd8EWEzsvxLHLK0G9ijJNow5VQ3i5g3yKrMBVb
   Pj/K3q0C3Nmvhf+4E/ZL4n/PwLcUuIb5CtL3fcbJ/golvFVcnYG+M6PJG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354390581"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="354390581"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 02:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911539602"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="911539602"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Aug 2023 02:58:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZq3N-0004a1-2k;
	Sat, 26 Aug 2023 09:58:01 +0000
Date: Sat, 26 Aug 2023 17:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:sio-v2-wip 2/5] include/linux/compiler_types.h:397:45: error:
 call to '__compiletime_assert_271' declared with attribute error: FIELD_GET:
 mask is zero
Message-ID: <202308261744.ZIvykj5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux sio-v2-wip
head:   ca354f32cf579dac12daf68f098dc50ed434f5c9
commit: 33553c01448be5606fcca75ccae587fe454ea8fe [2/5] dmaengine: apple-sio: Add Apple SIO driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20230826/202308261744.ZIvykj5F-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261744.ZIvykj5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261744.ZIvykj5F-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/dma/apple-sio.c:234:25: warning: no previous prototype for 'sio_alloc_desc' [-Wmissing-prototypes]
     234 | struct sio_coproc_desc *sio_alloc_desc(struct sio_data *sio)
         |                         ^~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:245:6: warning: no previous prototype for 'sio_free_desc' [-Wmissing-prototypes]
     245 | void sio_free_desc(struct sio_data *sio, struct sio_coproc_desc *desc)
         |      ^~~~~~~~~~~~~
   drivers/dma/apple-sio.c:250:5: warning: no previous prototype for 'sio_coproc_desc_slot' [-Wmissing-prototypes]
     250 | int sio_coproc_desc_slot(struct sio_data *sio, struct sio_coproc_desc *desc)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   drivers/dma/apple-sio.c: In function 'sio_fill_in_locked':
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      71 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:34: note: in expansion of macro '__bf_cast_unsigned'
      71 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      71 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:34: note: in expansion of macro '__bf_cast_unsigned'
      71 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:56: note: in expansion of macro '__bf_shf'
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:56: note: in expansion of macro '__bf_shf'
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:56: note: in expansion of macro '__bf_shf'
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:74:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      74 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:75:56: note: in expansion of macro '__bf_shf'
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:114:17: note: in expansion of macro '__BF_FIELD_CHECK'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
   In file included from drivers/dma/apple-sio.c:8:
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/dma/apple-sio.c:410:38: note: in expansion of macro 'FIELD_PREP'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                      ^~~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:115:63: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:115:63: note: in definition of macro 'FIELD_PREP'
     115 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                                               ^~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:410:49: note: in expansion of macro 'SIOMSG_DATA'
     410 |                                      FIELD_PREP(SIOMSG_DATA, sio_coproc_desc_slot(sio, d)),
         |                                                 ^~~~~~~~~~~
   drivers/dma/apple-sio.c: In function 'sio_recv_msg':
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   drivers/dma/apple-sio.c:569:17: note: in expansion of macro 'FIELD_GET'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:569:27: note: in expansion of macro 'SIOMSG_DATA'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                           ^~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   drivers/dma/apple-sio.c:569:17: note: in expansion of macro 'FIELD_GET'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:569:27: note: in expansion of macro 'SIOMSG_DATA'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                           ^~~~~~~~~~~
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:569:17: note: in expansion of macro 'FIELD_GET'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:569:27: note: in expansion of macro 'SIOMSG_DATA'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                           ^~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:569:17: note: in expansion of macro 'FIELD_GET'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                 ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/dma/apple-sio.c:27:25: note: in expansion of macro 'GENMASK'
      27 | #define SIOMSG_DATA     GENMASK(63, 32)
         |                         ^~~~~~~
   drivers/dma/apple-sio.c:569:27: note: in expansion of macro 'SIOMSG_DATA'
     569 |         data  = FIELD_GET(SIOMSG_DATA, msg);
         |                           ^~~~~~~~~~~
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)


vim +/__compiletime_assert_271 +397 include/linux/compiler_types.h

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

:::::: The code at line 397 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
