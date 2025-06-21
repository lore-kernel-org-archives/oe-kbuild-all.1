Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199CA55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750540606; cv=none; b=hYl79K++PFH4R/+OHYEHoqN0v6ekRAbsLjWTD115Gfi6PN9HlvIA6sEjOzhVeZNQSiPWkAEy6JoYp6qB7xOnWDLOKA4qbZjG70EhRZueWt/appnMbK3P0Q4Epeg0BGDqPOg/qctnbOwTFBDIUIhyhIkc5kekawpkmSwPjSfpVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750540606; c=relaxed/simple;
	bh=nJe7U50cVLzhQ5Hu1Tpw+lwQ3Yh21+T7nM4CbwKTRcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJw/Sr3IdlCI7B0CGLkHm3ut9N6M/yX7Uk0TIY5ak1FHBjnrrcZ7phwIkBX5MxzVi6g1EVXHOtkFDLQcq+Pgjcan6T9PPiB/CK0sn7Yms0Z7Oh9x2klhKBwX4DQhQeZ2r0Uy3LEKP92XYTERM6aoAIfSW6HHwEfns+iX7Hn41G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYei5r8B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYei5r8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750540605; x=1782076605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJe7U50cVLzhQ5Hu1Tpw+lwQ3Yh21+T7nM4CbwKTRcM=;
  b=TYei5r8BCvVlPRjkX8hp/re6JUc9ruex0cDAWgt05xpXUaMUAiM0jKp3
   2+gPsxGdjL2gxWn5fL7yFs3sIPkjMqDAMM221vRrfaGhZ1vX1fPvQqJkR
   A9K58sE3U88PAHycc65Ln7AP72WiNWBf5ugf6AdJb43z5t7a58yJvzUTj
   LuJFggVmh+l7o99Z0YUtXDzdRKcYrO8HygXDk9oNmQqQl0L3O9/vXYLSn
   GxsTPTg05P0LOqZvktaUuV3hrh1ldgczzANJPlFFyGwQm/w/bqJEF3owt
   gfLFZ7EAm35G/UMmf0zjgjYLaC90bm0ZEXch0QSYNP89LTeZybDaAVCfl
   A==;
X-CSE-ConnectionGUID: qUh5KnkiRsaXMJm+o+cETA==
X-CSE-MsgGUID: TMGjPdkmRwG16mNTAzrpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="64214256"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="64214256"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 14:16:45 -0700
X-CSE-ConnectionGUID: EcXeh3LdSiuryF0MgOPniw==
X-CSE-MsgGUID: QNNADfxsQOmxZpgkJ8RhMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="174822022"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jun 2025 14:16:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uT5Zp-000MsA-0u;
	Sat, 21 Jun 2025 21:16:41 +0000
Date: Sun, 22 Jun 2025 05:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_all 46/62] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (fffffffffffe0
 becomes ffffffe0)
Message-ID: <202506220540.BGJPBZio-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   95229c50e3ce2b6ecb8126b5f765996c1b73f4c1
commit: f9030d6456384b4e46476575a470ac246c37548a [46/62] iommupt: Add the 64 bit ARMv8 page table format
config: i386-randconfig-062-20250622 (https://download.01.org/0day-ci/archive/20250622/202506220540.BGJPBZio-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506220540.BGJPBZio-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506220540.BGJPBZio-lkp@intel.com/

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
