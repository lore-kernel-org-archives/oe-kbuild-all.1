Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6D6120
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686822787; x=1718358787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpJsBe7H6ogOYyAl8hsywU8AF+BB9BmFlmrn/3l3V+c=;
  b=dzYDLizzVY1UXLeMtI6M1wV45QxkPhbgoUWnkiMCYl4as+k5v+JfUflU
   4v1jZnQGQmzymm8BFa2UnpQxJMEQ1l+aYGU3tTHGJr3N1R+iV2PYvAXxt
   qBjoUf1epAz4tpntMvZZNTPlB3AEngSef8axyybqDhiTi0AOcPCftccPe
   OBU+0tQl/jpa8gNgx4rp0AczyYxWfxRKKWdgHwLQ3gA7WdkIXC4SeulSH
   BlnjRYNSqRCmhNWAHmjp9+7+Hi6ZWfB6sm58QXuEf4f/S2kzvRDjJhGZF
   NqPev4nnPPoE3G99zWbCQJFuXb9ysT909S8vVtDIn0CGtPQaenSkAv2hu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339213843"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="339213843"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 02:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="802273916"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="802273916"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2023 02:53:05 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9jf6-0001iz-2Z;
	Thu, 15 Jun 2023 09:53:04 +0000
Date: Thu, 15 Jun 2023 17:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2h 17/17] ld:
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user333';
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306151751.0egsl4WG-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151751.0egsl4WG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/jimc/linux/commit/720d42a1729f3c70b0ea7ec0b29ccafebe26c102
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2h
        git checkout 720d42a1729f3c70b0ea7ec0b29ccafebe26c102
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151751.0egsl4WG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user333'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
