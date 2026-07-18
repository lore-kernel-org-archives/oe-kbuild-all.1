Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60CA43F0B5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 04:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784347313; cv=none; b=u6nG3vb5H7JU92FY6nT5I4FeMoysddDArRov4faHmiIpGdW0PW7ccJHID75UWW9zWL7xVegbRcjtYRr5bi2Rz02isAtNzI8KsYsEh7YQM4oyZLZ7KFcyL3RNeUjKcMWs23bNa7yKhIn5U8ZWEOiHKBUT8aGsorM1mFol6nz6EGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784347313; c=relaxed/simple;
	bh=dtKAv0Cd4vbXGL8G5Ojw/dIZtNwMV6tkeZLy/jz5ess=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OPEmHKDB7nmyQvFl/MW4a9B4cVQw0O+Sifu1vUiqwexGCoPdpYil5PMaBuFMffDsUYJEHIYWauzCehW+2OH0+ouDiVSaF13HuhTOFHfsu5Df/XbGnWMem79nE2C2XBQ5eDhpYEhkj1en5a0lDQmDrQBskEbg94C2Za6hDhFuOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H87xWouq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H87xWouq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784347311; x=1815883311;
  h=date:from:to:cc:subject:message-id;
  bh=dtKAv0Cd4vbXGL8G5Ojw/dIZtNwMV6tkeZLy/jz5ess=;
  b=H87xWouqFrSigzMBpKquqJcLJI37Yv+//UXjHDp5KY2YVATMZXh6mdq9
   wSO2Xa3cwNP5fQMaW7g+IzyjLBoq5YyUGjHsfwvy7P9xitWV3YA38CuqU
   +KlqJX7sH2AHpFKb422EQw8o+KvxMh41ME8Stjl8aYXc3MLweWMw5fwqA
   ZOGLw1xrXe+9WrlagzCR/oRw3SCBXCVrAO3kJC9p0uy1L/tgH5zGcryFv
   jfx5QlOs6q/GG0ezF8POfRbruZrO/whMZ46+r5Fik9f0gpiH9Yh3J1kUk
   iUaFD2wyAoOt9VHOTvE9nIRUXR/AA7S/BUpW0cS5prDHxrbAFg2GaeYFK
   w==;
X-CSE-ConnectionGUID: FT8cviFeTdqNWA7HNvkIqA==
X-CSE-MsgGUID: Zp6RKNPMT9uyaTDvJcW6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="83998936"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="83998936"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 21:01:50 -0700
X-CSE-ConnectionGUID: oryiDczITJm1r3y4zpGOcQ==
X-CSE-MsgGUID: SiW2yEY0RmmbK7QefQN6og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="281407966"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2026 21:01:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkwFG-00000000TQt-05SS;
	Sat, 18 Jul 2026 04:01:46 +0000
Date: Sat, 18 Jul 2026 12:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 39/51] ERROR: modpost: "xfs_rtcsum_mount"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202607181134.5QXHoTVF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: ac76f4f1f7ef9c32cbd6f5cd8163ba542ca02726 [39/51] xfs: core RT data checksum support
config: sparc-randconfig-002-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181134.5QXHoTVF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181134.5QXHoTVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181134.5QXHoTVF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xfs_rtcsum_mount" [fs/xfs/xfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
