Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04C723A9A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445453; cv=none; b=OmjWxlMtn3470MruOqjSzzP0UYgZQlb0mQS2/Ezqg++f/hXgCitvfZrEGxtWSh9F9cbLpDN2KDzWpTA6RsjspzAEGDS/78V8qAzwR8h1qvuqJXvEXrG1M5Hi5MNBfWVP8kCiOWQd7dnPNs0Ntrx4feeVGLpbGJNGCarB8P5oFbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445453; c=relaxed/simple;
	bh=iwdQA0/6bVMtcPPBKu8YEkUNgnA30Nfk3hs+Xck4gHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWm/OkwRikVqbCYOr9+6elZ/pEiad/N0Lia/ovkvJLUdZaLPzWOqWXU++UcAnPoA2HtPJNAKAcHV+YgA2u6cjHIIIvBcf54q6bbWKssojuNOebh2mNfkAiuLqXDkkpT4tzN8312xIAqnHFkKcSqO5Uk81yLhHvTFT0eQ6Zo77hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJKBhRjP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJKBhRjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751445452; x=1782981452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwdQA0/6bVMtcPPBKu8YEkUNgnA30Nfk3hs+Xck4gHI=;
  b=ZJKBhRjPlghSLFzaKmEr0W90k9QTsIyJaGkW2OsYDqYGEI0M7XXxSa31
   WhjRMIoeSQwjELrZuiSNeG0qkuyR8g0BaXqZJCiEoSmiYb4plj28/V3Dp
   zgsmZziodWQ/gulkwKKn1rBUViJ4qaF5vhA6RDhq0c0R577tY0ze7akgi
   5esW7IqqL9m74ccGZTDNzrljbb67hyT53IZZVkMIeoSztRj+jJxB4Vtjq
   l+Uxag7r95A2IQjpSdxJQqXUbtHXfl1ubsq42CrGwRHKrBtnAjRDHwl/e
   GHLPvvqOoB5R3vrZqZdgpXi8fZpeA1cIIhFTnnVJ41ekYCbDyJgT0IBV8
   g==;
X-CSE-ConnectionGUID: 3zg1mNJhT3us9lQCX7BM6w==
X-CSE-MsgGUID: udovaboKQ/uM6gQ2+SLPzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71158290"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="71158290"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:37:28 -0700
X-CSE-ConnectionGUID: hLU0DzGxRoebQMg7ZgDtwg==
X-CSE-MsgGUID: J7SA/oaBQ66UM5boPtM07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154563467"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 01:37:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWsy4-0000Nr-22;
	Wed, 02 Jul 2025 08:37:24 +0000
Date: Wed, 2 Jul 2025 16:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36] kismet: WARNING: unmet
 direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by
 VIDEO_SUN8I_A83T_MIPI_CSI2
Message-ID: <202507021655.XR5DRK5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   e46d8eec80ca529b65ede6df00d9219e17665b1e
commit: 582d4ad468cbc6ef2db4689ff3bd5868d95402c9 [36/36] media: tc358746: select CONFIG_GENERIC_PHY
config: x86_64-kismet-CONFIG_GENERIC_PHY_MIPI_DPHY-CONFIG_VIDEO_SUN8I_A83T_MIPI_CSI2-0-0 (https://download.01.org/0day-ci/archive/20250702/202507021655.XR5DRK5j-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507021655.XR5DRK5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021655.XR5DRK5j-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by VIDEO_SUN8I_A83T_MIPI_CSI2
   WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
     Depends on [n]: GENERIC_PHY [=n]
     Selected by [y]:
     - VIDEO_SUN8I_A83T_MIPI_CSI2 [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y] && (ARCH_SUNXI || COMPILE_TEST [=y]) && PM [=y] && COMMON_CLK [=y] && RESET_CONTROLLER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
