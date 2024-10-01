Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58F33D5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796867; cv=none; b=XsvZOI35pEs4Y4P1LRBvpw9A22IXKz2lChbYduC8ZK/+gwlFTLHo2vN0lCRpd8QD/1VBy+2iIQNqVo3+ukN15RSXGo6/eEQFHLW6ELd+22tCHrR8DnoafzSLQDbf8M+1hhZcptew1IvFyBCNQO66NlRDC8uACP+HdDw7A+4B2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796867; c=relaxed/simple;
	bh=VS1QdY+g5Mo/CZBki5ZXMlF9RrwO6873tF5mqtOavtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aESvkFb1mOPB443AM1UKWqsUPWNiC/aKAznSGYVtJZZPfrHfiMs4C6KZ9w9EZf93vVAltqUglg7uYm9Ky4AOLn5fgMw8KbgbNq/K7hy8I06qF0RfesZ32SdSqX1pVPxLc+35/FijdY79NQcOsE06e+a/RwmVYuMeEMt+T5Degj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGNk+B6w; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGNk+B6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727796866; x=1759332866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VS1QdY+g5Mo/CZBki5ZXMlF9RrwO6873tF5mqtOavtY=;
  b=TGNk+B6wJgB6DQQgA/NDxraJ7BWdqrBLscfuAMYHX+64osgRh1+5GPFo
   oWDleTMQ6re1w7QDW4aubiJE+AnYRPEjDq9tZXa141vNuNHHLmODamSrJ
   GWKwtkxabWEbob9sNWUMAotuZNblWly8j+d1VQDhTggA/gHPBPq4zjor1
   otly2ZQQy3PoQMmK1el7ui8UcD5FbgFEQ7NfTWumX3rZd3CzcbvM0T+dH
   1+VyMmMDOcMW0gC2vPYkx8Wy1i+TH1lpf4bDNOElmM1cCa8az9EDEwXQl
   tP1OTbgwpOdi8PxboD6+AgWfcGNaDh4E05wgUMfHvrb+9QQLoIhEXcJJ0
   Q==;
X-CSE-ConnectionGUID: VvyySrwxSnSJ5B3y3rwNxw==
X-CSE-MsgGUID: 4U/rHrcVRFyvsmIIePTffQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44463567"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="44463567"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 08:34:25 -0700
X-CSE-ConnectionGUID: vrJ2Zgd0QcWp/GS0rpHEfg==
X-CSE-MsgGUID: Kbg6Qj1pTAyGzXRaSnZloA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78574117"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Oct 2024 08:34:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svetI-000QpZ-36;
	Tue, 01 Oct 2024 15:34:20 +0000
Date: Tue, 1 Oct 2024 23:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 974/1347]
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000:
 board-control@3,0: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202410012317.lzLIzoZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
commit: 89e6684538f59093d89eda50e30a6f2644b06ab6 [974/1347] dt-bindings: memory-controllers: fsl,ifc: split child node differences
config: arm-randconfig-054-20241001 (https://download.01.org/0day-ci/archive/20241001/202410012317.lzLIzoZW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410012317.lzLIzoZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410012317.lzLIzoZW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: aliases: 'enet0_rgmii_phy', 'enet0_sgmii_phy', 'enet1_rgmii_phy', 'enet1_sgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width', 'mdio-mux-emi1' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['simple-mfd'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'simple-mfd' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'simple-mfd' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'simple-mfd' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['simple-mfd'] is too short
   		'simple-mfd' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'simple-mfd' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'simple-mfd' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1: compatible: ['mdio-mux-mmioreg'] is too short
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
--
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: aliases: 'enet0_sgmii_phy', 'enet1_sgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: memory-controller@1530000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
