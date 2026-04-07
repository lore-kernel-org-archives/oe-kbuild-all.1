Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA6374E60
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533946; cv=none; b=m5RZ/g76fk44wA1HXvIao48AhXQo9XedzGMJeoG/L2XtrULUrKBRADY/mxjAcKQU5Oju0Xt8Jicb/M4gk1rV9lsR+lE1Ag6cIvjRpu2VD0bUbVC/HYDdHtXhI9s0EZ2SkEPcjd9qflToHuHF0FimVUqEfZmzFDSbZEq9kfTiMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533946; c=relaxed/simple;
	bh=p6W9T0LH4U1NmixeoPmP8fyXvHCwZ8jNfF5E5TkFHDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qy4b4pE4jfyGocENVsJvStUj666uBFq+HOIDpf0ZdI6WKmaYIhdoNwzf0JhBihxA9BfxyXqyGuxCKhtj/dawCxDf4EzLPCmcglhiOKL93VyYJxlT4N1OpzDgy06PHf4734w47zPhmyUuwHtJclAQI7LksCNjnX3En0aOOgiRl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aS7KEiii; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aS7KEiii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533944; x=1807069944;
  h=date:from:to:cc:subject:message-id;
  bh=p6W9T0LH4U1NmixeoPmP8fyXvHCwZ8jNfF5E5TkFHDU=;
  b=aS7KEiiitn7xea7WUeZOQ0ujOfqV3zKBYEjsL2Ya+thd8zkCDU8NqsHN
   VGH+KpT21l2W+Emb8Ar3ezcACWu4q7E7oc5FEXPHcg6zBXUOz+cw+RZzK
   vGrY/hq3d78Xsv1OxgIg3sTpCQSDxRKNJgSHYD+Hn6FXwqD5q9gPZ6ET7
   nv3feZdyUBlRiMfXMf4SWS0ZOQGJSguWyYkc/0L9njvjxroz23ne2Q9go
   KH+7yBAhOx3RjD86+dAv5Quzx3c3SfOP2SvyiA0GusEQcTSwioN5TAdv/
   AU/FaQSJypZ6ATElhVf5zA/n9afobGJFv3CEY5JggwUJeUaskmFnt1jkx
   Q==;
X-CSE-ConnectionGUID: 6IpI/+xIR/ylXPJ9rzGJ0A==
X-CSE-MsgGUID: Nwwxq9mlQmijJFVb6iGwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781487"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:52:23 -0700
X-CSE-ConnectionGUID: fYI0mVUzTS6/ou85ALTD/A==
X-CSE-MsgGUID: EXVMzB7sTEOYFarBDFtB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="224842915"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Apr 2026 20:52:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xUA-0000000002j-3Ork;
	Tue, 07 Apr 2026 03:52:18 +0000
Date: Tue, 07 Apr 2026 11:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-09 1/1]
 arch/arm64/kvm/arm.c:2011:39: error: 'smccc_trng_available' undeclared; did
 you mean 'irq_matrix_available'?
Message-ID: <202604040748.oMbWdRUQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-09
head:   26cff64a72af579da237b2efc799ab7b6145e411
commit: 888643ea37b504cb32afdd6430698d1e92a79a71 [1/1] ANDROID: KVM: arm64: relay entropy requests from protected guests directly to secure
config: arm64-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040748.oMbWdRUQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040748.oMbWdRUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040748.oMbWdRUQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/arm.c: In function 'kvm_hyp_init_protection':
>> arch/arm64/kvm/arm.c:2011:39: error: 'smccc_trng_available' undeclared (first use in this function); did you mean 'irq_matrix_available'?
     kvm_nvhe_sym(smccc_trng_available) = smccc_trng_available;
                                          ^~~~~~~~~~~~~~~~~~~~
                                          irq_matrix_available
   arch/arm64/kvm/arm.c:2011:39: note: each undeclared identifier is reported only once for each function it appears in

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
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +2011 arch/arm64/kvm/arm.c

  1997	
  1998	static int kvm_hyp_init_protection(u32 hyp_va_bits)
  1999	{
  2000		void *addr = phys_to_virt(hyp_mem_base);
  2001		int ret;
  2002	
  2003		kvm_nvhe_sym(id_aa64pfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
  2004		kvm_nvhe_sym(id_aa64pfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
  2005		kvm_nvhe_sym(id_aa64isar0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
  2006		kvm_nvhe_sym(id_aa64isar1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
  2007		kvm_nvhe_sym(id_aa64mmfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
  2008		kvm_nvhe_sym(id_aa64mmfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
  2009		kvm_nvhe_sym(id_aa64mmfr2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR2_EL1);
  2010		kvm_nvhe_sym(__icache_flags) = __icache_flags;
> 2011		kvm_nvhe_sym(smccc_trng_available) = smccc_trng_available;
  2012	
  2013		ret = create_hyp_mappings(addr, addr + hyp_mem_size, PAGE_HYP);
  2014		if (ret)
  2015			return ret;
  2016	
  2017		ret = init_stage2_iommu();
  2018		if (ret < 0)
  2019			return ret;
  2020	
  2021		ret = do_pkvm_init(hyp_va_bits, (enum kvm_iommu_driver)ret);
  2022		if (ret)
  2023			return ret;
  2024	
  2025		free_hyp_pgds();
  2026	
  2027		return 0;
  2028	}
  2029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
