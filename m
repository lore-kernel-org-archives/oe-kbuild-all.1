Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9D1CFA4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DavdUmJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704350853; x=1735886853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKMdHLD6Uwl0tRZzStJqMlCK9PMoUdkO3e6lztO6or8=;
  b=DavdUmJ3dGusmerLv+w+7dR3/m0Onqy3IMtwfN7hBBdn+a/PUiOFEV6r
   X7TyMCZuSBpQvJbiyGatdCOLKkEYl+ygudv2lMzI+wEDqwq0R95F9Cnnv
   6hBO1KnWFtY8n9bc4rn6/8R4Ig9JdIYC/UArjqtbyJmioC6g0vcDKMHHM
   9QXPoAqjzVUgzoFOZzfaGGcYTWyp1RL43j6hZZ5PV4q5JZnZMPg7QFn9W
   U+LhsBa6ovbkl6BS7bVnaWrN9pGgr6zSx1mxsy/bB++lhAu2Rs/AwxRBk
   YWRVXMUNYe975UyOU3j+x4E8m5ZzSv+5A0d7m6xi4FLYgiWwEhCWd0YvS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="376638665"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="376638665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 22:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="783762044"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="783762044"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jan 2024 22:47:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLHVm-000Mza-2i;
	Thu, 04 Jan 2024 06:47:26 +0000
Date: Thu, 4 Jan 2024 14:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 2/5] htmldocs:
 ./include/drm/drm_panel.h:270: warning: Function parameter or member
 'follower_lock' not described in 'drm_panel'
Message-ID: <202401041402.rNvaEQ9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   f823cc2073fc361f2ef5a1341648e0b98bf48c92
commit: 24e0ced4253f09c89883a0a16a3f37b74b683570 [2/5] UPSTREAM: drm/panel: Add a way for other devices to follow panel state
reproduce: (https://download.01.org/0day-ci/archive/20240104/202401041402.rNvaEQ9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041402.rNvaEQ9F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_panel.h:270: warning: Function parameter or member 'follower_lock' not described in 'drm_panel'

vim +270 ./include/drm/drm_panel.h

24e0ced4253f09 Douglas Anderson 2023-07-27  187  
83127f67e450a9 Thierry Reding   2016-05-06  188  /**
83127f67e450a9 Thierry Reding   2016-05-06  189   * struct drm_panel - DRM panel object
83127f67e450a9 Thierry Reding   2016-05-06  190   */
aead40ea0b53a0 Thierry Reding   2013-08-30  191  struct drm_panel {
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  192  	/**
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  193  	 * @dev:
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  194  	 *
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  195  	 * Parent device of the panel.
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  196  	 */
aead40ea0b53a0 Thierry Reding   2013-08-30  197  	struct device *dev;
aead40ea0b53a0 Thierry Reding   2013-08-30  198  
152dbdeab1b257 Sam Ravnborg     2019-12-07  199  	/**
152dbdeab1b257 Sam Ravnborg     2019-12-07  200  	 * @backlight:
152dbdeab1b257 Sam Ravnborg     2019-12-07  201  	 *
152dbdeab1b257 Sam Ravnborg     2019-12-07  202  	 * Backlight device, used to turn on backlight after the call
152dbdeab1b257 Sam Ravnborg     2019-12-07  203  	 * to enable(), and to turn off backlight before the call to
152dbdeab1b257 Sam Ravnborg     2019-12-07  204  	 * disable().
10f7b40e4f3050 Rajeev Nandan    2021-06-26  205  	 * backlight is set by drm_panel_of_backlight() or
10f7b40e4f3050 Rajeev Nandan    2021-06-26  206  	 * drm_panel_dp_aux_backlight() and drivers shall not assign it.
152dbdeab1b257 Sam Ravnborg     2019-12-07  207  	 */
152dbdeab1b257 Sam Ravnborg     2019-12-07  208  	struct backlight_device *backlight;
152dbdeab1b257 Sam Ravnborg     2019-12-07  209  
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  210  	/**
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  211  	 * @funcs:
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  212  	 *
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  213  	 * Operations that can be performed on the panel.
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  214  	 */
aead40ea0b53a0 Thierry Reding   2013-08-30  215  	const struct drm_panel_funcs *funcs;
aead40ea0b53a0 Thierry Reding   2013-08-30  216  
9a2654c0f62a17 Laurent Pinchart 2019-09-04  217  	/**
9a2654c0f62a17 Laurent Pinchart 2019-09-04  218  	 * @connector_type:
9a2654c0f62a17 Laurent Pinchart 2019-09-04  219  	 *
9a2654c0f62a17 Laurent Pinchart 2019-09-04  220  	 * Type of the panel as a DRM_MODE_CONNECTOR_* value. This is used to
9a2654c0f62a17 Laurent Pinchart 2019-09-04  221  	 * initialise the drm_connector corresponding to the panel with the
9a2654c0f62a17 Laurent Pinchart 2019-09-04  222  	 * correct connector type.
9a2654c0f62a17 Laurent Pinchart 2019-09-04  223  	 */
9a2654c0f62a17 Laurent Pinchart 2019-09-04  224  	int connector_type;
9a2654c0f62a17 Laurent Pinchart 2019-09-04  225  
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  226  	/**
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  227  	 * @list:
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  228  	 *
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  229  	 * Panel entry in registry.
8b0c6e2faa9749 Sam Ravnborg     2019-08-04  230  	 */
aead40ea0b53a0 Thierry Reding   2013-08-30  231  	struct list_head list;
7e9d4e1cef88cf Dave Stevenson   2022-12-05  232  
24e0ced4253f09 Douglas Anderson 2023-07-27  233  	/**
24e0ced4253f09 Douglas Anderson 2023-07-27  234  	 * @followers:
24e0ced4253f09 Douglas Anderson 2023-07-27  235  	 *
24e0ced4253f09 Douglas Anderson 2023-07-27  236  	 * A list of struct drm_panel_follower dependent on this panel.
24e0ced4253f09 Douglas Anderson 2023-07-27  237  	 */
24e0ced4253f09 Douglas Anderson 2023-07-27  238  	struct list_head followers;
24e0ced4253f09 Douglas Anderson 2023-07-27  239  
24e0ced4253f09 Douglas Anderson 2023-07-27  240  	/**
24e0ced4253f09 Douglas Anderson 2023-07-27  241  	 * @followers_lock:
24e0ced4253f09 Douglas Anderson 2023-07-27  242  	 *
24e0ced4253f09 Douglas Anderson 2023-07-27  243  	 * Lock for followers list.
24e0ced4253f09 Douglas Anderson 2023-07-27  244  	 */
24e0ced4253f09 Douglas Anderson 2023-07-27  245  	struct mutex follower_lock;
24e0ced4253f09 Douglas Anderson 2023-07-27  246  
7e9d4e1cef88cf Dave Stevenson   2022-12-05  247  	/**
7e9d4e1cef88cf Dave Stevenson   2022-12-05  248  	 * @prepare_prev_first:
7e9d4e1cef88cf Dave Stevenson   2022-12-05  249  	 *
7e9d4e1cef88cf Dave Stevenson   2022-12-05  250  	 * The previous controller should be prepared first, before the prepare
7e9d4e1cef88cf Dave Stevenson   2022-12-05  251  	 * for the panel is called. This is largely required for DSI panels
7e9d4e1cef88cf Dave Stevenson   2022-12-05  252  	 * where the DSI host controller should be initialised to LP-11 before
7e9d4e1cef88cf Dave Stevenson   2022-12-05  253  	 * the panel is powered up.
7e9d4e1cef88cf Dave Stevenson   2022-12-05  254  	 */
7e9d4e1cef88cf Dave Stevenson   2022-12-05  255  	bool prepare_prev_first;
67bab683a3e40e Douglas Anderson 2023-07-27  256  
67bab683a3e40e Douglas Anderson 2023-07-27  257  	/**
67bab683a3e40e Douglas Anderson 2023-07-27  258  	 * @prepared:
67bab683a3e40e Douglas Anderson 2023-07-27  259  	 *
67bab683a3e40e Douglas Anderson 2023-07-27  260  	 * If true then the panel has been prepared.
67bab683a3e40e Douglas Anderson 2023-07-27  261  	 */
67bab683a3e40e Douglas Anderson 2023-07-27  262  	bool prepared;
67bab683a3e40e Douglas Anderson 2023-07-27  263  
67bab683a3e40e Douglas Anderson 2023-07-27  264  	/**
67bab683a3e40e Douglas Anderson 2023-07-27  265  	 * @enabled:
67bab683a3e40e Douglas Anderson 2023-07-27  266  	 *
67bab683a3e40e Douglas Anderson 2023-07-27  267  	 * If true then the panel has been enabled.
67bab683a3e40e Douglas Anderson 2023-07-27  268  	 */
67bab683a3e40e Douglas Anderson 2023-07-27  269  	bool enabled;
aead40ea0b53a0 Thierry Reding   2013-08-30 @270  };
aead40ea0b53a0 Thierry Reding   2013-08-30  271  

:::::: The code at line 270 was first introduced by commit
:::::: aead40ea0b53a0e28d34adf7bb923ecb2968c04a drm: Add panel support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
