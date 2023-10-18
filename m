Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C1430E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+Mw7MN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697598277; x=1729134277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QtWBdWAkMHyjVZIyfxVw4Ow5Vwl5CyWB2BwT2VrbkM4=;
  b=E+Mw7MN2p3LGxjd2xXC/GurMzpa/ezjOYXTkQQYs6P5EttWZYTZo+3Uo
   /bnpBKacugQPwxn7HQAnF4NinitNxqwBaLCiNOAAOUNcl2u/7tQ2qqwQo
   ymp5FSCFvZVisS32Hsu1F8zVgTZ4pGrhxsXMHT2k85bVGTWxBkmTV2OhI
   RDAqLsJUXkZ2rM5L/i+JAR89jqYO446+qHNke843t+YUQfjfi+9syOq02
   EBxBJ8zGRnYxlO7sTUXxVcE8D94vgOgBhShwygpKdpA+hb+3QUO5+SLvK
   07lpKYygrbUdrwrAudRVcAH7sZXCGdYY97WA+52WkubjGktWgq7ID9mVR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7478526"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="7478526"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 20:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706259696"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="706259696"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 20:04:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qswrI-000AQV-2V;
	Wed, 18 Oct 2023 03:04:32 +0000
Date: Wed, 18 Oct 2023 11:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2230/30000]
 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:54:5: warning: "CONFIG_PM" is not
 defined, evaluates to 0
Message-ID: <202310181008.vGgq8NQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 7b8c04b86d7fb8b2cc3069966d1f8d4906d20ad2 [2230/30000] Merge remote-tracking branch 'origin/display/dsim' into display/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310181008.vGgq8NQd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181008.vGgq8NQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181008.vGgq8NQd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:54:5: warning: "CONFIG_PM" is not defined, evaluates to 0 [-Wundef]
      54 | #if CONFIG_PM
         |     ^~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: In function 'sec_dsim_of_parse_resets':
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:202:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     202 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: At top level:
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:62:12: warning: 'imx_sec_dsim_runtime_resume' defined but not used [-Wunused-function]
      62 | static int imx_sec_dsim_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:58:12: warning: 'imx_sec_dsim_runtime_suspend' defined but not used [-Wunused-function]
      58 | static int imx_sec_dsim_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_PM +54 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c

b41429c61a5a0d Fancy Fang 2018-06-06   53  
bfda55d4f78985 Fancy Fang 2018-07-02  @54  #if CONFIG_PM
bfda55d4f78985 Fancy Fang 2018-07-02   55  static int imx_sec_dsim_runtime_suspend(struct device *dev);
bfda55d4f78985 Fancy Fang 2018-07-02   56  static int imx_sec_dsim_runtime_resume(struct device *dev);
bfda55d4f78985 Fancy Fang 2018-07-02   57  #else
bfda55d4f78985 Fancy Fang 2018-07-02  @58  static int imx_sec_dsim_runtime_suspend(struct device *dev)
bfda55d4f78985 Fancy Fang 2018-07-02   59  {
bfda55d4f78985 Fancy Fang 2018-07-02   60  	return 0;
bfda55d4f78985 Fancy Fang 2018-07-02   61  }
bfda55d4f78985 Fancy Fang 2018-07-02  @62  static int imx_sec_dsim_runtime_resume(struct device *dev)
bfda55d4f78985 Fancy Fang 2018-07-02   63  {
bfda55d4f78985 Fancy Fang 2018-07-02   64  	return 0;
bfda55d4f78985 Fancy Fang 2018-07-02   65  }
bfda55d4f78985 Fancy Fang 2018-07-02   66  #endif
bfda55d4f78985 Fancy Fang 2018-07-02   67  
7adcf1c464fe0d Fancy Fang 2019-06-06   68  static int sec_dsim_rstc_reset(struct reset_control *rstc, bool assert)
b41429c61a5a0d Fancy Fang 2018-06-06   69  {
7adcf1c464fe0d Fancy Fang 2019-06-06   70  	int ret;
b41429c61a5a0d Fancy Fang 2018-06-06   71  
7adcf1c464fe0d Fancy Fang 2019-06-06   72  	if (!rstc)
7adcf1c464fe0d Fancy Fang 2019-06-06   73  		return 0;
b41429c61a5a0d Fancy Fang 2018-06-06   74  
7adcf1c464fe0d Fancy Fang 2019-06-06   75  	ret = assert ? reset_control_assert(rstc)	:
7adcf1c464fe0d Fancy Fang 2019-06-06   76  		       reset_control_deassert(rstc);
7adcf1c464fe0d Fancy Fang 2019-06-06   77  
7adcf1c464fe0d Fancy Fang 2019-06-06   78  	return ret;
b41429c61a5a0d Fancy Fang 2018-06-06   79  }
b41429c61a5a0d Fancy Fang 2018-06-06   80  
b41429c61a5a0d Fancy Fang 2018-06-06   81  static void imx_sec_dsim_encoder_helper_enable(struct drm_encoder *encoder)
b41429c61a5a0d Fancy Fang 2018-06-06   82  {
7adcf1c464fe0d Fancy Fang 2019-06-06   83  	int ret;
b41429c61a5a0d Fancy Fang 2018-06-06   84  	struct imx_sec_dsim_device *dsim_dev = enc_to_dsim(encoder);
b41429c61a5a0d Fancy Fang 2018-06-06   85  
b41429c61a5a0d Fancy Fang 2018-06-06   86  	pm_runtime_get_sync(dsim_dev->dev);
b41429c61a5a0d Fancy Fang 2018-06-06   87  
7adcf1c464fe0d Fancy Fang 2019-06-06   88  	ret = sec_dsim_rstc_reset(dsim_dev->mipi_reset, false);
7adcf1c464fe0d Fancy Fang 2019-06-06   89  	if (ret)
7adcf1c464fe0d Fancy Fang 2019-06-06   90  		dev_err(dsim_dev->dev, "deassert mipi_reset failed\n");
b41429c61a5a0d Fancy Fang 2018-06-06   91  }
b41429c61a5a0d Fancy Fang 2018-06-06   92  
b41429c61a5a0d Fancy Fang 2018-06-06   93  static void imx_sec_dsim_encoder_helper_disable(struct drm_encoder *encoder)
b41429c61a5a0d Fancy Fang 2018-06-06   94  {
7adcf1c464fe0d Fancy Fang 2019-06-06   95  	int ret;
b41429c61a5a0d Fancy Fang 2018-06-06   96  	struct imx_sec_dsim_device *dsim_dev = enc_to_dsim(encoder);
b41429c61a5a0d Fancy Fang 2018-06-06   97  
7adcf1c464fe0d Fancy Fang 2019-06-06   98  	ret = sec_dsim_rstc_reset(dsim_dev->mipi_reset, true);
7adcf1c464fe0d Fancy Fang 2019-06-06   99  	if (ret)
7adcf1c464fe0d Fancy Fang 2019-06-06  100  		dev_err(dsim_dev->dev, "deassert mipi_reset failed\n");
b41429c61a5a0d Fancy Fang 2018-06-06  101  
b41429c61a5a0d Fancy Fang 2018-06-06  102  	pm_runtime_put_sync(dsim_dev->dev);
b41429c61a5a0d Fancy Fang 2018-06-06  103  }
b41429c61a5a0d Fancy Fang 2018-06-06  104  
b41429c61a5a0d Fancy Fang 2018-06-06  105  static int imx_sec_dsim_encoder_helper_atomic_check(struct drm_encoder *encoder,
b41429c61a5a0d Fancy Fang 2018-06-06  106  						    struct drm_crtc_state *crtc_state,
b41429c61a5a0d Fancy Fang 2018-06-06  107  						    struct drm_connector_state *conn_state)
b41429c61a5a0d Fancy Fang 2018-06-06  108  {
6b9f75cb20a00b Fancy Fang 2018-08-15  109  	int i, ret;
9012eac7b31dd0 Fancy Fang 2018-08-10  110  	u32 bus_format;
9012eac7b31dd0 Fancy Fang 2018-08-10  111  	unsigned int num_bus_formats;
9012eac7b31dd0 Fancy Fang 2018-08-10  112  	struct imx_sec_dsim_device *dsim_dev = enc_to_dsim(encoder);
6b9f75cb20a00b Fancy Fang 2018-08-15  113  	struct drm_bridge *bridge = encoder->bridge;
b41429c61a5a0d Fancy Fang 2018-06-06  114  	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
b41429c61a5a0d Fancy Fang 2018-06-06  115  	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
9012eac7b31dd0 Fancy Fang 2018-08-10  116  	struct drm_display_info *display_info = &conn_state->connector->display_info;
9012eac7b31dd0 Fancy Fang 2018-08-10  117  
9012eac7b31dd0 Fancy Fang 2018-08-10  118  	num_bus_formats = display_info->num_bus_formats;
9012eac7b31dd0 Fancy Fang 2018-08-10  119  	if (unlikely(!num_bus_formats))
9012eac7b31dd0 Fancy Fang 2018-08-10  120  		dev_warn(dsim_dev->dev, "no bus formats assigned by connector\n");
9012eac7b31dd0 Fancy Fang 2018-08-10  121  
9012eac7b31dd0 Fancy Fang 2018-08-10  122  	bus_format = adjusted_mode->private_flags & 0xffff;
9012eac7b31dd0 Fancy Fang 2018-08-10  123  
9012eac7b31dd0 Fancy Fang 2018-08-10  124  	for (i = 0; i < num_bus_formats; i++) {
9012eac7b31dd0 Fancy Fang 2018-08-10  125  		if (display_info->bus_formats[i] != bus_format)
9012eac7b31dd0 Fancy Fang 2018-08-10  126  			continue;
9012eac7b31dd0 Fancy Fang 2018-08-10  127  		break;
9012eac7b31dd0 Fancy Fang 2018-08-10  128  	}
9012eac7b31dd0 Fancy Fang 2018-08-10  129  
9012eac7b31dd0 Fancy Fang 2018-08-10  130  	if (i && i == num_bus_formats) {
9012eac7b31dd0 Fancy Fang 2018-08-10  131  		dev_err(dsim_dev->dev, "invalid bus format for connector\n");
9012eac7b31dd0 Fancy Fang 2018-08-10  132  		return -EINVAL;
9012eac7b31dd0 Fancy Fang 2018-08-10  133  	}
b41429c61a5a0d Fancy Fang 2018-06-06  134  
6b9f75cb20a00b Fancy Fang 2018-08-15  135  	/* check pll out */
6b9f75cb20a00b Fancy Fang 2018-08-15  136  	ret = sec_mipi_dsim_check_pll_out(bridge->driver_private,
6b9f75cb20a00b Fancy Fang 2018-08-15  137  					  adjusted_mode);
6b9f75cb20a00b Fancy Fang 2018-08-15  138  	if (ret)
6b9f75cb20a00b Fancy Fang 2018-08-15  139  		return ret;
6b9f75cb20a00b Fancy Fang 2018-08-15  140  
b41429c61a5a0d Fancy Fang 2018-06-06  141  	/* sec dsim can only accept active hight DE */
b41429c61a5a0d Fancy Fang 2018-06-06  142  	imx_crtc_state->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
b41429c61a5a0d Fancy Fang 2018-06-06  143  
b41429c61a5a0d Fancy Fang 2018-06-06  144  	/* For the dotclock polarity, default is neg edge;
b41429c61a5a0d Fancy Fang 2018-06-06  145  	 * and in the dsim spec, there is no explict words
b41429c61a5a0d Fancy Fang 2018-06-06  146  	 * to illustrate the dotclock polarity requirement.
b41429c61a5a0d Fancy Fang 2018-06-06  147  	 */
b41429c61a5a0d Fancy Fang 2018-06-06  148  	imx_crtc_state->bus_flags |= DRM_BUS_FLAG_PIXDATA_NEGEDGE;
b41429c61a5a0d Fancy Fang 2018-06-06  149  
9012eac7b31dd0 Fancy Fang 2018-08-10  150  	/* set the bus format for CRTC output which should be
9012eac7b31dd0 Fancy Fang 2018-08-10  151  	 * the same as the bus format between dsim and connector,
9012eac7b31dd0 Fancy Fang 2018-08-10  152  	 * since dsim cannot do any pixel conversions.
9012eac7b31dd0 Fancy Fang 2018-08-10  153  	 */
9012eac7b31dd0 Fancy Fang 2018-08-10  154  	imx_crtc_state->bus_format = bus_format;
b41429c61a5a0d Fancy Fang 2018-06-06  155  
b41429c61a5a0d Fancy Fang 2018-06-06  156  	return 0;
b41429c61a5a0d Fancy Fang 2018-06-06  157  }
b41429c61a5a0d Fancy Fang 2018-06-06  158  
b41429c61a5a0d Fancy Fang 2018-06-06  159  static const struct drm_encoder_helper_funcs imx_sec_dsim_encoder_helper_funcs = {
b41429c61a5a0d Fancy Fang 2018-06-06  160  	.enable  = imx_sec_dsim_encoder_helper_enable,
b41429c61a5a0d Fancy Fang 2018-06-06  161  	.disable = imx_sec_dsim_encoder_helper_disable,
b41429c61a5a0d Fancy Fang 2018-06-06  162  	.atomic_check = imx_sec_dsim_encoder_helper_atomic_check,
b41429c61a5a0d Fancy Fang 2018-06-06  163  };
b41429c61a5a0d Fancy Fang 2018-06-06  164  
b41429c61a5a0d Fancy Fang 2018-06-06  165  static const struct drm_encoder_funcs imx_sec_dsim_encoder_funcs = {
b41429c61a5a0d Fancy Fang 2018-06-06  166  	.destroy = imx_drm_encoder_destroy,
b41429c61a5a0d Fancy Fang 2018-06-06  167  };
b41429c61a5a0d Fancy Fang 2018-06-06  168  
b41429c61a5a0d Fancy Fang 2018-06-06  169  static const struct sec_mipi_dsim_plat_data imx8mm_mipi_dsim_plat_data = {
b41429c61a5a0d Fancy Fang 2018-06-06  170  	.version	= 0x1060200,
b41429c61a5a0d Fancy Fang 2018-06-06  171  	.max_data_lanes = 4,
b41429c61a5a0d Fancy Fang 2018-06-06  172  	.max_data_rate  = 1500000000ULL,
8e76a569c4adf6 Fancy Fang 2019-03-17  173  	.dphy_pll	= &pll_1432x,
d7cdf77a367ef1 Fancy Fang 2018-08-21  174  	.dphy_timing	= dphy_timing_ln14lpp_v1p2,
d7cdf77a367ef1 Fancy Fang 2018-08-21  175  	.num_dphy_timing = ARRAY_SIZE(dphy_timing_ln14lpp_v1p2),
d7cdf77a367ef1 Fancy Fang 2018-08-21  176  	.dphy_timing_cmp = dphy_timing_default_cmp,
b41429c61a5a0d Fancy Fang 2018-06-06  177  	.mode_valid	= NULL,
b41429c61a5a0d Fancy Fang 2018-06-06  178  };
b41429c61a5a0d Fancy Fang 2018-06-06  179  
b41429c61a5a0d Fancy Fang 2018-06-06  180  static const struct of_device_id imx_sec_dsim_dt_ids[] = {
b41429c61a5a0d Fancy Fang 2018-06-06  181  	{
b41429c61a5a0d Fancy Fang 2018-06-06  182  		.compatible = "fsl,imx8mm-mipi-dsim",
b41429c61a5a0d Fancy Fang 2018-06-06  183  		.data = &imx8mm_mipi_dsim_plat_data,
b41429c61a5a0d Fancy Fang 2018-06-06  184  	},
5381ccd1a4c23a Fancy Fang 2019-05-28  185  	{
5381ccd1a4c23a Fancy Fang 2019-05-28  186  		.compatible = "fsl,imx8mn-mipi-dsim",
5381ccd1a4c23a Fancy Fang 2019-05-28  187  		.data = &imx8mm_mipi_dsim_plat_data,
5381ccd1a4c23a Fancy Fang 2019-05-28  188  	},
b41429c61a5a0d Fancy Fang 2018-06-06  189  	{ /* sentinel */ }
b41429c61a5a0d Fancy Fang 2018-06-06  190  };
b41429c61a5a0d Fancy Fang 2018-06-06  191  MODULE_DEVICE_TABLE(of, imx_sec_dsim_dt_ids);
b41429c61a5a0d Fancy Fang 2018-06-06  192  
7adcf1c464fe0d Fancy Fang 2019-06-06  193  static int sec_dsim_of_parse_resets(struct imx_sec_dsim_device *dsim)
7adcf1c464fe0d Fancy Fang 2019-06-06  194  {
7adcf1c464fe0d Fancy Fang 2019-06-06  195  	int ret;
7adcf1c464fe0d Fancy Fang 2019-06-06  196  	struct device *dev = dsim->dev;
7adcf1c464fe0d Fancy Fang 2019-06-06  197  	struct device_node *np = dev->of_node;
7adcf1c464fe0d Fancy Fang 2019-06-06  198  	struct device_node *parent, *child;
7adcf1c464fe0d Fancy Fang 2019-06-06  199  	struct of_phandle_args args;
7adcf1c464fe0d Fancy Fang 2019-06-06  200  	struct reset_control *rstc;
7adcf1c464fe0d Fancy Fang 2019-06-06  201  	const char *compat;
7adcf1c464fe0d Fancy Fang 2019-06-06 @202  	uint32_t len, rstc_num = 0;
7adcf1c464fe0d Fancy Fang 2019-06-06  203  
7adcf1c464fe0d Fancy Fang 2019-06-06  204  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
7adcf1c464fe0d Fancy Fang 2019-06-06  205  					 0, &args);
7adcf1c464fe0d Fancy Fang 2019-06-06  206  	if (ret)
7adcf1c464fe0d Fancy Fang 2019-06-06  207  		return ret;
7adcf1c464fe0d Fancy Fang 2019-06-06  208  
7adcf1c464fe0d Fancy Fang 2019-06-06  209  	parent = args.np;
7adcf1c464fe0d Fancy Fang 2019-06-06  210  	for_each_child_of_node(parent, child) {
7adcf1c464fe0d Fancy Fang 2019-06-06  211  		compat = of_get_property(child, "compatible", NULL);
7adcf1c464fe0d Fancy Fang 2019-06-06  212  		if (!compat)
7adcf1c464fe0d Fancy Fang 2019-06-06  213  			continue;
7adcf1c464fe0d Fancy Fang 2019-06-06  214  
7adcf1c464fe0d Fancy Fang 2019-06-06  215  		rstc = of_reset_control_array_get(child, false, false, true);
7adcf1c464fe0d Fancy Fang 2019-06-06  216  		if (IS_ERR(rstc))
7adcf1c464fe0d Fancy Fang 2019-06-06  217  			continue;
7adcf1c464fe0d Fancy Fang 2019-06-06  218  
7adcf1c464fe0d Fancy Fang 2019-06-06  219  		len = strlen(compat);
7adcf1c464fe0d Fancy Fang 2019-06-06  220  		if (!of_compat_cmp("dsi,soft-resetn", compat, len)) {
7adcf1c464fe0d Fancy Fang 2019-06-06  221  			dsim->soft_resetn = rstc;
7adcf1c464fe0d Fancy Fang 2019-06-06  222  			rstc_num++;
7adcf1c464fe0d Fancy Fang 2019-06-06  223  		} else if (!of_compat_cmp("dsi,clk-enable", compat, len)) {
7adcf1c464fe0d Fancy Fang 2019-06-06  224  			dsim->clk_enable = rstc;
7adcf1c464fe0d Fancy Fang 2019-06-06  225  			rstc_num++;
7adcf1c464fe0d Fancy Fang 2019-06-06  226  		} else if (!of_compat_cmp("dsi,mipi-reset", compat, len)) {
7adcf1c464fe0d Fancy Fang 2019-06-06  227  			dsim->mipi_reset = rstc;
7adcf1c464fe0d Fancy Fang 2019-06-06  228  			rstc_num++;
7adcf1c464fe0d Fancy Fang 2019-06-06  229  		} else
7adcf1c464fe0d Fancy Fang 2019-06-06  230  			dev_warn(dev, "invalid dsim reset node: %s\n", compat);
7adcf1c464fe0d Fancy Fang 2019-06-06  231  	}
7adcf1c464fe0d Fancy Fang 2019-06-06  232  
7adcf1c464fe0d Fancy Fang 2019-06-06  233  	if (!rstc_num) {
7adcf1c464fe0d Fancy Fang 2019-06-06  234  		dev_err(dev, "no invalid reset control exists\n");
7adcf1c464fe0d Fancy Fang 2019-06-06  235  		return -EINVAL;
7adcf1c464fe0d Fancy Fang 2019-06-06  236  	}
7adcf1c464fe0d Fancy Fang 2019-06-06  237  
7adcf1c464fe0d Fancy Fang 2019-06-06  238  	return 0;
7adcf1c464fe0d Fancy Fang 2019-06-06  239  }
7adcf1c464fe0d Fancy Fang 2019-06-06  240  

:::::: The code at line 54 was first introduced by commit
:::::: bfda55d4f789853516cbd1aa6729c0c9b229936c MLK-19017-6 drm/imx: add system pm support for SEC DSIM

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
