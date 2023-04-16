Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C068E4C79
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 20:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681675877; x=1713211877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IWA/kl2lEi3P4hvy6QNDsKRgT8+/hgOYV/Ka+sKbZnk=;
  b=Yc8S6wdomsbjvcYacQ+r9kd5PnEKSg725Q9PejZmaW+dpcjL9dsCsnjT
   xZFX6Vw3g8Jh4pqo1bUODu4ogZVFRuWTxDrEXUsC6lkhkIortiy8G/vxM
   gWC83l/rEPmak8HjHCB+goh3ZdOcp4fnudHn9yzHp4dTrFMFKmdA2Bt+k
   GBmATmpIkt2RWuLgAp+wN/WjjBD7Xt9RtpDZiSv0v61nrywgPGLNhiVBl
   suo6YzxYfMbo8GIVaUGprij8CnjtYnIF0zrqlmRvlkK19JjpKdKt4G1R6
   +QCf9B+ZPxnL8eXKl/YaFjtvYAf2uzeG1pqROjka4BWHIGYOZLUxE0rio
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344759896"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="344759896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 13:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="640737609"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="640737609"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Apr 2023 13:11:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po8iQ-000bpD-1I;
	Sun, 16 Apr 2023 20:11:14 +0000
Date: Mon, 17 Apr 2023 04:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:track/next 202/203]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6:
 warning: no previous prototype for 'dccg314_init'
Message-ID: <202304170447.Z8pu0ZsG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/krzk/linux track/next
head:   d3f2cd24819158bb70701c3549e586f9df9cee67
commit: ab7cc86660bf41380bfa9cc79bf9103b91b16b13 [202/203] drm: Fix up merge issue
config: arm64-randconfig-r033-20230417 (https://download.01.org/0day-ci/archive/20230417/202304170447.Z8pu0ZsG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/ab7cc86660bf41380bfa9cc79bf9103b91b16b13
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github track/next
        git checkout ab7cc86660bf41380bfa9cc79bf9103b91b16b13
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170447.Z8pu0ZsG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6: warning: no previous prototype for 'dccg314_init' [-Wmissing-prototypes]
     277 | void dccg314_init(struct dccg *dccg)
         |      ^~~~~~~~~~~~


vim +/dccg314_init +277 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c

3cffeffe051a96 Roman Li      2022-06-28  276  
6f6869dcf415f7 Hamza Mahfooz 2023-03-21 @277  void dccg314_init(struct dccg *dccg)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  278  {
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  279  	int otg_inst;
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  280  
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  281  	/* Set HPO stream encoder to use refclk to avoid case where PHY is
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  282  	 * disabled and SYMCLK32 for HPO SE is sourced from PHYD32CLK which
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  283  	 * will cause DCN to hang.
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  284  	 */
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  285  	for (otg_inst = 0; otg_inst < 4; otg_inst++)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  286  		dccg31_disable_symclk32_se(dccg, otg_inst);
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  287  
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  288  	if (dccg->ctx->dc->debug.root_clock_optimization.bits.symclk32_le)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  289  		for (otg_inst = 0; otg_inst < 2; otg_inst++)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  290  			dccg31_disable_symclk32_le(dccg, otg_inst);
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  291  
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  292  	if (dccg->ctx->dc->debug.root_clock_optimization.bits.dpstream)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  293  		for (otg_inst = 0; otg_inst < 4; otg_inst++)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  294  			dccg314_set_dpstreamclk(dccg, REFCLK, otg_inst,
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  295  						otg_inst);
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  296  
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  297  	if (dccg->ctx->dc->debug.root_clock_optimization.bits.physymclk)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  298  		for (otg_inst = 0; otg_inst < 5; otg_inst++)
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  299  			dccg31_set_physymclk(dccg, otg_inst,
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  300  					     PHYSYMCLK_FORCE_SRC_SYMCLK, false);
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  301  }
6f6869dcf415f7 Hamza Mahfooz 2023-03-21  302  

:::::: The code at line 277 was first introduced by commit
:::::: 6f6869dcf415f7c222057a3f07c23667e1758585 drm/amd/display: prep work for root clock optimization enablement for DCN314

:::::: TO: Hamza Mahfooz <hamza.mahfooz@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
