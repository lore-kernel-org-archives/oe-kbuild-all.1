Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0FB21A453
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210589; cv=none; b=vBiouGz7cTUtalQk+eaOPKdL+iLIM0LaziZmpZ3jYgfRnvwai2bHYSQ4J8ItqTIA0jf5JN1grCsCWP5UqZMdwUa3AwcfuExU7gycWbFkko8FKFu7ZbAUl/sDGxIA3/J/8dJChnH12BpJUBgua8erEKD1MGr89xY3DYy/UDb5k8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210589; c=relaxed/simple;
	bh=77p3rkE7c7qYHD61UUWE0ECZi2sAo2gpK00bnfuGkSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K66jUzCWp970Qt2dCKjIJR4UM9EJ4xAdrI5IAt3dA/46FXWf+8TSTHh8tOupXjMs+99+4qstW5l0rgpHdSDwdeM7iE+xWhGsyYE5lSaZx7ZO0HA/9Lid3APplZR5dE45FRRvWuj/WVv/cmVWtjpJfSVOHkOIh4pDNbQiHW72ZgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hd7kB73/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hd7kB73/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778210588; x=1809746588;
  h=date:from:to:cc:subject:message-id;
  bh=77p3rkE7c7qYHD61UUWE0ECZi2sAo2gpK00bnfuGkSk=;
  b=Hd7kB73/TwZ9dQt+rX8/Ud3CgSarvgIALhthM23m63qTrVxVsvxA6sOf
   lNRlgzD1IQUtqgYE0G969KJkDP/o7JbsupRylA/lqM1iiQsY2PcDXbPtT
   9xVdPLbA4p6H8NXzNkYzEj1Yl8rrCCgI9+edPw7sM0mOdralYwCFyhpGF
   cFEeP8IAND4KwGBO20c9GalQLovdnIZmV31Zi2nEK6n6XWIESXqbm49Uf
   fjT9Fr+9y0zfCAoKg28X78cLGTYbeS4lq88jLtsK1+rLDmPubc/YoE834
   Lj4ZOr954Sotx+L9Ll8lntFlsSTDt0BvchhGxlLPLLlBABVOhlhZi0DqR
   Q==;
X-CSE-ConnectionGUID: rKIQ6OkuRZmavwaFCgXM6Q==
X-CSE-MsgGUID: e/bQU24XSWqx4zQJs3XqMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89765586"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89765586"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 20:23:08 -0700
X-CSE-ConnectionGUID: v6qRHdMdRoKb7uNgDN4lTA==
X-CSE-MsgGUID: vgJLddjFQlWHD+IRAAymtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="230255346"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 20:23:06 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLBnr-000000000kT-1FXP;
	Fri, 08 May 2026 03:23:03 +0000
Date: Fri, 08 May 2026 11:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (fffffffffff000 becomes fffff000)
Message-ID: <202605081142.GCqeAhEx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: e71e00127110dedc6a9e746178282b4dac97ed96 iommupt: Add the RISC-V page table format
date:   7 weeks ago
config: arc-randconfig-r112-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081142.GCqeAhEx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081142.GCqeAhEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71e00127110 ("iommupt: Add the RISC-V page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081142.GCqeAhEx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:37: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:37: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e6 Wolfram Sang       2025-01-07  261  
952043ac12a117d Steven Whitehouse  2009-04-23  262  /**
952043ac12a117d Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117d Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117d Steven Whitehouse  2009-04-23  265   *
4945cca232ce8bc Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117d Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117d Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117d Steven Whitehouse  2009-04-23  269   */
6606c8c7e818865 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117d Steven Whitehouse  2009-04-23  271  {
952043ac12a117d Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117d Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117d Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117d Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117d Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117d Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117d Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117d Steven Whitehouse  2009-04-23  279  }
952043ac12a117d Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
