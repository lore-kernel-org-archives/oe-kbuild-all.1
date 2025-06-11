Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49E1885B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655504; cv=none; b=CeUxFi8fGfM/elKnv4gvg8u4L/OdqGt2ZX2P2OHeO77Aamx108W0N1Zr0HCGnga2//eB8S9k0LOAKu/fTmnN5b9ZK8V7NME9ZD7KemIoRmEbp/hawAQNLwBWLpLohmmVQrvPHRVehJsNC01vVYARWdCX9TgSXk1kots5xX4lLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655504; c=relaxed/simple;
	bh=jzWQGpLyN9/N7T1R/i+nvcbPA4FTFJ824MTnWSoVnsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSPES/ANcz/fDlv3GqhEN4C6qKJaivG3jd2VcuKrWKyA3m5vV0jV+u/V02AY3nVfnTG7KHMbjJmFQW5NPOhrkQWhS4I//KbTPPx+n08tK1394wylg5PITasGimu2xjpSaLxr3Cm+wPkp4DG0pT9yve5vZlCTJWLZPXAMr7/Qvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5pZM0Et; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5pZM0Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749655504; x=1781191504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzWQGpLyN9/N7T1R/i+nvcbPA4FTFJ824MTnWSoVnsg=;
  b=J5pZM0EtCCPlhBLg9hoLcGHN+n7AcATcl7KDcnHXrRtTM7hlHgZDlQbJ
   clqUUNcsuMSdzqTGGJZ0vrI51pPgM0+fsvaSxiCWSd6wj6erkZW9sIhiG
   ka1Mzr/NRctw1/dgXzPnWmEnCM8co3Qmw34VsS6vCEagozNYP9DPHJc56
   KFLzVuoCQ+j3Qmvv4VbpCVTMJAyVd32/BBlPY2m2NJaGnoMpDKMbaH/CO
   QoLaWEFpYiJqBase4Pp6NqzmLPf2dhr200eE41ELyHjK9lIMjJ4QzATXJ
   OHCD0cHbOk2cYRDchV9CckGncMJdPFBNTf60eq5qGlUYYln8eWre69N1U
   w==;
X-CSE-ConnectionGUID: Wh/VzLyzS6mRb5I7Sfv+Qg==
X-CSE-MsgGUID: 7aAuy1eKTb2lM8asXPMomg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55609914"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55609914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:25:03 -0700
X-CSE-ConnectionGUID: +W5+poYXT8WvjxTbLa1BSQ==
X-CSE-MsgGUID: Mb7uk93PRyeOUbnEPc7Nrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147225662"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 08:25:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPNJz-000Acr-0U;
	Wed, 11 Jun 2025 15:24:59 +0000
Date: Wed, 11 Jun 2025 23:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 27/40] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (fffffffffff000
 becomes fffff000)
Message-ID: <202506112304.kWSsyv15-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   33271d49331eb93ded42263aa2b037fd6afa5d60
commit: 59ef4588ee585848d6963f11bddaccaa03cc14ca [27/40] iommupt: Add the RISC-V page table format
config: arm-randconfig-r111-20250611 (https://download.01.org/0day-ci/archive/20250611/202506112304.kWSsyv15-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce: (https://download.01.org/0day-ci/archive/20250611/202506112304.kWSsyv15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112304.kWSsyv15-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:37: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:37: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

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
