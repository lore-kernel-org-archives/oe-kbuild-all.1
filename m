Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3A30BB97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 01:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781226672; cv=none; b=t8TVF1EmotDc5gssgJnVjSc9giBWn8VvCmSM0jSrmr2NF2wlJHnjtpAN4Ua8OQWSNzMVs7He+vyjD5EeAumOU27GBah25nUA8BLOtTsKNqJi71surMKMnZPhGtYBHsl7bZcZAlB0UELicJz7H22EehMUxVUExLExR+//YdkUfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781226672; c=relaxed/simple;
	bh=Nxij/Yyp/CYoBtb5GedJpvbsrLumXZCN54SsC9n+7/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=daVJiEL9+aCh7fKP7ZoudOwANXfBbjmd4ss+YOumSWSZtEFb5Pvj9aTCir4kRpPnEUw6d2DTjvWmIR2NnAU0YPoyqiF/qCuIvB8sKol0aBYTh/044wlfozaJqxQrE42GXIqWp9QZS28YjFriOdVGgAHlWgwPaohEXAEowmq8sac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFOnwqVp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFOnwqVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781226670; x=1812762670;
  h=date:from:to:cc:subject:message-id;
  bh=Nxij/Yyp/CYoBtb5GedJpvbsrLumXZCN54SsC9n+7/0=;
  b=nFOnwqVpcCsAvp2Ib1Je3CGd0um0e2pjcyZP3n7uoZdJKMEHsEYwVycx
   mYpRCMGszFraV9aUviG5QwoIG76nBiekg657uKE2Hk7nfJ+OVynNgjZcu
   dxVzJmT0VMOMqaJbGbPgxmmpwiAR/jaKErEx1V0TIm+fMGCAQ6vWz4z+c
   vq0vSO6LGRDHgkAE5WTdo8s/s2SwKYBxIUafxIwQY9Hh8pWC0/h9vkKt5
   +c5NxBpcI9pDbFuxY7DA6eC0R8R2ZpkPGs+0IPw3sgs03XP1KvwKNsCFk
   z5gcWK2xTvIL8kz6tqqMuLYwst4q4iJApcv1gfb+OmCHJnpvmTpzjCuKC
   w==;
X-CSE-ConnectionGUID: Iw5MmdNDRlu1muua8kRywQ==
X-CSE-MsgGUID: +CYqD5JKSG6JLg5WUt9ZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69601813"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69601813"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 18:11:07 -0700
X-CSE-ConnectionGUID: rxzl1nlYQeiJxmfC8vLvHQ==
X-CSE-MsgGUID: 6cdpIMAnR02L9Is7UDGQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251764262"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 18:11:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXqQJ-00000000O6M-1nrG;
	Fri, 12 Jun 2026 01:11:03 +0000
Date: Fri, 12 Jun 2026 09:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (fffffffffff000 becomes fffff000)
Message-ID: <202606120851.0Ve8qu0r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: e71e00127110dedc6a9e746178282b4dac97ed96 iommupt: Add the RISC-V page table format
date:   3 months ago
config: i386-randconfig-r132-20260612 (https://download.01.org/0day-ci/archive/20260612/202606120851.0Ve8qu0r-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120851.0Ve8qu0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e71e00127110 ("iommupt: Add the RISC-V page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120851.0Ve8qu0r-lkp@intel.com/

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
