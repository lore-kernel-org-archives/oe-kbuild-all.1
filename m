Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1433E8BEC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Oct 2025 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849301; cv=none; b=nZvbNidMCpz0pfjKeSFfYLe+JIbZ9lZ3y3S7oKpnOZLz/BMSkTrdTtSMVjqqxQTC+b0G3W0ygp9bQ1FyXceW9ouCp6K+LpdHgjpnDIsyqQ3QlmvUv1gkjDZ34xzmpNuaUUijRo/UYZRtpAd+WyUkiaTkHumM0T+QLqgok8nopOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849301; c=relaxed/simple;
	bh=kNi6bpNhmLA7ilohH0f/+TNGMWSi3azVo+kzcaHyz+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWLNPXrYkrGlVDzYokhOdtHRnsZnVx7utAE8/JJEgPkby/PZK1K3str1Dx5FqzoHZQROyy6dRv3UmrgCAiNFFNKLNzniYrA0qY1eKOJ5+fGYbpCp2gEmRzJBap7Aj8Q0HnW5NGdon/ExUQfCQ51kJ4Nn7+fA0CvSWvuXAtWbmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1BsBAKo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1BsBAKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759849299; x=1791385299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNi6bpNhmLA7ilohH0f/+TNGMWSi3azVo+kzcaHyz+M=;
  b=e1BsBAKoXtUUDh4lOVSQuFeAWxzbkZUjrTuDPzawSQXE52eAN4W4iHVX
   BJzRWBjWmz0sybjTV/pPiQ+oo763jqzpCgeus/H13qMUJJDhom3/J9fGZ
   wY5Q/0z90XmDgbLiFncr4VV+vnzAVGMHOWEB3akXjwSZUxcnO1p3b0MUU
   8+XTBoNhfUa+wn/+BP4kHCX72jPfSxrLHqZtic8JsdGg0iYAGiQLGggZA
   WYi46t/VOisfSB/X5SVMj/atZQjomiJWbwA7f/DRvbTDS0yxt53orihct
   5N1SBp6e4X7lFYMWjnPiF345DTYjpeVBwNIwuE6dKTeBkDH0dl5w6y9Sd
   w==;
X-CSE-ConnectionGUID: Gkp2vAEzQnmsS+cJ7iq6Cg==
X-CSE-MsgGUID: p0LKTBuGTJqZg3bs3em9Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62193897"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="62193897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 08:01:39 -0700
X-CSE-ConnectionGUID: 5kaIqKjrSVyQEuWifXnLYA==
X-CSE-MsgGUID: qYokSSMASzKGA5ie3Uyjlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="185332271"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2025 08:01:38 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v69C2-000000007vt-40Q1;
	Tue, 07 Oct 2025 15:01:34 +0000
Date: Tue, 7 Oct 2025 17:01:13 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] htmldocs:
 ./drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for
 drm_writeback_connector_init_with_encoder(). Prototype was for
 __drm_writeback_connector_init() instead
Message-ID: <202510071756.1jkuyWf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Louis,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   295aeee45ca2e1662d18078c103a62874ea54859
commit: 0d388fbee6e6a346d9849425ae6b94333226f69a [0/1] FROMGIT: drm: writeback: Create an helper for drm_writeback_connector initialization
reproduce: (https://download.01.org/0day-ci/archive/20251007/202510071756.1jkuyWf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510071756.1jkuyWf6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/netfs.h
   Error: Cannot open file ./include/linux/pipe_fs_i.h
   Error: Cannot open file ./include/linux/pipe_fs_i.h
   Error: Cannot open file ./include/linux/backlight.h
   Error: Cannot open file ./include/linux/backlight.h
>> ./drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
>> ./drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +233 ./drivers/gpu/drm/drm_writeback.c

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
