Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00F630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 23:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681514459; x=1713050459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iahJUXaGfWWxQ92qu30K5ILJEmoOROi4XcxJsU5Bv9E=;
  b=mOIOgAiR6nYCHuINBrTrNh9TQr3qNBENCFtO73feN13LwXWKXW7Erudr
   NxaGWcGKBEgI65pfJF2AO1bo6Vpwyr/RN85aPIk+eYNHdGzpMJpe7H7cq
   GL5GrdDKiBrudJth8RBxByP+LGT6bPQzDn4AwNQzx0s3rI19gP2aHxtVg
   OQcEZEM7pRHng4HB8z5xw0iJhpOO9+L+GKt9eygf2YBMOPR0WewXgNs4Q
   KBCKp0BHUAWXImQyoSan72lc/cqYD2eAD/UaXBtM9p2vWEHFUf6PlbXPp
   CNT7zIgPWlVTrvFPS+spELZ1tq59vNkhtN6fx9IhD5zew0Z+2o1iEOTla
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328747475"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="328747475"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 16:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864367481"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="864367481"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 16:20:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnSiu-000a6p-0X;
	Fri, 14 Apr 2023 23:20:56 +0000
Date: Sat, 15 Apr 2023 07:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3979/9838] drivers/base/power/domain.c:260:6:
 warning: no previous prototype for 'pm_genpd_disable_clks'
Message-ID: <202304150740.vZzotljZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 01a19a7ad755e54def65a81ac23b93fa5a77cc4d [3979/9838] LF-4713-1 PM: domains: add pm domain clocks support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304150740.vZzotljZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/01a19a7ad755e54def65a81ac23b93fa5a77cc4d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 01a19a7ad755e54def65a81ac23b93fa5a77cc4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/base/power/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/mailbox/ drivers/media/platform/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/backlight/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150740.vZzotljZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:260:6: warning: no previous prototype for 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     260 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/base/power/domain.c:266:5: warning: no previous prototype for 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     266 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/pm_genpd_disable_clks +260 drivers/base/power/domain.c

   259	
 > 260	void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   261	{
   262		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0)
   263			clk_bulk_disable_unprepare(genpd->num_clks, genpd->clks);
   264	}
   265	
 > 266	int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   267	{
   268		int ret;
   269	
   270		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0) {
   271			ret = clk_bulk_prepare_enable(genpd->num_clks, genpd->clks);
   272			if (ret) {
   273				dev_err(&genpd->dev, "failed to enable clocks\n");
   274				return ret;
   275			}
   276		}
   277	
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
