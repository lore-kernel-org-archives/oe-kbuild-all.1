Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3E2031C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706291949; cv=none; b=pd8B1vCjI7v4FH93H6wFnnvOczgkJGBHtgbVn5OQOntExUcOx1XXCkjEP8KtNAwrYeAGOmqWc/Y9RnBDAKjeLyx1QC3Gqf0qPny3OOCVJa77u6T0CeK7QZG4ACUoliUdcbW2ytIw9+4sPwlPEyIc6/l0UrbjytN6IDnl0JdhwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706291949; c=relaxed/simple;
	bh=T+CyxAcOarZEoQCKuEjEIIApqrzcaGr6TmcdYd6knoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLqDXd/gKhQzgb8R5Be5eLKIMzpd0N4rhijuAOQMZ6ZLkoQJ3/5+Y4u+JJnVepu1SnOAqtufeASmcnGL82OxRmWJmUABOuqmz2NW/On8cs+ioSf7TFQ08l5eZV78mKB6OsIy9XqepbTSy3JcdPMioGvmTuPtl3iQhf2hmi91E7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQsx/HxC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQsx/HxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706291947; x=1737827947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+CyxAcOarZEoQCKuEjEIIApqrzcaGr6TmcdYd6knoM=;
  b=RQsx/HxC98cJyDF/tYNWO7vc3b/CTqAf7nP/u7qwUAvmWlj50A9h/WfL
   Lr6S8zgTWJVJYXc4oGm/KyqS8vW4iSTX9pQEqcv1l+8F3lDwfAUvxcnXL
   ep3ew9+RnebtyPl51yVVUCrGbIJfniG7zbkXWw9HjABMecr+pdevckcsa
   taRZ44gu3k5+meXF9tcfxf4BS5mmM4GLGhP5OIy6kq7hAffNSxVpa2LyF
   7Jh4b6KE6/vi/wEeX/y3R6GVnFHgd9oGBhrQ5BKqpY1kPxzMoOG7Ojdyr
   LbW74x6d7h6UOYtdscHmZJ6uBkFGXfHVPCmL9eDVT/7PECjT2UWCxsAmT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="21075844"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="21075844"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 09:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2798071"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jan 2024 09:59:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTQTn-0001Fq-0L;
	Fri, 26 Jan 2024 17:59:03 +0000
Date: Sat, 27 Jan 2024 01:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:gs101-spi-vv2 36/46] include/asm-generic/io.h:990:25:
 error: conflicting types for 'iowrite8_32_rep'; have 'void(volatile void *,
 const void *, unsigned int)'
Message-ID: <202401270153.qAwqrjon-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day gs101-spi-vv2
head:   b148a8ab25375c3d984c42954bdb06e98a91ec8f
commit: 94c8c2611723d740346429150d721f7991cbaa42 [36/46] asm-generic/io.h: add iowrite{8,16}_32 accessors
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240127/202401270153.qAwqrjon-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270153.qAwqrjon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270153.qAwqrjon-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/io.h:270,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from arch/parisc/kernel/asm-offsets.c:21:
>> include/asm-generic/io.h:990:25: error: conflicting types for 'iowrite8_32_rep'; have 'void(volatile void *, const void *, unsigned int)'
     990 | #define iowrite8_32_rep iowrite8_32_rep
         |                         ^~~~~~~~~~~~~~~
   include/asm-generic/io.h:991:20: note: in expansion of macro 'iowrite8_32_rep'
     991 | static inline void iowrite8_32_rep(volatile void __iomem *addr,
         |                    ^~~~~~~~~~~~~~~
   In file included from arch/parisc/include/asm/io.h:244:
   include/asm-generic/iomap.h:87:13: note: previous declaration of 'iowrite8_32_rep' with type 'void(void *, const void *, long unsigned int)'
      87 | extern void iowrite8_32_rep(void __iomem *port, const void *buf, unsigned long count);
         |             ^~~~~~~~~~~~~~~
>> include/asm-generic/io.h:1010:26: error: conflicting types for 'iowrite16_32_rep'; have 'void(volatile void *, const void *, unsigned int)'
    1010 | #define iowrite16_32_rep iowrite16_32_rep
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/io.h:1011:20: note: in expansion of macro 'iowrite16_32_rep'
    1011 | static inline void iowrite16_32_rep(volatile void __iomem *addr,
         |                    ^~~~~~~~~~~~~~~~
   include/asm-generic/iomap.h:89:13: note: previous declaration of 'iowrite16_32_rep' with type 'void(void *, const void *, long unsigned int)'
      89 | extern void iowrite16_32_rep(void __iomem *port, const void *buf, unsigned long count);
         |             ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/parisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1195: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +990 include/asm-generic/io.h

   988	
   989	#ifndef iowrite8_32_rep
 > 990	#define iowrite8_32_rep iowrite8_32_rep
   991	static inline void iowrite8_32_rep(volatile void __iomem *addr,
   992					   const void *buffer,
   993					   unsigned int count)
   994	{
   995		writesb_l(addr, buffer, count);
   996	}
   997	#endif
   998	
   999	#ifndef iowrite16_rep
  1000	#define iowrite16_rep iowrite16_rep
  1001	static inline void iowrite16_rep(volatile void __iomem *addr,
  1002					 const void *buffer,
  1003					 unsigned int count)
  1004	{
  1005		writesw(addr, buffer, count);
  1006	}
  1007	#endif
  1008	
  1009	#ifndef iowrite16_32_rep
> 1010	#define iowrite16_32_rep iowrite16_32_rep
  1011	static inline void iowrite16_32_rep(volatile void __iomem *addr,
  1012					    const void *buffer,
  1013					    unsigned int count)
  1014	{
  1015		writesw_l(addr, buffer, count);
  1016	}
  1017	#endif
  1018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
