Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3322602
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685629475; x=1717165475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwmSAK1q0JkUi+LBLiHFM3Tyf6Tl2yY/xHkwuJt4QYk=;
  b=iQJKN/PSW3G7x5uaw5L7AaMmIAlLQljRbUyTam/hxuL6GDtiT7bSqfEk
   g86fm2GTEpkNf+XHeRvHEOFhekEyGGgLLUkvusXFOtZiI+JnU0VRz3XR/
   /2Y7Iypv4jtEcTzDECjCYpHQXi8cnBdxMRQxw2otMSVWVXNvkP9NelYgt
   zFEe0CD0dqBhjfjytU8HKeP7kmc/RBXOSJFeF7O2khIm1Vyg3kHD8cJy2
   pQmgFTO6j87kLRLafo8NGkwvaJkU3UdDqUij/58jYux9JWfqH2WqjSc9P
   Mp7fYfd5b7nYbrBTs2CSUpaFqmz7sMNrX2oA4IE/z96i3kkGdYbOxD85z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419088737"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="419088737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657813873"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="657813873"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 07:19:17 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4j92-0002M1-3D;
	Thu, 01 Jun 2023 14:19:17 +0000
Date: Thu, 1 Jun 2023 22:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2f 16/18] arm-linux-gnueabi-ld:
 drivers/gpu/drm/nouveau/nouveau_drm.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user361';
 drivers/gpu/drm/radeon/radeon_drv.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306011715.PpbIBXdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-fix-2f
head:   c626dd130ecbe187ed4a005d7fd19c896a017899
commit: 5a56f7137d32cd4274c818cac99b124d89bacd43 [16/18] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306011715.PpbIBXdv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/5a56f7137d32cd4274c818cac99b124d89bacd43
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2f
        git checkout 5a56f7137d32cd4274c818cac99b124d89bacd43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011715.PpbIBXdv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: drivers/gpu/drm/nouveau/nouveau_drm.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user361'; drivers/gpu/drm/radeon/radeon_drv.o:(__dyndbg_class_users+0x0): first defined here
>> arm-linux-gnueabi-ld: drivers/gpu/drm/gud/gud_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user287'; drivers/gpu/drm/qxl/qxl_drv.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
