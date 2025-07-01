Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59225D540
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353677; cv=none; b=AyYHsoiRo4itz0mDvjPN/iY9v/5C+b0BTEL4ACV7TbjHbEJJgFG3SSy6A4ediepVHFQQWgDTmxEGFfH9BpZGQeSi8drTDK+hJHgG1gjS4q12GIWtwyhCROQYYaWDPGxFuJVoK8GTDLgpB0LTMsBIOzGkhwgAezGz9PJrcc6ppUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353677; c=relaxed/simple;
	bh=YCNsafjb8kiq7TfZUa2h0JOFDQWGSNriD+g9zAaINjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BWcxOZP23RdMDEKDd58qAAydl2JDRrznOnLubaf2qpfU2r77YhPnQuvN8jMuIsYLQYllQrqez5DxvBqzNplKhFbbsmETJvFD8Ztig3jEac7GB1EalXi+1P30Rh0/SknL6xSonxLjfOQDN3G6blg84yLxDrg+v9SPAF7pKDFp+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bw12u8w/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw12u8w/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751353675; x=1782889675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCNsafjb8kiq7TfZUa2h0JOFDQWGSNriD+g9zAaINjs=;
  b=bw12u8w/qkqTJi7RWkCza/FMPOkyERjLPPiL/mFzD9XaElv5ApB9+FEQ
   BWtWaIeiKbhaeB45O0Y8Ay7P8kVQhXtAQrhFLk7wMeOpOlnfTil3zoh5b
   86+nkRTICCM6H32WYkZosuxCuEffPrlaXHqAA3RZ2DIHwxCiOR0xbY9ie
   vVQTPOnP+CGkX8lMLJRftxla8I294PLZqe1AzDD8ZQVyKTB/BK3hwuSEV
   yqMjHXkdCpmzLDpOR4BuF0eSa9ai2peToW8K8VVWNyGBxNgk759fxQKSx
   adLGfVmEAT6eKT0rwhoPxwNHIb+Pdnhw3GjXznWvyPhNj/mCvl6mZoRz/
   Q==;
X-CSE-ConnectionGUID: +3Cka07BQcSw3Gmrea1rIw==
X-CSE-MsgGUID: Kqxb7dHnTk+rW5eUSgZmig==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="76145153"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="76145153"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 00:07:51 -0700
X-CSE-ConnectionGUID: 6u/l43iDRLqIKpbcF0vEVg==
X-CSE-MsgGUID: Yp3LeRgIQWeFRbrJjHxibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153075892"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 00:07:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWV5n-000Zog-2u;
	Tue, 01 Jul 2025 07:07:47 +0000
Date: Tue, 1 Jul 2025 15:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 440/440] kismet: WARNING: unmet
 direct dependencies detected for GENERIC_GETTIMEOFDAY when selected by
 HAVE_ARM_ARCH_TIMER
Message-ID: <202507011508.PlZhoCjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   9262077f7dda6a5ced992027f566118fd18e154f
commit: a5ebd44814f4303c7b249833698574d48ebf1aae [440/440] UPSTREAM: arm64: Introduce a way to disable the 32bit vdso
config: arm-kismet-CONFIG_GENERIC_GETTIMEOFDAY-CONFIG_HAVE_ARM_ARCH_TIMER-0-0 (https://download.01.org/0day-ci/archive/20250701/202507011508.PlZhoCjH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507011508.PlZhoCjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011508.PlZhoCjH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_GETTIMEOFDAY when selected by HAVE_ARM_ARCH_TIMER
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_GETTIMEOFDAY
     Depends on [n]: HAVE_GENERIC_VDSO [=n]
     Selected by [y]:
     - HAVE_ARM_ARCH_TIMER [=y] && CPU_V7 [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
