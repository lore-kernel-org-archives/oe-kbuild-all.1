Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44083321BF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Apr 2026 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493156; cv=none; b=jjLpj1C3RAd35whFuxKtt0yYqq/gj1iPv6XNeil/NGs7o0L4ehOEJX2hNotlkV4XW6vmUoL1Iz6aJ6qVAsLynwq0DBX4vMuOWxVvXuP/n3vXsBDiqFLQfZsRO6xxHWq7gyAYjRiW20wl2ezX8qV41t1dM+NE8rIeBnDDU7RsMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493156; c=relaxed/simple;
	bh=fBbbjlRo1qOrEmkvgeyH8f7I5yYsoS0VH7Wfj73mxaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FMbpZ36IkO9CmdO1xp+nBM5xykwYsRuR8yLAhY4c/nkCM7j/DaqJElu/8jEVEyNYtpJ4L2LlDRFWzT9VqO6XCaT2E9TziyXR381k0jv37PZFZ7kN1vDRV7L/3KoOJ7AzJvMxyaR+x+szu6+2RUrr3tUUgd0Vmyl7CdzPw8sqsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0lK0gBw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0lK0gBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775493149; x=1807029149;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fBbbjlRo1qOrEmkvgeyH8f7I5yYsoS0VH7Wfj73mxaQ=;
  b=j0lK0gBw+SLce0RqZYqEdS1HuWfsbkRCjsu7AZ3MlBVsMeUpQOXRpSrS
   WF2nW9plUbolb9JMosOhtVzKHryiNRzHP3IK+BUB2iUr9ZzXxk7gOA79S
   nc7g/lL9C4lbFRRyrZ/S5I4My2uGTkaK4TOxR/f/WLOLvOvjK2Fv5a+IM
   rpxCE+FMCAaZ3pzMek4/B7chJalV4QMUb3rZRh+c5cH83HLy7M/9unHeS
   tGWeMkDnrBAcS+oNNJneUM2CfRFENLdiGtrZ3obAk0iqVCbAy9v6YbK6Z
   2KLf2ZV6bUK9dbWzeFo3tUmfdOBc1vR3y/eI0cSJjwozoausKab/8G8Sy
   w==;
X-CSE-ConnectionGUID: Mt8rOJw6Q5yh6X6bjXctwA==
X-CSE-MsgGUID: uJTayOLYTA6zGdRhPzF5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87148202"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="87148202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 09:32:28 -0700
X-CSE-ConnectionGUID: 03icPiL3QjiWmaIczCRAsw==
X-CSE-MsgGUID: CccV1Rn4RIm8mtWPiwOvHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="227090306"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 09:32:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9ms9-00000000A4P-1qmk;
	Mon, 06 Apr 2026 16:32:21 +0000
Date: Mon, 06 Apr 2026 18:31:29 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 61/101]
 =?us-ascii?Q?arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd?=
 =?us-ascii?Q?-nand-1pci2lane.dtb:?= / (bananapi,bpi-r4-lite): memory:
 'device_type' is a required property
Message-ID: <202604061840.DZiX5i7r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   ab92b9462fdd3ef70e7c44ab428e9546ab60bc03
commit: 5e37e73121f10e878507f1e6a2b12f26e81719d6 [61/101] arm64: dts: media=
tek: apply mt7987 pcie overlays on buildtime
config: arm64-randconfig-2052-20260403 (https://download.01.org/0day-ci/arc=
hive/20260406/202604061840.DZiX5i7r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260406/202604061840.DZiX5i7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604061840.DZiX5i7r-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-l=
ite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-l=
ite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed=
, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one m=
ust be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: / (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0,=
 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: opp_table0 (operating-points-v2): $nodename:0: 'opp_table0' does n=
ot match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: opp_table0 (operating-points-v2): Unevaluated properties are not a=
llowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: l2-cache (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: clkitg (simple-bus): $nodename:0: 'clkitg' does not match '^([a-z]=
[a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc_clksys (simple-bus): $nodename:0: 'soc_clksys' does not match =
'^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/infracfg@10001000: failed to match any schema with com=
patible: ['mediatek,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/topckgen@1001b000: failed to match any schema with com=
patible: ['mediatek,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/apmixedsys@1001e000: failed to match any schema with c=
ompatible: ['mediatek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@10060000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', =
'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@10060000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', =
'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@10060000/pcs: failed to match any schema with c=
ompatible: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@10070000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', =
'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@10070000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', =
'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@10070000/pcs: failed to match any schema with c=
ompatible: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/mcusys@10400000: failed to match any schema with compa=
tible: ['mediatek,mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@15000000: failed to match any schema with compa=
tible: ['mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@15000000: failed to match any schema with compa=
tible: ['mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_clksys/syscon@15000000/reset-controller: failed to match any =
schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of t=
he regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any sche=
ma with compatible: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one m=
ust be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['=
mediatek,hwver', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with comp=
atible: ['mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible:=
 ['mediatek,mt7987-pinctrl']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible=
: ['mediatek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/trng@1020f000: failed to match any schema with compatible: ['=
mediatek,mt7987-rng']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['m=
ediatek,mt7987-pwm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match=
 '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed (=
'#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('=
address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'media=
tek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'media=
tek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'm=
ediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-s=
ingle', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'media=
tek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt=
6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-s=
pi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
--
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'med=
iatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', =
'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi=
-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'med=
iatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,=
mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135=
-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a r=
equired property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a requ=
ired property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['m=
ediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'media=
tek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'media=
tek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'm=
ediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-s=
ingle', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'media=
tek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt=
6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-s=
pi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/spi@11009800: failed to match any schema with compatible: ['m=
ediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_v=
alid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-na=
mes:1: 'rx_imp' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-na=
mes: ['intr', 'auto_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: =
[[29], [30]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_v=
alid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-na=
mes: ['intr', 'rx_imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: =
[[31], [32], [33], [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000=
' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): compatible: 'oneOf' conditiona=
l failed, one must be fixed:
   	['mediatek,mt7987', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7987' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt76=
23-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt68=
93-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7981-tphy', 'mediatek,mt7986-=
tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tph=
y', 'mediatek,mt8365-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt81=
95-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/usb-phy@11c50000: failed to match any schema with compatible:=
 ['mediatek,mt7987', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt798=
7-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'med=
iatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediat=
ek,mt7986-xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,=
mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8=
189-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365=
-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['m=
ediatek,mt7987-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'b=
us_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '2=
6m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l=
_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'a=
ud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'e=
g2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names: ['au=
d_bus_ck', 'aud_26m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel',=
 'aud_i2s_m'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13]=
, [22, 14], [22, 15], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'b=
us_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '2=
6m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l=
_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'a=
ud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'e=
g2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:5: 's=
el' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i=
2s_m' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): compatible: 'oneO=
f' conditional failed, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/audio-controller@11210000: failed to match any schema with co=
mpatible: ['mediatek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was=
 expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_c=
lk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [2=
2, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,w=
ed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['=
mediatek,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['=
mediatek,wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['=
mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['=
mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/topmisc@10021000: failed to match any schema with compatible:=
 ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/topmisc@10021000: failed to match any schema with compatible:=
 ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: efuse@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional f=
ailed, one must be fixed:
   	['mediatek,efuse'] is too short
   	'mediatek,efuse' is not one of ['mediatek,mt8188-efuse', 'mediatek,mt81=
89-efuse', 'mediatek,mt8196-efuse']
   	'mediatek,mt8186-efuse' was expected
   	'mediatek,efuse' is not one of ['mediatek,mt8186-efuse', 'mediatek,mt81=
88-efuse']
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt76=
23-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt79=
88-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt81=
89-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt85=
16-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc/devapc@1a110000: failed to match any schema with compatible: =
['mediatek,mt7987-devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: soc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match =
'^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,=
mt7988-ethwarp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_netsys/ethernet@15100000: failed to match any schema with com=
patible: ['mediatek,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_netsys/hnat@15000000: failed to match any schema with compati=
ble: ['mediatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names:=
 ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0,=
 214, 4], [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'one=
Of' conditional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /soc_netsys/crypto@15600000: failed to match any schema with compa=
tible: ['inside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: mikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /mikro-bus/gpio-export@0: failed to match any schema with compatib=
le: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-3: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-4: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-5: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-6: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: /mikro-bus/gpio-export@1: failed to match any schema with compatib=
le: ['gpio-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-1pci2l=
ane.dtb: gpio-46: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^a=
rtesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspe=
ed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,=
.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic=
,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '=
^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagl=
e,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain=
,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '=
^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino=
,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*=
', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*=
', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*=
', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charg=
ebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', =
'^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*=
', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwo=
rk,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,=
.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi=
,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.=
*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', =
'^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', =
'^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^dav=
icom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^=
denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*=
', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^=
djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^d=
ongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dser=
ve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.=
*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', =
'^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*=
', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^el=
pida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmi=
cro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*=
', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*'=
, '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*=
', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '=
^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ez=
urio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', =
'^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^f=
ii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^=
forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '=
^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gal=
axycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*'=
, '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*'=
, '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*=
', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt=
,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^gora=
mo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^ha=
nnstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^=
headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*'=
, '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^=
hitron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^ho=
perf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawe=
i,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '=
^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.=
*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*',=
 '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incos=
tartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*'=
, '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,=
.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inte=
rcontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*=
', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead=
,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^j=
di,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.=
*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*',=
 '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kineti=
c,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobo=
l,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^laci=
e,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*',=
 '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^leno=
vo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linar=
o,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspr=
ite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontr=
on,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno=
,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^=
lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m=
5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', =
'^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', =
'^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediate=
k,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.=
*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.=
*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*=
', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mic=
rotips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '=
^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*=
', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*'=
, '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^not=
hing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^num=
onyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*=
', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*=
', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,=
.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^=
openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*',=
 '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*=
', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*'=
, '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', =
'^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*'=
, '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixc=
ir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', =
'^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*'=
, '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '=
^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^p=
rt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*',=
 '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qn=
ap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron=
,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rd=
a,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rerv=
ision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ri=
chtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchi=
p,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*=
', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*',=
 '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^sch=
indler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,=
.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^sensea=
ir,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.=
*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^=
shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*'=
, '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^si=
l,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insi=
ght,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*'=
, '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*'=
, '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', =
'^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip=
,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.=
*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spar=
kfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', =
'^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^s=
tartek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', =
'^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', =
'^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '=
^synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*',=
 '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displ=
ay,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*'=
, '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*=
', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,=
.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*',=
 '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,=
.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', =
'^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronf=
y,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*',=
 '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucroboti=
cs,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratr=
onik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', =
'^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '=
^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vico=
r,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visi=
onox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac=
,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^w=
anchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltec=
h,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', =
'^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*=
', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '=
^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*'=
, '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*=
', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^ya=
dro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', =
'^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuriden=
ki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.=
*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
--
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-l=
ite', 'mediatek,mt7987a']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-l=
ite', 'mediatek,mt7987a']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: / (bananapi,bpi-r4-lite): memory: 'device_type' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: / (bananapi,bpi-r4-lite): oscillator@0: 'anyOf' conditional failed=
, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: / (bananapi,bpi-r4-lite): sfp@0: 'anyOf' conditional failed, one m=
ust be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: / (bananapi,bpi-r4-lite): False schema does not allow {'reg': [[0,=
 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: opp_table0 (operating-points-v2): $nodename:0: 'opp_table0' does n=
ot match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: opp_table0 (operating-points-v2): Unevaluated properties are not a=
llowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: l2-cache (cache): 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: clkitg (simple-bus): $nodename:0: 'clkitg' does not match '^([a-z]=
[a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: soc_clksys (simple-bus): $nodename:0: 'soc_clksys' does not match =
'^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/infracfg@10001000: failed to match any schema with com=
patible: ['mediatek,mt7987-infracfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/topckgen@1001b000: failed to match any schema with com=
patible: ['mediatek,mt7987-topckgen', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/apmixedsys@1001e000: failed to match any schema with c=
ompatible: ['mediatek,mt7987-apmixedsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@10060000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', =
'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@10060000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', =
'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@10060000/pcs: failed to match any schema with c=
ompatible: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@10070000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', =
'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@10070000: failed to match any schema with compa=
tible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', =
'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@10070000/pcs: failed to match any schema with c=
ompatible: ['mediatek,mt7987-sgmii']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/mcusys@10400000: failed to match any schema with compa=
tible: ['mediatek,mt7987-mcusys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@15000000: failed to match any schema with compa=
tible: ['mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@15000000: failed to match any schema with compa=
tible: ['mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_clksys/syscon@15000000/reset-controller: failed to match any =
schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of t=
he regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any sche=
ma with compatible: ['mediatek,wmcpu-reserved']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one m=
ust be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['=
mediatek,hwver', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with comp=
atible: ['mediatek,infracfg_ao_bus_hang_prot']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible:=
 ['mediatek,mt7987-pinctrl']
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/boottrap@1001f6f0: failed to match any schema with compatible=
: ['mediatek,boottrap']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/trng@1020f000: failed to match any schema with compatible: ['=
mediatek,mt7987-rng']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/pwm@10048000: failed to match any schema with compatible: ['m=
ediatek,mt7987-pwm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pca9545@70 (nxp,pca9545): $nodename:0: 'pca9545@70' does not match=
 '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pca9545@70 (nxp,pca9545): Unevaluated properties are not allowed (=
'#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: eeprom@50 (atmel,24c02): Unevaluated properties are not allowed ('=
address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: spi@11007800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'media=
tek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'media=
tek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'm=
ediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-s=
ingle', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'media=
tek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt=
6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-s=
pi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
--
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt6779-spi', 'med=
iatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt7981-spi-ipm', =
'mediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi=
-single', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-single' is not one of ['mediatek,mt2701-spi', 'med=
iatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,=
mt6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135=
-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#address-cells' is a r=
equired property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: spi@11008800 (mediatek,mt7987-spi-single): '#size-cells' is a requ=
ired property
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/spi@11008800: failed to match any schema with compatible: ['m=
ediatek,mt7987-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: spi@11009800 (mediatek,mt7987-spi-quad): compatible: 'oneOf' condi=
tional failed, one must be fixed:
   	['mediatek,mt7987-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7629-spi', 'media=
tek,mt8365-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt6779-spi', 'media=
tek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'm=
ediatek,mt7986-spi-ipm', 'mediatek,mt7988-spi-quad', 'mediatek,mt7988-spi-s=
ingle', 'mediatek,mt8188-spi-ipm']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt8196-spi']
   	'mediatek,mt7987-spi-quad' is not one of ['mediatek,mt2701-spi', 'media=
tek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt=
6893-spi', 'mediatek,mt6991-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-s=
pi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	'mediatek,mt6991-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.=
yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/spi@11009800: failed to match any schema with compatible: ['m=
ediatek,mt7987-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000: 'auto_load_v=
alid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-na=
mes:1: 'rx_imp' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cell-na=
mes: ['intr', 'auto_load_valid'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50000:nvmem-cells: =
[[29], [30]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700: 'auto_load_v=
alid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cell-na=
mes: ['intr', 'rx_imp', 'tx_imp', 'auto_load_valid'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): usb-phy@11c50700:nvmem-cells: =
[[31], [32], [33], [34]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): $nodename:0: 'usb-phy@11c50000=
' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb-phy@11c50000 (mediatek,mt7987): compatible: 'oneOf' conditiona=
l failed, one must be fixed:
   	['mediatek,mt7987', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7987' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt76=
23-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt68=
93-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7981-tphy', 'mediatek,mt7986-=
tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tph=
y', 'mediatek,mt8365-tphy']
   	'mediatek,mt7987' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt81=
95-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/usb-phy@11c50000: failed to match any schema with compatible:=
 ['mediatek,mt7987', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:1: 'ref_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:2: 'mcu_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:3: 'dma_ck' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): clock-names:4: 'xhci_ck' was =
expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: usb@11200000 (mediatek,mt7987-xhci): compatible:0: 'mediatek,mt798=
7-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'med=
iatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediat=
ek,mt7986-xhci', 'mediatek,mt7988-xhci', 'mediatek,mt8173-xhci', 'mediatek,=
mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8=
189-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365=
-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.ya=
ml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/usb@11200000: failed to match any schema with compatible: ['m=
ediatek,mt7987-xhci', 'mediatek,mtk-xhci']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'b=
us_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '2=
6m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l=
_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'a=
ud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'e=
g2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names: ['au=
d_bus_ck', 'aud_26m_ck', 'aud_l_ck', 'aud_aud_ck', 'aud_eg2_ck', 'aud_sel',=
 'aud_i2s_m'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clocks: [[22, 13]=
, [22, 14], [22, 15], [22, 16], [22, 17], [4, 50], [4, 77]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:0: 'b=
us_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:1: '2=
6m_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:2: 'l=
_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:3: 'a=
ud_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:4: 'e=
g2_ck' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:5: 's=
el' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): clock-names:6: 'i=
2s_m' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: audio-controller@11210000 (mediatek,mt7987-afe): compatible: 'oneO=
f' conditional failed, one must be fixed:
   	['mediatek,mt7987-afe', 'mediatek,mt7986-afe'] is too long
   	'mediatek,mt7986-afe' was expected
   	'mediatek,mt7987-afe' is not one of ['mediatek,mt7981-afe', 'mediatek,m=
t7988-afe']
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt7986-af=
e.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/audio-controller@11210000: failed to match any schema with co=
mpatible: ['mediatek,mt7987-afe', 'mediatek,mt7986-afe']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:1: 'hclk' was expe=
cted
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:2: 'source_cg' was=
 expected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:3: 'bus_clk' was e=
xpected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names:4: 'sys_cg' was ex=
pected
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clock-names: ['source', 'bus_c=
lk', 'axi_cg', 'hclk', 'source_cg', 'ahb_cg'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mmc@11230000 (mediatek,mt7986-mmc): clocks: [[4, 76], [22, 45], [2=
2, 47], [22, 46], [22, 21], [22, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/wed: failed to match any schema with compatible: ['mediatek,w=
ed']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/wed0@15010000: failed to match any schema with compatible: ['=
mediatek,wed0']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/wdma@15104800: failed to match any schema with compatible: ['=
mediatek,wed-wdma']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@11280000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['=
mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@11290000 (mediatek,mt7987-pcie): compatible: 'oneOf' conditio=
nal failed, one must be fixed:
   	['mediatek,mt7987-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt7981-pcie', 'mediatek=
,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt7987-pcie' is not one of ['mediatek,mt6991-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'mediatek,mt8196-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.y=
aml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['=
mediatek,mt7987-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@0,0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@0,0: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: pcie@0,0: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/topmisc@10021000: failed to match any schema with compatible:=
 ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/topmisc@10021000: failed to match any schema with compatible:=
 ['mediatek,mt7987-topmisc', 'syscon', 'mediatek,mt7987-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: efuse@11d30000 (mediatek,efuse): compatible: 'oneOf' conditional f=
ailed, one must be fixed:
   	['mediatek,efuse'] is too short
   	'mediatek,efuse' is not one of ['mediatek,mt8188-efuse', 'mediatek,mt81=
89-efuse', 'mediatek,mt8196-efuse']
   	'mediatek,mt8186-efuse' was expected
   	'mediatek,efuse' is not one of ['mediatek,mt8186-efuse', 'mediatek,mt81=
88-efuse']
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt76=
23-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt79=
88-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt81=
89-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt85=
16-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc/devapc@1a110000: failed to match any schema with compatible: =
['mediatek,mt7987-devapc']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: soc_netsys (simple-bus): $nodename:0: 'soc_netsys' does not match =
'^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): compatible: ['mediatek,=
mt7988-ethwarp', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: syscon@15031000 (mediatek,mt7988-ethwarp): '#reset-cells' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7988-et=
hwarp.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_netsys/ethernet@15100000: failed to match any schema with com=
patible: ['mediatek,mt7987-eth']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_netsys/hnat@15000000: failed to match any schema with compati=
ble: ['mediatek,mtk-hnat_v5']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'eth' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): 'clock-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupt-names:=
 ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): interrupts: [[0,=
 214, 4], [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: crypto@15600000 (inside-secure,safexcel-eip197b): compatible: 'one=
Of' conditional failed, one must be fixed:
   	['inside-secure,safexcel-eip197b', 'security-ip-197-srv'] is too long
   	'marvell,armada-cp110-crypto' was expected
   	'inside-secure,safexcel-eip197b' is not one of ['marvell,armada-3700-cr=
ypto', 'mediatek,mt7986-crypto']
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	'inside-secure,safexcel-eip197b' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,saf=
excel.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /soc_netsys/crypto@15600000: failed to match any schema with compa=
tible: ['inside-secure,safexcel-eip197b', 'security-ip-197-srv']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mikro-bus (simple-bus): #address-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: mikro-bus (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /mikro-bus/gpio-export@0: failed to match any schema with compatib=
le: ['gpio-export']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-3: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-4: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-5: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-6: 'gpio-export,name', 'gpio-export,output' do not match any =
of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fa=
n|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max=
8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^=
(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audi=
o-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8de=
v,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-se=
mi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*'=
, '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisle=
r,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^a=
lfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^allie=
dtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale=
,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amc=
c,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol=
,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*=
', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^=
apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom=
,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,.=
*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^ar=
tesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^=
azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle=
,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,=
.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^=
boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino,=
.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*'=
, '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*'=
, '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*'=
, '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charge=
byte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '=
^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*'=
, '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwor=
k,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.=
*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*=
', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '=
^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '=
^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davi=
com,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*'=
, '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^d=
jn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^do=
ngwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserv=
e,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*=
', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '=
^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*'=
, '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elp=
ida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmic=
ro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*'=
, '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*',=
 '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*'=
, '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^=
evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ezu=
rio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '=
^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fi=
i,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^f=
orlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^=
frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gala=
xycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*',=
 '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*',=
 '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*'=
, '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,=
.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goram=
o,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^h=
eadacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*',=
 '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^h=
itron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hop=
erf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei=
,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', =
'^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incost=
artec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*',=
 '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.=
*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inter=
control,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*'=
, '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,=
.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jd=
i,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*=
', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*', =
'^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic=
,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol=
,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie=
,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', =
'^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenov=
o,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro=
,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontro=
n,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,=
.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^l=
si,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5=
stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '=
^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '=
^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek=
,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*=
', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*=
', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*'=
, '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^micr=
otips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^min=
iand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mits=
umi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix=
,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^m=
oxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi=
,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata=
,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^=
nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^=
netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*'=
, '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*',=
 '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^noth=
ing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^numo=
nyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*'=
, '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*'=
, '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.=
*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^o=
penpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', =
'^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*'=
, '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*',=
 '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', '=
^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*',=
 '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*',=
 '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^=
powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^pr=
t,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', =
'^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qna=
p,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,=
.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rda=
,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervi=
sion,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ric=
htek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip=
,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*'=
, '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', =
'^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schi=
ndler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.=
*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseai=
r,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*=
', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^s=
hineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*=
', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^=
synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', =
'^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displa=
y,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*',=
 '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*'=
, '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', =
'^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.=
*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '=
^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy=
,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', =
'^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotic=
s,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratro=
nik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '=
^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wa=
nchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech=
,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '=
^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*'=
, '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^=
wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*',=
 '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*'=
, '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '=
^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenk=
i,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*=
', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: /mikro-bus/gpio-export@1: failed to match any schema with compatib=
le: ['gpio-export']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite-sd-nand-2pci1l=
ane.dtb: gpio-46: 'gpio-export,name', 'gpio-export,output' do not match any=
 of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-f=
an|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|ma=
x8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '=
^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-aud=
io-card|st-plgpio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8d=
ev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-s=
emi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*=
', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisl=
er,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^=
alfa-network,.*', '^algoltek,.*', '^allegro,.*', '^allegromicro,.*', '^alli=
edtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascal=
e,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^am=
cc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^ampheno=
l,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.=
*', '^andestech,.*', '^anlogic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^arduino,.*', '^argon40,.*', '^ariaboard,=
.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^a=
rtesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^asl-tek,.*', '^aspe=
ed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,=
.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic=
,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '=
^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagl=
e,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain=
,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '=
^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bst,.*', '^bticino=
,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*=
', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*=
', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*=
', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^charg=
ebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', =
'^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*=
', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwo=
rk,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,=
.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi=
,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.=
*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', =
'^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', =
'^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^dav=
icom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^=
denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*=
', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^=
djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^d=
ongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dser=
ve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.=
*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', =
'^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*=
', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^el=
pida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmi=
cro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*=
', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*'=
, '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*=
', '^eswin,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '=
^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^ez=
urio,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', =
'^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^f=
ii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*', '^focaltech,.*', '^=
forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '=
^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^gal=
axycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*'=
, '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*'=
, '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*=
', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt=
,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^gora=
mo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^ha=
nnstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^=
headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hinlink,.*'=
, '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^=
hitron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^ho=
perf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawe=
i,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '=
^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.=
*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*',=
 '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incos=
tartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*'=
, '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,=
.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^inte=
rcontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*=
', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead=
,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^j=
di,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.=
*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam,.*', '^karo,.*',=
 '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kineti=
c,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobo=
l,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^laci=
e,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*',=
 '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^leno=
vo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linar=
o,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkease,.*', '^linkspr=
ite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontr=
on,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno=
,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^=
lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m=
5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', =
'^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', =
'^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediate=
k,.*', '^medion,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.=
*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.=
*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*=
', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mic=
rotips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '=
^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*=
', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*'=
, '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^not=
hing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei,.*', '^num=
onyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*=
', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*=
', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,=
.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^=
openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*',=
 '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*=
', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*'=
, '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegatron,.*', =
'^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*'=
, '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixc=
ir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', =
'^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*'=
, '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '=
^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^p=
rt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*',=
 '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qn=
ap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron=
,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^raystar,.*', '^rd=
a,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rerv=
ision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^rfdigital,.*', '^ri=
chtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchi=
p,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*=
', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*',=
 '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^sch=
indler,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,=
.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^sensea=
ir,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.=
*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^=
shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*'=
, '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^si=
l,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insi=
ght,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*'=
, '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*'=
, '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', =
'^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip=
,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.=
*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^spar=
kfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', =
'^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^s=
tartek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', =
'^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', =
'^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '=
^synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*',=
 '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displ=
ay,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*'=
, '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*=
', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,=
.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*',=
 '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,=
.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', =
'^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronf=
y,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*',=
 '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucroboti=
cs,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratr=
onik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', =
'^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '=
^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vico=
r,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visi=
onox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac=
,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^w=
anchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltec=
h,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', =
'^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*=
', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '=
^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*'=
, '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*=
', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^ya=
dro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', =
'^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuriden=
ki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.=
*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
