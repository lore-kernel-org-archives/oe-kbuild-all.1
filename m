Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4CD12B94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686841694; x=1718377694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8acUvOGj+p4sKfS/xbMjh/bogEV798m3ErZq6jitNY=;
  b=leX8U23C03LFxRUUw6oxNSIFjyjTDUNnecJQvRjQBKU2Tx1n0AuLv3tK
   f1QBgLX9JmLHE0yeQa17FUCAdssea+qN3nFyGKeZwhjdX2VYczww7lubu
   ws/gjjzcUGlrS34jqNSwtrkR9TnjWc4iAvgN7L7/U4yPhciBaEXTRCvj8
   ExX56vCIvYRkqS6zDSj/awXRY27APHYvNNk9P9t0q+B6gmRaJAcOXqIl4
   dGacMPs/1aq7lfI+Vpf734S1kXEEmOO/qksXptJAjr+E6jvt5R9WYrbFA
   Pb0nxxLEeOQSbZ5DQeU2iCvst//jJAFToQTDm3EMVvZEHCXquXNVTtNmh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387443905"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="387443905"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 08:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1042697993"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="1042697993"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 08:07:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9oZT-00004w-0P;
	Thu, 15 Jun 2023 15:07:35 +0000
Date: Thu, 15 Jun 2023 23:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dasnavis Sabiya <sabiya.d@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 6/17]
 scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h:16:2: warning:
 #warning "These bindings are deprecated. Instead, use the header in the DTS
 source directory."
Message-ID: <202306152329.exvy8OOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   4fda6c9cb0582b26e2c87d4885dd728a52abaa54
commit: cc6651b1cfbce2352a7f360d45d9587775d7bd4e [6/17] arm64: dts: k3-am69-sk: Add overlay for DDR carveout memory nodes
config: arm64-buildonly-randconfig-r005-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152329.exvy8OOt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout cc6651b1cfbce2352a7f360d45d9587775d7bd4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152329.exvy8OOt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:13:
>> scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h:16:2: warning: #warning "These bindings are deprecated. Instead, use the header in the DTS source directory." [-Wcpp]
      16 | #warning "These bindings are deprecated. Instead, use the header in the DTS source directory."
         |  ^~~~~~~
   arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:176.20-189.3: Warning (interrupts_property): /fragment@1/__overlay__: Missing interrupt-parent
   arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:191.20-204.3: Warning (interrupts_property): /fragment@2/__overlay__: Missing interrupt-parent
   arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:206.20-219.3: Warning (interrupts_property): /fragment@3/__overlay__: Missing interrupt-parent
   arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:221.20-234.3: Warning (interrupts_property): /fragment@4/__overlay__: Missing interrupt-parent
   arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:236.20-249.3: Warning (interrupts_property): /fragment@5/__overlay__: Missing interrupt-parent
   arch/arm64/boot/dts/ti/k3-am69-sk-ddr-mem-carveout.dtso:251.20-264.3: Warning (interrupts_property): /fragment@6/__overlay__: Missing interrupt-parent


vim +16 scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
