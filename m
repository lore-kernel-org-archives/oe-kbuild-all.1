Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9B17A58C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963439; cv=none; b=gfPUc3jzP00zgF6E3+sscJD9FRGgkoP2cvg4EGDvXoacrIA9/pULB8uoXPVniEHseHW3Hbez/zaEed8J873wjQTfFDTSD7+EmidJORP2y+thtE8ewBv8HxYjsubTUzbL1Bv5vaqfQnAW14ul2aFZVwwyI/HgyDhSpnAeizf1zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963439; c=relaxed/simple;
	bh=I2IsDJKQ7DKMG3G2VRz8hbGfiOjhFYDas9yHTQ01vO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pU+ACYkufPGtMcsnGu1lWfoztya7Q+LkoMExzAz3nC6mq1TLU009u9H/0w27KdQBsu6hi44/ftn1sPjH2BVsx2JDdRiFu557grlZoeq7kPpz5vDo8+eioXqxEU85Zn1aspYC5T572wv3dFmXXuZiYSvy0bL4zFvE+comPu2mvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/fQr9SE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/fQr9SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719963438; x=1751499438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2IsDJKQ7DKMG3G2VRz8hbGfiOjhFYDas9yHTQ01vO8=;
  b=T/fQr9SE3TZP212n1kuTghm7sjhbDj2Cage4/7Es/ajjNSJrh544rKTP
   DuhiNowQK83cUHmRksopsIdFRrDiFgTchMGweJCklkyIzKtj04hyZEFIW
   NDu0+ktFpvX8ykV/gIAYTqV2V+epn9bVHYdShIePDihPY5ReteeQt++aP
   cI85BOy37teY1c8BafEn5IaPIGufLmJphidpM2dYyID6I9rBY8OE0ZSSf
   86pzdN9S0I5EUG9FyomU1DNkCKGZbcgJ5EtL/l3T9M+9v52ouPllR+U7L
   eqPE7p89okLmLaw6iFPk9fnx77Ht1w+B3pdfv6FCKvFhpDaZ51f33rUtB
   A==;
X-CSE-ConnectionGUID: n6dv/yytTwWW9RDz7fTy1w==
X-CSE-MsgGUID: jxQgRb/NR8ekFDY1N5FVEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20932553"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="20932553"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 16:37:09 -0700
X-CSE-ConnectionGUID: QpFKcdeLQBqjF59/weMf+Q==
X-CSE-MsgGUID: nGvlzqYOQ9ipA68cvgoBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46798704"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2024 16:37:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOn3U-000Ow4-1c;
	Tue, 02 Jul 2024 23:37:00 +0000
Date: Wed, 3 Jul 2024 07:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 131/264]
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: clock-controller@1800000:
 '#power-domain-cells' is a required property
Message-ID: <202407030730.IKw86DkK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   818c2676e5816dad5a77df5a1c0d99d0e160d0b1
commit: ef3308cf52553522d619a858a72a68f82432865b [131/264] arm64: dts: qcom: ipq9574: drop #power-domain-cells property of GCC
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240703/202407030730.IKw86DkK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030730.IKw86DkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030730.IKw86DkK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
