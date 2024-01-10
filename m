Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794738D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 01:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtYJHiiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704848482; x=1736384482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4a1I2wAv5+gsFqZcHhuQ/2uuDI1rV+u6M5KWYUxf3Uk=;
  b=WtYJHiiI3RO/bfQNNpoT3HbGKi5Xu6INLjRJDyvHbIpAHCF8SJ7ufzeZ
   IMj4lngkl/Uj8cawsGNK7ZRQsCk/CzXVXAc5g/mK9mV5Ih0HhEcXVdMn5
   TI1OQbgukHFGsTivt1AWOg7alQNlj7WFuOmbmmKnHsuP+WBoBa9yq+yhS
   dclW2Zur5iwQ5OStNsufnvM9Pjm/MJE7xnGA619wLzNG1p622VF7r5xM1
   WQtJ3p1NYVNvpg/RIubWrYugT+1vLhBUOPreP2t5PveKbkm1V1PVsCrIE
   aW7w/BqMCrWwQ1PgNaZoOSdoIVBQgTACr1u6QWaUcPlszV1SdP9Ya+2U5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5454882"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5454882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 17:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="23757070"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Jan 2024 17:01:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNMy5-0006Ru-1t;
	Wed, 10 Jan 2024 01:01:17 +0000
Date: Wed, 10 Jan 2024 09:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:jh7110 37/43] drivers/gpu/drm/verisilicon/vs_dc.c:1118:34:
 warning: unused variable 'dc_driver_dt_match'
Message-ID: <202401100847.RwIti41K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux jh7110
head:   114876b6e5bffb0e2c0ff237372ef3abd286b914
commit: 9ddfc9198b7e184dd591733fba350e99b3138276 [37/43] drm/vs: Add KMS crtc&plane
config: x86_64-randconfig-103-20240110 (https://download.01.org/0day-ci/archive/20240110/202401100847.RwIti41K-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100847.RwIti41K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100847.RwIti41K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_dc.c:970:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     970 |         u32 i, ret;
         |                ^
   drivers/gpu/drm/verisilicon/vs_dc.c:78:18: warning: unused variable 'primary_overlay_format1' [-Wunused-const-variable]
      78 | static const u32 primary_overlay_format1[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/verisilicon/vs_dc.c:1118:34: warning: unused variable 'dc_driver_dt_match' [-Wunused-const-variable]
    1118 | static const struct of_device_id dc_driver_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/dc_driver_dt_match +1118 drivers/gpu/drm/verisilicon/vs_dc.c

  1117	
> 1118	static const struct of_device_id dc_driver_dt_match[] = {
  1119		{
  1120			.compatible = "starfive,jh7110-dc8200",
  1121			.data = &dc8200_info,
  1122		},
  1123		{},
  1124	};
  1125	MODULE_DEVICE_TABLE(of, dc_driver_dt_match);
  1126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
