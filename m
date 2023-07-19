Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE9275B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 19:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689794159; x=1721330159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lPrp4uIR3lK2v2HGZGaPDIudB79Rr8BY+dWBPwlC3Qk=;
  b=PV7MzYN0l8cPT5twt/cxIGUlol4FUyx5rAVV3kBB8UfhuWGnaJZwMWpH
   JL0Zwp9CQdBzzscbf1wMzUPWK0FovqGOy5GlPL//QZ813v9NKLdkLlArX
   M3hvPX2UpLdRHzWvKkBCnLX0xu0nk+HyjNuYKRmgHiBIsGQX0icQ3Omg1
   mfA7fuJd2/qyo67VkKFy1UAIrsegJ9JkhBkNW9ON7JKPz82eAoKKd3fN4
   ZyY1zCvVijWXzxROhXlWoBlfRNZKRlR2gMtq5gSMiD1UPqSd0LGEnlT4g
   EkkFqcCBx3lC9ZUSQwz4qInwmTepyxP6psyZysoxXygmNkjihdblCo4hR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366590958"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366590958"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 12:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848153634"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848153634"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 12:15:56 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMCeR-0005On-36;
	Wed, 19 Jul 2023 19:15:55 +0000
Date: Thu, 20 Jul 2023 03:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 1029/12469]
 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:81:46: warning: 'enum
 drm_bridge_attach_flags' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202307200320.PZKx9zSp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: 612415dabcc0818c0bf4decc70c281ae067214f8 [1029/12469] LF-811-1: drm/bridge: Add driver for legacy Freescale Seiko 43WVFIG adapter
config: m68k-randconfig-r035-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200320.PZKx9zSp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200320.PZKx9zSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200320.PZKx9zSp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:31:33: error: field 'bridge' has incomplete type
      31 |         struct drm_bridge       bridge;
         |                                 ^~~~~~
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:81:46: warning: 'enum drm_bridge_attach_flags' declared inside parameter list will not be visible outside of this definition or declaration
      81 |                                         enum drm_bridge_attach_flags flags)
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:81:70: error: parameter 2 ('flags') has incomplete type
      81 |                                         enum drm_bridge_attach_flags flags)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:80:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      80 | static int seiko_adapter_bridge_attach(struct drm_bridge *bridge,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_attach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:83:44: error: invalid use of undefined type 'struct drm_bridge'
      83 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:85:45: error: invalid use of undefined type 'struct drm_bridge'
      85 |         struct drm_encoder *encoder = bridge->encoder;
         |                                             ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_detach':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:119:44: error: invalid use of undefined type 'struct drm_bridge'
     119 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_enable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:126:44: error: invalid use of undefined type 'struct drm_bridge'
     126 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_bridge_disable':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:142:44: error: invalid use of undefined type 'struct drm_bridge'
     142 |         struct seiko_adapter *adap = bridge->driver_private;
         |                                            ^~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:154:21: error: variable 'seiko_adapter_bridge_funcs' has initializer but incomplete type
     154 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                     ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:155:10: error: 'const struct drm_bridge_funcs' has no member named 'enable'
     155 |         .enable = seiko_adapter_bridge_enable,
         |          ^~~~~~
>> drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:155:19: warning: excess elements in struct initializer
     155 |         .enable = seiko_adapter_bridge_enable,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:155:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:156:10: error: 'const struct drm_bridge_funcs' has no member named 'disable'
     156 |         .disable = seiko_adapter_bridge_disable,
         |          ^~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:156:20: warning: excess elements in struct initializer
     156 |         .disable = seiko_adapter_bridge_disable,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:156:20: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:157:10: error: 'const struct drm_bridge_funcs' has no member named 'attach'
     157 |         .attach = seiko_adapter_bridge_attach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:157:19: warning: excess elements in struct initializer
     157 |         .attach = seiko_adapter_bridge_attach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:157:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:158:10: error: 'const struct drm_bridge_funcs' has no member named 'detach'
     158 |         .detach = seiko_adapter_bridge_detach,
         |          ^~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:158:19: warning: excess elements in struct initializer
     158 |         .detach = seiko_adapter_bridge_detach,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:158:19: note: (near initialization for 'seiko_adapter_bridge_funcs')
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: In function 'seiko_adapter_probe':
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:207:9: error: implicit declaration of function 'drm_bridge_add' [-Werror=implicit-function-declaration]
     207 |         drm_bridge_add(&adap->bridge);
         |         ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c: At top level:
   drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c:154:38: error: storage size of 'seiko_adapter_bridge_funcs' isn't known
     154 | static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +81 drivers/gpu/drm/bridge/nxp-seiko-43wvfig.c

    79	
    80	static int seiko_adapter_bridge_attach(struct drm_bridge *bridge,
  > 81						enum drm_bridge_attach_flags flags)
    82	{
    83		struct seiko_adapter *adap = bridge->driver_private;
    84		struct device *dev = adap->dev;
    85		struct drm_encoder *encoder = bridge->encoder;
    86		struct drm_device *drm;
    87		int ret = 0;
    88	
    89		if (!encoder) {
    90			DRM_DEV_ERROR(dev, "Parent encoder object not found\n");
    91			return -ENODEV;
    92		}
    93	
    94		drm = encoder->dev;
    95	
    96		/*
    97		 * Create the connector for our panel
    98		 */
    99	
   100		ret = drm_connector_init(drm, &adap->connector,
   101					 &seiko_adapter_connector_funcs,
   102					 DRM_MODE_CONNECTOR_DPI);
   103		if (ret) {
   104			DRM_DEV_ERROR(dev, "Failed to init drm connector: %d\n", ret);
   105			return ret;
   106		}
   107	
   108		drm_connector_helper_add(&adap->connector,
   109					 &seiko_adapter_connector_helper_funcs);
   110	
   111		adap->connector.dpms = DRM_MODE_DPMS_OFF;
   112		drm_connector_attach_encoder(&adap->connector, encoder);
   113	
   114		return ret;
   115	}
   116	
   117	static void seiko_adapter_bridge_detach(struct drm_bridge *bridge)
   118	{
   119		struct seiko_adapter *adap = bridge->driver_private;
   120	
   121		drm_connector_cleanup(&adap->connector);
   122	}
   123	
   124	static void seiko_adapter_bridge_enable(struct drm_bridge *bridge)
   125	{
   126		struct seiko_adapter *adap = bridge->driver_private;
   127		struct device *dev = adap->dev;
   128	
   129		if (drm_panel_prepare(adap->panel)) {
   130			DRM_DEV_ERROR(dev, "Failed to prepare panel\n");
   131			return;
   132		}
   133	
   134		if (drm_panel_enable(adap->panel)) {
   135			DRM_DEV_ERROR(dev, "Failed to enable panel\n");
   136			drm_panel_unprepare(adap->panel);
   137		}
   138	}
   139	
   140	static void seiko_adapter_bridge_disable(struct drm_bridge *bridge)
   141	{
   142		struct seiko_adapter *adap = bridge->driver_private;
   143		struct device *dev = adap->dev;
   144	
   145		if (drm_panel_disable(adap->panel)) {
   146			DRM_DEV_ERROR(dev, "failed to disable panel\n");
   147			return;
   148		}
   149	
   150		if (drm_panel_unprepare(adap->panel))
   151			DRM_DEV_ERROR(dev, "failed to unprepare panel\n");
   152	}
   153	
   154	static const struct drm_bridge_funcs seiko_adapter_bridge_funcs = {
 > 155		.enable = seiko_adapter_bridge_enable,
   156		.disable = seiko_adapter_bridge_disable,
   157		.attach = seiko_adapter_bridge_attach,
   158		.detach = seiko_adapter_bridge_detach,
   159	};
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
