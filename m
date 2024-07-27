Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A971E521
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 15:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722093167; cv=none; b=K+7IFSVWBhQLtziltsATamLETJbEyhq0mGF/ff4xvffJrNIK04VgU9hgweT3fV1fIf+wigZDuRXowe/DzOHclVqmUaitnXAlQ7CXK9VOV65kRpc304BudVqWCAcvTyjoKn0Ty9yvOdTL5djtEghznEgeBIg3oDdyEdEvnrGoAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722093167; c=relaxed/simple;
	bh=4/3Wu2eH+lOEdEgVAvQ+F+HyP3pPxOexR5si9pgbU/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NE+bhjeFl8QRogxr/+NK/zK0Xr4UeNpUGzzywtl+FYVyTqPULAY8hNl3+93O7P+KrjnYY+y/k+xveOUUlnC6odZqB+vCVDpVQcU54fTuFnflajxq+kVhRPgjWNfndJlFIJ2mKBno09L0R8LevDlT92oOofT3RLEyp7ufi7bCLEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXunEG48; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXunEG48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722093165; x=1753629165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/3Wu2eH+lOEdEgVAvQ+F+HyP3pPxOexR5si9pgbU/A=;
  b=DXunEG48s76ujZ6ZD6KcTtdPV9dQwfuQtp4kaEvvkhxSj+qyedG2raOb
   K1HOGXcgkmDYHddJ7/TMCi6RN2pZKdM2Tuu3F08w3B5FN2F6MBQTu/mtD
   3z8iMTmmdHueyNlpDcbc7F1nWa8rGlP92Voa0Q7qf+GJMBhnKyXKiFSx6
   IAJdOSIYfJBHnTbIewlHdxtPReVWZof9r8GAl/zeLpaX6rRdtjQtRHnqP
   08nNG8qkJ3dt0VKJ2bBW9VdZ3ihXbrHUiKjGvWRbp2GnAHoLbUr8hNQlT
   bIFFVLfZNRrwUNMclDf8XZ88yJe7OGRxQZjRWDsaOJ0oUy8L6p5VJLdsg
   A==;
X-CSE-ConnectionGUID: nc432ktzSeGptqhxLX5Hlg==
X-CSE-MsgGUID: l1ftDfBHS0qDBpxIJPWF1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="19482028"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="19482028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 08:12:32 -0700
X-CSE-ConnectionGUID: qaVTtw0ARoSYSMqyEu2fXg==
X-CSE-MsgGUID: AR3dr3cWTUCYPCUAxaHVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="54324658"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jul 2024 08:12:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXj5u-000q0O-1K;
	Sat, 27 Jul 2024 15:12:26 +0000
Date: Sat, 27 Jul 2024 23:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 21/25]
 drivers/iommu/generic_pt/pt_defs.h:111:9: error: assigning to 'typeof
 (*(__ai_ptr))' (aka 'unsigned long long') from incompatible type 'void'
Message-ID: <202407272343.kRNKueTH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   ea5c6d0c8914861c8e337228c4880001bf40f7c4
commit: 2c39e478f1bbc1680ad47e8b418bbd76701a4496 [21/25] iommupt: Add a kunit test
config: hexagon-randconfig-r054-20240727 (https://download.01.org/0day-ci/archive/20240727/202407272343.kRNKueTH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272343.kRNKueTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407272343.kRNKueTH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/pt_alloc.c:107:
>> drivers/iommu/generic_pt/pt_defs.h:111:9: error: assigning to 'typeof (*(__ai_ptr))' (aka 'unsigned long long') from incompatible type 'void'
     111 |         return try_cmpxchg64_release(entryp, &old_entry, table_entry);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4937:2: note: expanded from macro 'try_cmpxchg64_release'
    4937 |         raw_try_cmpxchg64_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:295:7: note: expanded from macro 'raw_try_cmpxchg64_release'
     295 |         ___r = raw_cmpxchg64_release((_ptr), ___o, (_new)); \
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/generic_pt/pt_alloc.c:108:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iommu/generic_pt/pt_alloc.c:108:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iommu/generic_pt/pt_alloc.c:108:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   6 warnings and 1 error generated.


vim +111 drivers/iommu/generic_pt/pt_defs.h

238517582c3f63 Jason Gunthorpe 2024-06-28  104  
238517582c3f63 Jason Gunthorpe 2024-06-28  105  	/*
238517582c3f63 Jason Gunthorpe 2024-06-28  106  	 * Ensure the zero'd table content itself is visible before its PTE can
238517582c3f63 Jason Gunthorpe 2024-06-28  107  	 * be, be careful about !SMP
238517582c3f63 Jason Gunthorpe 2024-06-28  108  	 */
238517582c3f63 Jason Gunthorpe 2024-06-28  109  	if (!IS_ENABLED(CONFIG_SMP))
238517582c3f63 Jason Gunthorpe 2024-06-28  110  		dma_wmb();
238517582c3f63 Jason Gunthorpe 2024-06-28 @111  	return try_cmpxchg64_release(entryp, &old_entry, table_entry);
238517582c3f63 Jason Gunthorpe 2024-06-28  112  }
238517582c3f63 Jason Gunthorpe 2024-06-28  113  

:::::: The code at line 111 was first introduced by commit
:::::: 238517582c3f6345ebaf2eecc116501f67de8d7c genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
