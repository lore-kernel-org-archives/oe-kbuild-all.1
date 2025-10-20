Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787052AD22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990440; cv=none; b=M18Ug03YFLek07+/NkQWvjx8LOmyOU4SV3F5XdOEolxTHQkBcvO3ESBO5pZGJc/g/TuTWSBn/MxzK9QtVNLLqYkmnMF3qOl+0th5ejOfvcoNZZRVIqOmJ1afF30t4MARN0Rj9q6J3nkSVCiQhDIlcaFIXbyTsDPtMp7ciKDpPjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990440; c=relaxed/simple;
	bh=XjMX9nCL9fWkeJeHsXyopGA9i+mqR+kmZGhNXA+sB38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DuZlDex4M77+azza/qvuf9DAHDyVAdAlCXn5aBtIUH7uSJUoVDC2M63y9TuxbpJ1TpqzNNP5GBY3JkURF2JfD1U1FSW0VuJi2BuNEn+8ka4zu08LTWlqtZ1yDG7LrqZ3Rz6cMXMwRCL/L8fIOFwuPdDmSudLrqPexPQ9gQRfHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRpWUG/x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRpWUG/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760990439; x=1792526439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjMX9nCL9fWkeJeHsXyopGA9i+mqR+kmZGhNXA+sB38=;
  b=XRpWUG/xwfKsVimZ1bIy9Msg5fM4s9z9YRIiHiblS9TxYcUmuzeGPf0R
   NVpkyBrDje5G4PCBoZHE8j02duuy3lR1zw7hIfbvjGiYz1ufgDcI8/aUm
   asYdt6EBMHHIHHx7qfDKLu6cNbbDs4RVeTufcGxSL3DaTZirjHn/3GZsy
   J3QyLwANTTFMbzx4GcaZOIS6w/WTcUNbTa4fB7//GuAKvgA3Inkr+vY7C
   JnImH8pFsuabvbdR7ZNC4B1zRqvWZiWvjOcmxJE6HY6g9FGX9tDkJxwui
   DwQufc+SY+Z8E8uJPATln8Dr0TAZFlKA17klkW0NgBc0pXqwB7jN7ftw/
   Q==;
X-CSE-ConnectionGUID: eOYMp7JcQsyrVs3qVrKTNQ==
X-CSE-MsgGUID: KWvLY9wPSqm/FnfbrCHC0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62145513"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62145513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:00:33 -0700
X-CSE-ConnectionGUID: 3jjca4ISTmG2CRsQNhIOHw==
X-CSE-MsgGUID: or8OlmkwQDKu3C35TRYKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187674319"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2025 13:00:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAw3R-000A7Y-17;
	Mon, 20 Oct 2025 20:00:29 +0000
Date: Tue, 21 Oct 2025 03:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gic-v5-acpi 6/7] include/linux/acpi_iort.h:53:5:
 warning: no previous prototype for function 'iort_its_translate_pa'
Message-ID: <202510210300.LKAgjghO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gic-v5-acpi
head:   2507aff522df8a03ac3b31cfd2f5cf564bf77be1
commit: c7e5798c025e652428c0b5164fedfc23d26bea33 [6/7] irqchip/gic-v5: Add ACPI ITS probing
config: x86_64-buildonly-randconfig-003-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210300.LKAgjghO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210300.LKAgjghO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210300.LKAgjghO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/dma-iommu.c:11:
>> include/linux/acpi_iort.h:53:5: warning: no previous prototype for function 'iort_its_translate_pa' [-Wmissing-prototypes]
      53 | int iort_its_translate_pa(struct fwnode_handle *node, phys_addr_t *base)
         |     ^
   include/linux/acpi_iort.h:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | int iort_its_translate_pa(struct fwnode_handle *node, phys_addr_t *base)
         | ^
         | static 
   1 warning generated.


vim +/iort_its_translate_pa +53 include/linux/acpi_iort.h

    30	
    31	#ifdef CONFIG_ACPI_IORT
    32	u32 iort_msi_map_id(struct device *dev, u32 id);
    33	u32 iort_msi_map_id_fwnode(struct device *dev, u32 id, struct fwnode_handle **node);
    34	int iort_its_translate_pa(struct fwnode_handle *node, phys_addr_t *base);
    35	struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
    36						  enum irq_domain_bus_token bus_token);
    37	int iort_pmsi_get_msi_info(struct device *dev, u32 *dev_id, phys_addr_t *pa);
    38	void acpi_configure_pmsi_domain(struct device *dev);
    39	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
    40			       struct list_head *head);
    41	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode,
    42			       struct list_head *head);
    43	/* IOMMU interface */
    44	int iort_dma_get_ranges(struct device *dev, u64 *limit);
    45	int iort_iommu_configure_id(struct device *dev, const u32 *id_in);
    46	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head);
    47	phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
    48	#else
    49	static inline u32 iort_msi_map_id(struct device *dev, u32 id)
    50	{ return id; }
    51	static inline u32 iort_msi_map_id_fwnode(struct device *dev, u32 id, struct fwnode_handle **node)
    52	{ return id; }
  > 53	int iort_its_translate_pa(struct fwnode_handle *node, phys_addr_t *base)
    54	{ return -ENODEV; }
    55	static inline struct irq_domain *iort_get_device_domain(
    56		struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
    57	{ return NULL; }
    58	static inline int iort_pmsi_get_msi_info(struct device *dev, u32 *dev_id, phys_addr_t *pa)
    59	{ return -ENODEV; }
    60	static inline void acpi_configure_pmsi_domain(struct device *dev) { }
    61	static inline
    62	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    63	static inline
    64	void iort_put_rmr_sids(struct fwnode_handle *iommu_fwnode, struct list_head *head) { }
    65	/* IOMMU interface */
    66	static inline int iort_dma_get_ranges(struct device *dev, u64 *limit)
    67	{ return -ENODEV; }
    68	static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
    69	{ return -ENODEV; }
    70	static inline
    71	void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head)
    72	{ }
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
