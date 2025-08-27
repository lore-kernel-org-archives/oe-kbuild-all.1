Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DC27B345
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315544; cv=none; b=rH+/apXzQtNUbv9WisSfUQ7+7/jWwoaisBi8MqBoATtBSUpPRrADjwwWLhlbJzcIp9EdToQjxMPBdosVnkNzZ1/ctEoHK6vhRe9EK6AF/h5/pUBQJcESMHtt30gxfj0LSXyCYgI7lprG+xQSjft43KmTtNA5Nz0AIfdTGj9F8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315544; c=relaxed/simple;
	bh=zuh3QLiHrExnYfTJmjhNZbVkMhAL7W2Eqftal6ZiA5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7Ao9LMLt7Y6F4sIXqhEOTmilIbQdUbN72bAxmU9CY4MXSj2SAnQWGjqhhAntQHVeniiQW0EK8kUidGRJRc65GOAkqORiKi6KtUT/CoKUYDjNdOe0hdkl2NHmR769c4N+J0A4+jkNj4pdo/ofWmbGX7SqOrThWFXw0s+GGaXDg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN9OAa+7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN9OAa+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315543; x=1787851543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zuh3QLiHrExnYfTJmjhNZbVkMhAL7W2Eqftal6ZiA5s=;
  b=iN9OAa+7XXuxdt5XpBA4WBz8v5DXBFOuOFn2csutigGQDQI8r0UJxWHC
   MDtWDa1qM315ZY2ZpkpIByHyrkRGU5jIAjCmVL7MCFFDCmolWeD2AaPrK
   bOPdtB7RUuAq61d+QptEVTLp8In2ZGs2EicE3ELhXSUytO64fJemt201k
   5LpGZdUH0GCUTIlSXeNdGYTvjqtgrUKxkY2K78+s5rb/R09HTEqu73Fyy
   ZwVrJzYgzgeg1WD/BMxZ11/r6xTLE8QzReIsTlJZaFUaiQNyHfrq+RLIM
   n070uNcY+Y2LLmjWCAAaYqLF3gkIrfQ3tofQLuP72xVvF9LXR5FvVfLD2
   Q==;
X-CSE-ConnectionGUID: ByTGWf3JTze3CrDw7uDwIQ==
X-CSE-MsgGUID: HfyLxRdzTQOMSBFnC7z+WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81167405"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81167405"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:25:42 -0700
X-CSE-ConnectionGUID: NDfg0Nm5R72f9DO/y1/DFw==
X-CSE-MsgGUID: Nz/3btW4QHunfgzmNM4w4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169492320"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2025 10:25:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJtn-000T71-1d;
	Wed, 27 Aug 2025 17:25:31 +0000
Date: Thu, 28 Aug 2025 01:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 35/56] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (fffffffffffe0
 becomes ffffffe0)
Message-ID: <202508280126.qX8Tyh0T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   451e6e58d3fc7e3c1eb9a6d5bfb5d5da4b088133
commit: 6eda1a06a0de24ee3bb1b27ff4a4e47ea6063f9b [35/56] iommupt: Add the 64 bit ARMv8 page table format
config: i386-randconfig-063-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280126.qX8Tyh0T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280126.qX8Tyh0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280126.qX8Tyh0T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_armv8_16k.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
--
   drivers/iommu/generic_pt/fmt/iommu_armv8_64k.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffffe0 becomes ffffffe0)

vim +273 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  261  
952043ac12a117 Steven Whitehouse  2009-04-23  262  /**
952043ac12a117 Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  265   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  269   */
9c313ccdfc079f Thorsten Blum      2024-04-21  270  static inline unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  271  {
952043ac12a117 Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  279  }
952043ac12a117 Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
