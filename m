Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F82E400
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728117547; cv=none; b=kJaDMB3tlmKCSMSGGZq2f4TZHhOP/VEaSJp7g2pVWLA0kFmiApXNM2V0GXsTntvGdCOEgkuCrITFYaKO2zBWIecz8xA9UkqzOoIT29CKkwrgyCiHh6kPzQwMKc4TK8RG5PwKohu1bmxcrolZHMkG9G3wwepsJEnMHzW8nhK/GpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728117547; c=relaxed/simple;
	bh=phQ2TxFlTIuE3ILHGpF9tMmDg3ds34vvjoGx6uQX8b8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaBA332H2DqEgO348JCz+tvk9ft6g9CZtY8Ac462ztQCvcaX5V/IFP5YtKwjQS7YYr8GuXoPDCMaeuIHkhTF9nvthui1S6vXXOgIyymWYEY1XYi8FUICtuULK01TkagPeRKee/cDIrKP3PhyA97JbgWJWnLxiwp7z1RhwIdH3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xz4/wngQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xz4/wngQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728117546; x=1759653546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phQ2TxFlTIuE3ILHGpF9tMmDg3ds34vvjoGx6uQX8b8=;
  b=Xz4/wngQcypBne7MMmF/4iNQH3HbgJBEvLV+sZNlmxwXmaZE8dLExBht
   8pW8riKdEhqe9tcLqlXFdBWLNKlTym4qkhhIPoYA+AlSEVDqBT1wz2SvF
   +17xxhTHiaxXmcgprpwXNM1vbQRROVgVEyTl11dNIRT4zg4dYqGh2Ch98
   VFIVwRHZLia+nrqZZ36QlaaEx7QSullGb4e5lPd+Uk1luA+T0vlZt/uHC
   dHZYIQNr7naK3QJrktvLqZCb8Q4yKP6BOT1wDrIkZg77lZssQnWzYxZHL
   Mkz9B8PJ/vsVnHlLSMOz/nbm2GzCxrpqpVw1CqYQ5K+EguWZ+6GPm8RWt
   w==;
X-CSE-ConnectionGUID: +51tshyPRPGvigoXb3yoZA==
X-CSE-MsgGUID: 3txHWbYyRm2tXjMRvXbI9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38468055"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="38468055"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 01:39:05 -0700
X-CSE-ConnectionGUID: SffD3ETqT3qiqH4y0x6AGw==
X-CSE-MsgGUID: v1J8rOFQRHiW0oTeI+kh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="98250611"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2024 01:39:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx0JZ-0002mI-04;
	Sat, 05 Oct 2024 08:39:01 +0000
Date: Sat, 5 Oct 2024 16:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 237/1001]
 drivers/gpu/drm/xlnx/xlnx_dsi.c:88:33: warning: conversion from 'long long
 unsigned int' to 'long unsigned int' changes value from '200000000000' to
 '2431504384'
Message-ID: <202410051625.aunzM3f2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: ee3581557826adb1e872852dc0077a0a033facdd [237/1001] drm: xlnx: dsi: Adding dsi driver to new framework
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410051625.aunzM3f2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051625.aunzM3f2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051625.aunzM3f2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_dsi.c: In function 'xlnx_dsi_probe':
>> drivers/gpu/drm/xlnx/xlnx_dsi.c:88:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '200000000000' to '2431504384' [-Woverflow]
      88 | #define XDSI_DPHY_CLK_REQ       200000000000UL
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/xlnx_dsi.c:967:48: note: in expansion of macro 'XDSI_DPHY_CLK_REQ'
     967 |         ret = clk_set_rate(dsi->dphy_clk_200M, XDSI_DPHY_CLK_REQ);
         |                                                ^~~~~~~~~~~~~~~~~


vim +88 drivers/gpu/drm/xlnx/xlnx_dsi.c

    85	
    86	#define XDSI_DPHY_CLK_MIN	197000000000UL
    87	#define XDSI_DPHY_CLK_MAX	203000000000UL
  > 88	#define XDSI_DPHY_CLK_REQ	200000000000UL
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
