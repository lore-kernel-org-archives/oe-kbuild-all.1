Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5DC9443
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761870338; cv=none; b=gIUGmXA2LueovaHtR/8THCJxzeTXEFnuhTINRWO8jxf1bcK6X/E9GYwsKX+Ot78/nE26xvaR0Pqt4zMthgRly5BF/vC1AJNKK6j43nON4XzRgPt8hnE4Wv8XIynUQCUO9C22EkGMgzHLc3Sg4N5ZdCgFb9WzBmDegdTWuDzNHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761870338; c=relaxed/simple;
	bh=Ad6QgV24SsjbTS7PyM9V1eadRGUKZSaBlkvWJBbZvqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHzmNlCT0MxDlZiRYTWHpbyxDj1jNFTacm8LTp4mnBYALY9+xuJn39+91uoKEWLowrzue/hROz0iSGMW5EEHXwIxPhjhF74ORg3PkdoaLYAo/Owu5kmMlPCGihNX8c8S7Luk9PwAm9Yz+rGDQ5eLbHzB+FoIRAXROGUVDSVDFNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V93KeZ8F; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V93KeZ8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761870336; x=1793406336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ad6QgV24SsjbTS7PyM9V1eadRGUKZSaBlkvWJBbZvqk=;
  b=V93KeZ8F8W3W5Nj4AtG4kG0mE49qkP0VHe4ssc3OxnOoxnojouDghFqm
   y0bajC/KllSZLU5F6ol/kjRkGyK0pzVgr/cmel09gllPuUs1hxMOg1JtG
   28HCFdTh4SQRSEF+D3pc7RJuzpjTnvZ+MP1BuETjIq//ZpTKqCrwP4R5S
   N0PGfOY2DD591Re79ntFW9eTQDkQwhWx3qSPVB9Qr5UAfHW5fpTSEN8ng
   pI3ktxD4py57EEPwJPfSeiXSKb1AKRtTfkvOtZT/q6bHvq916e1DOTo8Y
   99ITkOk3ivzMHu8VTh7bLbkp1CO/zp0FFAkKn7qwaYT2cX87Nb2N9IA/s
   w==;
X-CSE-ConnectionGUID: X721R4LySdOSTrYyCtmD8Q==
X-CSE-MsgGUID: agWBqi18TSin4Cz0QBp5YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74626323"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="74626323"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 17:25:35 -0700
X-CSE-ConnectionGUID: U0fAcqefS+2I6snl9Wzl1A==
X-CSE-MsgGUID: w8Lp7LjmT7ONcsps/1Rpgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190444884"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 17:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEcxI-000Mcg-1u;
	Fri, 31 Oct 2025 00:25:25 +0000
Date: Fri, 31 Oct 2025 08:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 18/34] include/linux/bitops.h:273:19:
 sparse: sparse: cast truncates bits from constant value (fffffffffff000
 becomes fffff000)
Message-ID: <202510310809.i86QzlOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   0a72a7e372e8ab031a5e6a0071f6e0d7c44b7498
commit: 5edee2389776fc5b4fe77680d0b6658bb038454d [18/34] iommupt: Add the RISC-V page table format
config: i386-randconfig-063-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310809.i86QzlOY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310809.i86QzlOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310809.i86QzlOY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_riscv64.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, ...):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (fffffffffff000 becomes fffff000)

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
