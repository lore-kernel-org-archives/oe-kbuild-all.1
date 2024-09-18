Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBA3D8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 02:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726626294; cv=none; b=qIon6WsXcGapPZMx1AGcaXcw8glIHbK815hfs1WPfsOkb4E/sPogf1dxFYc0u7O4rPvfzCwAuman0kNdMjPwgDDyirB4/jMZcBZhsBJaKBwGnnYaPYSYTdN1w4a43o8zPYMkymaMee8MWKCPQEXyDfMPu7Fdbta/dGbJjoupHAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726626294; c=relaxed/simple;
	bh=M17Q4dbqzWW255BWaAwNuWu+pMp/KpOiZamXarJM6lE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SOU8FMDyIeWdZ6JzzchgRWG5gK4dy2kewWJXXIlue02fCUBDRYmMKX5z98rXSbfimZ+5+Td1ul3DlBdJ0DWRn2tz/RMnhNlq2b1ClLKJoRDdXYQss4dKg6R2zrxPwDwX0jgh5ZuIxwPQCQUjkGyAUpN/xFPqIoda84aEzuPQZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOFC7zdG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOFC7zdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726626293; x=1758162293;
  h=date:from:cc:subject:message-id:mime-version;
  bh=M17Q4dbqzWW255BWaAwNuWu+pMp/KpOiZamXarJM6lE=;
  b=gOFC7zdGS2pXC7LaQdq1Iv1NhXmt4uLiCu0i1OG4hxDAFMd8a0AjbNtI
   ZxLsvqpl21cy9poiOrU49GyyFDnHK7t/YbSEkuH6H2m2JB2ZD6kQ0Q92+
   A8zH7BfvNgtSyfJoUu+mhiYTmBEtNhyxbSa4liVbzozwudlqYwQSo7/d7
   QTH3LNtXq/mv3t46HOimz/UgeVguXynrrqI+/zTCvvoaiVhu5ny6bvkjA
   Gg3KMDBCckmSXCisMgzv95Icvh8yIDZZkgQE3X96kZ2UcTZjpmRb2DfBQ
   eIYYR+AuTjXCNJOpzxYxWzM2R0it+DNziIo69QO8hRBdRuKnX9O2kUqIY
   g==;
X-CSE-ConnectionGUID: U5oDlg6rRiGtBQjXH0e6Hg==
X-CSE-MsgGUID: btWPUt1FRYqVjqoPg8i9+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25336398"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25336398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 19:24:52 -0700
X-CSE-ConnectionGUID: A/Ysuq7pQLqWcBmAxVQERg==
X-CSE-MsgGUID: MDJ91EdXTWqGSV2ElI5hpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="74136724"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Sep 2024 19:24:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqkN7-000Bne-19;
	Wed, 18 Sep 2024 02:24:49 +0000
Date: Wed, 18 Sep 2024 10:24:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 46/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
Message-ID: <202409181002.D31AT5sS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: b18364151a13ff12dcf5655d4c13e734e824206c [46/107] media: i2c: add DS90UB913 driver
config: nios2-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB913-0-0 (https://download.01.org/0day-ci/archive/20240918/202409181002.D31AT5sS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181002.D31AT5sS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181002.D31AT5sS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB913
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB913 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
