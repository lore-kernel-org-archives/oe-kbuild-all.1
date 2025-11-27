Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4031EA7CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 05:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764221331; cv=none; b=TXNJ13paD/ueah/OmMClUdfLNXq5W9eVNuViCIJ51sf230aa7gyIjOfcVBLYzyQ6H4kyCmM2AU1YtVsXf5fydxHr2kxDGEcoKrep7lm3WRuYLNoCwZlTHPWM3hwfgGk/hUragyf2z10dxzelOV3OC5v5ShuQn3YOg6Wlx1dhAOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764221331; c=relaxed/simple;
	bh=atXJCj6/py3h7ZAKpMvIUMy5JxUpLWKJU+BPTsKDbIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+AknHPLeFTtYwX4D+g7BpY8dgEHx/SdrqZQz6tGLbH/J5i52VWfU0ce+7DlErSvxrXkdID6k17BQgqU3zO1ehYk/+z+ybhRQBUOToq9OofwZU6tKkQ9AkEmntT2yslZ3C9UKzhpxBZHDTgk5RjIigB4Kc8e0wWH55Ppwh1H5ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4iVHrRK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4iVHrRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764221330; x=1795757330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=atXJCj6/py3h7ZAKpMvIUMy5JxUpLWKJU+BPTsKDbIs=;
  b=O4iVHrRKdbwyhZTiBc4ar1RDf0n1JW1EZvtz0oNQROA9zhbpdjqO4HEP
   SClH/iFNRflr3i2LvQhGgMepXxSZUfrqOzFeRfygjO+3ZsudH6ISVK/vV
   xK2O/RS+SSERvzEJ4Soi9L9hC3ppvt6zTjRyGpWzEpnIpSnMyuma9P6oV
   cbbub0RPjdCbrgriCD90MSe7/MiJsUBtfzwQ7CNrTRSX2utPPYZRzRy+f
   wHyz09TfoeJOhgrIVxl81ySBAzSwc+0kRzMSyWILV2mbpRVqkp7/f62Sf
   0xUodzkhNWttPLLT8xgaq277Vi1cO6/1egQNFHc6KIo/ng/AEPDwYTHv7
   w==;
X-CSE-ConnectionGUID: gY8RF+9cTa6yslyCr7nhww==
X-CSE-MsgGUID: w4EQGBAASRi/EDIN9BJkKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77628323"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="77628323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 21:28:49 -0800
X-CSE-ConnectionGUID: dasVMTU/RiWOTolc8XWOIQ==
X-CSE-MsgGUID: jIyTH9k4QcO4/SgDIaMa5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="198088018"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 21:28:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOUYd-000000003kd-1CSn;
	Thu, 27 Nov 2025 05:28:43 +0000
Date: Thu, 27 Nov 2025 13:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, aravind.iddamsetty@linux.intel.com,
	anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com, lukas@wunner.de,
	simona.vetter@ffwll.ch, airlied@gmail.com, lucas.demarchi@intel.com,
	Riana Tauro <riana.tauro@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
Message-ID: <202511271357.7pA8zqx0-lkp@intel.com>
References: <20251126143652.2843242-9-riana.tauro@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126143652.2843242-9-riana.tauro@intel.com>

Hi Riana,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master drm-exynos/exynos-drm-next v6.18-rc7 next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20251126-220942
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126143652.2843242-9-riana.tauro%40intel.com
patch subject: [PATCH v2 3/4] drm/xe/xe_hw_error: Add support for GT hardware errors
config: riscv-randconfig-r061-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271357.7pA8zqx0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271357.7pA8zqx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271357.7pA8zqx0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/bitops.h:19,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/linux/configfs.h:25,
                    from include/linux/fault-inject.h:14,
                    from drivers/gpu/drm/xe/xe_hw_error.c:6:
>> include/asm-generic/bitops/__ffs.h:45:21: error: nonconstant array index in initializer
      45 | #define __ffs(word) generic___ffs(word)
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:31:10: note: in expansion of macro '__ffs'
      31 |         [__ffs(_bit)] = index
         |          ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:34:9: note: in expansion of macro 'ERR_INDEX'
      34 |         ERR_INDEX(XE_GT_ERROR, DRM_XE_GENL_CORE_COMPUTE),
         |         ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:45:21: note: (near initialization for 'xe_hw_error_map')
      45 | #define __ffs(word) generic___ffs(word)
         |                     ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:31:10: note: in expansion of macro '__ffs'
      31 |         [__ffs(_bit)] = index
         |          ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:34:9: note: in expansion of macro 'ERR_INDEX'
      34 |         ERR_INDEX(XE_GT_ERROR, DRM_XE_GENL_CORE_COMPUTE),
         |         ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=y] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


vim +45 include/asm-generic/bitops/__ffs.h

c1226a005ec400 Akinobu Mita 2006-03-26  43  
cb4ede926134a6 Xiao Wang    2023-11-12  44  #ifndef __HAVE_ARCH___FFS
cb4ede926134a6 Xiao Wang    2023-11-12 @45  #define __ffs(word) generic___ffs(word)
cb4ede926134a6 Xiao Wang    2023-11-12  46  #endif
cb4ede926134a6 Xiao Wang    2023-11-12  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
