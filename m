Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3481EA65
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759198126; cv=none; b=qeuyl9UQS99JozzYr3adh+Y0MkDRZgd/PsNm4BixAwAYZbgE21oCu+5rRuLKYyu9wFrwxsenmsjDu2u2a9zqp1SIdBDqfNk7pEbexIQg+JO5hUwHHSwLGoFCiEzDozphzciCKZaCf4q7NuCUiMwwYowIKKDQUfjd/KuW9Uc+7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759198126; c=relaxed/simple;
	bh=QLcP8VioUUVE468697aTbUKcfrRDxRDEldaMyrFQrsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jn5aEoiNUMHN+K+9xKacSX/CBsw+qrO1yRUqyvsAr5YoprfuAHPwCp8Exfzas/+qv6S9YdO0X5QGx8w2FykhcDDCwDKslDhtGQlmrraxynzBB6N385aR1SexAHj8u10YkJkFtwRXyNOHhs9x/IJ2yk4R5DHrnqI2tor9ZHEzGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B55gmxDI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B55gmxDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759198124; x=1790734124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QLcP8VioUUVE468697aTbUKcfrRDxRDEldaMyrFQrsw=;
  b=B55gmxDIE4Z0b9CB72DtVhLoTeDB/k2DZCOm8BFJe80f+bZ36Ebr72H+
   9VnW6X2x6ltQLheJrWypXXAPC3lsf6Syp/nJF+efULjmrMCGeG1CMDQ6S
   V10tz1borCgi6qabdIC6Y/F85NaFHhzyYY/9VmAEUCmIWOYy55Pl+Yh0R
   k1JPt7TcwxA9eBpiBnuZerYmR/H4OT8KAFOjlUzScrTwHUaQFcqjEILKA
   e0heCbzzdeAM9UlL2+FMMHpUuKl9iITYxGH8RkhdwM2/m4DUcXbKIblFi
   i9GJtLySy94qrKmvXDm5RL2QcuHi5NLaUjVBFYdPoDlspqrj78cxKLrhu
   w==;
X-CSE-ConnectionGUID: cVpPypImS32GCOTP7HF1ig==
X-CSE-MsgGUID: rbf1oxHTQfS9mXDE6Hn47w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72063914"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="72063914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 19:08:41 -0700
X-CSE-ConnectionGUID: gRB5QKrVQEi5uUCj3oml3Q==
X-CSE-MsgGUID: /m3pSyIfSVWfun+PqsZzQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="209339801"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2025 19:08:40 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3PnC-0000pD-0f;
	Tue, 30 Sep 2025 02:08:38 +0000
Date: Tue, 30 Sep 2025 10:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Introduce the usage of drm_ras with
 supported HW errors
Message-ID: <202509300919.eiP7GKSP-lkp@intel.com>
References: <20250929214415.326414-6-rodrigo.vivi@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929214415.326414-6-rodrigo.vivi@intel.com>

Hi Rodrigo,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-misc/drm-misc-next drm-tip/drm-tip next-20250929]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Vivi/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20250930-054726
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250929214415.326414-6-rodrigo.vivi%40intel.com
patch subject: [PATCH 2/2] drm/xe: Introduce the usage of drm_ras with supported HW errors
config: parisc-randconfig-002-20250930 (https://download.01.org/0day-ci/archive/20250930/202509300919.eiP7GKSP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300919.eiP7GKSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300919.eiP7GKSP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_hw_error.c:8:
>> include/linux/find.h:6:2: error: #error only <linux/bitmap.h> can be included directly
       6 | #error only <linux/bitmap.h> can be included directly
         |  ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:64:2: note: in expansion of macro 'ERR_INFO'
      64 |  ERR_INFO(XE_GT_ERROR, "GT Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:64:2: note: in expansion of macro 'ERR_INFO'
      64 |  ERR_INFO(XE_GT_ERROR, "GT Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:65:2: note: in expansion of macro 'ERR_INFO'
      65 |  ERR_INFO(XE_SGGI_DATA_PARITY_ERROR, "SGGI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:65:2: note: in expansion of macro 'ERR_INFO'
      65 |  ERR_INFO(XE_SGGI_DATA_PARITY_ERROR, "SGGI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:66:2: note: in expansion of macro 'ERR_INFO'
      66 |  ERR_INFO(XE_DISPLAY_ERROR, "Display Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:66:2: note: in expansion of macro 'ERR_INFO'
      66 |  ERR_INFO(XE_DISPLAY_ERROR, "Display Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:67:2: note: in expansion of macro 'ERR_INFO'
      67 |  ERR_INFO(XE_SGDI_DATA_PARITY_ERROR, "SGDI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:67:2: note: in expansion of macro 'ERR_INFO'
      67 |  ERR_INFO(XE_SGDI_DATA_PARITY_ERROR, "SGDI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:68:2: note: in expansion of macro 'ERR_INFO'
      68 |  ERR_INFO(XE_GSC_ERROR, "GSC Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:68:2: note: in expansion of macro 'ERR_INFO'
      68 |  ERR_INFO(XE_GSC_ERROR, "GSC Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:69:2: note: in expansion of macro 'ERR_INFO'
      69 |  ERR_INFO(XE_SGLI_DATA_PARITY_ERROR, "SGLI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:69:2: note: in expansion of macro 'ERR_INFO'
      69 |  ERR_INFO(XE_SGLI_DATA_PARITY_ERROR, "SGLI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:70:2: note: in expansion of macro 'ERR_INFO'
      70 |  ERR_INFO(XE_SGUNIT_ERROR, "SG Unit Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:70:2: note: in expansion of macro 'ERR_INFO'
      70 |  ERR_INFO(XE_SGUNIT_ERROR, "SG Unit Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:71:2: note: in expansion of macro 'ERR_INFO'
      71 |  ERR_INFO(XE_SGCI_DATA_PARITY_ERROR, "SGCI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: note: (near initialization for 'dev_err_stat_nonfatal_reg')
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }
         |   ^~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:71:2: note: in expansion of macro 'ERR_INFO'
      71 |  ERR_INFO(XE_SGCI_DATA_PARITY_ERROR, "SGCI Data Parity Error"),
         |  ^~~~~~~~
   drivers/gpu/drm/xe/xe_hw_error.c:61:3: error: nonconstant array index in initializer
      61 |  [__ffs(_bit)] = { .name = _name, .counter = ATOMIC64_INIT(0) }


vim +6 include/linux/find.h

47d8c15615c0a2 Yury Norov 2021-08-14  4  
47d8c15615c0a2 Yury Norov 2021-08-14  5  #ifndef __LINUX_BITMAP_H
47d8c15615c0a2 Yury Norov 2021-08-14 @6  #error only <linux/bitmap.h> can be included directly
47d8c15615c0a2 Yury Norov 2021-08-14  7  #endif
47d8c15615c0a2 Yury Norov 2021-08-14  8  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
