Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148084120F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrzdmBcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702565497; x=1734101497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5H3+4djYl/HSb3PkIauMKnLrtgBzyN5xVxwMb9zQQ/o=;
  b=JrzdmBccedmmcWms4jt8iLihG+kH0O2SAHayoukqtHE6enDtrJbyEwUN
   ASD/A6tyyRCVEA1mTX6rISIywmHnUAJGgneNlPki5+jcDZBIZbTiilLi2
   AmWRxSjFC5VhTD1A0Vpz8jlvIcF3s8who8lhlvffV1bnSFIlrO5NYtdt8
   G+iKEL7Sk3XNeAR7JrYunLhHSN2Nv35WdBrIsXT1HiL2KeU8keJ+e0dok
   1u31A2CUaS2n5ly1qgZDX8q0+2ew/6tm3zfpXuXt0avY/5maLORD/HeIs
   Neb9WTrVdZ6I9ZVnXKAyxFfYFPlVGOJVrBadfPaB2limVa1QF7YGbE0DV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="393998660"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="393998660"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:51:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947595985"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="947595985"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 06:51:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDn3k-000MBg-1U;
	Thu, 14 Dec 2023 14:51:32 +0000
Date: Thu, 14 Dec 2023 22:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 7458/7726] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:663: warning:
 Excess function parameter 'crtc_state' description in
 'amdgpu_dm_verify_lut3d_size'
Message-ID: <202312142251.hkpNUHSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11651f8cb2e88372d4ed523d909514dc9a613ea3
commit: aba8b76baabde681ab4ff686452005d80d949345 [7458/7726] drm/amd/display: add plane shaper LUT support
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312142251.hkpNUHSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142251.hkpNUHSZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:663: warning: Excess function parameter 'crtc_state' description in 'amdgpu_dm_verify_lut3d_size'
>> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:663: warning: Function parameter or member 'plane_state' not described in 'amdgpu_dm_verify_lut3d_size'

vim +663 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c

   648	
   649	/**
   650	 * amdgpu_dm_verify_lut3d_size - verifies if 3D LUT is supported and if user
   651	 * shaper and 3D LUTs match the hw supported size
   652	 * @adev: amdgpu device
   653	 * @crtc_state: the DRM CRTC state
   654	 *
   655	 * Verifies if pre-blending (DPP) 3D LUT is supported by the HW (DCN 2.0 or
   656	 * newer) and if the user shaper and 3D LUTs match the supported size.
   657	 *
   658	 * Returns:
   659	 * 0 on success. -EINVAL if lut size are invalid.
   660	 */
   661	int amdgpu_dm_verify_lut3d_size(struct amdgpu_device *adev,
   662					struct drm_plane_state *plane_state)
 > 663	{
   664		struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
   665		const struct drm_color_lut *shaper = NULL;
   666		uint32_t exp_size, size;
   667		bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut;
   668	
   669		/* shaper LUT is only available if 3D LUT color caps */
   670		exp_size = has_3dlut ? MAX_COLOR_LUT_ENTRIES : 0;
   671		shaper = __extract_blob_lut(dm_plane_state->shaper_lut, &size);
   672	
   673		if (shaper && size != exp_size) {
   674			drm_dbg(&adev->ddev,
   675				"Invalid Shaper LUT size. Should be %u but got %u.\n",
   676				exp_size, size);
   677			return -EINVAL;
   678		}
   679	
   680		return 0;
   681	}
   682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
