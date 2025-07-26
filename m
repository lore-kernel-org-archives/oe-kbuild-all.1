Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039022259B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753526251; cv=none; b=JNHznQpCghEcB5e6nAu8JN0G8uEvvlU5rnFEgxmy2rnVQ9eDLnCJ/2WTp+DBpR6+3Dsi3GcwdTPk0cec0hGtFqjEI3nrdPGWcpb1L6ql9Z3+Se5bhjeg3GkpmyWTR35kk8KvoyTxb7AdxdyAi8dvA3wBq6X5Q5vfYHaRrJ0JjAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753526251; c=relaxed/simple;
	bh=eOlVVoQTYouXw9pfc7zhFIL7FcixE7Gg4KKjLUn7+a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LtuL5kkxEA3jol/LKWzGF+rdIfQWHqyuFm35w4BJJJ9KoauTXQPub6EYQaJbLO7XbMxphTjwvSR+xhuUBv5tp7FsDDZTz1Vnp7rVcWHuWXd7OuVBA0xDLkXt18TzC+pkQ5/DeylaJwfkX2/5hmADENpNNVdHqJNl52GapdzD7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuzdpBIZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuzdpBIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753526250; x=1785062250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOlVVoQTYouXw9pfc7zhFIL7FcixE7Gg4KKjLUn7+a4=;
  b=iuzdpBIZMwbTdc6+l08tjawFMDA6Rn54u+IgW7Oqxc5TfO25C6vpzu1S
   ojoZWoVR9GkHCI2IGaAVANE1LshAnSVTB/vic3MfT+y1b9YfGqGMEq9g7
   Z0AqkjmK+g0psHRwQIoDmBhLz91oIae/VWgaHf7lCc3FvVUJfsXS6q89p
   JJLsNPx1Ql+eZqvcNP9rxOA3R5uSmP4j6udXYygaRLgSrFyyyMjS0LEpV
   Er0421Ae1qzxVYSOTQNJEpmlQKPIIS7ha1JY3VMWGOAvEU8MS/lQNmlF1
   bfDMfbfXLpFUQMpavrXMeYm5FL+cLzqYkTSMrNiXY39xXC5m7lyOJVQXj
   g==;
X-CSE-ConnectionGUID: waA1EDDLQKCIBaykI31lMA==
X-CSE-MsgGUID: SOLFMtyUTTW+1nVdAdaO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55704387"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55704387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:37:29 -0700
X-CSE-ConnectionGUID: kY7a0YJCT2Whm435TLngYw==
X-CSE-MsgGUID: PPExjDIHS2G2AFJ6TfCWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161413941"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2025 03:37:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcHM-000Lst-36;
	Sat, 26 Jul 2025 10:37:24 +0000
Date: Sat, 26 Jul 2025 18:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [linux-next:master 7363/12319] drivers/dpll/zl3073x/core.c:101:21:
 error: variable 'zl3073x_regmap_range' has initializer but incomplete type
Message-ID: <202507261849.EJ0cdOev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 [7363/12319] dpll: Add basic Microchip ZL3073x support
config: um-randconfig-002-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261849.EJ0cdOev-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261849.EJ0cdOev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261849.EJ0cdOev-lkp@intel.com/

Note: the linux-next/master HEAD d7af19298454ed155f5cf67201a70f5cf836c842 builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

>> drivers/dpll/zl3073x/core.c:101:21: error: variable 'zl3073x_regmap_range' has initializer but incomplete type
     101 | static const struct regmap_range_cfg zl3073x_regmap_range = {
         |                     ^~~~~~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:102:10: error: 'const struct regmap_range_cfg' has no member named 'range_min'
     102 |         .range_min      = ZL_RANGE_OFFSET,
         |          ^~~~~~~~~
>> drivers/dpll/zl3073x/core.c:93:33: warning: excess elements in struct initializer
      93 | #define ZL_RANGE_OFFSET         0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:102:27: note: in expansion of macro 'ZL_RANGE_OFFSET'
     102 |         .range_min      = ZL_RANGE_OFFSET,
         |                           ^~~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:93:33: note: (near initialization for 'zl3073x_regmap_range')
      93 | #define ZL_RANGE_OFFSET         0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:102:27: note: in expansion of macro 'ZL_RANGE_OFFSET'
     102 |         .range_min      = ZL_RANGE_OFFSET,
         |                           ^~~~~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:103:10: error: 'const struct regmap_range_cfg' has no member named 'range_max'
     103 |         .range_max      = ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
         |          ^~~~~~~~~
>> drivers/dpll/zl3073x/core.c:93:33: warning: excess elements in struct initializer
      93 | #define ZL_RANGE_OFFSET         0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:103:27: note: in expansion of macro 'ZL_RANGE_OFFSET'
     103 |         .range_max      = ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
         |                           ^~~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:93:33: note: (near initialization for 'zl3073x_regmap_range')
      93 | #define ZL_RANGE_OFFSET         0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:103:27: note: in expansion of macro 'ZL_RANGE_OFFSET'
     103 |         .range_max      = ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
         |                           ^~~~~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:104:10: error: 'const struct regmap_range_cfg' has no member named 'selector_reg'
     104 |         .selector_reg   = ZL_PAGE_SEL,
         |          ^~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:96:33: warning: excess elements in struct initializer
      96 | #define ZL_PAGE_SEL             0x7F
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:104:27: note: in expansion of macro 'ZL_PAGE_SEL'
     104 |         .selector_reg   = ZL_PAGE_SEL,
         |                           ^~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:96:33: note: (near initialization for 'zl3073x_regmap_range')
      96 | #define ZL_PAGE_SEL             0x7F
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:104:27: note: in expansion of macro 'ZL_PAGE_SEL'
     104 |         .selector_reg   = ZL_PAGE_SEL,
         |                           ^~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:105:10: error: 'const struct regmap_range_cfg' has no member named 'selector_mask'
     105 |         .selector_mask  = ZL_PAGE_SEL_MASK,
         |          ^~~~~~~~~~~~~
   In file included from drivers/dpll/zl3073x/core.c:5:
   include/linux/bits.h:87:9: warning: excess elements in struct initializer
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^
   drivers/dpll/zl3073x/core.c:97:33: note: in expansion of macro 'GENMASK'
      97 | #define ZL_PAGE_SEL_MASK        GENMASK(3, 0)
         |                                 ^~~~~~~
   drivers/dpll/zl3073x/core.c:105:27: note: in expansion of macro 'ZL_PAGE_SEL_MASK'
     105 |         .selector_mask  = ZL_PAGE_SEL_MASK,
         |                           ^~~~~~~~~~~~~~~~
   include/linux/bits.h:87:9: note: (near initialization for 'zl3073x_regmap_range')
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^
   drivers/dpll/zl3073x/core.c:97:33: note: in expansion of macro 'GENMASK'
      97 | #define ZL_PAGE_SEL_MASK        GENMASK(3, 0)
         |                                 ^~~~~~~
   drivers/dpll/zl3073x/core.c:105:27: note: in expansion of macro 'ZL_PAGE_SEL_MASK'
     105 |         .selector_mask  = ZL_PAGE_SEL_MASK,
         |                           ^~~~~~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:106:10: error: 'const struct regmap_range_cfg' has no member named 'selector_shift'
     106 |         .selector_shift = 0,
         |          ^~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:106:27: warning: excess elements in struct initializer
     106 |         .selector_shift = 0,
         |                           ^
   drivers/dpll/zl3073x/core.c:106:27: note: (near initialization for 'zl3073x_regmap_range')
>> drivers/dpll/zl3073x/core.c:107:10: error: 'const struct regmap_range_cfg' has no member named 'window_start'
     107 |         .window_start   = 0,
         |          ^~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:107:27: warning: excess elements in struct initializer
     107 |         .window_start   = 0,
         |                           ^
   drivers/dpll/zl3073x/core.c:107:27: note: (near initialization for 'zl3073x_regmap_range')
>> drivers/dpll/zl3073x/core.c:108:10: error: 'const struct regmap_range_cfg' has no member named 'window_len'
     108 |         .window_len     = ZL_PAGE_SIZE,
         |          ^~~~~~~~~~
   drivers/dpll/zl3073x/core.c:94:33: warning: excess elements in struct initializer
      94 | #define ZL_PAGE_SIZE            0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:108:27: note: in expansion of macro 'ZL_PAGE_SIZE'
     108 |         .window_len     = ZL_PAGE_SIZE,
         |                           ^~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:94:33: note: (near initialization for 'zl3073x_regmap_range')
      94 | #define ZL_PAGE_SIZE            0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:108:27: note: in expansion of macro 'ZL_PAGE_SIZE'
     108 |         .window_len     = ZL_PAGE_SIZE,
         |                           ^~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:118:14: error: variable 'zl3073x_regmap_config' has initializer but incomplete type
     118 | const struct regmap_config zl3073x_regmap_config = {
         |              ^~~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:119:10: error: 'const struct regmap_config' has no member named 'reg_bits'
     119 |         .reg_bits       = 8,
         |          ^~~~~~~~
   drivers/dpll/zl3073x/core.c:119:27: warning: excess elements in struct initializer
     119 |         .reg_bits       = 8,
         |                           ^
   drivers/dpll/zl3073x/core.c:119:27: note: (near initialization for 'zl3073x_regmap_config')
>> drivers/dpll/zl3073x/core.c:120:10: error: 'const struct regmap_config' has no member named 'val_bits'
     120 |         .val_bits       = 8,
         |          ^~~~~~~~
   drivers/dpll/zl3073x/core.c:120:27: warning: excess elements in struct initializer
     120 |         .val_bits       = 8,
         |                           ^
   drivers/dpll/zl3073x/core.c:120:27: note: (near initialization for 'zl3073x_regmap_config')
   drivers/dpll/zl3073x/core.c:121:10: error: 'const struct regmap_config' has no member named 'max_register'
     121 |         .max_register   = ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
         |          ^~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:93:33: warning: excess elements in struct initializer
      93 | #define ZL_RANGE_OFFSET         0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:121:27: note: in expansion of macro 'ZL_RANGE_OFFSET'
     121 |         .max_register   = ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
         |                           ^~~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:93:33: note: (near initialization for 'zl3073x_regmap_config')
      93 | #define ZL_RANGE_OFFSET         0x80
         |                                 ^~~~
   drivers/dpll/zl3073x/core.c:121:27: note: in expansion of macro 'ZL_RANGE_OFFSET'
     121 |         .max_register   = ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
         |                           ^~~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:122:10: error: 'const struct regmap_config' has no member named 'ranges'
     122 |         .ranges         = &zl3073x_regmap_range,
         |          ^~~~~~
   drivers/dpll/zl3073x/core.c:122:27: warning: excess elements in struct initializer
     122 |         .ranges         = &zl3073x_regmap_range,
         |                           ^
   drivers/dpll/zl3073x/core.c:122:27: note: (near initialization for 'zl3073x_regmap_config')
   drivers/dpll/zl3073x/core.c:123:10: error: 'const struct regmap_config' has no member named 'num_ranges'
     123 |         .num_ranges     = 1,
         |          ^~~~~~~~~~
   drivers/dpll/zl3073x/core.c:123:27: warning: excess elements in struct initializer
     123 |         .num_ranges     = 1,
         |                           ^
   drivers/dpll/zl3073x/core.c:123:27: note: (near initialization for 'zl3073x_regmap_config')
   drivers/dpll/zl3073x/core.c:124:10: error: 'const struct regmap_config' has no member named 'cache_type'
     124 |         .cache_type     = REGCACHE_MAPLE,
         |          ^~~~~~~~~~
   drivers/dpll/zl3073x/core.c:124:27: warning: excess elements in struct initializer
     124 |         .cache_type     = REGCACHE_MAPLE,
         |                           ^~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:124:27: note: (near initialization for 'zl3073x_regmap_config')
>> drivers/dpll/zl3073x/core.c:125:10: error: 'const struct regmap_config' has no member named 'volatile_reg'
     125 |         .volatile_reg   = zl3073x_is_volatile_reg,
         |          ^~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:125:27: warning: excess elements in struct initializer
     125 |         .volatile_reg   = zl3073x_is_volatile_reg,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dpll/zl3073x/core.c:125:27: note: (near initialization for 'zl3073x_regmap_config')
>> drivers/dpll/zl3073x/core.c:101:38: error: storage size of 'zl3073x_regmap_range' isn't known
     101 | static const struct regmap_range_cfg zl3073x_regmap_range = {
         |                                      ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/um/asm/barrier.h:6,
                    from include/linux/list.h:11,
                    from arch/um/include/linux/time-internal.h:9,
                    from arch/x86/um/asm/processor.h:4,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from drivers/dpll/zl3073x/core.c:6:
>> drivers/dpll/zl3073x/core.c:127:22: error: storage size of 'zl3073x_regmap_config' isn't known
     127 | EXPORT_SYMBOL_NS_GPL(zl3073x_regmap_config, "ZL3073X");
         |                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/dpll/zl3073x/core.c:127:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     127 | EXPORT_SYMBOL_NS_GPL(zl3073x_regmap_config, "ZL3073X");
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/dpll/zl3073x/core.c:127:22: error: storage size of 'zl3073x_regmap_config' isn't known
     127 | EXPORT_SYMBOL_NS_GPL(zl3073x_regmap_config, "ZL3073X");
         |                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/dpll/zl3073x/core.c:127:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     127 | EXPORT_SYMBOL_NS_GPL(zl3073x_regmap_config, "ZL3073X");
         | ^~~~~~~~~~~~~~~~~~~~


vim +/zl3073x_regmap_range +101 drivers/dpll/zl3073x/core.c

     2	
     3	#include <linux/array_size.h>
     4	#include <linux/bitfield.h>
     5	#include <linux/bits.h>
   > 6	#include <linux/dev_printk.h>
     7	#include <linux/device.h>
     8	#include <linux/export.h>
     9	#include <linux/module.h>
    10	#include <linux/netlink.h>
    11	#include <linux/regmap.h>
    12	#include <linux/sprintf.h>
    13	#include <linux/unaligned.h>
    14	#include <net/devlink.h>
    15	
    16	#include "core.h"
    17	#include "devlink.h"
    18	#include "regs.h"
    19	
    20	/* Chip IDs for zl30731 */
    21	static const u16 zl30731_ids[] = {
    22		0x0E93,
    23		0x1E93,
    24		0x2E93,
    25	};
    26	
    27	const struct zl3073x_chip_info zl30731_chip_info = {
    28		.ids = zl30731_ids,
    29		.num_ids = ARRAY_SIZE(zl30731_ids),
    30		.num_channels = 1,
    31	};
    32	EXPORT_SYMBOL_NS_GPL(zl30731_chip_info, "ZL3073X");
    33	
    34	/* Chip IDs for zl30732 */
    35	static const u16 zl30732_ids[] = {
    36		0x0E30,
    37		0x0E94,
    38		0x1E94,
    39		0x1F60,
    40		0x2E94,
    41		0x3FC4,
    42	};
    43	
    44	const struct zl3073x_chip_info zl30732_chip_info = {
    45		.ids = zl30732_ids,
    46		.num_ids = ARRAY_SIZE(zl30732_ids),
    47		.num_channels = 2,
    48	};
    49	EXPORT_SYMBOL_NS_GPL(zl30732_chip_info, "ZL3073X");
    50	
    51	/* Chip IDs for zl30733 */
    52	static const u16 zl30733_ids[] = {
    53		0x0E95,
    54		0x1E95,
    55		0x2E95,
    56	};
    57	
    58	const struct zl3073x_chip_info zl30733_chip_info = {
    59		.ids = zl30733_ids,
    60		.num_ids = ARRAY_SIZE(zl30733_ids),
    61		.num_channels = 3,
    62	};
    63	EXPORT_SYMBOL_NS_GPL(zl30733_chip_info, "ZL3073X");
    64	
    65	/* Chip IDs for zl30734 */
    66	static const u16 zl30734_ids[] = {
    67		0x0E96,
    68		0x1E96,
    69		0x2E96,
    70	};
    71	
    72	const struct zl3073x_chip_info zl30734_chip_info = {
    73		.ids = zl30734_ids,
    74		.num_ids = ARRAY_SIZE(zl30734_ids),
    75		.num_channels = 4,
    76	};
    77	EXPORT_SYMBOL_NS_GPL(zl30734_chip_info, "ZL3073X");
    78	
    79	/* Chip IDs for zl30735 */
    80	static const u16 zl30735_ids[] = {
    81		0x0E97,
    82		0x1E97,
    83		0x2E97,
    84	};
    85	
    86	const struct zl3073x_chip_info zl30735_chip_info = {
    87		.ids = zl30735_ids,
    88		.num_ids = ARRAY_SIZE(zl30735_ids),
    89		.num_channels = 5,
    90	};
    91	EXPORT_SYMBOL_NS_GPL(zl30735_chip_info, "ZL3073X");
    92	
  > 93	#define ZL_RANGE_OFFSET		0x80
  > 94	#define ZL_PAGE_SIZE		0x80
    95	#define ZL_NUM_PAGES		15
    96	#define ZL_PAGE_SEL		0x7F
  > 97	#define ZL_PAGE_SEL_MASK	GENMASK(3, 0)
    98	#define ZL_NUM_REGS		(ZL_NUM_PAGES * ZL_PAGE_SIZE)
    99	
   100	/* Regmap range configuration */
 > 101	static const struct regmap_range_cfg zl3073x_regmap_range = {
 > 102		.range_min	= ZL_RANGE_OFFSET,
 > 103		.range_max	= ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
 > 104		.selector_reg	= ZL_PAGE_SEL,
 > 105		.selector_mask	= ZL_PAGE_SEL_MASK,
 > 106		.selector_shift	= 0,
 > 107		.window_start	= 0,
 > 108		.window_len	= ZL_PAGE_SIZE,
   109	};
   110	
   111	static bool
   112	zl3073x_is_volatile_reg(struct device *dev __maybe_unused, unsigned int reg)
   113	{
   114		/* Only page selector is non-volatile */
   115		return reg != ZL_PAGE_SEL;
   116	}
   117	
 > 118	const struct regmap_config zl3073x_regmap_config = {
 > 119		.reg_bits	= 8,
 > 120		.val_bits	= 8,
   121		.max_register	= ZL_RANGE_OFFSET + ZL_NUM_REGS - 1,
   122		.ranges		= &zl3073x_regmap_range,
 > 123		.num_ranges	= 1,
 > 124		.cache_type	= REGCACHE_MAPLE,
 > 125		.volatile_reg	= zl3073x_is_volatile_reg,
   126	};
 > 127	EXPORT_SYMBOL_NS_GPL(zl3073x_regmap_config, "ZL3073X");
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
