Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6BC627
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 01:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686879436; x=1718415436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUTdZIeKreKBd5bCCknL9JQYvm+0ljn4c1smTf9Okxs=;
  b=P3uAjG+L+tHb2jQcRUViuSvZKGznMUMdYF8OB8nRokNJRbstCQ4pX+/4
   jjBK3dO+DoamJPU8EuKWyNjsRIl/7/LI70xoAIGWnnhQ7UAQ8+A44BACZ
   fWYILXmtnNGZb+N0YCM1fotytZhJkjfhKmj2tN9RcTdvaUq4QHgYuwCMt
   0ov7qOj0RB2uZ5gBBbwdK/Bt3XVSv3m3YcMkir/Zn2O6cscr4s1iIpNi7
   MDQBuwtzKFOHtGXcibyUhnqPyTPX7S7M18h9PbSfOR6HwmuL0jDCt/Qsy
   9AbhR7x3NDslZ5ed9SwShmzpKiBmIkQrOUzKfXVYCk56MHkxgNcb4SErQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="357962564"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="357962564"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 18:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959426545"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="959426545"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2023 18:37:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9yOa-0000d3-0c;
	Fri, 16 Jun 2023 01:37:00 +0000
Date: Fri, 16 Jun 2023 09:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2h 18/18] hppa-linux-ld:
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user321';
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306160928.umbmptmo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2h
head:   162309f7c8f92fb607bec43703d0277bbb7de4c6
commit: 8590c8deb147627e6b78851808322da2669ff626 [18/18] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230616/202306160928.umbmptmo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/8590c8deb147627e6b78851808322da2669ff626
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2h
        git checkout 8590c8deb147627e6b78851808322da2669ff626
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160928.umbmptmo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user321'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
