Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F133DECA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569800; cv=none; b=cxwUo6ElsbQWSKyIPFIqJZGc2xGVdUlTTTajyGGV6bIVAjKpqPR1EjD5MRBrpe+PgXW3ozlXG9ZgrJhwKpKXAiaFxhUUydnfzBCuG+rkHqq+o9IxxXrFjh4i5/5FAjImHnJnGaNv5x+t9jS3JdKSk9mB5B24N5AXNUBPTkzpJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569800; c=relaxed/simple;
	bh=zw/zIh+j42U0s/PeX69cqU8gnHhOtrAcPJ0h2Igm098=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hd6qfXkbxtXoSV86yLXslGtowNAaPART6op6y4CzFGCJXcqrShcuCkv0QKrEz2o8MdNux0vHm7+jYk2CFE9TU1BNnTQaVDuAgQ3Xs0RqOKCnhL/hrp2XHTQpoXTmd1+6Dfj2a2kDaAzuhWGN+Q8IyJVna9FgS7TyNVyeja6vvXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYnheMqF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYnheMqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766569798; x=1798105798;
  h=date:from:to:cc:subject:message-id;
  bh=zw/zIh+j42U0s/PeX69cqU8gnHhOtrAcPJ0h2Igm098=;
  b=PYnheMqFbXfks14AV8UzwDcxW35TytpQvXcj4XQ0ORnUUqrpwAAPEcm9
   PajE+qxf7tTS0CzoqY68YI4zM0PvD0ww3AeZ8upmczdP+rb+L/Jpu3KLh
   apery/PZlMM7njyWerM2ch0Iydq8g5H3wpFfii7MWEZgcZgdZhOBX2mas
   j9+Uah6VDtwTeL3peQRO+2QGflag5Sq6XsneD7/cMN0hwbAdNewRAmcRf
   EZjjSlC5DpJxEoArYFqzKgFYIg5HnB3uLDUpdFtoSZJd2d51G6jDlD3WD
   hbZWuVL7Lklq5MpAr/pqLyjnN/PbGWvj2jLK8ATclpIecbzOABQhnLkow
   Q==;
X-CSE-ConnectionGUID: 9uuM1605SG6nu9YqvdYXyg==
X-CSE-MsgGUID: e6GL8NxPThCO1oJh8g+uyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68451305"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68451305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 01:49:56 -0800
X-CSE-ConnectionGUID: pOy5sKZATX6WJu91pB6Iyw==
X-CSE-MsgGUID: PwKwGkEhQvChHAilEzQ2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="199738286"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Dec 2025 01:49:54 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYLV9-000000002uA-394t;
	Wed, 24 Dec 2025 09:49:51 +0000
Date: Wed, 24 Dec 2025 17:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: drivers/gpu/drm/imx/ipuv3/parallel-display.c:208: undefined
 reference to `drm_bridge_connector_init'
Message-ID: <202512241721.jZgcwRfr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: 61b86391fb5d7b9cad35169b1660119754a01134 Merge drm/drm-next into drm-misc-next
date:   1 year, 3 months ago
config: mips-randconfig-r133-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241721.jZgcwRfr-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241721.jZgcwRfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241721.jZgcwRfr-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
>> drivers/gpu/drm/imx/ipuv3/parallel-display.c:208: undefined reference to `drm_bridge_connector_init'
   mips64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_probe':
   drivers/gpu/drm/imx/ipuv3/parallel-display.c:237: undefined reference to `devm_imx_drm_legacy_bridge'


vim +208 drivers/gpu/drm/imx/ipuv3/parallel-display.c

19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  181  
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  182  static int imx_pd_bind(struct device *dev, struct device *master, void *data)
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  183  {
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  184  	struct drm_device *drm = data;
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  185  	struct imx_parallel_display *imxpd = dev_get_drvdata(dev);
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  186  	struct imx_parallel_display_encoder *imxpd_encoder;
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  187  	struct drm_connector *connector;
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  188  	struct drm_encoder *encoder;
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  189  	struct drm_bridge *bridge;
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  190  	int ret;
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  191  
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  192  	imxpd_encoder = drmm_simple_encoder_alloc(drm, struct imx_parallel_display_encoder,
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  193  						  encoder, DRM_MODE_ENCODER_NONE);
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  194  	if (IS_ERR(imxpd_encoder))
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  195  		return PTR_ERR(imxpd_encoder);
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  196  
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  197  	imxpd_encoder->pd = imxpd;
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  198  	encoder = &imxpd_encoder->encoder;
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  199  	bridge = &imxpd_encoder->bridge;
495590c65942d0 drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  200  
49f98bc4d44a4e drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2016-07-06  201  	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
1b3f7675663384 drivers/staging/imx-drm/parallel-display.c   Russell King     2013-11-03  202  	if (ret)
1b3f7675663384 drivers/staging/imx-drm/parallel-display.c   Russell King     2013-11-03  203  		return ret;
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  204  
5145fe5bed7cdd drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  205  	bridge->funcs = &imx_pd_bridge_funcs;
f94b9707a1c912 drivers/gpu/drm/imx/ipuv3/parallel-display.c Dmitry Baryshkov 2024-06-02  206  	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
fe141cedc4333e drivers/gpu/drm/imx/parallel-display.c       Boris Brezillon  2020-01-28  207  
f94b9707a1c912 drivers/gpu/drm/imx/ipuv3/parallel-display.c Dmitry Baryshkov 2024-06-02 @208  	connector = drm_bridge_connector_init(drm, encoder);
f94b9707a1c912 drivers/gpu/drm/imx/ipuv3/parallel-display.c Dmitry Baryshkov 2024-06-02  209  	if (IS_ERR(connector))
f94b9707a1c912 drivers/gpu/drm/imx/ipuv3/parallel-display.c Dmitry Baryshkov 2024-06-02  210  		return PTR_ERR(connector);
c0ad88a9d8e53d drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  211  
5145fe5bed7cdd drivers/gpu/drm/imx/parallel-display.c       Philipp Zabel    2020-12-10  212  	drm_connector_attach_encoder(connector, encoder);
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  213  
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  214  	return 0;
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  215  }
19022aaae677df drivers/staging/imx-drm/parallel-display.c   Sascha Hauer     2012-09-21  216  

:::::: The code at line 208 was first introduced by commit
:::::: f94b9707a1c91292c32f82847aa00d66472c0c62 drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
