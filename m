Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22D1858
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679140665; x=1710676665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVvF2R6tBxjAH+f77DrcXTT+cje07hElPHn/O+eLtqc=;
  b=Hpz3ElNibMD4dqKLQjtJK2q9H+eIWVle1fRcjIJKcA1l9eQol7g8vPLi
   xyDjUa/yKNxZcDS4lX/bNBgGs33AJMV3HxfNe6+SgtSzRXEykx1MeV1Yr
   Kw21v36xe7lf39otnwILguhSZvDPPTkwfcInSdpzAmwdXWuN6+Tmmrt62
   YxyOPoV9n8Ce8o+VHyWvUFP/vWX2gijzn7pwoP1yCzqnojxbPQAN33qpE
   lditEqE5CSN7pJElgf2CKWBtqYL0pvQ8fcH+kOWY2cCqwwEXLf6vMI9u5
   YQmJPh2dzjqf92mLM2U0hfDJMLZvHmkYb+BSP9EyZHVXfGfar28Wv9TEU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424705289"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="424705289"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630576339"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="630576339"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Mar 2023 04:57:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdVBu-000A2c-26;
	Sat, 18 Mar 2023 11:57:42 +0000
Date: Sat, 18 Mar 2023 19:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [sverdlin:ep93xx-snd-wip 24/48] drivers/dma/ep93xx_dma.c:1520:35:
 error: 'ep93xx_dma_of_ids' undeclared here (not in a function); did you mean
 'ep93xx_dma_of_probe'?
Message-ID: <202303181921.y0DKTc1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-snd-wip
head:   ba6048c19f4e119e9d76024c66e205a7f6750063
commit: 4b4b4097c04f5f15cf607967eb050b5ab4583fbc [24/48] dma: cirrus: add DT support for Cirrus EP93xx
config: alpha-randconfig-r034-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181921.y0DKTc1B-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/4b4b4097c04f5f15cf607967eb050b5ab4583fbc
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-snd-wip
        git checkout 4b4b4097c04f5f15cf607967eb050b5ab4583fbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181921.y0DKTc1B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/ep93xx_dma.c:1520:35: error: 'ep93xx_dma_of_ids' undeclared here (not in a function); did you mean 'ep93xx_dma_of_probe'?
    1520 |                 .of_match_table = ep93xx_dma_of_ids,
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   ep93xx_dma_of_probe


vim +1520 drivers/dma/ep93xx_dma.c

  1516	
  1517	static struct platform_driver ep93xx_dma_driver = {
  1518		.driver		= {
  1519			.name	= "ep93xx-dma",
> 1520			.of_match_table = ep93xx_dma_of_ids,
  1521		},
  1522		.id_table	= ep93xx_dma_driver_ids,
  1523	};
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
