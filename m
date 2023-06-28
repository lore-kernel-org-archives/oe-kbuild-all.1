Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943EB5385
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 05:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687930851; x=1719466851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZIho9gkUhwWCS222aDHFDtWtBY8vNaLE3uV2lNd0/4=;
  b=LHaswVwK0YQN14TDbB5XArJ9U5c/VuZ/GltnMNDZyncgvIzTDEOWC9ST
   8Xeli7YZf8BplNKxNhrDmkZs3VZBYz0u9H0NBXxD1LQHBWZ3kzoywg3NS
   T62hXngRDSz0HiZCF2G5DOvAtRHshJW4ee17Mij5Q3kO/Il0vwJ/1AVbv
   h13sdhbXlOV/Lp5N1vlgs8IYdLa0D0nVBFxwmSq0fqd/01MDklgZnP5Wl
   dKXZxosxziTxsc6YoaAeaxoRTAi70mWHJY0TUaynzvapUStasGNplRlK7
   E0bHLvhQ/kBKuBb/AXYhUvm+AN0zrtiAhSegm9HDB1QqpJlP/1Beoy+Ol
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="346518431"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="346518431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 22:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="716807181"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="716807181"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jun 2023 22:40:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qENv7-000CrR-0E;
	Wed, 28 Jun 2023 05:40:49 +0000
Date: Wed, 28 Jun 2023 13:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 17/30] aarch64-linux-ld:
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user477';
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306281349.6OAxlKlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   e7afba1683e5b4e8c906a446dffacf4b972b93e7
commit: 7b1496bec9acf140d3cf3d9065f20f872fb90a90 [17/30] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230628/202306281349.6OAxlKlW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281349.6OAxlKlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281349.6OAxlKlW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/gpu/drm/vmwgfx/vmwgfx_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user477'; drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
