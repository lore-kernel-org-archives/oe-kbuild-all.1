Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E910B647
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 03:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692327865; x=1723863865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MjorVg8rSANvat4BSuU1+/woeT5w6q14nAgdLhgL8xk=;
  b=P4eB07NW+/j81tq+K4B/OkrxnEzYvZNbWumpDaRZfxC6QscgY03ajh7Q
   SguNeCZm+PLqg2iekO/DuI2EjLsTe5e++4COJcm4Fv8MsJ1dZ652o0y+k
   vGjeNNEaZv2CzTF9PrIux00jMp50TZSKc/PdONoqdNANqiqTrqdZZZpKK
   18NTDhg0jz/GI/UEuLbB+GSdn6XZQ1VegdJ25hbzh63JLd6+X1o8faZta
   QvzxuiAi29c9bp6KgpKifT4Y5gWMKBY0u7IgVSr3GRUeg5DbDN9+irPGH
   iqLm+BMbZ4rYHaUymCXI9MGmTfSAWH1jObTx7sG0NypCavJAaa703RPXP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370464192"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="370464192"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 20:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="804974473"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="804974473"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 20:04:23 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWpme-00022E-1n;
	Fri, 18 Aug 2023 03:04:20 +0000
Date: Fri, 18 Aug 2023 11:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Nicolas Boichat <drinkcat@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 7737/9999]
 drivers/gpu/drm/bridge/parade-ps8640.c:399:5: warning: no previous
 declaration for 'ps8640_bridge_attach'
Message-ID: <202308181049.AlbqqCrG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hsin-Yi,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: e09a9439c5a794b24f73e6909d8eba778e3e3041 [7737/9999] FIXUP: FROMLIST: drm/bridge: Add I2C based driver for ps8640 bridge
config: i386-randconfig-i061-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181049.AlbqqCrG-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181049.AlbqqCrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181049.AlbqqCrG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/parade-ps8640.c:399:5: sparse: sparse: symbol 'ps8640_bridge_attach' was not declared. Should it be static?
>> drivers/gpu/drm/bridge/parade-ps8640.c:399:5: warning: no previous declaration for 'ps8640_bridge_attach' [-Wmissing-declarations]
    int ps8640_bridge_attach(struct drm_bridge *bridge)
        ^~~~~~~~~~~~~~~~~~~~


vim +/ps8640_bridge_attach +399 drivers/gpu/drm/bridge/parade-ps8640.c

71e4156c5ec43f Jitao Shi    2016-11-14  398  
71e4156c5ec43f Jitao Shi    2016-11-14 @399  int ps8640_bridge_attach(struct drm_bridge *bridge)
71e4156c5ec43f Jitao Shi    2016-11-14  400  {
71e4156c5ec43f Jitao Shi    2016-11-14  401  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
71e4156c5ec43f Jitao Shi    2016-11-14  402  	struct device *dev = &ps_bridge->page[0]->dev;
71e4156c5ec43f Jitao Shi    2016-11-14  403  	struct device_node *in_ep, *dsi_node = NULL;
71e4156c5ec43f Jitao Shi    2016-11-14  404  	struct mipi_dsi_device *dsi;
71e4156c5ec43f Jitao Shi    2016-11-14  405  	struct mipi_dsi_host *host = NULL;
71e4156c5ec43f Jitao Shi    2016-11-14  406  	int ret;
71e4156c5ec43f Jitao Shi    2016-11-14  407  	const struct mipi_dsi_device_info info = { .type = "ps8640",
71e4156c5ec43f Jitao Shi    2016-11-14  408  						   .channel = 0,
71e4156c5ec43f Jitao Shi    2016-11-14  409  						   .node = NULL,
71e4156c5ec43f Jitao Shi    2016-11-14  410  						 };
71e4156c5ec43f Jitao Shi    2016-11-14  411  
71e4156c5ec43f Jitao Shi    2016-11-14  412  	ret = drm_connector_init(bridge->dev, &ps_bridge->connector,
71e4156c5ec43f Jitao Shi    2016-11-14  413  				 &ps8640_connector_funcs,
71e4156c5ec43f Jitao Shi    2016-11-14  414  				 DRM_MODE_CONNECTOR_eDP);
71e4156c5ec43f Jitao Shi    2016-11-14  415  
71e4156c5ec43f Jitao Shi    2016-11-14  416  	if (ret) {
71e4156c5ec43f Jitao Shi    2016-11-14  417  		DRM_ERROR("Failed to initialize connector with drm: %d\n", ret);
71e4156c5ec43f Jitao Shi    2016-11-14  418  		return ret;
71e4156c5ec43f Jitao Shi    2016-11-14  419  	}
71e4156c5ec43f Jitao Shi    2016-11-14  420  
71e4156c5ec43f Jitao Shi    2016-11-14  421  	drm_connector_helper_add(&ps_bridge->connector,
71e4156c5ec43f Jitao Shi    2016-11-14  422  				 &ps8640_connector_helper_funcs);
71e4156c5ec43f Jitao Shi    2016-11-14  423  
71e4156c5ec43f Jitao Shi    2016-11-14  424  	ps_bridge->connector.dpms = DRM_MODE_DPMS_ON;
e09a9439c5a794 Hsin-Yi Wang 2019-07-18  425  	drm_connector_attach_encoder(&ps_bridge->connector,
71e4156c5ec43f Jitao Shi    2016-11-14  426  					  bridge->encoder);
71e4156c5ec43f Jitao Shi    2016-11-14  427  
71e4156c5ec43f Jitao Shi    2016-11-14  428  	if (ps_bridge->panel)
71e4156c5ec43f Jitao Shi    2016-11-14  429  		drm_panel_attach(ps_bridge->panel, &ps_bridge->connector);
71e4156c5ec43f Jitao Shi    2016-11-14  430  
71e4156c5ec43f Jitao Shi    2016-11-14  431  	/* port@0 is ps8640 dsi input port */
71e4156c5ec43f Jitao Shi    2016-11-14  432  	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
71e4156c5ec43f Jitao Shi    2016-11-14  433  	if (in_ep) {
71e4156c5ec43f Jitao Shi    2016-11-14  434  		dsi_node = of_graph_get_remote_port_parent(in_ep);
71e4156c5ec43f Jitao Shi    2016-11-14  435  		of_node_put(in_ep);
71e4156c5ec43f Jitao Shi    2016-11-14  436  	}
71e4156c5ec43f Jitao Shi    2016-11-14  437  
71e4156c5ec43f Jitao Shi    2016-11-14  438  	if (dsi_node) {
71e4156c5ec43f Jitao Shi    2016-11-14  439  		host = of_find_mipi_dsi_host_by_node(dsi_node);
71e4156c5ec43f Jitao Shi    2016-11-14  440  		of_node_put(dsi_node);
71e4156c5ec43f Jitao Shi    2016-11-14  441  		if (!host) {
71e4156c5ec43f Jitao Shi    2016-11-14  442  			ret = -ENODEV;
71e4156c5ec43f Jitao Shi    2016-11-14  443  			goto err;
71e4156c5ec43f Jitao Shi    2016-11-14  444  		}
71e4156c5ec43f Jitao Shi    2016-11-14  445  	}
71e4156c5ec43f Jitao Shi    2016-11-14  446  
71e4156c5ec43f Jitao Shi    2016-11-14  447  	dsi = mipi_dsi_device_register_full(host, &info);
71e4156c5ec43f Jitao Shi    2016-11-14  448  	if (IS_ERR(dsi)) {
71e4156c5ec43f Jitao Shi    2016-11-14  449  		dev_err(dev, "failed to create dsi device\n");
71e4156c5ec43f Jitao Shi    2016-11-14  450  		ret = PTR_ERR(dsi);
71e4156c5ec43f Jitao Shi    2016-11-14  451  		goto err;
71e4156c5ec43f Jitao Shi    2016-11-14  452  	}
71e4156c5ec43f Jitao Shi    2016-11-14  453  
71e4156c5ec43f Jitao Shi    2016-11-14  454  	ps_bridge->dsi = dsi;
71e4156c5ec43f Jitao Shi    2016-11-14  455  
71e4156c5ec43f Jitao Shi    2016-11-14  456  	dsi->host = host;
71e4156c5ec43f Jitao Shi    2016-11-14  457  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
71e4156c5ec43f Jitao Shi    2016-11-14  458  				     MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
71e4156c5ec43f Jitao Shi    2016-11-14  459  	dsi->format = MIPI_DSI_FMT_RGB888;
71e4156c5ec43f Jitao Shi    2016-11-14  460  	dsi->lanes = 4;
71e4156c5ec43f Jitao Shi    2016-11-14  461  	ret = mipi_dsi_attach(dsi);
71e4156c5ec43f Jitao Shi    2016-11-14  462  	if (ret)
71e4156c5ec43f Jitao Shi    2016-11-14  463  		goto err_dsi_attach;
71e4156c5ec43f Jitao Shi    2016-11-14  464  
71e4156c5ec43f Jitao Shi    2016-11-14  465  	return 0;
71e4156c5ec43f Jitao Shi    2016-11-14  466  
71e4156c5ec43f Jitao Shi    2016-11-14  467  err_dsi_attach:
71e4156c5ec43f Jitao Shi    2016-11-14  468  	mipi_dsi_device_unregister(dsi);
71e4156c5ec43f Jitao Shi    2016-11-14  469  err:
71e4156c5ec43f Jitao Shi    2016-11-14  470  	if (ps_bridge->panel)
71e4156c5ec43f Jitao Shi    2016-11-14  471  		drm_panel_detach(ps_bridge->panel);
71e4156c5ec43f Jitao Shi    2016-11-14  472  	drm_connector_cleanup(&ps_bridge->connector);
71e4156c5ec43f Jitao Shi    2016-11-14  473  	return ret;
71e4156c5ec43f Jitao Shi    2016-11-14  474  }
71e4156c5ec43f Jitao Shi    2016-11-14  475  

:::::: The code at line 399 was first introduced by commit
:::::: 71e4156c5ec43f72077bb1f50882f588cfd71d71 FROMLIST: drm/bridge: Add I2C based driver for ps8640 bridge

:::::: TO: Jitao Shi <jitao.shi@mediatek.com>
:::::: CC: Commit Bot <commit-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
