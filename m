Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499242F5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705748981; cv=none; b=gNC4OUu18AlBFMpP+UZUrY8zn7FcxWgypR2pl3ZBSuiCMm8LRTuZtlhW4A9OlnSPgBJw9ZcDXSP0aiwvLVvjpg4JTcwhrhYN/GyAAfW+6Xii9+rZSC3FkaqfhPskZLOnZXOzlISRmSNSFd4AMztl8pi2+vPAYr6lJcr8Atjoe8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705748981; c=relaxed/simple;
	bh=yHYLMADz+h/Rw8SSyzFngNh2po4Y706hti7B6rWRD1Q=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hC2KNtwN5WV33s7ntND9dw327QcwKNxVbUxVevJxdQ26LH3ie9/qx3a8dciodfzQ1Yoc1f3a5yQa60wsPa+w2NHbFsZGwefs1ZhR6xSC/ugCTFqhw3wc3yOUQONlJ16fqT9J6wIFFBhMuHaC1Z/b7ECqIQ0Etlh/pGmHWfQ5mzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZM8ItoRe; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZM8ItoRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705748979; x=1737284979;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yHYLMADz+h/Rw8SSyzFngNh2po4Y706hti7B6rWRD1Q=;
  b=ZM8ItoRetz5o2qdwCcbS3FXcWn55LtwNMGiTISGhYGF2vyr960HnY/j3
   qMfD2JI2DOmlFxa0XcC1T4mEC/4xoJQk2JCb3BZlTVaDTKk6QvWUFDZUR
   qW968nVZmzKUzjLrYWXHezDhfL4Qud4E3tmJHWEIV6dOyMKdlpJrNW8K4
   hQQwrRTb+NWgA7LKjSpZzu3vrjWIRHPr6TeqpdXlc1UWEu6INEm0zpBO5
   Dn4i7lXQcDDfvaJB156bcprVx1HY+7yzZQCMF9MzDaNXOhYi743ZXCjEE
   pEYJj7jyW4yH2n0E2axylFLGA1LYmYLmrL0TYf2aFwXY8ej6Qju4Ke7A9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="399812132"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="399812132"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 03:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="785261264"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="785261264"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2024 03:09:37 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR9EE-00052E-2m
	for oe-kbuild-all@lists.linux.dev;
	Sat, 20 Jan 2024 11:09:34 +0000
Date: Sat, 20 Jan 2024 19:09:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2126/6555]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:369:10: warning:
 no previous prototype for 'get_reference_clock'
Message-ID: <202401201944.AmBErBR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 857db2fb172e6cc509b973640abd87ca4296bd00 [2126/6555] UPSTREAM: drm/amd/display: Create new i2c resource
config: i386-randconfig-011-20240117 (https://download.01.org/0day-ci/archive/20240120/202401201944.AmBErBR8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201944.AmBErBR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201944.AmBErBR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:89:6: warning: no previous prototype for 'dce_i2c_hw_engine_acquire_engine' [-Wmissing-prototypes]
      89 | bool dce_i2c_hw_engine_acquire_engine(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:113:6: warning: no previous prototype for 'dce_i2c_engine_acquire_hw' [-Wmissing-prototypes]
     113 | bool dce_i2c_engine_acquire_hw(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:301:35: warning: no previous prototype for 'dce_i2c_hw_engine_wait_on_operation_result' [-Wmissing-prototypes]
     301 | enum i2c_channel_operation_result dce_i2c_hw_engine_wait_on_operation_result(
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:369:10: warning: no previous prototype for 'get_reference_clock' [-Wmissing-prototypes]
     369 | uint32_t get_reference_clock(
         |          ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:677:6: warning: no previous prototype for 'dce_i2c_hw_engine_submit_request' [-Wmissing-prototypes]
     677 | bool dce_i2c_hw_engine_submit_request(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:118:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     118 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:116:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     116 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~


vim +/get_reference_clock +369 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_i2c_hw.c

   350	
   351	static void submit_channel_request_hw(
   352		struct dce_i2c_hw *dce_i2c_hw,
   353		struct i2c_request_transaction_data *request)
   354	{
   355		request->status = I2C_CHANNEL_OPERATION_SUCCEEDED;
   356	
   357		if (!dce_i2c_hw->funcs->process_transaction(dce_i2c_hw, request))
   358			return;
   359	
   360		if (dce_i2c_hw->funcs->is_hw_busy(dce_i2c_hw)) {
   361			request->status = I2C_CHANNEL_OPERATION_ENGINE_BUSY;
   362			return;
   363		}
   364	
   365		dce_i2c_hw->funcs->execute_transaction(dce_i2c_hw);
   366	
   367	
   368	}
 > 369	uint32_t get_reference_clock(
   370			struct dc_bios *bios)
   371	{
   372		struct dc_firmware_info info = { { 0 } };
   373	
   374		if (bios->funcs->get_firmware_info(bios, &info) != BP_RESULT_OK)
   375			return 0;
   376	
   377		return info.pll_info.crystal_frequency;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
