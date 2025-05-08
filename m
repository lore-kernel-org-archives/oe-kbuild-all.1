Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4C8272E58
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715211; cv=none; b=jiu1JckYI529N9eFUk+ZdluL0VpA9CGilnFk2YcgNTdFidF4MJvXXUdTIA2pixv/Zwt9+AAgK+1z/eWQvpLt5V8AVdh7p2lfJDVlf+bFd9EADHQrbSu2229KNCYPu+aSJnuL/1xw+ofKKAb3A/bxbO+dVFLiY+RO3154KdqvBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715211; c=relaxed/simple;
	bh=HMNmIDBn4oVFes/v6Cyk5hQs2cC/Z70vhDGbbd/CYWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfCfCi/muUZsP5kSe5phvtCDZdYKUiR4dXsM41RQtbu754dgkf6LKPPlvYzoFoOIPY3/kogVxEuuvENPxcaAsosJ+fVCZ3FWxjGh3LjTV5gzGLlSW+QeSI6lIU9Ma4LObpQ/oWAujQYt0TL3jI84P6ucP0EqxYWHEWMcBDv/KZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gvv6MPgH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gvv6MPgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746715209; x=1778251209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HMNmIDBn4oVFes/v6Cyk5hQs2cC/Z70vhDGbbd/CYWw=;
  b=Gvv6MPgHFVY4i0RpNBJNrTqzxoeu4t+Y0tLN2pf3CJ6qE6Gg28b144Ux
   BPJ2yjeoxTvEw762KdIJnYzSPWk7uLLSY0fAG0asfDw/2zMLPWrKMHf/i
   CONCGv5aHhSlV6pnlBpLBSrgGLK/PLXmpZciBvgAfk6fQYTTra6HD7KkK
   M2edbL1W/rLxNpo74Cb2oiAT+9i+jCFUyD17WAXNIpWtQRBREQOjL1FS0
   JdFxw5iU9kyJm76BwvkA/O46DSwp68afptKK80/VNJCCb8eC8e5zeW9lQ
   zqaumNoxxALlSxYL+J/cIwbul7sad+Uga2RI+dpq5wrTRlhZbtWwFOnwD
   A==;
X-CSE-ConnectionGUID: xpXUiBjgTDasy7PC2nB2yw==
X-CSE-MsgGUID: fzcUqHSUTnWHYYPiL5JB3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59498996"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59498996"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:40:08 -0700
X-CSE-ConnectionGUID: SOEdh+wHSaK+CxGLX1i3iQ==
X-CSE-MsgGUID: aMHDDeshSFiiue5KPqmOeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137308267"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 May 2025 07:40:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD2Pt-000B3j-0v;
	Thu, 08 May 2025 14:40:05 +0000
Date: Thu, 8 May 2025 22:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for DRM_MIPI_DSI when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202505082242.jlhuMQkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   a1704bc2cb319a52d70b4e404e01d6429e154d29
commit: f7fba40921f00bc7b43021aee0efa8c7cef35601 [2/2] ANDROID: init: GKI: enable hidden configs for DRM
config: i386-kismet-CONFIG_DRM_MIPI_DSI-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250508/202505082242.jlhuMQkX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250508/202505082242.jlhuMQkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082242.jlhuMQkX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_MIPI_DSI when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - FUJITSU_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && INPUT [=y] && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] || ACPI_VIDEO [=n]=n)
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
     Selected by [y]:
     - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]
   
   WARNING: unmet direct dependencies detected for THERMAL_GOV_POWER_ALLOCATOR
     Depends on [n]: THERMAL [=y] && ENERGY_MODEL [=n]
     Selected by [y]:
     - THERMAL_DEFAULT_GOV_POWER_ALLOCATOR [=y] && <choice>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
