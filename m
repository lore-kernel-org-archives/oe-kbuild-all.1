Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21701BC3F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732791470; cv=none; b=lDkx9BJwxqRuuNcRY4zkQmu5AHR2qP7NYJsRCyNrEuoRJksSMZknT/pTZsFwjM88BrHNgVBO6KuwuVllLtvwxBBpVFNIEUc8zQwXYox+bZRQV/NRzeXLx/nZYFtpS8YmHTPYFHnfOrXTl4TXl4N6OBx50pcZdsQYDopYDsGGopg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732791470; c=relaxed/simple;
	bh=XlXNLY4BCd402vyeazGPLGY+oIfelwN1Hd9ubRT7eCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnomDU24I2AjH7hXAL8GMsYch9W5gQGVe9OymwXVnMK48MF7oiV7fEScjbNkEy8UPvL5qeasL7pTYQhIOD17j/wqtKxKAQSpIlYly+2Mf2vKE1jovSr6X4/YCF5c1KrlLd43FtF+ZaNcfkcZogDkrgWZHSYja0owqyswlzINi38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUJReebz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUJReebz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732791468; x=1764327468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XlXNLY4BCd402vyeazGPLGY+oIfelwN1Hd9ubRT7eCM=;
  b=WUJReebzfjhIgy36tm7ilYvk6/x3ieEFnBSez7ZZahTnOHiguER+OW7/
   L9xV8RpTcmDYth4xnIAkntpPsSpPuv2jujHQYzXAqtMLG80FQnYC/Cp/S
   KdGayJ4+hHNiwtN00XLmjp4MU6A5X72JV7jLOLv90389ZQBvSYvjoqxP+
   M9zKgjJOFHcFaEDN5GszLMbpSugcQKZOdp1+7Qhph8COCxfQj3wzDsQEw
   krrBwh0p5sUCEybPpHP6P15F7BaeDXvxIP80bc5QRu0ZNj56jMxdghmO1
   DfuOcifn7ALT6t5j227bJBmNh9Xh/Qz61CMhcGs27QlXOBDyA9V8GCHeh
   A==;
X-CSE-ConnectionGUID: POLCTx2DRMus6ZtyHVVmuA==
X-CSE-MsgGUID: nrx4rk7OTqCyB35yyyT+WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32766084"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32766084"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 02:57:48 -0800
X-CSE-ConnectionGUID: h+O85PXXQMaRtg3OY2QDtA==
X-CSE-MsgGUID: ztYaWdl1SNiSED1Y+CjmfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92139419"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Nov 2024 02:57:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGcDQ-0009V5-0U;
	Thu, 28 Nov 2024 10:57:44 +0000
Date: Thu, 28 Nov 2024 18:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315] arch/arm64/mm/init.c:784:17:
 error: 'mem_sleep_current' undeclared
Message-ID: <202411281817.JPJpYz6h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: fdda68feeca82610ccbcdcbda7250623a6d187d2 [1315/1315] arm64/ascend: Set mem_sleep_current to PM_SUSPEND_ON for ascend platform
config: arm64-randconfig-004-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281817.JPJpYz6h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281817.JPJpYz6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281817.JPJpYz6h-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_setup':
>> arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared (first use in this function)
     784 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:784:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/mem_sleep_current +784 arch/arm64/mm/init.c

   770	
   771	#ifdef CONFIG_ASCEND_FEATURES
   772	static int __init ascend_enable_setup(char *__unused)
   773	{
   774		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   775			enable_mmap_dvpp = 1;
   776	
   777		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   778			enable_iopf_hipri = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   781			enable_charge_mighp = 1;
   782	
   783		if (IS_ENABLED(CONFIG_SUSPEND))
 > 784			mem_sleep_current = PM_SUSPEND_ON;
   785	
   786		return 1;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
