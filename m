Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98062C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 00:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713833871; cv=none; b=TgMKf69HCWEwbY3+nZImjRpUqem2eDm7FP6wcuGrRAqjhFghrkXuBCpYmPROswbhkK824QO3EE9FGhCnIcq7Zp5+5K/VBE4267UUHA+DXad8yZbXhFwDjDbpWPDXKy1WoAo60n20SMG9LIPw8Kj7we3LgRYms3F5pT4a7iZh50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713833871; c=relaxed/simple;
	bh=lJC0rJA53cVU86gK1yDKeNm6hCkms2idb2BdnlcC6ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rS/m6D02WVOC4Fjqg1HC+GnF/duOzSdqpYfxwrCOA/8u41ZEA9IQJyRWA9aOOQdzhw7aGmK6nwA+ndKZEHyyueDTUXPGdYaWLNQ9+64WI3gRx7jMsV0cQHfiX1z6wGfY2e5oUjdBW4A1Hh0jQWanOPkI2Dz+dWmdjLpHX0rNklM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqmUq5rY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqmUq5rY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713833869; x=1745369869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lJC0rJA53cVU86gK1yDKeNm6hCkms2idb2BdnlcC6ZM=;
  b=hqmUq5rYYIJ/BW7gX6RDSoDVL2TihM0/oPoT03nKEY9uyBAgmBLtKfxA
   5JvsLeM6/fMB5+5I4PS+6NbBmlFvWMRdnuotXS1ICuhrvUTdVGd5de+37
   lBgIfJYn1cGouKzCX9REc2jrlWDW+PtX9dQEDIEspqOsmWMFUBOuO8DJg
   IMPgg5I/s0xQ6z5dtBlNbXf6zGJDCGQP4tL0CzUt9KoPB9bgObnAigMdk
   iVFtHkYXt+5BehOgkLMtaNqR4bxQFvz/gb699kzIBi1xs6J7xciSZtHsu
   zz14TmQZ9jrICyA/9gGSfKwTtSapz0BRetjPhhR/Yy4RQrRB1x3DSAs4g
   g==;
X-CSE-ConnectionGUID: CKF0Nwh+QCyAUl2G1v7JBg==
X-CSE-MsgGUID: em4WByg2S8a7+VduV3E0KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9316376"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9316376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 17:57:48 -0700
X-CSE-ConnectionGUID: RXtvpPurSzSGBt+mzNfPqw==
X-CSE-MsgGUID: tzgvsBWPSzKyayeXMRIGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47476674"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2024 17:57:47 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz4Tg-0000Ma-1y;
	Tue, 23 Apr 2024 00:57:44 +0000
Date: Tue, 23 Apr 2024 08:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [lumag-msm:msm-next-lumag 48/56]
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c:374:16: sparse: sparse: symbol
 'mdp4_rgb_formats' was not declared. Should it be static?
Message-ID: <202404230823.l8sL6uQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag
head:   33edc5592466996fe9610efc712da0a3539027ae
commit: 6c52172f0b2b272ed5b6a809b042a317b8d9e8da [48/56] drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
config: powerpc64-randconfig-r122-20240423 (https://download.01.org/0day-ci/archive/20240423/202404230823.l8sL6uQb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240423/202404230823.l8sL6uQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230823.l8sL6uQb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c:374:16: sparse: sparse: symbol 'mdp4_rgb_formats' was not declared. Should it be static?
>> drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c:389:16: sparse: sparse: symbol 'mdp4_rgb_yuv_formats' was not declared. Should it be static?

vim +/mdp4_rgb_formats +374 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c

   373	
 > 374	const uint32_t mdp4_rgb_formats[] = {
   375		DRM_FORMAT_ARGB8888,
   376		DRM_FORMAT_ABGR8888,
   377		DRM_FORMAT_RGBA8888,
   378		DRM_FORMAT_BGRA8888,
   379		DRM_FORMAT_XRGB8888,
   380		DRM_FORMAT_XBGR8888,
   381		DRM_FORMAT_RGBX8888,
   382		DRM_FORMAT_BGRX8888,
   383		DRM_FORMAT_RGB888,
   384		DRM_FORMAT_BGR888,
   385		DRM_FORMAT_RGB565,
   386		DRM_FORMAT_BGR565,
   387	};
   388	
 > 389	const uint32_t mdp4_rgb_yuv_formats[] = {
   390		DRM_FORMAT_ARGB8888,
   391		DRM_FORMAT_ABGR8888,
   392		DRM_FORMAT_RGBA8888,
   393		DRM_FORMAT_BGRA8888,
   394		DRM_FORMAT_XRGB8888,
   395		DRM_FORMAT_XBGR8888,
   396		DRM_FORMAT_RGBX8888,
   397		DRM_FORMAT_BGRX8888,
   398		DRM_FORMAT_RGB888,
   399		DRM_FORMAT_BGR888,
   400		DRM_FORMAT_RGB565,
   401		DRM_FORMAT_BGR565,
   402	
   403		DRM_FORMAT_NV12,
   404		DRM_FORMAT_NV21,
   405		DRM_FORMAT_NV16,
   406		DRM_FORMAT_NV61,
   407		DRM_FORMAT_VYUY,
   408		DRM_FORMAT_UYVY,
   409		DRM_FORMAT_YUYV,
   410		DRM_FORMAT_YVYU,
   411		DRM_FORMAT_YUV420,
   412		DRM_FORMAT_YVU420,
   413	};
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
