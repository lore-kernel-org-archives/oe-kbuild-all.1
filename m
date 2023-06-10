Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2945DC8F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686428486; x=1717964486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yp1x66gu1micWalQT+00donTYaCdkv0Et9aEy2xAoE4=;
  b=DTHTYuPWENjxmCh8/z/Svp4w/AkBJNrds7zmTOEylBRbEvjrlP7gS2vk
   V6/1SfwvPgwKF8j5X7rUnDAW6mlz2gemP5+hHN2DWfFjq/Y1/du5tOIEf
   MJ/eLIOgNhf50X0q7tMp92Su+BXyI7W3PqKsU1RWtDlf6myVn5vMei460
   83RVk1pmE+DH4REGF7ZzAy4kpyPNjYrS7jCT7WHqnzs6F8GKigYB5vrk9
   YlwXNsoSHQDpT9Tm/IevR36E5dAfjh41aVy5Pw4XXymcjaXP4Z6EggxYX
   2/Rc+wbSohWi8wadRC05Ogy6TJ+LUHkhYhjQQ4uOXXDHKmwqK11VU5vg4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="423679317"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="423679317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 13:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="740512872"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="740512872"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jun 2023 13:21:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q855Q-000APO-05;
	Sat, 10 Jun 2023 20:21:24 +0000
Date: Sun, 11 Jun 2023 04:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2g 17/17] ld.lld: error: duplicate symbol:
 __UNIQUE_ID_ddebug_class_user285
Message-ID: <202306110415.dJUzSuwm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2g
head:   9d18924f8ebbf3e18d9c50a9ac6d2e42841ae6b4
commit: 9d18924f8ebbf3e18d9c50a9ac6d2e42841ae6b4 [17/17] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: arm-randconfig-r046-20230610 (https://download.01.org/0day-ci/archive/20230611/202306110415.dJUzSuwm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/jimc/linux/commit/9d18924f8ebbf3e18d9c50a9ac6d2e42841ae6b4
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2g
        git checkout 9d18924f8ebbf3e18d9c50a9ac6d2e42841ae6b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110415.dJUzSuwm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __UNIQUE_ID_ddebug_class_user285
   >>> defined at qxl_drv.c
   >>>            drivers/gpu/drm/qxl/qxl_drv.o:(__UNIQUE_ID_ddebug_class_user285) in archive vmlinux.a
   >>> defined at gud_drv.c
   >>>            drivers/gpu/drm/gud/gud_drv.o:(__dyndbg_class_users+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
