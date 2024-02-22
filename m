Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0119BF9D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708585070; cv=none; b=J7WFVPe7kS/alWTaNkzvVYoRFsXtLm3DJ+NKHFBkIjAhC4+KUNHip69Sh0RA86ZWAat+jPeAq3q0IJFrcFd9hvpEQHyeYXcpW1f87MjERyqWpbHz0wkBSGuifIyKybhw3WUOS5wLRbSoALv7s9104Mx16vEIEQo3dvr/FV2mdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708585070; c=relaxed/simple;
	bh=pVRiy7DkNT15rFtbteEHWIi9Q1QMa0JGxsnfW4fG/64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGQUCPmiJzVvx8OHrPI77rFw3AhNuZM2AS+Dq2UhFqD7z5lED9RWN+xdsc6FEXQzWDR9YZad5B09DI0GL5qwzqbormPjFHhliiTwYtKoJ6Olr4coI6UoRQWNbmbuDcBdwj49IGukfmvdqWuPwElbo3HmdFl3mOHouqlo/cgwh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gw07E3CL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gw07E3CL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708585068; x=1740121068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pVRiy7DkNT15rFtbteEHWIi9Q1QMa0JGxsnfW4fG/64=;
  b=Gw07E3CLfW3QQxpcJwfkI/v5UTYwWq3ua+VWACobWxC85j97PIg5kkYX
   UfmGHj5i0bwN9XUCne34CLML+OgJN7XJ5NC5Mq8hd18L+6b7U6NkZq9QR
   pB0oIJgsvvurmqa33Pfp8PEHjM4LsfnU1gWbu0Ox77eY7L0iBgS03u8YT
   YC8PBP/buqZIVNNk7VzNAxn9GJDF7R968T/0pYsubvTHds6N/tnDLbNwC
   czKrMPazocakPqyJpnzTxpLtZFg2B4WmQwf7TAN0e7U5nV2bS9+q2c03K
   q1J653obpPuDk3+7eV3qorfJXauufSCXSWSPSWTkiLWl4uJylBWdgnrU6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14207690"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="14207690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 22:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5355819"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2024 22:57:44 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd31Z-00064G-25;
	Thu, 22 Feb 2024 06:57:41 +0000
Date: Thu, 22 Feb 2024 14:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c:193:24: warning:
 returning 'void *' from a function with return type 'int' makes integer from
 pointer without a cast
Message-ID: <202402221456.wauEZBYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: e4d4af3ec0797a9e7b65ef40ce8052463da45bfb drm/hisilicon: Features to support reading resolutions from EDID
date:   1 year, 4 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240222/202402221456.wauEZBYy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221456.wauEZBYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221456.wauEZBYy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c: In function 'hibmc_vdac_init':
>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c:193:24: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     193 |                 return ERR_PTR(ret);
         |                        ^~~~~~~~~~~~
   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c: At top level:
>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c:114:1: warning: 'hibmc_connector_init' defined but not used [-Wunused-function]
     114 | hibmc_connector_init(struct hibmc_drm_private *priv)
         | ^~~~~~~~~~~~~~~~~~~~


vim +193 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c

   112	
   113	static struct drm_connector *
 > 114	hibmc_connector_init(struct hibmc_drm_private *priv)
   115	{
   116		struct drm_device *dev = priv->dev;
   117		struct drm_connector *connector;
   118		int ret;
   119	
   120		connector = devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);
   121		if (!connector) {
   122			DRM_ERROR("failed to alloc memory when init connector\n");
   123			return ERR_PTR(-ENOMEM);
   124		}
   125	
   126		ret = drm_connector_init(dev, connector,
   127					 &hibmc_connector_funcs,
   128					 DRM_MODE_CONNECTOR_VGA);
   129		if (ret) {
   130			DRM_ERROR("failed to init connector: %d\n", ret);
   131			return ERR_PTR(ret);
   132		}
   133		drm_connector_helper_add(connector,
   134					 &hibmc_connector_helper_funcs);
   135	
   136		return connector;
   137	}
   138	
   139	static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
   140					   struct drm_display_mode *mode,
   141					   struct drm_display_mode *adj_mode)
   142	{
   143		u32 reg;
   144		struct drm_device *dev = encoder->dev;
   145		struct hibmc_drm_private *priv = dev->dev_private;
   146	
   147		reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
   148		reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
   149		reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
   150		reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
   151		reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
   152		writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
   153	}
   154	
   155	static const struct drm_encoder_helper_funcs hibmc_encoder_helper_funcs = {
   156		.mode_set = hibmc_encoder_mode_set,
   157	};
   158	
   159	static const struct drm_encoder_funcs hibmc_encoder_funcs = {
   160		.destroy = drm_encoder_cleanup,
   161	};
   162	
   163	int hibmc_vdac_init(struct hibmc_drm_private *priv)
   164	{
   165		struct drm_device *dev = priv->dev;
   166		struct hibmc_connector *hibmc_connector = &priv->connector;
   167	 	struct drm_encoder *encoder = &priv->encoder;
   168		struct drm_connector *connector = &hibmc_connector->base;
   169		int ret;
   170	
   171		ret = hibmc_ddc_create(dev, hibmc_connector);
   172		if (ret) {
   173			DRM_ERROR("failed to create ddc: %d\n", ret);
   174			return ret;
   175		}
   176	
   177		encoder->possible_crtcs = 0x1;
   178		ret = drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
   179				       DRM_MODE_ENCODER_DAC, NULL);
   180		if (ret) {
   181			DRM_ERROR("failed to init encoder: %d\n", ret);
   182			return ret;
   183		}
   184	
   185		drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
   186	
   187		ret = drm_connector_init_with_ddc(dev, connector,
   188						  &hibmc_connector_funcs,
   189						  DRM_MODE_CONNECTOR_VGA,
   190						  &hibmc_connector->adapter);
   191		if (ret) {
   192			DRM_ERROR("failed to init connector: %d\n", ret);
 > 193			return ERR_PTR(ret);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
