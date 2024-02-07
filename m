Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA001804F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707326049; cv=none; b=Cm7aUcVaafFWnN2r2ZyL8e9EUWeYHmdE9M3e90XT7X5inIkrFpeqnh8Jrcwp8SbFiAm2QdWVgTxTzbFUjHtsuvFDi7l8uuwST7ewjc4uCTC6zI0ph8xvHVkqWE0g9h/apzvqdbDFWduZ9Pbo9wqpYtGjPxzMxo1Ztg51LoSB+UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707326049; c=relaxed/simple;
	bh=96Qii9wcZwJGU2wB1sGv37Qu8L1CdKHdH/K+P/ejyEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8oK1mOqCfmOmm7BlSz/gvhKev4JqR+9JiPNQD7ZaHeXS7E95C+I/PwxXQPDAA90aWeAh6o/uSjFtUcQrDUq8o3RFVkCuFPOad7yot5cZlsFlf6pRXfn1tKnaipbkYTYhVWqXFyJDQI4X/U3yrr8eb6xzgWt8d7meg5rC0K/Ymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2Z1rK9l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2Z1rK9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707326048; x=1738862048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=96Qii9wcZwJGU2wB1sGv37Qu8L1CdKHdH/K+P/ejyEo=;
  b=h2Z1rK9lYWtICPx392YTXthgK9CCRUlWVw8ksvssBxgMRd3yoEOICjan
   UwKEivtkivQqrLd2SYbnOkVzq5C9X0QZY0pS57xXJIn85JDcfaS4qAkQB
   MyltV7MNLkVMrJ6OxJgORakMZab5lSYyYbFQXbjNPt4ENxFAVs5kgDTxX
   lVsO96Rs0hD/dxHgrMGe3llnSEiTdW9igKJILKwQCMGhigsIR6rxDXaz+
   y/reeRqkYWtFim1sPmKFcA0L6u/Uf/zHs7yS17JWMFc9B9BlfMd7n2Agb
   vQk6/y5JdxVC6XaWuTDkHY4M6B+AtjCav8FGSTVPXV//mmxylpInBG0sM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4847685"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="4847685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 09:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6036441"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2024 09:14:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXlUp-0002s8-0p;
	Wed, 07 Feb 2024 17:14:03 +0000
Date: Thu, 8 Feb 2024 01:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 17/17]
 drivers/gpu/drm/drm_privacy_screen_x86.c:166:6: warning: no previous
 prototype for function 'privacy_screen_present'
Message-ID: <202402080159.UjfReleG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   1e35ac2e0cad39d30875b8b3f321bca9f02b2917
commit: 48cd81f48b5b21913f796d27b1a43b8dc04e6f2f [17/17] CHROMIUM: drm: privacy screen for drallion hack
config: i386-buildonly-randconfig-003-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080159.UjfReleG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080159.UjfReleG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080159.UjfReleG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_privacy_screen_x86.c:166:6: warning: no previous prototype for function 'privacy_screen_present' [-Wmissing-prototypes]
     166 | bool privacy_screen_present(struct device *privacy_screen)
         |      ^
   drivers/gpu/drm/drm_privacy_screen_x86.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | bool privacy_screen_present(struct device *privacy_screen)
         | ^
         | static 
>> drivers/gpu/drm/drm_privacy_screen_x86.c:201:5: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
     200 |                 dev_err(&adev->dev, "Error registering privacy-screen: %d\n",
         |                                                                        ~~
         |                                                                        %ld
     201 |                                 PTR_ERR(drm_privacy_screen));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +/privacy_screen_present +166 drivers/gpu/drm/drm_privacy_screen_x86.c

   165	
 > 166	bool privacy_screen_present(struct device *privacy_screen)
   167	{
   168		acpi_handle handle = acpi_device_handle(to_acpi_device(privacy_screen));
   169	
   170		if (!handle)
   171			return false;
   172	
   173		if (!acpi_check_dsm(handle, &chromeos_privacy_screen_dsm_guid, 1,
   174				    BIT(PRIV_SCRN_DSM_FN_GET_STATUS) |
   175					BIT(PRIV_SCRN_DSM_FN_ENABLE) |
   176					BIT(PRIV_SCRN_DSM_FN_DISABLE)))
   177			return false;
   178	
   179		return true;
   180	}
   181	
   182	static bool drm_drallion_privacy_screen_register(struct device *dev)
   183	{
   184	
   185		struct acpi_device *adev = to_acpi_device(dev);
   186	
   187		struct drm_privacy_screen *drm_privacy_screen;
   188	
   189		if (strcmp(dev_name(&adev->dev), "device:05") != 0) {
   190			dev_err(&adev->dev, "Unexpected device name for privacy screen: %s\n",
   191					dev_name(&adev->dev));
   192	
   193			return false;
   194		}
   195	
   196		drm_privacy_screen = drm_privacy_screen_register(
   197			&adev->dev, &chromeos_privacy_screen_ops, &adev->dev);
   198	
   199		if (IS_ERR(drm_privacy_screen)) {
   200			dev_err(&adev->dev, "Error registering privacy-screen: %d\n",
 > 201					PTR_ERR(drm_privacy_screen));
   202			return false;
   203		}
   204	
   205		adev->driver_data = drm_privacy_screen;
   206		dev_info(&adev->dev, "registered privacy-screen '%s'\n",
   207			 dev_name(&drm_privacy_screen->dev));
   208	
   209		return true;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
