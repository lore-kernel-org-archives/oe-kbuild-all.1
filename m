Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904001DEFF5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293008; cv=none; b=E0iwQvqkRqG0ugOHfWVX3NAHgfk4Sj+wSiff8aJiFa2KD8ubqcj+KMnEjyywR4QBPmZAknycXuS01ExC5fHlWtnToLnRMGMkeeaiJ5ejtMZOworKZHx9Y6zKXz7kWg8KSSUI9hI/7S04jmd4ZCnIvMAtnR7ETTyI0nc3ZPHbGmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293008; c=relaxed/simple;
	bh=OmsV0IogT9MGb/AYXnAa8so/KXOTk94b/YhKnZ89PVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oq6LdZRvjjU1hqcBqHbt3jz/c5LGefOyeJ5w0DNosrNMJOwdMEekTRGtk17HbS+4M6YZluOK9Oing/Cd4zwCBEQEThPCjK2O1vbbnmUVy7uPnbJoBs+PkhTFHRXTLyfD+XahdYPxawiONmk66CJKIUZm7llAFiBfJ9zhdnuRE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUhY0LtS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUhY0LtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293006; x=1802829006;
  h=date:from:to:cc:subject:message-id;
  bh=OmsV0IogT9MGb/AYXnAa8so/KXOTk94b/YhKnZ89PVk=;
  b=QUhY0LtSv9bMKycaA+0s6U/1laExOzT17uFlE4JxbEpi12Y37JllhzMC
   O6i+gfgpt9l7kz+4172TBNZ/g5Dr10L6UvPkxf2r7aFBbFSuHvyvOiNWn
   2r6A7Liz4OiFZh0SdWvV3CWBYZlr638eycArpC7MsrxgO+7mo8sEYEQGm
   ACBnv0z/pzVuqb9J9OSJ+2SJ8WhOgIvGXMitCvqgSHMBODS/CcXv9UnzE
   1YfjrtRktAtuxm63auJem3z8aeEECPh+7Y0q9WT6s5MLfYxuEtYwiqGVA
   W1GExD4C99X47lhRnk+oUA3iH2cJTBJu6Oi4cTBmGL78Xe3ED2HMW330g
   g==;
X-CSE-ConnectionGUID: Xt02EvKkQSidxc1cjQnzHw==
X-CSE-MsgGUID: l7FNBoJZQCaUjxJkLQpOew==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82996445"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82996445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:50:04 -0800
X-CSE-ConnectionGUID: HK3jwe7ASmCivErMil/FwA==
X-CSE-MsgGUID: FawOeMoqTm+tP6rtdMhCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217714750"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 17:50:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsADw-000000010Tu-2nbb;
	Tue, 17 Feb 2026 01:50:00 +0000
Date: Tue, 17 Feb 2026 09:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:2: error: call to undeclared
 function '_iommu_iotlb_add_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202602170907.DGQYc7ef-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f2758f0da7bc5628c5fc4d3822976b07b3649b24
commit: 561f9e328538b6f1abb7b17faae3db6505172925 [2/2] BACKPORT: FROMLIST: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-002-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170907.DGQYc7ef-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170907.DGQYc7ef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170907.DGQYc7ef-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:322:2: error: call to undeclared function '_iommu_iotlb_add_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     322 |         _iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
         |         ^
   1 error generated.


vim +/_iommu_iotlb_add_page +322 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   316	
   317	void kvm_iommu_iotlb_gather_add_page(struct kvm_hyp_iommu_domain *domain,
   318					     struct iommu_iotlb_gather *gather,
   319					     unsigned long iova,
   320					     size_t size)
   321	{
 > 322		_iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
