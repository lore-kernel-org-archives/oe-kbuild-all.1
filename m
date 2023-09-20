Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193A23A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 03:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695181383; x=1726717383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PONhccOGVBHoyfXZSHu6M1+bWoQWd8v0wm/TpKcLxJw=;
  b=UW49r54xjRnnMpVVPbaBITFqXq2SDfmEvlYZxQfOVKCimYjOJgRNU8A/
   jGHkyC7nrlQqZmN2HlYqYExwgY28RIa0TDsLgGap09UEI/hfBNj6RtNe8
   d24fdHGAQdS0ZnUpgZz4IIstpTqfuxDpjJtroV1HU9WD9GnbkttWeH4PA
   J92S6ejp8kiRxFrJjZcUAxueSkHUnHmFLfFRaVunOvx4mCNzy5wfGStvM
   BPrMRUeJa2yPf7Fy8Og7R9azNKVjGz1k17SPA4zXa+JFDb2D4Q4r5t0Vo
   LGHb2iioEGRrNMp2LjGlWMZNeZ87lHdhyVoH0wZoQ0r2WgGAQ99cPa1Vg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360370245"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="360370245"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 20:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="723099070"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="723099070"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2023 20:42:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qio77-0008FU-1z;
	Wed, 20 Sep 2023 03:42:57 +0000
Date: Wed, 20 Sep 2023 11:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 341/1363]
 drivers/gpu/drm/xlnx/xlnx_dsi.c:88:33: warning: conversion from 'long long
 unsigned int' to 'long unsigned int' changes value from '200000000000' to
 '2431504384'
Message-ID: <202309201126.2DO03dYx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: d3e7c74ac96205a2a31f16b67c60edfd1ae5faa1 [341/1363] drm: xlnx: dsi: Adding dsi driver to new framework
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201126.2DO03dYx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201126.2DO03dYx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201126.2DO03dYx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_dsi.c: In function 'xlnx_dsi_probe':
>> drivers/gpu/drm/xlnx/xlnx_dsi.c:88:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '200000000000' to '2431504384' [-Woverflow]
      88 | #define XDSI_DPHY_CLK_REQ       200000000000UL
         |                                 ^~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/xlnx_dsi.c:967:48: note: in expansion of macro 'XDSI_DPHY_CLK_REQ'
     967 |         ret = clk_set_rate(dsi->dphy_clk_200M, XDSI_DPHY_CLK_REQ);
         |                                                ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=y] && PM
   Selected by [y]:
   - DRM_XLNX_DSI [=y] && HAS_IOMEM [=y] && DRM_XLNX [=y]


vim +88 drivers/gpu/drm/xlnx/xlnx_dsi.c

    85	
    86	#define XDSI_DPHY_CLK_MIN	197000000000UL
    87	#define XDSI_DPHY_CLK_MAX	203000000000UL
  > 88	#define XDSI_DPHY_CLK_REQ	200000000000UL
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
