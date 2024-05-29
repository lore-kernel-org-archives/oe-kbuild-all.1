Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9389A15B571
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 05:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716959718; cv=none; b=bcg+iZC06mk1QJpiHYruTTZcSYymUIZFzxeVgvBWi83dYpCyDa2N3s1YN5pw6dC/6+49qMsDvuIEOskwH4GPmmjYcc3COd1IZ/AW2mSMZ2/HsYjFCdx7yz+mDsJS66ot4AgQGCvbJdp7hgpX27lIbFQYAf3j9edm7Bm56hQo1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716959718; c=relaxed/simple;
	bh=oIJtOvKABzduCusGtHUn0csoLpRr/jmtjJf7XFqr64U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Li+XmudgENDQWWchFrE5QwEq3MkTpHs2bCTSXZ6sTkcAC3o/voo6nfwsie/09vS68v1Cz9Zy3Y4UwcgOD7qTMIRFxvYc8AMK98/JsRpWBsksXC0wP06vxVsfThjoUtKAbRzLbYf7jSLI/ud2gX5YpSGIoK8iI16Ifh2E45SOUdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+SX+xa/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+SX+xa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716959717; x=1748495717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIJtOvKABzduCusGtHUn0csoLpRr/jmtjJf7XFqr64U=;
  b=R+SX+xa/D7bSpwydJ3MMmi3hGPaOLAnZmm1RuOyl9la803YzmNNdm9T9
   jVGh/+QMVMK98KP9U5izTtzhcNmdJkLYe8kUGyITdZdgwpolY9kVxbspQ
   5Sstn60GvEXN67QG2SlGQGZk38CjmWTVGB8xnpqQ4PPucqKuXUZtlDaDv
   ZpC96Oocwehal+meeAIISXmCCdfqmBMzYwMjatAa1qRMiDfqgGmDZDSxo
   1qFEEvXcP5eYLtCx8mMc7bIcA1AGLALFv4025YW552wkEzTsUNQFQpvR+
   QiXVUXaddnyG35/HlZDyiIBHH8BK6aWj0cENNYdcr+OCxq3yH0BoFQtW4
   g==;
X-CSE-ConnectionGUID: oOJlC1aKQ2mQjXCD8CVl/g==
X-CSE-MsgGUID: 4En5anYPQYCcRU6dFh/c2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30841824"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="30841824"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 22:15:12 -0700
X-CSE-ConnectionGUID: NBdq4G9qT2OhW1SgWf5ybQ==
X-CSE-MsgGUID: 39l7at2QTquNVHY+Whn+ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39833051"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 May 2024 22:15:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCBeN-000D9N-06;
	Wed, 29 May 2024 05:15:02 +0000
Date: Wed, 29 May 2024 13:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-06-exp 12153/13266]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:5: warning: no previous
 prototype for 'smmu_unregister_smmu'
Message-ID: <202405291336.eT23A5wv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-06-exp
head:   55abd4e47b51cc21408819285768808fbd2384ac
commit: 3957c33199557d04f41b0be930f941bcc6b06ee6 [12153/13266] ANDROID: KVM: arm64: Cleanup fail path
config: arm64-randconfig-r054-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291336.eT23A5wv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291336.eT23A5wv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291336.eT23A5wv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/arm64/kvm/: No such file or directory [-Wmissing-include-dirs]
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: In function 'kvm_arm_smmu_domain_free':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:256:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     256 |         int ret;
         |             ^~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c: At top level:
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:885:5: warning: no previous prototype for 'kvm_arm_smmu_suspend' [-Wmissing-prototypes]
     885 | int kvm_arm_smmu_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:895:5: warning: no previous prototype for 'kvm_arm_smmu_resume' [-Wmissing-prototypes]
     895 | int kvm_arm_smmu_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:945:5: warning: no previous prototype for 'smmu_put_device' [-Wmissing-prototypes]
     945 | int smmu_put_device(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:951:5: warning: no previous prototype for 'smmu_unregister_smmu' [-Wmissing-prototypes]
     951 | int smmu_unregister_smmu(struct device *dev, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c:1069:15: warning: no previous prototype for 'kvm_arm_smmu_v3_id' [-Wmissing-prototypes]
    1069 | pkvm_handle_t kvm_arm_smmu_v3_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/smmu_unregister_smmu +951 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

   950	
 > 951	int smmu_unregister_smmu(struct device *dev, void *data)
   952	{
   953		struct arm_smmu_device *smmu = dev_get_drvdata(dev);
   954	
   955		arm_smmu_unregister_iommu(smmu);
   956		return 0;
   957	}
   958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
