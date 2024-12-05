Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC11F130D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398955; cv=none; b=daVVDjD4ZoL671bEE61z7Cf8ptbNHlRBNQh2r9mi0lhbvx9Aj2QCc5w4sVy383mpB8CsrhinEloKt27OxCI+IsxwuaAEGkJw5z77ymRnejV/LnrcswUjvZ8+Nq7+c7zWzpQ/UXz+nKppGJi0E8rBCqMeueO3s3wOoH67hHdi6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398955; c=relaxed/simple;
	bh=CGxb4M2tiEOibB/LnTxAl2TH3jXqOCKuBeQ7ld54V2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qw7NOISaAN5sg7deBISirqSvu5ioMwQIReNDoQEWhaaF33KKgDuvuissHHwIUzYG08AnQ4ifjRvfpuZYWo7MuOYdCdZ6a3XRyUrzix+sYgXMqI6xxHPBOmjh+X5uJ6ROIZihYcLqWHdL78nUsqAv/fxLYca2iMsBilRoHUBwVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bf3PTd9d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf3PTd9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733398952; x=1764934952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGxb4M2tiEOibB/LnTxAl2TH3jXqOCKuBeQ7ld54V2U=;
  b=bf3PTd9dFDJyriSIHxfZgukZ9aoYI4IFfGIJ/HqjH8uG2+lzOax/Z1ly
   lunJXLrYmijLjhr++e1W+vsR0f8Q7Pd9UtOPa/Dnr765kk9PnCXhk686Z
   UUendp56AQxoUn++8B8/ylPcJ0hysAfinTeZEvqKHt4edUzlr2wYXZ7LE
   xYgccx5N7Zw5b8K6sLYoGpat99ehK81NeN/5+A/IpDiMe6hoBQ83x6tem
   qOX4SwfAb6gUAKKzpfLTj4PEj1fGJIRqkMhrc8Sx36YL9kUkDmBQdAvLI
   k5nWOnm7qvzNPYkNsvR+ahPkoiss0lorM9jxM+3w+m57icc6y9ydtaLiq
   w==;
X-CSE-ConnectionGUID: VoBiibtkT/C9MeZrNU5BNA==
X-CSE-MsgGUID: 68ZqCEdiTje4aIrOB9Wprg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33624778"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33624778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 03:42:32 -0800
X-CSE-ConnectionGUID: 1P1rm4YMQbqlOHgrkvaWDQ==
X-CSE-MsgGUID: mQmx/oggRfSvjWrE8+dtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93759596"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2024 03:42:31 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJAFY-000487-24;
	Thu, 05 Dec 2024 11:42:28 +0000
Date: Thu, 5 Dec 2024 19:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/140-pci 9/18]
 drivers/pci/controller/pcie-apple.c:150:23: sparse: sparse: symbol
 't8103_hw' was not declared. Should it be static?
Message-ID: <202412051949.KhhrAHtX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   5230e1fe6430c562e3c9270f1dad7af26bea5697
commit: 0b35e060bbac4d17e2f6cf63ed39675f350de4fb [9/18] PCIE: apple: Add T602x PCIe support
config: arm-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241205/202412051949.KhhrAHtX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412051949.KhhrAHtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051949.KhhrAHtX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-apple.c:150:23: sparse: sparse: symbol 't8103_hw' was not declared. Should it be static?
>> drivers/pci/controller/pcie-apple.c:171:23: sparse: sparse: symbol 't602x_hw' was not declared. Should it be static?
   drivers/pci/controller/pcie-apple.c: note: in included file (through arch/arm/include/asm/traps.h, arch/arm/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/t8103_hw +150 drivers/pci/controller/pcie-apple.c

   149	
 > 150	const struct reg_info t8103_hw = {
   151		.phy_lane_ctl = PHY_LANE_CTL,
   152		.port_msiaddr = PORT_MSIADDR,
   153		.port_msiaddr_hi = 0,
   154		.port_refclk = PORT_REFCLK,
   155		.port_perst = PORT_PERST,
   156		.port_rid2sid = PORT_RID2SID,
   157		.port_msimap = 0,
   158		.max_rid2sid = 64,
   159		.max_msimap = 0,
   160	};
   161	
   162	#define PORT_T602X_MSIADDR		0x016c
   163	#define PORT_T602X_MSIADDR_HI		0x0170
   164	#define PORT_T602X_PERST		0x082c
   165	#define PORT_T602X_RID2SID		0x3000
   166	#define PORT_T602X_MSIMAP		0x3800
   167	
   168	#define PORT_MSIMAP_ENABLE		BIT(31)
   169	#define PORT_MSIMAP_TARGET		GENMASK(7, 0)
   170	
 > 171	const struct reg_info t602x_hw = {
   172		.phy_lane_ctl = 0,
   173		.port_msiaddr = PORT_T602X_MSIADDR,
   174		.port_msiaddr_hi = PORT_T602X_MSIADDR_HI,
   175		.port_refclk = 0,
   176		.port_perst = PORT_T602X_PERST,
   177		.port_rid2sid = PORT_T602X_RID2SID,
   178		.port_msimap = PORT_T602X_MSIMAP,
   179		.max_rid2sid = 512, /* 16 on t602x, guess for autodetect on future HW */
   180		.max_msimap = 512, /* 96 on t602x, guess for autodetect on future HW */
   181	};
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
