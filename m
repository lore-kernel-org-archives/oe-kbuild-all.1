Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAA01799F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 02:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586905; cv=none; b=mbBlXFTBW3IwmgaLubBCmrtff1d6jpfpDuJPG0gEHotAue/b5htsu3lVTyyIi1iYWW0btl6ZD7EH95b8JkMjMQOFeli71+iWap0lPw2v1beAgZ0Lu29Z8iWekBetBkDWlnij5bgtZTxDpKymD3jBKI2QNJngADqyLKZ9Gnhmhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586905; c=relaxed/simple;
	bh=03zV1c9uV2tS4xMfvnODm0duh3R3U+hVnc205EoXEvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCbw1R0X1Dbp+F3VPnqJ+KZP6TZb74wnB1vnAHDfT25+PA94kDVYqaI2bcUuk39pHNMRs08amzbxKgUnzdjKKJD30VALSYm35NHYcRazteq5SGFNu0MCjo0CrLa5wx0tXH0UpLCT/nK/WbhhYblZUasVJHozGjkSuYPS7iu31a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf8dhsS9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf8dhsS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732586903; x=1764122903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03zV1c9uV2tS4xMfvnODm0duh3R3U+hVnc205EoXEvk=;
  b=cf8dhsS9eO2VQ8vNhN9kTwN22NA4Y5xS/CWHzp6b/7ISsjNb00oh3EsA
   NYebAwiTHlLQAY2TPdLXdSuZJ8hWVRdxs4hgd9sGKvzr4i2OnAZy/j2z7
   x1PnBpQgyjbbYc2vV2w9SUYnMuDIiPyNgf0zJkoxmAvhwqfooF3viknDG
   S0XYfzUBJpXM4drP+qkvCFE1cGqEx2eBupNP3IM/w0a2U+8Q59+oflqRo
   xJbjV5hv8ppvmCwI3V9fHBoSMadJ/W4EQZ19/r9Gwfd2IP4qTz+FQ0cxD
   0qCwm1fsVW9RfYljzEDmUeTGL/SnhXGeOeJ6jvjWOpjjh10akPrlPVlem
   A==;
X-CSE-ConnectionGUID: W+ZKGwHpQjGkc+HM2MHBUQ==
X-CSE-MsgGUID: Sgc2vfIIT0qurvW+Fc+g8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36507341"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="36507341"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 18:08:22 -0800
X-CSE-ConnectionGUID: QlAixt0hTvaaNjeCcRRF7w==
X-CSE-MsgGUID: 2cnBBwqhRfG4FNEz6Y92Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91354218"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Nov 2024 18:08:21 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFkzz-0006yD-0B;
	Tue, 26 Nov 2024 02:08:19 +0000
Date: Tue, 26 Nov 2024 10:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Edwards <cfsworks@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 12520/12684]
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb:
 nand-controller@1800: nand@0:partitions: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202411261015.fLX4mOUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
commit: 7f2f7b2248110a77a330a6ac9cbc527794b45f30 [12520/12684] arm64: dts: broadcom: bcmbca: bcm4908: Add DT for Zyxel EX3510-B
config: arm64-randconfig-051-20241125 (https://download.01.org/0day-ci/archive/20241126/202411261015.fLX4mOUs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261015.fLX4mOUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261015.fLX4mOUs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi:129.6-324.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi:610.19-613.6: Warning (avoid_unnecessary_addr_size): /bus@ff800000/nand-controller@1800/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0:partitions: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-[0-9a-z]+$', 'pinctrl-[0-9]+'
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-.*$', 'pinctrl-[0-9]+'
   	False schema does not allow 1
>> 	arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0:partitions:compatible: 'oneOf' conditional failed, one must be fixed:
   		['brcm,bcm4908-partitions'] is too short
   		'fixed-partitions' was expected
   		'sercomm,sc-partitions' was expected
   	'arm,arm-firmware-suite' was expected
   	'brcm,bcm947xx-cfe-partitions' was expected
   	'linksys,ns-partitions' was expected
   	'qcom,smem-part' was expected
   	'redboot-fis' was expected
   	'tplink,safeloader-partitions' was expected
   	Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mac@106a0' were unexpected)
   	['nvmem-cells'] is too short
   	'brcm,bcm4908-firmware' was expected
   	'linksys,ns-firmware' was expected
   	Unevaluated properties are not allowed ('compatible' was unexpected)
   	['brcm,bcm4908-firmware'] is too short
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-ecc-strength', 'partitions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0:partitions: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-[0-9a-z]+$', 'pinctrl-[0-9]+'
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-.*$', 'pinctrl-[0-9]+'
   	False schema does not allow 1
>> 	arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0:partitions:compatible: 'oneOf' conditional failed, one must be fixed:
   		['brcm,bcm4908-partitions'] is too short
   		'fixed-partitions' was expected
   		'sercomm,sc-partitions' was expected
   	'arm,arm-firmware-suite' was expected
   	'brcm,bcm947xx-cfe-partitions' was expected
   	'linksys,ns-partitions' was expected
   	'qcom,smem-part' was expected
   	'redboot-fis' was expected
   	'tplink,safeloader-partitions' was expected
   	Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mac@106a0' were unexpected)
   	['nvmem-cells'] is too short
   	'brcm,bcm4908-firmware' was expected
   	'linksys,ns-firmware' was expected
   	Unevaluated properties are not allowed ('compatible' was unexpected)
   	['brcm,bcm4908-firmware'] is too short
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0:partitions: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-[0-9a-z]+$', 'pinctrl-[0-9]+'
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-.*$', 'pinctrl-[0-9]+'
   	False schema does not allow 1
>> 	arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand-controller@1800: nand@0:partitions:compatible: 'oneOf' conditional failed, one must be fixed:
   		['brcm,bcm4908-partitions'] is too short
   		'fixed-partitions' was expected
   		'sercomm,sc-partitions' was expected
   	'arm,arm-firmware-suite' was expected
   	'brcm,bcm947xx-cfe-partitions' was expected
   	'linksys,ns-partitions' was expected
   	'qcom,smem-part' was expected
   	'redboot-fis' was expected
   	'tplink,safeloader-partitions' was expected
   	Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mac@106a0' were unexpected)
   	['nvmem-cells'] is too short
   	'brcm,bcm4908-firmware' was expected
   	'linksys,ns-firmware' was expected
   	Unevaluated properties are not allowed ('compatible' was unexpected)
   	['brcm,bcm4908-firmware'] is too short
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand@0: partitions: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-[0-9a-z]+$', 'pinctrl-[0-9]+'
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
   	'#address-cells', '#size-cells', 'partition@0', 'partition@100000', 'partition@6080000' do not match any of the regexes: '^partition-.*$', 'pinctrl-[0-9]+'
   	False schema does not allow 1
>> 	arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-zyxel-ex3510b.dtb: nand@0: partitions:compatible: 'oneOf' conditional failed, one must be fixed:
   		['brcm,bcm4908-partitions'] is too short
   		'fixed-partitions' was expected
   		'sercomm,sc-partitions' was expected
   	'arm,arm-firmware-suite' was expected
   	'brcm,bcm947xx-cfe-partitions' was expected
   	'linksys,ns-partitions' was expected
   	'qcom,smem-part' was expected
   	'redboot-fis' was expected
   	'tplink,safeloader-partitions' was expected
   	Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mac@106a0' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
