Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254517D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 03:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695266062; x=1726802062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svFMjJcz8S5MVd5V6CbB2x+CEYUjCi1QHS+kuJsU6J4=;
  b=eW/ZyGIe4pUBMZjKak6t5zGu9RpLb7FBVRxxiHRkkVyvh6J0lgrDBDzU
   WfgbvZ5ZOMx5oYhFu9sWH8Ylsk1ECyZciWG4V6nQ9euZaEAvJRGEXsGtX
   Oc1eAHoi0wTI1PHwzgJaIealJIkdopzGmoJJmNqvvSLPhuzMtDEaHBfYb
   Qvz4xJUAibizTF2PiDk+yGFAXIhHQUOWuyNGjI1qG3+jr9GOkzQFhp0CV
   2+r0xuQUADFhHd3FpcefIZ3UMtJcWCEqMT/jL2Wkp7HtFhss243y6poVV
   Jro0AoARl9O2HilsFiRb7wLHO62UW2VcdYrXvi1CQgEi8vvqUKwbVHT3A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380318463"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="380318463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 20:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870628957"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="870628957"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 20:14:19 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjA8v-0009S8-11;
	Thu, 21 Sep 2023 03:14:17 +0000
Date: Thu, 21 Sep 2023 11:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes
 generation
Message-ID: <202309211006.mkd4viB6-lkp@intel.com>
References: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-11-17932daddd7d@kernel.org>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230920-224045
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-11-17932daddd7d%40kernel.org
patch subject: [PATCH RFC v2 11/37] drm/connector: hdmi: Add Infoframes generation
config: arm-aspeed_g5_defconfig (https://download.01.org/0day-ci/archive/20230921/202309211006.mkd4viB6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211006.mkd4viB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211006.mkd4viB6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `hdmi_generate_avi_infoframe':
>> drivers/gpu/drm/drm_atomic_state_helper.c:867:(.text+0x16b4): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> arm-linux-gnueabi-ld: drivers/gpu/drm/drm_atomic_state_helper.c:868:(.text+0x16c4): undefined reference to `drm_hdmi_avi_infoframe_bars'
   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `hdmi_generate_hdr_infoframe':
>> drivers/gpu/drm/drm_atomic_state_helper.c:912:(.text+0x1710): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]


vim +867 drivers/gpu/drm/drm_atomic_state_helper.c

   843	
   844	static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
   845					       struct drm_connector_state *state)
   846	{
   847		const struct drm_display_mode *mode =
   848			connector_state_get_adjusted_mode(state);
   849		struct drm_connector_hdmi_infoframe *infoframe =
   850			&state->hdmi.infoframes.avi;
   851		struct hdmi_avi_infoframe *frame =
   852			&infoframe->data.avi;
   853		bool is_lim_range =
   854			drm_atomic_helper_connector_hdmi_is_full_range(connector,
   855								       state);
   856		enum hdmi_quantization_range rgb_quant_range =
   857			is_lim_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
   858		int ret;
   859	
   860		ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
   861		if (ret)
   862			return ret;
   863	
   864		frame->colorspace = state->hdmi.output_format;
   865	
   866		drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
 > 867		drm_hdmi_avi_infoframe_colorimetry(frame, state);
 > 868		drm_hdmi_avi_infoframe_bars(frame, state);
   869	
   870		infoframe->set = true;
   871	
   872		return 0;
   873	}
   874	
   875	static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
   876					       struct drm_connector_state *state)
   877	{
   878		struct drm_connector_hdmi_infoframe *infoframe =
   879			&state->hdmi.infoframes.spd;
   880		struct hdmi_spd_infoframe *frame =
   881			&infoframe->data.spd;
   882		int ret;
   883	
   884		ret = hdmi_spd_infoframe_init(frame,
   885					      connector->hdmi.vendor,
   886					      connector->hdmi.product);
   887		if (ret)
   888			return ret;
   889	
   890		frame->sdi = HDMI_SPD_SDI_PC;
   891	
   892		infoframe->set = true;
   893	
   894		return 0;
   895	}
   896	
   897	static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
   898					       struct drm_connector_state *state)
   899	{
   900		struct drm_connector_hdmi_infoframe *infoframe =
   901			&state->hdmi.infoframes.drm;
   902		struct hdmi_drm_infoframe *frame =
   903			&infoframe->data.drm;
   904		int ret;
   905	
   906		if (connector->max_bpc < 10)
   907			return 0;
   908	
   909		if (!state->hdr_output_metadata)
   910			return 0;
   911	
 > 912		ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
   913		if (ret)
   914			return ret;
   915	
   916		infoframe->set = true;
   917	
   918		return 0;
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
