Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF0AEEDF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyxzij8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699220573; x=1730756573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/++4VTkycLf2Z91dou60Cj/viTbmI2U5FtI0JV78wK4=;
  b=nyxzij8VhLFf1bkgMS6mIJHDFzFPRhYZXmhsP0XUE5FCshC1CZ4JeEyk
   fpnq2OkjcQK7ee+Ft2lswKvOMx997JRgOr/kKSsK5V7G69pfjvTVHw0xr
   VazWrL9vNCxfO01vqSc30CPjKCmno8TLvI/qhWwHrpwCL9SGAufBOOIFc
   g9tUG2ThHEU35JhHb2ybPmOX5/9CXiiLvrb/oJyo0CdT/v1dmKh0MkltO
   ErYGn+5Wf6DjuGR9ftt6YREggs/+MszkQ/uDqcTIqBTlJPaM42P/X+LMg
   wC5/iy/q6C27oRwxdSbM1NFcPgE0d0wi7CAPDIcpOHvj6+vaHSHvIRZ1V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379572214"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="379572214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 13:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10276312"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 13:42:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzktN-0005ok-0F;
	Sun, 05 Nov 2023 21:42:49 +0000
Date: Mon, 6 Nov 2023 05:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] glue.c:(.text+0x734): multiple
 definition of `iort_iommu_configure_id';
 drivers/pci/msi/irqdomain.o:irqdomain.c:(.text+0x32c): first defined here
Message-ID: <202311060543.RW2k0Irh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   14d4f49c12fef0083b01bdfdd02bd9017fe5addc
commit: 1d3c60066ee346b6c2433d57bd048a3a424b16a2 [11/19] acpi: Do not use dev->iommu within acpi_iommu_configure()
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20231106/202311060543.RW2k0Irh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060543.RW2k0Irh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060543.RW2k0Irh-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/glue.o: in function `iort_iommu_configure_id':
>> glue.c:(.text+0x734): multiple definition of `iort_iommu_configure_id'; drivers/pci/msi/irqdomain.o:irqdomain.c:(.text+0x32c): first defined here
   loongarch64-linux-ld: drivers/acpi/scan.o: in function `iort_iommu_configure_id':
   scan.c:(.text+0x1940): multiple definition of `iort_iommu_configure_id'; drivers/pci/msi/irqdomain.o:irqdomain.c:(.text+0x32c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
