Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70591642B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXQRlOvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699214472; x=1730750472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUAxU/W70h0Zdo+dlrDLtSAsb/0oF3ERjFhDPDq+Mqs=;
  b=XXQRlOvZcK+pEpEaDj2t78GHnu1Sue8jsWBVdePO+Tf6uJbet5hiMHI3
   sx0mgL7s8d5vIIW782drQKEpmQEIHeeXAGBe3sr8+2nBIoo2vtY0lkaDY
   ZFTCn3rCOxe8uAmwR2/XraarCKqCj/cba7A26qUmSd0aVU1YbcedxZLiq
   TSiF2lH6wAu3afobvUZL1oP5c2QcK82S3cbxp30G8xqYUNXg4/I9Lt+h6
   1BgaJPGLEMQJoh3fZSsUzU1EFER+ZAq69ctYiYHyaeF+MVkyO/e9sGDF6
   ABNLZi7tgxtLg5oyw0JO+o6NWAb//elUObPEqQrBHc2dC90Bremz79Dqm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="7803270"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="7803270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="3248103"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2023 12:01:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzjIx-0005km-0m;
	Sun, 05 Nov 2023 20:01:07 +0000
Date: Mon, 6 Nov 2023 03:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] include/linux/acpi_iort.h:63:
 multiple definition of `iort_iommu_configure_id';
 drivers/acpi/glue.o:include/linux/acpi_iort.h:63: first defined here
Message-ID: <202311060316.knvFe9f9-lkp@intel.com>
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
config: x86_64-randconfig-001-20231105 (https://download.01.org/0day-ci/archive/20231106/202311060316.knvFe9f9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060316.knvFe9f9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060316.knvFe9f9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/dma-iommu.c:11:
>> include/linux/acpi_iort.h:61:5: warning: no previous prototype for 'iort_iommu_configure_id' [-Wmissing-prototypes]
      61 | int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/acpi/scan.o: in function `iort_iommu_configure_id':
>> include/linux/acpi_iort.h:63: multiple definition of `iort_iommu_configure_id'; drivers/acpi/glue.o:include/linux/acpi_iort.h:63: first defined here
   ld: drivers/iommu/dma-iommu.o: in function `iort_iommu_configure_id':
>> include/linux/acpi_iort.h:63: multiple definition of `iort_iommu_configure_id'; drivers/acpi/glue.o:include/linux/acpi_iort.h:63: first defined here


vim +63 include/linux/acpi_iort.h

415e84294798d1 Arnd Bergmann         2023-05-16  31  
88ef16d888a094 Tomasz Nowicki        2016-09-12  32  #ifdef CONFIG_ACPI_IORT
39c3cf566ceafa Lorenzo Pieralisi     2020-06-19  33  u32 iort_msi_map_id(struct device *dev, u32 id);
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  34  struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  35  					  enum irq_domain_bus_token bus_token);
d4f54a186667ff Hanjun Guo            2017-03-07  36  void acpi_configure_pmsi_domain(struct device *dev);
e302eea8f49717 Shameer Kolothum      2022-06-15  37  void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
e302eea8f49717 Shameer Kolothum      2022-06-15  38  		       struct list_head *head);
e302eea8f49717 Shameer Kolothum      2022-06-15  39  void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode,
e302eea8f49717 Shameer Kolothum      2022-06-15  40  		       struct list_head *head);
643b8e4d86f8b1 Lorenzo Pieralisi     2016-11-21  41  /* IOMMU interface */
db59e1b6e49201 Jean-Philippe Brucker 2021-06-18  42  int iort_dma_get_ranges(struct device *dev, u64 *size);
1d3c60066ee346 Jason Gunthorpe       2023-11-03  43  int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
1d3c60066ee346 Jason Gunthorpe       2023-11-03  44  			    const u32 *id_in);
55be25b8b5e4e2 Shameer Kolothum      2022-06-15  45  void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head);
2b8652936f0ca9 Ard Biesheuvel        2020-11-19  46  phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
88ef16d888a094 Tomasz Nowicki        2016-09-12  47  #else
39c3cf566ceafa Lorenzo Pieralisi     2020-06-19  48  static inline u32 iort_msi_map_id(struct device *dev, u32 id)
39c3cf566ceafa Lorenzo Pieralisi     2020-06-19  49  { return id; }
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  50  static inline struct irq_domain *iort_get_device_domain(
d1718a1b7a8674 Lorenzo Pieralisi     2020-06-19  51  	struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
4bf2efd26d7624 Tomasz Nowicki        2016-09-12  52  { return NULL; }
d4f54a186667ff Hanjun Guo            2017-03-07  53  static inline void acpi_configure_pmsi_domain(struct device *dev) { }
e302eea8f49717 Shameer Kolothum      2022-06-15  54  static inline
e302eea8f49717 Shameer Kolothum      2022-06-15  55  void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
e302eea8f49717 Shameer Kolothum      2022-06-15  56  static inline
e302eea8f49717 Shameer Kolothum      2022-06-15  57  void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
643b8e4d86f8b1 Lorenzo Pieralisi     2016-11-21  58  /* IOMMU interface */
db59e1b6e49201 Jean-Philippe Brucker 2021-06-18  59  static inline int iort_dma_get_ranges(struct device *dev, u64 *size)
db59e1b6e49201 Jean-Philippe Brucker 2021-06-18  60  { return -ENODEV; }
1d3c60066ee346 Jason Gunthorpe       2023-11-03 @61  int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
1d3c60066ee346 Jason Gunthorpe       2023-11-03  62  			    const u32 *id_in)
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18 @63  { return -ENODEV; }
8b4282e6b8e239 Shameer Kolothum      2018-02-13  64  static inline
55be25b8b5e4e2 Shameer Kolothum      2022-06-15  65  void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head)
8778b1d4811705 Shameer Kolothum      2022-06-15  66  { }
2b8652936f0ca9 Ard Biesheuvel        2020-11-19  67  

:::::: The code at line 63 was first introduced by commit
:::::: 11a8c5e3a94b12848f24d9c63b5c175ce0b80729 ACPI: Move IOMMU setup code out of IORT

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
