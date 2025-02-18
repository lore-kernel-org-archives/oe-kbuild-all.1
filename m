Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D372AE74
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739841478; cv=none; b=YboW4P9MGhaj+tO8q3sDgnAj3OI+R8q2iQCF4xGkMhR+Ng/RdYDppnnrGn+0cdPD/AOULvvhpOsFEr7wL8sXc3j93mhxYIocP61G+66Y/xPNxtZ0e4MES+xWsn7AJaz6pLA2o7CCbJQmaGlX396FQ9Cej+LGtm0gtxHXbIm/gXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739841478; c=relaxed/simple;
	bh=RKtl0WSAYW99rQNmuexatAeDiL/ahKxTih+ZICSokxk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kuOhwdLde3IlvgXm50Jv2n3goFZrBELN5e/VBcJ4pnHvYmu3W5GttfemuPfhfqIs962pVd6FeD2adpdTRHNmXiiY8ZkJrpDmDfA6upAN7PTWCUC27mngA+W1a6lXtAP7hH97GC9FIO6iD4+cvbQ84KtkHvngfA4qCGlrzNRVabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfBy3yRQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfBy3yRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739841476; x=1771377476;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RKtl0WSAYW99rQNmuexatAeDiL/ahKxTih+ZICSokxk=;
  b=QfBy3yRQNOTd8Ej0Cx+sG8Tu7GYqRHw7ebE+Lkut1DZvlT+mBBLF+XQr
   BCX8v+6PZoeKvEm5AqQUAukHEhyner5OCoBwvIXxVe9GPkNTd2U+A5HB0
   HU1eprVxpcCG4SHIbMKlDjJdKSCt/faZBpt7XDe6IsRk5p9KFMj5yTHfT
   cie5ig1W7AQbEDttaowkv4HhOLJz3r4XsZtkG07hFr2NlgU/gEgEvT/Xq
   YjfqJtqYlZR4Gis0DAzEI43fGGEXDg5bdALCAWuf3jTIx6j81V+rtrlRF
   nhkkGqgeL6Uk1euqSHhVjY0UMr4fN9qNrwyOW3b3cgCl0oEzbqDDQS7Y7
   g==;
X-CSE-ConnectionGUID: 6wB6arreQDS8JQxiIhKeNA==
X-CSE-MsgGUID: t/LxHe8tRyeVnAYuNHXuXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51144904"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="51144904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 17:17:56 -0800
X-CSE-ConnectionGUID: k8Gtg145SRmClj7NmkejeA==
X-CSE-MsgGUID: 9jc8FHDvTM2sq3MkXgAFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114759358"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2025 17:17:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkCFF-001DlP-1E
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 01:17:53 +0000
Date: Tue, 18 Feb 2025 09:17:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c:49:29: warning: variable
 'kcrtc' set but not used
Message-ID: <202502180923.7KfSpW4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi james,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 9e560309417638507398fd6239e04f47cc907f70 [1/1] drm/komeda: Add komeda_plane/plane_helper_funcs
config: x86_64-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180923.7KfSpW4E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180923.7KfSpW4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180923.7KfSpW4E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/arm/display/komeda/komeda_plane.c:42:5: warning: no previous prototype for 'komeda_plane_atomic_check' [-Wmissing-prototypes]
      42 | int komeda_plane_atomic_check(struct drm_plane *plane,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_plane.c: In function 'komeda_plane_atomic_check':
>> drivers/gpu/drm/arm/display/komeda/komeda_plane.c:49:29: warning: variable 'kcrtc' set but not used [-Wunused-but-set-variable]
      49 |         struct komeda_crtc *kcrtc;
         |                             ^~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_plane.c: At top level:
   drivers/gpu/drm/arm/display/komeda/komeda_plane.c:82:6: warning: no previous prototype for 'komeda_plane_atomic_update' [-Wmissing-prototypes]
      82 | void komeda_plane_atomic_update(struct drm_plane *plane,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kcrtc +49 drivers/gpu/drm/arm/display/komeda/komeda_plane.c

    41	
  > 42	int komeda_plane_atomic_check(struct drm_plane *plane,
    43				      struct drm_plane_state *state)
    44	{
    45		struct komeda_plane *kplane = to_kplane(plane);
    46		struct komeda_plane_state *kplane_st = to_kplane_st(state);
    47		struct komeda_layer *layer = kplane->layer;
    48		struct drm_crtc_state *crtc_st;
  > 49		struct komeda_crtc *kcrtc;
    50		struct komeda_crtc_state *kcrtc_st;
    51		struct komeda_data_flow_cfg dflow;
    52		int err;
    53	
    54		if (!state->crtc || !state->fb)
    55			return 0;
    56	
    57		crtc_st = drm_atomic_get_crtc_state(state->state, state->crtc);
    58		if (!crtc_st->enable) {
    59			DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
    60			return -EINVAL;
    61		}
    62	
    63		/* crtc is inactive, skip the resource assignment */
    64		if (!crtc_st->active)
    65			return 0;
    66	
    67		kcrtc = to_kcrtc(state->crtc);
    68		kcrtc_st = to_kcrtc_st(crtc_st);
    69	
    70		err = komeda_plane_init_data_flow(state, &dflow);
    71		if (err)
    72			return err;
    73	
    74		err = komeda_build_layer_data_flow(layer, kplane_st, kcrtc_st, &dflow);
    75	
    76		return err;
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
