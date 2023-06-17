Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE7B63A9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687024847; x=1718560847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yjp8O/wTeA3Qc5AGhr9xnGpjHn0LSsZ1Sh863Phn6Bg=;
  b=VZZr9psqEMA3uBAOWm8uc4dz5zgyfszdPSyRjYgwJ6lfEJtQh4EZNHmJ
   kJu14GnbQFGW0q13FkMRPc0Y1ODOmgidGlfnvQPiE8pThiYEjWuLsP+Jp
   Yqk3t34ys6KhY2fZsNz9QK6yzSXGtUAiwSFzYDB5t/pQb7LTsCJilUqOm
   +xim1+NJEYmUaKTBo6LYU/KTrvAABrXVXnI6s/NHs11+DVX9+6SFIbw6e
   IejBAr33sjLss2g0m9V0vsgLRcAd/Wu9KkMx7s6Q6FvKDJrBUaOmPI5sG
   ClP/DUh6cHDN7JKN4/KmU+EmD/YtvbxoB4+bcv6EjYVjIAvQEUjqnTxZi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="361949654"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="361949654"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 11:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="783278840"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="783278840"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2023 11:00:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAaE8-0002zs-2v;
	Sat, 17 Jun 2023 18:00:44 +0000
Date: Sun, 18 Jun 2023 01:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daniel-lezcano:thermal/tuxsuite 26/32]
 drivers/thermal/tegra/../thermal_core.h:18:2: warning: #warning This header
 can only be included by the thermal core code
Message-ID: <202306180110.phXO0eiw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   http://git.linaro.org/people/daniel.lezcano/linux thermal/tuxsuite
head:   f619663add5d265ddbfeb5ccc165dd88c1edd5ce
commit: 19bc6f9da25e7f7c944afa60a586510ec747b0bd [26/32] thermal/core: Hardening the self-encapsulation
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230618/202306180110.phXO0eiw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add daniel-lezcano http://git.linaro.org/people/daniel.lezcano/linux
        git fetch --no-tags daniel-lezcano thermal/tuxsuite
        git checkout 19bc6f9da25e7f7c944afa60a586510ec747b0bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180110.phXO0eiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thermal/tegra/soctherm.c:36:
>> drivers/thermal/tegra/../thermal_core.h:18:2: warning: #warning This header can only be included by the thermal core code [-Wcpp]
      18 | #warning This header can only be included by the thermal core code
         |  ^~~~~~~


vim +18 drivers/thermal/tegra/../thermal_core.h

    16	
    17	#ifndef THERMAL_CORE_SUBSYS
  > 18	#warning This header can only be included by the thermal core code
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
