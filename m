Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F0CC8F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 19:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686424686; x=1717960686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFnyDr44hFgwxIRYs7amEzKBCMWHTtvemGUvUKBOB9s=;
  b=JdGa0FqQrb5oJu4S73aZB+9bZcX0VK0wL7rmxUJtYb5Kxf/4r9/jsYq0
   PgPX81pzZyrsVDrvCTmP+GU2wqYhJ12qWrg/Fu7l9Eaf046CsSKJYi4T0
   OMQ3cnyCLr177RUAuG5vbQuXACt7giqj5hCfFz0txQ/1dDRO+Ki3NVlPx
   oh4GX56yHpeNbVqtsUnHGeBmHRHr2H0w1qkF5Gf3V06B0ur6ql85sUpFK
   4Vt3qDS3CzG0MublUnbjWwMK/GWJeRSKDK3HLGEpRgQhWj7cqwdDuKeBb
   xVbkGe2QK8E6apVF3PCN2H+MWCs86yhHxAvLBxa3FIxlZuMhLrC+BZCdL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="444168795"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="444168795"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 12:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="800565101"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="800565101"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2023 12:18:03 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8466-000ANQ-2T;
	Sat, 10 Jun 2023 19:18:02 +0000
Date: Sun, 11 Jun 2023 03:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regcache-raw-kunit 2/3] ERROR: modpost:
 "__regmap_init_ram" [drivers/base/regmap/regmap-raw-ram.ko] was exported
 without definition
Message-ID: <202306110344.H3Ia8Vnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regcache-raw-kunit
head:   fb8380b5b67d85540ef032c2c48c5e9dc3c45f55
commit: 244625c861105612120a49dd6d0bb0f63c667d79 [2/3] regmap: Provide a ram backed regmap with raw support
config: openrisc-buildonly-randconfig-r004-20230611 (https://download.01.org/0day-ci/archive/20230611/202306110344.H3Ia8Vnt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=244625c861105612120a49dd6d0bb0f63c667d79
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci regcache-raw-kunit
        git checkout 244625c861105612120a49dd6d0bb0f63c667d79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110344.H3Ia8Vnt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: drivers/base/regmap/regmap-raw-ram: '__regmap_init_ram' exported twice. Previous export was in drivers/base/regmap/regmap-ram.ko
ERROR: modpost: "__mulsi3" [kernel/locking/test-ww_mutex.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/rcu/rcuscale.ko] undefined!
ERROR: modpost: "__mulsi3" [kernel/trace/preemptirq_delay_test.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/dlm/dlm.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/jffs2/jffs2.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/romfs/romfs.ko] undefined!
ERROR: modpost: "__mulsi3" [fs/autofs/autofs4.ko] undefined!
ERROR: modpost: "__mulsi3" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
ERROR: modpost: "__mulsi3" [crypto/pcrypt.ko] undefined!
ERROR: modpost: "__mulsi3" [crypto/blowfish_common.ko] undefined!
>> ERROR: modpost: "__regmap_init_ram" [drivers/base/regmap/regmap-raw-ram.ko] was exported without definition
WARNING: modpost: suppressed 376 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
