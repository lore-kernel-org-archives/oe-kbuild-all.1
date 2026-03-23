Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC13C5DD0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 18:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289677; cv=none; b=IufZ9y+txlU34dO1uCQiRLwehpW5HTSdwFH3umDh1Jvja461zGM0ppMdTHXJtaGIfS0jDoDXn2XzDh7e0rQH7i8+hgFGEVPLBNiwussd1jIZc52zKrMY88txHUWKQmdE2SRqHMKQQWvSNfC/zc9sY562swJFprBHQj7K5hrHqlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289677; c=relaxed/simple;
	bh=MF6WFEzl2o/v+fZ0btlHXRJsVaahX5C3Ic8AN5tjKU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mRogq/j18XTctGV4N83thZdhZFl52nriG4BixEXZKigNGlj3318NneJtgpuv6frndGM473T4SBRbQaXs84actJkOCsLfK4p4via+lIyzYDYPNyFQaZWqOksXbKdqPM+dXDh/J5w/NWr5hB3phOy0fcVtK2hcuTvTZ4y6mEUnUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9j9mFu1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9j9mFu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774289675; x=1805825675;
  h=date:from:to:cc:subject:message-id;
  bh=MF6WFEzl2o/v+fZ0btlHXRJsVaahX5C3Ic8AN5tjKU0=;
  b=i9j9mFu1JrC5oMi/EXynqxqQ734/UX8mY2gQ05/ohobx1y4/AiJi+pbC
   1YvLV5F0CUWU/pPLl7axiGKULfxhyDyPzzxV+KCw5kOhtTYBG7sojmVd2
   ty8iWmMGnTSQbC78wAKYIQFzAjFyW+O02e2MKN+VwZC5YTUCfj89bzc65
   dWx6+1k/cGkig47gUCdL8H4++lD7TnPYHRoG6F79tdSpGQbI4jyVvK2LR
   koCWlMCOlQRZtVZZza5xba+ZF7IsGOYDsvzVtfjFz/6hpHQcKhhiAhpSN
   Ao71/jlowyrj680h2yiwsyWPkWUdbwMy9fyqt69uesQMsE3TrZ4WJKnHG
   g==;
X-CSE-ConnectionGUID: CS2Iz87FRsyFvHO9xDOm4w==
X-CSE-MsgGUID: VOvsouc1SFGJNYa8CWu6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79206034"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79206034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 11:14:34 -0700
X-CSE-ConnectionGUID: jN2rviOaSVeDYec54BUAGw==
X-CSE-MsgGUID: e67hNsMMSpKXXhMvnKS+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="262018509"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Mar 2026 11:14:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4jnK-0000000032Z-1DGz;
	Mon, 23 Mar 2026 18:14:30 +0000
Date: Tue, 24 Mar 2026 02:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/5]
 drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for
 drm_writeback_connector_init_with_encoder(). Prototype was for
 __drm_writeback_connector_init() instead
Message-ID: <202603240257.XvrFSz7G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Louis,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   037660b116cb733997f7aac8aa34d76a7da7905e
commit: 0d388fbee6e6a346d9849425ae6b94333226f69a [0/5] FROMGIT: drm: writeback: Create an helper for drm_writeback_connector initialization
config: x86_64-buildonly-randconfig-005-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240257.XvrFSz7G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240257.XvrFSz7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240257.XvrFSz7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead


vim +233 drivers/gpu/drm/drm_writeback.c

7933aecffa28a1 Abhinav Kumar 2022-04-26  204  
7933aecffa28a1 Abhinav Kumar 2022-04-26  205  /**
7933aecffa28a1 Abhinav Kumar 2022-04-26  206   * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
7933aecffa28a1 Abhinav Kumar 2022-04-26  207   * a custom encoder
7933aecffa28a1 Abhinav Kumar 2022-04-26  208   *
7933aecffa28a1 Abhinav Kumar 2022-04-26  209   * @dev: DRM device
7933aecffa28a1 Abhinav Kumar 2022-04-26  210   * @wb_connector: Writeback connector to initialize
7933aecffa28a1 Abhinav Kumar 2022-04-26  211   * @enc: handle to the already initialized drm encoder
7933aecffa28a1 Abhinav Kumar 2022-04-26  212   * @formats: Array of supported pixel formats for the writeback engine
7933aecffa28a1 Abhinav Kumar 2022-04-26  213   * @n_formats: Length of the formats array
7933aecffa28a1 Abhinav Kumar 2022-04-26  214   *
7933aecffa28a1 Abhinav Kumar 2022-04-26  215   * This function creates the writeback-connector-specific properties if they
7933aecffa28a1 Abhinav Kumar 2022-04-26  216   * have not been already created, initializes the connector as
7933aecffa28a1 Abhinav Kumar 2022-04-26  217   * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
7933aecffa28a1 Abhinav Kumar 2022-04-26  218   * values.
7933aecffa28a1 Abhinav Kumar 2022-04-26  219   *
7933aecffa28a1 Abhinav Kumar 2022-04-26  220   * This function assumes that the drm_writeback_connector's encoder has already been
7933aecffa28a1 Abhinav Kumar 2022-04-26  221   * created and initialized before invoking this function.
7933aecffa28a1 Abhinav Kumar 2022-04-26  222   *
7933aecffa28a1 Abhinav Kumar 2022-04-26  223   * In addition, this function also assumes that callers of this API will manage
7933aecffa28a1 Abhinav Kumar 2022-04-26  224   * assigning the encoder helper functions, possible_crtcs and any other encoder
7933aecffa28a1 Abhinav Kumar 2022-04-26  225   * specific operation.
7933aecffa28a1 Abhinav Kumar 2022-04-26  226   *
7933aecffa28a1 Abhinav Kumar 2022-04-26  227   * Returns: 0 on success, or a negative error code
7933aecffa28a1 Abhinav Kumar 2022-04-26  228   */
0d388fbee6e6a3 Louis Chauvet 2025-01-16  229  static int __drm_writeback_connector_init(struct drm_device *dev,
0d388fbee6e6a3 Louis Chauvet 2025-01-16  230  					  struct drm_writeback_connector *wb_connector,
0d388fbee6e6a3 Louis Chauvet 2025-01-16  231  					  struct drm_encoder *enc, const u32 *formats,
7933aecffa28a1 Abhinav Kumar 2022-04-26  232  					  int n_formats)
935774cd71fe60 Brian Starkey 2017-03-29 @233  {
935774cd71fe60 Brian Starkey 2017-03-29  234  	struct drm_connector *connector = &wb_connector->base;
935774cd71fe60 Brian Starkey 2017-03-29  235  	struct drm_mode_config *config = &dev->mode_config;
0d388fbee6e6a3 Louis Chauvet 2025-01-16  236  	struct drm_property_blob *blob;
935774cd71fe60 Brian Starkey 2017-03-29  237  	int ret = create_writeback_properties(dev);
935774cd71fe60 Brian Starkey 2017-03-29  238  
935774cd71fe60 Brian Starkey 2017-03-29  239  	if (ret != 0)
935774cd71fe60 Brian Starkey 2017-03-29  240  		return ret;
935774cd71fe60 Brian Starkey 2017-03-29  241  
935774cd71fe60 Brian Starkey 2017-03-29  242  	connector->interlace_allowed = 0;
935774cd71fe60 Brian Starkey 2017-03-29  243  
7933aecffa28a1 Abhinav Kumar 2022-04-26  244  	ret = drm_connector_attach_encoder(connector, enc);
935774cd71fe60 Brian Starkey 2017-03-29  245  	if (ret)
0d388fbee6e6a3 Louis Chauvet 2025-01-16  246  		return ret;
0d388fbee6e6a3 Louis Chauvet 2025-01-16  247  
0d388fbee6e6a3 Louis Chauvet 2025-01-16  248  	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
0d388fbee6e6a3 Louis Chauvet 2025-01-16  249  					formats);
0d388fbee6e6a3 Louis Chauvet 2025-01-16  250  	if (IS_ERR(blob))
0d388fbee6e6a3 Louis Chauvet 2025-01-16  251  		return PTR_ERR(blob);
935774cd71fe60 Brian Starkey 2017-03-29  252  
935774cd71fe60 Brian Starkey 2017-03-29  253  	INIT_LIST_HEAD(&wb_connector->job_queue);
935774cd71fe60 Brian Starkey 2017-03-29  254  	spin_lock_init(&wb_connector->job_lock);
935774cd71fe60 Brian Starkey 2017-03-29  255  
b13cc8dd588434 Brian Starkey 2017-03-29  256  	wb_connector->fence_context = dma_fence_context_alloc(1);
b13cc8dd588434 Brian Starkey 2017-03-29  257  	spin_lock_init(&wb_connector->fence_lock);
b13cc8dd588434 Brian Starkey 2017-03-29  258  	snprintf(wb_connector->timeline_name,
b13cc8dd588434 Brian Starkey 2017-03-29  259  		 sizeof(wb_connector->timeline_name),
b13cc8dd588434 Brian Starkey 2017-03-29  260  		 "CONNECTOR:%d-%s", connector->base.id, connector->name);
b13cc8dd588434 Brian Starkey 2017-03-29  261  
b13cc8dd588434 Brian Starkey 2017-03-29  262  	drm_object_attach_property(&connector->base,
b13cc8dd588434 Brian Starkey 2017-03-29  263  				   config->writeback_out_fence_ptr_property, 0);
b13cc8dd588434 Brian Starkey 2017-03-29  264  
935774cd71fe60 Brian Starkey 2017-03-29  265  	drm_object_attach_property(&connector->base,
935774cd71fe60 Brian Starkey 2017-03-29  266  				   config->writeback_fb_id_property, 0);
935774cd71fe60 Brian Starkey 2017-03-29  267  
935774cd71fe60 Brian Starkey 2017-03-29  268  	drm_object_attach_property(&connector->base,
935774cd71fe60 Brian Starkey 2017-03-29  269  				   config->writeback_pixel_formats_property,
935774cd71fe60 Brian Starkey 2017-03-29  270  				   blob->base.id);
935774cd71fe60 Brian Starkey 2017-03-29  271  	wb_connector->pixel_formats_blob_ptr = blob;
935774cd71fe60 Brian Starkey 2017-03-29  272  
935774cd71fe60 Brian Starkey 2017-03-29  273  	return 0;
0d388fbee6e6a3 Louis Chauvet 2025-01-16  274  }
0d388fbee6e6a3 Louis Chauvet 2025-01-16  275  

:::::: The code at line 233 was first introduced by commit
:::::: 935774cd71fe604cc8ed24adcb507d7784255672 drm: Add writeback connector type

:::::: TO: Brian Starkey <brian.starkey@arm.com>
:::::: CC: Liviu Dudau <Liviu.Dudau@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
