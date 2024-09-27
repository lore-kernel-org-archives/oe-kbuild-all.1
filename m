Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27FF1607AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727425150; cv=none; b=a/G65wlxQf67c5Cn4n8QYJffthLUyZoZBawYkt8Is3PibqsQdPhOD0U8lpbjjs2NxLrXzem5papMXO1n7VfsQsrVqNEOFaqhExpdnv2e9igmV7xgMY75garzYQdC8J79gfNf8L0dGkfBy7gcE90qFoAJ8vNIAzT6056LJ3MBn2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727425150; c=relaxed/simple;
	bh=JGCzF5rEX19POHuGx/Y8tACkY2igV4U8Xa5ug3srQtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PAg/F4szprflHL0CTxdK3sgYB5xNjFk12cO6L/JrwqWTv+lHd4fQ3m2FGGsI0+/ZhyfltQHMoT8h/Uxk47eZqo5Xv+n0/FNny2ZjEb3QlFjyj83VZSbrxKP1O6t7BchzMSI4gp7NVDbBYThRrZknMBbX9/yj9izq5Js7ANYC8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwQvd3lw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwQvd3lw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727425148; x=1758961148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGCzF5rEX19POHuGx/Y8tACkY2igV4U8Xa5ug3srQtg=;
  b=MwQvd3lwpcYeDUetovIVc/emBWPIVx/wMgcxUCmgu6TuFHqIBE1sdAbQ
   0Is+muR+yaC/c/gQZZWjw7xSgLRMSpEzm78qgbjtC2BAwNcII2kFK+MWh
   QCI5UXJQFVjQRI4n30LzhyohVpFtRH9cuth6Q5dRa97ayapQOV0+1tD++
   oiZMSK3YhC1Ll4F1olD5IVCx9jHBNvrsXjgHCEj9F6QZ86N8YB29VkyoE
   QFlgBLaoH+SOD92zMXk6KJx4un8C3N5qyzHn7B4Iue1XjBo/h3TD2QVfG
   MlPu1BRx/mNfBgidGX+cFXUL9b0os01XD16dRduEmu8illN9dFENCaBLT
   g==;
X-CSE-ConnectionGUID: g8GpXL65REerPrWv3zvwVg==
X-CSE-MsgGUID: 6U7dhHy4S3uUp5Z4fXYe4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26507483"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26507483"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 01:19:08 -0700
X-CSE-ConnectionGUID: hR/fbL8tRGirFWirYxu4uA==
X-CSE-MsgGUID: PMKIokQ7SMGXbK4lakC1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="73251941"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 01:19:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su6Bq-000Lgd-2I;
	Fri, 27 Sep 2024 08:19:02 +0000
Date: Fri, 27 Sep 2024 16:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Conall O'Griofa <conall.ogriofa@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 137/1001]
 include/linux/compiler_types.h:425:45: error: call to
 '__compiletime_assert_214' declared with attribute error: FIELD_GET: mask is
 zero
Message-ID: <202409271644.w7TpK7Oh-lkp@intel.com>
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
config: arc-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271644.w7TpK7Oh-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271644.w7TpK7Oh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271644.w7TpK7Oh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
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
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:47: note: in expansion of macro '__bf_shf'
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                               ^~~~~~~~
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
>> include/linux/bitfield.h:69:44: warning: right shift count is negative [-Wshift-count-negative]
      69 |                                  ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
         |                                            ^~
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
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
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
   include/linux/bitfield.h:71:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      71 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:34: note: in expansion of macro '__bf_cast_unsigned'
      71 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                                  ^~~~~~~~~~~~~~~~~~
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
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
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
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/bitfield.h:155:44: note: in definition of macro 'FIELD_GET'
     155 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
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
   include/linux/bitfield.h:155:52: warning: right shift count is negative [-Wshift-count-negative]
     155 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                                    ^~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~
   drivers/iio/adc/xilinx-ams.c: In function 'ams_update_alarm':
   drivers/iio/adc/xilinx-ams.c:424:51: warning: left shift count >= width of type [-Wshift-count-overflow]
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
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_214' declared with attribute error: FIELD_GET: mask is zero
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
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:377:15: note: in expansion of macro 'FIELD_GET'
     377 |         val = FIELD_GET(AMS_ISR1_ALARM_1_TO_0_MASK, alarm_mask);
         |               ^~~~~~~~~
   In function 'ams_update_pl_alarm',
       inlined from 'ams_update_alarm' at drivers/iio/adc/xilinx-ams.c:419:3,
       inlined from 'ams_write_event_config' at drivers/iio/adc/xilinx-ams.c:963:2:
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_259' declared with attribute error: FIELD_GET: mask is zero
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
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.c:401:15: note: in expansion of macro 'FIELD_GET'
     401 |         val = FIELD_GET(AMS_ISR1_ALARM_2_MASK, alarm_mask);
         |               ^~~~~~~~~


vim +/__compiletime_assert_214 +425 include/linux/compiler_types.h

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

:::::: The code at line 425 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
