Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E5374F1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 03:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725593045; cv=none; b=HjwtuWM2qPeoH6p8Fk/FEuZncsnUKV84QqbWeVeclBNIVTeErFfmVhF/eV79QzALmJf4Jgqii+2OOkw/23MsN91n5fQrScCfBAOEAKz5UXkElzZrsRRNv29bPgdCRidTOWQTzf3LM9QItcQIKvGkyLPVr9dn2HgpQfLLB6L96C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725593045; c=relaxed/simple;
	bh=URaHe0e3oCUswbzSHE30Z+p21eOH9W8TA76/Eh7jbk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOOiqoAbeUREJ1L8CB9xfLK1AuaIcYoLCFYw8Cd1A8yaj0PGg+j7AcfZSrEnP3A+CvE8LTzq1Z2o6U3xTiCSk3Ps82fbHGzWMYHHX1ITuCqzdvgZFi5Vkg6axh74JGylgDUJ3PD2jVP1ZGfkhtCfv1WouxEITDa2pL+vu/omznM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gx6zyAR9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gx6zyAR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725593044; x=1757129044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URaHe0e3oCUswbzSHE30Z+p21eOH9W8TA76/Eh7jbk0=;
  b=Gx6zyAR9onwXAsAdu6o57dfwifndWkHY0YXlRcUfs4cgO4TQ8wDAZkfo
   7Ek43oYTW22iw81LKUxf/NYggEU9hwkFY/HRUaRob1+Vz3iFN3qDxmBGt
   c98axY3UCEH8M8LpekwLCwu/3gCTPEnuabKarfUfEY6NMI9eEbuUUigr8
   aFmTG6gZCs2uHoZemhdK9nUaINFuiwPa/RjJj8R4wOJStkYrXLuCLQZ2A
   gGep9MzZ2suu3oGX0DnpSqchzQfg9oZlJ2OnlQbFwCERr9XQGeVykrqiS
   ybo85yNywrNoC6EOFm1dRrGFdKDche3KCTT5O3Cq77RvCV4v0TWm3+tVr
   A==;
X-CSE-ConnectionGUID: MTWRpNPGTFacyYXxcfrD6g==
X-CSE-MsgGUID: 7Jx3EG3oTsuwxslglD+k3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35012708"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="35012708"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:24:02 -0700
X-CSE-ConnectionGUID: fsrzDmoOSPOinHRWAG3ueA==
X-CSE-MsgGUID: EbENz9GhTQa05moNviNWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70393845"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 20:24:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smPZm-000AZ5-26;
	Fri, 06 Sep 2024 03:23:58 +0000
Date: Fri, 6 Sep 2024 11:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9594/9692]
 drivers/gpu/drm/imx/ipuv3/parallel-display.c:208:undefined reference to
 `drm_bridge_connector_init'
Message-ID: <202409061140.O8nNP5tG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad40aff1edffeccc412cde93894196dca7bc739e
commit: 98b20ebb0ca8b62a9d0ee4bfe00a13887046b618 [9594/9692] Merge branch 'for-linux-next' of https://gitlab.freedesktop.org/drm/misc/kernel.git
config: s390-randconfig-r011-20220418 (https://download.01.org/0day-ci/archive/20240906/202409061140.O8nNP5tG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061140.O8nNP5tG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061140.O8nNP5tG-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
>> drivers/gpu/drm/imx/ipuv3/parallel-display.c:208:(.text+0x2c4): undefined reference to `drm_bridge_connector_init'
   s390-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_probe':
   drivers/gpu/drm/imx/ipuv3/parallel-display.c:237:(.text+0x402): undefined reference to `devm_imx_drm_legacy_bridge'


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
