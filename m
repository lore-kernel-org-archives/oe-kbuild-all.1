Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41B4962F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718562936; cv=none; b=f0m0/rZwiGiatZRQDVoxDuuaBA/YVmJs28BMPqBiedwG3Hu4zMrgG+pArRmrkpwaKHSu2L41+5Iui/qc4z0ejvGG3b/eK6IihTS7rFMridfzTZHfao+UOV3D5ptz94ckNTIM+ldUFWjRL3d1rlFaZdXTnxzlXtU/lt5L8COIfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718562936; c=relaxed/simple;
	bh=OcS4rBjpcPooYmXOji57xF0yABlESbYpmawAIds8UMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpLyuPV3LyqMY7gSgkOD0cc7uQugarVtsrvayKacF9NTwCKozhHNKiuAUOBDdQYejWEJbA3DEt09SFdSi/MSdTUCWQh0wNfWKvWlzJkjKcaoIId3mrNbBiWISDPztxfTlPtta11mjW49jezZk/7vxEidiykT9Iu6htSGI+I/W2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHFDEWOG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHFDEWOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718562934; x=1750098934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcS4rBjpcPooYmXOji57xF0yABlESbYpmawAIds8UMc=;
  b=MHFDEWOGtz7B5gRPC+HcKYTuz2esEcD6Q8YovtvM/iSJZhBQOz4LazVK
   6ri73gv207FKwkBCYUs+DmFwtrCioyv22iIRHwLAVH54FUt6XCmi6GVOY
   7PNCjITUZe9teiy3kcOjn5ifn3W6ZFB7+XezGhtUve2RRqSsHzwkC2HON
   WTlnl1FbBI5SxsY9DmV/jgtg6v/4XRUuCbtRfGmtvghK4h0F82LW1yUCE
   1j3RQPL5hufv8CLHO3MByuo2Nv+3geBVIFHT7QONn1uimPAyAiDhKPRX2
   Bn7kZToEIXFFzB6Fy3pDcpLzIIgsvh2sRZxRDC8Nt95RkfACjFgaQXSSX
   w==;
X-CSE-ConnectionGUID: xmqgMGHLTdul5nmiW+muvA==
X-CSE-MsgGUID: DTs/tbw+QdqlVHyh+rShcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26509088"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26509088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 11:35:34 -0700
X-CSE-ConnectionGUID: 6yX5OwhTTsm6oXz3uhxy9Q==
X-CSE-MsgGUID: JWMSn53yRpyWdue+MA6IHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="45439130"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jun 2024 11:35:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIuiw-0003A4-0I;
	Sun, 16 Jun 2024 18:35:30 +0000
Date: Mon, 17 Jun 2024 02:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [qcom:arm64-for-6.11 3/211]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb:
 power-controller@c300000: '#power-domain-cells' is a required property
Message-ID: <202406170254.wAKAHiHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   f55a758fd355c1b5ed7c73434a99ae07d5741226
commit: 8ed45f79142caeefa42e98eb243df35746123c09 [3/211] arm64: dts: qcom: sc8180x: Fix aoss_qmp node
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240617/202406170254.wAKAHiHX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170254.wAKAHiHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170254.wAKAHiHX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names:4: 'dsi1_phy_pll_out_dsiclk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names:5: 'dp_phy_pll_link_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names:6: 'dp_phy_pll_vco_div_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names: ['bi_tcxo', 'sleep_clk', 'dp_phy_pll_link_clk', 'dp_phy_pll_vco_div_clk', 'dptx1_phy_pll_link_clk', 'dptx1_phy_pll_vco_div_clk', 'edp_phy_pll_link_clk', 'edp_phy_pll_vco_div_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sc8180x-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domain-names:0: 'lcx' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domain-names: ['cx'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: cpufreq@18323000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,cpufreq-hw'] is too short
   	'qcom,cpufreq-hw' is not one of ['qcom,qcm2290-cpufreq-hw', 'qcom,sc7180-cpufreq-hw', 'qcom,sdm670-cpufreq-hw', 'qcom,sdm845-cpufreq-hw', 'qcom,sm6115-cpufreq-hw', 'qcom,sm6350-cpufreq-hw', 'qcom,sm8150-cpufreq-hw']
--
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names:4: 'dsi1_phy_pll_out_dsiclk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names:5: 'dp_phy_pll_link_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names:6: 'dp_phy_pll_vco_div_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names: ['bi_tcxo', 'sleep_clk', 'dp_phy_pll_link_clk', 'dp_phy_pll_vco_div_clk', 'dptx1_phy_pll_link_clk', 'dptx1_phy_pll_vco_div_clk', 'edp_phy_pll_link_clk', 'edp_phy_pll_vco_div_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sc8180x-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domain-names:0: 'lcx' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domain-names: ['cx'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: cpufreq@18323000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,cpufreq-hw'] is too short
   	'qcom,cpufreq-hw' is not one of ['qcom,qcm2290-cpufreq-hw', 'qcom,sc7180-cpufreq-hw', 'qcom,sdm670-cpufreq-hw', 'qcom,sdm845-cpufreq-hw', 'qcom,sm6115-cpufreq-hw', 'qcom,sm6350-cpufreq-hw', 'qcom,sm8150-cpufreq-hw']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
