Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232432D94B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988920; cv=none; b=aIXrmsO9ZtNOxyep4hVZk3OImYcy57+9gHSPlPAj72FEHGXveTtfdqHo92ba4m6PNXMxClVXDMG9dKiHuUGQr+8Jf4C6LKBhfStnKsf8gRrDRPFd7iwZ9XDpqXwgVZfw635u1Kep6LRO4hkgqAPWKyNXpnuuKlua6hfjHB++WwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988920; c=relaxed/simple;
	bh=qQC8wULlr2ED48FSPvPor5cQWXlDaKyZDVkyfmm9OhU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CQmJ5QPZS48pv0tt9Ooo18OOvRwCIz0x9WPOyKAzQfm6g1FC2nXncRyQBDN0ENSvmlf3xqWpcyq8lYquVYYcnzDAkGaeJrKsMY1EalARLu1iMBL1lOqvzlkDasqu6EM74YYq0shvt0+wgIAxj7mCw2xiIzOwzq38v0akgeNAkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfymbdWW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfymbdWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791988918; x=1823524918;
  h=date:from:to:cc:subject:message-id;
  bh=qQC8wULlr2ED48FSPvPor5cQWXlDaKyZDVkyfmm9OhU=;
  b=cfymbdWWKlAfjTkX3DSmqdKcJpnJYL7m+XQhbrfme4sNr4PBgqQ9cdnb
   KT+OFaPF+vP0lmjX/re3LDvRq9npkJKdmg4bW78R4azmY3snhuwMsZddb
   TQYQb9Pi66Dd+hGMPSLp5O9Oeg5Mbe3fqfR2TpDOMxqqsVfF0k/x+Wxru
   fq/2ITLd5Q55qtXw9qjHpzojcrc6tv/Q8kqx3S3fQeC0dpMdG6qQFqE3O
   kFQQuuhFFcXyy6bjFckJdqjJs8LYdLiuz/GqrXOGQw/tSEO+EpcseKBq3
   MIOCyC6JCXZnj6oXwtU1vTU9eKh3v0JnmaOjKZTMiKj8fRHjzUyk8GniP
   A==;
X-CSE-ConnectionGUID: aQF+E7F9R+OZkBJKTpSbIA==
X-CSE-MsgGUID: ja5SXPDYSmmbYDPuhqu0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="639284"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="639284"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 07:41:58 -0700
X-CSE-ConnectionGUID: K5aUJ3a1R+GhdfyJO3q51A==
X-CSE-MsgGUID: Vyr3EZraQX2qMq+XQViZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1766564"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2026 07:41:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH0Az-00000000B87-3UBU;
	Wed, 14 Oct 2026 14:41:53 +0000
Date: Wed, 14 Oct 2026 16:41:29 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 2/2]
 drivers/virt/halla/hvm_vtimer.c:77:16: warning: variable 'ret' set but not
 used
Message-ID: <202610141610.OIBn4TGk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kim,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   2bc1fb49dca33ce65e6cf7f3036165999d31feee
commit: 9007a992df6c7fbc50cbcc21613b3a5c3c019ab6 [2/2] ANDROID: drivers: virt: Initialization halla module
config: arm64-randconfig-r2303-20261014 (https://download.01.org/0day-ci/archive/20261014/202610141610.OIBn4TGk-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141610.OIBn4TGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141610.OIBn4TGk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/halla/hvm_vtimer.c:77:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           unsigned long ret;
                         ^
   1 warning generated.
--
>> drivers/virt/halla/hvm_ioeventfd.c:27: warning: Function parameter or struct member 'hvm' not described in 'ioeventfd_check_collision'
>> drivers/virt/halla/hvm_ioeventfd.c:231: warning: Function parameter or struct member 'hvm' not described in 'hvm_ioeventfd'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/ret +77 drivers/virt/halla/hvm_vtimer.c

    74	
    75	static irqreturn_t hvm_arch_timer_handler(int irq, void *dev_id)
    76	{
  > 77		unsigned long ret;
    78		u32 tuple = *(u32 *)dev_id;
    79		u32 timer_ppi = guest_vtimer_irq - HVM_IRQ_PPI_START_NUM;
    80	
    81		if (tuple == (u32)(~0) || (read_sysreg(cntp_ctl_el0) & (u64)(2)))
    82			return IRQ_NONE;
    83	
    84		// mask timer
    85		write_sysreg(read_sysreg(cntp_ctl_el0) | (u64)(2), cntp_ctl_el0);
    86		isb();
    87	
    88		// call IRQ_LINE HVC
    89		ret = exynos_hvc(HVC_FID_HVM_IRQ_LINE, tuple,
    90				((u32)(1) << 31) | timer_ppi, true, 0);
    91	
    92		return IRQ_HANDLED;
    93	}
    94	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
