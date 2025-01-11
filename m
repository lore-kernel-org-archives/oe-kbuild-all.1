Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27F717C98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736623975; cv=none; b=kMWTbmkdQCp/mlPJ9OB/1WQ4EysMPwElRuisA65UsLgtM4gZVUEYZIpPk2Hmhlaf1fU4jH97/LDFCinjZ/+dhp0Lg3shk2T1R+x/TlgsTyZAM5xeUdTnC9JC27Y3kgR4oUfKuAKRcTNz94ylwzXQmPPkYbFghi/hG3dEU+5tj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736623975; c=relaxed/simple;
	bh=lqx6u9hbP737keCz5Yjs+F6jtOl4qVnrsUFQiF9dWv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7Ve+F/QdqyPdXez0pcMwkilsGrxXTAu52tOxqvd2LWWGqst+4IYAyWavuiaTilU6trO9Kv1tVBus0i5nPyFz/LT7t4FHkKUbyyEIUera5LvIU61UceF9kJ+w1ZUyZAfwvQxm8UDjp7nzQxOu/GVbyqiqL1e2kmnFz9gfZ0NRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUFrl9ud; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUFrl9ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736623973; x=1768159973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqx6u9hbP737keCz5Yjs+F6jtOl4qVnrsUFQiF9dWv4=;
  b=VUFrl9udHY+jO9NeOvHca9n786Tn7I8tnD73/rhi2FS3LlG8JMMTWzeo
   u7xGK9RU4uUIyrpC7RzrBijHQ5sJ/WaFlpKH5JI6vS6LHz1wj+g5X2HHQ
   Iq9n1uIBFHhOROo2DPtIaNmhdzA8Q4Lhpl14DdhNjHxgdM9Q2Smok70PR
   8J4vlv8NSORST493PA+IkYuyrcZpEvpeVR1FswEEgB6EcDRoXEICqJtXb
   Z9dadYYLUwTqYWvftxjKvwNV5q6pNZYI2xEalXj3hIVkOcf3oZPg4eF/O
   XXRAskfN4cpj8iFEV/YElchTMxszAA5W7uFu7bK7riSCt4sfWHgXuzvqc
   w==;
X-CSE-ConnectionGUID: 8yNNsDrLTUuYMWYKUpCVsQ==
X-CSE-MsgGUID: RpRhflZbT86ZDKU1SV4c2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36778538"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36778538"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 11:32:52 -0800
X-CSE-ConnectionGUID: oAUJyBghQAGhPBwwDt8vkA==
X-CSE-MsgGUID: XkzAyGNmTcqqsZR3NKeDzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103844217"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 11:32:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWhDz-000L90-2q;
	Sat, 11 Jan 2025 19:32:47 +0000
Date: Sun, 12 Jan 2025 03:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 258/504] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_HELPER when selected by
 VIDEO_XILINX_DPRXSS
Message-ID: <202501120525.dvuC01Vp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: a76e9bb15d68490da1eed3472ee1f554447a4a00 [258/504] v4l: xilinx: Driver support for Xilinx DP Rx subsystem
config: nios2-kismet-CONFIG_DRM_DISPLAY_HELPER-CONFIG_VIDEO_XILINX_DPRXSS-0-0 (https://download.01.org/0day-ci/archive/20250112/202501120525.dvuC01Vp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501120525.dvuC01Vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120525.dvuC01Vp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_HELPER when selected by VIDEO_XILINX_DPRXSS
   WARNING: unmet direct dependencies detected for XLNX_HDCP1X_CIPHER
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP1X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_DISPLAY_HELPER [=y]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
