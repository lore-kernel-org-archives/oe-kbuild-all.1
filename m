Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9C621CD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685629474; x=1717165474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8ujxJGNiNZFRzvhyvjUVieJWyEeosgkp1ytX9w7nGo=;
  b=lYRK8732mHpcjTopgktmSyZX71R1lj1I1qxV7pIoarQezAL/IXK3gaXo
   uiep/Ymmu+/14L6zagVZkaJdXQ2uHJ3u4XL8QXnbhuqGNK58wzyf2i3Zd
   C01xyVJWKdOCE+AgCh7+K/1aNj38bJ2u4ftO1KJnvWZDMSP7W2NJacRyd
   YfSoyzLBXHLIMgegyFDc0z1oA2JV1s8XJWXed4zu8s/Np/5hRRAYDHuNh
   U4WrDxr7wQNoE+3n4BxImYbHGCOO2fvkLSmiUC6+mOgqI30uuSzdJxo8z
   CxLU/BpM7R6mKhdBh8ZSHZCSt1U7MeX/wYJvV/xIQmb0NkvtHcWQmBPoE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419088731"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="419088731"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657813867"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="657813867"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 07:19:16 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4j91-0002Lm-0S;
	Thu, 01 Jun 2023 14:19:15 +0000
Date: Thu, 1 Jun 2023 22:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2f 16/18] s390-linux-ld:
 drivers/gpu/drm/nouveau/nouveau_drm.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user393';
 drivers/gpu/drm/radeon/radeon_drv.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306011745.aY6bFvyd-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306011745.aY6bFvyd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011745.aY6bFvyd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: drivers/gpu/drm/nouveau/nouveau_drm.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user393'; drivers/gpu/drm/radeon/radeon_drv.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
