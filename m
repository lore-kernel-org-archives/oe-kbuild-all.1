Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC267C72
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707384998; cv=none; b=iytfCqHaxBUuoX9TSgs62Bnt8+eEBN690Adr5rJB2HiuxksBmkb6fErehqnct8vLjDQo8zrMyIkgQeCXyCS9y3gA7XC0sRZekLl7h1jrmcXw1GWdAjMOWo4FCDwMJAETB8hdua4pZrEPpCgioa7/6AprrfZf6DaaoXxgp/zBC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707384998; c=relaxed/simple;
	bh=74MJWg/+UMBRRxgM/R+3JUmcJ0y+wvOdw+XxYgkm62I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLwTAIiR7enb64gXz1Os6C/9gTmHLCljcKSA5xugcOHuN40yK0UoDzjPjBZ/dWpmGwwr016p1qA2t9M9fW96gmMnp225MIcNk72k7iDgkUI/HoRWQtIhJJGnaCiB3rXsSdsR5zZbQFXLyNLxVD3L4ADgBys/jz5m70ba8nsJ3f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEPuYtnb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEPuYtnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707384996; x=1738920996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74MJWg/+UMBRRxgM/R+3JUmcJ0y+wvOdw+XxYgkm62I=;
  b=fEPuYtnb1QyiMXwu1/yKB4K3rDCqCTc5LktCpkR4tnr7pAetgklRku1R
   6mFsaj/wTvlftvNqe2myG36VKQv7SUwTJmr9ZBHT4mi8IdXXixD7k2XLQ
   KZDQxvuBXj6hAhUB8YmXW3NtCcnlmQ7aLvENrEQsGczs3lMQdDE8FDtDr
   MPt6/teY9Fz4HBWqQLjJpDQTf9yp4hiSONNOLb4HdN2c2rJ+8C6TThCeY
   f7mu1jb0aOi+VJ6sVK1OfryouDbF+/gRbwK2DRGwzC6mRrKoEhdMTvQww
   W6lR26lcEiVyoI3VEJUTA436izwpDeSODFt/IrBVlJJjxRVyyrpYk+N9S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="5045786"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="5045786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 01:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1844363"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Feb 2024 01:36:34 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY0pb-0003Zs-2v;
	Thu, 08 Feb 2024 09:36:31 +0000
Date: Thu, 8 Feb 2024 17:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 17/17]
 drivers/gpu/drm/drm_privacy_screen_x86.c:166:6: warning: no previous
 prototype for 'privacy_screen_present'
Message-ID: <202402081759.DreefTIL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   663560d82c0a34a6b0a807e99ae307a0856c05dc
commit: 48cd81f48b5b21913f796d27b1a43b8dc04e6f2f [17/17] CHROMIUM: drm: privacy screen for drallion hack
config: x86_64-randconfig-161-20240207 (https://download.01.org/0day-ci/archive/20240208/202402081759.DreefTIL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081759.DreefTIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081759.DreefTIL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_privacy_screen_x86.c:166:6: warning: no previous prototype for 'privacy_screen_present' [-Wmissing-prototypes]
     166 | bool privacy_screen_present(struct device *privacy_screen)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/gpu/drm/drm_privacy_screen_x86.c:9:
   drivers/gpu/drm/drm_privacy_screen_x86.c: In function 'drm_drallion_privacy_screen_register':
>> drivers/gpu/drm/drm_privacy_screen_x86.c:200:37: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
     200 |                 dev_err(&adev->dev, "Error registering privacy-screen: %d\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpu/drm/drm_privacy_screen_x86.c:200:17: note: in expansion of macro 'dev_err'
     200 |                 dev_err(&adev->dev, "Error registering privacy-screen: %d\n",
         |                 ^~~~~~~
   drivers/gpu/drm/drm_privacy_screen_x86.c:200:73: note: format string is defined here
     200 |                 dev_err(&adev->dev, "Error registering privacy-screen: %d\n",
         |                                                                        ~^
         |                                                                         |
         |                                                                         int
         |                                                                        %ld


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
 > 200			dev_err(&adev->dev, "Error registering privacy-screen: %d\n",
   201					PTR_ERR(drm_privacy_screen));
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
