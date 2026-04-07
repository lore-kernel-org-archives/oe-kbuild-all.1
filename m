Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702A3750AC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534009; cv=none; b=jbgUNHeoqSfmc1K5A5VeGrpLOlEkvu2oZiZHKD9otvO8J9/sSNUax/4taQu8/tr+VZqqvMDAZZg12ZGRVfSGCal6FwVw494bmWVuzsAOJhMVK1CsPilJPgco+cHEU7R/hNfMlMR8kE+9Ss2uGVgRgVZeSkFCABnHqImje2mcUMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534009; c=relaxed/simple;
	bh=QLdc8Cyr2L0ERT6Vx2Y556g9G/ce8taySPWRBSnbdI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tVXvGIRTbIkahRkGU/IkMnv01hu9fe7LnTUeOBd6yeO1lAP+1vX2hC65TCM+HpR2qPlDe8Ah898Sw9qxt0mLccfBpdb0/f66bxw1IKDDFa0Thr2SswtT1lDT1Gl1IincILVY1r5SKVTnPHmw/1/VFTxGtj42dvb8qNa52fwugqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZMVLCOQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZMVLCOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534008; x=1807070008;
  h=date:from:to:cc:subject:message-id;
  bh=QLdc8Cyr2L0ERT6Vx2Y556g9G/ce8taySPWRBSnbdI0=;
  b=cZMVLCOQ3hrDKFbJX6V/YBYh7kOduDAQ7HRP9P5BDh7R2qoPtu3hARJK
   P7afEs7MvB2W84mvDQ7LtiCyZY3syofAMDiGLCbNWc14xdX+npSOAKpdv
   5R21ffyYoUV/tkDZo5SRtXreHwQVPfLrT3u/U6C9jkPpZU49L/k2GAJV+
   WsyMINggT3AVzb5mw+7zAJU7Uyynn20w142kf3idTn97s8O42Lk9XFll9
   Ui7AIRq0dpCn3KTT8/5QPRbcvG65OrPvp4fS0uQkX5AmDBIYsGemkDiIw
   USjMv/ls54QLStAIaIkzsUtRLIqHxeqWiFMYV7Kcpm/Kr5uTdgL5AqOgp
   Q==;
X-CSE-ConnectionGUID: IQlF4DmhSLC6m/x58641jA==
X-CSE-MsgGUID: tHA5B5x4RuuTYfXGT92pYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781616"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:26 -0700
X-CSE-ConnectionGUID: atQESGLbTd6ZJYa3kzKc5w==
X-CSE-MsgGUID: Kif5Zh8CTaC1+OocatDCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303579"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003N-35m0;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:395:2: error: implicit declaration of
 function '_iommu_iotlb_add_page'; did you mean 'iommu_iotlb_gather_add_page'?
Message-ID: <202604041258.56fUKbYR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   861ae8d9b142c1ff23fec0174b471dec9236fbae
commit: 2a7420897c91635045c2799146a90e90c52bd83b [1/1] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041258.56fUKbYR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041258.56fUKbYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041258.56fUKbYR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_page':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:395:2: error: implicit declaration of function '_iommu_iotlb_add_page'; did you mean 'iommu_iotlb_gather_add_page'? [-Werror=implicit-function-declaration]
     _iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
     ^~~~~~~~~~~~~~~~~~~~~
     iommu_iotlb_gather_add_page
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +395 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   389	
   390	void kvm_iommu_iotlb_gather_add_page(struct kvm_hyp_iommu_domain *domain,
   391					     struct iommu_iotlb_gather *gather,
   392					     unsigned long iova,
   393					     size_t size)
   394	{
 > 395		_iommu_iotlb_add_page(domain, gather, iova, size, kvm_iommu_iotlb_sync);
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
