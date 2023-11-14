Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C516137
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5SyyQ66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699927218; x=1731463218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quSqMe5qnL6yqLTZF0S8qFDktFADNWZBBipOqASnamg=;
  b=c5SyyQ66tu163dARfSxLFcD251c288cruUrfO+fG9mC6LNMaNje8tMn7
   bpGB40w86+kUN1dX5JFCeHUHkj34UEIi97aH3DBYWgmfgeFdX9aze371w
   CzXquUjqSyyS+VtNM1ni3sWnGZRwoQenvpowpkuBs3SUAPEeOljOCDPoS
   3Nf0H3iunCRb7FkwnOyE9j38SpDm7CVYk8aJTwTB+X/s6bQda2BS160BJ
   3oWLSrzfYnOliYcdPk6gCDcfistSCLrwB9CjinGROoR4OzB9a9LjK7Vw9
   9pLofwtrWDL7Chf8teeY09pPZqzdS5PsRtXskoM+ltzGxmIDipiS3MWcG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394456012"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394456012"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 18:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="855134655"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="855134655"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2023 18:00:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2iir-000Ciz-1D;
	Tue, 14 Nov 2023 02:00:13 +0000
Date: Tue, 14 Nov 2023 09:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>
Subject: [sre-misc:rk3588 32/37]
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:138: warning: Function parameter
 or member 'split_mode' not described in 'rockchip_hdmi_chip_data'
Message-ID: <202311140921.FklKlBIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 140267c1c11d90f4889e57ae6d58280b261081c0 [32/37] drm/rockchip: vop2: Add basic support for rk3588
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231114/202311140921.FklKlBIu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140921.FklKlBIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311140921.FklKlBIu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:138: warning: Function parameter or member 'split_mode' not described in 'rockchip_hdmi_chip_data'


vim +138 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c

6445e394c54b61 Mark Yao           2017-06-22  124  
6445e394c54b61 Mark Yao           2017-06-22  125  /**
6445e394c54b61 Mark Yao           2017-06-22  126   * struct rockchip_hdmi_chip_data - splite the grf setting of kind of chips
6445e394c54b61 Mark Yao           2017-06-22  127   * @lcdsel_grf_reg: grf register offset of lcdc select
171fd53717525f Cristian Ciocaltea 2023-11-01  128   * @ddc_en_reg: grf register offset of hdmi ddc enable
6445e394c54b61 Mark Yao           2017-06-22  129   * @lcdsel_big: reg value of selecting vop big for HDMI
6445e394c54b61 Mark Yao           2017-06-22  130   * @lcdsel_lit: reg value of selecting vop little for HDMI
6445e394c54b61 Mark Yao           2017-06-22  131   */
6445e394c54b61 Mark Yao           2017-06-22  132  struct rockchip_hdmi_chip_data {
96c4704fec95db Heiko Stuebner     2018-09-12  133  	int	lcdsel_grf_reg;
171fd53717525f Cristian Ciocaltea 2023-11-01  134  	int	ddc_en_reg;
6445e394c54b61 Mark Yao           2017-06-22  135  	u32	lcdsel_big;
6445e394c54b61 Mark Yao           2017-06-22  136  	u32	lcdsel_lit;
171fd53717525f Cristian Ciocaltea 2023-11-01  137  	bool	split_mode;
171fd53717525f Cristian Ciocaltea 2023-11-01 @138  };
171fd53717525f Cristian Ciocaltea 2023-11-01  139  

:::::: The code at line 138 was first introduced by commit
:::::: 171fd53717525f0f6dc56e90e6f38a9038c5c779 drm/bridge: synopsys: Add initial support for DW HDMI QP TX Controller

:::::: TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
