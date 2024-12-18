Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7C155336
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502395; cv=none; b=KknYNfdZSF+e3+fUBzuB4Y+yijjJLn3tvjWVjqtixBWnHQahiuzK3f+Qn/idmolu136kiw2Ugq5OxUpDBmjuR+dJxQSrtesJC27S3GOGST+F5L4QdPo9x6fLftAPprZ0YiDduSEJ+p+h8MKy9H3sTqC5tykaQaFEf+TEh7oSdMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502395; c=relaxed/simple;
	bh=gpIjnunANO1trR5AaOV2tUEuRvqzvBBDwcaq8NPS8Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/y9j6Bry3AEmukrsrA+h7dI/lbEnsK4KNN4A9yhSr0XjAy0T4wweTKBepmomA/vPdrYwGk+klvP2auzxhK8rkps2jcO7zqujIxhU2E5RQkDFBTVxBwHnKv+swRHn48ckdz9oBinAB8SVMGwZ1ht7KklB1zjK9L2j2r1/SM/0Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIOVdbo8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIOVdbo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734502393; x=1766038393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gpIjnunANO1trR5AaOV2tUEuRvqzvBBDwcaq8NPS8Qw=;
  b=nIOVdbo80p4aRAq/02crY6lOixN3UwJJ0xBBhTGCE8Z8sZuWuYpQPmPN
   1/UpRxDJGugQ3yA2y+H9kusgYox2eEZx5vO51YE+hMh2ZIUjU0mzdUduJ
   iDHLtf4nG+6ZEl4IIN2wlbGljTYU/WovmmxsMjCpZbCWBRtKn+nG29adp
   6uYqr5F6mrYcsfAGSIHbWTIW2XmFL6oI7fF7CSp4ysHxGw2qGUVahIPtC
   Jngiwdn6xgD/6Z4w5C6+5JGDS6ELy0YnbR20SF513VVHXSwJ6ruqMGp0q
   V6TmEvrfDtTZ/A2O2OI3jdmdRDjMHW66ZQ0nPCY1GhcBKJozSrG7hzRN8
   A==;
X-CSE-ConnectionGUID: W4I69aHBR6S4/3A8VQcKxQ==
X-CSE-MsgGUID: 6IDmdQKyQ12KuhP9F4PkUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45967783"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="45967783"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:13:13 -0800
X-CSE-ConnectionGUID: kxSMr9dmQ6+k6Nu1msyc7g==
X-CSE-MsgGUID: 2qZeAL4QTnKdkxEcnj4rtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98583920"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Dec 2024 22:13:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNnIz-000G9C-1d;
	Wed, 18 Dec 2024 06:13:09 +0000
Date: Wed, 18 Dec 2024 14:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 36/59] drivers/acpi/riscv/rimt.c:511:38:
 warning: variable 'fwspec' set but not used
Message-ID: <202412181445.WVVbXVBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   4fd509619498a267ba245e95fefba09eef65a97e
commit: 92e54add84ea71310bc3c9e2afa25b7721b18c54 [36/59] RISC-V: IOMMU: Add ACPI support using RIMT
config: riscv-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181445.WVVbXVBo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181445.WVVbXVBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181445.WVVbXVBo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/rimt.c:435:5: error: conflicting types for 'rimt_iommu_register'; have 'int(struct device *)'
     435 | int rimt_iommu_register(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/acpi/riscv/rimt.c:9:
   include/linux/acpi_rimt.h:10:5: note: previous declaration of 'rimt_iommu_register' with type 'int(struct device *, const struct iommu_ops *)'
      10 | int rimt_iommu_register(struct device *dev, const struct iommu_ops *ops);
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/acpi/riscv/rimt.c: In function 'rimt_iommu_configure_id':
>> drivers/acpi/riscv/rimt.c:511:38: warning: variable 'fwspec' set but not used [-Wunused-but-set-variable]
     511 |                 struct iommu_fwspec *fwspec;
         |                                      ^~~~~~


vim +/fwspec +511 drivers/acpi/riscv/rimt.c

   496	
   497	/**
   498	 * rimt_iommu_configure_id - Set-up IOMMU configuration for a device.
   499	 *
   500	 * @dev: device to configure
   501	 * @id_in: optional input id const value pointer
   502	 *
   503	 * Returns: 0 on success, <0 on failure
   504	 */
   505	int rimt_iommu_configure_id(struct device *dev, const u32 *id_in, const struct iommu_ops *ops)
   506	{
   507		struct acpi_rimt_node *node;
   508		int err = -ENODEV;
   509	
   510		if (dev_is_pci(dev)) {
 > 511			struct iommu_fwspec *fwspec;
   512			struct pci_bus *bus = to_pci_dev(dev)->bus;
   513			struct rimt_pci_alias_info info = { .dev = dev };
   514	
   515			node = rimt_scan_node(ACPI_RIMT_NODE_PCI_ROOT_COMPLEX,
   516					      rimt_match_node_callback, &bus->dev);
   517			if (!node)
   518				return -ENODEV;
   519	
   520			info.node = node;
   521			info.ops = ops;
   522			err = pci_for_each_dma_alias(to_pci_dev(dev),
   523						     rimt_pci_iommu_init, &info);
   524	
   525			fwspec = dev_iommu_fwspec_get(dev);
   526		} else {
   527			node = rimt_scan_node(ACPI_RIMT_NODE_PLAT_DEVICE,
   528					      rimt_match_node_callback, dev);
   529			if (!node)
   530				return -ENODEV;
   531	
   532			err = id_in ? rimt_nc_iommu_map_id(dev, node, id_in) :
   533				      rimt_nc_iommu_map(dev, node);
   534		}
   535	
   536		return err;
   537	}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
