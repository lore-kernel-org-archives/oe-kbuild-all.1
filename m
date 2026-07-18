Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF2230BDB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784359193; cv=none; b=Di997lqtF7dTkFJWMUvBx63k80Z96n0eVg6gLysIWRMshHC7O+YIkOGOpwei6EPKTrEPhFEHGxIgiEkpjVPNB/GRKCu51fWQh9QPGXD446WkDCoevxKL4iNnvLaXmhgqdIdUlNBv2AIy1O6vUAgQk/spPFOWEvFW1va+7pgdFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784359193; c=relaxed/simple;
	bh=ekNdAlfUrfV4G7NrrQ4wr6KN6sCQLd2Q/hLjHZLJscY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RaUseZvGUYFUPweOgL5Rcz+gOb9GDkk1aD31oXscudWSKhlOzgHhYH/7qUHjEkMbcWWMb4+3AYgJ5+U/hpGRNXEjKJ6J4i+TQ4Q2No3h3o33q6cWRdujB4Gg6OKZix3QgrcrLJIG/f6EAW1tGteNuZ85Hcen7x3w7V5sSSYtFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1w8d95g; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1w8d95g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784359192; x=1815895192;
  h=date:from:to:cc:subject:message-id;
  bh=ekNdAlfUrfV4G7NrrQ4wr6KN6sCQLd2Q/hLjHZLJscY=;
  b=j1w8d95gKiy7KI2dRtf/sgzziv8x6/BFGpsvsYKBPbkQLY3CluqRf2e7
   sQXhMGcYY8oON72tAihEWJ34QWYqqI27WUcfmwz3WHQt7bs1CrDUcjXPa
   Id99zv/kxXR73mu884r6F5kbKyitgIIrwv20c5e6PfTH8i2y2oHF/ZCDy
   ILEJrFF0K7HwkB0CrfmAN8Oj9R7mJBMQpQ5zTMr7JQGaAWP2Ar5dPwcIC
   ZOY7yz+wySwzlzBV600LEzDahwuUEs7A7h0sOdvxOPRVaXuIgt23DMJau
   x86aNHsrJLRBXeUlBcnOzh7hRlTmtft9hIeG/ro37Yx4wjDh3pZGhccoq
   A==;
X-CSE-ConnectionGUID: yrSHCT3KRYiKeRZxe7thFg==
X-CSE-MsgGUID: l/rvzJByRoG5Yx5SG1LhYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96529703"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="96529703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 00:19:51 -0700
X-CSE-ConnectionGUID: HLyMCmDuRj6JGDkhZP4r+Q==
X-CSE-MsgGUID: yX8UBkQsTcKptfCYrHRWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="257059706"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2026 00:19:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkzKs-00000000TY2-0vEN;
	Sat, 18 Jul 2026 07:19:46 +0000
Date: Sat, 18 Jul 2026 15:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (fffffffffff000 becomes fffff000)
Message-ID: <202607181548.5lnNf99t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: e71e00127110dedc6a9e746178282b4dac97ed96 iommupt: Add the RISC-V page table format
date:   4 months ago
config: um-randconfig-r121-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181548.5lnNf99t-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181548.5lnNf99t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71e00127110 ("iommupt: Add the RISC-V page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181548.5lnNf99t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

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
