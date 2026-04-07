Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E75337473A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533944; cv=none; b=S+XaZ+YndADawMBE5DyQ74aTTbfGg4EdpueROwFNMZ1Q9ooWfMC+tUhaaB7w/IQGv1B6Ef/Y3L3OKrJKgPiZSRpwF8sANi1kC1sMY9LPXsP4O0dV/gm+nM4H+mNr0ho5NJOXMbulTCqzSlhRf5hLcmb6deub0ZTInrbvbSLXs94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533944; c=relaxed/simple;
	bh=h75e6pzqN+9IKiQofLLICcJHjwrynn8MOf60IaPtSjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lL6HPogwqAsvSIhylI8ZwAvXkg7lMpPUOfucRG3hzvhU5kHecOISJVLR5KEfdBx5U0Senq8P2X6x8Z0p9b0uMpRjfDKHTHQ9CNVPZe1RiL7xVvd1nwJ+YBUODJkjeVzV/XfhRxFapjCUcdPOAkTeVq43Me+m3EiN+y7Hh3labGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6ceQ8ze; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6ceQ8ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533943; x=1807069943;
  h=date:from:to:cc:subject:message-id;
  bh=h75e6pzqN+9IKiQofLLICcJHjwrynn8MOf60IaPtSjE=;
  b=L6ceQ8zeYO23q9O3w0PMEQVCGKPW1bnFkGctlWw07boOu5YV0v1AlIAW
   EQ9GQLz/JDgHpWNUL9PHzV/nGhhZ2N1sc0fk9FPO8yISz9OjVyksWv9UD
   zkpvp5o/SU0EaLhV8IJ8xe1yjB7vwuZfGLEJk46eHv6iZoIWh1EOJvBqp
   qgYHYxPObXYy/rcOaE6kJjx6LPgn0S4R8WoSeoTi9/lCGfisrKsCqAYNT
   3p/V5Y1q02LAKJpnYcZHT0LhO8dFCg7NipGArV40nay+DUwg3llaa9WER
   NsOaeAgZnM2XvdWuM4r0Omxb/gFVQMHONgjpEUPxwpik+qqVie20b6vEB
   A==;
X-CSE-ConnectionGUID: aIbBp9ZZTEGT+bL26yFYlg==
X-CSE-MsgGUID: pKpfcE2YRGqwxDReRN/QFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781482"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781482"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:52:22 -0700
X-CSE-ConnectionGUID: rPihfqcFTKe39C0vmfyJfw==
X-CSE-MsgGUID: ju84lHdCRI6hkM9lQp7cEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224842911"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 20:52:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xUA-0000000002p-3cEA;
	Tue, 07 Apr 2026 03:52:18 +0000
Date: Tue, 07 Apr 2026 11:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 37/53]
 include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from
 constant value (fffffffffffe0 becomes ffffffe0)
Message-ID: <202604040634.awwK9NXp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   d8111155f1ff04f4ca8c06c33de4e12b7e13f3c4
commit: 9a42cb9e1485a8513bfa9d9822c7ddef1b3dc506 [37/53] iommupt: Add the 64 bit ARMv8 page table format
config: i386-randconfig-r134-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040634.awwK9NXp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040634.awwK9NXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040634.awwK9NXp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_armv8.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
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
6606c8c7e81886 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
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
