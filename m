Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE282980D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562215; cv=none; b=l1+9p23GF1IxMoqviJIjmpP4043poQIWUvNcrLB6orIGhwTiIhWRpzS7aEDvwOHKPWxMOljWmTSHobCwDjb7NCTy111mwD/OyATp74Bjm4yLnCB/Uk3vtHUGelNTaG8LYbVhfOHXGgzl/JsryNha6c4AR34TLfPXJcXyadB9Nsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562215; c=relaxed/simple;
	bh=IhPChwDkOlXQ8G6Kzp0t3u2IKjNs7Um55uNeJB0OygE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuADPKGzA/78jiMGEkyODcX62y140+sVrLzQozoz2gbKMhJVkcPlRYM1PzhsWZqxQYDxxdf9TGdMHC8VMBGuPW1K1OOnsMANe0b14lftGxLFmR6eSuhLtTe5uvB1VDgpM7LMigj67ozpjAEg9Ap6bf66D3PrhephDGp0Bve0vrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLYBHCzx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLYBHCzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749562213; x=1781098213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IhPChwDkOlXQ8G6Kzp0t3u2IKjNs7Um55uNeJB0OygE=;
  b=XLYBHCzx8XBOSUkW48L7w3mDWWXhCvt9uNm+fKj+HR2/gMFzJKFaCP7f
   y7fusEekv5qTAwJijkcpqltQZBvmiTlDboVcsNfwtt78M2KcABHBfK+vv
   84BHDe0xiOToMRZcDJr9XfZ6zGRGoLP6JdOpbPaRdFX7KOM3pY1ARSCsv
   aHfPeaLqyt7QnAzA30q/iqNFAr/pylr9H1qn2BwkcNyg/RkfM3NP/qHQA
   dDvNeMeN6HbqOhEI8ddwqgt3eFpDSCDRs6nbHLZ5ncd/AT8LzzkuLld+k
   mhT9Wyq45/28+X5Djkj5zc7VRimx9Hu+dyIWNE0KuMXQ4ISJmpmzXtrUT
   Q==;
X-CSE-ConnectionGUID: WlMJpIHlQvWVAaJvlDpK/g==
X-CSE-MsgGUID: ukcb5qOeQk+REc0bJ1mYlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62326015"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="62326015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:30:13 -0700
X-CSE-ConnectionGUID: l9bsnmnRQtSFXReu9ZEl9Q==
X-CSE-MsgGUID: zAZQZIRCQ9aFXnrfJZfdhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151981036"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2025 06:30:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOz3K-0008Gu-03;
	Tue, 10 Jun 2025 13:30:10 +0000
Date: Tue, 10 Jun 2025 21:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 29/40] iommu.c:undefined reference to
 `pt_iommu_riscv_64_hw_info'
Message-ID: <202506102156.B6BnJCvl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   282698ed3a69e2f70fd682b369cf39c972c0bb2b
commit: 136ba92e62f6afeb158e366e05a9cd610c661a25 [29/40] iommu/riscv: Use the generic iommu page table
config: riscv-alldefconfig (https://download.01.org/0day-ci/archive/20250610/202506102156.B6BnJCvl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506102156.B6BnJCvl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506102156.B6BnJCvl-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/iommu/riscv/iommu.o: in function `riscv_iommu_probe_device':
>> iommu.c:(.text+0x177a): undefined reference to `pt_iommu_riscv_64_hw_info'
   riscv64-linux-ld: drivers/iommu/riscv/iommu.o: in function `riscv_iommu_attach_paging_domain':
>> iommu.c:(.text+0x1948): undefined reference to `pt_iommu_riscv_64_init'
>> riscv64-linux-ld: drivers/iommu/riscv/iommu.o:(.rodata+0x28): undefined reference to `pt_iommu_riscv_64_map_pages'
>> riscv64-linux-ld: drivers/iommu/riscv/iommu.o:(.rodata+0x30): undefined reference to `pt_iommu_riscv_64_unmap_pages'
>> riscv64-linux-ld: drivers/iommu/riscv/iommu.o:(.rodata+0x58): undefined reference to `pt_iommu_riscv_64_iova_to_phys'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
