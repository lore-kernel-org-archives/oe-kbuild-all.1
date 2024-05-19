Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E17492
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 May 2024 03:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716089881; cv=none; b=aYuYC8mg67tz7hUyq3oNo1D4heDBKHcVQTYp1FHtiYzMNM1hRvHqMKp2xIZ69yKMR6ZOnFdVzL1y5h7kayWCaHbKevIJYu3/XBgWQLq5pW4vLv3bHy9tOfOKZ9t1tDNNCDHRyPpIZ0hgrqE8jMQsIw9PfUeivCeF4hHndPDhE1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716089881; c=relaxed/simple;
	bh=QhL+PTYA64xuE9Wh/B3sut8MHzJ4yCUNt2ix0mfY/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdF7gP9r3//csQJtTpR9VqGDDqacVlhMF0ST4Ov71QzDGy/PKhrQdqMzOPgTXIboSKV9yyNm1qNasjszQbSoUxmr8ynmEfkSAfL/UVTdRXwTatOhqfPV79QNzXmozCY537CEXKI2mebMDRpbrmbx4ZWKJgEcp971TRoeKbWnxY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJLWZ/Rm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJLWZ/Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716089879; x=1747625879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QhL+PTYA64xuE9Wh/B3sut8MHzJ4yCUNt2ix0mfY/Z4=;
  b=nJLWZ/RmPE/eevSLyZc6sHiuzWdNQAR+h4DMYuC9E1UMeF30iWR/yKGv
   SNLUTFfCb9JBikRnaYYDSTaJ8Tzu5VFTxk6o6bl/gKXbePh/q9HFz/khF
   g+jm9QXxT8sGA6tbvigVJbylyBwfe6TRldhE0BKrAlE/C9jXgTk4hAIP6
   lQU4D0MActws3hF3mkKg4sg+WZBaBgLemrWLkWBrLzK8I16ml4W4ND5sv
   5tUgWqFtScklBJajRwzqGycL4ibl80Zd8LsEKmD/bsdKGSIQVVDhFSQAI
   cORtH8YV89RbzNOPXZhJAApKCFlAsXDFtV/9Fe8pprC+a39TBK6LEUWpf
   A==;
X-CSE-ConnectionGUID: N5NKvipATrWD+I+5nLVePA==
X-CSE-MsgGUID: Sdo8X2UfQciAVyJxHa/giw==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="15183985"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="15183985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 20:37:59 -0700
X-CSE-ConnectionGUID: K2LXhISGQTa0kv/QqNzhIw==
X-CSE-MsgGUID: 4cEfOdYfSwu2IGC+DsZc4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32032445"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2024 20:37:56 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8XMn-0002uG-2U;
	Sun, 19 May 2024 03:37:47 +0000
Date: Sun, 19 May 2024 11:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [drm-misc:drm-misc-next 7/10] arch/powerpc/include/asm/page.h:25:33:
 error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned
 int'} changes value from '65536' to '0'
Message-ID: <202405191159.VZqjxILr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   85cb9d603953d77de5cb311d229a79c439ff6bfb
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb [7/10] drm/omap: Allow build with COMPILE_TEST=y
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405191159.VZqjxILr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191159.VZqjxILr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191159.VZqjxILr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/mmu.h:144,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/gpu/drm/omapdrm/omap_gem.c:7:
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
>> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:757:42: note: in expansion of macro 'PAGE_SIZE'
     757 |                                          PAGE_SIZE);
         |                                          ^~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
>> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
      25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_gem.c:1503:65: note: in expansion of macro 'PAGE_SIZE'
    1503 |                         block = tiler_reserve_2d(fmts[i], w, h, PAGE_SIZE);
         |                                                                 ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +25 arch/powerpc/include/asm/page.h

5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  17  
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  18  /*
e12401222f749c arch/powerpc/include/asm/page.h Yuri Tikhonov    2009-01-29  19   * On regular PPC32 page size is 4K (but we support 4K/16K/64K/256K pages
555f4fdb93e70d arch/powerpc/include/asm/page.h Christophe Leroy 2019-02-21  20   * on PPC44x and 4K/16K on 8xx). For PPC64 we support either 4K or 64K software
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  21   * page size. When using 64K pages however, whether we are really supporting
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  22   * 64K pages in HW or not is irrelevant to those definitions.
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  23   */
d3e5bab923d35f arch/powerpc/include/asm/page.h Arnd Bergmann    2024-02-26  24  #define PAGE_SHIFT		CONFIG_PAGE_SHIFT
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11 @25  #define PAGE_SIZE		(ASM_CONST(1) << PAGE_SHIFT)
5cd16ee934eafc include/asm-powerpc/page.h      Michael Ellerman 2005-11-11  26  

:::::: The code at line 25 was first introduced by commit
:::::: 5cd16ee934eafca74a6bb790328950cec68a8b78 [PATCH] powerpc: Merge page.h

:::::: TO: Michael Ellerman <michael@ellerman.id.au>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
