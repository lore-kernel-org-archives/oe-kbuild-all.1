Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AB7E9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 05:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741237718; cv=none; b=O9SFgIHgHju6YDcuOB4UygfUfJXKoFG1R5ygu4sAYMSb7co01+3TEt9Jz0Wf9trMNaZojePk74H/12svExEKlOUcOkcdSW4ip9XCuQ3DgT59IJVdJbtLBaWn3m+zxdYz6aK+NZdMtyerkDDSiPJA3ZUhLPUdjK/rCyKsG57t+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741237718; c=relaxed/simple;
	bh=oKV0DGBxIdjV2SNFMerxfwwS05Ek++8l4mSs5K7UycM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCo25lK29bEJW3VdyAVGsQ6In0YUFBdSCaf+Dhc+61UTdl2ooTZmfr09rh9f0OhEor4d7/yDRHSZogQ6BY7Kxq7tk4q/XrLuwdKVN0ERMCfDYgZLfMvGCirJer1ThBY0kMKVdIwMMkfJn3HgTakJ4dhOtWEgCwgesMpXgjBNEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIrkykp+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIrkykp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741237716; x=1772773716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKV0DGBxIdjV2SNFMerxfwwS05Ek++8l4mSs5K7UycM=;
  b=mIrkykp+wbi3Jr4TAXKvH+prRoDAT4lomzYblmFRhrsBzr3lLdO09TWE
   vfDFPsaElHHdWoQkB3IizIsOxi0C+/DOhM8FARQ6Al+TU2JazwErzsUf5
   X5exkqtCj6nohPOoDBY15GNe3FPvl/dZkm9hZE2u5amcHu8jCoqxATFC2
   WAeJ+xswFvReAZimmT6lDHB2mWsiAwIDW6RWh1ttqBlkcmOZFEIcLgzxK
   Kpx/r9WSxDE6jRU10WVDudQRW40pAbBiD4fPbpS261jdS5zj2HNoo0O34
   J3FCv3RDAKYKhQZHL9TE1BUoKwETq8Wy5LZEU/zjKynqwxjB05fUQ370u
   A==;
X-CSE-ConnectionGUID: ki2cxGLxQ8uegUZojid6FQ==
X-CSE-MsgGUID: zwM9wu4SRmScXeEdOLKkOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53216187"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="53216187"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 21:08:36 -0800
X-CSE-ConnectionGUID: R9hdC0AXTn2OKrpK9Y9ZRQ==
X-CSE-MsgGUID: mvKzHZD/R1ykYnBUx+XBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119822473"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 21:08:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq3TD-000MYu-1i;
	Thu, 06 Mar 2025 05:08:31 +0000
Date: Thu, 6 Mar 2025 13:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [drm-msm:msm-next 6/37]
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1356: warning: Function parameter
 or struct member 'old_crtc_state' not described in
 'dpu_crtc_check_mode_changed'
Message-ID: <202503061218.8tHPTTgG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   6d3175a72cc07e90f81fb35841048a8a9b5134cb
commit: 20972609d12ca677b8ecf576c632bfc3cfa369b5 [6/37] drm/msm/dpu: Require modeset if clone mode status changes
config: arm64-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061218.8tHPTTgG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061218.8tHPTTgG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061218.8tHPTTgG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1356: warning: Function parameter or struct member 'old_crtc_state' not described in 'dpu_crtc_check_mode_changed'
>> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1356: warning: Function parameter or struct member 'new_crtc_state' not described in 'dpu_crtc_check_mode_changed'
>> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1356: warning: Excess function parameter 'crtc_state' description in 'dpu_crtc_check_mode_changed'


vim +1356 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c

17666e764f3892 Dmitry Baryshkov 2025-02-14  1347  
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1348  /**
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1349   * dpu_crtc_check_mode_changed: check if full modeset is required
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1350   * @crtc_state:	Corresponding CRTC state to be checked
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1351   *
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1352   * Check if the changes in the object properties demand full mode set.
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1353   */
20972609d12ca6 Jessica Zhang    2025-02-14  1354  int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
20972609d12ca6 Jessica Zhang    2025-02-14  1355  				struct drm_crtc_state *new_crtc_state)
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14 @1356  {
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1357  	struct drm_encoder *drm_enc;
20972609d12ca6 Jessica Zhang    2025-02-14  1358  	struct drm_crtc *crtc = new_crtc_state->crtc;
20972609d12ca6 Jessica Zhang    2025-02-14  1359  	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
20972609d12ca6 Jessica Zhang    2025-02-14  1360  	bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1361  
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1362  	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1363  
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1364  	/* there might be cases where encoder needs a modeset too */
20972609d12ca6 Jessica Zhang    2025-02-14  1365  	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
20972609d12ca6 Jessica Zhang    2025-02-14  1366  		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
20972609d12ca6 Jessica Zhang    2025-02-14  1367  			new_crtc_state->mode_changed = true;
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1368  	}
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1369  
20972609d12ca6 Jessica Zhang    2025-02-14  1370  	if ((clone_mode_requested && !clone_mode_enabled) ||
20972609d12ca6 Jessica Zhang    2025-02-14  1371  	    (!clone_mode_requested && clone_mode_enabled))
20972609d12ca6 Jessica Zhang    2025-02-14  1372  		new_crtc_state->mode_changed = true;
20972609d12ca6 Jessica Zhang    2025-02-14  1373  
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1374  	return 0;
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1375  }
1ce69c265a53c6 Dmitry Baryshkov 2025-02-14  1376  

:::::: The code at line 1356 was first introduced by commit
:::::: 1ce69c265a53c61c5c29f97f542ff89af3f3d7e7 drm/msm/dpu: move resource allocation to CRTC

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
