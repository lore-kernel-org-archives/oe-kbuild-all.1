Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4241D6BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205157; cv=none; b=moCmnN2nsZo254AVCjru07z1tdNhRD8ANMQ+YtHrQ2RfurTyTgzx9d6dA+wirmjdT7mu+OEWWiN2JwsY1P+cnuKntuK35PeAeDsITEJMeQZPl5GpSJF+IInxJ9bRU/cM/nJono26OEO4xaflKH1Ll/F7ZOaeoTpf91NXosQDOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205157; c=relaxed/simple;
	bh=3Z/oYYr2BZBd+eP0fVzwxbHC6cIJX/f/XSUVKUvk3ZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfDMBkl3N2npP2xpO6YZGUegl0ZxnUD014iqPnIpH8BS+hRNuq3zKTHwN3ZrKztbIidjV+Q5hnl/DbM8MoSyr37EVbSdbUC/juwSuHDu7Fmc6yptcPZuPWSxD5XPdNEmqmh+GSNyouPWiPfkmdypnHU2ZsruwucSVDu5wLew2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCowDMuJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCowDMuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781205155; x=1812741155;
  h=date:from:to:cc:subject:message-id;
  bh=3Z/oYYr2BZBd+eP0fVzwxbHC6cIJX/f/XSUVKUvk3ZA=;
  b=SCowDMuJvCxRed/TU6Pdspvg5EQweRfjNkdXHo4eH9cMNJZwKZJWVWfT
   Yc/5XABKVX9/HYEJttFnT62m6BYiMg8N+vrM90moOwJcH21TEMoELqI/l
   MmaY4dvlKjQTiJHpshrTtoRZfRmbrOk6nuMiRIV4E5YYtKCBUxjeN/Rsn
   6uqfvEOAZWkCyPog4UHXvmBPDNR0eJLHA0nWJ1ccDxple5DZ2bL/7+Oh7
   RrPP1Jr5jIttznu5ND7tKwQ7C5jWd44BWkbjCiJMAXHq6Ftkfm4RGTMsT
   FA9Ln4H5CTtE7Yuz/WsktrD+h9lbMZEYYWqO97QhlTUrah1HR8ju63T6D
   Q==;
X-CSE-ConnectionGUID: CDJFaowfToOGx6IHpjB+jg==
X-CSE-MsgGUID: eXvJs8faSVu5ucdFINHP1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99608836"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99608836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:12:34 -0700
X-CSE-ConnectionGUID: I4Nwq3r8QEmh9OaPwPGptQ==
X-CSE-MsgGUID: i5tJcIirTx20fYZjnrdTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250862681"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 12:12:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXkpK-00000000Nji-1RNW;
	Thu, 11 Jun 2026 19:12:30 +0000
Date: Fri, 12 Jun 2026 03:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 1/1]
 arch/x86/coco/pkvm/pkvm.c:122:13: warning: 'pkvm_mmio_writeq' defined but not
 used
Message-ID: <202606120301.z4BcNERR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chuanxiao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   35c31415e6893d66536f52b0beef1c05fdd85a8c
commit: cd1c1ff12613506f091f809f0e6f60b6c3c1303f [1/1] ANDROID: x86/pkvm: Use hypercalls to access MMIO
config: i386-randconfig-002-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120301.z4BcNERR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120301.z4BcNERR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120301.z4BcNERR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:122:13: warning: 'pkvm_mmio_writeq' defined but not used [-Wunused-function]
     122 | static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
         |             ^~~~~~~~~~~~~~~~
>> arch/x86/coco/pkvm/pkvm.c:92:12: warning: 'pkvm_mmio_readq' defined but not used [-Wunused-function]
      92 | static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
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


vim +/pkvm_mmio_writeq +122 arch/x86/coco/pkvm/pkvm.c

    91	
  > 92	static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
    93	{
    94		unsigned long val;
    95	
    96		if (pkvm_virt_mmio(8, false, (unsigned long)addr, &val))
    97			return 0xffffffffffffffff;
    98		return val;
    99	}
   100	
   101	static void pkvm_mmio_writeb(unsigned char v, volatile void __iomem *addr)
   102	{
   103		unsigned long val = v;
   104	
   105		pkvm_virt_mmio(1, true, (unsigned long)addr, &val);
   106	}
   107	
   108	static void pkvm_mmio_writew(unsigned short v, volatile void __iomem *addr)
   109	{
   110		unsigned long val = v;
   111	
   112		pkvm_virt_mmio(2, true, (unsigned long)addr, &val);
   113	}
   114	
   115	static void pkvm_mmio_writel(unsigned int v, volatile void __iomem *addr)
   116	{
   117		unsigned long val = v;
   118	
   119		pkvm_virt_mmio(4, true, (unsigned long)addr, &val);
   120	}
   121	
 > 122	static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
   123	{
   124		unsigned long val = v;
   125	
   126		pkvm_virt_mmio(8, true, (unsigned long)addr, &val);
   127	}
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
