Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934D8F4E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678751335; x=1710287335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2sFRGX2tyldNG8s4paLbEaKwLiCCpkP6wJ6OMWsOh4=;
  b=Xr8qVGNVBKTNdR1pqOQwpCOx+rIzKHCSYR8fR6AQdgVLeEqxs2fidSea
   9UpjEkpO4w1M075CmwTx//HdfzYucqgitGVFQH8rrYqVR9Ub4joGMfpEG
   puSnOfsyht8C03Virz9vL6955fl7Lgc2O2yTQNDedxksa8JGUc/ldvZHY
   CIbjd9aYKjoi+NiI8X2qWt7wXlKzgFL0ONmdlZ/DjXULJKlfD35Y8AaTW
   b66GjVIodujWC64beKTlggWwZqMP5vNlcYseQQqLEIviMEWV53z0RUOlJ
   yYUQsdx4YMfj3n7tTxuKPlwCNSCarhVdzPdDaauiARmvRJ7PrVK3vD1+G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317673674"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="317673674"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 16:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="1008183439"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="1008183439"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2023 16:48:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbruO-0006Fw-1V;
	Mon, 13 Mar 2023 23:48:52 +0000
Date: Tue, 14 Mar 2023 07:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 5636/9999]
 drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: 'dsi0_regs' defined but not
 used
Message-ID: <202303140727.tgVAtoI7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maxime,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   955623617f2f505ac08d0efda2bb50c1a52e2c96
commit: 6cc1edddcf02f69664887ea7ed4b604481ae300e [5636/9999] drm/vc4: dsi: Introduce a variant structure
config: x86_64-buildonly-randconfig-r004-20230313 (https://download.01.org/0day-ci/archive/20230314/202303140727.tgVAtoI7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=6cc1edddcf02f69664887ea7ed4b604481ae300e
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 6cc1edddcf02f69664887ea7ed4b604481ae300e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140727.tgVAtoI7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: 'dsi0_regs' defined but not used [-Wunused-const-variable=]
     617 | static const struct debugfs_reg32 dsi0_regs[] = {
         |                                   ^~~~~~~~~


vim +/dsi0_regs +617 drivers/gpu/drm/vc4/vc4_dsi.c

4078f575714423 Eric Anholt 2017-01-31  616  
3051719af11eb4 Eric Anholt 2019-02-20 @617  static const struct debugfs_reg32 dsi0_regs[] = {
3051719af11eb4 Eric Anholt 2019-02-20  618  	VC4_REG32(DSI0_CTRL),
3051719af11eb4 Eric Anholt 2019-02-20  619  	VC4_REG32(DSI0_STAT),
3051719af11eb4 Eric Anholt 2019-02-20  620  	VC4_REG32(DSI0_HSTX_TO_CNT),
3051719af11eb4 Eric Anholt 2019-02-20  621  	VC4_REG32(DSI0_LPRX_TO_CNT),
3051719af11eb4 Eric Anholt 2019-02-20  622  	VC4_REG32(DSI0_TA_TO_CNT),
3051719af11eb4 Eric Anholt 2019-02-20  623  	VC4_REG32(DSI0_PR_TO_CNT),
3051719af11eb4 Eric Anholt 2019-02-20  624  	VC4_REG32(DSI0_DISP0_CTRL),
3051719af11eb4 Eric Anholt 2019-02-20  625  	VC4_REG32(DSI0_DISP1_CTRL),
3051719af11eb4 Eric Anholt 2019-02-20  626  	VC4_REG32(DSI0_INT_STAT),
3051719af11eb4 Eric Anholt 2019-02-20  627  	VC4_REG32(DSI0_INT_EN),
3051719af11eb4 Eric Anholt 2019-02-20  628  	VC4_REG32(DSI0_PHYC),
3051719af11eb4 Eric Anholt 2019-02-20  629  	VC4_REG32(DSI0_HS_CLT0),
3051719af11eb4 Eric Anholt 2019-02-20  630  	VC4_REG32(DSI0_HS_CLT1),
3051719af11eb4 Eric Anholt 2019-02-20  631  	VC4_REG32(DSI0_HS_CLT2),
3051719af11eb4 Eric Anholt 2019-02-20  632  	VC4_REG32(DSI0_HS_DLT3),
3051719af11eb4 Eric Anholt 2019-02-20  633  	VC4_REG32(DSI0_HS_DLT4),
3051719af11eb4 Eric Anholt 2019-02-20  634  	VC4_REG32(DSI0_HS_DLT5),
3051719af11eb4 Eric Anholt 2019-02-20  635  	VC4_REG32(DSI0_HS_DLT6),
3051719af11eb4 Eric Anholt 2019-02-20  636  	VC4_REG32(DSI0_HS_DLT7),
3051719af11eb4 Eric Anholt 2019-02-20  637  	VC4_REG32(DSI0_PHY_AFEC0),
3051719af11eb4 Eric Anholt 2019-02-20  638  	VC4_REG32(DSI0_PHY_AFEC1),
3051719af11eb4 Eric Anholt 2019-02-20  639  	VC4_REG32(DSI0_ID),
4078f575714423 Eric Anholt 2017-01-31  640  };
4078f575714423 Eric Anholt 2017-01-31  641  

:::::: The code at line 617 was first introduced by commit
:::::: 3051719af11eb48dc8947826cfb66dbe0f281c7d drm/vc4: Use drm_print_regset32() for our debug register dumping.

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Eric Anholt <eric@anholt.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
