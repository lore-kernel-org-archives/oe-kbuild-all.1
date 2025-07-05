Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCF1E1E1D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751736865; cv=none; b=SdI4B+Di/d0Xd46SiqzfkI7AQqW1DabUeDzi90fSRrtiEgsJaxlkLZpFNqV+pLEHbOG6y2NwF5ryagICcCYpBiLJadQYI0kTIGG0AD5YSlrKF+KHI77rhVa/wT5CdsLol7d0xJSooH+DQCy9hnA02s+kpWbKZ0N9g3u07vx3fuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751736865; c=relaxed/simple;
	bh=9O39eRbooJZVz8OpCT2elDhFI7/NnJbHLDwepvUuGa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FA63dWm2XOqImqIncIfefkKd+sVTFDBPzjOFIfTPXxKFTg5boSnEOJkpFbuy2KOBAgC92+yIeRS4k/NvHzA231XRkjYlcdCqr1Eg8VTg3rUuwrWcH8Yn5sJMT06oBBwcQmB4asTmzFkQRtb/++fBfTWHWlqc5IypzY0KtcHrQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SETXFmgZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SETXFmgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751736863; x=1783272863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9O39eRbooJZVz8OpCT2elDhFI7/NnJbHLDwepvUuGa4=;
  b=SETXFmgZ8s7uvHK4mBXbo0RXj/H5UsyeuvYiSI8dQiOiIrBB34jEIttB
   alZqGKeSkZdOdr4k4ndyGb7lWatgwqII3epMNeQegipIOKA7rBJRjs3Wy
   1f59QuvXnw1WmQ0yWFP83GqRisdo0wpq0KfOIRnaOk3XXBzCw1jeCyppj
   hK7AfaFSCzWdq2o4B4WTAUdpyvQwK5DwvV7z+mQqfvBqRDXKSLlBQGv0l
   CiqVhUD818cvImWdTrdfUYVpVgu7XN/jPFjJQHJQuqwe2Lm/7A0L6YoMz
   U++MUMEUYkpJWHkRNgYFdxOggRx1yl5p4ZIldlMlA4+41OctwSssDJZty
   w==;
X-CSE-ConnectionGUID: +AQCUR3sSTG2nMvBwuqYAw==
X-CSE-MsgGUID: ROVmWE4GT3GFWJH+GbIEdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="64265153"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="64265153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 10:34:23 -0700
X-CSE-ConnectionGUID: 4Dv2GeUsRJC8B9lYQ0Hmkw==
X-CSE-MsgGUID: xUryIDdrSSqNY8i1A/aO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="159125497"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2025 10:34:21 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY6mJ-0004e1-2J;
	Sat, 05 Jul 2025 17:34:19 +0000
Date: Sun, 6 Jul 2025 01:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 31/31] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202507060129.fRHyHtWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   1629e9635614976773c662b5e7d32b95cb1481a4
commit: 1629e9635614976773c662b5e7d32b95cb1481a4 [31/31] [NOT-FOR-UPSTREAM] Add build instructions
config: i386-buildonly-randconfig-004-20250705 (https://download.01.org/0day-ci/archive/20250706/202507060129.fRHyHtWt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060129.fRHyHtWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060129.fRHyHtWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .pylintrc: warning: ignored by one of the .gitignore files
>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
