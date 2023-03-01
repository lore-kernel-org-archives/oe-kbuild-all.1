Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840CD2F3E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 23:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713119; x=1709249119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PZW3G2EyoXB+1m1zdVdq1i3544OZMGIiJVf/Q2Msk7I=;
  b=iVygLed5CqyJ7ltospFOM+eytUdfhUXDbQgUQsZcG7nQnNdUlBEBf6kx
   ZoSYG9u5D7a3UM8EASQpU/B7xYfj8xY+phHD4ces+vTT2bjym8s8xABeP
   Kz4Fjxx4V1nJ2Y4IpooWbisBqduHsyIy7Tt28SItiQOzr4doZHF+hVYBf
   F0Gc/0Pxslo2WnJG6cCkf3pq+L2Vn0nHoYQ+MqZTDIGp/KO/FFMTT/S7L
   lwIYeBwR2ZxwhWowMrkRGuzCxePNdLGssxpvAwhDWf3e30n0Yfv0yD7Z0
   vQPA5Nir3gVkuyBvZN/K/QPiiMoI+wp5gP80AUVmMbnxs2t3ki9hZMA8O
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="334582194"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="334582194"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652189106"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="652189106"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2023 15:24:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXVoM-0006Ux-0Z;
	Wed, 01 Mar 2023 23:24:38 +0000
Date: Thu, 2 Mar 2023 07:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v11 11/12] net: ethernet: mtk_eth_soc: switch to
 external PCS driver
Message-ID: <202303020700.chUbZT37-lkp@intel.com>
References: <657bbf01e94fe4fdf5a2342b2a52c61bc121d999.1677699407.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657bbf01e94fe4fdf5a2342b2a52c61bc121d999.1677699407.git.daniel@makrotopia.org>

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 1716a175592aff9549a0c07aac8f9cadd03003f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-add-support-for-MT7981-SoC/20230302-035810
base:   1716a175592aff9549a0c07aac8f9cadd03003f5
patch link:    https://lore.kernel.org/r/657bbf01e94fe4fdf5a2342b2a52c61bc121d999.1677699407.git.daniel%40makrotopia.org
patch subject: [RFC PATCH v11 11/12] net: ethernet: mtk_eth_soc: switch to external PCS driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303020700.chUbZT37-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ff89e0d2a6208203b967ff9df9e2d2d4c9a48927
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Golle/net-ethernet-mtk_eth_soc-add-support-for-MT7981-SoC/20230302-035810
        git checkout ff89e0d2a6208203b967ff9df9e2d2d4c9a48927
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/ethernet/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020700.chUbZT37-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:4082:6: warning: no previous prototype for 'mtk_sgmii_destroy' [-Wmissing-prototypes]
    4082 | void mtk_sgmii_destroy(struct mtk_eth *eth)
         |      ^~~~~~~~~~~~~~~~~


vim +/mtk_sgmii_destroy +4082 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  4081	
> 4082	void mtk_sgmii_destroy(struct mtk_eth *eth)
  4083	{
  4084		int i;
  4085	
  4086		for (i = 0; i < MTK_MAX_DEVS; i++)
  4087			mtk_pcs_lynxi_destroy(eth->sgmii_pcs[i]);
  4088	}
  4089	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
