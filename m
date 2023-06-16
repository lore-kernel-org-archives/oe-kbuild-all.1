Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B436D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686876968; x=1718412968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4xubKtmFs66TzoMVr5g1hfs2Or0KMwJCtjzLTqGEPo=;
  b=FqaKgKgGItqdk1yfT7phfodbVbyWAJ/5FrWEv7Y+mS6uyn1e/QSMBsSI
   E72Kc2HSbRC3L/9ByU3LjQlx45xXwmbz5Yq0CkRHa2PNJfvWGRozOgkpL
   esIasdqx2QbE9qC0ZBg8CVIoxyB4ObOPw/cm29XC2IeMsf6p7n5C6X+Sm
   UDn5cMbBjvUZizaj/5x299oj2Yk8Ur4RbYT1eHrir/SRWjJ71j7b2Qho/
   rrVsrn1UkSq9/z8Lu842Ssu6Q/De8vB5Hnu0LO6BquwF5nNc2PMT+yC2t
   ELn0G6oqmXivucoSuk11tSWizhs+pTDJrPtVrlsV0/Pqv18LO3p8gJ29F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="357955846"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="357955846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 17:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857185797"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="857185797"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2023 17:55:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9xjv-0000bF-0U;
	Fri, 16 Jun 2023 00:54:59 +0000
Date: Fri, 16 Jun 2023 08:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2h 18/18] xtensa-linux-ld:
 drivers/gpu/drm/nouveau/nouveau_drm.o:drivers/gpu/drm/nouveau/nouveau_drm.c:72:
 multiple definition of `__UNIQUE_ID_ddebug_class_user317';
 drivers/gpu/drm/mgag200/mgag200_drv.o:drivers/gpu/drm/mgag200/mgag200_drv.c:27:
 first defined here
Message-ID: <202306160806.4BNfDYNb-lkp@intel.com>
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
commit: 162309f7c8f92fb607bec43703d0277bbb7de4c6 [18/18] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: xtensa-randconfig-r011-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160806.4BNfDYNb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/162309f7c8f92fb607bec43703d0277bbb7de4c6
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2h
        git checkout 162309f7c8f92fb607bec43703d0277bbb7de4c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160806.4BNfDYNb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/gpu/drm/nouveau/nouveau_drm.o:drivers/gpu/drm/nouveau/nouveau_drm.c:72: multiple definition of `__UNIQUE_ID_ddebug_class_user317'; drivers/gpu/drm/mgag200/mgag200_drv.o:drivers/gpu/drm/mgag200/mgag200_drv.c:27: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
