Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912711C8D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJ/UN/yF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699521958; x=1731057958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAPhmBsdqOYwOvz/JzR8Gd3xWxOxNqPenlR2Ee7NySE=;
  b=oJ/UN/yFYt84DrsJ8VLhjAr7ogiJsduk0gYSXbGo3O8V0D9Ch0WbVqHA
   KCBOm7tPHHI0dXlJwWv+OntmWOKHgCEYpyGhkxKiRU8OQKetMkTyNfkde
   OHRBFC0w4r+zFwEG4vz1NDUvp8iL+coAztCKV8T9ZClzFEb68f0fe1Iz9
   Qw0MUApgYw72fAVu0PkNF0xfWhW2kjYeRFQtLTjgsTY7Lvmcg8jG/tjwE
   7MD06vc6nSjgyVDLPYdgSKKK8Y4lYS4k3pEckAJKkNcs5N76yP8dl4NzI
   69v/r1zM37l/QK6xr3rCRJYGScIoaGxTcPq4hCJQ2ve1UqxuWUu/8Bo+8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392821466"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="392821466"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 01:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739795037"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="739795037"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2023 01:25:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r11IQ-0008cO-1X;
	Thu, 09 Nov 2023 09:25:54 +0000
Date: Thu, 9 Nov 2023 17:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] drivers/acpi/arm64/iort.c:1324:
 warning: Function parameter or member 'fwspec' not described in
 'iort_iommu_configure_id'
Message-ID: <202311091702.3FTKd9HM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   e389aa08698cc1095a59893e59ec6aaf37d997b4
commit: e18e736545c5c0b7ed911ac44028c3af5f46b33f [11/19] acpi: Do not use dev->iommu within acpi_iommu_configure()
config: arm64-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311091702.3FTKd9HM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091702.3FTKd9HM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091702.3FTKd9HM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/arm64/iort.c:1324: warning: Function parameter or member 'fwspec' not described in 'iort_iommu_configure_id'


vim +1324 drivers/acpi/arm64/iort.c

b8e069a2a8da02 Lorenzo Pieralisi     2020-06-19  1312  
b8e069a2a8da02 Lorenzo Pieralisi     2020-06-19  1313  
8212688600edcb Lorenzo Pieralisi     2019-05-16  1314  /**
b8e069a2a8da02 Lorenzo Pieralisi     2020-06-19  1315   * iort_iommu_configure_id - Set-up IOMMU configuration for a device.
8212688600edcb Lorenzo Pieralisi     2019-05-16  1316   *
8212688600edcb Lorenzo Pieralisi     2019-05-16  1317   * @dev: device to configure
b8e069a2a8da02 Lorenzo Pieralisi     2020-06-19  1318   * @id_in: optional input id const value pointer
8212688600edcb Lorenzo Pieralisi     2019-05-16  1319   *
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1320   * Returns: 0 on success, <0 on failure
8212688600edcb Lorenzo Pieralisi     2019-05-16  1321   */
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1322  int iort_iommu_configure_id(struct iommu_fwspec *fwspec, struct device *dev,
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1323  			    const u32 *id_in)
8212688600edcb Lorenzo Pieralisi     2019-05-16 @1324  {
b8e069a2a8da02 Lorenzo Pieralisi     2020-06-19  1325  	struct acpi_iort_node *node;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1326  	int err = -ENODEV;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1327  
8212688600edcb Lorenzo Pieralisi     2019-05-16  1328  	if (dev_is_pci(dev)) {
8212688600edcb Lorenzo Pieralisi     2019-05-16  1329  		struct pci_bus *bus = to_pci_dev(dev)->bus;
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1330  		struct iort_pci_alias_info info = { .dev = dev,
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1331  						    .fwspec = fwspec };
8212688600edcb Lorenzo Pieralisi     2019-05-16  1332  
8212688600edcb Lorenzo Pieralisi     2019-05-16  1333  		node = iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
8212688600edcb Lorenzo Pieralisi     2019-05-16  1334  				      iort_match_node_callback, &bus->dev);
8212688600edcb Lorenzo Pieralisi     2019-05-16  1335  		if (!node)
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1336  			return -ENODEV;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1337  
8212688600edcb Lorenzo Pieralisi     2019-05-16  1338  		info.node = node;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1339  		err = pci_for_each_dma_alias(to_pci_dev(dev),
8212688600edcb Lorenzo Pieralisi     2019-05-16  1340  					     iort_pci_iommu_init, &info);
8212688600edcb Lorenzo Pieralisi     2019-05-16  1341  
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1342  		if (iort_pci_rc_supports_ats(node))
6990ec796a7470 Joerg Roedel          2020-03-26  1343  			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1344  	} else {
8212688600edcb Lorenzo Pieralisi     2019-05-16  1345  		node = iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
8212688600edcb Lorenzo Pieralisi     2019-05-16  1346  				      iort_match_node_callback, dev);
8212688600edcb Lorenzo Pieralisi     2019-05-16  1347  		if (!node)
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1348  			return -ENODEV;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1349  
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1350  		err = id_in ? iort_nc_iommu_map_id(fwspec, dev, node, id_in) :
e18e736545c5c0 Jason Gunthorpe       2023-11-03  1351  			      iort_nc_iommu_map(fwspec, dev, node);
da22565d1d733e Jean-Philippe Brucker 2020-01-15  1352  
da22565d1d733e Jean-Philippe Brucker 2020-01-15  1353  		if (!err)
da22565d1d733e Jean-Philippe Brucker 2020-01-15  1354  			iort_named_component_init(dev, node);
8212688600edcb Lorenzo Pieralisi     2019-05-16  1355  	}
8212688600edcb Lorenzo Pieralisi     2019-05-16  1356  
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1357  	return err;
8212688600edcb Lorenzo Pieralisi     2019-05-16  1358  }
b8e069a2a8da02 Lorenzo Pieralisi     2020-06-19  1359  

:::::: The code at line 1324 was first introduced by commit
:::::: 8212688600edcb4a147ab7e4634c448938f9121a ACPI/IORT: Fix build error when IOMMU_SUPPORT is disabled

:::::: TO: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
