Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6463622F177
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 20:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763585848; cv=none; b=J/zYB2I4FiybzLbkMY9tFnra7sALq3Y/zO3ihvoFe3K2E04UPeqzu2CTatBFSuYA0DtWIDRWLEy6EG1TDbwnUbKpfWNTLFWLoaLpqzTIGAKMZNHzeHPNxDQ6E9TSVT1UILRsbeWoY40flbKtsO7GC7K5Iz3/Hmm+jZZKDHMjoj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763585848; c=relaxed/simple;
	bh=WEgQIFDccM9ouiaZiVuqBBqBl4ihsEpGBboC+0gfZ6M=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=jay4yVwE6esCO1u/iek305pWllwjhZjgJxH1dNXenEr1IUDy1WRhK7+bBmwqORs29rNL80iEyoYxeae6qWsRIT0Ch4284Z2VekAgTTcw+K10GGzS6EbaUdjN+THOUqK2yMmMHAbDJDJtwLw9rElCOofRXFgBcbSCCeaa62Z0sEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=VkIEqxps; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="VkIEqxps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4ALg8CGYNCV3bojBrkx1Sm1WIlLtO7SOGCnVkBeafE=;
  b=VkIEqxpspxPOzC5aTrBP00s+NltNpiIxfH3HI97906K6+risa2Y2mZFo
   JFCBl8aGBgJo5RASicSMyCYgj3Qj3np6X9TRqI8PopiAUkp8gZH3Zx3+y
   ZnzVDh7uaAsWPTLdPmuyfJIM4MO/uBE13mpMO2c5WAmd+LAFXtuoUQx6F
   U=;
X-CSE-ConnectionGUID: aHyroHKqTyqq9Oa2iS+/Eg==
X-CSE-MsgGUID: biHvIRRIRTqtdSE0gJymSA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.19,316,1754949600"; 
   d="scan'208";a="131345281"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 21:56:16 +0100
Date: Wed, 19 Nov 2025 21:56:14 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: cros-kernel-buildreports@googlegroups.com
cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 301/301] drivers/gpu/drm/panel/panel-ilitek-il79900a.c:289:55-56:
 initial_scale_value: first occurrence line 337, second occurrence line 343
 (fwd)
Message-ID: <401e844a-d03b-70cf-48c6-4c28ba616c80@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 20 Nov 2025 04:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 301/301]
    drivers/gpu/drm/panel/panel-ilitek-il79900a.c:289:55-56:
    initial_scale_value: first occurrence line 337, second occurrence line 343

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   358b4c20d9bd90f783a5bf7273e770d827c14138
commit: 3913901e2d6501da932464d5167e7deff9e4b6b0 [301/301] CHROMIUM: drm/panel: Add driver for Tianma TL121BVMS07-00 panel
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-r053-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200410.cdCc5HBN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511200410.cdCc5HBN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-ilitek-il79900a.c:289:55-56: initial_scale_value: first occurrence line 337, second occurrence line 343
>> drivers/gpu/drm/panel/panel-ilitek-il79900a.c:289:55-56: nfl_bpg_offset: first occurrence line 319, second occurrence line 344
>> drivers/gpu/drm/panel/panel-ilitek-il79900a.c:289:55-56: rc_model_size: first occurrence line 302, second occurrence line 308
>> drivers/gpu/drm/panel/panel-ilitek-il79900a.c:289:55-56: vbr_enable: first occurrence line 301, second occurrence line 306

vim +289 drivers/gpu/drm/panel/panel-ilitek-il79900a.c

3913901e2d6501 Langyan Ye 2025-09-30  288
3913901e2d6501 Langyan Ye 2025-09-30 @289  static const struct drm_dsc_config tianma_il79900a_dsc = {
3913901e2d6501 Langyan Ye 2025-09-30  290  	.dsc_version_major = 1,
3913901e2d6501 Langyan Ye 2025-09-30  291  	.dsc_version_minor = 2,
3913901e2d6501 Langyan Ye 2025-09-30  292  	.slice_height = 8,
3913901e2d6501 Langyan Ye 2025-09-30  293  	.slice_width = 800,
3913901e2d6501 Langyan Ye 2025-09-30  294  	.slice_count = 2,
3913901e2d6501 Langyan Ye 2025-09-30  295  	.bits_per_component = 8,
3913901e2d6501 Langyan Ye 2025-09-30  296  	.bits_per_pixel = 8 << 4,
3913901e2d6501 Langyan Ye 2025-09-30  297  	.block_pred_enable = true,
3913901e2d6501 Langyan Ye 2025-09-30  298  	.native_420 = false,
3913901e2d6501 Langyan Ye 2025-09-30  299  	.native_422 = false,
3913901e2d6501 Langyan Ye 2025-09-30  300  	.simple_422 = false,
3913901e2d6501 Langyan Ye 2025-09-30 @301  	.vbr_enable = false,
3913901e2d6501 Langyan Ye 2025-09-30 @302  	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
3913901e2d6501 Langyan Ye 2025-09-30  303  	.pic_width = 1600,
3913901e2d6501 Langyan Ye 2025-09-30  304  	.pic_height = 2560,
3913901e2d6501 Langyan Ye 2025-09-30  305  	.convert_rgb = 0,
3913901e2d6501 Langyan Ye 2025-09-30 @306  	.vbr_enable = 0,
3913901e2d6501 Langyan Ye 2025-09-30  307  	.rc_buf_thresh = {14, 28, 42, 56, 70, 84, 98, 105, 112, 119, 121, 123, 125, 126},
3913901e2d6501 Langyan Ye 2025-09-30 @308  	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
3913901e2d6501 Langyan Ye 2025-09-30  309  	.rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST,
3913901e2d6501 Langyan Ye 2025-09-30  310  	.rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST,
3913901e2d6501 Langyan Ye 2025-09-30  311  	.rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST,
3913901e2d6501 Langyan Ye 2025-09-30  312  	.mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC,
3913901e2d6501 Langyan Ye 2025-09-30  313  	.line_buf_depth = 9,
3913901e2d6501 Langyan Ye 2025-09-30  314  	.first_line_bpg_offset = 12,
3913901e2d6501 Langyan Ye 2025-09-30  315  	.initial_xmit_delay = 512,
3913901e2d6501 Langyan Ye 2025-09-30  316  	.initial_offset = 6144,
3913901e2d6501 Langyan Ye 2025-09-30  317  	.rc_quant_incr_limit0 = 11,
3913901e2d6501 Langyan Ye 2025-09-30  318  	.rc_quant_incr_limit1 = 11,
3913901e2d6501 Langyan Ye 2025-09-30 @319  	.nfl_bpg_offset = 1402,
3913901e2d6501 Langyan Ye 2025-09-30  320  	.rc_range_params = {
3913901e2d6501 Langyan Ye 2025-09-30  321  		{ 0,  4, DSC_BPG_OFFSET(2)},
3913901e2d6501 Langyan Ye 2025-09-30  322  		{ 0,  4, DSC_BPG_OFFSET(0)},
3913901e2d6501 Langyan Ye 2025-09-30  323  		{ 1,  5, DSC_BPG_OFFSET(0)},
3913901e2d6501 Langyan Ye 2025-09-30  324  		{ 1,  6, DSC_BPG_OFFSET(-2)},
3913901e2d6501 Langyan Ye 2025-09-30  325  		{ 3,  7, DSC_BPG_OFFSET(-4)},
3913901e2d6501 Langyan Ye 2025-09-30  326  		{ 3,  7, DSC_BPG_OFFSET(-6)},
3913901e2d6501 Langyan Ye 2025-09-30  327  		{ 3,  7, DSC_BPG_OFFSET(-8)},
3913901e2d6501 Langyan Ye 2025-09-30  328  		{ 3,  8, DSC_BPG_OFFSET(-8)},
3913901e2d6501 Langyan Ye 2025-09-30  329  		{ 3,  9, DSC_BPG_OFFSET(-8)},
3913901e2d6501 Langyan Ye 2025-09-30  330  		{ 3, 10, DSC_BPG_OFFSET(-10)},
3913901e2d6501 Langyan Ye 2025-09-30  331  		{ 5, 10, DSC_BPG_OFFSET(-10)},
3913901e2d6501 Langyan Ye 2025-09-30  332  		{ 5, 11, DSC_BPG_OFFSET(-12)},
3913901e2d6501 Langyan Ye 2025-09-30  333  		{ 5, 11, DSC_BPG_OFFSET(-12)},
3913901e2d6501 Langyan Ye 2025-09-30  334  		{ 9, 12, DSC_BPG_OFFSET(-12)},
3913901e2d6501 Langyan Ye 2025-09-30  335  		{12, 13, DSC_BPG_OFFSET(-12)},
3913901e2d6501 Langyan Ye 2025-09-30  336  	},
3913901e2d6501 Langyan Ye 2025-09-30 @337  	.initial_scale_value = 32,
3913901e2d6501 Langyan Ye 2025-09-30  338  	.slice_chunk_size = 800,
3913901e2d6501 Langyan Ye 2025-09-30  339  	.initial_dec_delay = 657,
3913901e2d6501 Langyan Ye 2025-09-30  340  	.final_offset = 4320,
3913901e2d6501 Langyan Ye 2025-09-30  341  	.scale_increment_interval = 222,
3913901e2d6501 Langyan Ye 2025-09-30  342  	.scale_decrement_interval = 11,
3913901e2d6501 Langyan Ye 2025-09-30 @343  	.initial_scale_value = 32,
3913901e2d6501 Langyan Ye 2025-09-30 @344  	.nfl_bpg_offset = 3511,
3913901e2d6501 Langyan Ye 2025-09-30  345  	.slice_bpg_offset = 2179,
3913901e2d6501 Langyan Ye 2025-09-30  346  	.flatness_max_qp = 12,
3913901e2d6501 Langyan Ye 2025-09-30  347  	.flatness_min_qp = 3,
3913901e2d6501 Langyan Ye 2025-09-30  348  };
3913901e2d6501 Langyan Ye 2025-09-30  349

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
