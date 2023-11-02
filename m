Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5479E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1Omvh/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698916828; x=1730452828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4s3aHUhpRXNVoEHM/m2gq2Nn1I8N+YN19KeMcOnjEW0=;
  b=i1Omvh/uFGgFrR/VpSOrShUOnRnHYrgB4jmDBNZKSxhtzpyrlNev5BJi
   PtsxkOIpO9xi12tKU/yjRrEJ92YagrOXJnAm8QEEZQKB4drBbj6q6CjMb
   Dc5ADhyf5+4+DIxyCjDebIoMx8q2TD32m3L079F15lJkWUgXWlSoXRuhk
   JVmfSH/DvKdmh+FyGVfZHMVLp0IX1HeJFVXdQYmwCGUGAj313iK9N7/vq
   aA9ZAjma/oUnzaia4fV5rzc4FQ0drjXGmK9TTWKJheXSTMhWZBVhuU/1t
   HgqttMAyoYi8vZYqjfECTDPdoWa8S7stSyQJvmvuvvt0g221rozEOf5w9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1584529"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1584529"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 02:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1092660338"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1092660338"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Nov 2023 02:20:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyTsF-0001JU-2d;
	Thu, 02 Nov 2023 09:20:23 +0000
Date: Thu, 2 Nov 2023 17:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:vc4 27/33]
 drivers/gpu/drm/drm_atomic_state_helper.c:919: undefined reference to
 `drm_hdmi_avi_infoframe_colorimetry'
Message-ID: <202311021650.tvuM2c9J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vc4
head:   814eee0fb2a10f00039cef7db9679ae37117e486
commit: 0540ce5dd4512ae1a6570d92343bfd3ca218e8ae [27/33] drm/connector: hdmi: Add Infoframes generation
config: x86_64-randconfig-012-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021650.tvuM2c9J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021650.tvuM2c9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021650.tvuM2c9J-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `hdmi_generate_avi_infoframe':
>> drivers/gpu/drm/drm_atomic_state_helper.c:919: undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> ld: drivers/gpu/drm/drm_atomic_state_helper.c:920: undefined reference to `drm_hdmi_avi_infoframe_bars'
   ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `hdmi_generate_hdr_infoframe':
>> drivers/gpu/drm/drm_atomic_state_helper.c:964: undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [y]:
   - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]


vim +919 drivers/gpu/drm/drm_atomic_state_helper.c

   897	
   898	static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
   899					       struct drm_connector_state *state)
   900	{
   901		const struct drm_display_mode *mode =
   902			connector_state_get_mode(state);
   903		struct drm_connector_hdmi_infoframe *infoframe =
   904			&state->hdmi.infoframes.avi;
   905		struct hdmi_avi_infoframe *frame =
   906			&infoframe->data.avi;
   907		bool is_full_range = state->hdmi.is_full_range;
   908		enum hdmi_quantization_range rgb_quant_range =
   909			is_full_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
   910		int ret;
   911	
   912		ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
   913		if (ret)
   914			return ret;
   915	
   916		frame->colorspace = state->hdmi.output_format;
   917	
   918		drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
 > 919		drm_hdmi_avi_infoframe_colorimetry(frame, state);
 > 920		drm_hdmi_avi_infoframe_bars(frame, state);
   921	
   922		infoframe->set = true;
   923	
   924		return 0;
   925	}
   926	
   927	static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
   928					       struct drm_connector_state *state)
   929	{
   930		struct drm_connector_hdmi_infoframe *infoframe =
   931			&state->hdmi.infoframes.spd;
   932		struct hdmi_spd_infoframe *frame =
   933			&infoframe->data.spd;
   934		int ret;
   935	
   936		ret = hdmi_spd_infoframe_init(frame,
   937					      connector->hdmi.vendor,
   938					      connector->hdmi.product);
   939		if (ret)
   940			return ret;
   941	
   942		frame->sdi = HDMI_SPD_SDI_PC;
   943	
   944		infoframe->set = true;
   945	
   946		return 0;
   947	}
   948	
   949	static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
   950					       struct drm_connector_state *state)
   951	{
   952		struct drm_connector_hdmi_infoframe *infoframe =
   953			&state->hdmi.infoframes.drm;
   954		struct hdmi_drm_infoframe *frame =
   955			&infoframe->data.drm;
   956		int ret;
   957	
   958		if (connector->max_bpc < 10)
   959			return 0;
   960	
   961		if (!state->hdr_output_metadata)
   962			return 0;
   963	
 > 964		ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
   965		if (ret)
   966			return ret;
   967	
   968		infoframe->set = true;
   969	
   970		return 0;
   971	}
   972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
