Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DC946BA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOxB0wu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701211870; x=1732747870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0di2lcK9OHjj4Y4Vf1GbUmYPfa1guoWLJyeYfxE8G90=;
  b=fOxB0wu/QF9Wtf76Iu7lPDu9jLCnlko1Ye551wmHjOPGouvT27fJhC5x
   dxCp/WbJMlktNxDPvHheiGGachKjT5w+mmuOiTOtu1Fy+0IdGbi8aEWpT
   am61EC017jRc9Od6ldwQPcVfttAaIYne1Vqt/opUndoYY1BAXEmuBLHDf
   vMtYIcWN7uGGT5s9bagT+m/ujq7T75WOK2JgrCUj99miq7TKTBGRj5zKX
   ein6qKt26LoYg8+WlNHS/glyr/VF5M7FZLtpDHbYwa8HqkQWliTFW4pO5
   2WdQ3t6JLfNbELg+BwrflAhQyIE53zSSSY4Tf2SbCgwAcfH8x5YslU75X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392797061"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="392797061"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 14:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942106671"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="942106671"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2023 14:51:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r86v4-0008E5-0Q;
	Tue, 28 Nov 2023 22:51:06 +0000
Date: Wed, 29 Nov 2023 06:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-sm8450-sm8550-on-next 36/40]
 drivers/soundwire/stream.c:749: warning: Function parameter or member
 'multi_link' not described in 'sdw_ml_sync_bank_switch'
Message-ID: <202311290304.cLvlkMCv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8450-sm8550-on-next
head:   f85076039ced5f68e969ef04dc4059f1377475e7
commit: bd040bf119f195584e9bab9fb2887e3ef9d65c68 [36/40] UPSTREAM: soundwire: stream: fix NULL pointer dereference for multi_link
config: i386-randconfig-141-20231129 (https://download.01.org/0day-ci/archive/20231129/202311290304.cLvlkMCv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290304.cLvlkMCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290304.cLvlkMCv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/stream.c:749: warning: Function parameter or member 'multi_link' not described in 'sdw_ml_sync_bank_switch'


vim +749 drivers/soundwire/stream.c

99b8a5d608a642 Sanyog Kale          2018-04-26  740  
ce6e74d008ff5c Shreyas NC           2018-07-27  741  /**
ce6e74d008ff5c Shreyas NC           2018-07-27  742   * sdw_ml_sync_bank_switch: Multilink register bank switch
ce6e74d008ff5c Shreyas NC           2018-07-27  743   *
ce6e74d008ff5c Shreyas NC           2018-07-27  744   * @bus: SDW bus instance
ce6e74d008ff5c Shreyas NC           2018-07-27  745   *
ce6e74d008ff5c Shreyas NC           2018-07-27  746   * Caller function should free the buffers on error
ce6e74d008ff5c Shreyas NC           2018-07-27  747   */
bd040bf119f195 Krzysztof Kozlowski  2023-11-24  748  static int sdw_ml_sync_bank_switch(struct sdw_bus *bus, bool multi_link)
ce6e74d008ff5c Shreyas NC           2018-07-27 @749  {
ce6e74d008ff5c Shreyas NC           2018-07-27  750  	unsigned long time_left;
ce6e74d008ff5c Shreyas NC           2018-07-27  751  
bd040bf119f195 Krzysztof Kozlowski  2023-11-24  752  	if (!multi_link)
ce6e74d008ff5c Shreyas NC           2018-07-27  753  		return 0;
ce6e74d008ff5c Shreyas NC           2018-07-27  754  
ce6e74d008ff5c Shreyas NC           2018-07-27  755  	/* Wait for completion of transfer */
ce6e74d008ff5c Shreyas NC           2018-07-27  756  	time_left = wait_for_completion_timeout(&bus->defer_msg.complete,
ce6e74d008ff5c Shreyas NC           2018-07-27  757  						bus->bank_switch_timeout);
ce6e74d008ff5c Shreyas NC           2018-07-27  758  
ce6e74d008ff5c Shreyas NC           2018-07-27  759  	if (!time_left) {
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  760  		dev_err(bus->dev, "Controller Timed out on bank switch\n");
ce6e74d008ff5c Shreyas NC           2018-07-27  761  		return -ETIMEDOUT;
ce6e74d008ff5c Shreyas NC           2018-07-27  762  	}
ce6e74d008ff5c Shreyas NC           2018-07-27  763  
ce6e74d008ff5c Shreyas NC           2018-07-27  764  	bus->params.curr_bank = !bus->params.curr_bank;
ce6e74d008ff5c Shreyas NC           2018-07-27  765  	bus->params.next_bank = !bus->params.next_bank;
ce6e74d008ff5c Shreyas NC           2018-07-27  766  
ce6e74d008ff5c Shreyas NC           2018-07-27  767  	if (bus->defer_msg.msg) {
ce6e74d008ff5c Shreyas NC           2018-07-27  768  		kfree(bus->defer_msg.msg->buf);
ce6e74d008ff5c Shreyas NC           2018-07-27  769  		kfree(bus->defer_msg.msg);
5ec0c8721c06fc Pierre-Louis Bossart 2023-01-19  770  		bus->defer_msg.msg = NULL;
ce6e74d008ff5c Shreyas NC           2018-07-27  771  	}
ce6e74d008ff5c Shreyas NC           2018-07-27  772  
ce6e74d008ff5c Shreyas NC           2018-07-27  773  	return 0;
ce6e74d008ff5c Shreyas NC           2018-07-27  774  }
ce6e74d008ff5c Shreyas NC           2018-07-27  775  

:::::: The code at line 749 was first introduced by commit
:::::: ce6e74d008ff5c8b43e3bafaa7343bf7eb69593e soundwire: Add support for multi link bank switch

:::::: TO: Shreyas NC <shreyas.nc@intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
