Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206221548A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 23:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686784158; x=1718320158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdcweoXvwlqFbzv4spf5iwDI3yB8txFPV8J+gi5BPgI=;
  b=J1wnDdJ+BqEolAgxwc1lYHb3Vqh9yNnHn5zXOO3C9BP+zMFVH25Okr75
   f46u1RE8XpVsfpVJjQXhAgV5WZ55AOcaENlLqns8S6wcbDdbE48FCZER6
   /37xo3x6+e9x3m4U5XLTKLnjMNmvwxMLOtswnbkYGmsVs9/Kn+FcZFt3v
   dw6yDTH+KK0003p2R3v3PL5ZP4le78XxKpxgyynx+yoS7qsCvq0y6rUB4
   qVKsD4kZrS6b/4kZnoCRktmyvjP9k5dWoSmY3ZJjxKnk2wgAg8NsEOsLa
   cHs/fV43pKn61e9SHolSnwjHW0LFLM7lMR2DW+4WsUPy4XkuyuIhl5X3d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="357639643"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="357639643"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 16:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="782274210"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="782274210"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2023 16:08:33 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9ZbM-00019h-1N;
	Wed, 14 Jun 2023 23:08:32 +0000
Date: Thu, 15 Jun 2023 07:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2h 17/17] s390x-linux-ld:
 drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user361';
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306150758.diGUNe8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2h
head:   4aa6878283ac7e7ccb8aa13c848b0f4a96b7314c
commit: 1b1c0b6d4ae661d7e2a7cb50b34c245283b01aa0 [17/17] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: s390-randconfig-r044-20230613 (https://download.01.org/0day-ci/archive/20230615/202306150758.diGUNe8q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/jimc/linux/commit/1b1c0b6d4ae661d7e2a7cb50b34c245283b01aa0
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2h
        git checkout 1b1c0b6d4ae661d7e2a7cb50b34c245283b01aa0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150758.diGUNe8q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390x-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user361'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
