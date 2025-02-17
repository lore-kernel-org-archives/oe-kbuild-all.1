Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499A217647
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787323; cv=none; b=fWd8zp+INrEdyWmPNfbmGJryw9szj5WnhMwLGA8okeV3BtZzbO/jWjq1si5YxhGzbXL+kOyaMnBRaX6UMlO5z3HytNu6CszmEoDVnblELV8B0YAx06Dbl4PFn754o7n+71eZ9gLV55d8V5+auOaf46TjWReFbD2bQlw/704GAm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787323; c=relaxed/simple;
	bh=+QUc+Ep9XLzrFgpBjKFNFwDDK7m1cbWnZLZpbbb9XwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBfBD1BUHyuQV+SZP8xNqB3NRYFpZUWBNDE1woNscl8ELmTePnPHgppRZZsnc6jEf+RAgY/afVEM2TFLzqIP7HhYG3Y/08XEN8CfjSGb0w+eBVn7CyTtQEsTdMAgCG9yztzMxQlNUP0Yuqv38yxX6nmgluDUDHve7Oc585Fz0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doxYKzjJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doxYKzjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739787321; x=1771323321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+QUc+Ep9XLzrFgpBjKFNFwDDK7m1cbWnZLZpbbb9XwA=;
  b=doxYKzjJjBA6z7I27+wCALa+3Hk8ejgkpPiom0v6E7/UDR+mrtCRdi9w
   euwCNPNLkk/IOKIWNyUGvu6az4r8pZNxFyDqQ1UPkXi0NGDokknPd5NAN
   NIVd29ZClM4/HHk3tzmNTUCgh3thhYthlIP/3T6Cj4pJAIlU+/BAkVw3y
   tCtcTTbWBbXzipALE86EAw07Svt4i2gn2U5I5Wzu3oHNYKDy3cRRq2lTb
   RoSaIlAK6pxpi8x3hIl7+bZnpyI2rn8n040DOa2MuM2Zc7J61BKSBXDqT
   Qpb9q9hUYE2dwn+ieH5bBBj9CTxIar06iyAHz0PsjzDkD47dFjRcmqUCf
   Q==;
X-CSE-ConnectionGUID: 5Lt82DBJRhmWTxxXUPv52A==
X-CSE-MsgGUID: HldNpzgjQB6Q4J2zBGpjvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51445607"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="51445607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:15:20 -0800
X-CSE-ConnectionGUID: ERN1W0ZgS/KMAIPI9cCkNQ==
X-CSE-MsgGUID: CmJbOXmFT1y17IGDvtxM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137320958"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 02:15:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjy9k-001CyB-1e;
	Mon, 17 Feb 2025 10:15:16 +0000
Date: Mon, 17 Feb 2025 18:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:pr/56 1/1] include/linux/mmzone.h:1593:2: error:
 Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202502171833.B2rGYI7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: 7becae7cdff87cebf08a3a07fa30ca209f6ce16b [1/1] mm, treewide: redefine MAX_ORDER sanely
config: arm64-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171833.B2rGYI7D-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171833.B2rGYI7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171833.B2rGYI7D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/irqdomain.h:35:
   In file included from include/linux/of.h:17:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:15:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1593:2: error: Allocator MAX_ORDER exceeds SECTION_SIZE
   #error Allocator MAX_ORDER exceeds SECTION_SIZE
    ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                           set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return (set->sig[1] | set->sig[0]) == 0;
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here


vim +1593 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft     2005-06-23  1588  
835c134ec4dd75 Mel Gorman         2007-10-16  1589  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman         2007-10-16  1590  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman         2007-10-16  1591  
7becae7cdff87c Kirill A. Shutemov 2023-03-15  1592  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
d41dee369bff3b Andy Whitcroft     2005-06-23 @1593  #error Allocator MAX_ORDER exceeds SECTION_SIZE
d41dee369bff3b Andy Whitcroft     2005-06-23  1594  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1595  

:::::: The code at line 1593 was first introduced by commit
:::::: d41dee369bff3b9dcb6328d4d822926c28cc2594 [PATCH] sparsemem memory model

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
