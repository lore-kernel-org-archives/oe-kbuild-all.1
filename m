Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46234B1E79
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519720; cv=none; b=pG1+Z4Dc4RhD73+NTOphf9fXCoIpIO/tXYIev1tNg7zdEM8hn+Sjo7MYQsRculilXdB2ojv+nTFo9Olmk3bf6+oe3MtG8XTwTWnkkBpeGQIZezRKhDikqCzD453EfB3rfigi/KLhcBRfe3xC2pOQt9ATYZLxEt/SfM6Pspmw1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519720; c=relaxed/simple;
	bh=ycHMZG2jdfr9TTZVfx33d5i20W8ep5S54tI8lNu94e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKj4FGm6FJGFy2vnTPuJ5I1ikxbA4CtaWnBZSq1qmFNwQQO5phz6iQCsgGak6BIi5MHJJLtguySkY3ZndhXR4W8HbHdYU1/goVVpEJw2in0HqO9tPtogwQaNDWg9B1ycitSa7RGBQFnWTFOJmk39D7gAwzFFfX5xfa8oQR3Nha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBPDRrYs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBPDRrYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746519719; x=1778055719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ycHMZG2jdfr9TTZVfx33d5i20W8ep5S54tI8lNu94e4=;
  b=XBPDRrYstP3HtH8pPR7bIijGJjMqzbIe7+yyVEKnMdEX6IubAWJ6xcpE
   8CbjtcX7iPdh+OKK4FFfiqkJbH/dc37IgbpsjNG322J9iG84Adard4b39
   og55tQcGn3w67SMk2I2XFQko4fPtuFdqmPMqQU18wyV+RifBCfcm3pDnS
   AeUY6wsUX7jvqyMYCCH2eJ7XnIBMEJF/vLiouvPCc3OZgTj4KqD8buqpH
   yOIxvpUPSXfzSo6Q9JPLtfkAWdSWhc/sk4ne9/U4MWfzAF86FydDwzETx
   Ryg752ZAj28O9FW7etydYSydQuFY9vIJWXMg8EP3qb4iCpnLOktwCdmHk
   Q==;
X-CSE-ConnectionGUID: F8BAFO3hRNKVIhwgUlV6vQ==
X-CSE-MsgGUID: w+69rP/QRPWkMyV9GgyeWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="58801443"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="58801443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:21:58 -0700
X-CSE-ConnectionGUID: VIALxOo/Qpyr913qw9BJGQ==
X-CSE-MsgGUID: fHBa/1xnQQmTOEf6VmU3nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="140665743"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 01:21:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCDYo-0006Oj-0S;
	Tue, 06 May 2025 08:21:54 +0000
Date: Tue, 6 May 2025 16:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 5158/8712] ld: drivers/net/phy/mdio_bus.c:579:
 undefined reference to `phy_device_register'
Message-ID: <202505061644.Ywv5LKBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   407f60a151df3c44397e5afc0111eb9b026c38d3
commit: 52358dd63e348c3b6c488acc105be1aeda8fb923 [5158/8712] net: phy: remove function stubs
config: x86_64-randconfig-123-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061644.Ywv5LKBr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061644.Ywv5LKBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061644.Ywv5LKBr-lkp@intel.com/

Note: the linux-next/master HEAD 407f60a151df3c44397e5afc0111eb9b026c38d3 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mdiobus_scan':
   drivers/net/phy/mdio_bus.c:558: undefined reference to `get_phy_device'
>> ld: drivers/net/phy/mdio_bus.c:579: undefined reference to `phy_device_register'
>> ld: drivers/net/phy/mdio_bus.c:581: undefined reference to `phy_device_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
