Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C811CF5EE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874687; cv=none; b=D7JRuHkS2QdgdIqEtZWOEp/HWrjFJLHX1b3gwunwjMb1infFZibRZsVW94+auitrqD/28MPIQV9pMmUA9hNOkGEgNBTcUhaTT5AiC8cLSR1AMx7yLgVm4fWKOati0pc8Jg6au8NfMDctFnXCHkciAqVOwaWMBPn12pIHj+yfh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874687; c=relaxed/simple;
	bh=2puSiVuGiLHydKo83Y0shyvseFb7CfeCL18glUFXAs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qGb9cT2O7G5ahfSFYXIkZc6phXZPuqWYsvLwHo4ybTzl2WiI/faOX3GMojWWPJp2Ka6a3lEhAEBM+hEChRcGOEFqErkFV748RovQoYC5JggsSclYtfX06wI3AytEgOKqKNqKjTryZYaldBBw+qh6E6CFlsN8m/NGKdMflfJiGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFYWbZLS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFYWbZLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727874682; x=1759410682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2puSiVuGiLHydKo83Y0shyvseFb7CfeCL18glUFXAs8=;
  b=BFYWbZLSJf41MVySf/1tZ8VGy+IU14x0OrRkpueGrz5CAM7E7PueIHGJ
   95lUwTYYs7vTbafQ9pPRP4yCFLLLsFN3/hlTWGJWTv6ZwGgv9gNHIwURD
   8OFvdaq4PPtqy/I5xJEcAPjnU1DOHYdvniVXsOsl9jgm0u9N9+l1l+FOt
   yazVotloGn8bo8YC0M7bSJRur18CxAJvNsiFA1U0PC2On3/6rHQFoZmzW
   vTA2HL70IWdmH/zFQv4HNDJ31vJGW3WnlgaJTTxdHrHe1lPyogeHmW8ft
   yAo1C0yEtsC+wViR3omgUjevCuUopw9Gz5Ki/ljasu+b7qFNTcuoVRDOX
   Q==;
X-CSE-ConnectionGUID: DyPaYllIQeG9Mr2a7C4OHw==
X-CSE-MsgGUID: EgIQJPU5T/Gqw/vjZfvogA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37704125"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="37704125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 06:11:21 -0700
X-CSE-ConnectionGUID: zdECoRg8RWKOJCwwfcUNTg==
X-CSE-MsgGUID: YAl0+bcFSgayQazrPj6TyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74805840"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2024 06:11:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svz8O-000S3b-0Z;
	Wed, 02 Oct 2024 13:11:16 +0000
Date: Wed, 2 Oct 2024 21:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 1287/2025]
 arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000:
 board-control@3,0: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202410022140.UGZXEner-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
commit: 89e6684538f59093d89eda50e30a6f2644b06ab6 [1287/2025] dt-bindings: memory-controllers: fsl,ifc: split child node differences
config: powerpc-randconfig-051-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022140.UGZXEner-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022140.UGZXEner-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022140.UGZXEner-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /: failed to match any schema with compatible: ['fsl,B4420QDS']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: aliases: 'phy_sgmii_10', 'phy_sgmii_11', 'phy_sgmii_1c', 'phy_sgmii_1d' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,b4420qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,b4420qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,b4420qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,b4420qds-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,b4420qds-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,b4420qds-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /: failed to match any schema with compatible: ['fsl,B4860QDS']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: aliases: 'phy_sgmii_10', 'phy_sgmii_11', 'phy_sgmii_1c', 'phy_sgmii_1d', 'phy_sgmii_1e', 'phy_sgmii_1f', 'phy_xaui_slot1', 'phy_xaui_slot2' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,b4860qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,b4860qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,b4860qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,b4860qds-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,b4860qds-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,b4860qds-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
--
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtsi:108.24-112.4: Warning (simple_bus_reg): /soc@ff700000/ethernet@b1000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi:121.23-123.5: Warning (simple_bus_reg): /soc@ff700000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /: failed to match any schema with compatible: ['fsl,bsc9132qds']
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: memory-controller@ff71e000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: soc@ff700000: gpio-controller@f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000: failed to match any schema with compatible: ['fsl,bsc9132-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/c293pcie.dts:219.24-222.4: Warning (simple_bus_reg): /soc@fffe00000/ethernet@b1000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /: failed to match any schema with compatible: ['fsl,C293PCIE']
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000: cpld@2,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000: cpld@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,c293pcie-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,c293pcie-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,c293pcie-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,c293pcie-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000: cpld@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,c293pcie-cpld'] is too short
   		'fsl,c293pcie-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,c293pcie-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,c293pcie-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000: cpld@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: memory-controller@fffe1e000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /memory-controller@fffe1e000/cpld@2,0: failed to match any schema with compatible: ['fsl,c293pcie-cpld']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 38, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 39, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000: board-control@2,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000: board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['keymile,qriox'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'keymile,qriox' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'keymile,qriox' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'keymile,qriox' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000: board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['keymile,qriox'] is too short
   		'keymile,qriox' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'keymile,qriox' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'keymile,qriox' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000: board-control@2,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000: 'chassis-mgmt@6,0', 'nor@0,0' do not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['keymile,qriox']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /localbus@ffe124000/chassis-mgmt@6,0: failed to match any schema with compatible: ['keymile,bfticu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@ffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000: cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: memory-controller@ffe1e000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /memory-controller@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@fffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000: cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: memory-controller@fffe1e000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /memory-controller@fffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@ffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB-PB']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000: cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: memory-controller@ffe1e000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /memory-controller@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb.dtsi:212.24-216.4: Warning (simple_bus_reg): /soc@fffe00000/ethernet@b2000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /: failed to match any schema with compatible: ['fsl,P1010RDB-PB']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,p1010rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,p1010rdb-cpld'] is too short
   		'fsl,p1010rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,p1010rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,p1010rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000: cpld@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: memory-controller@fffe1e000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /memory-controller@fffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1010-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 34, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 35, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000: failed to match any schema with compatible: ['fsl,dcsr', 'simple-bus']
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 14, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 15, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,tetra-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,tetra-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,tetra-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,tetra-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,tetra-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,tetra-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,tetra-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,tetra-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,tetra-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 34, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 35, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000: board-control@2,0: 'oneOf' conditional failed, one must be fixed:
   	'bank-width', 'device-width' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000: board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1024-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t1024-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t1024-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t1024-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t1024-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000: board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1024-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t1024-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t1024-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1024-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000: board-control@2,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t1024-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t1024-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 18, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 19, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld'] is too short
   		'fsl,t1040d4rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t1040d4rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1040d4rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000: cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000: cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000: cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 43, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t1040d4rdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t1040d4rdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t1040d4rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1040d4rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000: cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 41, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000: cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 39, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 40, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000: cpld@3,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too short
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t104xrdb-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
   		'fsl,fpga-qixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000: cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld'] is too long
   		'fsl,t104xrdb-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t104xrdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t104xrdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,deepsleep-cpld' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000: cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 51, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 52, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 49, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 50, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000: board-control@2,0: 'oneOf' conditional failed, one must be fixed:
>> 	arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000: board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t2080-cpld'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t2080-cpld' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t2080-cpld' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t2080-cpld' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000: board-control@2,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t2080-cpld'] is too short
   		'fsl,t2080-cpld' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t2080-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t2080-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000: board-control@2,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t2080-cpld']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000: dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000: dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 52, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 53, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,p1022ds-fpga' was expected
   		'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
>> 	arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,fpga-qixis'] is too short
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: failed to match any schema with compatible: ['fsl,T4240QDS']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: aliases: 'emi1_rgmii', 'emi1_slot1', 'emi1_slot2', 'emi1_slot3', 'emi1_slot4', 'phy_rgmii1', 'phy_rgmii2', 'phy_sgmii11', 'phy_sgmii12', 'phy_sgmii3', 'phy_sgmii4', 'phy_xfi1', 'phy_xfi2', 'phy_xfi3', 'phy_xfi4', 'sgmii_phy11', 'sgmii_phy12', 'sgmii_phy13', 'sgmii_phy14', 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy31', 'sgmii_phy32', 'sgmii_phy33', 'sgmii_phy34', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44', 'xfi_pcs_mdio1', 'xfi_pcs_mdio2', 'xfi_pcs_mdio3', 'xfi_pcs_mdio4' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: nand@2,0: 'partition@C00000' does not match any of the regexes: '^partition@[0-9a-f]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: board-control@3,0: 'oneOf' conditional failed, one must be fixed:
   	'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
>> 	arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   		['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,p1022ds-fpga' was expected
   		'fsl,t4240qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   		'fsl,t4240qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   		'fsl,t4240qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   		'fsl,fpga-ngpixis' was expected
>> 	arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   		'fsl,t4240qds-fpga' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,t4240qds-fpga' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t4240qds-fpga' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash']
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /: memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /: failed to match any schema with compatible: ['fsl,T4240RDB']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: aliases: 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000: 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: bman-fbpr: False schema does not allow {'size': 16777216, 'alignment': 16777216, 'compatible': ['fsl,bman-fbpr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 99, '$nodename': ['bman-fbpr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: bman-fbpr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: qman-fqd: False schema does not allow {'size': 4194304, 'alignment': 4194304, 'compatible': ['fsl,qman-fqd'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 96, '$nodename': ['qman-fqd']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: qman-fqd: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
