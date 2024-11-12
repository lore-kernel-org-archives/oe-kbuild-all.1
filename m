Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701F20E309
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404237; cv=none; b=NbE7Q7p/Ds6zHE160nUYAc22bEFEAJtMnDgdkxikj//HD9C1llJl+l8wf/5YV+1lYleXK7YnkR4PviqCenZhDskrfMbbYmh2/DNWEhTwZF8cfEBbVFs8cirwixFgX8uCMQEAwoWpsGIvtNiPzrr4D/UzwovuexLFArJSH2GsBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404237; c=relaxed/simple;
	bh=j1sJh+yv6ZDYJKKonCTcg6G0pMPLmx6xDBVtIlIRfjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFCqbP2gH+bB7NRf/1+D9QM1z32Kso7WInB+keN/euK8GH597MvxTLBAd/fRCmcPRaFeQX7JAJ656FU5se17+ssU6qgi8EMenXNLoXMCKCTiSq7JXYdS+r9Hgn/6qdXB9DeA8uEHo3S2YNHNIHRNBXkxNk9rs5Bi8xXtBnGDmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWoD4eAe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWoD4eAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731404235; x=1762940235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1sJh+yv6ZDYJKKonCTcg6G0pMPLmx6xDBVtIlIRfjI=;
  b=jWoD4eAeDUL8m6qp3zfL59e06pxnRKBBv6jK3JXyHduMvCxBV2dGXAqY
   7pYwOUI54HfnATDQR4cHkysJBlFJMwtugNA75QX6tVMR73Zj1YeXZJ1sS
   8LSrCaz+1BjDrQ9Tkq1XLqXzln0VroHs4oGlcVWAXEXfG59Ab9WjmQ/4g
   HSFE2Hql6lnDaTJn2+O/GLZ/zNffzfj0Bzv1oAfGHxbk+UGQLIYCh+jLY
   Yfo88BTuyjR5EWzw2B6TG2ZTCAFfxIqZyjnZFyg5U/KWhaE6qt3OFb/9q
   K7F/Lh0yZ6scq8mMxUaCK5/h8QUVHJ4/zLe4hrWg3y2VfGYHJiqq2O9Fr
   Q==;
X-CSE-ConnectionGUID: 9ue62jK2TRKhyH0MDpfUdg==
X-CSE-MsgGUID: 8Yt1IAk2Ss+xl1WaiPNgLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31324313"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31324313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:37:12 -0800
X-CSE-ConnectionGUID: 2RVy3QdGQpapY51N3oGpOQ==
X-CSE-MsgGUID: cix8ayfqSLKFcjo/C4pwVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87726528"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 01:37:12 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnKd-0000fy-2e;
	Tue, 12 Nov 2024 09:37:07 +0000
Date: Tue, 12 Nov 2024 17:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Shuo <lishuo@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2418/2418]
 drivers/gpu/drm/phytium/phytium_dp.c:300:17: warning: 'strncpy' output may
 be truncated copying 32 bytes from a string of length 439
Message-ID: <202411121753.yQqZUvdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   400fd9ccb52e01bf78acae2bbc1710923a15f033
commit: b2a83bcdafcaaaa60199147d04798d431cc800cc [2418/2418] DRM: Phytium display DRM driver
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241112/202411121753.yQqZUvdw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121753.yQqZUvdw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121753.yQqZUvdw-lkp@intel.com/

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
