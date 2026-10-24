Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792855993;
	b=2Vv7wJfFgMTaRKjEyVvCn6n7BVmG6Df/Ln5SR117OfQOQIcnSeSq0WtFaMtzNaKwrMb2
	 z6cUw3KFZPU2IkDJHBG1mDXrrT6pxgzzqqBWRe5r68rKnoCuD5JRuggKnU6tWgrybHJuV
	 RO+3DutWi8+m42osOAC5qkmv2Qqkydlp0K79f+BIBrtreH71pW63h6qQrM9wh6Pzl8k6S
	 C7U+ckARP1BLIjhvjqWMj5z3goLOuJTmavLOY/s209lDz9N0Pssl3EFXKgcP8++OTdO0r
	 9groJT90Eey71JX4W+t1y7pg9cHhmKqepEXCc5Edf8hhtwB9golPgux/kSUNs+cBLow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792855993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HOhKN37yEh1dRfFjfln8zRcqdv+HgE5z7+WKrHYV4aY=;
	b=pqc20p0zFoS2qlfmESar+BKGde0Ym7vbtuiA92g9ITKhYbmCwpvRw3vLtXWJDByvBirp
	 VwtLRQYuoc22nbYVjVrq2IxbxijiDAO/f1zJ40Tch1CssWeqlM6CefIUxyEADfCpsDscf
	 9CPxg4IW6Cg9nIKyK3lEi/HsVLbuksb/61MY55wpMzZrkYYXq7fgNWupdo6DLg0Z+HvGY
	 FolkFZeo5sMxIvYcjAKzgeJwwXnGN7tM1JcEYFzwwThUUZ2vDBVTW3rydivB+Yg0YNz/u
	 YhYlKwkDGHGJj7dsD0fbFp09Fu36/Cw1Xwdcys1RfXTGbWYca1WYVz4kJPU78O8fkaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBPLGXLq;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F43606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F43606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBPLGXLq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792855990; x=1824391990;
  h=date:from:to:cc:subject:message-id;
  bh=G4UoDwQyKlRXIJ4+VE0f4um8A6+coJFuUxjNFdpeybo=;
  b=RBPLGXLq+YyluNb/Yc75dQu6crsaGtzEjgArhPwtv7bnSQCI570j2deJ
   HADREEgii7FqNqgXk9jbYRPTZg2k2s5Au5ONASRUpTmVcADG5Wcu5JP9U
   NRLOa3ogCCX9XabRUqR2KqPKe8HM/RThibCsqzaX7LYaljh3HHM/453p2
   YqbTTxJBn+iIyvE0IMv1bB17lIytr1VSvOoHl2aDSIJDQt0it6r+J/wuL
   dlvHCtGsLM3pEPyGsLIzWqK0aCNA4YmET9DDOLXYdwj9jVfMu899sIcMB
   NwPAcmhp66wnTiMbhH47yar9YEQlah2Q70r96/5BTxoKHIBnsxL1qTu7s
   Q==;
X-CSE-ConnectionGUID: 22fGf/ElS66UUDJpxGpSvQ==
X-CSE-MsgGUID: s7bk/MeuTEqxqkjyasw4cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1590219"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1590219"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 08:33:10 -0700
X-CSE-ConnectionGUID: INBSbL6DTLei7uktkoFmyQ==
X-CSE-MsgGUID: EO0ilzM3TcuXkaYMrMMQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4384257"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2026 08:33:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKdk1-00000000TyG-3bhU;
	Sat, 24 Oct 2026 15:33:05 +0000
Date: Sat, 24 Oct 2026 23:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/gpu/drm/drm_writeback.c:233: warning: expecting prototype for
 drm_writeback_connector_init_with_encoder(). Prototype was for
 __drm_writeback_connector_init() instead
Message-ID: <202610242300.yJPZeJAI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Louis,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e64d278d669fa423e1337ad06c6672336c13bea9
commit: 0d388fbee6e6a346d9849425ae6b94333226f69a [2/2] FROMGIT: drm: writeback: Create an helper for drm_writeback_connector initialization
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261024/202610242300.yJPZeJAI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610242300.yJPZeJAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610242300.yJPZeJAI-lkp@intel.com/

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
