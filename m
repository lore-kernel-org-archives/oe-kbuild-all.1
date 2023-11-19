Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E7514282
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhzDXrCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700415665; x=1731951665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RDyADavGG7DZsLDnU/Kza1HrFuascQw3pmDyekyS5B8=;
  b=YhzDXrCTWf95BaG+kYA83gwyybe+E2KJNAnufypDhcvuNc+Ho8CGE6Ok
   5x3mcuHemxGwU49gGz2MdcRD+ceQIfVD+I6gqK2WGth7hhygYQWPSi0l6
   CIhn+WcZxcUxkrq1cLU8VkP0aaJ1rqBW5xp2DdnPiaNomJbM7Cx5FPdoI
   b6xtCaYS4/9jIXlaaHbRyMND9TqXGlqHlGum3o0bVI7XlrJUpWYtnulkQ
   dXb+SeRye6D41NbkXXyXduU20Mm23dOpmOXEn7w61jtP2caSBGBqviky4
   VJ6PFRhAhRuzU2ATZ6V7pnZAnf6pgdNK8G9kQHJ11cr7Pb7sK9jEu9FVD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381900323"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="381900323"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 09:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909893407"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="909893407"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 09:41:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4ln3-0005ND-0R;
	Sun, 19 Nov 2023 17:41:01 +0000
Date: Mon, 20 Nov 2023 01:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 5/10] drivers/phy/apple/dptx.c:63:21:
 error: implicit declaration of function 'readl'
Message-ID: <202311200116.tbQFkBb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   8d5aa5ac58d74bbab31f6e180ad02d227b8bfeca
commit: 3ba9173a776695e19481d515c3c1135ca6d718d5 [5/10] phy: apple: Add DP TX phy driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231120/202311200116.tbQFkBb8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200116.tbQFkBb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200116.tbQFkBb8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/apple/dptx.c: In function 'mask32':
>> drivers/phy/apple/dptx.c:63:21: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
      63 |         u32 value = readl(reg);
         |                     ^~~~~
>> drivers/phy/apple/dptx.c:66:9: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
      66 |         writel(value, reg);
         |         ^~~~~~
   drivers/phy/apple/dptx.c: At top level:
   drivers/phy/apple/dptx.c:318:5: warning: no previous prototype for 'dptx_phy_set_link_rate' [-Wmissing-prototypes]
     318 | int dptx_phy_set_link_rate(struct apple_dptx_phy *phy, u32 link_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/apple/dptx.c: In function 'dptx_phy_set_link_rate':
   drivers/phy/apple/dptx.c:320:19: warning: variable 'sts_1014' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |                   ^~~~~~~~
   drivers/phy/apple/dptx.c:320:9: warning: variable 'sts_1008' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/readl +63 drivers/phy/apple/dptx.c

    59	
    60	
    61	static inline void mask32(void __iomem *reg, u32 mask, u32 set)
    62	{
  > 63		u32 value = readl(reg);
    64		value &= ~mask;
    65		value |= set;
  > 66		writel(value, reg);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
