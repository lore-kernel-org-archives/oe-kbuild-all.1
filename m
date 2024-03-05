Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30E611A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709608535; cv=none; b=KdHwVYnWLOXvm02z0L40EONW5UyHb7E/3V/5UuhqW6I7jNINqibtmlOpmqLJRpgwVt3ANXKcqHDtjkHz+z04XZOBMP4muOqPglgt1Wn9+5MjlNk650pdSQV8TPncrLrCDxgXl6qan9I+7IS09FKYbWlqde0Uykg/nuazv6VuQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709608535; c=relaxed/simple;
	bh=uuo5SKWdLPZ9/G9U9sFgv+iIfOmiXL90OjOnn796j7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbSTsIkg7k1RWHak2fJqK67SJBsbp+hSv8zpJlPZa04fw5AffxFZWkdgJx2FPzRE9g77vjPrZKZYNjQIU81VuA4rBpT/jy76CKo/vQd1ZkjB2coNp1YZOMVQ5n6t9zA5yal5lK8g2D0SE/xqC04/7s3B9hB4sY1X8Hqe5va9vTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiHqMyuv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiHqMyuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709608533; x=1741144533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuo5SKWdLPZ9/G9U9sFgv+iIfOmiXL90OjOnn796j7k=;
  b=JiHqMyuvfHp4vLLye7clxid9SdM+sgtCiX+23+/13mC0QzdVU88e8DL8
   fGIwTp28JvXt1ILM6zh3/pTlEUArzbdxRnRc8gkWLiSiLy+r//NqlfYmv
   2ZWwrdDWhzBoZt2hi5V5Y76qkcOBfe4zSwejziucsRP/INo+EtJksUgE2
   TTa+xol5S6L6hnCzvnldY66mCVbT6n/hsjzx8vWbUmGvPiXFFn3+z77i3
   LuP7pu+g7+qIG1he3oGSqRHxTFDIaE7myL7MJjS2GWe1ZdamY84eC2iTi
   G9O2Kvkrl3WL3a6QYr246uKtnisOtE+R6HWk0XtmlHT8tqljghnwZSwBN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14780336"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14780336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 19:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9289047"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2024 19:15:29 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhLH5-0002z3-0x;
	Tue, 05 Mar 2024 03:15:27 +0000
Date: Tue, 5 Mar 2024 11:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/acpi/arm64/iort.c:969:28: error: 'struct device' has no
 member named 'iommu_fwspec'
Message-ID: <202403051136.n1aFKHyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 3eb78573e2d92e6a4cdff5809dd4f84768922650 iommu: Move iommu_fwspec to struct dev_iommu
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403051136.n1aFKHyd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051136.n1aFKHyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051136.n1aFKHyd-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD e116ff64db9be38b70fd5b050f5900435d428547 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c: In function 'iort_iommu_configure':
>> drivers/acpi/arm64/iort.c:969:28: error: 'struct device' has no member named 'iommu_fwspec'
     969 |                         dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
         |                            ^~
--
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:310:5: warning: no previous prototype for 'mdp5_disable' [-Wmissing-prototypes]
     310 | int mdp5_disable(struct mdp5_kms *mdp5_kms)
         |     ^~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:326:5: warning: no previous prototype for 'mdp5_enable' [-Wmissing-prototypes]
     326 | int mdp5_enable(struct mdp5_kms *mdp5_kms)
         |     ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c: In function 'modeset_init':
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:469:35: warning: variable 'hw_cfg' set but not used [-Wunused-but-set-variable]
     469 |         const struct mdp5_cfg_hw *hw_cfg;
         |                                   ^~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c: In function 'mdp5_kms_init':
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:728:31: error: 'struct device' has no member named 'iommu_fwspec'
     728 |                 if (!iommu_dev->iommu_fwspec)
         |                               ^~


vim +969 drivers/acpi/arm64/iort.c

^590eaf1fec7552 Kaixu Xia 2021-03-16   931  
^590eaf1fec7552 Kaixu Xia 2021-03-16   932  /**
^590eaf1fec7552 Kaixu Xia 2021-03-16   933   * iort_iommu_configure - Set-up IOMMU configuration for a device.
^590eaf1fec7552 Kaixu Xia 2021-03-16   934   *
^590eaf1fec7552 Kaixu Xia 2021-03-16   935   * @dev: device to configure
^590eaf1fec7552 Kaixu Xia 2021-03-16   936   *
^590eaf1fec7552 Kaixu Xia 2021-03-16   937   * Returns: iommu_ops pointer on configuration success
^590eaf1fec7552 Kaixu Xia 2021-03-16   938   *          NULL on configuration failure
^590eaf1fec7552 Kaixu Xia 2021-03-16   939   */
^590eaf1fec7552 Kaixu Xia 2021-03-16   940  const struct iommu_ops *iort_iommu_configure(struct device *dev)
^590eaf1fec7552 Kaixu Xia 2021-03-16   941  {
^590eaf1fec7552 Kaixu Xia 2021-03-16   942  	struct acpi_iort_node *node, *parent;
^590eaf1fec7552 Kaixu Xia 2021-03-16   943  	const struct iommu_ops *ops;
^590eaf1fec7552 Kaixu Xia 2021-03-16   944  	u32 streamid = 0;
^590eaf1fec7552 Kaixu Xia 2021-03-16   945  	int err = -ENODEV;
^590eaf1fec7552 Kaixu Xia 2021-03-16   946  
^590eaf1fec7552 Kaixu Xia 2021-03-16   947  	/*
^590eaf1fec7552 Kaixu Xia 2021-03-16   948  	 * If we already translated the fwspec there
^590eaf1fec7552 Kaixu Xia 2021-03-16   949  	 * is nothing left to do, return the iommu_ops.
^590eaf1fec7552 Kaixu Xia 2021-03-16   950  	 */
^590eaf1fec7552 Kaixu Xia 2021-03-16   951  	ops = iort_fwspec_iommu_ops(dev);
^590eaf1fec7552 Kaixu Xia 2021-03-16   952  	if (ops)
^590eaf1fec7552 Kaixu Xia 2021-03-16   953  		return ops;
^590eaf1fec7552 Kaixu Xia 2021-03-16   954  
^590eaf1fec7552 Kaixu Xia 2021-03-16   955  	if (dev_is_pci(dev)) {
^590eaf1fec7552 Kaixu Xia 2021-03-16   956  		struct pci_bus *bus = to_pci_dev(dev)->bus;
^590eaf1fec7552 Kaixu Xia 2021-03-16   957  		struct iort_pci_alias_info info = { .dev = dev };
^590eaf1fec7552 Kaixu Xia 2021-03-16   958  
^590eaf1fec7552 Kaixu Xia 2021-03-16   959  		node = iort_scan_node(ACPI_IORT_NODE_PCI_ROOT_COMPLEX,
^590eaf1fec7552 Kaixu Xia 2021-03-16   960  				      iort_match_node_callback, &bus->dev);
^590eaf1fec7552 Kaixu Xia 2021-03-16   961  		if (!node)
^590eaf1fec7552 Kaixu Xia 2021-03-16   962  			return NULL;
^590eaf1fec7552 Kaixu Xia 2021-03-16   963  
^590eaf1fec7552 Kaixu Xia 2021-03-16   964  		info.node = node;
^590eaf1fec7552 Kaixu Xia 2021-03-16   965  		err = pci_for_each_dma_alias(to_pci_dev(dev),
^590eaf1fec7552 Kaixu Xia 2021-03-16   966  					     iort_pci_iommu_init, &info);
^590eaf1fec7552 Kaixu Xia 2021-03-16   967  
^590eaf1fec7552 Kaixu Xia 2021-03-16   968  		if (!err && iort_pci_rc_supports_ats(node))
^590eaf1fec7552 Kaixu Xia 2021-03-16  @969  			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
^590eaf1fec7552 Kaixu Xia 2021-03-16   970  	} else {
^590eaf1fec7552 Kaixu Xia 2021-03-16   971  		int i = 0;
^590eaf1fec7552 Kaixu Xia 2021-03-16   972  
^590eaf1fec7552 Kaixu Xia 2021-03-16   973  		node = iort_scan_node(ACPI_IORT_NODE_NAMED_COMPONENT,
^590eaf1fec7552 Kaixu Xia 2021-03-16   974  				      iort_match_node_callback, dev);
^590eaf1fec7552 Kaixu Xia 2021-03-16   975  		if (!node)
^590eaf1fec7552 Kaixu Xia 2021-03-16   976  			return NULL;
^590eaf1fec7552 Kaixu Xia 2021-03-16   977  
^590eaf1fec7552 Kaixu Xia 2021-03-16   978  		do {
^590eaf1fec7552 Kaixu Xia 2021-03-16   979  			parent = iort_node_map_platform_id(node, &streamid,
^590eaf1fec7552 Kaixu Xia 2021-03-16   980  							   IORT_IOMMU_TYPE,
^590eaf1fec7552 Kaixu Xia 2021-03-16   981  							   i++);
^590eaf1fec7552 Kaixu Xia 2021-03-16   982  
^590eaf1fec7552 Kaixu Xia 2021-03-16   983  			if (parent)
^590eaf1fec7552 Kaixu Xia 2021-03-16   984  				err = iort_iommu_xlate(dev, parent, streamid);
^590eaf1fec7552 Kaixu Xia 2021-03-16   985  		} while (parent && !err);
^590eaf1fec7552 Kaixu Xia 2021-03-16   986  	}
^590eaf1fec7552 Kaixu Xia 2021-03-16   987  
^590eaf1fec7552 Kaixu Xia 2021-03-16   988  	/*
^590eaf1fec7552 Kaixu Xia 2021-03-16   989  	 * If we have reason to believe the IOMMU driver missed the initial
^590eaf1fec7552 Kaixu Xia 2021-03-16   990  	 * add_device callback for dev, replay it to get things in order.
^590eaf1fec7552 Kaixu Xia 2021-03-16   991  	 */
^590eaf1fec7552 Kaixu Xia 2021-03-16   992  	if (!err) {
^590eaf1fec7552 Kaixu Xia 2021-03-16   993  		ops = iort_fwspec_iommu_ops(dev);
^590eaf1fec7552 Kaixu Xia 2021-03-16   994  		err = iort_add_device_replay(ops, dev);
^590eaf1fec7552 Kaixu Xia 2021-03-16   995  	}
^590eaf1fec7552 Kaixu Xia 2021-03-16   996  
^590eaf1fec7552 Kaixu Xia 2021-03-16   997  	/* Ignore all other errors apart from EPROBE_DEFER */
^590eaf1fec7552 Kaixu Xia 2021-03-16   998  	if (err == -EPROBE_DEFER) {
^590eaf1fec7552 Kaixu Xia 2021-03-16   999  		ops = ERR_PTR(err);
^590eaf1fec7552 Kaixu Xia 2021-03-16  1000  	} else if (err) {
^590eaf1fec7552 Kaixu Xia 2021-03-16  1001  		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
^590eaf1fec7552 Kaixu Xia 2021-03-16  1002  		ops = NULL;
^590eaf1fec7552 Kaixu Xia 2021-03-16  1003  	}
^590eaf1fec7552 Kaixu Xia 2021-03-16  1004  
^590eaf1fec7552 Kaixu Xia 2021-03-16  1005  	return ops;
^590eaf1fec7552 Kaixu Xia 2021-03-16  1006  }
^590eaf1fec7552 Kaixu Xia 2021-03-16  1007  #else
^590eaf1fec7552 Kaixu Xia 2021-03-16  1008  static inline const struct iommu_ops *iort_fwspec_iommu_ops(struct device *dev)
^590eaf1fec7552 Kaixu Xia 2021-03-16  1009  { return NULL; }
^590eaf1fec7552 Kaixu Xia 2021-03-16  1010  static inline int iort_add_device_replay(const struct iommu_ops *ops,
^590eaf1fec7552 Kaixu Xia 2021-03-16  1011  					 struct device *dev)
^590eaf1fec7552 Kaixu Xia 2021-03-16  1012  { return 0; }
^590eaf1fec7552 Kaixu Xia 2021-03-16  1013  int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
^590eaf1fec7552 Kaixu Xia 2021-03-16  1014  { return 0; }
^590eaf1fec7552 Kaixu Xia 2021-03-16  1015  const struct iommu_ops *iort_iommu_configure(struct device *dev)
^590eaf1fec7552 Kaixu Xia 2021-03-16  1016  { return NULL; }
^590eaf1fec7552 Kaixu Xia 2021-03-16  1017  #endif
^590eaf1fec7552 Kaixu Xia 2021-03-16  1018  

:::::: The code at line 969 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
