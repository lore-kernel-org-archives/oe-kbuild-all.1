Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3E309F02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535212; cv=none; b=XZNlwexgFtfURiol4QxmiwONfCqegkYJKBErGrADEIeshcSlFSoa6JjGxmeZG0kuPo86NjaVjPyzS/aXMJSPnkmg+1skS7XaNAu5UwhyfUzKLaPOU0OV+uSxhzG7kcn9yPc4bHJZ+vU8n6B+zKA/tC+qaN02TnaYV9jaWbiDYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535212; c=relaxed/simple;
	bh=ojXsWPARX9TbXAD9Mu+W66BD5Jy/b9Cc6dleoCp8xzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZ2wt8hpb6jmZe4ThnIg3Lz8UAJZ83PKgiEBEAUnGzgjVsKDU2y6+ZxJep975rohjJK9SUs2HDz0zriBRpBw+Snq3/9QGoqxsA3LuiNDNaJ3C6Gx73+z6tEzKQvpCFJ2yKwt/l25bO3XoJmD/NB12nE2zzJhEOA+rhx2XWiIVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzHOjSHq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzHOjSHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765535210; x=1797071210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojXsWPARX9TbXAD9Mu+W66BD5Jy/b9Cc6dleoCp8xzM=;
  b=fzHOjSHq2riyxMA/0/fuJJN19AM5iYA720yHlXHB6He+XH0O/VLWsURX
   cYJdCiI22w0g/sNEDRy05DklUCm0tgZjHCaaFet7rsP2uuwg/Ge1LTUqO
   KaojssJsgKJVxiytKaZpYl4BQ1mkFXHzcZ4PZ/5iGa9aAZ68wx6/iSZcJ
   GdzGSvNaV3lecv6t4Hy7jjkjmP3tljR0tM+mkaR5klgl2DkLQ39ubSjRR
   iUpqa2FuTOkzDq6Rfg39/UyU7T3llsyC4Ga7v2gFyl45S4XPoTtI77aSk
   Dj3J+U7QsqM0SCc4rD31JIFOw0AgaSdSBy85vk5SlEjYlpeUf7O76dIN+
   Q==;
X-CSE-ConnectionGUID: CpNfetZXT5u0WlbUq2g/tQ==
X-CSE-MsgGUID: 3lUFs57AToCw5aTci4WPzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78990403"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78990403"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:26:47 -0800
X-CSE-ConnectionGUID: 3c3eJvYnTzmJLh33fjWusQ==
X-CSE-MsgGUID: FDjGv7ShQsG04cUciYEErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="228107481"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 02:26:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0MG-000000005vX-0Z3J;
	Fri, 12 Dec 2025 10:26:44 +0000
Date: Fri, 12 Dec 2025 18:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for
 drm_writeback_connector_init_with_encoder(). Prototype was for
 __drm_writeback_connector_init() instead
Message-ID: <202512121825.c1paRwGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: 0d388fbee6e6a346d9849425ae6b94333226f69a [0/1] FROMGIT: drm: writeback: Create an helper for drm_writeback_connector initialization
config: x86_64-randconfig-104-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121825.c1paRwGw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121825.c1paRwGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121825.c1paRwGw-lkp@intel.com/

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
