Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEEA5246
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687424977; x=1718960977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IRryWsAaDzKhcOKj/cemQzJczIb1jkz+mdircuHv58=;
  b=SB6EvMCNuCMjup9tSWcSu70j2K6LpJqbmmwERYd068cAl6Gs1ue7R4DU
   /ZPVUChUa9z85AX6ZNWzuj5I+ABVsGZU+hWPPOTHg2vIC9JZplc5a6ZzZ
   IRnSgWnviJv2s2qkAykFIku8EXar7nrv9+5TuzDMiSlLORregp0DGTWQR
   FuGFIjUbmWC37RlySLQixpIRVSMXaKHf79XZK3Lg0YoADjf+NxZ58Y1mj
   zkIOdZdcFwQ6N1hrul3yAWGPdQn2q6/SxHil3wdz1OEynLNtvGPOmabFb
   pH01edTMq2weCo1klFfNxxEMdCpU32FrypUsExqWIzrlzJUtvYZFCXhya
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350171289"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="350171289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 02:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784827303"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="784827303"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2023 02:09:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCGJq-0007TT-1b;
	Thu, 22 Jun 2023 09:09:34 +0000
Date: Thu, 22 Jun 2023 17:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2h 18/18] aarch64-linux-ld:
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user477';
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306221746.GLRmyojF-lkp@intel.com>
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
commit: 37bd9f06a22f0eda3386512e782dbe86d97c5454 [18/18] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306221746.GLRmyojF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221746.GLRmyojF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221746.GLRmyojF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/gpu/drm/vmwgfx/vmwgfx_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user477'; drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
