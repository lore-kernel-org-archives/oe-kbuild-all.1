Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A2E16C451
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971391; cv=none; b=bpJSsvybzH6MiCk5JPOBOClOn4n26YV3eoBNrE993GLX5pcuBrweJ8tKoVjavxN7UDZhRc/WvnBg/yS+KTMtrM9YzrPoRLiDAKfMF0wBh+7J3h1J6ndhZGbdcsN1UuMvv4yMX35Juh/DAI1e4H+AhIGMrbjjjVdZ7ARaXkc71/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971391; c=relaxed/simple;
	bh=IP3UyWLF4jjHC9iHoxDS696+aMxwixBXhwROVHFpi4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkQoGahUhvht76S6VAixhbIrDciLXDuAFtaNOHVsBX11AKiS/l/6fI7/Hra4MMPuY42uTGEYNiEAyzxk8+NTl3/optbHNTFsbPf8F5IeBW0dene8S19mU7drnQEoKIgeZMT1wlXZVyrtCEnKuY/f6nwxTjE/H8l3/cSR2wsRAdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFSQIl8d; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFSQIl8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716971390; x=1748507390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IP3UyWLF4jjHC9iHoxDS696+aMxwixBXhwROVHFpi4Q=;
  b=JFSQIl8dEqbmPtDsLIFrPGjO6yRWIr00tM32UKAiFvq9KTcgOfz/ypUu
   7+DemjXW1rhMvrW2b96Y+glush2c+sTD9ErUi9TymSYe1GkPY01y7puav
   H39yDf5wAH1c07tlm2DqDVZpCXN9Vlok+Mua8i72wodZAgr6uzuOyWPfQ
   ao9vtDGjfkw1sZRGaYG9pPOOB7nR11M6M7rVwpSmDqv7stCVssvHKtbgP
   q8Jc1RnqXLEElHHrbDE9Y1Oomn2C5bqGXEFk+q3ZZx+AoVkdfDeomEhHP
   HS1soTJKFSXan5Ka7SjROVwrgbNj6AS9TVcceyb8GJaclHXPfKgpjKrcM
   A==;
X-CSE-ConnectionGUID: T7DRNmnLSZmKGZ3dpW5vCA==
X-CSE-MsgGUID: qIfIY5qLTVes2UP0xo/otA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24492386"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="24492386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 01:29:50 -0700
X-CSE-ConnectionGUID: AwVVNuV2TpSBI+fBig12bw==
X-CSE-MsgGUID: 97q1MpXERiGDZiQkVbGjJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35440455"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 May 2024 01:29:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCEgr-000DKi-23;
	Wed, 29 May 2024 08:29:45 +0000
Date: Wed, 29 May 2024 16:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 6/29] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER when selected by
 DRM_KUNIT_TEST
Message-ID: <202405291636.8GgBtK8u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   336dca397dcefc5d7436be1fee3c814ed6512996
commit: eb66d34d793ed48494820ce908c8c821b8e6cae5 [6/29] drm/tests: Add output bpc tests
config: x86_64-kismet-CONFIG_DRM_DISPLAY_HDMI_STATE_HELPER-CONFIG_DRM_KUNIT_TEST-0-0 (https://download.01.org/0day-ci/archive/20240529/202405291636.8GgBtK8u-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240529/202405291636.8GgBtK8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291636.8GgBtK8u-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER when selected by DRM_KUNIT_TEST
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
     Selected by [y]:
     - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
