Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F121BC44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 20:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713818922; cv=none; b=MHHvVmw1KCMkPC0KS9rgolQQZO0NzP1lvXFRNzaXblBnBAQTgnZgOoPvUSwD41Xda7SoMEuMCLabCmFuS2dkODMJKnDGRELIBvxvHR84kqTD4g0DnsngQ6f3XXviCs19m+j5+HZ0/bdd3YCXiXEAs7GwfSl2+8Z4pGj0b2NcSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713818922; c=relaxed/simple;
	bh=as531GnWHAL3nMZ0qIiE8OAXIJgeOiKmA8Z2prwmREk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hP2ka4Ty2BjYxvRV02D2gh0QS8ifUoODKiCg1SjsyUnssQmdsDvxooNwZzjqffxsWkjTbdNI6wJ6gU/YJkoDBuuDmoIwt1wICpas9in2r0CSnCfwF5Qmc+hI4Ij9Egh0mCrAIXvscN7Z3peeWopmuhwUl8LGj0mLd31MmbWXiuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjbvR08t; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjbvR08t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713818921; x=1745354921;
  h=date:from:cc:subject:message-id:mime-version;
  bh=as531GnWHAL3nMZ0qIiE8OAXIJgeOiKmA8Z2prwmREk=;
  b=JjbvR08t57H+BVuTJomsYGP7lzh0YCx+385agEqdbV7x1Bp74b0m2Pf4
   DDqLpLhgsmq528EG5U8Xlk3N8NCPtEGI9cL7TZBWherT9xn9HqTV00QSc
   w6hwBFCC5+PNVw2TZsnemFl1DRU9eTc3qDi22wtOriARJ1YXD5viQ+Jt6
   V/GJ176FYr8p7YYPfohYVwqCJhnNa+LzbLzKn4BaJA7wt8+bUB6F6sLts
   ChHqco8/+00B2dBbpy5Y/Fv0EqLDB48ow78U1C9+jFAa5GWU9Asas65lK
   f/9Ao2nx71XqsGJIe9uNRbtku+ApWwLJC64PSlWB0px8TeRZTXcMQSO9o
   Q==;
X-CSE-ConnectionGUID: ezrxAd+CSe+/lvFX4NRuzQ==
X-CSE-MsgGUID: kD6XoYMvQ3+lCne7Un/UYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9920962"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9920962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 13:48:40 -0700
X-CSE-ConnectionGUID: /VdsIdUIR4W07ibbEvxueg==
X-CSE-MsgGUID: IPR+XLbGRxeTONWOTNb0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24161019"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Apr 2024 13:48:39 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz0ab-0000Eq-0d
	for oe-kbuild-all@lists.linux.dev;
	Mon, 22 Apr 2024 20:48:37 +0000
Date: Tue, 23 Apr 2024 04:48:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1947/6555]
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c:684:22: sparse: sparse: symbol
 'rcar_du_crtc_mode_valid' was not declared. Should it be static?
Message-ID: <202404230443.GZIidUCK-lkp@intel.com>
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
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240423/202404230443.GZIidUCK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240423/202404230443.GZIidUCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230443.GZIidUCK-lkp@intel.com/

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
