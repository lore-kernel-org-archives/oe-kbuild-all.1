Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B2259B4F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661323; cv=none; b=XBZt1v8YkLb7iUhQUFYQC/iVU3yLvJGR6kCxubuGXi/XqkESbiiFfzt2Tlae4whCRoUE6f+ccxckT8jkNHZ2jXhxoSi0DYNXJKafw96pQEUtV9Px479GNtXnU9l0jhIfLi2wSEfLWVY1MH8sJRWxUIQf/YNsov+eq7LnI9o+zlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661323; c=relaxed/simple;
	bh=VQSEZqtNZ7vVjfA4wnoXlpHMftDcqPa1/7R5lDIAnwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dp7i7TYhyhSO7YrdTpBuu+Itj9lxOf9yVp5qyVcxWtwYQbqTafZyTdBQJrvQ2EWMCRp0XhJ1pJ1xQPMO6BWCFb+RjsDZbmIxtGsoqIizDZbVokQZoh4iCezjNZYWxC6jcytGqJ7Wh9+XjiZkOlf17GxoGhvh3Eakr/R4t8/jux0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3Mi0d+i; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3Mi0d+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707661321; x=1739197321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQSEZqtNZ7vVjfA4wnoXlpHMftDcqPa1/7R5lDIAnwo=;
  b=k3Mi0d+iX2DYdMvMq+Yq5ENHNKzNsy0M3Ym+RuxQFJK8YR00k9qfGR4x
   j+Zh4FVtQj9NWlgA+V5FxfFvcDM4WH2tAiBmsc9N1lGV8JXXgQyJAp9FX
   7JQ25OO3sQ/0R4+gPN4agJDnuPh2FdIZovr3ZYw22nbFD70HwWExOJaBt
   MB3154I8aQFbckkIQ+E/5Yr1LPuhs7rF/gSAwf89qGO6300h6gjXXV52U
   JODlFDZq91In3MJHgJNQxdeDndwNfoFgkIbKJ7JyGmvgZRY2YQ32I2l9E
   zIGWlW2EkMwhmCI8qSHZz7AwrNNwgR9hlqXonOXFS6o3d01BpAbRA3aLY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="5443329"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="5443329"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 06:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="934867621"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="934867621"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2024 06:21:58 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZAiS-0006b0-1C;
	Sun, 11 Feb 2024 14:21:56 +0000
Date: Sun, 11 Feb 2024 22:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 17/17]
 drivers/gpu/drm/drm_privacy_screen_x86.c:69:15: sparse: sparse: symbol
 'privacy_screen_dev' was not declared. Should it be static?
Message-ID: <202402112204.SnaBulTU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   c8eb5e6a425e08d0bccf05a4215a5327c57c939c
commit: 48cd81f48b5b21913f796d27b1a43b8dc04e6f2f [17/17] CHROMIUM: drm: privacy screen for drallion hack
config: i386-randconfig-062-20240211 (https://download.01.org/0day-ci/archive/20240211/202402112204.SnaBulTU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402112204.SnaBulTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402112204.SnaBulTU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_privacy_screen_x86.c:69:15: sparse: sparse: symbol 'privacy_screen_dev' was not declared. Should it be static?
>> drivers/gpu/drm/drm_privacy_screen_x86.c:166:6: sparse: sparse: symbol 'privacy_screen_present' was not declared. Should it be static?

vim +/privacy_screen_dev +69 drivers/gpu/drm/drm_privacy_screen_x86.c

    64	
    65	static const guid_t chromeos_privacy_screen_dsm_guid =
    66		GUID_INIT(0xc7033113, 0x8720, 0x4ceb, 0x90, 0x90, 0x9d, 0x52, 0xb3,
    67			  0xe5, 0x2d, 0x73);
    68	
  > 69	struct device *privacy_screen_dev;
    70	
    71	static void chromeos_privacy_screen_get_hw_state(
    72		struct drm_privacy_screen *drm_privacy_screen)
    73	{
    74		union acpi_object *obj;
    75		acpi_handle handle;
    76		struct device *privacy_screen =
    77			drm_privacy_screen_get_drvdata(drm_privacy_screen);
    78	
    79		handle = acpi_device_handle(to_acpi_device(privacy_screen));
    80		obj = acpi_evaluate_dsm(handle,
    81					&chromeos_privacy_screen_dsm_guid,
    82					PRIV_SCRN_DSM_REVID,
    83					PRIV_SCRN_DSM_FN_GET_STATUS,
    84					NULL);
    85		if (!obj) {
    86			dev_err(privacy_screen,
    87				"_DSM failed to get privacy-screen state\n");
    88			return;
    89		}
    90	
    91		if (obj->type != ACPI_TYPE_INTEGER)
    92			dev_err(privacy_screen,
    93				"Bad _DSM to get privacy-screen state\n");
    94		else if (obj->integer.value == 1) {
    95			drm_privacy_screen->sw_state = PRIVACY_SCREEN_ENABLED;
    96			drm_privacy_screen->hw_state = PRIVACY_SCREEN_ENABLED;
    97	
    98		} else {
    99			drm_privacy_screen->sw_state = PRIVACY_SCREEN_DISABLED;
   100			drm_privacy_screen->hw_state = PRIVACY_SCREEN_DISABLED;
   101		}
   102		ACPI_FREE(obj);
   103	}
   104	static int chromeos_privacy_screen_set_sw_state(
   105		struct drm_privacy_screen *drm_privacy_screen,
   106		enum drm_privacy_screen_status state)
   107	{
   108		union acpi_object *obj = NULL;
   109		acpi_handle handle;
   110		struct device *privacy_screen =
   111			drm_privacy_screen_get_drvdata(drm_privacy_screen);
   112	
   113		handle = acpi_device_handle(to_acpi_device(privacy_screen));
   114	
   115		if (state == PRIVACY_SCREEN_DISABLED) {
   116			obj = acpi_evaluate_dsm(
   117				handle, &chromeos_privacy_screen_dsm_guid,
   118				PRIV_SCRN_DSM_REVID,
   119				PRIV_SCRN_DSM_FN_DISABLE,
   120				NULL);
   121		} else if (state == PRIVACY_SCREEN_ENABLED) {
   122			obj = acpi_evaluate_dsm(
   123				handle,
   124				&chromeos_privacy_screen_dsm_guid,
   125				PRIV_SCRN_DSM_REVID,
   126				PRIV_SCRN_DSM_FN_ENABLE,
   127				NULL);
   128		} else {
   129			dev_err(privacy_screen,
   130				"Bad attempt to set privacy-screen status to %u\n",
   131				state);
   132			return -EINVAL;
   133		}
   134	
   135		if (!obj) {
   136			dev_err(privacy_screen,
   137				"_DSM failed to set privacy-screen state\n");
   138			return -EIO;
   139		}
   140	
   141		drm_privacy_screen->sw_state = state;
   142		drm_privacy_screen->hw_state = state;
   143		ACPI_FREE(obj);
   144		return 0;
   145	}
   146	
   147	static const struct drm_privacy_screen_ops chromeos_privacy_screen_ops = {
   148		.get_hw_state = chromeos_privacy_screen_get_hw_state,
   149		.set_sw_state = chromeos_privacy_screen_set_sw_state,
   150	};
   151	
   152	static int match_privacy_screen(struct device *dev, void *data)
   153	{
   154		struct acpi_device *adev = to_acpi_device(dev);
   155	
   156		u64 addr = acpi_device_adr(adev);
   157	
   158		if (addr == DRALLION_PRIVACY_SCREEN_ADDR) {
   159			privacy_screen_dev = dev;
   160			return 1;
   161		}
   162	
   163		return 0;
   164	}
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
