Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C53FF1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqLzU5a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700897072; x=1732433072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3pdSdmO5IKo7imulhWoatirNSkx4Z3/MSVv8M39Q6RA=;
  b=KqLzU5a3wm7yBP/Edz6+KydUqV1I3iOOwAOwMSzIztvTC4aSkuo/zA3L
   U4CiO6T2GvspHPq3z5ZDe/r4PXqFpvklFMZ6WzEYPv6hXbq/tJAYDJKH6
   CFpciUvmCydRircEHL4E/3XOxjBkdPPp47RTiAG5HYymHrB5O+ZR7m1qm
   ZGVA6f84lf6Y5O7vXVrjCgwAX0uV5JLDnJcpmW4Ge90e4ZIrM6SPNG9H/
   tKI0VkDlM4DEyNnOxNcoQjO9rifPX8EIvasMYwoBb/u/yu0GFQR8vbBsx
   0xCOBpSjQbW/SuVS/Wm73OGqDnW2qTwh0EymKrrZaottJVdBGjs4RyuMN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372655161"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="372655161"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1015075367"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="1015075367"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 23:24:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6n1g-0003iz-1d;
	Sat, 25 Nov 2023 07:24:28 +0000
Date: Sat, 25 Nov 2023 15:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 15/41] include/linux/acpi_iort.h:71:6:
 warning: 'iort_iommu_get_resv_regions' declared 'static' but never defined
Message-ID: <202311251448.DRw3BFlk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 1f761415430ba5ac67203383be9727e9a704c32e [15/41] ACPI: IORT: Remove fwspec from the reserved region code
config: arc-randconfig-r071-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251448.DRw3BFlk-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251448.DRw3BFlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251448.DRw3BFlk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/msi/irqdomain.c:5:
   include/linux/acpi_iort.h:74:1: error: expected identifier or '(' before '{' token
      74 | { }
         | ^
>> include/linux/acpi_iort.h:71:6: warning: 'iort_iommu_get_resv_regions' declared 'static' but never defined [-Wunused-function]
      71 | void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +71 include/linux/acpi_iort.h

    31	
    32	typedef int (*iort_for_each_fn)(struct acpi_iort_node *iommu, u32 streamid,
    33					void *info);
    34	int iort_iommu_for_each_id(struct device *dev, const u32 *id_in,
    35				   unsigned int *flags, iort_for_each_fn fn,
    36				   void *info);
    37	
    38	#ifdef CONFIG_ACPI_IORT
    39	u32 iort_msi_map_id(struct device *dev, u32 id);
    40	struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
    41						  enum irq_domain_bus_token bus_token);
    42	void acpi_configure_pmsi_domain(struct device *dev);
    43	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
    44			       struct list_head *head);
    45	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode,
    46			       struct list_head *head);
    47	/* IOMMU interface */
    48	int iort_dma_get_ranges(struct device *dev, u64 *size);
    49	int iort_iommu_configure_id(struct device *dev, const u32 *id_in);
    50	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head,
    51					 struct fwnode_handle *iommu_fwnode,
    52					 const u32 *fw_ids, unsigned int fw_num_ids);
    53	phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
    54	#else
    55	static inline u32 iort_msi_map_id(struct device *dev, u32 id)
    56	{ return id; }
    57	static inline struct irq_domain *iort_get_device_domain(
    58		struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
    59	{ return NULL; }
    60	static inline void acpi_configure_pmsi_domain(struct device *dev) { }
    61	static inline
    62	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    63	static inline
    64	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    65	/* IOMMU interface */
    66	static inline int iort_dma_get_ranges(struct device *dev, u64 *size)
    67	{ return -ENODEV; }
    68	static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
    69	{ return -ENODEV; }
    70	static inline
  > 71	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head,
    72					 struct fwnode_handle *iommu_fwnode,
    73					 const u32 *fw_ids, unsigned int fw_num_ids);
    74	{ }
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
