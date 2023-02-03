Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FB29A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675436587; x=1706972587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQCTMH2RZT/nLfJJzreIlfX3cPBV56aqK5ImRMTjHvs=;
  b=cUxokexKTCFjdvrsBhvfWDjHkPzI1YVDaGH+fCfLtaQ1KRw1BoHAn2v1
   ip56J5MBbU8npEZeswaCBi9PS0A2CaVQlXEWgavG9DPVQDblzHez7ZgW5
   RafnNKIS+AVk/jChYXDHUFjIWMuY4f3XMnqHiczfwi+KOdzXJXQ0o1P7V
   42jPYHutBHUGU82yQPLhKng0v2JCLncG3ubHCguiQMKljemDsfPZBF6we
   +7W5Gjs08b09Nr+VuyTp57DQpuMZberzBZLAl8RsHJ0Cz+8ML7qP9D5Ph
   O2tm9gTZ4NGnv/df0KhYXpzv0ZtiAOmlvD6mvdqt266EDDe7GkzBW8v44
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="414976240"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="414976240"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 07:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789719049"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="789719049"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 07:03:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNxah-0000Zv-2s;
	Fri, 03 Feb 2023 15:03:03 +0000
Date: Fri, 3 Feb 2023 23:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
Subject: [wens:mtk-test 19/39] ERROR: modpost: "mtk_clk_unregister_pllfhs"
 [drivers/clk/mediatek/clk-mt8173-apmixedsys.ko] undefined!
Message-ID: <202302032335.kY1FAqfO-lkp@intel.com>
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
commit: ddcaa79669690cef7a4265a4d6844c2461aa8cd4 [19/39] clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230203/202302032335.kY1FAqfO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=ddcaa79669690cef7a4265a4d6844c2461aa8cd4
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout ddcaa79669690cef7a4265a4d6844c2461aa8cd4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "mtk_clk_unregister_pllfhs" [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!
ERROR: modpost: "fhctl_parse_dt" [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!
ERROR: modpost: "mtk_clk_register_pllfhs" [drivers/clk/mediatek/clk-mt6795-apmixedsys.ko] undefined!
>> ERROR: modpost: "mtk_clk_unregister_pllfhs" [drivers/clk/mediatek/clk-mt8173-apmixedsys.ko] undefined!
>> ERROR: modpost: "fhctl_parse_dt" [drivers/clk/mediatek/clk-mt8173-apmixedsys.ko] undefined!
>> ERROR: modpost: "mtk_clk_register_pllfhs" [drivers/clk/mediatek/clk-mt8173-apmixedsys.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
