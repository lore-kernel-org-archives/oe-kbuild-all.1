Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91CEAD3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675382098; x=1706918098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rujPrDCR/ZXHnhHol8Ro0Yht2x++M4UZTlULHsO6fdQ=;
  b=mgk9eiDvkAZZQ1QxhmpoSsO1Vi7BRW3ajE3q2b/xcTku3BHjy3DaJrMN
   gfnzMmiSQtGHHugJuZ3k0T86akOuVVHDJWG78hinF0neeNmd/oYWiE+Tb
   X8y08vSkvZoj1GUFkJSe+iy3sLQQZup0EhLk/pAdIxc6bm3rgKeHitSxC
   npF17Aph3ZOAqMx0PuJXlljIZQoDJybB7WBFO9q406y5XAwkUeVASfdS5
   psBt+UnFqjPGKfsxAFzu/hMNSDhf6tI1P1kzt/aqtd0gcOaN7jaEAVBMO
   6uTzoRfTywBY0HHEPuCPcVGCxWiFVdS+vaqGp2XcBPjIs9I34jSvvGPop
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316605874"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="316605874"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 15:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754258181"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="754258181"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2023 15:54:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNjPr-0006xu-2s;
	Thu, 02 Feb 2023 23:54:55 +0000
Date: Fri, 3 Feb 2023 07:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-test 18/39] ERROR: modpost: "mtk_clk_unregister_pllfhs"
 [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!
Message-ID: <202302030706.i7YlihjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-test
head:   14d84237ad57de7b0f267d290ae87e40842965b4
commit: f29de3daf8b0286bbc41acd2ccb676f5af48d7be [18/39] clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230203/202302030706.i7YlihjJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=f29de3daf8b0286bbc41acd2ccb676f5af48d7be
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout f29de3daf8b0286bbc41acd2ccb676f5af48d7be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mtk_clk_unregister_pllfhs" [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!
>> ERROR: modpost: "fhctl_parse_dt" [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!
>> ERROR: modpost: "mtk_clk_register_pllfhs" [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
