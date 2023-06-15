Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570121379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686813938; x=1718349938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Ok3gt1VU1P6SodZCukgraPsSBWPiZdVVND2Jwym02g=;
  b=TpRbRdRbYBoDzKHWAFr8zSRBN9TPcFQ8KwXOto1BI4Yg9gvMSlPEf4/6
   CtFaOqYsgTArP/Mu6adCkqC4SyLU4WiZJzUTgBC8A/itct+xtA4wIyLX5
   +iHib/4ZmJXJTUqCADfEAtGCi4oEa/D12FrY2TqFkD9ivRVLnoUBNM15f
   G5BPztQsHOHx1vS4lQ9xq8beoce+UOlCUsh8s5co+ucrzejHHSMEvxVP7
   Crh2ToOFLUgvJ0egZzVttv9wQ71S+4NOKrcfpXn7SZIgm8oTsYGCANadn
   E23+HlX9JEnpulJzCLTZAE0Yj8gwcNOdZE8B9JV3wQdW+adr42ljnRLF2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348506853"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="348506853"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 00:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="836516949"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="836516949"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2023 00:25:36 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9hMO-0001b0-0E;
	Thu, 15 Jun 2023 07:25:36 +0000
Date: Thu, 15 Jun 2023 15:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2h 17/17] mips-linux-ld:
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user454';
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306151518.1pzAZJDZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2h
head:   720d42a1729f3c70b0ea7ec0b29ccafebe26c102
commit: 720d42a1729f3c70b0ea7ec0b29ccafebe26c102 [17/17] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151518.1pzAZJDZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/720d42a1729f3c70b0ea7ec0b29ccafebe26c102
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2h
        git checkout 720d42a1729f3c70b0ea7ec0b29ccafebe26c102
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151518.1pzAZJDZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mips-linux-ld: drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user454'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
