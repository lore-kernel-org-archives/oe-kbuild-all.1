Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A037A488
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120571; cv=none; b=ExEi1UeO/BCNBU0QT28m7NAmMm2ZpbW+uaaN8CwhjL4OIedIB8BM7rdyciJsBA3pnw6jeX9MBZca146RvoCzG6Rngs5ocxsMAmjtQxHwkfZEBbHOF3gZZvfpI7m7Hu47AbRJ6DqaUEtBxrNlabApvzIopFY5fhUaGqG3MMpvZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120571; c=relaxed/simple;
	bh=3GQX8iOMghsbBZ2Gse6jCTk0NW17XporX91fwkdb3pU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IIouvHdNrQyqVSbfr7A+XV/9DarW36BR8XI3ar+zhSF86uO3eI3x1nVe22MSclhM9V7I6JJq9236uwtC47EgzgDM8pnbiDQyWG4foPaTSd1JeVf3fVRVUQijU+NIMXLOm7WiHLnHRezpH3nAy1JVvuFndwUgymfERVUj8m4/rFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtEcCRHh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtEcCRHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781120570; x=1812656570;
  h=date:from:to:cc:subject:message-id;
  bh=3GQX8iOMghsbBZ2Gse6jCTk0NW17XporX91fwkdb3pU=;
  b=TtEcCRHh89ahailjhV9dm2QlyV5UZcBayxKWEvI4AMWs6GTelexO5yDk
   MSVDEFZwAgFIf7vEVyrQIRZ/JV4FWOtZhL2NOt7kU7NLb3mkLzMS8rZlP
   1ElhFFy4T7IYgOT+1o9lrfxiNoC2w88vt+FSejrFbJS7VBjUCEalCioXN
   gqx1FmyDiRVpo/F6ljpn914lebLyqFAMXEpBgCepdnQCpNKbA+AG60BZs
   KnHJyAAl4tWDqSRtBse5pVLMV+G82/IGrJcueYxtH5rfx7BazHw/ugkYQ
   VCtWSoJyPo0XCa4slkFFfTamRSgn/RXPJNWdRoUW5RQDw9JA0P7tBKLtY
   w==;
X-CSE-ConnectionGUID: CSiEvrbiSlGPnd9XjErADA==
X-CSE-MsgGUID: +PenFQ46RV23Gzdqvp3hAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82033768"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82033768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 12:42:49 -0700
X-CSE-ConnectionGUID: krEe+Sx0RficyBJvK0R5Rw==
X-CSE-MsgGUID: nfG+QyGFR4uK0v6nm9hBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269948561"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2026 12:42:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXOp3-00000000Lq4-36Gi;
	Wed, 10 Jun 2026 19:42:45 +0000
Date: Thu, 11 Jun 2026 03:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 arch/x86/coco/pkvm/pkvm.c:130:12: warning: 'pkvm_wakeup_secondary_cpu'
 defined but not used
Message-ID: <202606110309.cvY7k9qG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   19f145cefca5621fd2dd6693def69fe1a476b2d7
commit: 171a0f6163b37c35a8ef394153bce28ba6206f71 [0/2] ANDROID: x86/pkvm: Use hypercall to start CPUs
config: i386-randconfig-002-20260611 (https://download.01.org/0day-ci/archive/20260611/202606110309.cvY7k9qG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110309.cvY7k9qG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110309.cvY7k9qG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:130:12: warning: 'pkvm_wakeup_secondary_cpu' defined but not used [-Wunused-function]
     130 | static int pkvm_wakeup_secondary_cpu(u32 apic_id, unsigned long start_ip, unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/coco/pkvm/pkvm.c:123:13: warning: 'pkvm_mmio_writeq' defined but not used [-Wunused-function]
     123 | static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
         |             ^~~~~~~~~~~~~~~~
   arch/x86/coco/pkvm/pkvm.c:93:12: warning: 'pkvm_mmio_readq' defined but not used [-Wunused-function]
      93 | static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
         |            ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/pkvm_wakeup_secondary_cpu +130 arch/x86/coco/pkvm/pkvm.c

   129	
 > 130	static int pkvm_wakeup_secondary_cpu(u32 apic_id, unsigned long start_ip, unsigned int cpu)
   131	{
   132		return kvm_hypercall2(PKVM_GHC_START_CPU, apic_id, start_ip);
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
