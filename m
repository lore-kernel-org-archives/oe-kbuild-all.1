Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C74446E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317800; cv=none; b=LISVYTiVFWWYkRuFLWPli7RACwYOCbCe1fVN8eTzyYXwdIZPcm8yWoHkq4Z0Rsnq5ilbAeo6t4KJ5/BCSgHp5/ncOttR7MViuWiSUH9FxJGfIrKtun2S7JIq5TT8vXM0cyRPR9CgPvcdwc7ErV7YbvSoTiHPM6TLVL1ADRs8Rtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317800; c=relaxed/simple;
	bh=T4Y98U5S1RxsfYpFo7ObJDUrPJgQpMfgJNY365YY+8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oWuqLWhximOI9juf4kZHwha4zl09cavDmuXFpMdSU/pMeHPb1WJRAli7Bv7Atz78+gZc+isOWQ2cHMCsmq2m9Z+PGdTod5OEbGHlDCoAOQ/tV/zBUyx/OMhOwfQ1eqb9bVYgW13J3hJ1TiHWSHAEHq0zE9OOC7RtQ04Bhg7aKUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwsH9DMJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwsH9DMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785317798; x=1816853798;
  h=date:from:to:cc:subject:message-id;
  bh=T4Y98U5S1RxsfYpFo7ObJDUrPJgQpMfgJNY365YY+8k=;
  b=nwsH9DMJxa2hLgIFnyzwvFDMbwECcn8Gd6akkVoV+2VD11YxXv5rT7or
   ljSnkeoc/A987Ld3RTMlR/Ob9U5jCeSMCu/4FMU9zIr95KGGOXb3IdMZt
   k7rf8UqOF1hnGueoOzGndzv8YQt1CroGPJT7OChr58UDMW5olc4csIvBy
   WZ+QctcaKP2UWnHdBLo1f+8dmLQC4V8tFCjkKIAzovNLzR5IT+nAhVXEL
   jVX/N96oNte/GVj1sD15pKcGUsVsTVgjxQYIBE1yD+CwLwBqvT6cXdKbL
   qzXG7Xg89R+s3YHmvSbg/KDmoDSVV2+n3s1FbgF1HRPchYLNPIJi78MxV
   w==;
X-CSE-ConnectionGUID: DpJlQFegQ9+Xje7Ps4z/RA==
X-CSE-MsgGUID: Ogo+rJFCQsWBpokQ6jxymA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96578517"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96578517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 02:36:34 -0700
X-CSE-ConnectionGUID: AtZnTHluQiKHP/IlP0nCtg==
X-CSE-MsgGUID: qkVuC1h0TBGUj68Y7OvkJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="256625696"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2026 02:36:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp0iD-00000000fEX-3q86;
	Wed, 29 Jul 2026 09:36:29 +0000
Date: Wed, 29 Jul 2026 17:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 561/700]
 drivers/gpu/drm/panel/panel-simple.c:4058:32: warning: 'arm_rtsm' defined but
 not used
Message-ID: <202607291732.S14HjiLW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 9005883099902f77e90ca8d790a45433e2a041d6 [561/700] drm/panel: panel-simple: Size reduction
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260729/202607291732.S14HjiLW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291732.S14HjiLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291732.S14HjiLW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-simple.c:4058:32: warning: 'arm_rtsm' defined but not used [-Wunused-const-variable=]
    4058 | static const struct panel_desc arm_rtsm = {
         |                                ^~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:4030:32: warning: 'yes_optoelectronics_ytc700tlag_05_201c' defined but not used [-Wunused-const-variable=]
    4030 | static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:4006:32: warning: 'winstar_wf35ltiacd' defined but not used [-Wunused-const-variable=]
    4006 | static const struct panel_desc winstar_wf35ltiacd = {
         |                                ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3981:32: warning: 'vl050_8048nt_c01' defined but not used [-Wunused-const-variable=]
    3981 | static const struct panel_desc vl050_8048nt_c01 = {
         |                                ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3955:32: warning: 'vivax_tpc9150_panel' defined but not used [-Wunused-const-variable=]
    3955 | static const struct panel_desc vivax_tpc9150_panel = {
         |                                ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3932:32: warning: 'urt_umsh_8596md_parallel' defined but not used [-Wunused-const-variable=]
    3932 | static const struct panel_desc urt_umsh_8596md_parallel = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3920:32: warning: 'urt_umsh_8596md_lvds' defined but not used [-Wunused-const-variable=]
    3920 | static const struct panel_desc urt_umsh_8596md_lvds = {
         |                                ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3897:32: warning: 'tpk_f10a_0102' defined but not used [-Wunused-const-variable=]
    3897 | static const struct panel_desc tpk_f10a_0102 = {
         |                                ^~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3875:32: warning: 'tpk_f07a_0102' defined but not used [-Wunused-const-variable=]
    3875 | static const struct panel_desc tpk_f07a_0102 = {
         |                                ^~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3851:32: warning: 'toshiba_lt089ac29000' defined but not used [-Wunused-const-variable=]
    3851 | static const struct panel_desc toshiba_lt089ac29000 = {
         |                                ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3825:32: warning: 'ti_nspire_classic_lcd_panel' defined but not used [-Wunused-const-variable=]
    3825 | static const struct panel_desc ti_nspire_classic_lcd_panel = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3798:32: warning: 'ti_nspire_cx_lcd_panel' defined but not used [-Wunused-const-variable=]
    3798 | static const struct panel_desc ti_nspire_cx_lcd_panel = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3771:32: warning: 'tianma_tm070rvhg71' defined but not used [-Wunused-const-variable=]
    3771 | static const struct panel_desc tianma_tm070rvhg71 = {
         |                                ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3746:32: warning: 'tianma_tm070jvhg33' defined but not used [-Wunused-const-variable=]
    3746 | static const struct panel_desc tianma_tm070jvhg33 = {
         |                                ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3734:32: warning: 'tianma_tm070jdhg30' defined but not used [-Wunused-const-variable=]
    3734 | static const struct panel_desc tianma_tm070jdhg30 = {
         |                                ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3709:32: warning: 'tfc_s9700rtwv43tr_01b' defined but not used [-Wunused-const-variable=]
    3709 | static const struct panel_desc tfc_s9700rtwv43tr_01b = {
         |                                ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3685:32: warning: 'tsd_tst043015cmhx' defined but not used [-Wunused-const-variable=]
    3685 | static const struct panel_desc tsd_tst043015cmhx = {
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3650:32: warning: 'startek_kd070wvfpa' defined but not used [-Wunused-const-variable=]
    3650 | static const struct panel_desc startek_kd070wvfpa = {
         |                                ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3622:32: warning: 'starry_kr070pe2t' defined but not used [-Wunused-const-variable=]
    3622 | static const struct panel_desc starry_kr070pe2t = {
         |                                ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-simple.c:3600:32: warning: 'shelly_sca07010_bfn_lnn' defined but not used [-Wunused-const-variable=]
    3600 | static const struct panel_desc shelly_sca07010_bfn_lnn = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3574:32: warning: 'sharp_ls020b1dd01d' defined but not used [-Wunused-const-variable=]
    3574 | static const struct panel_desc sharp_ls020b1dd01d = {
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3535:32: warning: 'sharp_lq101k1ly04' defined but not used [-Wunused-const-variable=]
    3535 | static const struct panel_desc sharp_lq101k1ly04 = {
         |                                ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3511:32: warning: 'sharp_lq035q7db03' defined but not used [-Wunused-const-variable=]
    3511 | static const struct panel_desc sharp_lq035q7db03 = {
         |                                ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3486:32: warning: 'sharp_lq070y3dg3b' defined but not used [-Wunused-const-variable=]
    3486 | static const struct panel_desc sharp_lq070y3dg3b = {
         |                                ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3461:32: warning: 'satoz_sat050at40h12r2' defined but not used [-Wunused-const-variable=]
    3461 | static const struct panel_desc satoz_sat050at40h12r2 = {
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3436:32: warning: 'samsung_ltn101nt05' defined but not used [-Wunused-const-variable=]
    3436 | static const struct panel_desc samsung_ltn101nt05 = {
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3406:32: warning: 'samsung_ltl101al01' defined but not used [-Wunused-const-variable=]
    3406 | static const struct panel_desc samsung_ltl101al01 = {
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3376:32: warning: 'rocktech_rk101ii01d_ct' defined but not used [-Wunused-const-variable=]
    3376 | static const struct panel_desc rocktech_rk101ii01d_ct = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3347:32: warning: 'rocktech_rk070er9427' defined but not used [-Wunused-const-variable=]
    3347 | static const struct panel_desc rocktech_rk070er9427 = {
         |                                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3322:32: warning: 'rocktech_rk043fn48h' defined but not used [-Wunused-const-variable=]
    3322 | static const struct panel_desc rocktech_rk043fn48h = {
         |                                ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3295:32: warning: 'qishenglong_gopher2b_lcd' defined but not used [-Wunused-const-variable=]
    3295 | static const struct panel_desc qishenglong_gopher2b_lcd = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3257:32: warning: 'qd43003c0_40' defined but not used [-Wunused-const-variable=]
    3257 | static const struct panel_desc qd43003c0_40 = {
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3231:32: warning: 'powertip_ph800480t013_idf02' defined but not used [-Wunused-const-variable=]
    3231 | static const struct panel_desc powertip_ph800480t013_idf02  = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3208:32: warning: 'pda_91_00156_a0' defined but not used [-Wunused-const-variable=]
    3208 | static const struct panel_desc pda_91_00156_a0  = {
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3182:32: warning: 'osddisplays_osd070t1718_19ts' defined but not used [-Wunused-const-variable=]
    3182 | static const struct panel_desc osddisplays_osd070t1718_19ts = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3156:32: warning: 'ortustech_com43h4m85ulc' defined but not used [-Wunused-const-variable=]
    3156 | static const struct panel_desc ortustech_com43h4m85ulc = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3131:32: warning: 'ortustech_com37h3m' defined but not used [-Wunused-const-variable=]
    3131 | static const struct panel_desc ortustech_com37h3m = {
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3107:32: warning: 'ontat_yx700wv03' defined but not used [-Wunused-const-variable=]
    3107 | static const struct panel_desc ontat_yx700wv03 = {
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3075:32: warning: 'olimex_lcd_olinuxino_43ts' defined but not used [-Wunused-const-variable=]
    3075 | static const struct panel_desc olimex_lcd_olinuxino_43ts = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3046:32: warning: 'okaya_rs800480t_7x0gp' defined but not used [-Wunused-const-variable=]
    3046 | static const struct panel_desc okaya_rs800480t_7x0gp = {
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:3021:32: warning: 'nvd_9128' defined but not used [-Wunused-const-variable=]
    3021 | static const struct panel_desc nvd_9128 = {
         |                                ^~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2994:32: warning: 'nlt_nl192108ac18_02d' defined but not used [-Wunused-const-variable=]
    2994 | static const struct panel_desc nlt_nl192108ac18_02d = {
         |                                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2968:32: warning: 'newhaven_nhd_43_480272ef_atxl' defined but not used [-Wunused-const-variable=]
    2968 | static const struct panel_desc newhaven_nhd_43_480272ef_atxl = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2945:32: warning: 'netron_dy_e231732' defined but not used [-Wunused-const-variable=]
    2945 | static const struct panel_desc netron_dy_e231732 = {
         |                                ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2921:32: warning: 'nec_nl4827hc19_05b' defined but not used [-Wunused-const-variable=]
    2921 | static const struct panel_desc nec_nl4827hc19_05b = {
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2892:32: warning: 'nec_nl12880bc20_05' defined but not used [-Wunused-const-variable=]
    2892 | static const struct panel_desc nec_nl12880bc20_05 = {
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2863:32: warning: 'multi_inno_mi1010ait_1cp' defined but not used [-Wunused-const-variable=]
    2863 | static const struct panel_desc multi_inno_mi1010ait_1cp = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2834:32: warning: 'multi_inno_mi0800ft_9' defined but not used [-Wunused-const-variable=]
    2834 | static const struct panel_desc multi_inno_mi0800ft_9 = {
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2804:32: warning: 'multi_inno_mi0700s4t_6' defined but not used [-Wunused-const-variable=]
    2804 | static const struct panel_desc multi_inno_mi0700s4t_6 = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2770:32: warning: 'mitsubishi_aa070mc01' defined but not used [-Wunused-const-variable=]
    2770 | static const struct panel_desc mitsubishi_aa070mc01 = {
         |                                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2737:32: warning: 'logicpd_type_28' defined but not used [-Wunused-const-variable=]
    2737 | static const struct panel_desc logicpd_type_28 = {
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2704:32: warning: 'logictechno_lttd800480070_l6wh_rt' defined but not used [-Wunused-const-variable=]
    2704 | static const struct panel_desc logictechno_lttd800480070_l6wh_rt = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-simple.c:2672:32: warning: 'logictechno_lttd800480070_l2rt' defined but not used [-Wunused-const-variable=]
    2672 | static const struct panel_desc logictechno_lttd800480070_l2rt = {


vim +/arm_rtsm +4058 drivers/gpu/drm/panel/panel-simple.c

227e4f4079e198 Bhuvanchandra DV    2016-05-05  3874  
227e4f4079e198 Bhuvanchandra DV    2016-05-05 @3875  static const struct panel_desc tpk_f07a_0102 = {
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3876  	.modes = &tpk_f07a_0102_mode,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3877  	.num_modes = 1,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3878  	.size = {
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3879  		.width = 152,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3880  		.height = 91,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3881  	},
88bc4178568b8e Laurent Pinchart    2018-09-22  3882  	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3883  };
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3884  
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3885  static const struct drm_display_mode tpk_f10a_0102_mode = {
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3886  	.clock = 45000,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3887  	.hdisplay = 1024,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3888  	.hsync_start = 1024 + 176,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3889  	.hsync_end = 1024 + 176 + 5,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3890  	.htotal = 1024 + 176 + 5 + 88,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3891  	.vdisplay = 600,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3892  	.vsync_start = 600 + 20,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3893  	.vsync_end = 600 + 20 + 5,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3894  	.vtotal = 600 + 20 + 5 + 25,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3895  };
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3896  
227e4f4079e198 Bhuvanchandra DV    2016-05-05 @3897  static const struct panel_desc tpk_f10a_0102 = {
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3898  	.modes = &tpk_f10a_0102_mode,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3899  	.num_modes = 1,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3900  	.size = {
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3901  		.width = 223,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3902  		.height = 125,
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3903  	},
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3904  };
227e4f4079e198 Bhuvanchandra DV    2016-05-05  3905  
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3906  static const struct display_timing urt_umsh_8596md_timing = {
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3907  	.pixelclock = { 33260000, 33260000, 33260000 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3908  	.hactive = { 800, 800, 800 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3909  	.hfront_porch = { 41, 41, 41 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3910  	.hback_porch = { 216 - 128, 216 - 128, 216 - 128 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3911  	.hsync_len = { 71, 128, 128 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3912  	.vactive = { 480, 480, 480 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3913  	.vfront_porch = { 10, 10, 10 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3914  	.vback_porch = { 35 - 2, 35 - 2, 35 - 2 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3915  	.vsync_len = { 2, 2, 2 },
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3916  	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_NEGEDGE |
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3917  		DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3918  };
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3919  
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13 @3920  static const struct panel_desc urt_umsh_8596md_lvds = {
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3921  	.timings = &urt_umsh_8596md_timing,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3922  	.num_timings = 1,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3923  	.bpc = 6,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3924  	.size = {
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3925  		.width = 152,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3926  		.height = 91,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3927  	},
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3928  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
9a2654c0f62a17 Laurent Pinchart    2019-09-04  3929  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3930  };
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3931  
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13 @3932  static const struct panel_desc urt_umsh_8596md_parallel = {
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3933  	.timings = &urt_umsh_8596md_timing,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3934  	.num_timings = 1,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3935  	.bpc = 6,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3936  	.size = {
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3937  		.width = 152,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3938  		.height = 91,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3939  	},
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3940  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3941  };
06a9dc65afbd9d Maciej S. Szmigiero 2016-02-13  3942  
1a84a308acda28 Nikola Pavlica      2021-10-11  3943  static const struct drm_display_mode vivax_tpc9150_panel_mode = {
1a84a308acda28 Nikola Pavlica      2021-10-11  3944  	.clock = 60000,
1a84a308acda28 Nikola Pavlica      2021-10-11  3945  	.hdisplay = 1024,
1a84a308acda28 Nikola Pavlica      2021-10-11  3946  	.hsync_start = 1024 + 160,
1a84a308acda28 Nikola Pavlica      2021-10-11  3947  	.hsync_end = 1024 + 160 + 100,
1a84a308acda28 Nikola Pavlica      2021-10-11  3948  	.htotal = 1024 + 160 + 100 + 60,
1a84a308acda28 Nikola Pavlica      2021-10-11  3949  	.vdisplay = 600,
1a84a308acda28 Nikola Pavlica      2021-10-11  3950  	.vsync_start = 600 + 12,
1a84a308acda28 Nikola Pavlica      2021-10-11  3951  	.vsync_end = 600 + 12 + 10,
1a84a308acda28 Nikola Pavlica      2021-10-11  3952  	.vtotal = 600 + 12 + 10 + 13,
1a84a308acda28 Nikola Pavlica      2021-10-11  3953  };
1a84a308acda28 Nikola Pavlica      2021-10-11  3954  
1a84a308acda28 Nikola Pavlica      2021-10-11 @3955  static const struct panel_desc vivax_tpc9150_panel = {
1a84a308acda28 Nikola Pavlica      2021-10-11  3956  	.modes = &vivax_tpc9150_panel_mode,
1a84a308acda28 Nikola Pavlica      2021-10-11  3957  	.num_modes = 1,
1a84a308acda28 Nikola Pavlica      2021-10-11  3958  	.bpc = 6,
1a84a308acda28 Nikola Pavlica      2021-10-11  3959  	.size = {
1a84a308acda28 Nikola Pavlica      2021-10-11  3960  		.width = 200,
1a84a308acda28 Nikola Pavlica      2021-10-11  3961  		.height = 115,
1a84a308acda28 Nikola Pavlica      2021-10-11  3962  	},
1a84a308acda28 Nikola Pavlica      2021-10-11  3963  	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
1a84a308acda28 Nikola Pavlica      2021-10-11  3964  	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
1a84a308acda28 Nikola Pavlica      2021-10-11  3965  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
1a84a308acda28 Nikola Pavlica      2021-10-11  3966  };
1a84a308acda28 Nikola Pavlica      2021-10-11  3967  
04206185a16007 Fabio Estevam       2019-02-18  3968  static const struct drm_display_mode vl050_8048nt_c01_mode = {
04206185a16007 Fabio Estevam       2019-02-18  3969  	.clock = 33333,
04206185a16007 Fabio Estevam       2019-02-18  3970  	.hdisplay = 800,
04206185a16007 Fabio Estevam       2019-02-18  3971  	.hsync_start = 800 + 210,
04206185a16007 Fabio Estevam       2019-02-18  3972  	.hsync_end = 800 + 210 + 20,
04206185a16007 Fabio Estevam       2019-02-18  3973  	.htotal = 800 + 210 + 20 + 46,
04206185a16007 Fabio Estevam       2019-02-18  3974  	.vdisplay =  480,
04206185a16007 Fabio Estevam       2019-02-18  3975  	.vsync_start = 480 + 22,
04206185a16007 Fabio Estevam       2019-02-18  3976  	.vsync_end = 480 + 22 + 10,
04206185a16007 Fabio Estevam       2019-02-18  3977  	.vtotal = 480 + 22 + 10 + 23,
04206185a16007 Fabio Estevam       2019-02-18  3978  	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
04206185a16007 Fabio Estevam       2019-02-18  3979  };
04206185a16007 Fabio Estevam       2019-02-18  3980  
04206185a16007 Fabio Estevam       2019-02-18 @3981  static const struct panel_desc vl050_8048nt_c01 = {
04206185a16007 Fabio Estevam       2019-02-18  3982  	.modes = &vl050_8048nt_c01_mode,
04206185a16007 Fabio Estevam       2019-02-18  3983  	.num_modes = 1,
04206185a16007 Fabio Estevam       2019-02-18  3984  	.bpc = 8,
04206185a16007 Fabio Estevam       2019-02-18  3985  	.size = {
04206185a16007 Fabio Estevam       2019-02-18  3986  		.width = 120,
04206185a16007 Fabio Estevam       2019-02-18  3987  		.height = 76,
04206185a16007 Fabio Estevam       2019-02-18  3988  	},
04206185a16007 Fabio Estevam       2019-02-18  3989  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
f5436f77488654 Sam Ravnborg        2020-06-30  3990  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
04206185a16007 Fabio Estevam       2019-02-18  3991  };
04206185a16007 Fabio Estevam       2019-02-18  3992  
e4bac408b08437 Richard Genoud      2017-03-27  3993  static const struct drm_display_mode winstar_wf35ltiacd_mode = {
e4bac408b08437 Richard Genoud      2017-03-27  3994  	.clock = 6410,
e4bac408b08437 Richard Genoud      2017-03-27  3995  	.hdisplay = 320,
e4bac408b08437 Richard Genoud      2017-03-27  3996  	.hsync_start = 320 + 20,
e4bac408b08437 Richard Genoud      2017-03-27  3997  	.hsync_end = 320 + 20 + 30,
e4bac408b08437 Richard Genoud      2017-03-27  3998  	.htotal = 320 + 20 + 30 + 38,
e4bac408b08437 Richard Genoud      2017-03-27  3999  	.vdisplay = 240,
e4bac408b08437 Richard Genoud      2017-03-27  4000  	.vsync_start = 240 + 4,
e4bac408b08437 Richard Genoud      2017-03-27  4001  	.vsync_end = 240 + 4 + 3,
e4bac408b08437 Richard Genoud      2017-03-27  4002  	.vtotal = 240 + 4 + 3 + 15,
e4bac408b08437 Richard Genoud      2017-03-27  4003  	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
e4bac408b08437 Richard Genoud      2017-03-27  4004  };
e4bac408b08437 Richard Genoud      2017-03-27  4005  
e4bac408b08437 Richard Genoud      2017-03-27 @4006  static const struct panel_desc winstar_wf35ltiacd = {
e4bac408b08437 Richard Genoud      2017-03-27  4007  	.modes = &winstar_wf35ltiacd_mode,
e4bac408b08437 Richard Genoud      2017-03-27  4008  	.num_modes = 1,
e4bac408b08437 Richard Genoud      2017-03-27  4009  	.bpc = 8,
e4bac408b08437 Richard Genoud      2017-03-27  4010  	.size = {
e4bac408b08437 Richard Genoud      2017-03-27  4011  		.width = 70,
e4bac408b08437 Richard Genoud      2017-03-27  4012  		.height = 53,
e4bac408b08437 Richard Genoud      2017-03-27  4013  	},
e4bac408b08437 Richard Genoud      2017-03-27  4014  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
e4bac408b08437 Richard Genoud      2017-03-27  4015  };
e4bac408b08437 Richard Genoud      2017-03-27  4016  
7a1f4fa4a62933 Jagan Teki          2020-09-04  4017  static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode = {
7a1f4fa4a62933 Jagan Teki          2020-09-04  4018  	.clock = 51200,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4019  	.hdisplay = 1024,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4020  	.hsync_start = 1024 + 100,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4021  	.hsync_end = 1024 + 100 + 100,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4022  	.htotal = 1024 + 100 + 100 + 120,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4023  	.vdisplay = 600,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4024  	.vsync_start = 600 + 10,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4025  	.vsync_end = 600 + 10 + 10,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4026  	.vtotal = 600 + 10 + 10 + 15,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4027  	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4028  };
7a1f4fa4a62933 Jagan Teki          2020-09-04  4029  
7a1f4fa4a62933 Jagan Teki          2020-09-04 @4030  static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
7a1f4fa4a62933 Jagan Teki          2020-09-04  4031  	.modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4032  	.num_modes = 1,
44379b986424b0 Jagan Teki          2021-07-25  4033  	.bpc = 8,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4034  	.size = {
7a1f4fa4a62933 Jagan Teki          2020-09-04  4035  		.width = 154,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4036  		.height = 90,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4037  	},
7a1f4fa4a62933 Jagan Teki          2020-09-04  4038  	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4039  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4040  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
7a1f4fa4a62933 Jagan Teki          2020-09-04  4041  };
7a1f4fa4a62933 Jagan Teki          2020-09-04  4042  
fcec4163afa5f3 Linus Walleij       2018-10-26  4043  static const struct drm_display_mode arm_rtsm_mode[] = {
fcec4163afa5f3 Linus Walleij       2018-10-26  4044  	{
fcec4163afa5f3 Linus Walleij       2018-10-26  4045  		.clock = 65000,
fcec4163afa5f3 Linus Walleij       2018-10-26  4046  		.hdisplay = 1024,
fcec4163afa5f3 Linus Walleij       2018-10-26  4047  		.hsync_start = 1024 + 24,
fcec4163afa5f3 Linus Walleij       2018-10-26  4048  		.hsync_end = 1024 + 24 + 136,
fcec4163afa5f3 Linus Walleij       2018-10-26  4049  		.htotal = 1024 + 24 + 136 + 160,
fcec4163afa5f3 Linus Walleij       2018-10-26  4050  		.vdisplay = 768,
fcec4163afa5f3 Linus Walleij       2018-10-26  4051  		.vsync_start = 768 + 3,
fcec4163afa5f3 Linus Walleij       2018-10-26  4052  		.vsync_end = 768 + 3 + 6,
fcec4163afa5f3 Linus Walleij       2018-10-26  4053  		.vtotal = 768 + 3 + 6 + 29,
fcec4163afa5f3 Linus Walleij       2018-10-26  4054  		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
fcec4163afa5f3 Linus Walleij       2018-10-26  4055  	},
fcec4163afa5f3 Linus Walleij       2018-10-26  4056  };
fcec4163afa5f3 Linus Walleij       2018-10-26  4057  
fcec4163afa5f3 Linus Walleij       2018-10-26 @4058  static const struct panel_desc arm_rtsm = {
fcec4163afa5f3 Linus Walleij       2018-10-26  4059  	.modes = arm_rtsm_mode,
fcec4163afa5f3 Linus Walleij       2018-10-26  4060  	.num_modes = 1,
fcec4163afa5f3 Linus Walleij       2018-10-26  4061  	.bpc = 8,
fcec4163afa5f3 Linus Walleij       2018-10-26  4062  	.size = {
fcec4163afa5f3 Linus Walleij       2018-10-26  4063  		.width = 400,
fcec4163afa5f3 Linus Walleij       2018-10-26  4064  		.height = 300,
fcec4163afa5f3 Linus Walleij       2018-10-26  4065  	},
fcec4163afa5f3 Linus Walleij       2018-10-26  4066  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
fcec4163afa5f3 Linus Walleij       2018-10-26  4067  };
fcec4163afa5f3 Linus Walleij       2018-10-26  4068  

:::::: The code at line 4058 was first introduced by commit
:::::: fcec4163afa5f32a4aa31245a699c743fa33e2e7 drm/panel: Add simple panel mode for the ARM RTSM

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
