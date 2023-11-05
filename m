Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF7E54D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk/Tf4iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699220572; x=1730756572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjQUtYyhtEhjAfoa4tNSOHGTUHIQqBsujG0uApwqF/0=;
  b=Kk/Tf4iz16yhfCZC7sUi4ovpWBevOKa46EAbevvTvA4OARq65jLtWocM
   pmU+M6xV5qNytb1QnTf95DcYMbK7B9he8nfIbxilHbduiSy0GrLE/70Ic
   AZiW8W86jxUw6MtLenVP6402nt1KYj0xLJw+EcLJc0/OyDsfKJWEMcRal
   vxSQYEKw5/CgF0IBjxN3FIowmdIE5FDQISJVyzgogo/NZstPUpj6rkXfC
   N4ng0SkGHFqmGDewI/UNkyK5P4JG0Glu8DVMiqIQUFq5mFdzQNjXmE1Yi
   57WUUpbGbnQPbq62arsIlGNtr2X6qcb67xq8ALjZI6S/GQvot3QAg4GqL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2161359"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2161359"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 13:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="791287999"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="791287999"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Nov 2023 13:42:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzktM-0005og-08;
	Sun, 05 Nov 2023 21:42:48 +0000
Date: Mon, 6 Nov 2023 05:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] include/linux/acpi_iort.h:61:36:
 warning: 'struct iommu_fwspec' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202311060523.NvgNnYma-lkp@intel.com>
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
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060523.NvgNnYma-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060523.NvgNnYma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060523.NvgNnYma-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/msi/irqdomain.c:5:
>> include/linux/acpi_iort.h:61:36: warning: 'struct iommu_fwspec' declared inside parameter list will not be visible outside of this definition or declaration
      61 | int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
         |                                    ^~~~~~~~~~~~
   include/linux/acpi_iort.h:61:5: warning: no previous prototype for 'iort_iommu_configure_id' [-Wmissing-prototypes]
      61 | int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +61 include/linux/acpi_iort.h

    31	
    32	#ifdef CONFIG_ACPI_IORT
    33	u32 iort_msi_map_id(struct device *dev, u32 id);
    34	struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
    35						  enum irq_domain_bus_token bus_token);
    36	void acpi_configure_pmsi_domain(struct device *dev);
    37	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
    38			       struct list_head *head);
    39	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode,
    40			       struct list_head *head);
    41	/* IOMMU interface */
    42	int iort_dma_get_ranges(struct device *dev, u64 *size);
    43	int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
    44				    const u32 *id_in);
    45	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head);
    46	phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
    47	#else
    48	static inline u32 iort_msi_map_id(struct device *dev, u32 id)
    49	{ return id; }
    50	static inline struct irq_domain *iort_get_device_domain(
    51		struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
    52	{ return NULL; }
    53	static inline void acpi_configure_pmsi_domain(struct device *dev) { }
    54	static inline
    55	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    56	static inline
    57	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    58	/* IOMMU interface */
    59	static inline int iort_dma_get_ranges(struct device *dev, u64 *size)
    60	{ return -ENODEV; }
  > 61	int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
    62				    const u32 *id_in)
    63	{ return -ENODEV; }
    64	static inline
    65	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head)
    66	{ }
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
