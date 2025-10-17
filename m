Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F3B2BE7C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718985; cv=none; b=Mh71jQxzWPoSQ0ZZFpj5ua++EbyN39rj4ibrSSzPCNOHzI7y7J+GIz/E89d8umtJEfLLF3Q+W5OichrxxR8ASmaQN37OCKaR/XLip/xBYwovUgTHz9eVkclsONnnjbXZi66QUUrktHqPrqbPsFAZvG4IrNCMYD0mwKajTBkrCSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718985; c=relaxed/simple;
	bh=GOXlwk0OIBbnFDFDiBGgNkrHGz/vseXT5gD7BJZk3RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ytnljq62h1ImSH1PWxHQSf5Fx7PGL8g2YPRw42K5L9yZLO+CtQDHUH1xguQLjItak85jeB+vRuVWK1UTv36esF6ZhwSweakeMTP+TIqwRch05F6/MId5ZhhaUkeberngxSdVrmqz4yH4TZnTKJt+YA07pAqh+tL+DR4eV9WeH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZAnSUMi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZAnSUMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760718983; x=1792254983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOXlwk0OIBbnFDFDiBGgNkrHGz/vseXT5gD7BJZk3RQ=;
  b=jZAnSUMiMuEPJ2ggjdfGxsbHIf44ZfrAsyCDZeKNOGW/sIYvDdpYyudy
   aLT4RtAx6gq9udkWSknCVd+YcLvMK1oz6ZveMVyXu+rpv6d+FUMJ4stV4
   8gCzEYtGMEfHQi/u1tvyiXQs0JZ46WZMFSYbZlDD1Rm1mTYWFzX9n0GxU
   XlXiouiyTZSjHSsF8UO8Mzi1pTlNSKvS3me/CHExEJ/EmM53oNORoBjDl
   /cEzxiSw1fUy1iiLWX6r3AEyHLgp+g5KIPmPrvLEVtuPsIg1GQYTE67YX
   wdTR5GtNxelAELCwUf7N6P445perLQFCFZ8UOMsWs6KOAvTskDM4Y57Sj
   A==;
X-CSE-ConnectionGUID: 9qS01RtORYOYtFrKBVYKEA==
X-CSE-MsgGUID: FLGjR/YnT5mXL5b6nkrP5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="88402413"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="88402413"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 09:36:22 -0700
X-CSE-ConnectionGUID: d/wTJFP+S+SFpWrbR/DinQ==
X-CSE-MsgGUID: jGVmWRBJTu+1+ICuyG5inA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="186799950"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2025 09:36:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9nQi-0007VH-0U;
	Fri, 17 Oct 2025 16:36:01 +0000
Date: Sat, 18 Oct 2025 00:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 13/24]
 include/linux/vfio_pci_core.h:172:1: error: weak declaration of
 'vfio_pci_dma_buf_iommufd_map' being applied to a already existing, static
 definition
Message-ID: <202510180014.m4MDdkm0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   e1e0600b1a5699114df3ae378cd69a7f953e5b3d
commit: c6bba7e55c4c144ad5a4469e5a9c9f45954411dc [13/24] iommufd: Add DMABUF to iopt_pages
config: microblaze-randconfig-r073-20251017 (https://download.01.org/0day-ci/archive/20251018/202510180014.m4MDdkm0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180014.m4MDdkm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180014.m4MDdkm0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/pages.c:58:
   drivers/iommu/iommufd/pages.c: In function 'sym_vfio_pci_dma_buf_iommufd_map':
>> include/linux/vfio_pci_core.h:172:1: error: weak declaration of 'vfio_pci_dma_buf_iommufd_map' being applied to a already existing, static definition
     172 | vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vfio_pci_dma_buf_iommufd_map +172 include/linux/vfio_pci_core.h

90fb11fd382194 Jason Gunthorpe 2025-10-10  166  
90fb11fd382194 Jason Gunthorpe 2025-10-10  167  #if IS_ENABLED(CONFIG_VFIO_PCI_DMABUF)
90fb11fd382194 Jason Gunthorpe 2025-10-10  168  int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
90fb11fd382194 Jason Gunthorpe 2025-10-10  169  				 struct phys_vec *phys);
90fb11fd382194 Jason Gunthorpe 2025-10-10  170  #else
90fb11fd382194 Jason Gunthorpe 2025-10-10  171  static inline int
90fb11fd382194 Jason Gunthorpe 2025-10-10 @172  vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
90fb11fd382194 Jason Gunthorpe 2025-10-10  173  			     struct phys_vec *phys)
90fb11fd382194 Jason Gunthorpe 2025-10-10  174  {
90fb11fd382194 Jason Gunthorpe 2025-10-10  175  	return -EOPNOTSUPP;
90fb11fd382194 Jason Gunthorpe 2025-10-10  176  }
90fb11fd382194 Jason Gunthorpe 2025-10-10  177  #endif
90fb11fd382194 Jason Gunthorpe 2025-10-10  178  

:::::: The code at line 172 was first introduced by commit
:::::: 90fb11fd382194af16459705a9bba061a6863381 vfio/pci: Add vfio_pci_dma_buf_iommufd_map()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
