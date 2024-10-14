Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB519E802
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916096; cv=none; b=dl9rqik/F9vgp/nC3WGAYQN72ARGUbd0U4OoheMt158fURa51knzmn6ErCSyX5JlhN5NN+NS5sPx6ESDBZ89uKpEe9AzWyAMx+LYQ7bCoDEOAxGrnDt7xBtieSmlg5wnwbW5XqdqKcZxrgfXwdSlgfNlKrgoAypSkli4hbGLW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916096; c=relaxed/simple;
	bh=A6043gMstPK5+Y/z7dQ1LBqcdZLw4BM7QcSSFACidGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAHTKOFAKkD7T0YTt1oQ9N9X7TWTlfdhsRBi49I/rRu6q/v2DJDR5YiTSUPtUdFrKe4F3yXcO50Xrka6ikTM54FIuv/LkNx8tTlyIuA4ygV/n2nVHH6BOrnW58SKT4XLVBnsGEduze1YBFFigfP7FAGzKbY/S4xYt3ZkCEDXRQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDXcHafr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDXcHafr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728916094; x=1760452094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6043gMstPK5+Y/z7dQ1LBqcdZLw4BM7QcSSFACidGU=;
  b=aDXcHafrMZSYMOvXYvELaSrxD8YudgoXfmxMoMNECAwPT3lL3Q64A0kJ
   6ZSSgSoOUK3dp80Z4SP84Uh4Khc2h15dOR4YN0dZDF6sPJRou0AbX2O7e
   zRfzyQSZ+8ncf5Md5wcprrVC6X+K2cawhGQjlEC5PK8FODKxll21e6NQr
   RwPkLE3jp13wQhWMA2OKIkYUG3Eu5UFHuX71xV5wYLUm6rx48RXOpJrsA
   r63byM53+q6DvZ1E/67OzkRfp73vD9O9JGDtPP3oMbNbFha/dhwpkN0WM
   DLp23QyQvhjO9FgQJW6jb3Otm4YfIjkCzE/y3rTx5SR+yGfI0rBK8uXZB
   A==;
X-CSE-ConnectionGUID: E7PgQzrnROeBCafAGScxQg==
X-CSE-MsgGUID: hGwjttt2SMm6yOl5zlZoeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28149915"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="28149915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:28:14 -0700
X-CSE-ConnectionGUID: 6XMGn78bRECaeXiW44eUyA==
X-CSE-MsgGUID: fhUPZTUvTWefU8x/J+jwvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="82353914"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 07:28:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0M3O-000FRH-1I;
	Mon, 14 Oct 2024 14:28:10 +0000
Date: Mon, 14 Oct 2024 22:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:for-alejandro 43/43] drivers/iommu/amd/init.c:3216:34:
 error: 'AMD_IOMMU_V1' undeclared; did you mean 'AMD_IOMMU_H'?
Message-ID: <202410142213.pdZ5NK3a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-alejandro
head:   391761917c3d9f1c9225513167a962b7bc5eb7aa
commit: 391761917c3d9f1c9225513167a962b7bc5eb7aa [43/43] WIP iommupt/amdv1: Use generic pt for pagetable ops in AMD V1
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241014/202410142213.pdZ5NK3a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410142213.pdZ5NK3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142213.pdZ5NK3a-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/amd/init.c: In function 'iommu_snp_enable':
>> drivers/iommu/amd/init.c:3216:34: error: 'AMD_IOMMU_V1' undeclared (first use in this function); did you mean 'AMD_IOMMU_H'?
    3216 |         if (amd_iommu_pgtable != AMD_IOMMU_V1) {
         |                                  ^~~~~~~~~~~~
         |                                  AMD_IOMMU_H
   drivers/iommu/amd/init.c:3216:34: note: each undeclared identifier is reported only once for each function it appears in


vim +3216 drivers/iommu/amd/init.c

02f3b3f5449cd0 drivers/iommu/amd_iommu_init.c Joerg Roedel          2012-06-11  3201  
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3202  static void iommu_snp_enable(void)
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3203  {
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3204  #ifdef CONFIG_KVM_AMD_SEV
0ecaefb303de69 drivers/iommu/amd/init.c       Borislav Petkov (AMD  2024-03-27  3205) 	if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3206  		return;
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3207  	/*
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3208  	 * The SNP support requires that IOMMU must be enabled, and is
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3209  	 * configured with V1 page table (DTE[Mode] = 0 is not supported).
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3210  	 */
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3211  	if (no_iommu || iommu_default_passthrough()) {
b8246a2ad80a81 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3212  		pr_warn("SNP: IOMMU disabled or configured in passthrough mode, SNP cannot be supported.\n");
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3213  		goto disable_snp;
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3214  	}
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3215  
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10 @3216  	if (amd_iommu_pgtable != AMD_IOMMU_V1) {
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3217  		pr_warn("SNP: IOMMU is configured with V2 page table mode, SNP cannot be supported.\n");
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3218  		goto disable_snp;
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3219  	}
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3220  
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3221  	amd_iommu_snp_en = check_feature(FEATURE_SNP);
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3222  	if (!amd_iommu_snp_en) {
b8246a2ad80a81 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3223  		pr_warn("SNP: IOMMU SNP feature not enabled, SNP cannot be supported.\n");
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3224  		goto disable_snp;
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3225  	}
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3226  
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3227  	pr_info("IOMMU SNP support enabled.\n");
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3228  	return;
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3229  
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3230  disable_snp:
b650b38b006053 drivers/iommu/amd/init.c       Vasant Hegde          2024-04-10  3231  	cc_platform_clear(CC_ATTR_HOST_SEV_SNP);
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3232  #endif
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3233  }
04d65a9dbb33e2 drivers/iommu/amd/init.c       Ashish Kalra          2024-01-25  3234  

:::::: The code at line 3216 was first introduced by commit
:::::: b650b38b006053ef96e90b8e3f7e6edc7845cd57 iommu/amd: Do not enable SNP when V2 page table is enabled

:::::: TO: Vasant Hegde <vasant.hegde@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
