Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D1749F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694292052; x=1725828052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LDI0VMZqx44SxMaMnjbpULuXv6wIY7riK1Zvq60bVQ=;
  b=H8xgrbi+sZNmvDt+xG8fctiNd43ZVkPD+dM9fWujGqUjmdEf3TNU1IKF
   u5tS1BlD36EFpNOonLh//x6lQDjMkm9hsy2J8ZuEzjCMWvZWK//wlQskv
   iJDQ9iJ4dQioGYCxGdj8t25kp0ubFssXltwQQwYcRf9sm95x4snFHh4NC
   sxGJxse+yt0nJweEW5Qe7CDZS3kODfdDyyGoP/nGNBC4KrxteLAlm642X
   NP3ubfg8HG6ennohEzSm6v0ahf6voazeakbd/zAlu/05bT10icWjCBqrV
   tdGTQlUsrJWqbsWQbnzaKi/I/uV6ApKvdj+5G8OZWF0ed5QNuvzJpp88T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441861269"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441861269"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 13:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736324196"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="736324196"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 13:40:48 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf4l3-0003ux-2k;
	Sat, 09 Sep 2023 20:40:45 +0000
Date: Sun, 10 Sep 2023 04:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 1086/25020]
 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:46: warning: 'enum
 drm_bridge_attach_flags' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202309100412.QmzjehEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 01b3ca33576ed0ed20387dd52f88a106b1d96a54 [1086/25020] LF-811-1: drm/bridge: Add driver for legacy Freescale Seiko 43WVFIG adapter
config: x86_64-randconfig-r022-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100412.QmzjehEk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100412.QmzjehEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100412.QmzjehEk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:30:33: error: field 'bridge' has incomplete type
      30 |         struct drm_bridge       bridge;
         |                                 ^~~~~~
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:46: warning: 'enum drm_bridge_attach_flags' declared inside parameter list will not be visible outside of this definition or declaration
      80 |                                         enum drm_bridge_attach_flags flags)
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:70: error: parameter 2 ('flags') has incomplete type
      80 |                                         enum drm_bridge_attach_flags flags)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:79:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      79 | static int seiko_adapter_bridge_attach(struct drm_bridge *bridge,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_attach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:82:44: error: invalid use of undefined type 'struct drm_bridge'
      82 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:84:45: error: invalid use of undefined type 'struct drm_bridge'
      84 |         struct drm_encoder *encoder = bridge->encoder;
         |                                             ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_detach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:118:44: error: invalid use of undefined type 'struct drm_bridge'
     118 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_enable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:125:44: error: invalid use of undefined type 'struct drm_bridge'
     125 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_disable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:141:44: error: invalid use of undefined type 'struct drm_bridge'
     141 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:153:21: error: variable 'seiko_adapter_bridge_funcs' has initializer but incomplete type
     153 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:154:10: error: 'const struct drm_bridge_funcs' has no member named 'enable'
     154 |         .enable = seiko_adapter_bridge_enable,
         |          ^~~~~~
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:154:19: warning: excess elements in struct initializer
     154 |         .enable = seiko_adapter_bridge_enable,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:154:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:155:10: error: 'const struct drm_bridge_funcs' has no member named 'disable'
     155 |         .disable = seiko_adapter_bridge_disable,
         |          ^~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:155:20: warning: excess elements in struct initializer
     155 |         .disable = seiko_adapter_bridge_disable,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:155:20: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:156:10: error: 'const struct drm_bridge_funcs' has no member named 'attach'
     156 |         .attach = seiko_adapter_bridge_attach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:156:19: warning: excess elements in struct initializer
     156 |         .attach = seiko_adapter_bridge_attach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:156:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:157:10: error: 'const struct drm_bridge_funcs' has no member named 'detach'
     157 |         .detach = seiko_adapter_bridge_detach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:157:19: warning: excess elements in struct initializer
     157 |         .detach = seiko_adapter_bridge_detach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:157:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_probe':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:206:9: error: implicit declaration of function 'drm_bridge_add' [-Werror=implicit-function-declaration]
     206 |         drm_bridge_add(&adap->bridge);
         |         ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:153:38: error: storage size of 'seiko_adapter_bridge_funcs' isn't known
     153 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +80 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c

    78	
    79	static int seiko_adapter_bridge_attach(struct drm_bridge *bridge,
  > 80						enum drm_bridge_attach_flags flags)
    81	{
    82		struct seiko_adapter *adap = bridge->driver_private;
    83		struct device *dev = adap->dev;
    84		struct drm_encoder *encoder = bridge->encoder;
    85		struct drm_device *drm;
    86		int ret = 0;
    87	
    88		if (!encoder) {
    89			DRM_DEV_ERROR(dev, "Parent encoder object not found\n");
    90			return -ENODEV;
    91		}
    92	
    93		drm = encoder->dev;
    94	
    95		/*
    96		 * Create the connector for our panel
    97		 */
    98	
    99		ret = drm_connector_init(drm, &adap->connector,
   100					 &seiko_adapter_connector_funcs,
   101					 DRM_MODE_CONNECTOR_DPI);
   102		if (ret) {
   103			DRM_DEV_ERROR(dev, "Failed to init drm connector: %d\n", ret);
   104			return ret;
   105		}
   106	
   107		drm_connector_helper_add(&adap->connector,
   108					 &seiko_adapter_connector_helper_funcs);
   109	
   110		adap->connector.dpms = DRM_MODE_DPMS_OFF;
   111		drm_connector_attach_encoder(&adap->connector, encoder);
   112	
   113		return ret;
   114	}
   115	
   116	static void seiko_adapter_bridge_detach(struct drm_bridge *bridge)
   117	{
   118		struct seiko_adapter *adap = bridge->driver_private;
   119	
   120		drm_connector_cleanup(&adap->connector);
   121	}
   122	
   123	static void seiko_adapter_bridge_enable(struct drm_bridge *bridge)
   124	{
   125		struct seiko_adapter *adap = bridge->driver_private;
   126		struct device *dev = adap->dev;
   127	
   128		if (drm_panel_prepare(adap->panel)) {
   129			DRM_DEV_ERROR(dev, "Failed to prepare panel\n");
   130			return;
   131		}
   132	
   133		if (drm_panel_enable(adap->panel)) {
   134			DRM_DEV_ERROR(dev, "Failed to enable panel\n");
   135			drm_panel_unprepare(adap->panel);
   136		}
   137	}
   138	
   139	static void seiko_adapter_bridge_disable(struct drm_bridge *bridge)
   140	{
   141		struct seiko_adapter *adap = bridge->driver_private;
   142		struct device *dev = adap->dev;
   143	
   144		if (drm_panel_disable(adap->panel)) {
   145			DRM_DEV_ERROR(dev, "failed to disable panel\n");
   146			return;
   147		}
   148	
   149		if (drm_panel_unprepare(adap->panel))
   150			DRM_DEV_ERROR(dev, "failed to unprepare panel\n");
   151	}
   152	
   153	static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
 > 154		.enable = seiko_adapter_bridge_enable,
   155		.disable = seiko_adapter_bridge_disable,
   156		.attach = seiko_adapter_bridge_attach,
   157		.detach = seiko_adapter_bridge_detach,
   158	};
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
