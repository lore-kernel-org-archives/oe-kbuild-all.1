Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0BA2CA5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 23:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680390404; x=1711926404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2IDBXEc2GzDdhXFuJyPLEpslmwtlwRbU3d8GHoNbD8=;
  b=gHLlvGl84fI2y0p1zBANpM0m+YhSG0zjPchl6AHu5WENGmOrXhD+IR+L
   djZpHGdwBAonQwEwVRf9d7h4lx5XLgk/FPApPUiCrGHQ+MZSTizF7lXvI
   11ouYNEaxgn39c/lI+F/LmR9mceODy4iyKL8xkVJZylLj+lBodFB+ckRj
   BbFIOYkGwq8qhJoBnXfGq5r62du0+OiuStIylXtDuSld0BCVKBo0+3LK3
   0j50vesRFeOYaAQr4xmlA8KRfCFgM2Zl2MSdnXbsuQEDHekMCnbCoyvff
   WoOfjgYa0/cXGVO+mCGh/jQXMLnk+7hUySomrSyF4iyqn7ER8px00maXp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406730815"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406730815"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 16:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="796555740"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="796555740"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2023 16:06:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pikIz-000N6N-0l;
	Sat, 01 Apr 2023 23:06:41 +0000
Date: Sun, 2 Apr 2023 07:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [clk:clk-mediatek 81/82] FATAL: modpost:
 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap: sizeof(struct
 platform_device_id)=24 is not a modulo of the size of section
 __mod_platform__<identifier>_device_table=784.
Message-ID: <202304020649.QO2HlpD5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   0d2f2cefba64729a0730ce183ad58cf3e7929b94
commit: 1b5e5299dd35da0dff2d454826a60870237837da [81/82] clk: mediatek: Add MT8188 imp i2c wrapper clock support
config: parisc-randconfig-m041-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020649.QO2HlpD5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=1b5e5299dd35da0dff2d454826a60870237837da
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-mediatek
        git checkout 1b5e5299dd35da0dff2d454826a60870237837da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020649.QO2HlpD5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> FATAL: modpost: drivers/clk/mediatek/clk-mt8188-imp_iic_wrap: sizeof(struct platform_device_id)=24 is not a modulo of the size of section __mod_platform__<identifier>_device_table=784.
Fix definition of struct platform_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
