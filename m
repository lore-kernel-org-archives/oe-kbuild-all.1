Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D446521
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719606548; cv=none; b=UnhME5UzA3ivqyr5v0eJa3S9pq/ctAX0fjSrx6s2UKOewF37IdnqYfgTkDlvt+d1jP/0eZh8GO8YH/Hw4AbkI7LngY9ZLMxy3034Co5B/XIOtGZCR7duMC2nQaoFAUTmcMD/k27S7AdcBkAQvoBPVG5rrf2IalMDzqg7FVRIRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719606548; c=relaxed/simple;
	bh=VsVcoL1snDQLIEHicDB0BVd0qVds/Wx+B6JWy45tfzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9Cra4D+PPCSD3rmmKDJmD9GY4ffFTubS03Gpju76PsBf4Z4gIEt0rvv4MMWlDG5XixN/NCVyUK8LhOsc08zA8oVJVsFFA6jgvQvG9cegaNGAO6NhA/4LS2h+5MFamMHxG7wCt4SF1k8LuA0BuuhaFf1sLvzvq5RkEpx35H1eGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw3vWN5Q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw3vWN5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719606546; x=1751142546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VsVcoL1snDQLIEHicDB0BVd0qVds/Wx+B6JWy45tfzM=;
  b=Xw3vWN5QXMEEBHlfhnfMecTiZtc/hWDfz2P6kPHrjwt98I3NKlrTEV2f
   eHvPVICpX2cjwOERK7QkCG9/Yxd1YO0Su8vHyIwD6kgbGWh/LsIfaEMXZ
   pCSlkaDWmIvn26upnUYW1ZC8fUMhe/1VF9VMW++qR3TDpGisZbJgjWMbo
   GCCY6Kg8li+Txar9XVh91kiWYToJyTMgWdy4asNEbR7xA2qDzIkysmoAD
   PGlr+QN8N9Pg4yJgYGyXPpyKRKp1lro2NyaKREqSdn9GTIXJmWusvecM0
   z0HVs5qdw3Z2MR2akClwCFWK87EPNrXWWxLknrzK/CilIAZ9EW5URVelU
   w==;
X-CSE-ConnectionGUID: goD9IMFhSYq/o84v8TbNug==
X-CSE-MsgGUID: i0errF4dT5+eKkaYJt0qPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28202885"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="28202885"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 13:29:05 -0700
X-CSE-ConnectionGUID: 2jQuBxIkQ8uq+oU+rBk6kQ==
X-CSE-MsgGUID: 1Aj8wq6xSIytrv1vYj7/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="45593263"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jun 2024 13:29:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNIDN-000IPV-0T;
	Fri, 28 Jun 2024 20:29:01 +0000
Date: Sat, 29 Jun 2024 04:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [qcom:arm64-for-6.11 236/251]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c271000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406290407.ppYBkO2R-lkp@intel.com>
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
commit: 4e915987ff5b91ea531e716367373ff4442d9614 [236/251] arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290407.ppYBkO2R-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290407.ppYBkO2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290407.ppYBkO2R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3678.11-3688.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c271000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c272000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c273000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c274000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3678.11-3688.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c271000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c272000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c273000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c274000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
