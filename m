Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C132C13B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754149100; cv=none; b=F2UcXRNMb9A95Gd4ell+8CJlkTRs3LE/xrBFT2hNvFs8VZYu76fYiCU9p80/mY2F9L7sLs0jSUOEUd1ig+OgcuLq0SSQNGhELWyypNGGHK4WiavDkNcaS6Sl9G9vfCmj7LeIzhv1k12DI8xXBPfluyh6OCVGNkjAVrdQPAnwvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754149100; c=relaxed/simple;
	bh=deHngLx/sBlMP8M6+m9lMcETPu6STdyMohh1Sw1xXII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/U/JMEbI4Wcbos1ZNMHomHmqEpT28I/q3GnjxOPwYyYnpuumRr8XFExcEwP/goAHGPp/3GC9w3BK2FYiYI7wL0wl0/zcByfmp4lno61aEvuvw+YCtbgMmhKekB5DmMmEBSpVNL+rwHjTYNJv56r4YwPqFw1YK4VGSlkiDJNbLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlBydKdH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlBydKdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754149098; x=1785685098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=deHngLx/sBlMP8M6+m9lMcETPu6STdyMohh1Sw1xXII=;
  b=dlBydKdHO8/yRlQ6nl4QBp7veYaX91JUPJf1XvBWRkSoNqsndeHxACWP
   HNphpuK2IH8Z7bFj+lczBUXlGoibUsB3T61FSUK3m1PfsQ0/ffI0EgBsi
   fwZy/H6DcpFQNY/3ubJ2XY+bxkHwWCY48n5T7riNxRGSfWPcAM7lWqjJc
   TW+AUTrQyQlkA0/GCQE6Lc5/KhztRN+sbHghsZlUamNO+fC57txpKcnV/
   xZqURUZSiqbK5h2LpcOGRH/iwdZTsqcoUwcqkK2kP6GI8J5KzFDeyNvIF
   2gBun0ji35zyoLV7jtRGPuY43apqsm44BkhFeDHxGu3xSvqZuMuVq4jgp
   Q==;
X-CSE-ConnectionGUID: 93VMWoE5RV6OgGpE/RAq1A==
X-CSE-MsgGUID: LBm03vOLQtOS4h4sYzycNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="67543150"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67543150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 08:38:17 -0700
X-CSE-ConnectionGUID: uLcky5A2RmOLfiJ0hSZ99g==
X-CSE-MsgGUID: m2f1AUadRJWSnRY2x3sD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194640671"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2025 08:38:16 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiEJK-0005Qs-0z;
	Sat, 02 Aug 2025 15:38:14 +0000
Date: Sat, 2 Aug 2025 23:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [netdev-net:main 15/21] kismet: WARNING: unmet direct dependencies
 detected for ZL3073X when selected by ZL3073X_SPI
Message-ID: <202508022351.NHIxPF8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   1dbf1d590d10a6d1978e8184f8dfe20af22d680a
commit: a4f0866e3dbbf3fee4078bce0b78d65a0875c0bc [15/21] dpll: Make ZL3073X invisible
config: nios2-kismet-CONFIG_ZL3073X-CONFIG_ZL3073X_SPI-0-0 (https://download.01.org/0day-ci/archive/20250802/202508022351.NHIxPF8j-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250802/202508022351.NHIxPF8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022351.NHIxPF8j-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ZL3073X when selected by ZL3073X_SPI
   WARNING: unmet direct dependencies detected for ZL3073X
     Depends on [n]: NET [=n]
     Selected by [y]:
     - ZL3073X_SPI [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
