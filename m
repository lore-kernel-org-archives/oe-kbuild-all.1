Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F5187D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687920818; x=1719456818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvzXwsXhAJOb+2i3ZiX88NHtZO521P04ZpUO3lR+5UQ=;
  b=DmSJ6O5pN3fe4Fkcp3xQi3+HcJ//krQLNpymJYoBcawU5ELa6j6QcYRO
   AD3ePx4HC33SvU+RYP2g3yhBTu+4GSV3TU2sv7BR92+60Nqfyd2iocCje
   mimLosoOv52avUVwR8zPPIKO7Lw+jGC7JPTN04TZCSuNtDuGhW0GF2tUN
   Kwg2b69OpTcfzOXG7i6u3SRb83PFri/na5bEJSbYB/xmYXSrdC8b3mS2x
   7P08vrg1hls9c10N3FtHPDN1cxE0NI9/4ENoriDnouvx33NSSHGzZIO9z
   C9TLnjqQTZ5A9CX2YRexRXl7fdftIR50360bBZDZBYlWkYACSkRWGDXYq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425405487"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="425405487"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 19:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="720060439"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="720060439"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2023 19:53:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qELJH-000CaH-1f;
	Wed, 28 Jun 2023 02:53:35 +0000
Date: Wed, 28 Jun 2023 10:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 17/30] hppa-linux-ld:
 drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple
 definition of `__UNIQUE_ID_ddebug_class_user321';
 drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first
 defined here
Message-ID: <202306281058.UYWMhHPF-lkp@intel.com>
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
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230628/202306281058.UYWMhHPF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281058.UYWMhHPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281058.UYWMhHPF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: drivers/gpu/drm/mgag200/mgag200_drv.o:(__dyndbg_class_users+0x0): multiple definition of `__UNIQUE_ID_ddebug_class_user321'; drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
