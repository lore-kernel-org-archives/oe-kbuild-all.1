Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8891A76DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727194774; cv=none; b=VRdpu3Yen5n425/WXSZt9zh36ops0S0Qc27NpZj6Dcn0Jb6IpzvfA9lFgfYRzcK+owjYDJmZPc1Q50QnRDICdTGB6YzvzQ+liqt01Te+ladNnoMYngIWoYqE18Ud5GSM7WT8KigG7fNc4nPs5elNTTaln/C4O558RKxFyICfyp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727194774; c=relaxed/simple;
	bh=YmZ3BvSx1P+cYxZR0mv3ftkD7ta+PRRESo7jGV3Nezk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPNoVgbscyqV1SdGVzDf55m7l7ExJz3P98YLcX2xDPSzImFkzN+s3ziuzKRzur0Psfya7lHgZA+98e1XYU/WSrMH7vXm3CjD+rznybZFwZjFurOCtOLPMJyPVKVRdjAbGYC3Sw9bZClo8BzR00tEyOgL3Jq7urJfLlDTdwwpJSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koxISL2z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koxISL2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727194773; x=1758730773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmZ3BvSx1P+cYxZR0mv3ftkD7ta+PRRESo7jGV3Nezk=;
  b=koxISL2zrvX9zlbRwvCs/TlvrtNxFqwnjwZCEJ/NSzXitVuUMdA/RrGa
   L5XO7jR9vEtXgb+GJtq5HNpCLnQh8jCARy4BEwfBUVehYN5BnaaQb4Lh0
   cDE8CDKQBSmWWFDWlBKY78tv1C+wRbv1qfdPgCSD5MVXdf02kf6kNsqnf
   XXacIkteVpbXh6x1Cb/CLtIm+3i27dED+2gztBl0mDCpWL2+10oNO9mj0
   PknaYVeol8PYv3gGEC47Xf74+SUQb5Zr7Edin4buGaEjC1Bs+MnKT+MSr
   ZcDmOEvh0sptK3lCaQy/S2Sv6q5wScDWR9iDFkLSoSWVVgxg+Q6ojWAfx
   A==;
X-CSE-ConnectionGUID: OK3jAuN9TTayXqYqoZLoOg==
X-CSE-MsgGUID: oA2eyLpSSeu35FCOf7sFfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26149635"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26149635"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 09:19:31 -0700
X-CSE-ConnectionGUID: XjgB5js0Thmm4vEPT5S/DQ==
X-CSE-MsgGUID: spSxWMmdQkCDk8UpfWF8UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="75863087"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2024 09:19:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st8G4-000IYl-2R;
	Tue, 24 Sep 2024 16:19:24 +0000
Date: Wed, 25 Sep 2024 00:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 232/2441]
 drivers/acpi/arm64/iort.c:969:28: error: 'struct device' has no member named
 'iommu_fwspec'
Message-ID: <202409250015.zVmfHZX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: af26f4f021e66233136ec1ec03363a08cbef4da0 [232/2441] iommu: Move iommu_fwspec to struct dev_iommu
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240925/202409250015.zVmfHZX8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250015.zVmfHZX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250015.zVmfHZX8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c: In function 'iort_iommu_configure':
>> drivers/acpi/arm64/iort.c:969:28: error: 'struct device' has no member named 'iommu_fwspec'
     969 |                         dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
         |                            ^~


vim +969 drivers/acpi/arm64/iort.c

643b8e4d86f8b1 Lorenzo Pieralisi 2016-11-21   931  
8212688600edcb Lorenzo Pieralisi 2019-05-16   932  /**
8212688600edcb Lorenzo Pieralisi 2019-05-16   933   * iort_iommu_configure - Set-up IOMMU configuration for a device.
8212688600edcb Lorenzo Pieralisi 2019-05-16   934   *
8212688600edcb Lorenzo Pieralisi 2019-05-16   935   * @dev: device to configure
8212688600edcb Lorenzo Pieralisi 2019-05-16   936   *
8212688600edcb Lorenzo Pieralisi 2019-05-16   937   * Returns: iommu_ops pointer on configuration success
8212688600edcb Lorenzo Pieralisi 2019-05-16   938   *          NULL on configuration failure
8212688600edcb Lorenzo Pieralisi 2019-05-16   939   */
8212688600edcb Lorenzo Pieralisi 2019-05-16   940  const struct iommu_ops *iort_iommu_configure(struct device *dev)
8212688600edcb Lorenzo Pieralisi 2019-05-16   941  {
8212688600edcb Lorenzo Pieralisi 2019-05-16   942  	struct acpi_iort_node *node, *parent;
8212688600edcb Lorenzo Pieralisi 2019-05-16   943  	const struct iommu_ops *ops;
8212688600edcb Lorenzo Pieralisi 2019-05-16   944  	u32 streamid = 0;
8212688600edcb Lorenzo Pieralisi 2019-05-16   945  	int err = -ENODEV;
8212688600edcb Lorenzo Pieralisi 2019-05-16   946  
8212688600edcb Lorenzo Pieralisi 2019-05-16   947  	/*
8212688600edcb Lorenzo Pieralisi 2019-05-16   948  	 * If we already translated the fwspec there
8212688600edcb Lorenzo Pieralisi 2019-05-16   949  	 * is nothing left to do, return the iommu_ops.
8212688600edcb Lorenzo Pieralisi 2019-05-16   950  	 */
8212688600edcb Lorenzo Pieralisi 2019-05-16   951  	ops = iort_fwspec_iommu_ops(dev);
8212688600edcb Lorenzo Pieralisi 2019-05-16   952  	if (ops)
8212688600edcb Lorenzo Pieralisi 2019-05-16   953  		return ops;
8212688600edcb Lorenzo Pieralisi 2019-05-16   954  
8212688600edcb Lorenzo Pieralisi 2019-05-16   955  	if (dev_is_pci(dev)) {
8212688600edcb Lorenzo Pieralisi 2019-05-16   956  		struct pci_bus *bus = to_pci_dev(dev)->bus;
8212688600edcb Lorenzo Pieralisi 2019-05-16   957  		struct iort_pci_alias_info info = { .dev = dev };
8212688600edcb Lorenzo Pieralisi 2019-05-16   958  
8212688600edcb Lorenzo Pieralisi 2019-05-16   959  		node = iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
8212688600edcb Lorenzo Pieralisi 2019-05-16   960  				      iort_match_node_callback, &bus->dev);
8212688600edcb Lorenzo Pieralisi 2019-05-16   961  		if (!node)
8212688600edcb Lorenzo Pieralisi 2019-05-16   962  			return NULL;
8212688600edcb Lorenzo Pieralisi 2019-05-16   963  
8212688600edcb Lorenzo Pieralisi 2019-05-16   964  		info.node = node;
8212688600edcb Lorenzo Pieralisi 2019-05-16   965  		err = pci_for_each_dma_alias(to_pci_dev(dev),
8212688600edcb Lorenzo Pieralisi 2019-05-16   966  					     iort_pci_iommu_init, &info);
8212688600edcb Lorenzo Pieralisi 2019-05-16   967  
8212688600edcb Lorenzo Pieralisi 2019-05-16   968  		if (!err && iort_pci_rc_supports_ats(node))
8212688600edcb Lorenzo Pieralisi 2019-05-16  @969  			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
8212688600edcb Lorenzo Pieralisi 2019-05-16   970  	} else {
8212688600edcb Lorenzo Pieralisi 2019-05-16   971  		int i = 0;
8212688600edcb Lorenzo Pieralisi 2019-05-16   972  
8212688600edcb Lorenzo Pieralisi 2019-05-16   973  		node = iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
8212688600edcb Lorenzo Pieralisi 2019-05-16   974  				      iort_match_node_callback, dev);
8212688600edcb Lorenzo Pieralisi 2019-05-16   975  		if (!node)
8212688600edcb Lorenzo Pieralisi 2019-05-16   976  			return NULL;
8212688600edcb Lorenzo Pieralisi 2019-05-16   977  
8212688600edcb Lorenzo Pieralisi 2019-05-16   978  		do {
8212688600edcb Lorenzo Pieralisi 2019-05-16   979  			parent = iort_node_map_platform_id(node, &streamid,
8212688600edcb Lorenzo Pieralisi 2019-05-16   980  							   IORT_IOMMU_TYPE,
8212688600edcb Lorenzo Pieralisi 2019-05-16   981  							   i++);
8212688600edcb Lorenzo Pieralisi 2019-05-16   982  
8212688600edcb Lorenzo Pieralisi 2019-05-16   983  			if (parent)
8212688600edcb Lorenzo Pieralisi 2019-05-16   984  				err = iort_iommu_xlate(dev, parent, streamid);
8212688600edcb Lorenzo Pieralisi 2019-05-16   985  		} while (parent && !err);
8212688600edcb Lorenzo Pieralisi 2019-05-16   986  	}
8212688600edcb Lorenzo Pieralisi 2019-05-16   987  
8212688600edcb Lorenzo Pieralisi 2019-05-16   988  	/*
8212688600edcb Lorenzo Pieralisi 2019-05-16   989  	 * If we have reason to believe the IOMMU driver missed the initial
8212688600edcb Lorenzo Pieralisi 2019-05-16   990  	 * add_device callback for dev, replay it to get things in order.
8212688600edcb Lorenzo Pieralisi 2019-05-16   991  	 */
8212688600edcb Lorenzo Pieralisi 2019-05-16   992  	if (!err) {
8212688600edcb Lorenzo Pieralisi 2019-05-16   993  		ops = iort_fwspec_iommu_ops(dev);
8212688600edcb Lorenzo Pieralisi 2019-05-16   994  		err = iort_add_device_replay(ops, dev);
8212688600edcb Lorenzo Pieralisi 2019-05-16   995  	}
8212688600edcb Lorenzo Pieralisi 2019-05-16   996  
8212688600edcb Lorenzo Pieralisi 2019-05-16   997  	/* Ignore all other errors apart from EPROBE_DEFER */
8212688600edcb Lorenzo Pieralisi 2019-05-16   998  	if (err == -EPROBE_DEFER) {
8212688600edcb Lorenzo Pieralisi 2019-05-16   999  		ops = ERR_PTR(err);
8212688600edcb Lorenzo Pieralisi 2019-05-16  1000  	} else if (err) {
8212688600edcb Lorenzo Pieralisi 2019-05-16  1001  		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
8212688600edcb Lorenzo Pieralisi 2019-05-16  1002  		ops = NULL;
8212688600edcb Lorenzo Pieralisi 2019-05-16  1003  	}
8212688600edcb Lorenzo Pieralisi 2019-05-16  1004  
8212688600edcb Lorenzo Pieralisi 2019-05-16  1005  	return ops;
8212688600edcb Lorenzo Pieralisi 2019-05-16  1006  }
8212688600edcb Lorenzo Pieralisi 2019-05-16  1007  #else
8212688600edcb Lorenzo Pieralisi 2019-05-16  1008  static inline const struct iommu_ops *iort_fwspec_iommu_ops(struct device *dev)
8212688600edcb Lorenzo Pieralisi 2019-05-16  1009  { return NULL; }
8212688600edcb Lorenzo Pieralisi 2019-05-16  1010  static inline int iort_add_device_replay(const struct iommu_ops *ops,
8212688600edcb Lorenzo Pieralisi 2019-05-16  1011  					 struct device *dev)
8212688600edcb Lorenzo Pieralisi 2019-05-16  1012  { return 0; }
8212688600edcb Lorenzo Pieralisi 2019-05-16  1013  int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
8212688600edcb Lorenzo Pieralisi 2019-05-16  1014  { return 0; }
8212688600edcb Lorenzo Pieralisi 2019-05-16  1015  const struct iommu_ops *iort_iommu_configure(struct device *dev)
8212688600edcb Lorenzo Pieralisi 2019-05-16  1016  { return NULL; }
8212688600edcb Lorenzo Pieralisi 2019-05-16  1017  #endif
8212688600edcb Lorenzo Pieralisi 2019-05-16  1018  

:::::: The code at line 969 was first introduced by commit
:::::: 8212688600edcb4a147ab7e4634c448938f9121a ACPI/IORT: Fix build error when IOMMU_SUPPORT is disabled

:::::: TO: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
