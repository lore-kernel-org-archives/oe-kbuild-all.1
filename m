Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB1219F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFzjDHS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704443717; x=1735979717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyBWh+bI3paQS1WVDisrhnSyTE4o8PNOw4gl7/TnUSk=;
  b=cFzjDHS/IRaO7GtrixN2F1h3h82xRa/E0xf2+RiB/otEinBzLbTAkpIv
   dLAsr8T8zNrlra0k9+ZSTgVF0PhhY+ExlGiISdat/ac6p6O4i9Zqpgqdr
   4RyyBIsDTwjEdUkBxTkU7h5xmSJ4WIHHBgHn33BrcQECk4fa/xxnYp2F5
   +pS3tc1aDkKi43d8NHffDJzpCvJ4vukchV4BAi4g2QoF3ddc+I4h1+QtC
   /ePPbxd0D2vA9YEzP4+QTUQ0W8qM0gbmXNlCjrZI8SlkKe4ocwwQ6evUr
   V5s/29Ck6aY4XiUSfPZWq6Xcd/lfW2bWfXLkMWPDIzlFCOF8fJ0cVR8mA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="376950604"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="376950604"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784147778"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="784147778"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2024 00:35:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLffY-00010T-2L;
	Fri, 05 Jan 2024 08:35:09 +0000
Date: Fri, 5 Jan 2024 16:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 7009/12403]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:958
 amdgpu_dm_update_plane_color_mgmt() warn: inconsistent indenting
Message-ID: <202401051643.PPdbmG1U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d0b3c8aa5e37775cd7c3ac07b256218df0fd6678
commit: ef113a3b1964b40dd87287806865b947d70f7df5 [7009/12403] drm/amd/display: reject atomic commit if setting both plane and CRTC degamma
config: x86_64-randconfig-161-20231228 (https://download.01.org/0day-ci/archive/20240105/202401051643.PPdbmG1U-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051643.PPdbmG1U-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:958 amdgpu_dm_update_plane_color_mgmt() warn: inconsistent indenting

vim +958 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c

   918	
   919	/**
   920	 * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
   921	 * @crtc: amdgpu_dm crtc state
   922	 * @plane_state: DRM plane state
   923	 * @dc_plane_state: target DC surface
   924	 *
   925	 * Update the underlying dc_stream_state's input transfer function (ITF) in
   926	 * preparation for hardware commit. The transfer function used depends on
   927	 * the preparation done on the stream for color management.
   928	 *
   929	 * Returns:
   930	 * 0 on success. -ENOMEM if mem allocation fails.
   931	 */
   932	int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
   933					      struct drm_plane_state *plane_state,
   934					      struct dc_plane_state *dc_plane_state)
   935	{
   936		bool has_crtc_cm_degamma;
   937		int ret;
   938	
   939		/* Initially, we can just bypass the DGM block. */
   940		dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
   941		dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
   942	
   943		/* After, we start to update values according to color props */
   944		has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
   945	
   946		ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
   947		if (ret == -ENOMEM)
   948			return ret;
   949	
   950		/* We only have one degamma block available (pre-blending) for the
   951		 * whole color correction pipeline, so that we can't actually perform
   952		 * plane and CRTC degamma at the same time. Explicitly reject atomic
   953		 * updates when userspace sets both plane and CRTC degamma properties.
   954		 */
   955		if (has_crtc_cm_degamma && ret != -EINVAL){
   956			drm_dbg_kms(crtc->base.crtc->dev,
   957				    "doesn't support plane and CRTC degamma at the same time\n");
 > 958				return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
