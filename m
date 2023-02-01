Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93EE7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 00:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675212457; x=1706748457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qVjA6ohp6yBJ9EldUGTKnqbRVZK0k+7IEK+FBbRa4s=;
  b=jy8kYjB+y21YfYnVHNBDDrgqqygpFgJhiUa+NL8bfw/OWhQNMO07vlFl
   ID+UNUJIAzgYO6ZX+0PnLPRIPXoisGaqbklK6O8/qYZ/Y+P+QrAUdf9tG
   gkuR5HitGJE3efMDu3+NXqIHeDKM4H7C2BezMGJ+B+eOCBBn3Nhzk0F+d
   FNBnei826LUoHIRYrBF1uyDYcEEksMb0l74sg8Mkj5sktNM9xk1Z529GM
   ZEZl8f9S+GHwQgaXg7B4NY5i6i7eQzIOc1lg12tEPecbYNcLX0wqykQ9P
   xpWnxl9Sj02uMMy3mMFxydsFfvF5Bi8UL5gpFvuyLtyCo/bs7l665x9CG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="390372814"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="390372814"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 16:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="697037316"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="697037316"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2023 16:47:34 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN1Hh-0004r8-2U;
	Wed, 01 Feb 2023 00:47:33 +0000
Date: Wed, 1 Feb 2023 08:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/thermal/mediatek/lvts_thermal.c:20:10: fatal error:
 dt-bindings/thermal/mediatek-lvts.h: No such file or directory
Message-ID: <202302010850.s0QXNs2P-lkp@intel.com>
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
commit: ae95c42ab38beb37c3ae370935d5c5c7e7b680eb thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver
date:   11 hours ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302010850.s0QXNs2P-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ae95c42ab38beb37c3ae370935d5c5c7e7b680eb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20230131-220614/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
        git checkout ae95c42ab38beb37c3ae370935d5c5c7e7b680eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/thermal/mediatek/lvts_thermal.c:20:10: fatal error: dt-bindings/thermal/mediatek-lvts.h: No such file or directory
      20 | #include <dt-bindings/thermal/mediatek-lvts.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/thermal/mediatek/lvts_thermal.c

  > 20	#include <dt-bindings/thermal/mediatek-lvts.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
