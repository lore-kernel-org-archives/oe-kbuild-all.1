Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA37616415
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 01:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472219; cv=none; b=Xq2ePmJJdkB4lt7eGSo6IXDTTJsbCWhqEH4DCxnZmnMAnvBjGB63o+xl11iMmovjkTNgigYR190mAlP/ff/vtTIzJoiBmkmBmE9KLH3WrFWQXH5cQRQPCx2pKrNUwIYCkVjJHaIYC1nKGmhqlscFoIWq1C0hs0V6PuO3+2LLDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472219; c=relaxed/simple;
	bh=bpV+9KEiXua131RxfneSemMcm9VW1zS0h1yesDkpd5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHweTObFc3oqVEae0k+S/W5zEJjFtBctE1xvLDKrFWb0y6XgtoWbAQp6DXF56VrmBEO/Skq+ecxrqEfx1JEumHnjBrwiScGNzG4RsmovpVJYORHFZexQOS77wktRRseDbTv659DcZgU4BORlmSlKJROPc6mTREpqKMee94mDBj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Napr630t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Napr630t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736472217; x=1768008217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpV+9KEiXua131RxfneSemMcm9VW1zS0h1yesDkpd5M=;
  b=Napr630tDO106NtAs8pj+z2fFZA2BjAoxEIU3dqLPNecp9g6fNgrXUI/
   bzunkudpea+l98oXuD1h2mITfxCllkPkSGi5N8jNawH2NAQsDz4+gFWDt
   tbVIJVx2rqcIwD+0TVM/Nu4SLs4x0Z08OtFtaF8DfqduLt9ygVMLqp53i
   agl3G8YQjxYZW5f5aY8i/+ZuT/kUv766ymLmkLXAYooDwRpUCkDAXcrsi
   z4fHIoVb2osQ/vxAlOXisrgzFBmj17UeeDQ1Ok+TcT9NLLjs/A7W4mUsH
   JGIEUNdccldci8cCi4EXl4MNiQ7XgvYw+uR1jSRCc3ZeivB6O9cYVmJA/
   Q==;
X-CSE-ConnectionGUID: TQ2FHc/pT4S/2vJe1aXVdw==
X-CSE-MsgGUID: eKvRSYteRISJSmlKHmRzdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36988325"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36988325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 17:23:37 -0800
X-CSE-ConnectionGUID: a2O4i3hKRVaR2e/aWaPcJA==
X-CSE-MsgGUID: nduWJzZ4TLKf7wdDJr1W+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108628968"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jan 2025 17:23:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW3kL-000INf-2o;
	Fri, 10 Jan 2025 01:23:33 +0000
Date: Fri, 10 Jan 2025 09:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] ERROR: modpost:
 "__kvm_nvhe_memcpy" [drivers/iommu/arm/arm-smmu-v3/arm_smmu_v3_kvm.ko]
 undefined!
Message-ID: <202501100949.i26CS904-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   77d466d701ab218de0142aa6f8b97c22c487b048
commit: e0abda8b771ca9dd97fd815b4be3bc9711fa3a5c [1/1] ANDROID: drivers/arm-smmu-v3-kvm: Modularize driver
config: arm64-randconfig-004-20250110 (https://download.01.org/0day-ci/archive/20250110/202501100949.i26CS904-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100949.i26CS904-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100949.i26CS904-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/pkvm-pl011/pkvm_pl011.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/arm/arm-smmu-v3/arm_smmu_v3_kvm.o
>> ERROR: modpost: "__kvm_nvhe_memcpy" [drivers/iommu/arm/arm-smmu-v3/arm_smmu_v3_kvm.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
