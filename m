Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14491B85DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725723051; cv=none; b=HdmZ8QBXvCz4tDExJeAlqkNKiXQzhFXN3nYnCpb6Ai4YnLpP3z4UMtrxRu+qXMWrWNlYPgfhWKsNkjPyX3wH2W5L+JZUXBezV3JB9CMGSnDh6cHGN+pZcUKQx9Lro5b1u67XY8iSE0BRrE8LyWNOOUP9Zq9KquA3QgWCfSoYp7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725723051; c=relaxed/simple;
	bh=tBUzpwgdHPnB6NZS1YVmNQYBwL+I9NGQ69L9AKEg/10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3y6U8OokbobcS/BMXE3A/IZ3dj0JzKOzzmmahDgJ6P1dtvZiGBsakYDhYKvG2Lw24NJI0P3PED2xDOJ+WQ66WDEEwk/FxwH8RvsRsbdNqtsZgeTMi1N6BcdTHx03p+CA6dSx6XgeYoIqN8fXmf0XLy1B9tU0l+zAx1Vgqla7QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GK921kW0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK921kW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725723050; x=1757259050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBUzpwgdHPnB6NZS1YVmNQYBwL+I9NGQ69L9AKEg/10=;
  b=GK921kW0ae1/UR13+6gA3YlR9oIwE5YJOLxPeKWozNCqCZiCcMPAh8y4
   YsKnuJzxcw9ADUyT+y7uyh0PMXf+ctFRfzrx49lVumIY3Ar5wwoyOqQR5
   wfgEL+jOsMyJxm99SWEJD3QJtKz7gPEg6pyQks6IUIBo72v3A34XHami+
   /GVlmAa5L6JLk1b+r1v93p3eE5WxMPv1NF/4+dtqHP476qQg8IPYEG401
   55RyWDiaU83Hsl7acVLB5Ksh6xsx6NU37PHw3nZa/Z6ZamHRuhJg8EuQ+
   MssrV/jE7O5cpjAWeE2AoO0diWnAia4iFnrjFEr0hFGWqoCNqt3LKR9iL
   A==;
X-CSE-ConnectionGUID: oqCtu/51TwG8zBoiB9EzXA==
X-CSE-MsgGUID: KsLkuwZbTdOpRowY1P8jRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35818335"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35818335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 08:30:49 -0700
X-CSE-ConnectionGUID: gOH5PFklSia1gxLfL+TBWQ==
X-CSE-MsgGUID: 1woey9r5T/m9/vcoSW8Abw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70806532"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2024 08:30:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smxOf-000Ced-2I;
	Sat, 07 Sep 2024 15:30:45 +0000
Date: Sat, 7 Sep 2024 23:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9160/10296] ERROR: modpost: "__divdi3"
 [drivers/net/can/rockchip/rockchip_canfd.ko] undefined!
Message-ID: <202409072304.lCQWyNLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 4e1a18bab1244204f873103eef1c0c88f794be85 [9160/10296] can: rockchip_canfd: add hardware timestamping support
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409072304.lCQWyNLU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072304.lCQWyNLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072304.lCQWyNLU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "__divdi3" [drivers/net/can/rockchip/rockchip_canfd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
