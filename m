Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DC1863
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675415758; x=1706951758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s591EnynV9Qw2qx3KWqu0/ZOH5QrihIgLgTW7QfwBJk=;
  b=irya/t/XiuRiIes8rA+4FQcX0HoihE+h7Y9JWbtRez3pobXsapegIc6J
   PIf1w2X3Cb5fyRHxWEwxCkUei1S9p7TEieLCPekHVadtq0kUf0gKdN5HR
   8STF9f1hAMGmuAxTPqd5RRoU2Q/xeNIAZA2X0OCjuIfASHkkQxVd0jg3M
   OsnmORGUMBbcc2xttp132ygIBy8wYqb6tJOWydhpChacG1QErXu+Fh1Lw
   74UsA99wpAESODN6O7hz9aHvHmcNJawbYQHbiKVuNCdRGzrzyq/4CVFT/
   413Q/neM9lEnUc5tY8P5fjMusr26569zichZ5//FTTFbZ14iUIdgA4yH/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="330832261"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="330832261"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 01:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="698009442"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="698009442"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2023 01:15:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNsAg-0000LR-0P;
	Fri, 03 Feb 2023 09:15:50 +0000
Date: Fri, 3 Feb 2023 17:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/arm64/boot/dts/mediatek/mt8195.dtsi:17:10: fatal error:
 dt-bindings/thermal/mediatek-lvts.h: No such file or directory
Message-ID: <202302031742.bLWp7r6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230131-220614/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
head:   d122a362e2e9a6052d1ca4da029a1c5ba82e4dea
commit: 7af71ea3c5aeb931bc239d0b9a3ee04aa21cdfb8 arm64/dts/mt8195: Add thermal zones and thermal nodes
date:   3 days ago
config: arm64-randconfig-r035-20230203 (https://download.01.org/0day-ci/archive/20230203/202302031742.bLWp7r6l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7af71ea3c5aeb931bc239d0b9a3ee04aa21cdfb8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20230131-220614/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
        git checkout 7af71ea3c5aeb931bc239d0b9a3ee04aa21cdfb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:8,
                    from arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts:6:
>> arch/arm64/boot/dts/mediatek/mt8195.dtsi:17:10: fatal error: dt-bindings/thermal/mediatek-lvts.h: No such file or directory
      17 | #include <dt-bindings/thermal/mediatek-lvts.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 arch/arm64/boot/dts/mediatek/mt8195.dtsi

  > 17	#include <dt-bindings/thermal/mediatek-lvts.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
