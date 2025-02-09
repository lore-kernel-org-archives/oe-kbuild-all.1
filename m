Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F060DCF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739084472; cv=none; b=RGyDolaT1iD++ulst0vtPRlLhm8xL9TdMmhdPMLl+tl/NfxtS0CYTjO/QPOgmBymIqZ5UyPI8/Sd5ln4gCYrJ9PVsSu3eWjTkrgz+/ZN3vNzHtAtN7JY7E91sCVdbzCamTtcg01zv5wWaggjAzSCeWzsTLUzl4ziNMb6JQFf96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739084472; c=relaxed/simple;
	bh=MlaRo6tyziWKItbrIopXfDYNHlUVTNkg9jrstrSOE0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOJUaWNg78nZQfkjnZgsYSx2iX3940m1RJFORF3tpewTSzOipIrtROUM4JOeCeCvktfWgfUaewdY2ak7X6Ut1/chLfJU/w3oo7zHdLAwfJZtqpmzZftYA/r1CvOIG1XlF7lDodcjvsZ1gUCENnQKp//tb1/Yf0EWtN9AIHnieLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsmQlHLF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsmQlHLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739084470; x=1770620470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlaRo6tyziWKItbrIopXfDYNHlUVTNkg9jrstrSOE0A=;
  b=IsmQlHLFGJFn412Yd2OFcOGjxpyAoJ6Cx9TWIx/jC8GaekRDjD1BBthP
   D4+w+h41oMiLyVTSkD4hkpk5rbgW/+vL4rISfqsedGCB4kw8OFEJVs2Dh
   osMWb9K1wJ02qoXO0hnLE9D3s3NJqO+0H74/zpYV1rclUBvUa+/9Tc9Uw
   JIVTHhFQRCBi+p89L7KW+OS6IzMcssEBZltI4TSJdjbv/ugPpnrbeB+tG
   8An8NXxzlBsf1vUq+V2H1drm49VL9UFYHYAS/GR/17QGqCvi103omn9NW
   qvJ30PsBGZymUDX3ow5wIuXwjbA2mnB4OR4RyLgHvqdaITfnvc4L83FxB
   w==;
X-CSE-ConnectionGUID: IVD4bBJ4TiOu+dUACbFXiw==
X-CSE-MsgGUID: SSLVRU+sQoWKBF0NKh5Fcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43344943"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="43344943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 23:01:09 -0800
X-CSE-ConnectionGUID: gS3WdjgcSFi2d3vdSFPEHQ==
X-CSE-MsgGUID: jWkKkFnITnuUf0y8FngvHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="116945925"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Feb 2025 23:01:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th1JS-0011BL-2Y;
	Sun, 09 Feb 2025 07:01:06 +0000
Date: Sun, 9 Feb 2025 15:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 110/110]
 drivers/mmc/host/mtk-sd.c:3249:1: error: redefinition of '__inittest'
Message-ID: <202502091451.27w5MhNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   cb6612a57bbcc77b70a9fc1c521c14c48303714d
commit: cb6612a57bbcc77b70a9fc1c521c14c48303714d [110/110] msdc: multi-slot support
config: x86_64-buildonly-randconfig-006-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091451.27w5MhNt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091451.27w5MhNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091451.27w5MhNt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/mtk-sd.c:12:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mmc/host/mtk-sd.c:3249:1: error: redefinition of '__inittest'
    3249 | module_platform_driver(mt_msdc_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   drivers/mmc/host/mtk-sd.c:3238:1: note: previous definition is here
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/mmc/host/mtk-sd.c:3249:1: error: redefinition of 'init_module'
    3249 | module_platform_driver(mt_msdc_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^
   drivers/mmc/host/mtk-sd.c:3238:1: note: previous definition is here
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^
>> drivers/mmc/host/mtk-sd.c:3249:1: error: redefinition of '__exittest'
    3249 | module_platform_driver(mt_msdc_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:139:42: note: expanded from macro '\
   module_exit'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
   drivers/mmc/host/mtk-sd.c:3238:1: note: previous definition is here
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:139:42: note: expanded from macro '\
   module_exit'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
>> drivers/mmc/host/mtk-sd.c:3249:1: error: redefinition of 'cleanup_module'
    3249 | module_platform_driver(mt_msdc_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:141:7: note: expanded from macro '\
   module_exit'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   drivers/mmc/host/mtk-sd.c:3238:1: note: previous definition is here
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:141:7: note: expanded from macro '\
   module_exit'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   1 warning and 4 errors generated.


vim +/__inittest +3249 drivers/mmc/host/mtk-sd.c

208489032bdd8d Chaotian Jing 2015-06-15  3248  
208489032bdd8d Chaotian Jing 2015-06-15 @3249  module_platform_driver(mt_msdc_driver);

:::::: The code at line 3249 was first introduced by commit
:::::: 208489032bdd8d4a7de50f3057c175058f271956 mmc: mediatek: Add Mediatek MMC driver

:::::: TO: Chaotian Jing <chaotian.jing@mediatek.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
