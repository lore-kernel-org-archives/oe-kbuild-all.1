Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069252A1C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 01:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752197163; cv=none; b=eO6nibZGLOHSHV+QRCDfU3twZcACq2Iu9uLTaS2OuT8qNrJZlSpg5H4eIFp9JKFtPKyJcTh5TqKnerNmKJZd+UVuT2FmX/1pAdpO9DvilB7Gpwtl0QYebCL+zGJDsIB2reVopZ/DhQc/CEX+WKHUwiHbqmVAIzGK9TK5+/f9AwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752197163; c=relaxed/simple;
	bh=DyZKLvtXwZT7ZnODnLgNWRV7NvU+i2EWdgYXaKt/yxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnS4p9+Poe0j9EBDHNFtTgY8itaZ+QfUbXnPNWFQh6Tn+P99rlFTGF9MoFdbm9oyY1Gm0rZlGVa5LZiJxBOd1lqk0G67MGAlcVn+MWbhfSTE1inrEbARDRIWhbmL9sED9Iv1so+HVV9J+iJ5mw91jlgu8WqnkAmJvb/fDSa9xi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpO9bglv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpO9bglv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752197161; x=1783733161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DyZKLvtXwZT7ZnODnLgNWRV7NvU+i2EWdgYXaKt/yxY=;
  b=MpO9bglvvNOwU7ketXG69g+FWdfJBAyxsypfBgDWvLFfPDvcDITFWBgN
   ZNu39I8q7jrOPKaO1r5AlkUcK5VafDWgcfzjTsJlneVJC7Cq6yT346VLa
   WGdVYzRRyd1GaT20fRP2HE5DKiMAZWE987yZNVstgtjuIR5mRmQ0T3v9Z
   jAstmlB9VIGHDX1s04Rqs6GoilEm4yGe3sTFnqggzaQfmg0BgXc/BQJ3J
   f6f5qVtcWmwakJDRLHWza1RBRM6yNlJQcHUOzQj+0ExVlr1EQnNnGHggi
   POvI0FpZS6+MgAQudKq4ShU0oMqOUsb1Cv/cSrk+ltl1Xj1rOdXw9UkwT
   Q==;
X-CSE-ConnectionGUID: CEZXWAbJSgGZk+Jgp87Wyw==
X-CSE-MsgGUID: Co3Y8FW7SG27T9qUkBk3Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65075583"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="65075583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 18:25:23 -0700
X-CSE-ConnectionGUID: wGutbxOoRB+/Ln0qBL2Yyw==
X-CSE-MsgGUID: u0vuOaDjRja+SRLn8lTeQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="155660553"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2025 18:25:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua2Vr-0005iV-2N;
	Fri, 11 Jul 2025 01:25:19 +0000
Date: Fri, 11 Jul 2025 09:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb:
 system-cache-controller@9200000 (qcom,sc8180x-llcc): reg-names:4:
 'llcc4_base' was expected
Message-ID: <202507110943.PNblKkSw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   b64c8a8cf865a837d7b16f8d32f56de627f77976
commit: 74cf6675c35ec3034053a69926f4d98e52852eb0 [36/36] arm64: dts: qcom: sc8180x: Fix LLCC reg property
config: arm64-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250711/202507110943.PNblKkSw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 3deed4211a46632a25b1b558b357273a5ce4ee96)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110943.PNblKkSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110943.PNblKkSw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000 (qcom,sc8180x-qmp-usb3-dp-phy): usb3-phy@88e9200: '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000 (qcom,sc8180x-qmp-usb3-dp-phy): reg-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000 (qcom,sc8180x-qmp-usb3-dp-phy): reg-names: ['reg-base', 'dp_com'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000 (qcom,sc8180x-llcc): reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000 (qcom,sc8180x-llcc): reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000 (qcom,sc8180x-llcc): reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800 (qcom,sc8180x-dwc3): compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800 (qcom,sc8180x-dwc3): compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: dsi@ae94000 (qcom,mdss-dsi-ctrl): interrupts: [[4], [4]] is too long
--
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000 (qcom,sc8180x-qmp-usb3-dp-phy): usb3-phy@88e9200: '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000 (qcom,sc8180x-qmp-usb3-dp-phy): reg-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000 (qcom,sc8180x-qmp-usb3-dp-phy): reg-names: ['reg-base', 'dp_com'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000 (qcom,sc8180x-llcc): reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000 (qcom,sc8180x-llcc): reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000 (qcom,sc8180x-llcc): reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800 (qcom,sc8180x-dwc3): compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800 (qcom,sc8180x-dwc3): compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: dsi@ae94000 (qcom,mdss-dsi-ctrl): interrupts: [[4], [4]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
