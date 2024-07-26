Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5EE6026A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 22:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722033853; cv=none; b=jwWmu4fupciPu2mTCoKZz1kkCp1VikpTnp/90ILlYPRaAgG9+S6FN/E8KGsXHZj4OAvbx6ShbF8zqI6UfI+/VLW3kVn4SEVPWNQkO+j504HmdlQvGSYZNwMZTtKNuE5xmEn8qP+wyynJXas28X5ucZE3DjJku46MhMXa8e9O2dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722033853; c=relaxed/simple;
	bh=lfJA8qzrU+io5mLDSSFyBTvx4rERoMpVPInzvOusme0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwywvKLcpPHzorgVbfwdcqmCOuU0y7I+4zWenjTfcqjqqG024BE9BciW5LeDpUIEJxO1/K6SItiVoCQm0L9ZYtzPPYRKx2BxSEnsGaB2aaRnHB6Ze3aI8SHS+gTtw+rnhHiEgrDeo46TbfUydjoXqw9OBM7EqIRbhXtW92eg1Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMvv2fWs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMvv2fWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722033851; x=1753569851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfJA8qzrU+io5mLDSSFyBTvx4rERoMpVPInzvOusme0=;
  b=DMvv2fWsVJzxeIKwj4qE1NmH7uG0GPHPSryLYIVpg1VDHX3l2G2iiSSm
   Csttfc59gqoUKC8gf2u5i8c9By8lRtMRoYxMiruhhc9Bpeqb2AhtDPwC7
   yLfoYkaDcK1CFNVqWTpsCq0ttGa9etBD6+NA4bQuO24bEIEs3NluY3Ks9
   qpqX2a4dJb3flW5pN6NCP+q5pPu9GDu1MxadSuYN9Z5NVvo7y1FSfTYRD
   g9izw9xzfE5C8F7nfRocF6Qjla2iYO19PNaF6b4Is7zPR5kd9i1OHZPtJ
   eDqbhY/sdqWTUk/f3zTCywfo9GWDF7unPChjHBCmpP2AfZRh6Ysbgd4BE
   g==;
X-CSE-ConnectionGUID: oKvxuk0ZQB6QZuGIOzeL1A==
X-CSE-MsgGUID: hvE16iDdSmW8jcy4izCn0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="20000943"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="20000943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 15:44:09 -0700
X-CSE-ConnectionGUID: s0d1ECwiT0mg7idVFRgQWQ==
X-CSE-MsgGUID: qfftbePDSfyorqgnpJGQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="57691926"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2024 15:44:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXTfS-000pS4-0V;
	Fri, 26 Jul 2024 22:44:06 +0000
Date: Sat, 27 Jul 2024 06:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 2/25] drivers/iommu/amd/iommu.c:2277:13:
 warning: variable 'ret' set but not used
Message-ID: <202407270658.5BhSwqoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   ea5c6d0c8914861c8e337228c4880001bf40f7c4
commit: 82babd3c0b49c6c5f4bab201528761763c65e1b2 [2/25] iommu/amd: Set the pgsize_bitmap correctly
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240727/202407270658.5BhSwqoT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407270658.5BhSwqoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407270658.5BhSwqoT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/amd/iommu.c: In function 'protection_domain_alloc':
>> drivers/iommu/amd/iommu.c:2277:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2277 |         int ret;
         |             ^~~


vim +/ret +2277 drivers/iommu/amd/iommu.c

2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2271  
a5a91e54846d35 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-04-18  2272  struct protection_domain *protection_domain_alloc(unsigned int type)
c156e347d6d3c3 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-12-02  2273  {
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2274  	struct io_pgtable_ops *pgtbl_ops;
c156e347d6d3c3 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-12-02  2275  	struct protection_domain *domain;
29f54745f24547 drivers/iommu/amd/iommu.c   Jason Gunthorpe       2023-04-25  2276  	int pgtable;
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15 @2277  	int ret;
c156e347d6d3c3 arch/x86/kernel/amd_iommu.c Joerg Roedel          2008-12-02  2278  
5b00369fcf6d1f drivers/iommu/amd/iommu.c   Su Hui                2023-06-08  2279  	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
5b00369fcf6d1f drivers/iommu/amd/iommu.c   Su Hui                2023-06-08  2280  	if (!domain)
5b00369fcf6d1f drivers/iommu/amd/iommu.c   Su Hui                2023-06-08  2281  		return NULL;
5b00369fcf6d1f drivers/iommu/amd/iommu.c   Su Hui                2023-06-08  2282  
ba7d263b7749f8 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2283  	domain->id = domain_id_alloc();
ba7d263b7749f8 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2284  	if (!domain->id)
ba7d263b7749f8 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2285  		goto out_err;
ba7d263b7749f8 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2286  
ba7d263b7749f8 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2287  	spin_lock_init(&domain->lock);
ba7d263b7749f8 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2288  	INIT_LIST_HEAD(&domain->dev_list);
1af95763e0a33e drivers/iommu/amd/iommu.c   Vasant Hegde          2024-04-18  2289  	INIT_LIST_HEAD(&domain->dev_data_list);
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2290  	domain->nid = NUMA_NO_NODE;
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2291  
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2292  	switch (type) {
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2293  	/* No need to allocate io pgtable ops in passthrough mode */
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2294  	case IOMMU_DOMAIN_IDENTITY:
a5a91e54846d35 drivers/iommu/amd/iommu.c   Vasant Hegde          2024-04-18  2295  	case IOMMU_DOMAIN_SVA:
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2296  		return domain;
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2297  	case IOMMU_DOMAIN_DMA:
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2298  		pgtable = amd_iommu_pgtable;
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2299  		break;
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2300  	/*
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2301  	 * Force IOMMU v1 page table when allocating
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2302  	 * domain for pass-through devices.
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2303  	 */
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2304  	case IOMMU_DOMAIN_UNMANAGED:
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2305  		pgtable = AMD_IOMMU_V1;
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2306  		break;
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2307  	default:
bac05772fa9912 drivers/iommu/amd/iommu.c   Vasant Hegde          2023-09-21  2308  		goto out_err;
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2309  	}
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2310  
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2311  	switch (pgtable) {
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2312  	case AMD_IOMMU_V1:
82babd3c0b49c6 drivers/iommu/amd/iommu.c   Jason Gunthorpe       2024-07-25  2313  		domain->pd_mode = PD_MODE_V1;
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2314  		break;
4db6c41f09469a drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2022-08-25  2315  	case AMD_IOMMU_V2:
82babd3c0b49c6 drivers/iommu/amd/iommu.c   Jason Gunthorpe       2024-07-25  2316  		domain->pd_mode = PD_MODE_V2;
4db6c41f09469a drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2022-08-25  2317  		break;
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2318  	default:
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2319  		ret = -EINVAL;
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2320  		goto out_err;
82babd3c0b49c6 drivers/iommu/amd/iommu.c   Jason Gunthorpe       2024-07-25  2321  	}
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2322  
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2323  	pgtbl_ops = alloc_io_pgtable_ops(pgtable, &domain->iop.pgtbl_cfg, domain);
45677ab1e5ca65 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2324  	if (!pgtbl_ops)
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2325  		goto out_err;
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2326  
89c9a09cb9f6e0 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2020-12-15  2327  	return domain;
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2328  out_err:
45677ab1e5ca65 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit 2023-09-21  2329  	protection_domain_free(domain);
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2330  	return NULL;
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2331  }
2650815fb03fe2 arch/x86/kernel/amd_iommu.c Joerg Roedel          2009-08-26  2332  

:::::: The code at line 2277 was first introduced by commit
:::::: 89c9a09cb9f6e0a7df77f9c9bafd3c96148bf0d5 iommu/amd: Adopt IO page table framework for AMD IOMMU v1 page table

:::::: TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
