Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149728DA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722076048; cv=none; b=DR4lN0Q/k3HtK5Zf48Rjba8qChHC8yd4bXmolQBeGL2NqFCtTw/GKPEp+X+WIJJQ2fPdk9Rs2MBamS2k/0cC02A+IeyfUFuCPjeJ2vMBT2jSV5w2NhFLH9yEHieEI/S5kvDKnfO4o1ZLz9dPyIOadfeVdNxcnDbEInBkrhS1yZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722076048; c=relaxed/simple;
	bh=yMDJRz4IxLJfGmCqCWJJKduopjREhcCu8y5U2PT4T4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jx109m+Y0wTz5RS+ZV7YauyT9dOpwLDkFuf67F+GkiNqwq/TBeGq82LbrTbDNFPHGc0SaSJGjczHv6iVU0ty/mHAt+bC4Ta4o0nRefcGmkrlBjhnO7YXdi5gZGcCp/FZKfj7cmU/pNPSjxFkPyvMbLdqXaPa/EbBSFGUpDxk1RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CphTF8V+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CphTF8V+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722076046; x=1753612046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMDJRz4IxLJfGmCqCWJJKduopjREhcCu8y5U2PT4T4c=;
  b=CphTF8V+6WW7/x+WiIRn5Q2zFl86/HKeeyqcaF/kOKB0aH7x6v0Sr/DQ
   +z8+b5EURyTNRCpz4DQZHvRj/pUD378z1sxftIGZRYCtTcjV7RS5B4XZm
   vwD1LfaT5kmnQV8HDTOnS73kJxpLpFIIncIvsups1eXcvlr8T2Ob0/i1O
   S/7bQHzBMIkOWMBe4BSxL6Ch/PSeu4NIPqkty8HaBlBFQyE/A4wSkKX9V
   DFJBypQi+cYHzChk5xgwvJXAjxJ4g1LiGMVCec6CpSbplcgPaatKa/Mgv
   d/Rz0x/8KnXd5JkYamIQiK0ayEzZ+X0YSnklV41LsigHCyQX4OGg3HOEp
   A==;
X-CSE-ConnectionGUID: LU0ByW2SSs2MstjMhWzfnQ==
X-CSE-MsgGUID: jLpczZUgTZif0PyrBIDyBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23669865"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="23669865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 03:27:25 -0700
X-CSE-ConnectionGUID: 3zCUp+ydQpuoVGIS/bahQA==
X-CSE-MsgGUID: duy/izIRT4GdkTnd2xfkXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="57651536"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2024 03:27:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXee1-000prq-2v;
	Sat, 27 Jul 2024 10:27:21 +0000
Date: Sat, 27 Jul 2024 18:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 14/25]
 drivers/iommu/generic_pt/pt_defs.h:137:31: error: expected declaration
 specifiers or '...' before '{' token
Message-ID: <202407271810.0sKvC5BG-lkp@intel.com>
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
commit: 46d214b7baec51735b369a423ab6887a2a36ab01 [14/25] genpt: Add an allocator for page table levels
config: parisc-randconfig-r122-20240727 (https://download.01.org/0day-ci/archive/20240727/202407271810.0sKvC5BG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240727/202407271810.0sKvC5BG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271810.0sKvC5BG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/pt_alloc.c:107:
>> drivers/iommu/generic_pt/pt_defs.h:137:31: error: expected declaration specifiers or '...' before '{' token
     137 | static inline bool PT_WARN_ON({bool condition)
         |                               ^
   In file included from include/linux/dma-mapping.h:10,
                    from drivers/iommu/generic_pt/pt_alloc.c:108:
>> include/linux/dma-direction.h:12:19: error: storage class specified for parameter 'valid_dma_direction'
      12 | static inline int valid_dma_direction(enum dma_data_direction dir)
         |                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/dma-direction.h:12:19: warning: parameter 'valid_dma_direction' declared 'inline'
>> include/linux/dma-direction.h:13:1: warning: 'gnu_inline' attribute ignored [-Wattributes]
      13 | {
         | ^
>> include/linux/dma-direction.h:13:1: error: expected ';', ',' or ')' before '{' token


vim +137 drivers/iommu/generic_pt/pt_defs.h

238517582c3f63 Jason Gunthorpe 2024-06-28  129  
238517582c3f63 Jason Gunthorpe 2024-06-28  130  /*
238517582c3f63 Jason Gunthorpe 2024-06-28  131   * PT_WARN_ON is used for invariants that the kunit should be checking can't
238517582c3f63 Jason Gunthorpe 2024-06-28  132   * happen.
238517582c3f63 Jason Gunthorpe 2024-06-28  133   */
238517582c3f63 Jason Gunthorpe 2024-06-28  134  #if IS_ENABLED(CONFIG_DEBUG_GENERIC_PT)
238517582c3f63 Jason Gunthorpe 2024-06-28  135  #define PT_WARN_ON WARN_ON
238517582c3f63 Jason Gunthorpe 2024-06-28  136  #else
238517582c3f63 Jason Gunthorpe 2024-06-28 @137  static inline bool PT_WARN_ON({bool condition)
238517582c3f63 Jason Gunthorpe 2024-06-28  138  {
238517582c3f63 Jason Gunthorpe 2024-06-28  139  	return false;
238517582c3f63 Jason Gunthorpe 2024-06-28  140  }
238517582c3f63 Jason Gunthorpe 2024-06-28  141  #endif
238517582c3f63 Jason Gunthorpe 2024-06-28  142  

:::::: The code at line 137 was first introduced by commit
:::::: 238517582c3f6345ebaf2eecc116501f67de8d7c genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
