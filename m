Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813781CE71D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724352237; cv=none; b=HrsjAlBLenNDI5KDhPDJoaipnNy+9vvGYJ6joS/MgkWN1Tz16uRjGmFflEx7ptgy3lfCCKkbG0MMXZzIj1AhYeWWCn2s5DbPQm+qxXO9C5Oimvjwp7hjfPV3onBwqhzM/ugA7FlpaAVsnYHa+gimWplr7hm5L2gCzPhpdbW75qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724352237; c=relaxed/simple;
	bh=13rVLlXoNVk+MVNnM/lKWRuAOyxefISH4xe5KrLxQ/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZV7hGEI75IwTXlVvIUOtVjj+yS0cuzYe6mjxSSBtHBWWjt9MPOfKozzgxsq7wEi4vd+BOAMvIsNLOwuHSQlLPFP294Ywur4jUom6iC6CadbOo7tXbSlV+Hh25Xc++KOEnBmPYlFzg4jKgcWm2vPEZrjERqsdZGVx8y+paPen+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yg/iXwnO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yg/iXwnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724352236; x=1755888236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13rVLlXoNVk+MVNnM/lKWRuAOyxefISH4xe5KrLxQ/o=;
  b=Yg/iXwnOxWzSdOa1YJc3AoGDEvgdlaK1jU0RPfyjWhdKbmu8D/do9vCk
   5SPwXs3Ex1V/0WZUHxXxO9dV0yqrBDTp//yQcDHpm3fbQaN3iKIQJL1IP
   p2w4ERoFiZeQinzGNmhf16fcs3goWDX6OHi8vl9gTXBNtA12DYmYDz9U3
   y/3/TZovtSNaIy1p5wjrzlhfSAboQA8sylqBWhHG8epG8ogKs502UMbVb
   sRKIDKAn8SI/noQVM04eDkpgaoYSKNYYpVTDPcj+PcRwI01wN6uEzA1L5
   rIIWhp+kxPKvZ658l2omI4lMeb0JImvbFfL1ti/mko/+RMD7hA8zkPfVj
   A==;
X-CSE-ConnectionGUID: sYkUfKk2StOUXTAHWC6sJA==
X-CSE-MsgGUID: DcF2NJHUQOGGkg90BATGQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22973346"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22973346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:43:55 -0700
X-CSE-ConnectionGUID: aUmiJF/ZTGqT8qo4beU87g==
X-CSE-MsgGUID: c8UmCIHFSUyJrMnXtrenBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66375513"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2024 11:43:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shCml-000D5g-06;
	Thu, 22 Aug 2024 18:43:51 +0000
Date: Fri, 23 Aug 2024 02:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 5115/6069]
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a4f8800:
 compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3',
 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3',
 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,...
Message-ID: <202408230211.32V7Gi33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a7917c89f219f09b1d88d09f376000914a52763
commit: 5c5edbf46177e6335f2faaa3b68456755bcb9006 [5115/6069] arm64: dts: qcom: x1e80100: Add USB Multiport controller
config: arm64-randconfig-052-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230211.32V7Gi33-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230211.32V7Gi33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230211.32V7Gi33-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/clock-controller@6b6c000: failed to match any schema with compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: clock-controller@6ea0000: compatible:0: 'qcom,x1e80100-lpasscc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/clock-controller@6ea0000: failed to match any schema with compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a4f8800: compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/usb@a4f8800: failed to match any schema with compatible: ['qcom,x1e80100-dwc3-mp', 'qcom,dwc3']
--
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/clock-controller@6b6c000: failed to match any schema with compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@6ea0000: compatible:0: 'qcom,x1e80100-lpasscc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/clock-controller@6ea0000: failed to match any schema with compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a4f8800: compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/usb@a4f8800: failed to match any schema with compatible: ['qcom,x1e80100-dwc3-mp', 'qcom,dwc3']
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/clock-controller@6b6c000: failed to match any schema with compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: clock-controller@6ea0000: compatible:0: 'qcom,x1e80100-lpasscc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/clock-controller@6ea0000: failed to match any schema with compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a4f8800: compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/usb@a4f8800: failed to match any schema with compatible: ['qcom,x1e80100-dwc3-mp', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: panel: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,atna45dc02', 'samsung,atna33xc20'] is too long
   	'samsung,atna33xc20' was expected
   	'samsung,atna45af01' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: failed to match any schema with compatible: ['samsung,atna45dc02', 'samsung,atna33xc20']
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@6b6c000: compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/clock-controller@6b6c000: failed to match any schema with compatible: ['qcom,x1e80100-lpassaudiocc', 'qcom,sc8280xp-lpassaudiocc']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@6ea0000: compatible:0: 'qcom,x1e80100-lpasscc' is not one of ['qcom,sc8280xp-lpassaudiocc', 'qcom,sc8280xp-lpasscc']
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@6ea0000: compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/clock-controller@6ea0000: failed to match any schema with compatible: ['qcom,x1e80100-lpasscc', 'qcom,sc8280xp-lpasscc']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a4f8800: compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/usb@a4f8800: failed to match any schema with compatible: ['qcom,x1e80100-dwc3-mp', 'qcom,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
