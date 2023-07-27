Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B30017CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690426601; x=1721962601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMtstLRVjXrNNEJuQPj326VHofzagHwtLIp3YvTqQKU=;
  b=RTw3e388eZaVVoLWYcRnG5lJcVQ4ToKatlPvTixgtZQL4QsSQj25zk6y
   gWd8Q1z7QMWfWqDVaHyz7zEaawNqIcENlOIEdbOQ76jdQ1QLJ5OBWTyvQ
   uRUMWyCvk6IjYuboG57KFOLv8rPfrAEUw8eAtd96KY+PdIOq3a3nAajPw
   TcZfRaT7Ira5YbWBNB6X7ObWNSYTEqX/NGm3aum8ZEFPBnqXUlXLtNxH4
   vxTT86NdL8/O//U/+w3uJrqI/x9loWOdvSp4JieRfXolLrm83MpGo7n5R
   hIFzPHn5fC2+LNnLqE6BtHqRdyN1z1Tut5MUZJyoYyYjIgBRzOik555cj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365646613"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="365646613"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 19:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900690087"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="900690087"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 19:56:32 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOrB1-0001bb-2k;
	Thu, 27 Jul 2023 02:56:31 +0000
Date: Thu, 27 Jul 2023 10:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 4103/9999]
 drivers/gpu/drm/vc4/vc4_dsi.c:617:35: warning: 'dsi0_regs' defined but not
 used
Message-ID: <202307271001.stljJKMY-lkp@intel.com>
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
head:   140d69b4e41d185d886880460461fab70f3b5e84
commit: 6cc1edddcf02f69664887ea7ed4b604481ae300e [4103/9999] drm/vc4: dsi: Introduce a variant structure
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230727/202307271001.stljJKMY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271001.stljJKMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271001.stljJKMY-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
