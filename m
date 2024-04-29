Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18138335A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714431485; cv=none; b=ItqsZVfbkJgSFEycR8eWmIe8VLiBjGsxK/VBH0rFXVlpu6HSlt5OtDNLsujq2F9eOUaozNyhBlaGt2eY9yI3nxDd7QzG+zldZLrEysOfmn0hvA8AQlbBzbDYZo9CFxO/I5vOcg9opBA1FPNM/mt4CFBwkYam/O3DUhajGFk0H48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714431485; c=relaxed/simple;
	bh=ZkCFF0C8fTWuku1AlfZAEYZAph7dMywza6m9CP4upbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZrkCgbUvNoDFCrWY0RNS+GBHcjgm88F4qDIxrSCdq/4becwBLFF/9/elz9g338JVTm2DFQCTIopp7SsdGZ++ASIA/0ZalBLXbyAzJNW4nEJEbikitz/QymZMUXAQ8PeRWq8vx6K3UoSFfEHY7oe28TOTgASKeagl2POrwwKKlQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJ//iQTg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJ//iQTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714431484; x=1745967484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkCFF0C8fTWuku1AlfZAEYZAph7dMywza6m9CP4upbE=;
  b=FJ//iQTgY+IHuISL8noE1CpxHpkRD5I8pJ2i5bbHPN9NeZc8DLIDBasK
   dDJ3O44kVCaEl/Iasg+UO7TRhVK5aXRz5pOAFeQUJ673N82etD3Rrw6mb
   4NkWtvfJQAbEmQuh2jtL+W70YUQsin/Y//bjau1x9b3fO8+T+f55Y2lrt
   CkD5OcuYzIPAwvipnW7wukoDXBfpo+aibCSUvD3X5LJneWpKrcIurUpCv
   +kTCuc5DvgWsjd5CJzLMumMPpV/OxGxRq8iPUtlf+Qq7OqjZ75RlqfaOP
   uxXugQVMdIyZ3cD3jmlxi7kTgmQzxunJ+x6S1wN1ySaesqwCuMUlI5ips
   A==;
X-CSE-ConnectionGUID: e8Nv2K+tTF+ZcPtwkee2CA==
X-CSE-MsgGUID: NARev+lFRk2yiombnrZ7bA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20733116"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20733116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 15:58:03 -0700
X-CSE-ConnectionGUID: FORmG57aRIKnZVMigTpG+g==
X-CSE-MsgGUID: UEwovkgqQDO/incA2jdlsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30707937"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 15:58:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Zwd-0007V2-3A;
	Mon, 29 Apr 2024 22:57:59 +0000
Date: Tue, 30 Apr 2024 06:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4997/11728]
 drivers/gpu/drm/imx/dpu95/dpu95-crtc.c:245:27: warning: variable 'plane' set
 but not used
Message-ID: <202404300614.iRYzUiri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 5ccfbf1d2459aae89fa1cf2edde3802ef13201d5 [4997/11728] LF-10590-2 drm/imx: Add i.MX95 DPU KMS support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404300614.iRYzUiri-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300614.iRYzUiri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300614.iRYzUiri-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/dpu95/dpu95-crtc.c: In function 'dpu95_crtc_atomic_begin':
>> drivers/gpu/drm/imx/dpu95/dpu95-crtc.c:245:27: warning: variable 'plane' set but not used [-Wunused-but-set-variable]
     245 |         struct drm_plane *plane;
         |                           ^~~~~
   drivers/gpu/drm/imx/dpu95/dpu95-crtc.c: In function 'dpu95_crtc_atomic_flush':
   drivers/gpu/drm/imx/dpu95/dpu95-crtc.c:313:27: warning: variable 'plane' set but not used [-Wunused-but-set-variable]
     313 |         struct drm_plane *plane;
         |                           ^~~~~
--
>> drivers/gpu/drm/imx/dpu95/dpu95-fetchlayer.c:26:6: warning: no previous prototype for 'dpu95_fl_set_src_buf_dimensions' [-Wmissing-prototypes]
      26 | void dpu95_fl_set_src_buf_dimensions(struct dpu95_fetchunit *fu,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/imx/dpu95/dpu95-kms.c: In function 'dpu95_drm_atomic_check':
>> drivers/gpu/drm/imx/dpu95/dpu95-kms.c:407:28: warning: variable 'dpu_crtc' set but not used [-Wunused-but-set-variable]
     407 |         struct dpu95_crtc *dpu_crtc;
         |                            ^~~~~~~~
--
   drivers/gpu/drm/imx/dpu95/dpu95-plane.c: In function 'dpu95_plane_atomic_update':
>> drivers/gpu/drm/imx/dpu95/dpu95-plane.c:416:13: warning: variable 'bpp' set but not used [-Wunused-but-set-variable]
     416 |         int bpp;
         |             ^~~
>> drivers/gpu/drm/imx/dpu95/dpu95-plane.c:415:43: warning: variable 'src_y' set but not used [-Wunused-but-set-variable]
     415 |         unsigned int src_w, src_h, src_x, src_y, dst_w, dst_h;
         |                                           ^~~~~
>> drivers/gpu/drm/imx/dpu95/dpu95-plane.c:415:36: warning: variable 'src_x' set but not used [-Wunused-but-set-variable]
     415 |         unsigned int src_w, src_h, src_x, src_y, dst_w, dst_h;
         |                                    ^~~~~


vim +/plane +245 drivers/gpu/drm/imx/dpu95/dpu95-crtc.c

   238	
   239	static void dpu95_crtc_atomic_begin(struct drm_crtc *crtc,
   240					    struct drm_atomic_state *state)
   241	{
   242		struct drm_crtc_state *old_crtc_state;
   243		struct drm_atomic_state *old_state;
   244		struct dpu95_crtc *dpu_crtc = to_dpu95_crtc(crtc);
 > 245		struct drm_plane *plane;
   246		struct drm_plane_state *old_plane_state;
   247		struct dpu95_plane_state *old_dpstate;
   248		struct dpu95_fetchunit *fu;
   249		const struct dpu95_fetchunit_ops *fu_ops;
   250		int i;
   251	
   252		old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
   253		old_state = old_crtc_state->state;
   254	
   255		/* do nothing if planes keep being disabled */
   256		if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0)
   257			return;
   258	
   259		/* request power-on when any plane starts to be active */
   260		if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask != 0)
   261			dpu95_crtc_pm_runtime_resume_and_get(dpu_crtc);
   262	
   263		/*
   264		 * Disable relevant planes' resources in SHADOW only.
   265		 * Whether any of them would be disabled or kept running depends
   266		 * on new plane states in the new global atomic state.
   267		 */
   268		for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
   269			old_dpstate = to_dpu95_plane_state(old_plane_state);
   270	
   271			if (!old_plane_state->fb)
   272				continue;
   273	
   274			if (old_plane_state->crtc != crtc)
   275				continue;
   276	
   277			fu = old_dpstate->source;
   278	
   279			fu_ops = dpu95_fu_get_ops(fu);
   280	
   281			fu_ops->disable_src_buf(fu);
   282		}
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
