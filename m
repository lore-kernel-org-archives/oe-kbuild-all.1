Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A31A4E7F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 20:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725309444; cv=none; b=Dqgo+VtYjSs1yKqt9pmWIIv3D3/LEqjtrfkKeU/30rQAy/ba+sbUfmcom5Qy66bqZ5UjhQQs/H1JqINCOHCaMNnX96AgpRiz0vYcTKgvia8MijKd6GWZEYiJG9P2hTK+M18y7Ao1b1MziPCm89qI34uBEOl2XW89xopuhV8PMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725309444; c=relaxed/simple;
	bh=biCyIg0+nBZd+Oa1OMd1tAz/4XES0MpLAOJpAIlmN8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cd0jyWB+rqh1s7ToID6movbZu7W1dMwKUnVpoN0vQvCRhl0j9+cJcDD7QbBI43IkkejueW7QuZ6iriicrYF0qLY3fYPbuQsXAK6XNgpszwvpHn2kIdabvkEWppJjMRBtU6DabxK//eQ8vxzO8nT1EAFyfKgGem8cqAzwuZUBkKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuA7FRoe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuA7FRoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725309442; x=1756845442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=biCyIg0+nBZd+Oa1OMd1tAz/4XES0MpLAOJpAIlmN8g=;
  b=iuA7FRoeUOORv6PTFmE7zrTU2EBvZ6epJC1ZKafSqNzG5qA7MoSKsL6/
   9YdqQX2M55jqI1UpDFXgZ8PbNYr1kFZc67D4OyCUFHMjkujHwMUaXWjmh
   vFX+18J4owc21cNIiKGrWZ++me75fhwLWJjYvI72o/unK5kYYTh4zZOHm
   UY36Zny41J2r1sgEvwYsBEIOYjmcgr0sxIJvoOmifsICsAdWO8vMtVhwd
   QP0tsk9IcNSzUd21mFIy1Jl/wR8GJRVPwnoi7rmhAScruL6S+1Fk0mApw
   PpVWv1qozpnvYRzvhsj01CVGfI38WE5rfB7Ljssbh8TI4Oy8VPBUO0ZFY
   g==;
X-CSE-ConnectionGUID: IdeF9wgbSPSdCWo2M9WfgQ==
X-CSE-MsgGUID: p4A05wATSdmeGj29FCMezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41367786"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="41367786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 13:37:21 -0700
X-CSE-ConnectionGUID: ++DcaZvHTxeXNeaxMWfuJA==
X-CSE-MsgGUID: qdBaVbySRv2iAJ8M7YOUKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64375384"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2024 13:37:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slDnZ-0005ty-2x;
	Mon, 02 Sep 2024 20:37:17 +0000
Date: Tue, 3 Sep 2024 04:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <quic_kdybcio@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 5713/8400]
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb:
 domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of
 the regexes: 'pinctrl-[0-9]+'
Message-ID: <202409030423.blBGdn8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: 09d77be56093b9fc7daa14c9c745e77ae3a56492 [5713/8400] arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices
config: arm64-randconfig-053-20240902 (https://download.01.org/0day-ci/archive/20240903/202409030423.blBGdn8j-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030423.blBGdn8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030423.blBGdn8j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4134.11-4144.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: geniqup@bc0000: serial@b88000: Unevaluated properties are not allowed ('embedded-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: serial@b88000: Unevaluated properties are not allowed ('embedded-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/geniqup@bc0000/serial@b88000/embedded-controller: failed to match any schema with compatible: ['microsoft,surface-sam']
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@6b6c000: compatible:0: 'qcom,x1e80100-lpassaudiocc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/clock-controller@6b6c000: failed to match any schema with compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@6ea0000: compatible:0: 'qcom,x1e80100-lpasscc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/clock-controller@6ea0000: failed to match any schema with compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc']
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a4f8800: compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/usb@a4f8800: failed to match any schema with compatible: ['qcom,x1e80100-dwc3-mp', 'qcom,dwc3']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4134.11-4144.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: geniqup@bc0000: serial@b88000: Unevaluated properties are not allowed ('embedded-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: serial@b88000: Unevaluated properties are not allowed ('embedded-controller' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/geniqup@bc0000/serial@b88000/embedded-controller: failed to match any schema with compatible: ['microsoft,surface-sam']
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@6b6c000: compatible:0: 'qcom,x1e80100-lpassaudiocc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/clock-controller@6b6c000: failed to match any schema with compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@6ea0000: compatible:0: 'qcom,x1e80100-lpasscc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/clock-controller@6ea0000: failed to match any schema with compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc']
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a4f8800: compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/usb@a4f8800: failed to match any schema with compatible: ['qcom,x1e80100-dwc3-mp', 'qcom,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
