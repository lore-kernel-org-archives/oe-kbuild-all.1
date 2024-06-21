Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF6AD54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 00:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718930169; cv=none; b=huwNCBwlLAwjJTQ0O09sz/fY6E1wH1v9eojrK/1yGBkXxcZ/J4d9BOV/OByegUU2DmPLNvQenkMuWYv6fqYZHQdgj9fDVAzN+JEsSjyX/Xxc3xa+1WSOlo6D2k8DgVF/YKoEJkOfmFa6Eixb1ExATVk6G45hHldUPLO2QO9Rr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718930169; c=relaxed/simple;
	bh=5h3MyXGq1/DqM2gkvyj4e7mpJb7Ncs9Pd3NTz8+XsvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dkBaqrhsUWEsviOBGjJSFlstpt6Vhx05qjzujxfZ6A9FSwdLF9YaaIYGutWngp/NR1IvNeUQPoP5SEDWBrvIaApxDwNy71Ykm1pUfNLv98L/9P/DZ+dDbhSM/P695iEvXq03Z4WHwZNC5TJqOABuY74qvaYeAiIxZC3GsjTeF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKddt1de; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKddt1de"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718930168; x=1750466168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5h3MyXGq1/DqM2gkvyj4e7mpJb7Ncs9Pd3NTz8+XsvM=;
  b=mKddt1deIvl/g7Jnt8dmtH3UsgYxa1KE0fe3+24T2NfLJwtUU6PHi9hj
   NZKADjR3H4xCbgaqyTShYpcpB5Tz/V6mMH3qWmVNZaQ8ddLnLjF2qg6NG
   BjthrF/HZr0M9oF7TBXeaitUmlV2RScK+7QbFYAwCzYDSmhcEo0MjRLQM
   RIp321Yd1WXtIHN0199diYDxx986apysiGfDkTCtrMFZnnbI2x5kV2Bm3
   FR6ZzbvoKO2qMasmhIsz/VIv+jToutiNkTilT9Qu9H+KyVHj3alvf8vMx
   +9RXRcTvKqj6L1L97sBCrHhXsUam9E/kGdQ0s/dPo87G65YUnuxQY1uSN
   g==;
X-CSE-ConnectionGUID: jXvl2/WDQ7yYFMUBzwDytg==
X-CSE-MsgGUID: 4K5xTsS9SwCLrpcG+7R9hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15924905"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="15924905"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 17:36:07 -0700
X-CSE-ConnectionGUID: apIL+TpsRTOoKknL1KD/wA==
X-CSE-MsgGUID: B9MgpzvWRl2ArMgFWfcavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42526465"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jun 2024 17:36:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKSG3-000846-2r;
	Fri, 21 Jun 2024 00:36:03 +0000
Date: Fri, 21 Jun 2024 08:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 28/40]
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:54:52: error: assignment of member
 'driver_features' in read-only object
Message-ID: <202406210812.Au5U3OkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   7efd94878682c61791c3ca7f047afa30cde60f2c
commit: 2a78ff0b0ab60ac2fb3cc6ea6b4895e2a7e7e769 [28/40] drm: Allow const struct drm_driver
config: i386-randconfig-012-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210812.Au5U3OkG-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210812.Au5U3OkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210812.Au5U3OkG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c: In function 'amdgpu_virt_init_setting':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:54:52: error: assignment of member 'driver_features' in read-only object
      54 |         adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
         |                                                    ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:558:6: warning: no previous prototype for 'amdgpu_virt_update_vf2pf_work_item' [-Wmissing-prototypes]
     558 | void amdgpu_virt_update_vf2pf_work_item(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:28:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:199:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     199 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     198 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     197 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~


vim +/driver_features +54 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c

a16f8f11c599cd pding         2017-10-24  47  
bc992ba5a3c19c Xiangliang Yu 2017-01-12  48  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
bc992ba5a3c19c Xiangliang Yu 2017-01-12  49  {
06465d8ec91a88 Xiangliang Yu 2017-01-11  50  	/* enable virtual display */
02f6efb47856cd Emily Deng    2020-03-25  51  	if (adev->mode_info.num_crtc == 0)
06465d8ec91a88 Xiangliang Yu 2017-01-11  52  		adev->mode_info.num_crtc = 1;
06465d8ec91a88 Xiangliang Yu 2017-01-11  53  	adev->enable_virtual_display = true;
4a580877bdcb83 Luben Tuikov  2020-08-24 @54  	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
213cacefcd5c78 Xiangliang Yu 2017-04-21  55  	adev->cg_flags = 0;
213cacefcd5c78 Xiangliang Yu 2017-04-21  56  	adev->pg_flags = 0;
bc992ba5a3c19c Xiangliang Yu 2017-01-12  57  }
bc992ba5a3c19c Xiangliang Yu 2017-01-12  58  

:::::: The code at line 54 was first introduced by commit
:::::: 4a580877bdcb837e7a3754ae20798dcfccb44e80 drm/amdgpu: Get DRM dev from adev by inline-f

:::::: TO: Luben Tuikov <luben.tuikov@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
