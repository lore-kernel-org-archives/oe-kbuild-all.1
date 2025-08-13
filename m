Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CF135959
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094810; cv=none; b=N6sjY38uB7FGgsUDdnIpDv7R1xiQcW1kuJovOQsIGOeOvSFG5lUBlEHHSTJ058B/zF/5XIFcFLlGQ1+4QgXA6Nl8qHetdqJQncrG+H2hJ/u6JGgaZLSSyHQR7wMKlXHJcoXajTIPGWlIdWZMXh+t6rUeYRqg6PMr4iuP+ycjDvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094810; c=relaxed/simple;
	bh=OszWjN20HCKEjd/z5EVAwmJHTBoXH0de7wbm6/6mCBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVlmLx+Ff9CkFocXgjD/ByHVeBZhZUnPujXmTSl/HytBfwrPiCe0ZVAwyV41Qh45h+hEQ+mmWXZZNAYNv71bIp3kLEOyC+UHfee7FBot0TtGIdUhlMUKcYJ5LdhTtZ6+K6w7cI3fsFxpzb4sSbcUiibM630biyKVEvuPIHkHv74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl45+a+d; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl45+a+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755094809; x=1786630809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OszWjN20HCKEjd/z5EVAwmJHTBoXH0de7wbm6/6mCBo=;
  b=Wl45+a+dYG4xwqFkdVSi0xNu6Rf9v73NujXXG+3UjXylURuTDRSFK4qW
   5Cd0BxKSQqAr1sFejVZz0N1JascBWB9XMbtGMVWYnGiYoSXXsDmf1kR2R
   mDJPLa2hrJS7OcqxFJ10CCbyZe+VPyv5s80tNmLsizGrlxjXNDJrW/qb/
   K8AfAwvs8nAqVQ3NYc6jJSb1xA7ZB0gdQNf8/yGF8IonJDJ2tf66Gauwa
   0/e0toa2S8NtZXOj1CoMW4V0hVd20QZPMqSNmuFBQih2yNcEdL/sHQ+J7
   +14frraggqGpZvC9u7kUGyrUNhdrtacwz8+TWhJ9NhRS+bbvqZ283HyCk
   w==;
X-CSE-ConnectionGUID: 2thmUXdfQVyHQuR1oI0Tag==
X-CSE-MsgGUID: UJjMZL3PRWOS4VFCaeETeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="82824486"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="82824486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:20:01 -0700
X-CSE-ConnectionGUID: q2VYw8xXRqa9alBRb1iH+g==
X-CSE-MsgGUID: ljb97+VGR6qDujtr19yjgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166857027"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2025 07:20:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umCK5-0009yo-1I;
	Wed, 13 Aug 2025 14:19:31 +0000
Date: Wed, 13 Aug 2025 22:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 354/354]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:3140:6: warning: no previous prototype
 for 'mtk_mt8189_dp_phy_set_param_v2'
Message-ID: <202508132240.DpnF1cCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   db867ccf596a910b85bab8c6052afe59fa921727
commit: 4f86e88a0ffae9bb2d46965fad019e9bcedbeccc [354/354] CHROMIUM: drm/mediatek: mt8189: porting driver for dptx
config: arm-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132240.DpnF1cCE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132240.DpnF1cCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508132240.DpnF1cCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2530:6: warning: no previous prototype for 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2538:6: warning: no previous prototype for 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2568:6: warning: no previous prototype for 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2598:6: warning: no previous prototype for 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2617:6: warning: no previous prototype for 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2643:6: warning: no previous prototype for 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2663:6: warning: no previous prototype for 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2669:6: warning: no previous prototype for 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3078:6: warning: no previous prototype for 'mtk_dp_phy_flip_enable_v2' [-Wmissing-prototypes]
    void mtk_dp_phy_flip_enable_v2(struct mtk_dp *mtk_dp)
         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3096:6: warning: no previous prototype for 'mtk_dp_phy_flip_disable_v2' [-Wmissing-prototypes]
    void mtk_dp_phy_flip_disable_v2(struct mtk_dp *mtk_dp)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:3140:6: warning: no previous prototype for 'mtk_mt8189_dp_phy_set_param_v2' [-Wmissing-prototypes]
    void mtk_mt8189_dp_phy_set_param_v2(struct mtk_dp *mtk_dp)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_video_config_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3713:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     u8 data;
        ^~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: At top level:
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4391:6: warning: no previous prototype for 'mtk_dp_hdcp_atomic_check' [-Wmissing-prototypes]
    void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4705:11: warning: initialized field overwritten [-Woverride-init]
     .reset = drm_atomic_helper_connector_reset,
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4705:11: note: (near initialization for 'mtk_dp_con_funcs.reset')


vim +/mtk_mt8189_dp_phy_set_param_v2 +3140 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  3139	
> 3140	void mtk_mt8189_dp_phy_set_param_v2(struct mtk_dp *mtk_dp)
  3141	{
  3142		int i;
  3143	
  3144		PHY_WRITE_4BYTE(mtk_dp,
  3145				mtk_dp->data->phyd_ana_glb_offset
  3146				+ DP_PHY_GLB_FORCE_CTRL_00,
  3147				mtk_dp->data->patch_phy_settings[0]);
  3148	
  3149		for (i = 0; i < 4; i++) {
  3150			PHY_WRITE_4BYTE(mtk_dp,
  3151					mtk_dp->data->phyd_ana_lan_offset[i]
  3152					+ DP_PHY_LANE_TX_2,
  3153					mtk_dp->data->patch_phy_settings[1]);
  3154		}
  3155	
  3156		PHY_WRITE_4BYTE(mtk_dp,
  3157				mtk_dp->data->phyd_dig_glb_offset
  3158				+ DP_PHY_DIG_GLB_DA_REG_00,
  3159				mtk_dp->data->patch_phy_settings[2]);
  3160		PHY_WRITE_4BYTE(mtk_dp,
  3161				mtk_dp->data->phyd_dig_glb_offset
  3162				+ DP_PHY_DIG_GLB_DA_REG_01,
  3163				mtk_dp->data->patch_phy_settings[3]);
  3164		PHY_WRITE_4BYTE(mtk_dp,
  3165				mtk_dp->data->phyd_dig_glb_offset
  3166				+ DP_PHY_DIG_GLB_DA_REG_02,
  3167				mtk_dp->data->patch_phy_settings[4]);
  3168		PHY_WRITE_4BYTE(mtk_dp,
  3169				mtk_dp->data->phyd_dig_glb_offset
  3170				+ DP_PHY_DIG_GLB_DA_REG_03,
  3171				mtk_dp->data->patch_phy_settings[5]);
  3172	
  3173		for (i = 0; i < 4; i++) {
  3174			PHY_WRITE_4BYTE(mtk_dp,
  3175					mtk_dp->data->phyd_dig_lan_offset[i] + DRIVING_PARAM_3,
  3176					mtk_dp->data->txfir_settings[0]);
  3177			PHY_WRITE_4BYTE(mtk_dp,
  3178					mtk_dp->data->phyd_dig_lan_offset[i] + DRIVING_PARAM_4,
  3179					mtk_dp->data->txfir_settings[1]);
  3180			PHY_WRITE_4BYTE(mtk_dp,
  3181					mtk_dp->data->phyd_dig_lan_offset[i] + DRIVING_PARAM_5,
  3182					mtk_dp->data->txfir_settings[2]);
  3183			PHY_WRITE_4BYTE(mtk_dp,
  3184					mtk_dp->data->phyd_dig_lan_offset[i] + DRIVING_PARAM_6,
  3185					mtk_dp->data->txfir_settings[3]);
  3186			PHY_WRITE_4BYTE(mtk_dp,
  3187					mtk_dp->data->phyd_dig_lan_offset[i] + DRIVING_PARAM_7,
  3188					mtk_dp->data->txfir_settings[4]);
  3189			PHY_WRITE_4BYTE(mtk_dp,
  3190					mtk_dp->data->phyd_dig_lan_offset[i] + DRIVING_PARAM_8,
  3191					mtk_dp->data->txfir_settings[5]);
  3192		}
  3193	}
  3194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
