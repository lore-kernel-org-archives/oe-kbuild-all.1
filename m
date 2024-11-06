Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF93C39
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879480; cv=none; b=fagpoBbDxSh4kHQEGbey/ln2Mhtyr81P6c3j9f7ihXUn2NHym9lVCADpqrk2d31aHOreAKPOtvBOmYFdPlZ8throQctO4iQfYvGXQQWS2Z1WJuDKb++9Ki0ViGFgq0DROAISXdHClMpkFmOyv05n9J+bG7KrSWI3FvVkZYAH6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879480; c=relaxed/simple;
	bh=HbRiIhKTQArt6qccqBDRK1n5WMoklP6bAgI8d1g8YxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7lnOC2WRzBTjQep9WxTyed1gAEgEuLGy1iFPCOIY24a0uAE3YPC8S33c/7fN2m4hWHhSBBwJJAGLeMpzQROW+Zep9rY9P1lf+3bfnE4XAgX43/2BYIYF0IedjsifMOzumptioIQso3k0pMul/15pM7IGgHM2sbLnvKHCsdha6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xi4qc3+m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xi4qc3+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730879479; x=1762415479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HbRiIhKTQArt6qccqBDRK1n5WMoklP6bAgI8d1g8YxU=;
  b=Xi4qc3+mZyhGIwf04GILNqDqmTqX6LpF/WEFit01Q7Kza8rsS7IU7BdU
   ldqC9xH9M8MwIBULPGK5ipmKpnXqElHdDTVvYpop7Uef4dDZHRlRPgUMq
   zfN0T5dnSKo7n2s21ZXEjfYVmpudktYfEDntgYyei3mfFztLn7TclfNj5
   0fRKhu/VHcMVBX4iartk08XsK3fH8cfHHJV+esKj+iPECrsnmsu1dNmwt
   f0N2Vj2jKauNqOJfoA48rfNzDaSe5GgPtGNVO76Op71V8kUf8DtrU1mL+
   PaWSxaa+MyPEKXLHh5ZD2gwM1CPNoWYt/4GPrMu1Atj9hHjT9cLo/t9PY
   Q==;
X-CSE-ConnectionGUID: +gk40otVT7a84JS7DOnoaA==
X-CSE-MsgGUID: FAUn/aEyRduLZES3ZFO0kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34358025"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34358025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 23:51:19 -0800
X-CSE-ConnectionGUID: 8hfRn+kvTzetYyVBHfULSw==
X-CSE-MsgGUID: wwMUmx5uSjCsuaNpnogK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84512876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2024 23:51:17 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8aos-000n3q-1R;
	Wed, 06 Nov 2024 07:51:14 +0000
Date: Wed, 6 Nov 2024 15:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [qcom:clk-for-6.13 30/30] drivers/clk/qcom/gcc-ipq5424.c:1064:30:
 warning: 'ftbl_gcc_q6_axi_clk_src' defined but not used
Message-ID: <202411061537.anSkNwoR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.13
head:   21b5d5a4a3114607a27653371c0332f2080e3c05
commit: 21b5d5a4a3114607a27653371c0332f2080e3c05 [30/30] clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241106/202411061537.anSkNwoR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061537.anSkNwoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061537.anSkNwoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-ipq5424.c:1064:30: warning: 'ftbl_gcc_q6_axi_clk_src' defined but not used [-Wunused-const-variable=]
    1064 | static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-ipq5424.c:957:30: warning: 'ftbl_gcc_qpic_clk_src' defined but not used [-Wunused-const-variable=]
     957 | static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/qcom/gcc-ipq5424.c:497:30: warning: 'ftbl_gcc_qupv3_2x_core_clk_src' defined but not used [-Wunused-const-variable=]
     497 | static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/ftbl_gcc_q6_axi_clk_src +1064 drivers/clk/qcom/gcc-ipq5424.c

   956	
 > 957	static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
   958		F(24000000, P_XO, 1, 0, 0),
   959		F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
   960		F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
   961		{ }
   962	};
   963	
   964	static struct clk_rcg2 gcc_qpic_clk_src = {
   965		.cmd_rcgr = 0x32020,
   966		.mnd_width = 0,
   967		.hid_width = 5,
   968		.parent_map = gcc_parent_map_11,
   969		.freq_tbl = ftbl_gcc_qpic_io_macro_clk_src,
   970		.clkr.hw.init = &(const struct clk_init_data) {
   971			.name = "gcc_qpic_clk_src",
   972			.parent_data = gcc_parent_data_11,
   973			.num_parents = ARRAY_SIZE(gcc_parent_data_11),
   974			.ops = &clk_rcg2_ops,
   975		},
   976	};
   977	
   978	static struct clk_rcg2 gcc_pcie0_rchng_clk_src = {
   979		.cmd_rcgr = 0x28028,
   980		.mnd_width = 0,
   981		.hid_width = 5,
   982		.parent_map = gcc_parent_map_1,
   983		.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
   984		.clkr.hw.init = &(const struct clk_init_data) {
   985			.name = "gcc_pcie0_rchng_clk_src",
   986			.parent_data = gcc_parent_data_1,
   987			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
   988			.ops = &clk_rcg2_ops,
   989		},
   990	};
   991	
   992	static struct clk_rcg2 gcc_pcie1_rchng_clk_src = {
   993		.cmd_rcgr = 0x29028,
   994		.mnd_width = 0,
   995		.hid_width = 5,
   996		.parent_map = gcc_parent_map_1,
   997		.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
   998		.clkr.hw.init = &(const struct clk_init_data) {
   999			.name = "gcc_pcie1_rchng_clk_src",
  1000			.parent_data = gcc_parent_data_1,
  1001			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
  1002			.ops = &clk_rcg2_ops,
  1003		},
  1004	};
  1005	
  1006	static struct clk_rcg2 gcc_pcie2_rchng_clk_src = {
  1007		.cmd_rcgr = 0x2a028,
  1008		.mnd_width = 0,
  1009		.hid_width = 5,
  1010		.parent_map = gcc_parent_map_1,
  1011		.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
  1012		.clkr.hw.init = &(const struct clk_init_data) {
  1013			.name = "gcc_pcie2_rchng_clk_src",
  1014			.parent_data = gcc_parent_data_1,
  1015			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
  1016			.ops = &clk_rcg2_ops,
  1017		},
  1018	};
  1019	
  1020	static struct clk_rcg2 gcc_pcie3_rchng_clk_src = {
  1021		.cmd_rcgr = 0x2b028,
  1022		.mnd_width = 0,
  1023		.hid_width = 5,
  1024		.parent_map = gcc_parent_map_1,
  1025		.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
  1026		.clkr.hw.init = &(const struct clk_init_data) {
  1027			.name = "gcc_pcie3_rchng_clk_src",
  1028			.parent_data = gcc_parent_data_1,
  1029			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
  1030			.ops = &clk_rcg2_ops,
  1031		},
  1032	};
  1033	
  1034	static struct clk_regmap_div gcc_qupv3_i2c0_div_clk_src = {
  1035		.reg = 0x2020,
  1036		.shift = 0,
  1037		.width = 2,
  1038		.clkr.hw.init = &(const struct clk_init_data) {
  1039			.name = "gcc_qupv3_i2c0_div_clk_src",
  1040			.parent_hws = (const struct clk_hw*[]) {
  1041				&gcc_qupv3_i2c0_clk_src.clkr.hw,
  1042			},
  1043			.num_parents = 1,
  1044			.flags = CLK_SET_RATE_PARENT,
  1045			.ops = &clk_regmap_div_ro_ops,
  1046		},
  1047	};
  1048	
  1049	static struct clk_regmap_div gcc_qupv3_i2c1_div_clk_src = {
  1050		.reg = 0x3020,
  1051		.shift = 0,
  1052		.width = 2,
  1053		.clkr.hw.init = &(const struct clk_init_data) {
  1054			.name = "gcc_qupv3_i2c1_div_clk_src",
  1055			.parent_hws = (const struct clk_hw*[]) {
  1056				&gcc_qupv3_i2c1_clk_src.clkr.hw,
  1057			},
  1058			.num_parents = 1,
  1059			.flags = CLK_SET_RATE_PARENT,
  1060			.ops = &clk_regmap_div_ro_ops,
  1061		},
  1062	};
  1063	
> 1064	static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
  1065		F(480000000, P_GPLL4_OUT_AUX, 2.5, 0, 0),
  1066		F(533333333, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
  1067		{ }
  1068	};
  1069	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
