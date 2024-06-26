Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15E15F316
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391370; cv=none; b=sz7DL6lUUzzCO+0AF8uae3EN614D5+OCxlHL/MkLR3/TOG+mBNAaY6YiPkmpf91XSLGuxd9gxy6br1MFIFfbzERRWvU0dZgPHIQ3Ae5pB+9Etyvp5SEl10RlXzuqhScpJgktB0vlQm4EsvhWTsXG6/8gcXmuXxK5uikofp3nmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391370; c=relaxed/simple;
	bh=qao5bTj/QClbNEMPhKKifVwUjcMCWqaywQ2Wf5BjnX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmSIaqfcXntJIn38NW73R+tPRCVkWR6Apr6H3Uinw0QVVN3pbbNGuxdUY0D8gLEwyaYwalGek0WtETkX3mwKvNFkYyHF29EbFYO/4r7F0w4654GmR58jSqL4hBWMuv6WgK1IXsV7ZXMTvDWtHUAgg72sAUpUP420ox78qR9iPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PljPKhX2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PljPKhX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719391369; x=1750927369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qao5bTj/QClbNEMPhKKifVwUjcMCWqaywQ2Wf5BjnX4=;
  b=PljPKhX2uKEUVd0/rAqLQVc48ZwBl2YtEkT3w8FJ4vAb9ouU+sxpJOC3
   JYOxBn5XjKL5c3CAz6npunk4/AJgnIhSfITNnC3kTHITwPvT7odryDu+T
   m/+djm7Qta3xO9uMMs3g/BUpvQIrGi+WTLQDNztyW9kamleOupBQs6cfl
   UB4MmXBJfeehY1sXo16ytOjJL46CMNP2c0D1/yzqhEuVyoFfgLJhsQUqv
   9sGjsoSlAI5OmQhkaBWcucbYO57wTtpIIY5OfF/AAg5oESGLqhRjhL2z+
   I8BBotRUqUjnhTXUF2uKH4FZzaGjXdVyyAQZvdJUoiH32WCXK2WRFUvqC
   Q==;
X-CSE-ConnectionGUID: we/cTFdjRK+U8lLu0fk95g==
X-CSE-MsgGUID: yQxjRDMbQQm6JFAGUhnUdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27136915"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="27136915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 01:42:48 -0700
X-CSE-ConnectionGUID: ohZUNYfOTCWV6bPjGhVXHw==
X-CSE-MsgGUID: Lx5LzpscSmKk4kHU0Ylpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="44021696"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jun 2024 01:42:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMOEm-000F7u-2t;
	Wed, 26 Jun 2024 08:42:44 +0000
Date: Wed, 26 Jun 2024 16:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [linux-next:master 699/8232]
 arch/loongarch/include/asm/page.h:15:25: error: conversion from 'long
 unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536'
 to '0'
Message-ID: <202406261639.fXgtH165-lkp@intel.com>
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
config: loongarch-randconfig-r122-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261639.fXgtH165-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240626/202406261639.fXgtH165-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261639.fXgtH165-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/gpu/drm/omapdrm/omap_gem.c:7:
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
>> arch/loongarch/include/asm/page.h:15:25: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
      15 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:757:42: note: in expansion of macro 'PAGE_SIZE'
     757 |                                          PAGE_SIZE);
         |                                          ^~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
>> arch/loongarch/include/asm/page.h:15:25: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
      15 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:1503:65: note: in expansion of macro 'PAGE_SIZE'
    1503 |                         block = tiler_reserve_2d(fmts[i], w, h, PAGE_SIZE);
         |                                                                 ^~~~~~~~~
   cc1: all warnings being treated as errors


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
