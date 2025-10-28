Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3240855
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 00:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611471; cv=none; b=COqu1ZOwkXu5yfLPZ5Pd8SpgyCqk35HIgo0nC1NuCbILNRbkuRZVoqFm95uOoJZtja8sdZXGoFcZvH3JFw6pCLfNUmcfF8SzQ7E2qTcfTHQoBsUXqyFIrY33Po27UBu6Xs+ynqej5hDxnt99tmadDsNIuIjRs1pYwfBpqO2W7ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611471; c=relaxed/simple;
	bh=o/uluCbWhvZ7o0jJ2HFyGBlTePjWqH4H9lLvIXDdNac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dAmao8iQSnPz0LORJ9zHQF5eMWcO9n/un0x0CT177Jk0WTQfdM277AjIFClmc72NrTWoW0UJ9n+Zoes/gFDNZ6STV1d214WjjjXk1fa9Cb0X2BqVNhiq7LNPfWSvQkzzT4gg1kYleDl8TOXeDIyf5zNE0H1aF9We8R+BoApT9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0lnbX3Q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0lnbX3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761611469; x=1793147469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/uluCbWhvZ7o0jJ2HFyGBlTePjWqH4H9lLvIXDdNac=;
  b=b0lnbX3QxemogAZfvcWdFhmCgcAOhKv5UWO8gacJTU3LQ7Do7MQQ90D1
   5k+lBs633c7FN8R96Q1+Dmscl/VIhYo8hidCyTZPxxG9uQMi2PhOGWon1
   p6Xc5hTFvCcHWrDwav/g5IAhNB17TdG6l89VqL+GOwYj/ERbLEIinZtwk
   DEb3BNClCbKevMRmu88Baen+U+1oBmSaW5Cj3ZCjeIxkZv3j0XICciEI/
   p5MX6zLdsxnx+RZkjdJ3KmleSlBba5TaIAKbMsa3GIZS7dZtXITsEiSoJ
   7Mkb/F6v7X+toE+DGVbS3WKA0Q+OpRRJy1vR4xaVJtHrEnX2DuDrt70Vd
   Q==;
X-CSE-ConnectionGUID: Iiz1hGCMRSiySVf4mAcDtw==
X-CSE-MsgGUID: S5owq/jRT3KUwTUiYZCvkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63630706"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63630706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:31:06 -0700
X-CSE-ConnectionGUID: wODAfOOuR5++gBxlnUkmlw==
X-CSE-MsgGUID: 4H/LGh3RQA6dMr05idx/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="208799200"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 17:31:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDXc6-000Ib7-33;
	Tue, 28 Oct 2025 00:31:02 +0000
Date: Tue, 28 Oct 2025 08:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 213/218]
 drivers/gpu/drm/panel/panel-ilitek-il79900a.c:302:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202510280848.knkR4lpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   7cb5794f39b1ac6289464c0ce92682cffda5e02b
commit: 3913901e2d6501da932464d5167e7deff9e4b6b0 [213/218] CHROMIUM: drm/panel: Add driver for Tianma TL121BVMS07-00 panel
config: arm-randconfig-r131-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280848.knkR4lpS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280848.knkR4lpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280848.knkR4lpS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-ilitek-il79900a.c:302:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/panel/panel-ilitek-il79900a.c:308:10: sparse:   also defined here

vim +302 drivers/gpu/drm/panel/panel-ilitek-il79900a.c

   288	
   289	static const struct drm_dsc_config tianma_il79900a_dsc = {
   290		.dsc_version_major = 1,
   291		.dsc_version_minor = 2,
   292		.slice_height = 8,
   293		.slice_width = 800,
   294		.slice_count = 2,
   295		.bits_per_component = 8,
   296		.bits_per_pixel = 8 << 4,
   297		.block_pred_enable = true,
   298		.native_420 = false,
   299		.native_422 = false,
   300		.simple_422 = false,
   301		.vbr_enable = false,
 > 302		.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
   303		.pic_width = 1600,
   304		.pic_height = 2560,
   305		.convert_rgb = 0,
   306		.vbr_enable = 0,
   307		.rc_buf_thresh = {14, 28, 42, 56, 70, 84, 98, 105, 112, 119, 121, 123, 125, 126},
   308		.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
   309		.rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST,
   310		.rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST,
   311		.rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST,
   312		.mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC,
   313		.line_buf_depth = 9,
   314		.first_line_bpg_offset = 12,
   315		.initial_xmit_delay = 512,
   316		.initial_offset = 6144,
   317		.rc_quant_incr_limit0 = 11,
   318		.rc_quant_incr_limit1 = 11,
   319		.nfl_bpg_offset = 1402,
   320		.rc_range_params = {
   321			{ 0,  4, DSC_BPG_OFFSET(2)},
   322			{ 0,  4, DSC_BPG_OFFSET(0)},
   323			{ 1,  5, DSC_BPG_OFFSET(0)},
   324			{ 1,  6, DSC_BPG_OFFSET(-2)},
   325			{ 3,  7, DSC_BPG_OFFSET(-4)},
   326			{ 3,  7, DSC_BPG_OFFSET(-6)},
   327			{ 3,  7, DSC_BPG_OFFSET(-8)},
   328			{ 3,  8, DSC_BPG_OFFSET(-8)},
   329			{ 3,  9, DSC_BPG_OFFSET(-8)},
   330			{ 3, 10, DSC_BPG_OFFSET(-10)},
   331			{ 5, 10, DSC_BPG_OFFSET(-10)},
   332			{ 5, 11, DSC_BPG_OFFSET(-12)},
   333			{ 5, 11, DSC_BPG_OFFSET(-12)},
   334			{ 9, 12, DSC_BPG_OFFSET(-12)},
   335			{12, 13, DSC_BPG_OFFSET(-12)},
   336		},
   337		.initial_scale_value = 32,
   338		.slice_chunk_size = 800,
   339		.initial_dec_delay = 657,
   340		.final_offset = 4320,
   341		.scale_increment_interval = 222,
   342		.scale_decrement_interval = 11,
   343		.initial_scale_value = 32,
   344		.nfl_bpg_offset = 3511,
   345		.slice_bpg_offset = 2179,
   346		.flatness_max_qp = 12,
   347		.flatness_min_qp = 3,
   348	};
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
