Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13090192591
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375707; cv=none; b=lWhdF+eO3Nz2xwHCJD23f2g2jWwDWdgx8MaGyTdiMPy8r2VHMjNDBHns4QZexQOkCDOQqCMoAFEuEF+3gEgG0qVmGEqYu5TWDdwu8ruUbv/2WDJyS3sADSK2AMk73bgGFxZw/IpkBRzfkQKK80z9aHsZkVdSePpJnXp/d7ig9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375707; c=relaxed/simple;
	bh=FWfh7vZUrlGYS3niHQhymN50nECtcqPJC0uyZm95O48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k2pOtttqfWW+Dch1oC2rnMaY1Tg8/wWHkQzdEeVZ2bdes67qHfvM3b0W3TNtzkbAibV1vYjN3QstC+/6aBYcRcoWOF3JARCrGYhcONS+BMAJCj4LrkrC2xsWyGY+JAnz/1BwafM+0zNU+RyXjqJHLrimOKzsx7tBKJe7AJ9Xm9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHTO/KWm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHTO/KWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728375705; x=1759911705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWfh7vZUrlGYS3niHQhymN50nECtcqPJC0uyZm95O48=;
  b=HHTO/KWmekEU3Ih3VZeZ8/+QK34RUA03sItwN/3WeAMNGCZsyo/HTA0Z
   jy6Q1CHhs5AUSV1bRwmCn008A1SS7IspQLrZBfmsfAT9sKbUd7CQHf18e
   eWnETVGj7Z13D3iF0osPZ6NwvwdESlcNGG7/ah5uFoyzfK6adIqSxj41n
   MRhRObUWzY2TY3gxznrJoFP0qoDISfy6T+gZPVY6U2Yf0nwNZ6BtkbCTx
   ANPliTOo0OXSH5xq4cRafYdqgUPC2/eYkbdg2nKpgjeY5LHbw+WANVvcV
   RukMU5FxJYPc7nvRIGXZ32ySPULdvPxy51Xe17IXmuMxNsw5pnWgynOEU
   A==;
X-CSE-ConnectionGUID: Tv3jCX9sQXu1SzhzxKzFdg==
X-CSE-MsgGUID: ryMnIhgVQhi7Sp35TxevDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27438245"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27438245"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 01:21:44 -0700
X-CSE-ConnectionGUID: 23zsnuTXSX+JNiswto1z+A==
X-CSE-MsgGUID: j86emFivTyyag7Jz/OmbQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76130935"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 01:21:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy5TQ-00065Y-1j;
	Tue, 08 Oct 2024 08:21:40 +0000
Date: Tue, 8 Oct 2024 16:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mounik Katikala <mounik.katikala@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1076/1093]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:582:39: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202410081652.5A0elYn3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3c31f9d5fb29a99c43f59d424f7f717ee2177e14
commit: 4bb3a1e83a07aa7e02851f53298c1102fa37a28e [1076/1093] v4l: xilinx: isppipeline: Add support for Gain Control
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241008/202410081652.5A0elYn3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081652.5A0elYn3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081652.5A0elYn3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-isppipeline.c: In function 'xisp_s_ctrl':
   drivers/media/platform/xilinx/xilinx-isppipeline.c:153:36: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     153 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c:477:34: note: in expansion of macro 'XGET_BIT'
     477 |         bool in_type_conf_gain = XGET_BIT(XISP_IN_TYPE_INDEX, xisp->module_conf);
         |                                  ^~~~~~~~
>> drivers/media/platform/xilinx/xilinx-isppipeline.c:582:39: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     582 |                                      (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
         |                                       ^~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-isppipeline.c:163:65: note: in definition of macro 'XISP_SET_CFG'
     163 |                                 xvip_write(&xisp->xvip, (REG), (VAL)); \
         |                                                                 ^~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +582 drivers/media/platform/xilinx/xilinx-isppipeline.c

   469	
   470	static int xisp_s_ctrl(struct v4l2_ctrl *ctrl)
   471	{
   472		struct xisp_dev *xisp =
   473			container_of(ctrl->handler,
   474				     struct xisp_dev, ctrl_handler);
   475		bool degamma_enabled, degamma_bypass_enabled, degamma_bypass;
   476		bool ccm_enabled, ccm_bypass_enabled, ccm_bypass;
   477		bool in_type_conf_gain = XGET_BIT(XISP_IN_TYPE_INDEX, xisp->module_conf);
   478	
   479		switch (ctrl->id) {
   480		case V4L2_CID_XILINX_ISP_AEC_EN:
   481			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   482								 XISP_AEC_INDEX, ctrl->val);
   483			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   484			break;
   485		case V4L2_CID_XILINX_ISP_AEC_THRESHOLD:
   486			xisp->threshold_aec = ctrl->val;
   487			XISP_SET_CFG(XISP_AEC_INDEX, XISP_AEC_CONFIG_REG, xisp->threshold_aec);
   488			break;
   489		case V4L2_CID_XILINX_ISP_AWB_EN:
   490			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   491								 XISP_AWB_INDEX, ctrl->val);
   492			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   493			break;
   494		case V4L2_CID_XILINX_ISP_AWB_THRESHOLD:
   495			xisp->threshold_awb = ctrl->val;
   496			XISP_SET_CFG(XISP_AWB_INDEX, XISP_AWB_CONFIG_REG, xisp->threshold_awb);
   497			break;
   498		case V4L2_CID_XILINX_ISP_BLC_EN:
   499			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   500								 XISP_BLC_INDEX, ctrl->val);
   501			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   502			break;
   503		case V4L2_CID_XILINX_ISP_MULTI_FACTOR:
   504			xisp->mult_factor = ctrl->val;
   505			XISP_SET_CFG(XISP_BLC_INDEX, XISP_BLC_CONFIG_1_REG, xisp->mult_factor);
   506			break;
   507		case V4L2_CID_BLACK_LEVEL:
   508			xisp->black_level = ctrl->val;
   509			XISP_SET_CFG(XISP_BLC_INDEX, XISP_BLC_CONFIG_2_REG, xisp->black_level);
   510			break;
   511		case V4L2_CID_XILINX_ISP_BPC_EN:
   512			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   513								 XISP_BPC_INDEX, ctrl->val);
   514			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   515			break;
   516		case V4L2_CID_XILINX_ISP_RGBIR_EN:
   517			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   518								 XISP_RGBIR_INDEX, ctrl->val);
   519			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   520			break;
   521		case V4L2_CID_XILINX_ISP_DEGAMMA_EN:
   522			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   523								 XISP_DEGAMMA_INDEX, ctrl->val);
   524			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   525			break;
   526		case V4L2_CID_XILINX_ISP_DEGAMMA_PARAMS:
   527			xisp->degamma_select = ctrl->val;
   528			degamma_enabled = XGET_BIT(XISP_DEGAMMA_INDEX, xisp->module_en);
   529			degamma_bypass_enabled = XGET_BIT(XISP_DEGAMMA_INDEX, xisp->module_bypass_en);
   530			degamma_bypass = XGET_BIT(XISP_DEGAMMA_INDEX, xisp->module_bypass);
   531	
   532			if (degamma_enabled)
   533				if (!degamma_bypass_enabled || !(degamma_bypass_enabled &&
   534								 degamma_bypass)) {
   535					xisp->degamma_lut = xisp_degamma_choices[xisp->degamma_select];
   536					xisp_set_degamma_entries(xisp, XISP_DEGAMMA_CONFIG_BASE,
   537								 xisp->degamma_lut);
   538				}
   539			break;
   540		case V4L2_CID_XILINX_ISP_LSC_EN:
   541			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   542								 XISP_LSC_INDEX, ctrl->val);
   543			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   544			break;
   545		case V4L2_CID_XILINX_ISP_DEMOSAIC_EN:
   546			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   547								 XISP_DEMOSAIC_INDEX, ctrl->val);
   548			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   549			break;
   550		case V4L2_CID_XILINX_ISP_CCM_EN:
   551			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   552								 XISP_CCM_INDEX, ctrl->val);
   553			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   554			break;
   555		case V4L2_CID_XILINX_ISP_CCM_PARAMS:
   556			xisp->ccm_select = ctrl->val;
   557	
   558			ccm_enabled = XGET_BIT(XISP_CCM_INDEX, xisp->module_en);
   559			ccm_bypass_enabled = XGET_BIT(XISP_CCM_INDEX, xisp->module_bypass_en);
   560			ccm_bypass = XGET_BIT(XISP_CCM_INDEX, xisp->module_bypass);
   561	
   562			if (ccm_enabled)
   563				if (!ccm_bypass_enabled || !(ccm_bypass_enabled && ccm_bypass)) {
   564					xisp->ccm_matrix_lut = xisp_ccm_matrix_choices[xisp->ccm_select];
   565					xisp->ccm_offsetarray_lut =
   566					xisp_ccm_offsetarray_choices[xisp->ccm_select];
   567					xisp_set_ccm_matrix_entries(xisp, XISP_CCM_CONFIG_1_BASE,
   568								    XISP_CCM_CONFIG_2_BASE,
   569								    xisp->ccm_matrix_lut,
   570								    xisp->ccm_offsetarray_lut);
   571				}
   572			break;
   573		case V4L2_CID_XILINX_ISP_GAIN_EN:
   574			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   575								 XISP_GAIN_INDEX, ctrl->val);
   576			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   577			break;
   578		case V4L2_CID_XILINX_ISP_GAIN_CONTROL_RED_GAIN:
   579			xisp->rgain = ctrl->val;
   580			if (in_type_conf_gain) {
   581				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_1_REG,
 > 582					     (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
   583								 XISP_UPPER_WORD_LSB),
   584								 xisp->bgain)) |
   585								 xisp->rgain);
   586			}
   587			break;
   588		case V4L2_CID_XILINX_ISP_GAIN_CONTROL_BLUE_GAIN:
   589			xisp->bgain = ctrl->val;
   590			if (in_type_conf_gain) {
   591				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_1_REG,
   592					     (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
   593								 XISP_UPPER_WORD_LSB),
   594								 xisp->bgain)) |
   595								 xisp->rgain);
   596			}
   597			break;
   598		case V4L2_CID_XILINX_ISP_GAIN_CONTROL_GREEN_GAIN:
   599			xisp->ggain = ctrl->val;
   600			if (in_type_conf_gain) {
   601				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_2_REG,
   602					     (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
   603								 XISP_UPPER_WORD_LSB),
   604								 xisp->bayer_fmt)) |
   605								 xisp->ggain);
   606			}
   607			break;
   608		case V4L2_CID_XILINX_ISP_LUMA_GAIN:
   609			xisp->luma_gain = ctrl->val;
   610			if (!in_type_conf_gain)
   611				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_1_REG,
   612					     xisp->luma_gain);
   613			break;
   614		case V4L2_CID_XILINX_ISP_RED_GAIN:
   615			xisp->rgain = ctrl->val;
   616			xvip_write(&xisp->xvip, XISP_RGAIN_REG, xisp->rgain);
   617			break;
   618		case V4L2_CID_XILINX_ISP_BLUE_GAIN:
   619			xisp->bgain = ctrl->val;
   620			xvip_write(&xisp->xvip, XISP_BGAIN_REG, xisp->bgain);
   621			break;
   622		case V4L2_CID_XILINX_ISP_AWB:
   623			xisp->mode_reg = ctrl->val;
   624			xvip_write(&xisp->xvip, XISP_MODE_REG, xisp->mode_reg);
   625			break;
   626		case V4L2_CID_XILINX_ISP_THRESHOLD:
   627			xisp->pawb = ctrl->val;
   628			xvip_write(&xisp->xvip, XISP_PAWB_REG, xisp->pawb);
   629			break;
   630		case V4L2_CID_XILINX_ISP_RED_GAMMA:
   631			select_gamma(ctrl->val, &xisp->red_lut, xisp->gamma_table);
   632			dev_dbg(xisp->xvip.dev, "Setting Red Gamma to %d.%d",
   633				ctrl->val / 10, ctrl->val % 10);
   634			xisp_set_lut_entries(xisp, xisp->red_lut, XISP_GAMMA_RED_REG);
   635			break;
   636		case V4L2_CID_XILINX_ISP_GREEN_GAMMA:
   637			select_gamma(ctrl->val, &xisp->green_lut, xisp->gamma_table);
   638			dev_dbg(xisp->xvip.dev, "Setting Green Gamma to %d.%d",
   639				ctrl->val / 10, ctrl->val % 10);
   640			xisp_set_lut_entries(xisp, xisp->green_lut, XISP_GAMMA_GREEN_REG);
   641			break;
   642		case V4L2_CID_XILINX_ISP_BLUE_GAMMA:
   643			select_gamma(ctrl->val, &xisp->blue_lut, xisp->gamma_table);
   644			dev_dbg(xisp->xvip.dev, "Setting Blue Gamma to %d.%d",
   645				ctrl->val / 10, ctrl->val % 10);
   646			xisp_set_lut_entries(xisp, xisp->blue_lut, XISP_GAMMA_BLUE_REG);
   647			break;
   648		default:
   649			return -EINVAL;
   650		}
   651	
   652		return 0;
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
