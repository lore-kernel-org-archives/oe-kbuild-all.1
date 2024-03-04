Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE5A4C69
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 04:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709524929; cv=none; b=ltRgp6bPi/N3bfoAEmbyXx2P9v9srt/8ZiKfLcgMRRYtHV3nXXNylDjnsNUzlUofEnZbHG0tipz+zQ2PV6Beo0BseMkKwZ01dv8r1d34r2B5vlQau2peLagspLbHI5akU/rC1aIBARoL5hxeq1W9SMkWJo2vH4L+7hMnHLiUbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709524929; c=relaxed/simple;
	bh=jbDMdZAhcHQGdUFZ//q9dBwJqLjcwT4iPGW9alPOJJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIUl9GUlwY0ocko+We2hRp5hq1FDeMTFWcCSm12dUOvlYhSStTw9y7OILUKDxWLMvr4Pzrr+NAfs0RjoEfn+TES9QSqgc0XdYTX/d6WnSIM6GLVgPqXWp1tfU9pUr8RFBd3z+JhQpgJmxAmpFY6YOr5VNn+0I2rT6mvdAS87G5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gv0jhwbo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gv0jhwbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709524927; x=1741060927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jbDMdZAhcHQGdUFZ//q9dBwJqLjcwT4iPGW9alPOJJo=;
  b=gv0jhwbog9uDVQ1uUSQ/0YTLhqnFaQAxSYUwtsDp+zqBeS7QDPsc66N7
   LvYwngumpCiJdbTtUEqT3xu4KNZPZB6AUNnUXLNb6NS7DZahUPIFF04Sp
   kbvpurO1LnL0qLr2T4Hlpkod3zXwTDvJVuYsVPe6RjCJDICQGXrkZVYOi
   fNTgVXbmus5OJ06JYaB5sCRNYe5WRgBF+ombtEp8N1hlzCGwj/xf+O+O/
   kxIwa2Pqn4zex12HS+pMncLQ8TNKLkrV/ZRhY1zmjvXyj0Oasi4QY4JgJ
   UVHl9+Jih8rKYr/SS7d+hCk34X4Gb237hhxP0n1V4UXOFMePEoYjQv7iY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7770672"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7770672"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 20:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9216842"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2024 20:02:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgzWa-0002KV-2k;
	Mon, 04 Mar 2024 04:02:00 +0000
Date: Mon, 4 Mar 2024 12:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Shuo <lishuo@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25831/30000]
 drivers/gpu/drm/phytium/phytium_dp.c:300:17: warning: 'strncpy' output may
 be truncated copying 32 bytes from a string of length 439
Message-ID: <202403041133.ZJq3J9Jk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6adee00913b51cd59245584085cdaca64f74465c
commit: b2a83bcdafcaaaa60199147d04798d431cc800cc [25831/30000] DRM: Phytium display DRM driver
config: arm64-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240304/202403041133.ZJq3J9Jk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403041133.ZJq3J9Jk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041133.ZJq3J9Jk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_dp.c:503:6: warning: no previous prototype for 'phytium_dp_coding_8b10b_need_enable' [-Wmissing-prototypes]
     503 | bool phytium_dp_coding_8b10b_need_enable(unsigned char test_pattern)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:520:6: warning: no previous prototype for 'phytium_dp_scrambled_need_enable' [-Wmissing-prototypes]
     520 | bool phytium_dp_scrambled_need_enable(unsigned char test_pattern)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:653:6: warning: no previous prototype for 'phytium_dp_hw_enable_audio' [-Wmissing-prototypes]
     653 | void phytium_dp_hw_enable_audio(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:822:6: warning: no previous prototype for 'phytium_dp_hw_disable_video' [-Wmissing-prototypes]
     822 | void phytium_dp_hw_disable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:833:6: warning: no previous prototype for 'phytium_dp_hw_video_is_enable' [-Wmissing-prototypes]
     833 | bool phytium_dp_hw_video_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:844:6: warning: no previous prototype for 'phytium_dp_hw_enable_video' [-Wmissing-prototypes]
     844 | void phytium_dp_hw_enable_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:856:6: warning: no previous prototype for 'phytium_dp_hw_config_video' [-Wmissing-prototypes]
     856 | void phytium_dp_hw_config_video(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:945:6: warning: no previous prototype for 'phytium_dp_hw_disable_output' [-Wmissing-prototypes]
     945 | void phytium_dp_hw_disable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:957:6: warning: no previous prototype for 'phytium_dp_hw_enable_output' [-Wmissing-prototypes]
     957 | void phytium_dp_hw_enable_output(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:969:6: warning: no previous prototype for 'phytium_dp_hw_enable_input_source' [-Wmissing-prototypes]
     969 | void phytium_dp_hw_enable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:980:6: warning: no previous prototype for 'phytium_dp_hw_disable_input_source' [-Wmissing-prototypes]
     980 | void phytium_dp_hw_disable_input_source(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:990:6: warning: no previous prototype for 'phytium_dp_hw_output_is_enable' [-Wmissing-prototypes]
     990 | bool phytium_dp_hw_output_is_enable(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1027:6: warning: no previous prototype for 'phytium_dp_hw_hpd_irq_setup' [-Wmissing-prototypes]
    1027 | void phytium_dp_hw_hpd_irq_setup(struct phytium_dp_device *phytium_dp, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1042:5: warning: no previous prototype for 'phytium_dp_hw_init' [-Wmissing-prototypes]
    1042 | int phytium_dp_hw_init(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1220:6: warning: no previous prototype for 'phytium_dp_dpcd_sink_dpms' [-Wmissing-prototypes]
    1220 | void phytium_dp_dpcd_sink_dpms(struct phytium_dp_device *phytium_dp, int mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1445:5: warning: no previous prototype for 'phytium_dp_get_link_train_fallback_values' [-Wmissing-prototypes]
    1445 | int phytium_dp_get_link_train_fallback_values(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1494:5: warning: no previous prototype for 'phytium_dp_start_link_train' [-Wmissing-prototypes]
    1494 | int phytium_dp_start_link_train(struct phytium_dp_device *phytium_dp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1799:6: warning: no previous prototype for 'phytium_dp_hpd_poll_handler' [-Wmissing-prototypes]
    1799 | void phytium_dp_hpd_poll_handler(struct phytium_display_private *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:1946:6: warning: no previous prototype for 'phytium_dp_fast_link_train' [-Wmissing-prototypes]
    1946 | bool phytium_dp_fast_link_train(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2137:6: warning: no previous prototype for 'phytium_dp_adjust_link_train_parameter' [-Wmissing-prototypes]
    2137 | void phytium_dp_adjust_link_train_parameter(struct phytium_dp_device *phytium_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2197:1: warning: no previous prototype for 'phytium_encoder_mode_valid' [-Wmissing-prototypes]
    2197 | phytium_encoder_mode_valid(struct drm_encoder *encoder, const struct drm_display_mode *mode)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c:2447:5: warning: no previous prototype for 'phytium_get_encoder_crtc_mask' [-Wmissing-prototypes]
    2447 | int phytium_get_encoder_crtc_mask(struct phytium_dp_device *phytium_dp, int port)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_dp.c: In function 'phytium_connector_add_common_modes':
>> drivers/gpu/drm/phytium/phytium_dp.c:300:17: warning: 'strncpy' output may be truncated copying 32 bytes from a string of length 439 [-Wstringop-truncation]
     300 |                 strncpy(mode->name, common_mode[i].name, DRM_DISPLAY_MODE_LEN);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +300 drivers/gpu/drm/phytium/phytium_dp.c

   244	
   245	static int phytium_connector_add_common_modes(struct phytium_dp_device *phytium_dp)
   246	{
   247		int i = 0, ret = 0;
   248		struct drm_device *dev =  phytium_dp->dev;
   249		struct drm_display_mode *mode = NULL, *current_mode = NULL;
   250		struct drm_display_mode *native_mode = &phytium_dp->native_mode;
   251		bool mode_existed = false;
   252		struct mode_size {
   253			char name[DRM_DISPLAY_MODE_LEN];
   254			int w;
   255			int h;
   256		} common_mode[] = {
   257			{  "640x480",  640,  480},
   258			{  "800x600",  800,  600},
   259			{ "1024x768", 1024,  768},
   260			{ "1280x720", 1280,  720},
   261			{ "1280x800", 1280,  800},
   262			{"1280x1024", 1280, 1024},
   263			{ "1440x900", 1440,  900},
   264			{"1680x1050", 1680, 1050},
   265			{"1600x1200", 1600, 1200},
   266			{"1920x1080", 1920, 1080},
   267			{"1920x1200", 1920, 1200}
   268		};
   269	
   270		if (native_mode->clock == 0)
   271			return ret;
   272	
   273		for (i = 0; i < ARRAY_SIZE(common_mode); i++) {
   274			mode_existed = false;
   275	
   276			if (common_mode[i].w > native_mode->hdisplay ||
   277			    common_mode[i].h > native_mode->vdisplay ||
   278			    (common_mode[i].w == native_mode->hdisplay &&
   279			    common_mode[i].h == native_mode->vdisplay))
   280				continue;
   281	
   282			list_for_each_entry(current_mode, &phytium_dp->connector.probed_modes, head) {
   283				if (common_mode[i].w == current_mode->hdisplay &&
   284				    common_mode[i].h == current_mode->vdisplay) {
   285					mode_existed = true;
   286					break;
   287				}
   288			}
   289	
   290			if (mode_existed)
   291				continue;
   292	
   293			mode = drm_mode_duplicate(dev, native_mode);
   294			if (mode == NULL)
   295				continue;
   296	
   297			mode->hdisplay = common_mode[i].w;
   298			mode->vdisplay = common_mode[i].h;
   299			mode->type &= ~DRM_MODE_TYPE_PREFERRED;
 > 300			strncpy(mode->name, common_mode[i].name, DRM_DISPLAY_MODE_LEN);
   301			drm_mode_probed_add(&phytium_dp->connector, mode);
   302			ret++;
   303		}
   304	
   305		return ret;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
