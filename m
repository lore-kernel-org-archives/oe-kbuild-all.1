Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05892292B5A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752066573; cv=none; b=LPf9eQhLTo5QaEAyPe9xC3mX6MfIlSDLW5IdDl5DR0ucaXkKkVctN30lxx+iTqtf9si9SuGhYgFa4Qbk1avXtlzJbR/eTtLpR69/qwzaxK4YyWg33PAHQ1HVFMeIukjBFvUJ/m7dEh6XPB7fO3QyXCsDQ7uCFTwp7X7KN0EqNV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752066573; c=relaxed/simple;
	bh=k4HABKirLAMqsX37mJ176BWnFfYZIFbDQvE/yvlDZ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMWv7UOhuUpzUx1KO2sa3SjnyxXumxGlh0poI58207IerDRFte/ICH77usvfP0I+euTaRFGATZukoCcZUBOP7hOoEkpe2oOVZH5QW6Kx+IoAbYzw9t28bzKdRnowlOrzVscm+KBVes/TlpUNRcTZbpb7NyLyU4UImIBvtuLwaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkmxNx96; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkmxNx96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752066571; x=1783602571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4HABKirLAMqsX37mJ176BWnFfYZIFbDQvE/yvlDZ0A=;
  b=AkmxNx968pEUlKZWqAQ0Co8Apc33DhudZFkHtFsoxgG57X9a93jBrBiv
   D4hILfdBXlCZbYgoPbOvJn6cLo+Y8OJX1izL+U8uZuCju+td1EATUFuqz
   r9ouEgbP8ws+cedZCL/ixM7Vcib/2W/PG/76Wz1SyN0uf+TjDtuKtWlhq
   py1plRG0otTssy9pfb34Fx1g8mSIELdXmVwQbkRTBakruMwqswkj7ntAK
   tYaSu+sirEtFYXYGN6x93EC5xWzh0e84lcnHV2nkeWHhlhjTijYzTDA/U
   jSdskNbeoRkQJcwO7UnbsbgTdSjo8kkvq/gs9vPEXcy3oBvEb9IHCwdvS
   A==;
X-CSE-ConnectionGUID: oHkALagtQ7i2q+/wPlyb0g==
X-CSE-MsgGUID: qe9yHGCNRuyjGOetOQYYbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="76873409"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="76873409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 06:09:30 -0700
X-CSE-ConnectionGUID: YJw5Hg3lRw+H6iYhf7aOuQ==
X-CSE-MsgGUID: puiVQvCnS/uamCQ2JwhUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="186745544"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jul 2025 06:09:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZUYA-0003Xx-2K;
	Wed, 09 Jul 2025 13:09:26 +0000
Date: Wed, 9 Jul 2025 21:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464] arch/arm64/kvm/tmi.c:25:24: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202507092132.Hy6EMke7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4467208a8b5583a77c842c4eb7673166deb5b717
commit: c5161d7e11a7e30755b2ec55aaebfd500193cbbc [2464/2464] virtCCA supports SR-IOV in CoDA scenarios.
config: arm64-randconfig-r111-20250705 (https://download.01.org/0day-ci/archive/20250709/202507092132.Hy6EMke7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce: (https://download.01.org/0day-ci/archive/20250709/202507092132.Hy6EMke7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092132.Hy6EMke7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/tmi.c:25:24: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/kvm/tmi.c:33:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/kvm/tmi.c:37:25: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +25 arch/arm64/kvm/tmi.c

67e11ee6347c43 Jingxian He  2024-08-03  11  
4038e2b6238582 yangxiangkai 2024-09-18  12  /**
4038e2b6238582 yangxiangkai 2024-09-18  13   * mmio_va_to_pa - To convert the virtual address of the mmio space
4038e2b6238582 yangxiangkai 2024-09-18  14   * to a physical address, it is necessary to implement this interface
4038e2b6238582 yangxiangkai 2024-09-18  15   * because the kernel insterface __pa has an error when converting the
4038e2b6238582 yangxiangkai 2024-09-18  16   * physical address of the virtual address of the mmio space
4038e2b6238582 yangxiangkai 2024-09-18  17   * @addr:	MMIO virtual address
4038e2b6238582 yangxiangkai 2024-09-18  18   */
c5161d7e11a7e3 yxk          2025-05-07  19  u64 mmio_va_to_pa(const void __iomem *addr)
95542c9cac98d1 yangxiangkai 2024-09-11  20  {
95542c9cac98d1 yangxiangkai 2024-09-11  21  	uint64_t pa, par_el1;
95542c9cac98d1 yangxiangkai 2024-09-11  22  
95542c9cac98d1 yangxiangkai 2024-09-11  23  	asm volatile(
95542c9cac98d1 yangxiangkai 2024-09-11  24  		"AT S1E1W, %0\n"
95542c9cac98d1 yangxiangkai 2024-09-11 @25  		::"r"((uint64_t)(addr))
95542c9cac98d1 yangxiangkai 2024-09-11  26  	);
95542c9cac98d1 yangxiangkai 2024-09-11  27  	isb();
95542c9cac98d1 yangxiangkai 2024-09-11  28  	asm volatile(
95542c9cac98d1 yangxiangkai 2024-09-11  29  		"mrs %0, par_el1\n"
95542c9cac98d1 yangxiangkai 2024-09-11  30  		: "=r"(par_el1)
95542c9cac98d1 yangxiangkai 2024-09-11  31  	);
95542c9cac98d1 yangxiangkai 2024-09-11  32  
95542c9cac98d1 yangxiangkai 2024-09-11  33  	pa = ((uint64_t)(addr) & (PAGE_SIZE - 1)) |
95542c9cac98d1 yangxiangkai 2024-09-11  34  		(par_el1 & ULL(0x000ffffffffff000));
95542c9cac98d1 yangxiangkai 2024-09-11  35  
95542c9cac98d1 yangxiangkai 2024-09-11  36  	if (par_el1 & UL(1 << 0))
95542c9cac98d1 yangxiangkai 2024-09-11  37  		return (uint64_t)(addr);
95542c9cac98d1 yangxiangkai 2024-09-11  38  	else
95542c9cac98d1 yangxiangkai 2024-09-11  39  		return pa;
95542c9cac98d1 yangxiangkai 2024-09-11  40  }
4038e2b6238582 yangxiangkai 2024-09-18  41  EXPORT_SYMBOL(mmio_va_to_pa);
95542c9cac98d1 yangxiangkai 2024-09-11  42  

:::::: The code at line 25 was first introduced by commit
:::::: 95542c9cac98d1fe33e1c1a4616cc9e638e73973 virtcca feature: read or write config space forwarding to secure world

:::::: TO: yangxiangkai <yangxiangkai@huawei.com>
:::::: CC: yangxiangkai <yangxiangkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
