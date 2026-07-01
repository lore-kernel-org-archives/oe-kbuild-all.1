Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A2355F35
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873038; cv=none; b=g2JJjI5iUGC6LZpLuee+ia33IAnr/seyEfjG8eM+nWwLBuCgFtWTu/ko26XZz7/oFL+5gSNLAwSzW4K5OX3/nA6EdPVeOSZfxxx3xSFIjI/AEQDB4EwBDVBMcvm3bDB4XHO8xwyuu08HguBr25c6UfBS2+11uHX25Bhn3SvRBuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873038; c=relaxed/simple;
	bh=vxFyq4Gf/JMoI5PSMTMzoH+N0M0OrrNmHQ49t2h6TUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gSLxbDb2SKqNeskVYgB+oWgsevhzfUhSmx2PVFiWQZJ0WyJK9vANYw3VPd3tox+nKJeJe3cvF5mnCeQePo1aYeLOhvs//uvcA8RdQ2XT9zD9J1ieZiH8ncYi7WOo6tSPdcVLEa98QT+ua7C2HN0aNsoty971Ta+ZXU64UWjB4dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpfNCq/F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpfNCq/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782873036; x=1814409036;
  h=date:from:to:cc:subject:message-id;
  bh=vxFyq4Gf/JMoI5PSMTMzoH+N0M0OrrNmHQ49t2h6TUU=;
  b=OpfNCq/FTUvRHx5U3T+9FrFNDGWmIzbwYT9GRmy7EXm1L0Rh1RwFhQUP
   4/vA+RqziEBXT5ibqx6qS8tOf7HFYp2sRPQxtJhQAHxpum1g0lKjYjI3Q
   UXOr3jiHRTvMcHopOPZ0qb+3Oz+KXSxS6ngeTKBcW5AxeJfNkSjctA/Mi
   voIzfhpbcVU+Y3S98/bEVOtBy6d8ua/X1RRVMQYDJ6dMZbylq0fJR1IQF
   w8xKnuMYtenVa5e14vNLI33eRyi6w5tAfhRLmjK5Ytq6NZzvjWgKKPL+T
   Gl8Hmy3zdLN+oL+03ZeA+on0PRquMIqQ8peDOwfaquz7BLe67EZGc4fma
   w==;
X-CSE-ConnectionGUID: 2HAqQXZTRh6p0e2Sa1UjmQ==
X-CSE-MsgGUID: QwhEqLlORWaYXsz4xiLkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83681258"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83681258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 19:30:29 -0700
X-CSE-ConnectionGUID: Q5yp1loNTgy6FNSkWjZ91A==
X-CSE-MsgGUID: E608PIsjRW6+WRJoP+HAcg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jun 2026 19:30:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wekiW-000000008sV-1pVq;
	Wed, 01 Jul 2026 02:30:24 +0000
Date: Wed, 01 Jul 2026 10:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: pci-imx6.c:undefined reference to
 `pci_pwrctrl_power_off_devices'
Message-ID: <202607011039.GLadQKgQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 85c1fcfa740d4c737f5575fc7251883e54227a51 PCI: imx6: Integrate new pwrctrl API
date:   3 weeks ago
config: powerpc-randconfig-r053-20260630 (https://download.01.org/0day-ci/archive/20260701/202607011039.GLadQKgQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011039.GLadQKgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 85c1fcfa740d ("PCI: imx6: Integrate new pwrctrl API")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011039.GLadQKgQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_shutdown':
>> pci-imx6.c:(.text+0x5a8): undefined reference to `pci_pwrctrl_power_off_devices'
>> powerpc-linux-ld: pci-imx6.c:(.text+0x5c4): undefined reference to `pci_pwrctrl_destroy_devices'
   powerpc-linux-ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_host_exit':
   pci-imx6.c:(.text+0x2018): undefined reference to `pci_pwrctrl_power_off_devices'
   powerpc-linux-ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_host_init':
>> pci-imx6.c:(.text+0x2130): undefined reference to `pci_pwrctrl_create_devices'
>> powerpc-linux-ld: pci-imx6.c:(.text+0x2140): undefined reference to `pci_pwrctrl_power_on_devices'
>> powerpc-linux-ld: pci-imx6.c:(.text+0x2690): undefined reference to `pci_pwrctrl_power_off_devices'
   powerpc-linux-ld: pci-imx6.c:(.text+0x26a0): undefined reference to `pci_pwrctrl_destroy_devices'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
