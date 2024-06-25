Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7EF178399
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345099; cv=none; b=t4nQKb80hUZMA1BdaQYEdxRRHw2yYLOxQEuD2HFd9Lo6vmawEi4unwVfQ35MGC5bzFlUhW36wZVAy4TOayJzsxys8vIhDD00NiIMDbwEAu60mDzUVhpl3+APK2/DslPD2TWvbFswHjpB8UE7RGwHtVN/Mka2KGNlXT0ly/cb8GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345099; c=relaxed/simple;
	bh=KWF6byOWZLUHS7e3fwQidGJoOP0P4iFAgIj+VBWAA2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Om4hWLcSpSFhJ74rRF61F0nvc2CTT0EPjxn7gRnluF2XYc/T+6a7Lf4/oU/zLc5CuG6uxdz2DY5PpUXLXaL23/wM5ADW6M58dMB4IXIxpvQOZiXUSov9VbWgGiVdT3OAq9WmkANtaq+zfHDa8kVvagg9l0xM6OlKC0Zk9fHfl5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLvEXaDe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLvEXaDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719345097; x=1750881097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWF6byOWZLUHS7e3fwQidGJoOP0P4iFAgIj+VBWAA2k=;
  b=JLvEXaDe2b0AgmvnKF8OjbPRl2tEdhYkyEDI+c8q3lxUf+gS2rak749F
   U96UM61Z3XoV7MTErypWqyHYctnrrawnIip3HNNCOvXAOPwcRldP2QCHW
   ftjvC/LRCLHiWDzby3torF5SfzMEEVT31AFjFc+8L1MQPvGsg4xzuAmR3
   HuDEWTVXfv1DWtHzpKFiRheoBw23tYFlj1q42mS8ozndiq93gOFOgk5Ef
   DPfnKgazNz8254geCMduU/DLLUnw4waMjV1FlDSVUfFCBJ3jLJuRMY7Bi
   OFdnbJ+TWFDNKWL3XFLe74XZxClSXXHF9ackSci5OjHsEFYw8PP9xgV+0
   A==;
X-CSE-ConnectionGUID: xyJ6JbOPRa2KZniNQpA3vA==
X-CSE-MsgGUID: 3sOahRePSJi6vlAQKwEr3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="26975435"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="26975435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 12:51:36 -0700
X-CSE-ConnectionGUID: o/6zHioNQq6WeMmNGr3XCw==
X-CSE-MsgGUID: HgHP1CGbRBmieJ0u2NT7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="81289397"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2024 12:51:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMCCS-000EgU-36;
	Tue, 25 Jun 2024 19:51:32 +0000
Date: Wed, 26 Jun 2024 03:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [linux-next:master 699/8232]
 arch/loongarch/include/asm/page.h:15:25: warning: conversion from 'long
 unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536'
 to '0'
Message-ID: <202406260332.708z8QIw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb [699/8232] drm/omap: Allow build with COMPILE_TEST=y
config: loongarch-randconfig-r081-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260332.708z8QIw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260332.708z8QIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260332.708z8QIw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/gpu/drm/omapdrm/omap_gem.c:7:
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
>> arch/loongarch/include/asm/page.h:15:25: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Woverflow]
      15 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:757:42: note: in expansion of macro 'PAGE_SIZE'
     757 |                                          PAGE_SIZE);
         |                                          ^~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
>> arch/loongarch/include/asm/page.h:15:25: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Woverflow]
      15 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:1503:65: note: in expansion of macro 'PAGE_SIZE'
    1503 |                         block = tiler_reserve_2d(fmts[i], w, h, PAGE_SIZE);
         |                                                                 ^~~~~~~~~


vim +15 arch/loongarch/include/asm/page.h

09cfefb7fa70c3 Huacai Chen   2022-05-31  10  
09cfefb7fa70c3 Huacai Chen   2022-05-31  11  /*
09cfefb7fa70c3 Huacai Chen   2022-05-31  12   * PAGE_SHIFT determines the page size
09cfefb7fa70c3 Huacai Chen   2022-05-31  13   */
ba89f9c8ccbad3 Arnd Bergmann 2024-02-23  14  #define PAGE_SHIFT	CONFIG_PAGE_SHIFT
09cfefb7fa70c3 Huacai Chen   2022-05-31 @15  #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
09cfefb7fa70c3 Huacai Chen   2022-05-31  16  #define PAGE_MASK	(~(PAGE_SIZE - 1))
09cfefb7fa70c3 Huacai Chen   2022-05-31  17  

:::::: The code at line 15 was first introduced by commit
:::::: 09cfefb7fa70c3af011b0db0a513fd80b2f18abc LoongArch: Add memory management

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
