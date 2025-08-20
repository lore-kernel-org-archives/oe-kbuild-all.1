Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B24322A13
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705780; cv=none; b=XOUy3fo05yCd8PoISQFiUC4X6exnSEiODwEd89xTrAU5vLkoBCtAS1Ijsx/LtQo1+8++5GDZGefdUW9i+W035xN1RNRAhJfYsOuLd/Zksc/BYg+V+hRQMavFcjw12tDnyesQYl9I5HPocLGD8NRD3UTC6Gtx8stPrFRHbHBSpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705780; c=relaxed/simple;
	bh=/E+DjOFER+K3YnXi30rvBUkl3UQBHVRmm7zOQiAZTgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkAe4rou3Zw5ujhJqOIQdtbfIj2R4cOs1Y26Nrxl1KMRfGG5o1rH3x2QrY+D8tmIOTgfhTrYOw+PHVVAafjm0CBMtvHL3rORzYCkl7kDH37diLAK51DhVyx0YLK9GkVqzVThUKZ8vDaLO26Z9q9OueEU85V7S9ZXF2yJW4vbzT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6S4wzyF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6S4wzyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755705776; x=1787241776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/E+DjOFER+K3YnXi30rvBUkl3UQBHVRmm7zOQiAZTgA=;
  b=X6S4wzyF1BwJEpFuqIVk0Tg8jm2rqLV118KoGN+sNMPCDAmPccCUe7Z2
   i8clnSJ2oIGxNtmxk2TP73Ho7FJLcZWgwpDDPNEdm9eP6oEj3Is7BMjdW
   4Q53r86gv8S/QTPPBMQxvl3DlPRhr9K7RFX5TV9a1IoPTbxs6Y6yLVahT
   fFCFcjIXUJX6Nm66egW4sYDI4mSlIJtwKMNNJg5CK3Tmhpu0radbydE4s
   xKh8YVFpasDialC0cSDtVNaEJLSnmVTMe86mNPawt3OiBywqxI4c80mTs
   cEstKkAV5lMgBgwM5ZfViwmI4SHD4nw56E1kItKT0b+yMgzsMewrrnlrD
   Q==;
X-CSE-ConnectionGUID: HjZ9xk5CSneaLcl0JSwlkw==
X-CSE-MsgGUID: n4W6IPL8T3+B/u0ECJM8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57930147"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57930147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 09:02:55 -0700
X-CSE-ConnectionGUID: aLwv5tYKRI6HWVq3Dj/RHw==
X-CSE-MsgGUID: yjpKxSb9SpiS4WIWVF3ZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="191850462"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Aug 2025 09:02:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uolH2-000JSJ-11;
	Wed, 20 Aug 2025 16:02:52 +0000
Date: Thu, 21 Aug 2025 00:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2697/2697]
 arch/arm64/include/asm/cputype.h:163:9: error: "PHYTIUM_CPU_PART_FTC862"
 redefined
Message-ID: <202508202358.M9ZVaaay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   86390838db4d0ee205e00d4069a8fdb3e6f0d1d1
commit: 86390838db4d0ee205e00d4069a8fdb3e6f0d1d1 [2697/2697] !16528 [OLK-6.6] dma: phytium: Add PSWIOTLB mechanism to improve DMA performance
config: arm64-randconfig-004-20250820 (https://download.01.org/0day-ci/archive/20250820/202508202358.M9ZVaaay-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508202358.M9ZVaaay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508202358.M9ZVaaay-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/test_bitops.c:9:
>> arch/arm64/include/asm/cputype.h:163:9: error: "PHYTIUM_CPU_PART_FTC862" redefined [-Werror]
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:23,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from lib/vsprintf.c:22:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:23,
                    from include/linux/radix-tree.h:14,
                    from include/linux/idr.h:15,
                    from lib/test_ida.c:9:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/test_ida.c:16:6: warning: no previous prototype for 'ida_dump' [-Wmissing-prototypes]
      16 | void ida_dump(struct ida *ida) { }
         |      ^~~~~~~~
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/clk/clkdev.c:9:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/debug_locks.h:6,
                    from include/linux/lockdep.h:23,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/clk/clk-cdce925.c:13:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-cdce925.c: In function 'cdce925_probe':
   drivers/clk/clk-cdce925.c:717:41: warning: '%d' directive writing between 1 and 11 bytes into a region of size 3 [-Wformat-overflow=]
     717 |                 sprintf(child_name, "PLL%d", i+1);
         |                                         ^~
   drivers/clk/clk-cdce925.c:717:37: note: directive argument in the range [-2147483641, 2147483647]
     717 |                 sprintf(child_name, "PLL%d", i+1);
         |                                     ^~~~~~~
   drivers/clk/clk-cdce925.c:717:17: note: 'sprintf' output between 5 and 15 bytes into a destination of size 6
     717 |                 sprintf(child_name, "PLL%d", i+1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/oid_registry.c:8:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/oid_registry.c:15:10: fatal error: oid_registry_data.c: No such file or directory
      15 | #include "oid_registry_data.c"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/crc64.c:36:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/crc64.c:39:10: fatal error: crc64table.h: No such file or directory
      39 | #include "crc64table.h"
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from arch/arm64/include/asm/cache.h:49,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/cpufeature.h:11,
                    from arch/arm64/include/asm/assembler.h:21,
                    from arch/arm64/include/asm/linkage.h:5,
                    from include/linux/linkage.h:8,
                    from arch/arm64/kernel/vdso/sigreturn.S:15:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/cpufeature.h:11,
                    from arch/arm64/include/asm/assembler.h:21,
                    from arch/arm64/kernel/vdso/note.S:15:
>> arch/arm64/include/asm/cputype.h:163:9: warning: "PHYTIUM_CPU_PART_FTC862" redefined
     163 | #define PHYTIUM_CPU_PART_FTC862         0x862
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:110:9: note: this is the location of the previous definition
     110 | #define PHYTIUM_CPU_PART_FTC862 0X862
         |         ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/PHYTIUM_CPU_PART_FTC862 +163 arch/arm64/include/asm/cputype.h

730ffb45f56dda Easwar Hariharan 2024-03-20  162  
f1e1cfa896d1e8 yuanxia          2025-06-13 @163  #define PHYTIUM_CPU_PART_FTC862		0x862
f1e1cfa896d1e8 yuanxia          2025-06-13  164  #define PHYTIUM_CPU_SOCID_PS24080	0x6
f1e1cfa896d1e8 yuanxia          2025-06-13  165  

:::::: The code at line 163 was first introduced by commit
:::::: f1e1cfa896d1e8d4b7e992a22131b2587bafac78 iommu: smmuv3: Not print information of SMMU 0x10 event

:::::: TO: yuanxia <yuanxia2073@phytium.com.cn>
:::::: CC: yuanxia <yuanxia2073@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
