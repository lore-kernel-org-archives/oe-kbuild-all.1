Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58136308F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 01:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818357; cv=none; b=A429TrjnwYQ3xn4PL0A0ARGTeZEE5m1ZtSF4Tvwo7mwxKqWQ0PfCdgWBbXiIzd/K4LFQoZfdBmx6bd8xrQueO44Rp2MODnkvGivXSQLTx0vc4SyraSKWx70uyyCtibtLV7059f2GID2C2Fyd1cf6qJhpRpla96Tu9JZo7vifKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818357; c=relaxed/simple;
	bh=S4fTEpIsSWd2Gu97Zgfkhlz7ko1F3W9VSvyr+l7G8Ic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P6MMF1gvxTEDHMqb6J0AU79DmS8lslgVzDeaFSszm6d2/2OM62VVDJ7f/1UidM9kbwhL47rXLrs6YRFqUKCk0kqGIvpiSwArSIyL7EuO88TMW+f0Iymj3ObG7d0+joWE72X2dNMsFGfUeBryJbLQ7jVMWKFE6TwKP8Fc47CjKkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=In8NVyT8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="In8NVyT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790818353; x=1822354353;
  h=date:from:to:cc:subject:message-id;
  bh=S4fTEpIsSWd2Gu97Zgfkhlz7ko1F3W9VSvyr+l7G8Ic=;
  b=In8NVyT8YbcHWbyMMcxF/ObZnvKgU8FP6UBNoujVwXPd4qpy4ZHWjkFG
   3prMCxQSuj2Zb4bOrS3NLcnTvMataPPrACBCwDqTiKR7AD+6RphDEWLnw
   pXUblKH7UzhIUw1IIqjmJ4u3eUxDX4SnkVNdY+d0oLmda4dNQ8uT7Lzdo
   hREa5SCi78n2dygq9UJCs4bPRetSL+JJ0zhOe3G7GhupFs07dHsumjO4L
   pPcnaIDBjVU/lowndJp1Q2iBlM63MjcdlNXyACibL89D7pvgUSNtq/FbX
   vK8W1/WRBmxRliZ/GzVNO5IIPXYVDeX7pJEJyGTsOtrGu8R5LS7wMJb42
   w==;
X-CSE-ConnectionGUID: eTXbSkHYQwOGLIRDoRbnBg==
X-CSE-MsgGUID: Hd615aLPSkizE+Z6jjKSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91667322"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91667322"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 18:32:29 -0700
X-CSE-ConnectionGUID: dhNvwHBjTHCayM94NBSf3w==
X-CSE-MsgGUID: 937lBuc6Sx+8X8Oqa5DxfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275887016"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 18:32:26 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC5eq-000000002Al-371o;
	Thu, 01 Oct 2026 01:32:24 +0000
Date: Thu, 01 Oct 2026 03:31:33 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Drake <dan@reactivated.net>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: include/linux/bitops.h:279:19: sparse: sparse: cast
 truncates bits from constant value (ffffffff000 becomes fffff000)
Message-ID: <202610010359.GypSyCtW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Drake-via-B4-Relay/iommu_pt-Fix-test_pgsize_boundary-failure-on-narrow-OA-formats/20260927-140900
head:   b7ecf4c7cbd115e08bbd71e2959ce77385075e36
commit: 2f4cbf2903187f8af69f9521be028ce204cdd222 iommu/generic_pt: Add Broadcom BCM2712 page table format
date:   4 days ago
config: powerpc-randconfig-r2308-20261001 (https://download.01.org/0day-ci/archive/20261001/202610010359.GypSyCtW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010359.GypSyCtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010359.GypSyCtW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_bcm2712.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
>> include/linux/bitops.h:279:19: sparse: sparse: cast truncates bits from constant value (ffffffff000 becomes fffff000)
   include/linux/bitops.h:284:37: sparse: sparse: cast truncates bits from constant value (ffffffff000 becomes fffff000)
>> include/linux/bitops.h:279:19: sparse: sparse: cast truncates bits from constant value (ffffffff000 becomes fffff000)
   include/linux/bitops.h:284:37: sparse: sparse: cast truncates bits from constant value (ffffffff000 becomes fffff000)

vim +279 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  267  
952043ac12a117 Steven Whitehouse  2009-04-23  268  /**
952043ac12a117 Steven Whitehouse  2009-04-23  269   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  270   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  271   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  272   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  273   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  274   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  275   */
6606c8c7e81886 Kees Cook          2025-08-04  276  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  277  {
952043ac12a117 Steven Whitehouse  2009-04-23  278  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @279  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  280  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  281  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  282  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  283  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  284  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  285  }
952043ac12a117 Steven Whitehouse  2009-04-23  286  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
