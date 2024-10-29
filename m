Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1387A200BBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730227405; cv=none; b=eFGg7TqIr9348IvHtoxxY0R2DdKKu77EtlFKi4+ySLdlcJ41MgtrC2BUpy57PbXluhWC6yFAn/T85c38m/mtkGNBkxvTj1B87Ws5jRbQLiMy4D8IwtMCwi18bEcOMErbVWiynBcwBbGMu4M9taLsOLLifaUdALwug2nAoCgwTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730227405; c=relaxed/simple;
	bh=qNEHf5FfvvpXXxPOiQV4OPEvVRukZbFNW0hfhuwcEWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPlaP1slloO2aDwsW5vZeRPamvdv9fkeljfzhFxmXR8OVcIfoVM/nb+TBfX32crPXodBBWZXcoGLBDZWoJf5E3QJlLmlh7VGclcJjyw43NIIzFRe5KOZWRwOoA4kqeXKO3v1BG6Ml6xtm2ccUO7bBC2iA63+dQk8HiWjtUhNry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQy4Ukbs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQy4Ukbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730227403; x=1761763403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNEHf5FfvvpXXxPOiQV4OPEvVRukZbFNW0hfhuwcEWk=;
  b=KQy4UkbsFpKJaB+t28vF6H3ykhoU3bPIi/vHjGsEtVgxMe31nF/ALhBL
   CGt8WQDBxedWR+mYJEF8h6cGVGjmz+dFgT2wukG9rin/Q+NAwJAYyanb1
   K21IBeH5UiUDvnMUd7Y1FFbVG69z2jb+q43mhqgkPcVpc1eHuFcMV6xwu
   PXFwS/BWvYVLnwFVfyFsW0yAHizr8BGR76MOh60LaLrmuw0l7u7ugc8NZ
   0mluu1sBzW3IzTyk2qq/JTcgbYRZDEjoex0C0kB2StQ12b1DX1kGKrvOU
   7fbcZYDYi/KQ0wCqIZ2+C8BYwkPnEno+Vil2hYWW5pWwlnPfLKGSAVtyw
   g==;
X-CSE-ConnectionGUID: mzkYWIPPR5eVvnEFAvNtug==
X-CSE-MsgGUID: W+OJ5xJxTRix/cqRDWUk5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40426473"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40426473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:43:22 -0700
X-CSE-ConnectionGUID: VfaxTeUPRaaNNZZIZNwbKA==
X-CSE-MsgGUID: DY6pdZxeQRyR884Wsm4g5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82128850"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2024 11:43:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rBW-000e0A-2h;
	Tue, 29 Oct 2024 18:43:18 +0000
Date: Wed, 30 Oct 2024 02:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <jroedel@suse.de>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [iommu:core 4/22] drivers/gpu/drm/msm/msm_iommu.c:110:9: error:
 implicit declaration of function 'iommu_flush_iotlb_all'
Message-ID: <202410300257.9NWz2zBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c
commit: 69e5a17511f654db0fe058d22719cef008c9faf1 [4/22] iommu: Remove useless flush from iommu_create_device_direct_mappings()
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300257.9NWz2zBD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300257.9NWz2zBD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300257.9NWz2zBD-lkp@intel.com/

Note: the iommu/core HEAD a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/msm_iommu.c: In function 'msm_iommu_pagetable_unmap':
>> drivers/gpu/drm/msm/msm_iommu.c:110:9: error: implicit declaration of function 'iommu_flush_iotlb_all' [-Werror=implicit-function-declaration]
     110 |         iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/iommu_flush_iotlb_all +110 drivers/gpu/drm/msm/msm_iommu.c

70bccecfcaf6c5 Rob Clark      2022-08-23   90  
b145c6e65eb05e Jordan Crouse  2020-08-17   91  static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
b145c6e65eb05e Jordan Crouse  2020-08-17   92  		size_t size)
b145c6e65eb05e Jordan Crouse  2020-08-17   93  {
b145c6e65eb05e Jordan Crouse  2020-08-17   94  	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
b145c6e65eb05e Jordan Crouse  2020-08-17   95  	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
b145c6e65eb05e Jordan Crouse  2020-08-17   96  
b145c6e65eb05e Jordan Crouse  2020-08-17   97  	while (size) {
70bccecfcaf6c5 Rob Clark      2022-08-23   98  		size_t unmapped, pgsize, count;
70bccecfcaf6c5 Rob Clark      2022-08-23   99  
70bccecfcaf6c5 Rob Clark      2022-08-23  100  		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
70bccecfcaf6c5 Rob Clark      2022-08-23  101  
70bccecfcaf6c5 Rob Clark      2022-08-23  102  		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
70bccecfcaf6c5 Rob Clark      2022-08-23  103  		if (!unmapped)
70bccecfcaf6c5 Rob Clark      2022-08-23  104  			break;
70bccecfcaf6c5 Rob Clark      2022-08-23  105  
70bccecfcaf6c5 Rob Clark      2022-08-23  106  		iova += unmapped;
70bccecfcaf6c5 Rob Clark      2022-08-23  107  		size -= unmapped;
b145c6e65eb05e Jordan Crouse  2020-08-17  108  	}
b145c6e65eb05e Jordan Crouse  2020-08-17  109  
93b694d096cc10 Linus Torvalds 2020-10-15 @110  	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
b145c6e65eb05e Jordan Crouse  2020-08-17  111  
70bccecfcaf6c5 Rob Clark      2022-08-23  112  	return (size == 0) ? 0 : -EINVAL;
b145c6e65eb05e Jordan Crouse  2020-08-17  113  }
b145c6e65eb05e Jordan Crouse  2020-08-17  114  

:::::: The code at line 110 was first introduced by commit
:::::: 93b694d096cc10994c817730d4d50288f9ae3d66 Merge tag 'drm-next-2020-10-15' of git://anongit.freedesktop.org/drm/drm

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
