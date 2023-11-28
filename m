Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAF5D49C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVYvvJQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701184802; x=1732720802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yorjr+FLuEerjLFbmhRVD/zWcbcrZNeZNRN4NwLHaQc=;
  b=hVYvvJQDbVCgluKbQHi3xhh+UmuNCqIZYtuxw4RdaJ6RG3u2PGZRCcjg
   8+u5+DXE+btjvqLglae5KEroN7flJeHNVhJlNYayxjvv3mlk0u7iaW0C9
   hJ3rvWaCYQQMilALtH1HVXsa8UIrWCA8fD/bdZJtltQ+6uSYgiEFJKbqA
   NE6JzrtyrYjVVTAUdgIlYbeWTWbtBQ/OuepGcaZ3+JJzWUL1hu0FOwFA1
   F/hUhRptHK4wWroK+MFM3KVKCifnDx44fb3RH5Km/ZujqNnF4HLqMP6/p
   8gcIH+qhXMzc3jCfPXJsWe1bGBvw3jXgXRrjwjLSHlcC1N6s8ijBby5BL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479140064"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="479140064"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:20:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886446732"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="886446732"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2023 07:20:00 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7zsT-0007fw-2s;
	Tue, 28 Nov 2023 15:19:57 +0000
Date: Tue, 28 Nov 2023 23:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 17/45] drm/connector: hdmi: Add Infoframes generation
Message-ID: <202311282351.oUjk98pi-lkp@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-17-c7602158306e@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-17-c7602158306e@kernel.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on sunxi/sunxi/for-next drm/drm-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Add-atomic-helpers/20231128-193409
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-17-c7602158306e%40kernel.org
patch subject: [PATCH v4 17/45] drm/connector: hdmi: Add Infoframes generation
config: arm-hisi_defconfig (https://download.01.org/0day-ci/archive/20231128/202311282351.oUjk98pi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311282351.oUjk98pi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311282351.oUjk98pi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_connector.c: In function 'drmm_connector_hdmi_init':
>> drivers/gpu/drm/drm_connector.c:519:9: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
     519 |         strncpy(connector->hdmi.vendor, vendor, sizeof(connector->hdmi.vendor));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_connector.c:520:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
     520 |         strncpy(connector->hdmi.product, product, sizeof(connector->hdmi.product));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +519 drivers/gpu/drm/drm_connector.c

   457	
   458	/**
   459	 * drmm_connector_hdmi_init - Init a preallocated HDMI connector
   460	 * @dev: DRM device
   461	 * @connector: A pointer to the HDMI connector to init
   462	 * @vendor: HDMI Controller Vendor name
   463	 * @product: HDMI Controller Product name
   464	 * @funcs: callbacks for this connector
   465	 * @hdmi_funcs: HDMI-related callbacks for this connector
   466	 * @connector_type: user visible type of the connector
   467	 * @ddc: optional pointer to the associated ddc adapter
   468	 * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
   469	 * @max_bpc: Maximum bits per char the HDMI connector supports
   470	 *
   471	 * Initialises a preallocated HDMI connector. Connectors can be
   472	 * subclassed as part of driver connector objects.
   473	 *
   474	 * Cleanup is automatically handled with a call to
   475	 * drm_connector_cleanup() in a DRM-managed action.
   476	 *
   477	 * The connector structure should be allocated with drmm_kzalloc().
   478	 *
   479	 * Returns:
   480	 * Zero on success, error code on failure.
   481	 */
   482	int drmm_connector_hdmi_init(struct drm_device *dev,
   483				     struct drm_connector *connector,
   484				     const char *vendor, const char *product,
   485				     const struct drm_connector_funcs *funcs,
   486				     const struct drm_connector_hdmi_funcs *hdmi_funcs,
   487				     int connector_type,
   488				     struct i2c_adapter *ddc,
   489				     unsigned long supported_formats,
   490				     unsigned int max_bpc)
   491	{
   492		int ret;
   493	
   494		if (!vendor || !product)
   495			return -EINVAL;
   496	
   497		if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
   498		    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
   499			return -EINVAL;
   500	
   501		if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
   502		      connector_type == DRM_MODE_CONNECTOR_HDMIB))
   503			return -EINVAL;
   504	
   505		if (!hdmi_funcs)
   506			return -EINVAL;
   507	
   508		if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
   509			return -EINVAL;
   510	
   511		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
   512			return -EINVAL;
   513	
   514		ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
   515		if (ret)
   516			return ret;
   517	
   518		connector->hdmi.supported_formats = supported_formats;
 > 519		strncpy(connector->hdmi.vendor, vendor, sizeof(connector->hdmi.vendor));
   520		strncpy(connector->hdmi.product, product, sizeof(connector->hdmi.product));
   521	
   522		ret = drmm_mutex_init(dev, &connector->hdmi.infoframes.lock);
   523		if (ret)
   524			return ret;
   525	
   526		/*
   527		 * drm_connector_attach_max_bpc_property() requires the
   528		 * connector to have a state.
   529		 */
   530		if (connector->funcs->reset)
   531			connector->funcs->reset(connector);
   532	
   533		drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
   534		connector->max_bpc = max_bpc;
   535	
   536		if (max_bpc > 8)
   537			drm_connector_attach_hdr_output_metadata_property(connector);
   538	
   539		connector->hdmi.funcs = hdmi_funcs;
   540	
   541		return 0;
   542	}
   543	EXPORT_SYMBOL(drmm_connector_hdmi_init);
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
