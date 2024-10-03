Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF43AC2B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727947888; cv=none; b=UFo5H3HSYS4UEm/R+JphFN/CAH8357+S54U5spTmecjr4YuRhRlSR+5ObNCmCS9nyx4gZ7jumviSTTl5ZZ68e6geU8JEO59T3Cpd3jJzCEjSi+Cc6hIrw8OHLl4u4aXbrpAxnbAuKHjtbRbHUP7i1s/OARsPlYnLXSXAfmltmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727947888; c=relaxed/simple;
	bh=i/SDKvL3ZBu2UUn9Q66tqHNVN3V0wHI2mWWNoo5UPQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FPF3jSMxD7tsWP8ZYgOK2x2GDNDb/8Oi3GiPFOkuXpHHGT1S15a4bt/3hGVI4hPaGIJ3ZERE+hBpREAj/trN/4rw4SMIv80w6wWh1SozRYXHxuRZ6QnCmCsLiJ7fX6v86P1l40qdMWCntTNXFfa29U5YkoSnI4kxzWQtFADRTmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeY5F6ef; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeY5F6ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727947885; x=1759483885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i/SDKvL3ZBu2UUn9Q66tqHNVN3V0wHI2mWWNoo5UPQI=;
  b=TeY5F6efxo35b3vFESnWdaiAEOji3wjxhghrxh7TwODvDHCJn3+Uoc6i
   qeCxbVSWMh1kBqDxPjSQp1rQ0P3JPwbHiTPLZ7PrQlBjlr/vFBkiYbF58
   U0gAJ9EXjKNCcRy/lU/xL0hUk3Gdp0JrSTAj5ttkJ+rfjLd0fs3IRGs1/
   pGy/nd3bXsriqj2aGySgQDr0JmeimEvcl2Ws8SW5FIpaQlhKbtN9j7lMN
   dzHx9Ke+0wFEMtaE5argIFvnuQNu1SJe9rZPnEu7jSUztmKqSIeAW2iYj
   Z2quKane3OjhdDL+OCxQ+udY9CK6wiZn9xyuM5MSlWv9V77tpdEOEs60I
   Q==;
X-CSE-ConnectionGUID: V4KeGlR+RMeei7yOuDudVg==
X-CSE-MsgGUID: 8eIx0I2hROmC5D0Mw4DBYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38268339"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="38268339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 02:31:25 -0700
X-CSE-ConnectionGUID: C5AWR2i4RVqXcBslcSA7hQ==
X-CSE-MsgGUID: gJsSgAgdQZerFZoXtViwsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="78842423"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2024 02:31:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIB6-0000Ec-0S;
	Thu, 03 Oct 2024 09:31:20 +0000
Date: Thu, 3 Oct 2024 17:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Conall O'Griofa <conall.ogriofa@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 137/1001]
 drivers/iio/adc/xilinx-ams.c:424:51: warning: left shift count >= width of
 type
Message-ID: <202410031748.qPfJux9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 9d29858b73b0579e8cff27add03a8b24ecead5f1 [137/1001] drivers: iio: adc: xilinx-ams: Add over temperature interrupts
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031748.qPfJux9E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031748.qPfJux9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031748.qPfJux9E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iio/adc/xilinx-ams.c: In function 'ams_update_ps_alarm':
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iio/adc/xilinx-ams.c:12:
>> include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:155:44: note: in definition of macro 'FIELD_GET'
     155 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:155:44: note: in definition of macro 'FIELD_GET'
     155 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:34:29: warning: left shift count >= width of type [-Wshift-count-overflow]
      34 |         (((~UL(0)) - (UL(1) << (l)) + 1) & \
         |                             ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:142:41: note: in expansion of macro 'GENMASK'
     142 | #define AMS_ISR1_ALARM_1_TO_0_MASK      GENMASK(33, 32)
         |                                         ^~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:25: note: in expansion of macro 'AMS_ISR1_ALARM_1_TO_0_MASK'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:35:18: warning: right shift count is negative [-Wshift-count-negative]
      35 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/linux/bits.h:37:38: note: in expansion of macro '__GENMASK'
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
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
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
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
   include/linux/compiler_types.h:405:23: note: in definition of macro '__compiletime_assert'
     405 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:141:41: note: in expansion of macro 'BIT'


vim +424 drivers/iio/adc/xilinx-ams.c

   410	
   411	static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
   412	{
   413		unsigned long flags;
   414	
   415		if (ams->ps_base)
   416			ams_update_ps_alarm(ams, alarm_mask);
   417	
   418		if (ams->pl_base)
   419			ams_update_pl_alarm(ams, alarm_mask);
   420	
   421		spin_lock_irqsave(&ams->intr_lock, flags);
   422		ams_update_intrmask(ams,
   423				    (AMS_ISR0_ALARM_MASK |
 > 424				     (AMS_ISR1_ALARM_MASK << AMS_ISR1_ALARM_SHIFT)),
   425				    ~alarm_mask);
   426		spin_unlock_irqrestore(&ams->intr_lock, flags);
   427	}
   428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
