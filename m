Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4274DDDD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692259676; x=1723795676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZueR1NaQZAIF0L3TgBvwy3gjInAdayCoU0e/MrAKFMc=;
  b=NvmHU1obruHviTLjmBrslCxdisn3lsZQODJoay+hp/6ECYuYkwScbOJR
   nb6Xq2gYxxScG2y5RAh4DNB9EJBMg1bfqXbtypfuJtlvdQoV90RbbIS5P
   wBTkBUtJuF4OWcvKi0hHQ/rP4I9W0dlPPywiUcndXK1Ft+f3mri0U3TkC
   3xabEBIvxB+a4nYAQoIkKyIuM7SVeynPYT4g8IF+skodE4Gl7sVV3kEs5
   x+tli5k712egs4E8EMzLiQq4Dd/Tua3jj43F6PF0IuIjUVOzKZn+NrD/6
   zXlnsZbJ3I7gOGLapd9t/SM5HtnBlW36pZWKpgocaU4EHwcQfGwcX1y8T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362896116"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="362896116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769522331"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="769522331"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 01:07:48 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWY2k-0000w2-0Q;
	Thu, 17 Aug 2023 08:07:46 +0000
Date: Thu, 17 Aug 2023 16:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/drm_connector.c:2261: warning: Function parameter or
 member 'connector' not described in
 'drm_connector_init_panel_orientation_property'
Message-ID: <202308171654.a7nqSf43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: b7741424e31ae702d95a1abe0f9ba5b3cde5d192 FROMLIST: gpu: drm: separate panel orientation property creating and value setting
date:   2 years, 3 months ago
config: x86_64-randconfig-x063-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171654.a7nqSf43-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171654.a7nqSf43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171654.a7nqSf43-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_connector.c:2261: warning: Function parameter or member 'connector' not described in 'drm_connector_init_panel_orientation_property'


vim +2261 drivers/gpu/drm/drm_connector.c

  2245	
  2246	/**
  2247	 * drm_connector_init_panel_orientation_property -
  2248	 * 	create the connector's panel orientation property
  2249	 *
  2250	 * This function attaches a "panel orientation" property to the connector
  2251	 * and initializes its value to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
  2252	 *
  2253	 * The value of the property can be set by drm_connector_set_panel_orientation()
  2254	 * or drm_connector_set_panel_orientation_with_quirk() later.
  2255	 *
  2256	 * Returns:
  2257	 * Zero on success, negative errno on failure.
  2258	 */
  2259	int drm_connector_init_panel_orientation_property(
  2260		struct drm_connector *connector)
> 2261	{
  2262		struct drm_device *dev = connector->dev;
  2263		struct drm_property *prop;
  2264	
  2265		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
  2266				"panel orientation",
  2267				drm_panel_orientation_enum_list,
  2268				ARRAY_SIZE(drm_panel_orientation_enum_list));
  2269		if (!prop)
  2270			return -ENOMEM;
  2271	
  2272		dev->mode_config.panel_orientation_property = prop;
  2273		drm_object_attach_property(&connector->base, prop,
  2274					   DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
  2275	
  2276		return 0;
  2277	}
  2278	EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
  2279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
