Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32896156F39
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275160; cv=none; b=QBikrc2N6lLtraupQMQzas/L3Qyb7r2dHBFanqxT54Y8yu5eOSjAa//w/3MReG2zuFyicXhrv92d2u+uDyX0ar6/QI4k3LAFgK73P0TXgeTR1oDo2izXPHSKeHHzSH78O0ZepfbDwIaaBUd6qkAKZCzUtVlKo5eHggOIQO1096s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275160; c=relaxed/simple;
	bh=cmBV+knUhLq1STnrEDK4j3cobraQeY9TSGPIILCMdoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q4aUMtgYNU8wia8YFIFbXAdhZcxEqz8UUVqaWa9/w0w9qwzQasDna0p+1HNze806f7wfX2cBgZDXphSHZrTswqRtUmoY/+TZajvNufMw55TNAIqelsb1KM8TgLeBZzwGQfW/6ru8eRKvh9zFvCJ8wOO/bZLt+7uZkEPuvRbbzww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gzgb55iC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gzgb55iC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741275158; x=1772811158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmBV+knUhLq1STnrEDK4j3cobraQeY9TSGPIILCMdoc=;
  b=Gzgb55iCVtLR9EnVL1ILbKE10oHaO9Wzvnpmiy9jmOXnfmOgilv0L3oO
   HkXIKL9P5RC3F6JSZ0BOeI31lPihvubW0RPWjP8etoe9EfHcKWx4XtQqK
   XJHj9owQ55H4WnCoqYU8+b/PJC91g/LkHVoMymeLO8xc4Sup2wcY75f1q
   efihH4+GZHPRTmTMDfgFuuRi2libMsafujh+nn21uxFvi3YznuyOk8Vz9
   Vtoc6a/V7Znu5E6d+t+yg4jIGH4cmpEZsM9apAbJo/FII2Vu72qOOnN/W
   JWCr5wzrSLC3h9yFVCndaxWY0Haw+zosdNbOJ3sExevL4+LMibVGjveOA
   w==;
X-CSE-ConnectionGUID: vlwoE4xDS7GWmcWaao4VAA==
X-CSE-MsgGUID: 4GqJf+QsQ4OpX9TfoNT3mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41466656"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="41466656"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 07:31:46 -0800
X-CSE-ConnectionGUID: dwQNAH2+R5iqbRcpVdU0nw==
X-CSE-MsgGUID: 92NEw5K3RN6GzB5qirnX8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149986631"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Mar 2025 07:31:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqDCJ-000NDc-1F;
	Thu, 06 Mar 2025 15:31:43 +0000
Date: Thu, 6 Mar 2025 23:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Demers <alexandre.f.demers@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 8827/9212]
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:1025: warning: Function parameter or
 struct member 'other_mode' not described in 'dce_v6_0_line_buffer_adjust'
Message-ID: <202503062347.iU0DlTbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: 029ab8cabd941fe0d8076ddf1e74ebfc7d3ae86c [8827/9212] drm/amdgpu: add some comments in DCE6
config: x86_64-buildonly-randconfig-006-20250306 (https://download.01.org/0day-ci/archive/20250306/202503062347.iU0DlTbl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062347.iU0DlTbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503062347.iU0DlTbl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:1025: warning: Function parameter or struct member 'other_mode' not described in 'dce_v6_0_line_buffer_adjust'


vim +1025 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c

e2cdf640cbb5b7 Ken Wang         2016-01-19  1007  
e2cdf640cbb5b7 Ken Wang         2016-01-19  1008  /* watermark setup */
029ab8cabd941f Alexandre Demers 2025-02-28  1009  /**
029ab8cabd941f Alexandre Demers 2025-02-28  1010   * dce_v6_0_line_buffer_adjust - Set up the line buffer
029ab8cabd941f Alexandre Demers 2025-02-28  1011   *
029ab8cabd941f Alexandre Demers 2025-02-28  1012   * @adev: amdgpu_device pointer
029ab8cabd941f Alexandre Demers 2025-02-28  1013   * @amdgpu_crtc: the selected display controller
029ab8cabd941f Alexandre Demers 2025-02-28  1014   * @mode: the current display mode on the selected display
029ab8cabd941f Alexandre Demers 2025-02-28  1015   * controller
029ab8cabd941f Alexandre Demers 2025-02-28  1016   *
029ab8cabd941f Alexandre Demers 2025-02-28  1017   * Setup up the line buffer allocation for
029ab8cabd941f Alexandre Demers 2025-02-28  1018   * the selected display controller (CIK).
029ab8cabd941f Alexandre Demers 2025-02-28  1019   * Returns the line buffer size in pixels.
029ab8cabd941f Alexandre Demers 2025-02-28  1020   */
e2cdf640cbb5b7 Ken Wang         2016-01-19  1021  static u32 dce_v6_0_line_buffer_adjust(struct amdgpu_device *adev,
e2cdf640cbb5b7 Ken Wang         2016-01-19  1022  				   struct amdgpu_crtc *amdgpu_crtc,
e2cdf640cbb5b7 Ken Wang         2016-01-19  1023  				   struct drm_display_mode *mode,
e2cdf640cbb5b7 Ken Wang         2016-01-19  1024  				   struct drm_display_mode *other_mode)
e2cdf640cbb5b7 Ken Wang         2016-01-19 @1025  {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1026  	u32 tmp, buffer_alloc, i;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1027  	u32 pipe_offset = amdgpu_crtc->crtc_id * 0x8;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1028  	/*
e2cdf640cbb5b7 Ken Wang         2016-01-19  1029  	 * Line Buffer Setup
e2cdf640cbb5b7 Ken Wang         2016-01-19  1030  	 * There are 3 line buffers, each one shared by 2 display controllers.
b00861b98b4eed Tom St Denis     2016-11-14  1031  	 * mmDC_LB_MEMORY_SPLIT controls how that line buffer is shared between
e2cdf640cbb5b7 Ken Wang         2016-01-19  1032  	 * the display controllers.  The paritioning is done via one of four
e2cdf640cbb5b7 Ken Wang         2016-01-19  1033  	 * preset allocations specified in bits 21:20:
e2cdf640cbb5b7 Ken Wang         2016-01-19  1034  	 *  0 - half lb
e2cdf640cbb5b7 Ken Wang         2016-01-19  1035  	 *  2 - whole lb, other crtc must be disabled
e2cdf640cbb5b7 Ken Wang         2016-01-19  1036  	 */
e2cdf640cbb5b7 Ken Wang         2016-01-19  1037  	/* this can get tricky if we have two large displays on a paired group
e2cdf640cbb5b7 Ken Wang         2016-01-19  1038  	 * of crtcs.  Ideally for multiple large displays we'd assign them to
e2cdf640cbb5b7 Ken Wang         2016-01-19  1039  	 * non-linked crtcs for maximum line buffer allocation.
e2cdf640cbb5b7 Ken Wang         2016-01-19  1040  	 */
e2cdf640cbb5b7 Ken Wang         2016-01-19  1041  	if (amdgpu_crtc->base.enabled && mode) {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1042  		if (other_mode) {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1043  			tmp = 0; /* 1/2 */
e2cdf640cbb5b7 Ken Wang         2016-01-19  1044  			buffer_alloc = 1;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1045  		} else {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1046  			tmp = 2; /* whole */
e2cdf640cbb5b7 Ken Wang         2016-01-19  1047  			buffer_alloc = 2;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1048  		}
e2cdf640cbb5b7 Ken Wang         2016-01-19  1049  	} else {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1050  		tmp = 0;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1051  		buffer_alloc = 0;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1052  	}
e2cdf640cbb5b7 Ken Wang         2016-01-19  1053  
b00861b98b4eed Tom St Denis     2016-11-14  1054  	WREG32(mmDC_LB_MEMORY_SPLIT + amdgpu_crtc->crtc_offset,
e2cdf640cbb5b7 Ken Wang         2016-01-19  1055  	       DC_LB_MEMORY_CONFIG(tmp));
e2cdf640cbb5b7 Ken Wang         2016-01-19  1056  
b00861b98b4eed Tom St Denis     2016-11-14  1057  	WREG32(mmPIPE0_DMIF_BUFFER_CONTROL + pipe_offset,
b00861b98b4eed Tom St Denis     2016-11-14  1058  	       (buffer_alloc << PIPE0_DMIF_BUFFER_CONTROL__DMIF_BUFFERS_ALLOCATED__SHIFT));
e2cdf640cbb5b7 Ken Wang         2016-01-19  1059  	for (i = 0; i < adev->usec_timeout; i++) {
b00861b98b4eed Tom St Denis     2016-11-14  1060  		if (RREG32(mmPIPE0_DMIF_BUFFER_CONTROL + pipe_offset) &
b00861b98b4eed Tom St Denis     2016-11-14  1061  		    PIPE0_DMIF_BUFFER_CONTROL__DMIF_BUFFERS_ALLOCATION_COMPLETED_MASK)
e2cdf640cbb5b7 Ken Wang         2016-01-19  1062  			break;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1063  		udelay(1);
e2cdf640cbb5b7 Ken Wang         2016-01-19  1064  	}
e2cdf640cbb5b7 Ken Wang         2016-01-19  1065  
e2cdf640cbb5b7 Ken Wang         2016-01-19  1066  	if (amdgpu_crtc->base.enabled && mode) {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1067  		switch (tmp) {
e2cdf640cbb5b7 Ken Wang         2016-01-19  1068  		case 0:
e2cdf640cbb5b7 Ken Wang         2016-01-19  1069  		default:
e2cdf640cbb5b7 Ken Wang         2016-01-19  1070  			return 4096 * 2;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1071  		case 2:
e2cdf640cbb5b7 Ken Wang         2016-01-19  1072  			return 8192 * 2;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1073  		}
e2cdf640cbb5b7 Ken Wang         2016-01-19  1074  	}
e2cdf640cbb5b7 Ken Wang         2016-01-19  1075  
e2cdf640cbb5b7 Ken Wang         2016-01-19  1076  	/* controller not enabled, so no lb used */
e2cdf640cbb5b7 Ken Wang         2016-01-19  1077  	return 0;
e2cdf640cbb5b7 Ken Wang         2016-01-19  1078  }
e2cdf640cbb5b7 Ken Wang         2016-01-19  1079  

:::::: The code at line 1025 was first introduced by commit
:::::: e2cdf640cbb5b7d6643e1c8ad54bf3bfc99d4d48 drm/amdgpu: add display controller implementation for si v10

:::::: TO: Ken Wang <Qingqing.Wang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
