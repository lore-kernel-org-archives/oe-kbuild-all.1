Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E08F47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713928618; cv=none; b=teIjrm+yG6uYK+gQkMymFENqo8aZ6k8P6y7WGKJ1M/GvGcif2tkfwlKdIdwVJQ3R4GiJGiIH23VKbEd760XB3sKyVXzMH1ne4mveDnNT0c8QXYRT1JoID2F7JCyKkwMXQv8xMgozCnqFvj+shvJFtPcya65K0ZBsaZf2QwkPQ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713928618; c=relaxed/simple;
	bh=oKAqvnc4HGuh0FU518yiMTTbTJf36HZHZalp9Ldx/Gc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1B3l0IL8ZSJLFuCQGIwo8ERP0LlqcYCqBTQMEDurYb58JbwShCtfV9kwxNcveTsS1OXZmgDAuehNFbCRKITywWBzOcvmsiZSbxkixu1AalgWiKYOzVvEL8WYpDiO98q2+mOJUeCd1L9meb2G8u0VeFgrYKc6Czr7Akp7uzgvd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iM3G/8nI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iM3G/8nI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713928616; x=1745464616;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oKAqvnc4HGuh0FU518yiMTTbTJf36HZHZalp9Ldx/Gc=;
  b=iM3G/8nIdm/ZLGjmr3kW6+WpnvD3CDeTMZ1oOirL0XWNMV7SivGCblDC
   wpqqVKadkmZXEXXaqnDKsjklfYCL7WbzyeNDmzBNWciVOBR6a0GrIOHNF
   auPPuPI1xuvh6TtGtAnlNOQyo3g84PNPyFNE3Bpze5ufVXLAphYhmwMX8
   +Uttvz7Gg6TDx7Pq+nvgU/moqnCqAWaoTZvKVLxU7Xe7pZLpUM3MPVeNd
   hWAoiTwYlEbujq3T70418ZC07dKgiUcTpqjjEVqM0Z0Qng0OvZ3BV38rb
   5By9fBrIOcSV4/dnPVr63HIOa3lzeK70hVa4ZGWVf6u4ymdNMvq2k8DjG
   Q==;
X-CSE-ConnectionGUID: pzwwyIGpQNeO0y8+BADtog==
X-CSE-MsgGUID: fUf28v9uTxWXhlocFA4+jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9407574"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9407574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 20:16:55 -0700
X-CSE-ConnectionGUID: fF0dIDPmQs6Wm+LzaRNJLw==
X-CSE-MsgGUID: NaQSBiIOTWOEBPQ/bMWvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24456565"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2024 20:16:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzT7s-0000ng-1s
	for oe-kbuild-all@lists.linux.dev;
	Wed, 24 Apr 2024 03:16:52 +0000
Date: Wed, 24 Apr 2024 11:16:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1947/6555]
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c:684:22: sparse: sparse: symbol
 'rcar_du_crtc_mode_valid' was not declared. Should it be static?
Message-ID: <202404241146.ADG16jAt-lkp@intel.com>
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
commit: c244a5049a14aef78319f7cea73b6992f917631b [1947/6555] UPSTREAM: drm: rcar-du: Add interlaced feature flag
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240424/202404241146.ADG16jAt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404241146.ADG16jAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241146.ADG16jAt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/rcar-du/rcar_du_crtc.c:684:22: sparse: sparse: symbol 'rcar_du_crtc_mode_valid' was not declared. Should it be static?
   drivers/gpu/drm/rcar-du/rcar_du_crtc.c:891:12: sparse: sparse: symbol 'rcar_du_crtc_get_crc_sources' was not declared. Should it be static?
   drivers/gpu/drm/rcar-du/rcar_du_crtc.c:684:22: warning: no previous prototype for 'rcar_du_crtc_mode_valid' [-Wmissing-prototypes]
     684 | enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_crtc.c:891:20: warning: no previous prototype for 'rcar_du_crtc_get_crc_sources' [-Wmissing-prototypes]
     891 | const char *const *rcar_du_crtc_get_crc_sources(struct drm_crtc *crtc,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/rcar_du_crtc_mode_valid +684 drivers/gpu/drm/rcar-du/rcar_du_crtc.c

   683	
 > 684	enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
   685					   const struct drm_display_mode *mode)
   686	{
   687		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
   688		struct rcar_du_device *rcdu = rcrtc->group->dev;
   689		bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
   690	
   691		if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
   692			return MODE_NO_INTERLACE;
   693	
   694		return MODE_OK;
   695	}
   696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
