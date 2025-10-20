Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ABA1E492A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992963; cv=none; b=VCwOPFiyjy7UuO/ZjR0ibNHJDCWeOvQgbb/QBNSk9Y/BHfgmUFDiH9NacpT33fxcgwGq3H0mzA7TwbKOQZRaGHRDgRX9OR0uo5f4GzesV9FX4vBU6WOm4syF1vwmLDBuvTLI8TL3TDyW/GrvwsP1msy2o9oCyUETB/kLuaxNZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992963; c=relaxed/simple;
	bh=ZUNQgCJt4qCV5DcAvvkXEnEXv4+LKQT8z9tiLVkoCGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFo4Mi94+cgQ7bJQ5kvZ/gmZgRBSqRlELzguUoqzjIhK1/dY+J3pKkg8XF96xB1l4LCQ7Q1clTvk2bpN+a1+pKMfgODggyX5BhRPu32ewLr/7HplikeBCK3u7dfuhbkoE31tE5Ay0NR3ZiwTx+wcvTdPUL3inNwZjDZu0lZiGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjUhhgMR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjUhhgMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760992962; x=1792528962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUNQgCJt4qCV5DcAvvkXEnEXv4+LKQT8z9tiLVkoCGg=;
  b=RjUhhgMRBxOy1vm4P6ppF4xRY2+rLf7EHwBZe9wzoFp16+pnDY0KECUM
   Wbd46A0dsIEX/2jBuIJwzbe7sz+aPaITfEioVRq+3vq9NKjEbn+MtG8vw
   MmsHRa5EzmMnwgiPOzXBVjLXMD8f984WYR3OphSKStIIax8cOyMiiu3Y0
   X/gGg1EA4PpHAKKKi6+PYWJq9NZ52JOSoFI447XP2TaSOkIFRMgutmPBg
   D11U7c1P/mru1yJaFvho5Ax6Fr/+mpMz5ka7tFuyWT4fIEaQlfhfREk08
   6+9FW1S2eH59ltLe+LxA4dGh6SunpLUQIWxL+RVShkkpTOQsRi4zO8Ju3
   Q==;
X-CSE-ConnectionGUID: pVyB7FA0RfSuSzZh8UYeQw==
X-CSE-MsgGUID: eg6pWRwKRCedLsjXbsVY5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013669"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63013669"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 13:42:41 -0700
X-CSE-ConnectionGUID: kr1pTGOQSAabyp3rSjBRyQ==
X-CSE-MsgGUID: DjPVvfLbSI6jPXqIhtNqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183899373"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Oct 2025 13:42:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAwi8-000A9d-21;
	Mon, 20 Oct 2025 20:42:38 +0000
Date: Tue, 21 Oct 2025 04:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gic-v5-acpi 6/7] include/linux/acpi_iort.h:54:
 multiple definition of `iort_its_translate_pa';
 drivers/acpi/glue.o:include/linux/acpi_iort.h:54: first defined here
Message-ID: <202510210413.zBRo125g-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210413.zBRo125g-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210413.zBRo125g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210413.zBRo125g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/dma-iommu.c:11:
>> include/linux/acpi_iort.h:53:5: warning: no previous prototype for 'iort_its_translate_pa' [-Wmissing-prototypes]
      53 | int iort_its_translate_pa(struct fwnode_handle *node, phys_addr_t *base)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/acpi/scan.o: in function `iort_its_translate_pa':
>> include/linux/acpi_iort.h:54: multiple definition of `iort_its_translate_pa'; drivers/acpi/glue.o:include/linux/acpi_iort.h:54: first defined here
   ld: drivers/iommu/dma-iommu.o: in function `iort_its_translate_pa':
>> include/linux/acpi_iort.h:54: multiple definition of `iort_its_translate_pa'; drivers/acpi/glue.o:include/linux/acpi_iort.h:54: first defined here
   ld: drivers/perf/arm_smmuv3_pmu.o: in function `iort_its_translate_pa':
>> include/linux/acpi_iort.h:54: multiple definition of `iort_its_translate_pa'; drivers/acpi/glue.o:include/linux/acpi_iort.h:54: first defined here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +54 include/linux/acpi_iort.h

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
  > 54	{ return -ENODEV; }
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
