Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABF1586C1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577453; cv=none; b=He3FCcPBzcsk9pMOCesDXOw0hr3nOXllK9gDWt6B/bUy4wu0zrIGHiGPq7VjCjQ2y8p1y2gPQDUCEFTNWOJ10IMqbZKFC+Mv+ky1XYIghqTUqE60M2RyKd8EYJsm0dkWl//FR0tBj6PUZzMoclleKS6cG+/Q91VMzdleaCMAJ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577453; c=relaxed/simple;
	bh=AYYLqBEajnQutvBOeS53K7hNaskBjzkLzVfnl4Vfv8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbsMJtNeFHi1iwCC+rz0NSDchGpI79/XQaC0tclZvkhsvPsNa5fsCxARtTIGczWpeforxeA1uMOlwMa3yt+oOkBFhzI5EHI3xdF/LxhIokd36a5UgBFacFybSsPVkjKhMnBM/YXg0sKqxxiVHbaufUHQEm4Cvz+Jt8BfPibxxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDs4yNFR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDs4yNFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719577452; x=1751113452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYYLqBEajnQutvBOeS53K7hNaskBjzkLzVfnl4Vfv8M=;
  b=cDs4yNFRlDZCTWRKCj9iKLTVRI+WLfpOCVXUrCDS/Kkmg0MmdhnmrycX
   WqU1I5ppfOAzO83rjLadB/jArqvILzvqLN2igZR/o6QJnzB3aK3m/lREW
   cCDABVNIg90Dm5fmAfXrWWogDkA30eJRngawP7cya575eczXME7QF6TEM
   cKAUjwXiUCGxwXIQhuWfz9VrXNUFzRFEyAKAzRJZ/Tq6zs1yBATz6m50i
   u8GAzMn8ZZ3SjE2Ld2SGMvEtkDQ/8yl9nFIPc4iqFQXWCMIl+g1QZ9z08
   LgGB4o2E6tS92C2vrK6u4Qe8vhNm7ZXpYLhz6UKDSjBMf49/+2LbiS4v3
   A==;
X-CSE-ConnectionGUID: AgVrAmzjTl+MiyhcSLVtnQ==
X-CSE-MsgGUID: vwOcWlyDSxi2anKgYViJ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42178332"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="42178332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 05:24:11 -0700
X-CSE-ConnectionGUID: 7gBQa9JBQ225u/eALTl2yw==
X-CSE-MsgGUID: 8kNpOw+hR9mIsvw9Uchu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44806826"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2024 05:24:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNAe8-000H4k-0d;
	Fri, 28 Jun 2024 12:24:08 +0000
Date: Fri, 28 Jun 2024 20:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 60/251]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb:
 clock-controller@af00000: clock-names: ['bi_tcxo',
 'dsi0_phy_pll_out_byteclk', 'dsi0_phy_pll_out_dsiclk',
 'dsi1_phy_pll_out_byteclk', 'dsi1_phy_pll_out_dsiclk',
 'dp_phy_pll_link_clk', 'dp_phy_pll_vco_di...
Message-ID: <202406282047.LcsBKbzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: 17944fd55b8d03457ffaf4fd37ed7bef679bc4a4 [60/251] arm64: dts: qcom: sc8180x: correct dispcc clocks
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406282047.LcsBKbzE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282047.LcsBKbzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282047.LcsBKbzE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clocks: [[41, 0], [112, 0], [112, 1], [114, 0], [114, 1], [116, 0], [116, 1], [123, 0], [123, 1], [120, 0], [120, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clock-names: ['bi_tcxo', 'dsi0_phy_pll_out_byteclk', 'dsi0_phy_pll_out_dsiclk', 'dsi1_phy_pll_out_byteclk', 'dsi1_phy_pll_out_dsiclk', 'dp_phy_pll_link_clk', 'dp_phy_pll_vco_div_clk', 'edp_phy_pll_link_clk', 'edp_phy_pll_vco_div_clk', 'dptx1_phy_pll_link_clk', 'dptx1_phy_pll_vco_div_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sc8180x-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8775p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sc8180x-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: remoteproc@17300000: power-domain-names:0: 'lcx' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clocks: [[41, 0], [114, 0], [114, 1], [116, 0], [116, 1], [118, 0], [118, 1], [125, 0], [125, 1], [122, 0], [122, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clock-names: ['bi_tcxo', 'dsi0_phy_pll_out_byteclk', 'dsi0_phy_pll_out_dsiclk', 'dsi1_phy_pll_out_byteclk', 'dsi1_phy_pll_out_dsiclk', 'dp_phy_pll_link_clk', 'dp_phy_pll_vco_div_clk', 'edp_phy_pll_link_clk', 'edp_phy_pll_vco_div_clk', 'dptx1_phy_pll_link_clk', 'dptx1_phy_pll_vco_div_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: interrupt-controller@b220000: compatible:0: 'qcom,sc8180x-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8775p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,sc8180x-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domains: [[43, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: remoteproc@17300000: power-domain-names:0: 'lcx' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8180x-pas.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
