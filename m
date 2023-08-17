Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93514AA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692281108; x=1723817108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxXBRHNoc6Kqu2MfUYo9xE62KhkEIJWBO7DpV1W5erI=;
  b=PS/TahX2XVw2kphsMiV/yNWZ4Rrmxy7Ei8pdQvkSGR8KZXjVmz6jtBoX
   AzD8QjR52tzeumVARcNTHNcK6YAoEtBLP2fruhLiS61wL3lP3tWUpwyxE
   pVo/ikuGuwer3BldlwJMQxruweGQalsIh5Cn5RDLGwjENm5GTwmDxK0bo
   p/tNhEqnWjwm3vahGtoplP8F1A/647K8d0m7f7yevsoDMynvZYeE1hNR0
   xBbezsJfQRmiqYmsJajCBGx73N9pmpREkXlndjnmcTgza0PvNw/i5nAmq
   OzbAF6tgWVE5VTNpd2ubW0ODrnGdAlchwH/vwnXEMG2ZOP1MDzUMUplpU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439186147"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439186147"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 06:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824633316"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="824633316"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 06:29:14 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWd3Z-0001AJ-1b;
	Thu, 17 Aug 2023 13:29:05 +0000
Date: Thu, 17 Aug 2023 21:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:141:
 warning: Function parameter or member 'optc' not described in
 'optc1_set_vupdate_keepout'
Message-ID: <202308172126.tZNGcj8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 0620b515699d639dad2634479251bd6203080bea UPSTREAM: drm/amd/display: Move vupdate keepout programming from DCN20 to DCN10
date:   2 years, 3 months ago
config: x86_64-randconfig-x015-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172126.tZNGcj8o-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172126.tZNGcj8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172126.tZNGcj8o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:50: warning: Function parameter or member 'timing' not described in 'apply_front_porch_workaround'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:141: warning: Function parameter or member 'optc' not described in 'optc1_set_vupdate_keepout'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:141: warning: Function parameter or member 'params' not described in 'optc1_set_vupdate_keepout'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'optc' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'dc_crtc_timing' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'vready_offset' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'vstartup_start' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'vupdate_offset' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'vupdate_width' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'signal' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:164: warning: Function parameter or member 'use_vbios' not described in 'optc1_program_timing'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:394: warning: Function parameter or member 'optc' not described in 'optc1_set_timing_double_buffer'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:394: warning: Function parameter or member 'enable' not described in 'optc1_set_timing_double_buffer'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:407: warning: Function parameter or member 'optc' not described in 'optc1_unblank_crtc'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:430: warning: Function parameter or member 'optc' not described in 'optc1_blank_crtc'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:498: warning: Function parameter or member 'optc' not described in 'optc1_enable_crtc'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c:910: warning: Cannot understand  *****************************************************************************
    on line 910 - I thought it was a doc line


vim +141 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_optc.c

   133	
   134	/**
   135	 * Vupdate keepout can be set to a window to block the update lock for that pipe from changing.
   136	 * Start offset begins with vstartup and goes for x number of clocks,
   137	 * end offset starts from end of vupdate to x number of clocks.
   138	 */
   139	void optc1_set_vupdate_keepout(struct timing_generator *optc,
   140				       struct vupdate_keepout_params *params)
 > 141	{
   142		struct optc *optc1 = DCN10TG_FROM_TG(optc);
   143	
   144		REG_SET_3(OTG_VUPDATE_KEEPOUT, 0,
   145			  MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_START_OFFSET, params->start_offset,
   146			  MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_END_OFFSET, params->end_offset,
   147			  OTG_MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_EN, params->enable);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
