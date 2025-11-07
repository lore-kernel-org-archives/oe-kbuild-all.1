Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DDC302CD1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762557040; cv=none; b=Hsk9pZrXGR3cZYqMaJ9OPmMhg+4b9yFPZw52+X1q3m/0oN2Fha/SlL5auMd0KPLBbs8HjEdEeF3KAsOcRs1tTAmz9BOCpBs5Gw4D35F11bxIHytVurA3jqPC2UcN1oSDzHGWx2CwyV3ptEdM/eRGU3tZe6nrgqbx/PJd6sNmQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762557040; c=relaxed/simple;
	bh=NiNxPTc8aF8BLbTiKaIZD4X1WE01B7pY0p43BdoCk10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nwe4lKh6/tG7s8mUuztBlTGHULIttTB8xgxBdmQEV0o2u+hBR9xCeHPKwv2+SZWFe4Z8qrTWd9AE1DnRnpI6QDkcBNyBb+4sgGSZyOAoh+JrP6Y2Gnv6aDZK77830/GErpb7tZQOKZakpLxyLhRp05k11Mb+uVdOZA1sY5xBI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9MyTcLr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9MyTcLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762557038; x=1794093038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NiNxPTc8aF8BLbTiKaIZD4X1WE01B7pY0p43BdoCk10=;
  b=A9MyTcLrw9vKTlgLcvf2RrcUgkCc7Z1Do0JVryBjez1AxqbShAS2/AVS
   VTPxUtOrep8bg/bT8+r6k0BbgDPzEHhp56MdE97drluzMnqwFhsUXzTt2
   VwJcpEU8jw7O2JvAatFaP33JC5AKNttW9iB9fFuqrETOPUwJmaGnzfYKM
   zwlJFH2jXc1NyYA/2lXCU8UQt864nT6ZC2OkZ/hSeDIxWArD7bwSrJ449
   yg6joC7mbm1giRy6D6BVGMTe3NXZzIdoMA9pB+JMLQnIrMIFA2NZoiaT8
   xveNDhqlQyGAJRvbWa5h6ShWoTLvSNAL2frzFXMkRtEtbZuwJjA3lDTji
   g==;
X-CSE-ConnectionGUID: gBdqgXDpScumVJgoCcrCbw==
X-CSE-MsgGUID: n3Pmk1WTRGO+SeawyETevg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="63919564"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="63919564"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 15:10:37 -0800
X-CSE-ConnectionGUID: 52TvrV1iQsCrdImTkJvcYA==
X-CSE-MsgGUID: sgi9bY9rSnWTGWpWhv8c+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="187884772"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Nov 2025 15:10:36 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHVbF-0000S9-1q;
	Fri, 07 Nov 2025 23:10:33 +0000
Date: Sat, 8 Nov 2025 07:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [linux-next:master 6788/7207] ERROR: modpost: "ip_send_check"
 [net/core/selftests.ko] undefined!
Message-ID: <202511080729.ldd6looN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Raju,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: 862a64c83faf7708e7e79498193ff5270543a68d [6788/7207] amd-xgbe: introduce support ethtool selftest
config: xtensa-randconfig-001-20251108 (https://download.01.org/0day-ci/archive/20251108/202511080729.ldd6looN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080729.ldd6looN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080729.ldd6looN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
>> ERROR: modpost: "ip_send_check" [net/core/selftests.ko] undefined!
>> ERROR: modpost: "udp4_hwcsum" [net/core/selftests.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [m]:
   - AMD_XGBE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI || PCI [=y]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
