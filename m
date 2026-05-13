Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45EA2D94BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 05:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649170; cv=none; b=kz5VQGRHcOD9br5QNAD40mRH4MwhVLWEBFX/PXMctRN0BCbAjImy87gSYZQ59SJdUDOFnjnXAlCGuhK+UfddVo6BrbUEWrrgmVxEHdGGPthOaxqXdP+mQGI/EgiRqY2BkTQ35cdzidEJu7cNBXrn4BM/OWiAI0q4fjyfPyZLFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649170; c=relaxed/simple;
	bh=8zzjCCYUhDEsJ2EH+oXo6v0WIXE+NZx+8W4MJ2N4oVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN1BoNCmMu5ZwfWCXQQBP/sHsP0HBBeRInWDx2RPat+z0NaVmOgZMSzugZh8HJmW2qfURSOwCbVf3FsP/Bi7ceuvwh6O4mW88SMSveTJStfkKBIAD2Jkhp6Op7PvtrQxnaWO7nmIR3cuVsZ73LxIaLR/vxFuPUYVGweWLd/W+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyV3GdTn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyV3GdTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778649169; x=1810185169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8zzjCCYUhDEsJ2EH+oXo6v0WIXE+NZx+8W4MJ2N4oVI=;
  b=XyV3GdTnfrosgBrkKagaA0LkvpeoXhSux7igshmG7wwrYE1MuZE88pr7
   fc42v/0qq5m+PO9W/4HTKbUg6wmDVf/SM9u4EhxubyM8vsV/YFcyStMU7
   olZfXCGLoo2B0Q0k/L6XU3PzEhOhNPcTH1JF4ESC8bt40fVkPQNSN49bX
   Nb00Xb/bU1hhNUzoQhI3md/MPDxPz0mCtRpTalO9pFOS8IqFV36kcaSqx
   Qtru0Tf+EBERfGyrObAYmFnlBLV3A/nVHjRx5MgOheg5BKJ09itC0RUXv
   h2yH52vNRw0jnvNpbhKO/r3jHeq1FuI4i/dN+XcN7UGiF/Y452oVHk7Bs
   g==;
X-CSE-ConnectionGUID: tyMqHctrSgSx/43nfPKj3g==
X-CSE-MsgGUID: nnBcaQ89RY+ErNkwvv4+7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90951221"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90951221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:12:48 -0700
X-CSE-ConnectionGUID: 6e2oLoWRRTmM8k0sMmcAwQ==
X-CSE-MsgGUID: E8d32tGnReGKJIA3bwBioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238222434"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 May 2026 22:12:45 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN1ti-000000003TX-2cq8;
	Wed, 13 May 2026 05:12:42 +0000
Date: Wed, 13 May 2026 13:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Jun Hirata <andrejhirata@usp.br>, kenneth.feng@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, gabriel.dimant@usp.br,
	guilhermesangabriel@usp.br, Andre Jun Hirata <andrejhirata@usp.br>
Subject: Re: [PATCH v4] drm/amd/pm: Use guard(mutex) instead of manual
 lock+unlock
Message-ID: <202605131349.EV901kW3-lkp@intel.com>
References: <20260508172345.6680-1-andrejhirata@usp.br>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508172345.6680-1-andrejhirata@usp.br>

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Jun-Hirata/drm-amd-pm-Use-guard-mutex-instead-of-manual-lock-unlock/20260513-062000
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260508172345.6680-1-andrejhirata%40usp.br
patch subject: [PATCH v4] drm/amd/pm: Use guard(mutex) instead of manual lock+unlock
config: x86_64-randconfig-072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131349.EV901kW3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131349.EV901kW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131349.EV901kW3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_is_mode1_reset_supported':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:247:47: error: expected ';' before '}' token
     247 |         return smu_mode1_reset_is_support(smu)
         |                                               ^
         |                                               ;
     248 | }
         | ~                                              
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_smu_i2c_bus_access':
>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:405:16: error: expected expression before '=' token
     405 |         return = pp_funcs->smu_i2c_bus_access(pp_handle,
         |                ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_get_vce_clock_state':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:833:31: warning: unused variable 'vstate' [-Wunused-variable]
     833 |         struct amd_vce_state *vstate = NULL;
         |                               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_get_pp_table':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:1016:16: error: expected expression before '=' token
    1016 |         return = pp_funcs->get_pp_table(adev->powerplay.pp_handle,
         |                ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_set_fine_grain_clk_vol':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:1031:16: error: expected expression before '=' token
    1031 |         return = pp_funcs->set_fine_grain_clk_vol(adev->powerplay.pp_handle,
         |                ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_get_display_mode_validation_clks':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:1498:16: error: expected expression before '=' token
    1498 |         return = pp_funcs->get_display_mode_validation_clocks(adev->powerplay.pp_handle,
         |                ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_smu_i2c_bus_access':
>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:407:1: warning: control reaches end of non-void function [-Wreturn-type]
     407 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_get_pp_table':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:1018:1: warning: control reaches end of non-void function [-Wreturn-type]
    1018 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_set_fine_grain_clk_vol':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:1035:1: warning: control reaches end of non-void function [-Wreturn-type]
    1035 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_get_display_mode_validation_clks':
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:1500:1: warning: control reaches end of non-void function [-Wreturn-type]
    1500 | }
         | ^


vim +405 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c

   393	
   394	int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_device *adev,
   395					  bool acquire)
   396	{
   397		void *pp_handle = adev->powerplay.pp_handle;
   398		const struct amd_pm_funcs *pp_funcs =
   399				adev->powerplay.pp_funcs;
   400	
   401		if (!pp_funcs || !pp_funcs->smu_i2c_bus_access)
   402			return -EOPNOTSUPP;
   403	
   404		guard(mutex)(&adev->pm.mutex);
 > 405		return = pp_funcs->smu_i2c_bus_access(pp_handle,
   406							   acquire);
 > 407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
