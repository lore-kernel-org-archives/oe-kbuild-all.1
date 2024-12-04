Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDAE14D6F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 03:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733284442; cv=none; b=JYxXrBVwVXeY7STRz9JabhhxjOWAclVjSJWB3cKjEXlFNWpkOTMTG0mkfgR9tJBeTJUYx0kRnWxU+sfPp0SOn8Wcwoy0M3rEeTe+qcIaHy73EHbjHUa79zs7D3wTxyNOKIhFCZByearlHyPIjIwjN2h5QgbyCdOevuXRYUEvPMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733284442; c=relaxed/simple;
	bh=zI0fWRw0ZsgczJVWg4tXQ9jO9RHTRAMoJjn+B5byVTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DH5n4AgObZFy9I0keKILzk9rQZMuqlQduVd95oCGPQFFeMC23k+RdrGNQiCSi1MXEYk9iOt0kH4+SurMX+QKvgJhH0ojBvmyUP5z3ggb/tfxf4WUH4boq04MTvCRJm9JHiV2F5qbsNITI8zzSxEGAtz6b+LMJvnBMeXKQw7bA5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/hoHsdu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/hoHsdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733284440; x=1764820440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zI0fWRw0ZsgczJVWg4tXQ9jO9RHTRAMoJjn+B5byVTs=;
  b=M/hoHsduK5tp6ZQUW/EkAF4j6olQuNVQmRt0dUtVFp0WYchUJkd/8pfY
   TJnfQeTNj8FaLlE2GtNT6772MVSbqoEWY7gwgHD/dQpJfXE2BCgMo6v21
   5cWyDk8daQqtlEZVeAFre0otM+biC47LvSyNbeaVBFc7E8gEDJC53ye9M
   0rhmNht20A+nfEOUjO7JTAUEd0H/tXBDbg63yLC5luz76lgoL0t4bYJcL
   pxUHWRuVhBsRmYR2QMWYtZYSJZkUg0djkmN94N6vnydW2gXUm5CcxX0ZA
   LeszhlUmImtdlx/aabHz3yyrFGmsum0I/Q7FHIPADZoI7D+Svccxor6s+
   A==;
X-CSE-ConnectionGUID: JDioBM1hSyS6vjV/7c5WRA==
X-CSE-MsgGUID: WsmmO24cRESW1ZrVd3qUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44010563"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44010563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 19:53:59 -0800
X-CSE-ConnectionGUID: fkpS+mBaTZOHlwv87EqxgQ==
X-CSE-MsgGUID: Kf0ppE4nRly3OMbpt6F8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="131096112"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Dec 2024 19:53:56 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIgSX-0002Sx-2d;
	Wed, 04 Dec 2024 03:53:53 +0000
Date: Wed, 4 Dec 2024 11:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/acpi/arm64/iort.c:969:28: error: 'struct device' has no member named
 'iommu_fwspec'
Message-ID: <202412041114.5NSh23I3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joerg,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: af26f4f021e66233136ec1ec03363a08cbef4da0 [1/1] iommu: Move iommu_fwspec to struct dev_iommu
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041114.5NSh23I3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041114.5NSh23I3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041114.5NSh23I3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c: In function 'iort_iommu_configure':
>> drivers/acpi/arm64/iort.c:969:28: error: 'struct device' has no member named 'iommu_fwspec'
     969 |                         dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
         |                            ^~


vim +969 drivers/acpi/arm64/iort.c

643b8e4d86f8b1a Lorenzo Pieralisi 2016-11-21   931  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   932  /**
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   933   * iort_iommu_configure - Set-up IOMMU configuration for a device.
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   934   *
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   935   * @dev: device to configure
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   936   *
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   937   * Returns: iommu_ops pointer on configuration success
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   938   *          NULL on configuration failure
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   939   */
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   940  const struct iommu_ops *iort_iommu_configure(struct device *dev)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   941  {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   942  	struct acpi_iort_node *node, *parent;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   943  	const struct iommu_ops *ops;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   944  	u32 streamid = 0;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   945  	int err = -ENODEV;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   946  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   947  	/*
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   948  	 * If we already translated the fwspec there
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   949  	 * is nothing left to do, return the iommu_ops.
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   950  	 */
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   951  	ops = iort_fwspec_iommu_ops(dev);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   952  	if (ops)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   953  		return ops;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   954  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   955  	if (dev_is_pci(dev)) {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   956  		struct pci_bus *bus = to_pci_dev(dev)->bus;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   957  		struct iort_pci_alias_info info = { .dev = dev };
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   958  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   959  		node = iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   960  				      iort_match_node_callback, &bus->dev);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   961  		if (!node)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   962  			return NULL;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   963  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   964  		info.node = node;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   965  		err = pci_for_each_dma_alias(to_pci_dev(dev),
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   966  					     iort_pci_iommu_init, &info);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   967  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   968  		if (!err && iort_pci_rc_supports_ats(node))
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  @969  			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   970  	} else {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   971  		int i = 0;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   972  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   973  		node = iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   974  				      iort_match_node_callback, dev);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   975  		if (!node)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   976  			return NULL;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   977  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   978  		do {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   979  			parent = iort_node_map_platform_id(node, &streamid,
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   980  							   IORT_IOMMU_TYPE,
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   981  							   i++);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   982  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   983  			if (parent)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   984  				err = iort_iommu_xlate(dev, parent, streamid);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   985  		} while (parent && !err);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   986  	}
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   987  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   988  	/*
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   989  	 * If we have reason to believe the IOMMU driver missed the initial
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   990  	 * add_device callback for dev, replay it to get things in order.
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   991  	 */
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   992  	if (!err) {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   993  		ops = iort_fwspec_iommu_ops(dev);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   994  		err = iort_add_device_replay(ops, dev);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   995  	}
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   996  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   997  	/* Ignore all other errors apart from EPROBE_DEFER */
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   998  	if (err == -EPROBE_DEFER) {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16   999  		ops = ERR_PTR(err);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1000  	} else if (err) {
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1001  		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1002  		ops = NULL;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1003  	}
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1004  
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1005  	return ops;
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1006  }
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1007  #else
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1008  static inline const struct iommu_ops *iort_fwspec_iommu_ops(struct device *dev)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1009  { return NULL; }
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1010  static inline int iort_add_device_replay(const struct iommu_ops *ops,
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1011  					 struct device *dev)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1012  { return 0; }
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1013  int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1014  { return 0; }
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1015  const struct iommu_ops *iort_iommu_configure(struct device *dev)
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1016  { return NULL; }
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1017  #endif
8212688600edcb4 Lorenzo Pieralisi 2019-05-16  1018  

:::::: The code at line 969 was first introduced by commit
:::::: 8212688600edcb4a147ab7e4634c448938f9121a ACPI/IORT: Fix build error when IOMMU_SUPPORT is disabled

:::::: TO: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
