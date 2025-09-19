Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20C41F099C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 16:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758300482; cv=none; b=dqkGueuXbprGIRlfOoXr0sU/v1qD4ZO4ukXWbZHXozPs2NHS5bidyUvcxhFkC8w576bjqr/EqvqJyJDgMdzd2xrmKGV6lNOpB9pEUXGP9H2x1cXHKcx2d1p0EyYs8N/sU9JiNvAokCupvC85wXK1cmo6S2q0k8ixjl9GFj61iSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758300482; c=relaxed/simple;
	bh=nw4IB0kypsPqrXaBkvvb2BzVJycGC6Cc5qK7DT6H8EA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSu1reNZlsMayOs21xpYrAvPblocVCyRo1SG1Ia1jM/uBERmdSHxib6XP0L7kIYezjRRVBYU+kdXcDnP8UE9VrCmb342JNazziwC1Z5ssvEeMiADjMY3yaA4SivAQTWXT2qntJyuWNSRRPFr5zMO+YGq2cc1JpNd0e1HIxd2QAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IN2czbBA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IN2czbBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758300481; x=1789836481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nw4IB0kypsPqrXaBkvvb2BzVJycGC6Cc5qK7DT6H8EA=;
  b=IN2czbBApVHFQax9Z5CqlyHHpdv1rsDzSL1iJWXBb7D9wTgFLVZ1ve04
   LUAPStJT8O69DV2J7nMHHOlcAkHNt15Q6lNEkkE3GYxfMndANUFWMjW1Q
   EseeHNj0Zx8fTNb12aUK1Iz/+lQuaS+wdRL1HsQMr5W0OtpD1EyA6VB/y
   rtBOvtolB8jxvw5sax4f3NhBEtV8cXRlv49uUNPrcOJWFU1NlfsYLj7m0
   I3OiLE9f1CXiXgI9TNPLuZWDBYOeBussfWBORYygxU8KOKN2eLnY5wpiM
   5NniT3oYR6l75+x70hlSOSBXvomYfR+BWA4m42/vuajwX+bWLf9wfzh7v
   w==;
X-CSE-ConnectionGUID: Mn5UpRfNQ0KpLcf//c0Jgg==
X-CSE-MsgGUID: g7oO+wsDSfCCyzIl8BVVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60580372"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60580372"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:48:00 -0700
X-CSE-ConnectionGUID: m1Wb8QnJQtq62U5GeUxfaQ==
X-CSE-MsgGUID: 4KRhO7o+RLiWmyu1MfopmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="199582981"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Sep 2025 09:47:58 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzeH6-0004Wd-1g;
	Fri, 19 Sep 2025 16:47:56 +0000
Date: Sat, 20 Sep 2025 00:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [drm-msm:msm-next-test-quadpipe 10/10]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:664:25: warning: unused variable
 'dpu_kms'
Message-ID: <202509200019.94DJDxfe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-test-quadpipe
head:   c56f9d69effeca4e463a4fb99c946b7a39060cdd
commit: c56f9d69effeca4e463a4fb99c946b7a39060cdd [10/10] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
config: i386-buildonly-randconfig-002-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200019.94DJDxfe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200019.94DJDxfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200019.94DJDxfe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function 'dpu_encoder_update_topology':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:664:25: warning: unused variable 'dpu_kms' [-Wunused-variable]
     664 |         struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
         |                         ^~~~~~~


vim +/dpu_kms +664 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

9ed6141b72c766 Kuogee Hsieh      2023-06-22  655  
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  656  void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  657  				 struct msm_display_topology *topology,
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  658  				 struct drm_atomic_state *state,
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  659  				 const struct drm_display_mode *adj_mode)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  660  {
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  661  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  662  	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  663  	struct msm_display_info *disp_info = &dpu_enc->disp_info;
41921f231abf9a Dmitry Baryshkov  2025-01-23 @664  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  665  	struct drm_connector *connector;
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  666  	struct drm_connector_state *conn_state;
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  667  	struct drm_framebuffer *fb;
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  668  	struct drm_dsc_config *dsc;
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  669  
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  670  	int i;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  671  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  672  	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  673  		if (dpu_enc->phys_encs[i])
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  674  			topology->num_intf++;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  675  
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  676  	dsc = dpu_encoder_get_dsc_config(drm_enc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  677  
4ba5a4ad568e3b Marijn Suijten    2022-12-22  678  	/*
c56f9d69effeca Jun Nie           2025-09-18  679  	 * Set DSC number as 1 to mark the enabled status, will be adjusted
c56f9d69effeca Jun Nie           2025-09-18  680  	 * in dpu_crtc_get_topology()
7e9cc175b159c4 Vinod Koul        2022-04-06  681  	 */
c56f9d69effeca Jun Nie           2025-09-18  682  	if (dsc)
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  683  		topology->num_dsc = 1;
7e9cc175b159c4 Vinod Koul        2022-04-06  684  
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  685  	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  686  	if (!connector)
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  687  		return;
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  688  	conn_state = drm_atomic_get_new_connector_state(state, connector);
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  689  	if (!conn_state)
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  690  		return;
1ce69c265a53c6 Dmitry Baryshkov  2025-02-14  691  
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  692  	/*
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  693  	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  694  	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  695  	 * earlier.
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  696  	 */
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  697  	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  698  		fb = conn_state->writeback_job->fb;
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  699  
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  700  		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
f1f0379e9dd5ab Jessica Zhang     2025-02-14  701  			topology->num_cdm++;
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  702  	} else if (disp_info->intf_type == INTF_DP) {
e10e1a4010f362 Dmitry Baryshkov  2025-07-05  703  		if (msm_dp_is_yuv_420_enabled(priv->kms->dp[disp_info->h_tile_instance[0]],
e10e1a4010f362 Dmitry Baryshkov  2025-07-05  704  					      adj_mode))
f1f0379e9dd5ab Jessica Zhang     2025-02-14  705  			topology->num_cdm++;
7d39f5bb82c0d7 Dmitry Baryshkov  2025-01-23  706  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  707  }
7e9cc175b159c4 Vinod Koul        2022-04-06  708  

:::::: The code at line 664 was first introduced by commit
:::::: 41921f231abf9a3a95550b2b565df8e4329319cb drm/msm/dpu: simplify dpu_encoder_get_topology() interface

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
