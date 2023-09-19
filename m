Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE71C698
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695130460; x=1726666460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2w/ghwgi4nMHI7PP3JJJBZVed7aT6X07JJdCHLlb3Y=;
  b=daIctuGXIYNcTSlMSZbBDkXm2MsgOc9G9r0+yEqq7C3Fy3OlbHjko/6s
   UiwXHZvXkVd7J+ZlkLbb3f6c+vStFGQQmOv4kpZtuxD249yUEkrtGTa+Q
   DFWagQPpy9R/gYEhBuWRCx346vS3rLHHy18nQ8j8dX910iW+wVt2PeWRp
   ++COmmNDoK6UhNmxAlTvPQCQNUMBXoLxT8DyWcTK1zNKpVgmyC3SBPCNh
   cXxRW6yTVRdbCqRL8IEiRe+7Hg0f5P9zo/tU3x2oV5V7dZqbafMyOlRpq
   l0yFRPDUcdBZcQnNDIN5L1CrOYTTGeDo7IbqfHXL9WFNO8Wu1vPu8Le7z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410872939"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="410872939"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749481017"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="749481017"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 06:34:15 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiarl-0007Ow-1U;
	Tue, 19 Sep 2023 13:34:13 +0000
Date: Tue, 19 Sep 2023 21:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Conall O'Griofa <conall.ogriofa@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1267/1363]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_236' declared with attribute error: FIELD_GET: mask is
 zero
Message-ID: <202309192132.Zd7CXANs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: 6059ed67e6da91228344d2d3bfb820e613f43f17 [1267/1363] drivers: iio: adc: xilinx-ams: Add over temperature interrupts
config: arc-randconfig-001-20230919 (https://download.01.org/0day-ci/archive/20230919/202309192132.Zd7CXANs-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192132.Zd7CXANs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192132.Zd7CXANs-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iio/adc/xilinx-ams.c: In function 'ams_update_ps_alarm':
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iio/adc/xilinx-ams.c:12:
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:129:44: note: in definition of macro 'FIELD_GET'
     129 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:129:44: note: in definition of macro 'FIELD_GET'
     129 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      35 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c: In function 'ams_update_pl_alarm':
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                               ^~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:69:44: warning: right shift count is negative [-Wshift-count-negative]
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                            ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:75:53: warning: left shift count is negative [-Wshift-count-negative]
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                     ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/bitfield.h:75:53: warning: left shift count is negative [-Wshift-count-negative]
      75 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                     ^~
   include/linux/compiler_types.h:337:23: note: in definition of macro '__compiletime_assert'
     337 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:357:9: note: in expansion of macro '_compiletime_assert'
     357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/bitfield.h:129:44: note: in definition of macro 'FIELD_GET'
     129 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'
     141 | #define AMS_ISR1_ALARM_2_MASK           BIT(34)
         |                                         ^~~
   drivers/iio/adc/xilinx-ams.c:401:25: note: in expansion of macro 'AMS_ISR1_ALARM_2_MASK'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:129:52: warning: right shift count is negative [-Wshift-count-negative]
     129 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                                    ^~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c: In function 'ams_update_alarm':
>> drivers/iio/adc/xilinx-ams.c:424:51: warning: left shift count >= width of type [-Wshift-count-overflow]
     424 |                              (AMS_ISR1_ALARM_MASK << AMS_ISR1_ALARM_SHIFT)),
         |                                                   ^~
   In file included from include/linux/bits.h:6,
                    from drivers/iio/adc/xilinx-ams.c:11:
   drivers/iio/adc/xilinx-ams.c: In function 'ams_get_alarm_mask':
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/iio/adc/xilinx-ams.c:929:24: note: in expansion of macro 'BIT'
     929 |                 return BIT(AMS_ALARM_BIT_TEMP_OT_REMOTE);
         |                        ^~~
   drivers/iio/adc/xilinx-ams.c: In function 'ams_irq':
   drivers/iio/adc/xilinx-ams.c:1137:42: warning: left shift count >= width of type [-Wshift-count-overflow]
    1137 |                     (AMS_ISR1_ALARM_MASK << AMS_ISR1_ALARM_SHIFT)) |
         |                                          ^~
   In function 'ams_update_ps_alarm',
       inlined from 'ams_update_alarm' at drivers/iio/adc/xilinx-ams.c:416:3,
       inlined from 'ams_write_event_config' at drivers/iio/adc/xilinx-ams.c:963:2:
>> include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_236' declared with attribute error: FIELD_GET: mask is zero
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
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   In function 'ams_update_pl_alarm',
       inlined from 'ams_update_alarm' at drivers/iio/adc/xilinx-ams.c:419:3,
       inlined from 'ams_write_event_config' at drivers/iio/adc/xilinx-ams.c:963:2:
   include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_281' declared with attribute error: FIELD_GET: mask is zero
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
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:128:17: note: in expansion of macro '__BF_FIELD_CHECK'
     128 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~


vim +/__compiletime_assert_236 +357 include/linux/compiler_types.h

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
https://github.com/intel/lkp-tests/wiki
