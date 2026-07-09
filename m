Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00F3E9C29
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587497; cv=none; b=McrXAnIFfGxPkrxkeFBjGiNZBrl00AigpDjN9BQM9DpbaKXKYvLAqKT5PQxl6xtIRBR0GaNtZfbVcxk4OpYqpv6zfBy7kEaysUv2xmrmUmqSfyN4rKtF33tMuET/DgAnOynoiL9Hx6YT50I3rwKO+GrFhQ/fTq+4OMdVyDNVFgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587497; c=relaxed/simple;
	bh=xGM+yYyiql09nFukgQUmeIV679B6z3u7qKHo5m7/9+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h9BEpgO7n1INPSkm4WGSXBShTogKSYqtwwF4XMAR1qlFgYvAM9yQm4s2SxNmWAV4b00KufLpt0ZS7eLhjcP8BVxNrpKC7DSxcWhqqpZTDXAQUH/HWK3lBQLZ85iZ0Uw+r+9LjvT/2DWMzNnD3Mhaa9Yb1+EZOuIYOHV7le9/SV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmNea9OG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmNea9OG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783587494; x=1815123494;
  h=date:from:to:cc:subject:message-id;
  bh=xGM+yYyiql09nFukgQUmeIV679B6z3u7qKHo5m7/9+8=;
  b=kmNea9OGuCBX8cK5/c6YMCW+qw124aQAB2B7H83w0wmpeIUPjjIfrwSm
   D+SQVMR5T5qr1oUSBQW9bTYG6H5tC8+S84IpjH9QU7GpozRBfPppRRzcG
   5WTAQwSWOFjAKK/XijIfnWZP7MMXfKFs+g5Do21Uk700QAZr9n93ijJbr
   fEX2odRMuodr9sPFnbRSweWYRJN26jo0NZ0xaRqwUhTK+8aCcoiBIAvdU
   adeAp5bEgcku4fd84L5NAZzjXraHGy/boMFuxE0zmyDEnD9oGfGN0axgj
   ksY0MBt/K1S6LCk2q0LzCkmc320lFQpXwrYtfmpMAjFapVoswefVjP0S2
   Q==;
X-CSE-ConnectionGUID: Ilj8MEg/RiStJ8JbZIJmXw==
X-CSE-MsgGUID: QPNkH3suTFybO8BbzDINow==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109811318"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109811318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:58:12 -0700
X-CSE-ConnectionGUID: IQhwabR8RbypZEffuVo99Q==
X-CSE-MsgGUID: 4YB0d2keTKGeVLga0DSp+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278917593"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jul 2026 01:58:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whka7-00000000HTn-3nTy;
	Thu, 09 Jul 2026 08:58:07 +0000
Date: Thu, 09 Jul 2026 16:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [qcom:drivers-for-7.3 22/23]
 drivers/soc/qcom/ubwc_config.c:148:3: error: expected expression before '{'
 token
Message-ID: <202607091635.CzQ2eL1t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.3
head:   05b03f88af1fe82d23b5f88b286b1ac2987b3177
commit: a45af9d6e6175473c8744c0f1cf2348f641e3029 [22/23] soc: qcom: ubwc: Add Shikra UBWC config
config: arm64-randconfig-004-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091635.CzQ2eL1t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091635.CzQ2eL1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091635.CzQ2eL1t-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:148:3: error: expected expression before '{' token
    + { .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
      ^
>> drivers/soc/qcom/ubwc_config.c:75:40: warning: 'ubwc_5_0_hbb16' defined but not used [-Wunused-const-variable=]
    static const struct qcom_ubwc_cfg_data ubwc_5_0_hbb16 = {
                                           ^~~~~~~~~~~~~~


vim +148 drivers/soc/qcom/ubwc_config.c

    74	
  > 75	static const struct qcom_ubwc_cfg_data ubwc_5_0_hbb16 = {
    76		.ubwc_enc_version = UBWC_5_0,
    77		.highest_bank_bit = 16,
    78	};
    79	
    80	static const struct qcom_ubwc_cfg_data ubwc_6_0_hbb16 = {
    81		.ubwc_enc_version = UBWC_6_0,
    82		.highest_bank_bit = 16,
    83	};
    84	
    85	static const struct qcom_ubwc_cfg_data sa8775p_data = {
    86		.ubwc_enc_version = UBWC_4_0,
    87		.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
    88		.highest_bank_bit = 13,
    89	};
    90	
    91	static const struct qcom_ubwc_cfg_data glymur_data = {
    92		.ubwc_enc_version = UBWC_5_0,
    93		.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2 |
    94			 UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
    95		/* TODO: highest_bank_bit = 15 for LP_DDR4 */
    96		.highest_bank_bit = 16,
    97	};
    98	
    99	static const struct qcom_ubwc_cfg_data milos_data = {
   100		.ubwc_enc_version = UBWC_4_0,
   101		.flags = UBWC_SWIZZLE_ENABLE_LVL2 |
   102			 UBWC_SWIZZLE_ENABLE_LVL3,
   103		/* TODO: highest_bank_bit = 14 for LP_DDR4 */
   104		.highest_bank_bit = 15,
   105	};
   106	
   107	static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
   108		{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
   109		{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
   110		{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
   111		{ .compatible = "qcom,apq8096", .data = &ubwc_1_0_hbb15 },
   112		{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
   113		{ .compatible = "qcom,glymur", .data = &glymur_data},
   114		{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
   115		{ .compatible = "qcom,mahua", .data = &glymur_data },
   116		{ .compatible = "qcom,milos", .data = &milos_data },
   117		{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
   118		{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
   119		{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
   120		{ .compatible = "qcom,msm8937", .data = &ubwc_1_0_hbb14 },
   121		{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
   122		{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
   123		{ .compatible = "qcom,msm8953", .data = &ubwc_1_0_hbb14 },
   124		{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
   125		{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
   126		{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
   127		{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
   128		{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
   129		{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
   130		{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
   131		{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
   132		{ .compatible = "qcom,sa8155p", .data = &ubwc_3_0_hbb15, },
   133		{ .compatible = "qcom,sa8540p", .data = &ubwc_4_0_hbb16, },
   134		{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
   135		{ .compatible = "qcom,sar2130p", .data = &ubwc_3_1_hbb13 },
   136		{ .compatible = "qcom,sc7180", .data = &ubwc_2_0_hbb14, },
   137		{ .compatible = "qcom,sc7280", .data = &ubwc_3_1_hbb14, },
   138		{ .compatible = "qcom,sc8180x", .data = &ubwc_3_1_hbb16, },
   139		{ .compatible = "qcom,sc8280xp", .data = &ubwc_4_0_hbb16, },
   140		{ .compatible = "qcom,sda660", .data = &ubwc_1_0_hbb14 },
   141		{ .compatible = "qcom,sdm450", .data = &ubwc_1_0_hbb14 },
   142		{ .compatible = "qcom,sdm630", .data = &ubwc_1_0_hbb14 },
   143		{ .compatible = "qcom,sdm632", .data = &ubwc_1_0_hbb14 },
   144		{ .compatible = "qcom,sdm636", .data = &ubwc_1_0_hbb14 },
   145		{ .compatible = "qcom,sdm660", .data = &ubwc_1_0_hbb14 },
   146		{ .compatible = "qcom,sdm670", .data = &ubwc_2_0_hbb14, },
   147		{ .compatible = "qcom,sdm845", .data = &ubwc_2_0_hbb15, },
 > 148	+	{ .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
   149		{ .compatible = "qcom,sm4250", .data = &ubwc_1_0_hbb14, },
   150		{ .compatible = "qcom,sm6115", .data = &ubwc_1_0_hbb14, },
   151		{ .compatible = "qcom,sm6125", .data = &ubwc_1_0_hbb14, },
   152		{ .compatible = "qcom,sm6150", .data = &ubwc_2_0_hbb14, },
   153		{ .compatible = "qcom,sm6350", .data = &ubwc_2_0_hbb14, },
   154		{ .compatible = "qcom,sm6375", .data = &ubwc_2_0_hbb14, },
   155		{ .compatible = "qcom,sm7125", .data = &ubwc_2_0_hbb14, },
   156		{ .compatible = "qcom,sm7150", .data = &ubwc_2_0_hbb14, },
   157		{ .compatible = "qcom,sm7225", .data = &ubwc_2_0_hbb14, },
   158		{ .compatible = "qcom,sm7325", .data = &ubwc_3_1_hbb14, },
   159		{ .compatible = "qcom,sm8150", .data = &ubwc_3_0_hbb15, },
   160		{ .compatible = "qcom,sm8250", .data = &ubwc_4_0_hbb16, },
   161		{ .compatible = "qcom,sm8350", .data = &ubwc_4_0_hbb16, },
   162		{ .compatible = "qcom,sm8450", .data = &ubwc_4_0_hbb16, },
   163		{ .compatible = "qcom,sm8550", .data = &ubwc_4_0_hbb16, },
   164		{ .compatible = "qcom,sm8650", .data = &ubwc_4_0_hbb16, },
   165		{ .compatible = "qcom,sm8750", .data = &ubwc_5_0_hbb16, },
   166		{ .compatible = "qcom,x1e80100", .data = &ubwc_4_0_hbb16, },
   167		{ .compatible = "qcom,x1p42100", .data = &ubwc_4_0_hbb16, },
   168		{ }
   169	};
   170	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
