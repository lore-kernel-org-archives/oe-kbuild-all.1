Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302501BDA97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400708; cv=none; b=IGMbsVGC71S5jUzlcDJS7h8qRmlAIq95xAdqMEuP1KyPRwS6NTQCIoGIrVSbV9llrftHJ4uKkCo+Cw6jPkYnbV5SdDgdp+WlcVG8qDnWTt7LxIlC9Mj0wSOTkvGgIH32HQRyDuBImTd5gldf1u+aaEqn0tpo0ilMvzaCHK7/GWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400708; c=relaxed/simple;
	bh=soNS3nNl3d2T6dDGbfp+OwwWd+PKv4rBN9/ZypS1agk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUnCpZMGUhkLxwkJoJZphjjTcMKeP0nwmULTH+lSp4LbQK7kTUKMhqOcDuii1lyZreqLhfZ4WYh8WAizaLHlvYW8g9nsFuzJu7LLguIwy+UZiDVi/lzOWORdOzS4Y4A+WRSg6mgYlsfhuvls+ZDW3roZUG0vWuBxjZ2LMQfbWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2xjF9Fh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2xjF9Fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730400706; x=1761936706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=soNS3nNl3d2T6dDGbfp+OwwWd+PKv4rBN9/ZypS1agk=;
  b=N2xjF9FhaqDOQ3Rw/I6FkabWJZ7PVInPCt5TfZuuIJPH+Qu/4PeOM0Vv
   u5aoGJVsZXDN5v7RjxJf3fzilF9vJEmzdVkjPFPXWmOozdos6WYYK93XD
   kbE4tMZNv2+LKUSAX8QbBij5BOdalcHJkDdrQQMR59itg6fD8Et7jnnSa
   y4F4O9sbV3jAPjYBGEAAsyQwpODRvr4cJQGQSmsuPXBDbomjC8Tf4aIuW
   e8niqKH6GmNuO53DQNFrJWYw4Z23NKpYTREZ2hmYWLJcgKx/8yb1Qy8lW
   6G6B2xOFtRR3A7Tx+Es7ntLGMXhsmshSzKK97rbB8w0HwaHPwCv5zhlKC
   A==;
X-CSE-ConnectionGUID: pO1Qdc5ZTWmWCVfkPYN3yw==
X-CSE-MsgGUID: Nz7K4ztaQc6fjH5xswPngg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29578667"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="29578667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:51:43 -0700
X-CSE-ConnectionGUID: RvPICCGNQnGVrV2fozs1Ng==
X-CSE-MsgGUID: pnK1h8g3T0GVcaIdBSAjsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87263902"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2024 11:51:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6aGi-000gcg-1K;
	Thu, 31 Oct 2024 18:51:40 +0000
Date: Fri, 1 Nov 2024 02:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: [linux-next:master 6139/8448]
 drivers/gpu/drm/imx/dcss/dcss-kms.c:95:15: error: implicit declaration of
 function 'drm_bridge_attach'
Message-ID: <202411010245.g6zMmW4G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
commit: 004555a18d57fbad42553c2e98e00a054bbe618c [6139/8448] drm/imx/dcss: Allow build with COMPILE_TEST=y
config: i386-buildonly-randconfig-004-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010245.g6zMmW4G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010245.g6zMmW4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010245.g6zMmW4G-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/imx/dcss/dcss-kms.c: In function 'dcss_kms_bridge_connector_init':
>> drivers/gpu/drm/imx/dcss/dcss-kms.c:95:15: error: implicit declaration of function 'drm_bridge_attach' [-Werror=implicit-function-declaration]
      95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
         |               ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-kms.c:96:33: error: 'DRM_BRIDGE_ATTACH_NO_CONNECTOR' undeclared (first use in this function)
      96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/dcss/dcss-kms.c:96:33: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/drm_bridge_attach +95 drivers/gpu/drm/imx/dcss/dcss-kms.c

9021c317b77024 Laurentiu Palcu  2020-07-31   65  
e7033bdfd43b85 Laurentiu Palcu  2020-07-31   66  static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
9021c317b77024 Laurentiu Palcu  2020-07-31   67  {
9021c317b77024 Laurentiu Palcu  2020-07-31   68  	struct drm_device *ddev = &kms->base;
9021c317b77024 Laurentiu Palcu  2020-07-31   69  	struct drm_encoder *encoder = &kms->encoder;
9021c317b77024 Laurentiu Palcu  2020-07-31   70  	struct drm_crtc *crtc = (struct drm_crtc *)&kms->crtc;
9021c317b77024 Laurentiu Palcu  2020-07-31   71  	struct drm_panel *panel;
9021c317b77024 Laurentiu Palcu  2020-07-31   72  	struct drm_bridge *bridge;
9021c317b77024 Laurentiu Palcu  2020-07-31   73  	int ret;
9021c317b77024 Laurentiu Palcu  2020-07-31   74  
9021c317b77024 Laurentiu Palcu  2020-07-31   75  	ret = drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
9021c317b77024 Laurentiu Palcu  2020-07-31   76  					  &panel, &bridge);
9021c317b77024 Laurentiu Palcu  2020-07-31   77  	if (ret)
9021c317b77024 Laurentiu Palcu  2020-07-31   78  		return ret;
9021c317b77024 Laurentiu Palcu  2020-07-31   79  
9021c317b77024 Laurentiu Palcu  2020-07-31   80  	if (!bridge) {
9021c317b77024 Laurentiu Palcu  2020-07-31   81  		dev_err(ddev->dev, "No bridge found %d.\n", ret);
9021c317b77024 Laurentiu Palcu  2020-07-31   82  		return -ENODEV;
9021c317b77024 Laurentiu Palcu  2020-07-31   83  	}
9021c317b77024 Laurentiu Palcu  2020-07-31   84  
9021c317b77024 Laurentiu Palcu  2020-07-31   85  	encoder->possible_crtcs = drm_crtc_mask(crtc);
9021c317b77024 Laurentiu Palcu  2020-07-31   86  
9021c317b77024 Laurentiu Palcu  2020-07-31   87  	ret = drm_encoder_init(&kms->base, encoder,
9021c317b77024 Laurentiu Palcu  2020-07-31   88  			       &dcss_kms_simple_encoder_funcs,
9021c317b77024 Laurentiu Palcu  2020-07-31   89  			       DRM_MODE_ENCODER_NONE, NULL);
9021c317b77024 Laurentiu Palcu  2020-07-31   90  	if (ret) {
9021c317b77024 Laurentiu Palcu  2020-07-31   91  		dev_err(ddev->dev, "Failed initializing encoder %d.\n", ret);
9021c317b77024 Laurentiu Palcu  2020-07-31   92  		return ret;
9021c317b77024 Laurentiu Palcu  2020-07-31   93  	}
9021c317b77024 Laurentiu Palcu  2020-07-31   94  
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  @95  	ret = drm_bridge_attach(encoder, bridge, NULL,
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  @96  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
fb8d617f8fd64f Laurent Pinchart 2021-03-23   97  	if (ret < 0)
e7033bdfd43b85 Laurentiu Palcu  2020-07-31   98  		return ret;
e7033bdfd43b85 Laurentiu Palcu  2020-07-31   99  
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  100  	kms->connector = drm_bridge_connector_init(ddev, encoder);
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  101  	if (IS_ERR(kms->connector)) {
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  102  		dev_err(ddev->dev, "Unable to create bridge connector.\n");
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  103  		return PTR_ERR(kms->connector);
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  104  	}
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  105  
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  106  	drm_connector_attach_encoder(kms->connector, encoder);
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  107  
e7033bdfd43b85 Laurentiu Palcu  2020-07-31  108  	return 0;
9021c317b77024 Laurentiu Palcu  2020-07-31  109  }
9021c317b77024 Laurentiu Palcu  2020-07-31  110  

:::::: The code at line 95 was first introduced by commit
:::::: e7033bdfd43b85281b63d281b4dad3b9119f4427 drm/imx/dcss: use drm_bridge_connector API

:::::: TO: Laurentiu Palcu <laurentiu.palcu@nxp.com>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
