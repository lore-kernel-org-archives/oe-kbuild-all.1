Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B04687
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 01:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724203625; cv=none; b=MSXeJ32sXH0UmBWuO4kiAe0znexPfWcXPsh9ZoqxsS7DLaVgvnIRNgByliR+CZ8CSX/p54yVPWcyPIJ5hbEmEFCeb+2MAwhuvTtIQz/zHdPLwnEPy4F2lKInJjZuGp+fp+hD6i3zJTwtv0Qb5uJCihhtXxOxq/WH+AHLCIwy54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724203625; c=relaxed/simple;
	bh=WjK++xcf830OPu06IC54BcaD6uBdXu9Z4JKvrVmGxt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1EyKtuXDvW7lqV06DzRhntokD1SbLVD1XHbWFS1nrNrWgw3oBk+8UnvWUns7AQ0MdNrc67GuqaqPYj03fd1V7h6oCkPpTG2VlA8Zv1Iv6bI+/YB03sg11IewmYHMe0C6uVmjdeyXQSlA9JygY9Za/m46OJXTQlU1p/J2dsztAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYy0cFpy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYy0cFpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724203622; x=1755739622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjK++xcf830OPu06IC54BcaD6uBdXu9Z4JKvrVmGxt8=;
  b=bYy0cFpyWva7r2fwpISoJNFXw+XT4fDAtPkJB67/5ZE9M2s5MYR/xSND
   qBWGvR8eIOKbo+OPD08U1hNGMuCded6FwqnHlyCwudFy5EItT3jEsnCSP
   Ano7p5ENzdjCDbyPf09O6Y2CXNukZ4r+ctIliK69XheKIwmhPIE4obPBj
   9QZ1FmvNQFqRDuP0ykihoxJqPGI2v0JK+OwqDxZX3hPRhsL46ZqatPALb
   g9Vb+G4+xI3UHUEpq9rsE0eRDn7QjyewpBg1XM6kmgb46dfvPJLGjH9a4
   2EAZCJ+XcK8fplMlhakblT0/RBvmAFE0py2o6PRiJH+R7rnhky1SFa//l
   g==;
X-CSE-ConnectionGUID: WIdx1kgvSK+hNd1D+iNWSg==
X-CSE-MsgGUID: rPQSuGc1ST6oJPVE+vMX/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="47934365"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="47934365"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 18:27:01 -0700
X-CSE-ConnectionGUID: QHGvhCbERQG/P8yqVlN9Ag==
X-CSE-MsgGUID: EwzqzHa6TSyNj7GF40rBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="65125245"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 18:26:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sga7l-000Al8-27;
	Wed, 21 Aug 2024 01:26:57 +0000
Date: Wed, 21 Aug 2024 09:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 5286/5508]
 arch/powerpc/boot/dts/fsl/b4420qds.dtb: board-control@3,0: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408210951.KASgHZcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb1b0acdcd66e0d8eedee3570d249e076b89ab32
commit: daa2be74b1b2302004945b2a5e32424e177cc7da [5286/5508] dt-bindings: board: convert fsl-board.txt to yaml
config: powerpc-randconfig-051-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210951.KASgHZcz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210951.KASgHZcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210951.KASgHZcz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /: failed to match any schema with compatible: ['fsl,B4420QDS']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: aliases: 'phy_sgmii_10', 'phy_sgmii_11', 'phy_sgmii_1c', 'phy_sgmii_1d' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,b4420qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,b4420qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,b4420qds-fpga', 'fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: bman-fbpr: False schema does not allow {'size': 16777216, 'alignment': 16777216, 'compatible': ['fsl,bman-fbpr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 34, '$nodename': ['bman-fbpr']}
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /: failed to match any schema with compatible: ['fsl,B4860QDS']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: aliases: 'phy_sgmii_10', 'phy_sgmii_11', 'phy_sgmii_1c', 'phy_sgmii_1d', 'phy_sgmii_1e', 'phy_sgmii_1f', 'phy_xaui_slot1', 'phy_xaui_slot2' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,b4860qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,b4860qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,b4860qds-fpga', 'fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: bman-fbpr: False schema does not allow {'size': 16777216, 'alignment': 16777216, 'compatible': ['fsl,bman-fbpr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 56, '$nodename': ['bman-fbpr']}
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: localbus@ffe05000: nor@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: localbus@ffe05000: nand@4,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p2020ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p2020ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p2020ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p2020ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p2020ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000/board-control@3,0: failed to match any schema with compatible: ['fsl,p2020ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /localbus@ffe05000/nand@4,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: localbus@ffe124000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: localbus@ffe124000: nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: localbus@ffe124000: board-control@3,0:ranges: [[0, 3, 0, 48]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p3041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p3041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p3041ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p3041ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p3041ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p3041ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p3041ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p3041ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: mdio-mux-emi1: Unevaluated properties are not allowed ('rgmii-mdio@8', 'sgmii-mdio@28' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: mdio-mux-emi1: sgmii-mdio@28:reg:0:0: 40 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pcie@ffe200000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pcie@ffe200000: pcie@0:interrupts:0: [16, 2, 1, 15] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: sec_mon@314000: interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: localbus@ffe124000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: localbus@ffe124000: board-control@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p4080-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p4080-elbc', 'fsl,elbc', 'simple-bus']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p4080ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p4080ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p4080ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p4080ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p4080ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p4080ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: pcie@ffe200000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000: nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000: board-control@3,0:ranges: [[0, 3, 0, 48]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p5020ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p5020ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p5020ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p5020ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p5020ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p5020ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: mdio-mux-emi1: Unevaluated properties are not allowed ('rgmii-mdio@8', 'sgmii-mdio@28' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: mdio-mux-emi1: sgmii-mdio@28:reg:0:0: 40 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pcie@ffe200000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pcie@ffe200000: pcie@0:interrupts:0: [16, 2, 1, 15] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: localbus@ffe124000: nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: localbus@ffe124000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: localbus@ffe124000: board-control@3,0:ranges: [[0, 3, 0, 64]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5040-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5040-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p5040ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p5040ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: board-control@3,0: 'mdio-mux-emi1', 'mdio-mux-emi2' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,p5040ds-fpga', 'fsl,fpga-ngpixis']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: mdio-mux-emi1: Unevaluated properties are not allowed ('rgmii-mdio@8', 'sgmii-mdio@28', 'sgmii-mdio@38', 'sgmii-mdio@48', 'sgmii-mdio@68' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mdio-mux-mmioreg.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: mdio-mux-emi1: sgmii-mdio@28:reg:0:0: 40 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: mdio-mux-emi1: sgmii-mdio@68:reg:0:0: 104 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: mdio-mux-emi1: sgmii-mdio@38:reg:0:0: 56 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
--
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 15, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,tetra-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,tetra-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,tetra-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,tetra-fpga', 'fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio-mux-emi1: mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio-mux-emi1: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio-mux-emi1: mdio@a0:reg:0:0: 160 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio-mux-emi1: mdio@c0:reg:0:0: 192 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: mdio-mux-emi1: mdio@e0:reg:0:0: 224 is greater than the maximum of 31
--
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 42, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio-mux-emi1: mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio-mux-emi1: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio-mux-emi1: mdio@a0:reg:0:0: 160 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio-mux-emi1: mdio@c0:reg:0:0: 192 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: mdio-mux-emi1: mdio@e0:reg:0:0: 224 is greater than the maximum of 31
--
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 52, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1: mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1: mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1: mdio@c0:reg:0:0: 192 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: mdio-mux-emi1: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: dcsr@f00000000: $nodename:0: 'dcsr@f00000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-pfdr: False schema does not allow {'size': 33554432, 'alignment': 33554432, 'compatible': ['fsl,qman-pfdr'], 'alloc-ranges': [0, 0, 65536, 0], 'phandle': 53, '$nodename': ['qman-pfdr']}
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: qman-pfdr: Unevaluated properties are not allowed ('alignment', 'alloc-ranges', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1: mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1: mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1: mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: mdio-mux-emi1: mdio@a0:reg:0:0: 160 is greater than the maximum of 31
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /: failed to match any schema with compatible: ['fsl,T4240QDS']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: aliases: 'emi1_rgmii', 'emi1_slot1', 'emi1_slot2', 'emi1_slot3', 'emi1_slot4', 'phy_rgmii1', 'phy_rgmii2', 'phy_sgmii11', 'phy_sgmii12', 'phy_sgmii3', 'phy_sgmii4', 'phy_xfi1', 'phy_xfi2', 'phy_xfi3', 'phy_xfi4', 'sgmii_phy11', 'sgmii_phy12', 'sgmii_phy13', 'sgmii_phy14', 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy31', 'sgmii_phy32', 'sgmii_phy33', 'sgmii_phy34', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44', 'xfi_pcs_mdio1', 'xfi_pcs_mdio2', 'xfi_pcs_mdio3', 'xfi_pcs_mdio4' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000: $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0: 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,t4240qds-fpga', 'fsl,fpga-qixis']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1: mdio@20:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1: mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: mdio-mux-emi1: mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
