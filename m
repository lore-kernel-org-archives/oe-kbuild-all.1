Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198341A0BD1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359240; cv=none; b=QCHlubJpOqvxBzkpgw1RX74B9wigIP79120e1iAKe7KfccpCB/vZdlWpgYv98k+/yLrpW1xEvJoG55tFQbWW/9Yt0YcinzprIdHjb8pTRNUMts20iw03iMmIFQUOL90/ZmJ0XJmC+PqtljD0oqHBzQi4oEu8uDjxGqbgeI9oRsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359240; c=relaxed/simple;
	bh=Ckb0YUJhdSPUX0fAxelQTT3C4W8zZNeTNoILRiiRJ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ah6zK8+/ajpHhdENyLooPa4sW2uCqvyaKoS+DxOlnGU/pFx4mdos9mPq6lKMsnxR//lp12bYH5Nm7LvMbMjJqHWv92KJ+e0dACV33NqnIH//A1Tx/zMqap1M1AiX71U7HXZUB1FIK7ehaFwxmBoUs59irOZrqH8OKLcl6nJy5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3mp1eeD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3mp1eeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725359238; x=1756895238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ckb0YUJhdSPUX0fAxelQTT3C4W8zZNeTNoILRiiRJ9o=;
  b=O3mp1eeDIPowCiiuC7fKkYYldR5Cx93MfnJVc4HXd1gdoSmbeUzQH6mS
   vvod6NDMWfM9jviXwubLjTbGOSDfzUWLAFmf+hjSYBDAg/EsvmZSE7jdb
   hsyQp+MEjkoyEQJU7Mro3tR+FElvE7ptoDIB3kINzkmlQjun7dgCbc8FQ
   T73VvLfB7mhpEFoDMnE2CB7B+lXpTCXs/fMOpSAqwmjRSEK5Nsw8Deg8w
   SPm60KDX1IlubKgNpz2984LGqrtoHV1ji6hJjnm/FZNKF3BqwJCUv/BPx
   O8r2c8DN3jxqN4SQzv/A9XJMALoDDoetLDY3MVyYC2WqD0rwGhd2ogBFO
   g==;
X-CSE-ConnectionGUID: CgvoltWiSou0EMLRcmPy+A==
X-CSE-MsgGUID: b9Ll0dm6TJutzj4d+4IE+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34518451"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="34518451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 03:27:17 -0700
X-CSE-ConnectionGUID: emoWO2QpSACSMMoK2TZcWw==
X-CSE-MsgGUID: ExPNX/y+QFy4c8E/WEO8Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="95592130"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Sep 2024 03:26:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slQkR-0006Vb-1J;
	Tue, 03 Sep 2024 10:26:55 +0000
Date: Tue, 3 Sep 2024 18:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Relja Vojvodic <Relja.Vojvodic@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
	Samson Tam <samson.tam@amd.com>
Subject: [agd5f:amd-staging-drm-next 2555/2580]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c:962:
 warning: Function parameter or struct member 'program_isharp_1dlut' not
 described in 'dpp401_dscl_program_isharp'
Message-ID: <202409031837.lV5EaS3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   96a5152075c0424e9bda551d00ab850c815e309c
commit: a0593f4e5ed43bb56952cf30002368ed27fd7a68 [2555/2580] drm/amd/display: Add sharpness control interface
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409031837.lV5EaS3S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031837.lV5EaS3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031837.lV5EaS3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c:962: warning: Function parameter or struct member 'program_isharp_1dlut' not described in 'dpp401_dscl_program_isharp'
   drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c:962: warning: Function parameter or struct member 'bs_coeffs_updated' not described in 'dpp401_dscl_program_isharp'


vim +962 drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn401/dcn401_dpp_dscl.c

cbd45405a6162ec Aurabindo Pillai 2024-04-19  632  
cbd45405a6162ec Aurabindo Pillai 2024-04-19  633  /**
cbd45405a6162ec Aurabindo Pillai 2024-04-19  634   * dpp401_dscl_set_recout - Set the first pixel of RECOUT in the OTG active area
cbd45405a6162ec Aurabindo Pillai 2024-04-19  635   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  636   * @dpp: DPP data struct
cbd45405a6162ec Aurabindo Pillai 2024-04-19  637   * @recout: Rectangle information
cbd45405a6162ec Aurabindo Pillai 2024-04-19  638   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  639   * This function sets the MPC RECOUT_START and RECOUT_SIZE registers based on
cbd45405a6162ec Aurabindo Pillai 2024-04-19  640   * the values specified in the recount parameter.
cbd45405a6162ec Aurabindo Pillai 2024-04-19  641   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  642   * Note: This function only have effect if AutoCal is disabled.
cbd45405a6162ec Aurabindo Pillai 2024-04-19  643   */
cbd45405a6162ec Aurabindo Pillai 2024-04-19  644  static void dpp401_dscl_set_recout(struct dcn401_dpp *dpp,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  645  				 const struct rect *recout)
cbd45405a6162ec Aurabindo Pillai 2024-04-19  646  {
cbd45405a6162ec Aurabindo Pillai 2024-04-19  647  	REG_SET_2(RECOUT_START, 0,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  648  		  /* First pixel of RECOUT in the active OTG area */
cbd45405a6162ec Aurabindo Pillai 2024-04-19  649  		  RECOUT_START_X, recout->x,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  650  		  /* First line of RECOUT in the active OTG area */
cbd45405a6162ec Aurabindo Pillai 2024-04-19  651  		  RECOUT_START_Y, recout->y);
cbd45405a6162ec Aurabindo Pillai 2024-04-19  652  
cbd45405a6162ec Aurabindo Pillai 2024-04-19  653  	REG_SET_2(RECOUT_SIZE, 0,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  654  		  /* Number of RECOUT horizontal pixels */
cbd45405a6162ec Aurabindo Pillai 2024-04-19  655  		  RECOUT_WIDTH, recout->width,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  656  		  /* Number of RECOUT vertical lines */
cbd45405a6162ec Aurabindo Pillai 2024-04-19  657  		  RECOUT_HEIGHT, recout->height);
cbd45405a6162ec Aurabindo Pillai 2024-04-19  658  }
cbd45405a6162ec Aurabindo Pillai 2024-04-19  659  /**
c60041a5ca01a0d Samson Tam       2024-08-16  660   * dpp401_dscl_program_easf_v - Program EASF_V
cbd45405a6162ec Aurabindo Pillai 2024-04-19  661   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  662   * @dpp_base: High level DPP struct
cbd45405a6162ec Aurabindo Pillai 2024-04-19  663   * @scl_data: scalaer_data info
cbd45405a6162ec Aurabindo Pillai 2024-04-19  664   *
c60041a5ca01a0d Samson Tam       2024-08-16  665   * This is the primary function to program vertical EASF registers
cbd45405a6162ec Aurabindo Pillai 2024-04-19  666   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  667   */
c60041a5ca01a0d Samson Tam       2024-08-16  668  static void dpp401_dscl_program_easf_v(struct dpp *dpp_base, const struct scaler_data *scl_data)
cbd45405a6162ec Aurabindo Pillai 2024-04-19  669  {
cbd45405a6162ec Aurabindo Pillai 2024-04-19  670  	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
cbd45405a6162ec Aurabindo Pillai 2024-04-19  671  
cbd45405a6162ec Aurabindo Pillai 2024-04-19  672  	PERF_TRACE();
fb64ee8b4bed757 Samson Tam       2024-04-24  673  	/* DSCL_EASF_V_MODE */
c60041a5ca01a0d Samson Tam       2024-08-16  674  	REG_SET_3(DSCL_EASF_V_MODE, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  675  			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en,
c60041a5ca01a0d Samson Tam       2024-08-16  676  			SCL_EASF_V_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_v_sharp_factor,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  677  			SCL_EASF_V_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_v_ring);
c60041a5ca01a0d Samson Tam       2024-08-16  678  
c60041a5ca01a0d Samson Tam       2024-08-16  679  	if (!scl_data->dscl_prog_data.easf_v_en) {
c60041a5ca01a0d Samson Tam       2024-08-16  680  		PERF_TRACE();
c60041a5ca01a0d Samson Tam       2024-08-16  681  		return;
c60041a5ca01a0d Samson Tam       2024-08-16  682  	}
c60041a5ca01a0d Samson Tam       2024-08-16  683  
c60041a5ca01a0d Samson Tam       2024-08-16  684  	/* DSCL_EASF_V_BF_CNTL */
c60041a5ca01a0d Samson Tam       2024-08-16  685  	REG_SET_6(DSCL_EASF_V_BF_CNTL, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  686  			SCL_EASF_V_BF1_EN, scl_data->dscl_prog_data.easf_v_bf1_en,
c60041a5ca01a0d Samson Tam       2024-08-16  687  			SCL_EASF_V_BF2_MODE, scl_data->dscl_prog_data.easf_v_bf2_mode,
c60041a5ca01a0d Samson Tam       2024-08-16  688  			SCL_EASF_V_BF3_MODE, scl_data->dscl_prog_data.easf_v_bf3_mode,
c60041a5ca01a0d Samson Tam       2024-08-16  689  			SCL_EASF_V_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat1_gain,
c60041a5ca01a0d Samson Tam       2024-08-16  690  			SCL_EASF_V_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_v_bf2_flat2_gain,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  691  			SCL_EASF_V_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_v_bf2_roc_gain);
c60041a5ca01a0d Samson Tam       2024-08-16  692  	/* DSCL_EASF_V_RINGEST_3TAP_CNTLn */
c60041a5ca01a0d Samson Tam       2024-08-16  693  	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL1, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  694  		SCL_EASF_V_RINGEST_3TAP_DNTILT_UPTILT, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_uptilt,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  695  		SCL_EASF_V_RINGEST_3TAP_UPTILT_MAXVAL, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt_max);
c60041a5ca01a0d Samson Tam       2024-08-16  696  	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL2, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  697  		SCL_EASF_V_RINGEST_3TAP_DNTILT_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_dntilt_slope,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  698  		SCL_EASF_V_RINGEST_3TAP_UPTILT1_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt1_slope);
c60041a5ca01a0d Samson Tam       2024-08-16  699  	REG_SET_2(DSCL_EASF_V_RINGEST_3TAP_CNTL3, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  700  		SCL_EASF_V_RINGEST_3TAP_UPTILT2_SLOPE, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_slope,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  701  		SCL_EASF_V_RINGEST_3TAP_UPTILT2_OFFSET, scl_data->dscl_prog_data.easf_v_ringest_3tap_uptilt2_offset);
c60041a5ca01a0d Samson Tam       2024-08-16  702  	/* DSCL_EASF_V_RINGEST_EVENTAP_REDUCE */
c60041a5ca01a0d Samson Tam       2024-08-16  703  	REG_SET_2(DSCL_EASF_V_RINGEST_EVENTAP_REDUCE, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  704  		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg1,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  705  		SCL_EASF_V_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_v_ringest_eventap_reduceg2);
c60041a5ca01a0d Samson Tam       2024-08-16  706  	/* DSCL_EASF_V_RINGEST_EVENTAP_GAIN */
c60041a5ca01a0d Samson Tam       2024-08-16  707  	REG_SET_2(DSCL_EASF_V_RINGEST_EVENTAP_GAIN, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  708  		SCL_EASF_V_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain1,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  709  		SCL_EASF_V_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_v_ringest_eventap_gain2);
c60041a5ca01a0d Samson Tam       2024-08-16  710  	/* DSCL_EASF_V_BF_FINAL_MAX_MIN */
c60041a5ca01a0d Samson Tam       2024-08-16  711  	REG_SET_4(DSCL_EASF_V_BF_FINAL_MAX_MIN, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  712  			SCL_EASF_V_BF_MAXA, scl_data->dscl_prog_data.easf_v_bf_maxa,
c60041a5ca01a0d Samson Tam       2024-08-16  713  			SCL_EASF_V_BF_MAXB, scl_data->dscl_prog_data.easf_v_bf_maxb,
c60041a5ca01a0d Samson Tam       2024-08-16  714  			SCL_EASF_V_BF_MINA, scl_data->dscl_prog_data.easf_v_bf_mina,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  715  			SCL_EASF_V_BF_MINB, scl_data->dscl_prog_data.easf_v_bf_minb);
c60041a5ca01a0d Samson Tam       2024-08-16  716  	/* DSCL_EASF_V_BF1_PWL_SEGn */
c60041a5ca01a0d Samson Tam       2024-08-16  717  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG0, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  718  			SCL_EASF_V_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg0,
c60041a5ca01a0d Samson Tam       2024-08-16  719  			SCL_EASF_V_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg0,
fb64ee8b4bed757 Samson Tam       2024-04-24  720  			SCL_EASF_V_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg0);
c60041a5ca01a0d Samson Tam       2024-08-16  721  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG1, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  722  			SCL_EASF_V_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg1,
c60041a5ca01a0d Samson Tam       2024-08-16  723  			SCL_EASF_V_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg1,
fb64ee8b4bed757 Samson Tam       2024-04-24  724  			SCL_EASF_V_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg1);
c60041a5ca01a0d Samson Tam       2024-08-16  725  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG2, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  726  			SCL_EASF_V_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg2,
c60041a5ca01a0d Samson Tam       2024-08-16  727  			SCL_EASF_V_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg2,
fb64ee8b4bed757 Samson Tam       2024-04-24  728  			SCL_EASF_V_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg2);
c60041a5ca01a0d Samson Tam       2024-08-16  729  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG3, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  730  			SCL_EASF_V_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg3,
c60041a5ca01a0d Samson Tam       2024-08-16  731  			SCL_EASF_V_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg3,
fb64ee8b4bed757 Samson Tam       2024-04-24  732  			SCL_EASF_V_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg3);
c60041a5ca01a0d Samson Tam       2024-08-16  733  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG4, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  734  			SCL_EASF_V_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg4,
c60041a5ca01a0d Samson Tam       2024-08-16  735  			SCL_EASF_V_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg4,
fb64ee8b4bed757 Samson Tam       2024-04-24  736  			SCL_EASF_V_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg4);
c60041a5ca01a0d Samson Tam       2024-08-16  737  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG5, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  738  			SCL_EASF_V_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg5,
c60041a5ca01a0d Samson Tam       2024-08-16  739  			SCL_EASF_V_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg5,
fb64ee8b4bed757 Samson Tam       2024-04-24  740  			SCL_EASF_V_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg5);
c60041a5ca01a0d Samson Tam       2024-08-16  741  	REG_SET_3(DSCL_EASF_V_BF1_PWL_SEG6, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  742  			SCL_EASF_V_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg6,
c60041a5ca01a0d Samson Tam       2024-08-16  743  			SCL_EASF_V_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg6,
fb64ee8b4bed757 Samson Tam       2024-04-24  744  			SCL_EASF_V_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_v_bf1_pwl_slope_seg6);
c60041a5ca01a0d Samson Tam       2024-08-16  745  	REG_SET_2(DSCL_EASF_V_BF1_PWL_SEG7, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  746  			SCL_EASF_V_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_in_seg7,
fb64ee8b4bed757 Samson Tam       2024-04-24  747  			SCL_EASF_V_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_v_bf1_pwl_base_seg7);
c60041a5ca01a0d Samson Tam       2024-08-16  748  	/* DSCL_EASF_V_BF3_PWL_SEGn */
c60041a5ca01a0d Samson Tam       2024-08-16  749  	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG0, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  750  			SCL_EASF_V_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set0,
c60041a5ca01a0d Samson Tam       2024-08-16  751  			SCL_EASF_V_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set0,
fb64ee8b4bed757 Samson Tam       2024-04-24  752  			SCL_EASF_V_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set0);
c60041a5ca01a0d Samson Tam       2024-08-16  753  	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG1, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  754  			SCL_EASF_V_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set1,
c60041a5ca01a0d Samson Tam       2024-08-16  755  			SCL_EASF_V_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set1,
fb64ee8b4bed757 Samson Tam       2024-04-24  756  			SCL_EASF_V_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set1);
c60041a5ca01a0d Samson Tam       2024-08-16  757  	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG2, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  758  			SCL_EASF_V_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set2,
c60041a5ca01a0d Samson Tam       2024-08-16  759  			SCL_EASF_V_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set2,
fb64ee8b4bed757 Samson Tam       2024-04-24  760  			SCL_EASF_V_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set2);
c60041a5ca01a0d Samson Tam       2024-08-16  761  	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG3, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  762  			SCL_EASF_V_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set3,
c60041a5ca01a0d Samson Tam       2024-08-16  763  			SCL_EASF_V_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set3,
fb64ee8b4bed757 Samson Tam       2024-04-24  764  			SCL_EASF_V_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set3);
c60041a5ca01a0d Samson Tam       2024-08-16  765  	REG_SET_3(DSCL_EASF_V_BF3_PWL_SEG4, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  766  			SCL_EASF_V_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set4,
c60041a5ca01a0d Samson Tam       2024-08-16  767  			SCL_EASF_V_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set4,
fb64ee8b4bed757 Samson Tam       2024-04-24  768  			SCL_EASF_V_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_v_bf3_pwl_slope_set4);
c60041a5ca01a0d Samson Tam       2024-08-16  769  	REG_SET_2(DSCL_EASF_V_BF3_PWL_SEG5, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  770  			SCL_EASF_V_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_in_set5,
fb64ee8b4bed757 Samson Tam       2024-04-24  771  			SCL_EASF_V_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_v_bf3_pwl_base_set5);
c60041a5ca01a0d Samson Tam       2024-08-16  772  	PERF_TRACE();
c60041a5ca01a0d Samson Tam       2024-08-16  773  }
c60041a5ca01a0d Samson Tam       2024-08-16  774  /**
c60041a5ca01a0d Samson Tam       2024-08-16  775   * dpp401_dscl_program_easf_h - Program EASF_H
c60041a5ca01a0d Samson Tam       2024-08-16  776   *
c60041a5ca01a0d Samson Tam       2024-08-16  777   * @dpp_base: High level DPP struct
c60041a5ca01a0d Samson Tam       2024-08-16  778   * @scl_data: scalaer_data info
c60041a5ca01a0d Samson Tam       2024-08-16  779   *
c60041a5ca01a0d Samson Tam       2024-08-16  780   * This is the primary function to program horizontal EASF registers
c60041a5ca01a0d Samson Tam       2024-08-16  781   *
c60041a5ca01a0d Samson Tam       2024-08-16  782   */
c60041a5ca01a0d Samson Tam       2024-08-16  783  static void dpp401_dscl_program_easf_h(struct dpp *dpp_base, const struct scaler_data *scl_data)
c60041a5ca01a0d Samson Tam       2024-08-16  784  {
c60041a5ca01a0d Samson Tam       2024-08-16  785  	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
c60041a5ca01a0d Samson Tam       2024-08-16  786  
c60041a5ca01a0d Samson Tam       2024-08-16  787  	PERF_TRACE();
fb64ee8b4bed757 Samson Tam       2024-04-24  788  	/* DSCL_EASF_H_MODE */
c60041a5ca01a0d Samson Tam       2024-08-16  789  	REG_SET_3(DSCL_EASF_H_MODE, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  790  			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en,
c60041a5ca01a0d Samson Tam       2024-08-16  791  			SCL_EASF_H_2TAP_SHARP_FACTOR, scl_data->dscl_prog_data.easf_h_sharp_factor,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  792  			SCL_EASF_H_RINGEST_FORCE_EN, scl_data->dscl_prog_data.easf_h_ring);
c60041a5ca01a0d Samson Tam       2024-08-16  793  
c60041a5ca01a0d Samson Tam       2024-08-16  794  	if (!scl_data->dscl_prog_data.easf_h_en) {
c60041a5ca01a0d Samson Tam       2024-08-16  795  		PERF_TRACE();
c60041a5ca01a0d Samson Tam       2024-08-16  796  		return;
c60041a5ca01a0d Samson Tam       2024-08-16  797  	}
c60041a5ca01a0d Samson Tam       2024-08-16  798  
c60041a5ca01a0d Samson Tam       2024-08-16  799  	/* DSCL_EASF_H_BF_CNTL */
c60041a5ca01a0d Samson Tam       2024-08-16  800  	REG_SET_6(DSCL_EASF_H_BF_CNTL, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  801  			SCL_EASF_H_BF1_EN, scl_data->dscl_prog_data.easf_h_bf1_en,
c60041a5ca01a0d Samson Tam       2024-08-16  802  			SCL_EASF_H_BF2_MODE, scl_data->dscl_prog_data.easf_h_bf2_mode,
c60041a5ca01a0d Samson Tam       2024-08-16  803  			SCL_EASF_H_BF3_MODE, scl_data->dscl_prog_data.easf_h_bf3_mode,
c60041a5ca01a0d Samson Tam       2024-08-16  804  			SCL_EASF_H_BF2_FLAT1_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat1_gain,
c60041a5ca01a0d Samson Tam       2024-08-16  805  			SCL_EASF_H_BF2_FLAT2_GAIN, scl_data->dscl_prog_data.easf_h_bf2_flat2_gain,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  806  			SCL_EASF_H_BF2_ROC_GAIN, scl_data->dscl_prog_data.easf_h_bf2_roc_gain);
c60041a5ca01a0d Samson Tam       2024-08-16  807  	/* DSCL_EASF_H_RINGEST_EVENTAP_REDUCE */
c60041a5ca01a0d Samson Tam       2024-08-16  808  	REG_SET_2(DSCL_EASF_H_RINGEST_EVENTAP_REDUCE, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  809  			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG1, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg1,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  810  			SCL_EASF_H_RINGEST_EVENTAP_REDUCEG2, scl_data->dscl_prog_data.easf_h_ringest_eventap_reduceg2);
c60041a5ca01a0d Samson Tam       2024-08-16  811  	/* DSCL_EASF_H_RINGEST_EVENTAP_GAIN */
c60041a5ca01a0d Samson Tam       2024-08-16  812  	REG_SET_2(DSCL_EASF_H_RINGEST_EVENTAP_GAIN, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  813  			SCL_EASF_H_RINGEST_EVENTAP_GAIN1, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain1,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  814  			SCL_EASF_H_RINGEST_EVENTAP_GAIN2, scl_data->dscl_prog_data.easf_h_ringest_eventap_gain2);
c60041a5ca01a0d Samson Tam       2024-08-16  815  	/* DSCL_EASF_H_BF_FINAL_MAX_MIN */
c60041a5ca01a0d Samson Tam       2024-08-16  816  	REG_SET_4(DSCL_EASF_H_BF_FINAL_MAX_MIN, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  817  			SCL_EASF_H_BF_MAXA, scl_data->dscl_prog_data.easf_h_bf_maxa,
c60041a5ca01a0d Samson Tam       2024-08-16  818  			SCL_EASF_H_BF_MAXB, scl_data->dscl_prog_data.easf_h_bf_maxb,
c60041a5ca01a0d Samson Tam       2024-08-16  819  			SCL_EASF_H_BF_MINA, scl_data->dscl_prog_data.easf_h_bf_mina,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  820  			SCL_EASF_H_BF_MINB, scl_data->dscl_prog_data.easf_h_bf_minb);
c60041a5ca01a0d Samson Tam       2024-08-16  821  	/* DSCL_EASF_H_BF1_PWL_SEGn */
c60041a5ca01a0d Samson Tam       2024-08-16  822  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG0, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  823  			SCL_EASF_H_BF1_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg0,
c60041a5ca01a0d Samson Tam       2024-08-16  824  			SCL_EASF_H_BF1_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg0,
fb64ee8b4bed757 Samson Tam       2024-04-24  825  			SCL_EASF_H_BF1_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg0);
c60041a5ca01a0d Samson Tam       2024-08-16  826  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG1, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  827  			SCL_EASF_H_BF1_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg1,
c60041a5ca01a0d Samson Tam       2024-08-16  828  			SCL_EASF_H_BF1_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg1,
fb64ee8b4bed757 Samson Tam       2024-04-24  829  			SCL_EASF_H_BF1_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg1);
c60041a5ca01a0d Samson Tam       2024-08-16  830  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG2, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  831  			SCL_EASF_H_BF1_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg2,
c60041a5ca01a0d Samson Tam       2024-08-16  832  			SCL_EASF_H_BF1_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg2,
fb64ee8b4bed757 Samson Tam       2024-04-24  833  			SCL_EASF_H_BF1_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg2);
c60041a5ca01a0d Samson Tam       2024-08-16  834  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG3, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  835  			SCL_EASF_H_BF1_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg3,
c60041a5ca01a0d Samson Tam       2024-08-16  836  			SCL_EASF_H_BF1_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg3,
fb64ee8b4bed757 Samson Tam       2024-04-24  837  			SCL_EASF_H_BF1_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg3);
c60041a5ca01a0d Samson Tam       2024-08-16  838  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG4, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  839  			SCL_EASF_H_BF1_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg4,
c60041a5ca01a0d Samson Tam       2024-08-16  840  			SCL_EASF_H_BF1_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg4,
fb64ee8b4bed757 Samson Tam       2024-04-24  841  			SCL_EASF_H_BF1_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg4);
c60041a5ca01a0d Samson Tam       2024-08-16  842  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG5, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  843  			SCL_EASF_H_BF1_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg5,
c60041a5ca01a0d Samson Tam       2024-08-16  844  			SCL_EASF_H_BF1_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg5,
fb64ee8b4bed757 Samson Tam       2024-04-24  845  			SCL_EASF_H_BF1_PWL_SLOPE_SEG5, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg5);
c60041a5ca01a0d Samson Tam       2024-08-16  846  	REG_SET_3(DSCL_EASF_H_BF1_PWL_SEG6, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  847  			SCL_EASF_H_BF1_PWL_IN_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg6,
c60041a5ca01a0d Samson Tam       2024-08-16  848  			SCL_EASF_H_BF1_PWL_BASE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg6,
fb64ee8b4bed757 Samson Tam       2024-04-24  849  			SCL_EASF_H_BF1_PWL_SLOPE_SEG6, scl_data->dscl_prog_data.easf_h_bf1_pwl_slope_seg6);
c60041a5ca01a0d Samson Tam       2024-08-16  850  	REG_SET_2(DSCL_EASF_H_BF1_PWL_SEG7, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  851  			SCL_EASF_H_BF1_PWL_IN_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_in_seg7,
fb64ee8b4bed757 Samson Tam       2024-04-24  852  			SCL_EASF_H_BF1_PWL_BASE_SEG7, scl_data->dscl_prog_data.easf_h_bf1_pwl_base_seg7);
c60041a5ca01a0d Samson Tam       2024-08-16  853  	/* DSCL_EASF_H_BF3_PWL_SEGn */
c60041a5ca01a0d Samson Tam       2024-08-16  854  	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG0, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  855  			SCL_EASF_H_BF3_PWL_IN_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set0,
c60041a5ca01a0d Samson Tam       2024-08-16  856  			SCL_EASF_H_BF3_PWL_BASE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set0,
fb64ee8b4bed757 Samson Tam       2024-04-24  857  			SCL_EASF_H_BF3_PWL_SLOPE_SEG0, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set0);
c60041a5ca01a0d Samson Tam       2024-08-16  858  	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG1, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  859  			SCL_EASF_H_BF3_PWL_IN_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set1,
c60041a5ca01a0d Samson Tam       2024-08-16  860  			SCL_EASF_H_BF3_PWL_BASE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set1,
fb64ee8b4bed757 Samson Tam       2024-04-24  861  			SCL_EASF_H_BF3_PWL_SLOPE_SEG1, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set1);
c60041a5ca01a0d Samson Tam       2024-08-16  862  	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG2, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  863  			SCL_EASF_H_BF3_PWL_IN_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set2,
c60041a5ca01a0d Samson Tam       2024-08-16  864  			SCL_EASF_H_BF3_PWL_BASE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set2,
fb64ee8b4bed757 Samson Tam       2024-04-24  865  			SCL_EASF_H_BF3_PWL_SLOPE_SEG2, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set2);
c60041a5ca01a0d Samson Tam       2024-08-16  866  	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG3, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  867  			SCL_EASF_H_BF3_PWL_IN_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set3,
c60041a5ca01a0d Samson Tam       2024-08-16  868  			SCL_EASF_H_BF3_PWL_BASE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set3,
fb64ee8b4bed757 Samson Tam       2024-04-24  869  			SCL_EASF_H_BF3_PWL_SLOPE_SEG3, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set3);
c60041a5ca01a0d Samson Tam       2024-08-16  870  	REG_SET_3(DSCL_EASF_H_BF3_PWL_SEG4, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  871  			SCL_EASF_H_BF3_PWL_IN_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set4,
c60041a5ca01a0d Samson Tam       2024-08-16  872  			SCL_EASF_H_BF3_PWL_BASE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set4,
fb64ee8b4bed757 Samson Tam       2024-04-24  873  			SCL_EASF_H_BF3_PWL_SLOPE_SEG4, scl_data->dscl_prog_data.easf_h_bf3_pwl_slope_set4);
c60041a5ca01a0d Samson Tam       2024-08-16  874  	REG_SET_2(DSCL_EASF_H_BF3_PWL_SEG5, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  875  			SCL_EASF_H_BF3_PWL_IN_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_in_set5,
fb64ee8b4bed757 Samson Tam       2024-04-24  876  			SCL_EASF_H_BF3_PWL_BASE_SEG5, scl_data->dscl_prog_data.easf_h_bf3_pwl_base_set5);
c60041a5ca01a0d Samson Tam       2024-08-16  877  	PERF_TRACE();
c60041a5ca01a0d Samson Tam       2024-08-16  878  }
c60041a5ca01a0d Samson Tam       2024-08-16  879  /**
c60041a5ca01a0d Samson Tam       2024-08-16  880   * dpp401_dscl_program_easf - Program EASF
c60041a5ca01a0d Samson Tam       2024-08-16  881   *
c60041a5ca01a0d Samson Tam       2024-08-16  882   * @dpp_base: High level DPP struct
c60041a5ca01a0d Samson Tam       2024-08-16  883   * @scl_data: scalaer_data info
c60041a5ca01a0d Samson Tam       2024-08-16  884   *
c60041a5ca01a0d Samson Tam       2024-08-16  885   * This is the primary function to program EASF
c60041a5ca01a0d Samson Tam       2024-08-16  886   *
c60041a5ca01a0d Samson Tam       2024-08-16  887   */
c60041a5ca01a0d Samson Tam       2024-08-16  888  static void dpp401_dscl_program_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
c60041a5ca01a0d Samson Tam       2024-08-16  889  {
c60041a5ca01a0d Samson Tam       2024-08-16  890  	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
c60041a5ca01a0d Samson Tam       2024-08-16  891  
c60041a5ca01a0d Samson Tam       2024-08-16  892  	PERF_TRACE();
c60041a5ca01a0d Samson Tam       2024-08-16  893  	/* DSCL_SC_MODE */
c60041a5ca01a0d Samson Tam       2024-08-16  894  	REG_SET_2(DSCL_SC_MODE, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  895  			SCL_SC_MATRIX_MODE, scl_data->dscl_prog_data.easf_matrix_mode,
c60041a5ca01a0d Samson Tam       2024-08-16  896  			SCL_SC_LTONL_EN, scl_data->dscl_prog_data.easf_ltonl_en);
fb64ee8b4bed757 Samson Tam       2024-04-24  897  	/* DSCL_EASF_SC_MATRIX_C0C1, DSCL_EASF_SC_MATRIX_C2C3 */
c60041a5ca01a0d Samson Tam       2024-08-16  898  	REG_SET_2(DSCL_SC_MATRIX_C0C1, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  899  			SCL_SC_MATRIX_C0, scl_data->dscl_prog_data.easf_matrix_c0,
fb64ee8b4bed757 Samson Tam       2024-04-24  900  			SCL_SC_MATRIX_C1, scl_data->dscl_prog_data.easf_matrix_c1);
c60041a5ca01a0d Samson Tam       2024-08-16  901  	REG_SET_2(DSCL_SC_MATRIX_C2C3, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  902  			SCL_SC_MATRIX_C2, scl_data->dscl_prog_data.easf_matrix_c2,
fb64ee8b4bed757 Samson Tam       2024-04-24  903  			SCL_SC_MATRIX_C3, scl_data->dscl_prog_data.easf_matrix_c3);
c60041a5ca01a0d Samson Tam       2024-08-16  904  	dpp401_dscl_program_easf_v(dpp_base, scl_data);
c60041a5ca01a0d Samson Tam       2024-08-16  905  	dpp401_dscl_program_easf_h(dpp_base, scl_data);
fb64ee8b4bed757 Samson Tam       2024-04-24  906  	PERF_TRACE();
fb64ee8b4bed757 Samson Tam       2024-04-24  907  }
fb64ee8b4bed757 Samson Tam       2024-04-24  908  /**
fb64ee8b4bed757 Samson Tam       2024-04-24  909   * dpp401_dscl_disable_easf - Disable EASF when no scaling (1:1)
fb64ee8b4bed757 Samson Tam       2024-04-24  910   *
fb64ee8b4bed757 Samson Tam       2024-04-24  911   * @dpp_base: High level DPP struct
fb64ee8b4bed757 Samson Tam       2024-04-24  912   * @scl_data: scalaer_data info
fb64ee8b4bed757 Samson Tam       2024-04-24  913   *
fb64ee8b4bed757 Samson Tam       2024-04-24  914   * When we have 1:1 scaling, we need to disable EASF
fb64ee8b4bed757 Samson Tam       2024-04-24  915   *
fb64ee8b4bed757 Samson Tam       2024-04-24  916   */
fb64ee8b4bed757 Samson Tam       2024-04-24  917  static void dpp401_dscl_disable_easf(struct dpp *dpp_base, const struct scaler_data *scl_data)
fb64ee8b4bed757 Samson Tam       2024-04-24  918  {
fb64ee8b4bed757 Samson Tam       2024-04-24  919  	struct dcn401_dpp *dpp = TO_DCN401_DPP(dpp_base);
fb64ee8b4bed757 Samson Tam       2024-04-24  920  
fb64ee8b4bed757 Samson Tam       2024-04-24  921  	PERF_TRACE();
fb64ee8b4bed757 Samson Tam       2024-04-24  922  	/* DSCL_EASF_V_MODE */
fb64ee8b4bed757 Samson Tam       2024-04-24  923  	REG_UPDATE(DSCL_EASF_V_MODE,
fb64ee8b4bed757 Samson Tam       2024-04-24  924  			SCL_EASF_V_EN, scl_data->dscl_prog_data.easf_v_en);
fb64ee8b4bed757 Samson Tam       2024-04-24  925  	/* DSCL_EASF_H_MODE */
fb64ee8b4bed757 Samson Tam       2024-04-24  926  	REG_UPDATE(DSCL_EASF_H_MODE,
fb64ee8b4bed757 Samson Tam       2024-04-24  927  			SCL_EASF_H_EN, scl_data->dscl_prog_data.easf_h_en);
cbd45405a6162ec Aurabindo Pillai 2024-04-19  928  	PERF_TRACE();
cbd45405a6162ec Aurabindo Pillai 2024-04-19  929  }
cbd45405a6162ec Aurabindo Pillai 2024-04-19  930  static void dpp401_dscl_set_isharp_filter(
cbd45405a6162ec Aurabindo Pillai 2024-04-19  931  	struct dcn401_dpp *dpp, const uint32_t *filter)
cbd45405a6162ec Aurabindo Pillai 2024-04-19  932  {
cbd45405a6162ec Aurabindo Pillai 2024-04-19  933  	int level;
cbd45405a6162ec Aurabindo Pillai 2024-04-19  934  	uint32_t filter_data;
0cd42252af3a5fa Samson Tam       2024-04-26  935  	if (filter == NULL)
0cd42252af3a5fa Samson Tam       2024-04-26  936  		return;
0cd42252af3a5fa Samson Tam       2024-04-26  937  
cbd45405a6162ec Aurabindo Pillai 2024-04-19  938  	REG_UPDATE(ISHARP_DELTA_CTRL,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  939  		ISHARP_DELTA_LUT_HOST_SELECT, 0);
c60041a5ca01a0d Samson Tam       2024-08-16  940  	/* LUT data write is auto-indexed.  Write index once */
c60041a5ca01a0d Samson Tam       2024-08-16  941  	REG_SET(ISHARP_DELTA_INDEX, 0,
c60041a5ca01a0d Samson Tam       2024-08-16  942  			ISHARP_DELTA_INDEX, 0);
cbd45405a6162ec Aurabindo Pillai 2024-04-19  943  	for (level = 0; level < NUM_LEVELS; level++)	{
cbd45405a6162ec Aurabindo Pillai 2024-04-19  944  		filter_data = filter[level];
cbd45405a6162ec Aurabindo Pillai 2024-04-19  945  		REG_SET(ISHARP_DELTA_DATA, 0,
cbd45405a6162ec Aurabindo Pillai 2024-04-19  946  				ISHARP_DELTA_DATA, filter_data);
cbd45405a6162ec Aurabindo Pillai 2024-04-19  947  	}
cbd45405a6162ec Aurabindo Pillai 2024-04-19  948  } // dpp401_dscl_set_isharp_filter
cbd45405a6162ec Aurabindo Pillai 2024-04-19  949  /**
cbd45405a6162ec Aurabindo Pillai 2024-04-19  950   * dpp401_dscl_program_isharp - Program isharp
cbd45405a6162ec Aurabindo Pillai 2024-04-19  951   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  952   * @dpp_base: High level DPP struct
cbd45405a6162ec Aurabindo Pillai 2024-04-19  953   * @scl_data: scalaer_data info
cbd45405a6162ec Aurabindo Pillai 2024-04-19  954   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  955   * This is the primary function to program isharp
cbd45405a6162ec Aurabindo Pillai 2024-04-19  956   *
cbd45405a6162ec Aurabindo Pillai 2024-04-19  957   */
cbd45405a6162ec Aurabindo Pillai 2024-04-19  958  static void dpp401_dscl_program_isharp(struct dpp *dpp_base,
c60041a5ca01a0d Samson Tam       2024-08-16  959  		const struct scaler_data *scl_data,
a0593f4e5ed43bb Relja Vojvodic   2024-08-21  960  		bool program_isharp_1dlut,
c60041a5ca01a0d Samson Tam       2024-08-16  961  		bool *bs_coeffs_updated)
cbd45405a6162ec Aurabindo Pillai 2024-04-19 @962  {

:::::: The code at line 962 was first introduced by commit
:::::: cbd45405a6162ec1ba62b98ac6fb5d75d3aae448 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
